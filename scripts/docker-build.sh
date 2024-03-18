echo "============ BUILDING SkyNet Docker Image ============="
echo $PWD
# docker buildx build . --no-cache --progress plain --platform linux/arm64/v8,linux/amd64 -t mahesha999/opencv-realsense:0.4 &> docker-build.log
# docker buildx build . --no-cache --progress plain --platform linux/arm64/v8 -t mahesha999/opencv-realsense:0.4 &> docker-build.log
echo "Platform: $1"
echo "Image: $2"
echo "Image File Path: $3"

#docker buildx build $3 --progress plain --platform $1 -t $2 --push &> docker-build.log
if [[ -n "$4" ]]
then
	docker build -t $2 $3 --network=host --add-host "raw.githubusercontent.com:151.101.84.133" --build-arg $4
else
	docker build -t $2 $3 --network=host --add-host "raw.githubusercontent.com:151.101.84.133"
fi
