class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    respond_to do |format|
    if  @song.save
     format.html { redirect_to songs_path, notice: 'Song was successfully created.' }
    else
      format.html { render :new }
    end
  end
end

    private
    def song_params
      params.require(:song).permit(:name, :mp3)
    end
end
