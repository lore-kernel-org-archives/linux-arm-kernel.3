Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AEEC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mo5bick5GTQlN+zmHrQ3An8FfcZ3lg4d8nADgY59VoA=; b=Mv/qhegHeMsSh+hmD6XJV/+aGC
	0JwFRqhd9n65eO5AA9bwWXs5elewZHWWQLI1qkAC/0JuHdpvH/thWqcvC6IefNtXZ4SLb5YYQ154g
	kVbx6gTP9/gUFVA5nLCETCDOv1pgXPzEPVAoKotm/lJV0WQuf9fL9z7wQSGODSFPM4dUuNRcFSKKn
	sF7J+/GCPJHuHsok+iZdNqf814+1EyR3/730/FW+RacyLKSVGCIqjqgsD2uQAlI3J0+FCZgCMui/g
	0st2Qcdm3NuZJfXiZoYn356yZVcmxWPeQhmwo6bgg/MnI41n/l3d2Fg1OvlmoG0D99Oo1bjjRcX8/
	2oNYyRAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8lt-00000001Yzk-2tga;
	Thu, 22 May 2025 16:27:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI83n-00000001TXb-2Hsw;
	Thu, 22 May 2025 15:42:23 +0000
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3874D8FA;
	Thu, 22 May 2025 17:41:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747928515;
	bh=Pk1SR0qc+6xGK/ApAUwCssUMbaYjc92Qk7n6tZrTahg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PzBqiEJQHdBh2knAAhxgQbesGuijbf2mhWv+b76u1M+H2gHMEZUz3cgcyxQEh/vco
	 SQOOyaVD++IkBhiueVsq1vvvzGFL/kjFmdN75sIgfxkZ/NntfKeVHycI8pCwtrloAo
	 Tx1quKm21RNTEP99PU6UIP0PoeWDByrYoUBHg9Rk=
Date: Thu, 22 May 2025 17:42:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: rkisp1: Cleanup error handling
Message-ID: <20250522154210.GT12514@pendragon.ideasonboard.com>
References: <20250522150944.400046-2-stefan.klug@ideasonboard.com>
 <20250522150944.400046-3-stefan.klug@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522150944.400046-3-stefan.klug@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_084219_721943_96AD67BA 
X-CRM114-Status: GOOD (  16.63  )
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

Hi Stefan,

Thank you for the patch.

On Thu, May 22, 2025 at 05:08:38PM +0200, Stefan Klug wrote:
> Do not call media_entity_cleanup() when media_entity_pads_init() fails.

Why is it an issue ? The media_entity_cleanup() documentation clearly
states

 * Calling media_entity_cleanup() on a media_entity whose memory has been
 * zeroed but that has not been initialized with media_entity_pad_init() is
 * valid and is a no-op.

This is by design to simplify error handling in drivers.

> As a drive-by fix handle an (very unlikely) error in
> rkisp1_params_init_vb2_queue().
> 
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c    | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a3..918eb06c7465 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -2763,7 +2763,9 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	vdev->queue = &node->buf_queue;
>  	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
>  	vdev->vfl_dir = VFL_DIR_TX;
> -	rkisp1_params_init_vb2_queue(vdev->queue, params);
> +	ret = rkisp1_params_init_vb2_queue(vdev->queue, params);
> +	if (ret)
> +		goto err_mutex;
>  
>  	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
>  
> @@ -2777,19 +2779,20 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	node->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
>  	if (ret)
> -		goto error;
> +		goto err_mutex;
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		dev_err(rkisp1->dev,
>  			"failed to register %s, ret=%d\n", vdev->name, ret);
> -		goto error;
> +		goto err_media;
>  	}
>  
>  	return 0;
>  
> -error:
> +err_media:
>  	media_entity_cleanup(&vdev->entity);
> +err_mutex:
>  	mutex_destroy(&node->vlock);
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart

