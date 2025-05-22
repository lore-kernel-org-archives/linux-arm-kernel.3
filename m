Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A637C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLhXYlnPR2hDOJ7XsJyiRgqDFmfCZDdPd3b/2jautVA=; b=xkxKyYCKgWL+iqg/X7S80VwjCW
	1jNfy1ICPYxYz+qhUmiXxkmLQl5rP5+XqTTq+yczKEMYs9lds7U0GGm8DKbFzDbuaIdAWZSd0SGVP
	DnmtHYrQ5CcyBSwnbAf0lHu0I+HejXpzQHMKgjY4ANZBVOJkYtpBVGlvqLuS4yDxIB//gUjiXZCkx
	vONDPur63J43zOze1Ive9V3/kvERdl/lU/Oa74mT48vohouxZ38ilBiR5MIEcNG/cAL8rDK29k0AQ
	Pv2zhggsrEFdXhrCl0WNa9E7PQ1Xsg2XRVV85AiqeABdf6kqbhQi11d3FKrR0tesWCOW66S+ZWLWb
	NykrhJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8Fq-00000001VhP-1HzI;
	Thu, 22 May 2025 15:54:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7wY-00000001S7S-3SMa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 15:34:52 +0000
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4DD28FA;
	Thu, 22 May 2025 17:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747927590;
	bh=3vgB5xe8h0Ac0HX4R8W4NCM3nLD44/mLKpe7F7SkdXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQsjAE98J6DPK3laF62msi3T3h9qdFdCNnohLbAH7v5yrDdsh/IqgnGLFwnyuFyir
	 /rU9iI3Mji5/LDH3kJTpUdjAsCZQ6vB73xfzhU5xUFg1AjJD54RGndguMKt3BBBRfJ
	 1ymAfhc+vaTe8+tWa4qWiAIG53RyTUBB434JNWaU=
Date: Thu, 22 May 2025 17:26:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Cleanup video device in error path
Message-ID: <20250522152645.GS12514@pendragon.ideasonboard.com>
References: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522-djrscally-imx8-isi-fixes-v1-1-10bcd6d347a6@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_083451_000884_5A419031 
X-CRM114-Status: GOOD (  20.32  )
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

Hi Dan,

Thank you for the patch.

On Thu, May 22, 2025 at 03:30:08PM +0100, Daniel Scally wrote:
> mxc_isi_v4l2_init() registers video devices and v4l2 subdevices but
> the video devices are not cleaned up in that function's error path
> which means they're left hanging if it fails. Update the function
> to clean them up properly.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 1e79b1211b603a71f0427e82a997787110f7e4ac..4a74b988217f504a03dfe330a7bac76cdecc933c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -154,7 +154,7 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  		if (ret < 0) {
>  			dev_err(isi->dev, "Failed to register pipe%u: %d\n", i,
>  				ret);
> -			goto err_v4l2;
> +			goto err_cleanup_pipe;
>  		}
>  
>  		ret = media_create_pad_link(&isi->crossbar.sd.entity,
> @@ -164,14 +164,14 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  					    MEDIA_LNK_FL_IMMUTABLE |
>  					    MEDIA_LNK_FL_ENABLED);
>  		if (ret < 0)
> -			goto err_v4l2;
> +			goto err_cleanup_pipe;
>  	}
>  
>  	/* Register the M2M device. */
>  	ret = mxc_isi_m2m_register(isi, v4l2_dev);
>  	if (ret < 0) {
>  		dev_err(isi->dev, "Failed to register M2M device: %d\n", ret);
> -		goto err_v4l2;
> +		goto err_cleanup_pipe;
>  	}
>  
>  	/* Initialize, fill and register the async notifier. */
> @@ -212,6 +212,9 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  err_m2m:
>  	mxc_isi_m2m_unregister(isi);
>  	v4l2_async_nf_cleanup(&isi->notifier);
> +err_cleanup_pipe:
> +	for (i = 0; i < isi->pdata->num_channels; ++i)
> +		mxc_isi_pipe_unregister(&isi->pipes[i]);

mxc_isi_pipe_unregister() calls mxc_isi_video_unregister(), which locks
the video->lock mutex. The mutex is initialized in
mxc_isi_video_register(), so you will have an issue here when reaching
this label from within the pipe registration loop for any non-registered
pipe.

One option to address this would be to return from
mxc_isi_video_unregister() if video->pipe is NULL.

>  err_v4l2:
>  	v4l2_device_unregister(v4l2_dev);
>  err_media:
> 
> ---
> base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
> change-id: 20250522-djrscally-imx8-isi-fixes-fed2d7cffb1c

-- 
Regards,

Laurent Pinchart

