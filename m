Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46617C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 09:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZQDvKe6Ql5Kk2BqM3lNL1aKyVQX+Ek92D8dTA+aKic=; b=TCW9CyJ8/K382e7WujYW24hhgd
	piAjUJWXAbKyNUFUmWCHyCNMweOwmMpEa9Czrt8GR59gQlw+ZZk9+VVC3fIRWmbt/Zk2Slmgv2m1r
	lFPgnSTWUdsAJREBnf+e1LnEOCZLFTPpdX4K5TEiPsBk/mkvKn8pHZwsvjxYB0ITGha47tS1Vr+R9
	h0VMi95VnteA6KJTUWhny4PYnXIuI2pqeyUJ031WKtXYZ93SwKfpBtww/UNXcu5MJWbfLA8I0T2ZA
	EAz0/8cvwVwsyhANqJr9oRV0SLcwcnCbY5G4VoyQ2as3jZzzZIvezPkRmMpgslODqwUqkwo/szBEP
	XFlTkYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDl0-0000000CK6c-2xdO;
	Tue, 05 Aug 2025 09:14:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujDP9-0000000CGBk-0MT6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 08:52:20 +0000
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41FD6176B;
	Tue,  5 Aug 2025 10:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754383889;
	bh=jBxhLUdFTaqZZdIWF8N1Cc/AQ1a84Xk9kCF/RInLbes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ck8t3Gqh5H3GnDK2qlFIdqsQNxFcjlqWuKrC4I9CxDJmqH/JPh2IvOiZFkO6Pk5sc
	 6mj4Enubalxy8D1j7WaVCtYGxh5qJM721A9AfC77YtA478XjqzHxgzhVUAow/EUCFN
	 WuXvVJXTj4VXFSu2I2eNWDrL3hMuyima2HHSp1ug=
Date: Tue, 5 Aug 2025 10:52:13 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, 
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v11 02/19] media: v4l2-dev: Add helpers to run
 media_pipeline_[started|stopped]()
Message-ID: <ppgp4bctmfgyd6ghizfxyiwp53isx5cbqvwx7rvormsexdb45k@7j7vdbpzx564>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-2-bc20e460e42a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714-c55-v11-2-bc20e460e42a@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_015219_269522_CBA49CE3 
X-CRM114-Status: GOOD (  36.61  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Dan

On Mon, Jul 14, 2025 at 04:06:28PM +0100, Daniel Scally wrote:
> Add helpers to run the new media_pipeline_started() and
> media_pipeline_stopped() functions. The helpers iterate over the
> entities in the pipeline and count the number of video devices and
> compare that to the pipeline's start_count() before acting. This
> allows us to only run the media pipeline callbacks in the event that
> the pipeline has had video_pipeline_start() called for each video
> device.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>
> ---
> Changes in v3:
> 	- Revised the documentation a bit, detailing the specific error
> 	  codes and rewording the descriptions
> 	- Renamed __video_device_pipeline_started()
> 	- List the possible return values explicitly
>
> Changes in v2:
>
> 	- Adapted now media_pipeline_for_each_entity() takes an iter
> 	  variable
> 	- Fixed the Return: section of the kerneldoc comments
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 57 ++++++++++++++++++++++++++++++++++++++
>  include/media/v4l2-dev.h           | 52 ++++++++++++++++++++++++++++++++++
>  2 files changed, 109 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index c369235113d98ae26c30a1aa386e7d60d541a66e..a25038f3c9cc9213b840e2b96d1ef49d17d22fb8 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -1200,6 +1200,63 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
>  }
>  EXPORT_SYMBOL_GPL(video_device_pipeline);
>
> +static int video_device_pipeline_unstarted_vdevs(struct media_pipeline *pipe)
> +{
> +	struct media_pipeline_entity_iter iter;
> +	unsigned int n_video_devices = 0;
> +	struct media_entity *entity;
> +	int ret;
> +
> +	ret = media_pipeline_entity_iter_init(pipe, &iter);
> +	if (ret)
> +		return ret;
> +
> +	media_pipeline_for_each_entity(pipe, &iter, entity) {
> +		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
> +			n_video_devices++;
> +	}
> +
> +	media_pipeline_entity_iter_cleanup(&iter);
> +
> +	return n_video_devices - pipe->start_count;
> +}
> +
> +int video_device_pipeline_started(struct video_device *vdev)
> +{
> +	struct media_pipeline *pipe;
> +	int ret;
> +
> +	pipe = video_device_pipeline(vdev);
> +	if (!pipe)
> +		return -ENODEV;
> +
> +	ret = video_device_pipeline_unstarted_vdevs(pipe);
> +	if (ret)
> +		return ret;
> +
> +	return media_pipeline_started(pipe);
> +}
> +EXPORT_SYMBOL_GPL(video_device_pipeline_started);
> +
> +int video_device_pipeline_stopped(struct video_device *vdev)
> +{
> +	struct media_pipeline *pipe;
> +	int ret;
> +
> +	pipe = video_device_pipeline(vdev);
> +	if (!pipe)
> +		return -ENODEV;
> +
> +	ret = video_device_pipeline_unstarted_vdevs(pipe);
> +	if (ret)
> +		return ret;
> +
> +	media_pipeline_stopped(pipe);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(video_device_pipeline_stopped);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  /*
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index 1b6222fab24eda96cbe459b435431c01f7259366..45a87a5a76e8782c79da9d4890b063b8f0cbb3d8 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -654,6 +654,58 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
>   */
>  struct media_pipeline *video_device_pipeline(struct video_device *vdev);
>
> +/**
> + * video_device_pipeline_started - Run the pipeline_started() entity operation
> + *				   for a fully-started media pipeline
> + * @vdev: A video device that's part of the pipeline
> + *
> + * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
> + * connected to a given video device through enabled links, either directly or
> + * indirectly, have been marked as streaming through the use of
> + * video_device_pipeline_start() or one of its equivalent functions. If so,
> + * media_pipeline_started() is called to inform entities in the pipeline of that
> + * fact. The intention is to provide drivers with a mechanism for checking
> + * whether their pipeline is fully ready to start processing data and call the
> + * .pipeline_started() media entity operation on all the entities in the
> + * pipeline if so.
> + *
> + * Return: The number of video devices in the pipeline remaining to be started,
> + * or a negative error number on failure:
> + *
> + * * 0			- Success
> + * * n > 0		- n video devices in the pipeline remain unstarted
> + * * -ENODEV		- The video device has no pipeline
> + * * -ENOMEM		- failed to allocate pipeline iterator
> + * * n < 0		- Error passed through from a media entity's
> + *			  .pipeline_started() operation
> + */
> +int video_device_pipeline_started(struct video_device *vdev);
> +
> +/**
> + * video_device_pipeline_stopped - Run the pipeline_stopped() entity operation
> + *				   for a fully-started media pipeline
> + * @vdev: A video device that's part of the pipeline
> + *
> + * This function checks whether the MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
> + * connected to a given video device through enabled links, either directly or
> + * indirectly, have been marked as not streaming through the use of
> + * video_device_pipeline_stop() or one of its equivalent functions. If none of
> + * the video devices in the pipeline have been stopped, then the function
> + * media_pipeline_stopped() is called. The intention is to provide drivers with
> + * a mechanism for checking whether this video device is the first device in the
> + * pipeline to be stopped and call the .pipeline_stopped() media entity
> + * operation on all the entities in the pipeline if so.
> + *
> + * Return: The number of video devices in the pipeline remaining to be started,
> + * or a negative error number on failure:
> + *
> + * * 0			- Success
> + * * n > 0		- n video devices in the pipeline already stopped
> + * * -ENODEV		- The video device has no pipeline
> + * * -ENOMEM		- failed to allocate pipeline iterator
> + */
> +int video_device_pipeline_stopped(struct video_device *vdev);

I still have troubles here,

media_pipeline_stopped() is documented as

* media_pipeline_stopped - Inform entities in a pipeline that it has stopped

and the entity operation pipeline_stopped() is documented as

* @pipeline_stopped:  Optional: Notify this entity that the pipeline it is a
*                     part of has been stopped.

However video_device_pipeline_stopped() calls media_pipeline_stopped()
(and consequentially the entities' .pipeline_stopped() op) on the first call
to streamoff on any video devices in the pipeline.

At this point what confuses me is:

- If we're on the first call to streamoff, has the pipeline actually
  "stopped" ?
- if the fist call to streamoff triggers a pipeline halt, what happens
  to the non-yet-stopped video devices ? Will they stop sending
  buffers back ?
- I understand a post-pipeline-start hook is desirable, but I fail to
  clearly find a use case for this one, that to me looks like a
  pre-pipeline-stop hook.

> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>
>  #endif /* _V4L2_DEV_H */
>
> --
> 2.34.1
>
>

