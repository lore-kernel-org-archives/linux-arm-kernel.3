Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3D2CF257C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 04:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H82FPNqOuHpmusNm7Up8cmo3I2dBYpB2qLg29wT1eZ0=; b=bwvaJ1T9x03DQc0Ik/ei7Rs4ce
	uzI1+jnVy76c9I6ieaCgKhTVntVjvgsBHlaM1gGOIqf7M4avS+++AyuvS2NaLxALe6MTkMuCVKTfN
	KYqlbIeccTyX4Dd0szSfP9BAxkkpMsY6pQD+2NnlvqK9jsB97DAlY+ReeqJP9VQP0xkwx4z2iLAlr
	ll+DdTGvsaSY5Qo29aT+6j1jwjp7jjkbeE3r8PMqQL4KywiDLztxgJciwQt4dYVw0eV62+qJr3ogE
	4KYjXj8+l/wky+8gY7ZTA0V4pkqv4Vmbg3Ca4OH4CkG1FA+X3N51UzDO3oJOUq9ON2INBSg71MAqB
	zpyCsYVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZj7-00000001hsk-3JeQ;
	Wed, 19 Nov 2025 04:23:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLZj4-00000001hox-0pL8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 04:23:27 +0000
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 201FBDD9;
	Wed, 19 Nov 2025 05:21:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763526080;
	bh=9Ebh3zjHTAH1FvI3YKXROgZAf1jvykzloaAHjJr46O8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qusI2sobNHdWWnh8sMcryOCL2C4GuA7ZNMA2V4K3VjcSQcoFvxFBu9oQY2TC+XV4p
	 6vGPlNhJfqF7H7ylrC/s2/o9ZxtC8bwD6guU4F9fPa3m4WCejvFGQnhLAqOTJXRW4Z
	 p0k9A0maYxCmvwAHu198LboCfncOSkS1UvOwWU8E=
Date: Wed, 19 Nov 2025 13:22:47 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: nxp: use devm_mutex_init() simple code
Message-ID: <20251119042247.GL10711@pendragon.ideasonboard.com>
References: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
 <20251117-cam_cleanup-v1-1-6cd42872db79@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-cam_cleanup-v1-1-6cd42872db79@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_202326_387566_5A285725 
X-CRM114-Status: GOOD (  20.27  )
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

Hi Frank,

Thank you for the patch.

On Mon, Nov 17, 2025 at 01:58:11PM -0500, Frank Li wrote:
> Use devm_mutex_init() simple code. No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx-pxp.c          |  5 ++++-
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 11 +++++------
>  drivers/media/platform/nxp/mx2_emmaprp.c      |  7 +++----
>  3 files changed, 12 insertions(+), 11 deletions(-)

Given the diffstat, and the fact that devm_mutex_init() performs dynamic
memory allocation, I'm not convinced by this change. I won't block it
though, as I don't maintain the above drivers.

> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index 3f9a67a6bd4d268841f85f9b69af03138300d188..32d39c8013c7eef1f9629f971cc74afecd463ac7 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -1805,6 +1805,10 @@ static int pxp_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&dev->irqlock);
>  
> +	ret = devm_mutex_init(&pdev->dev, &dev->dev_mutex);
> +	if (ret)
> +		return ret;
> +
>  	ret = devm_request_irq(&pdev->dev, irq, pxp_irq_handler, 0,
>  			       dev_name(&pdev->dev), dev);
>  	if (ret < 0) {
> @@ -1831,7 +1835,6 @@ static int pxp_probe(struct platform_device *pdev)
>  		goto err_clk;
>  
>  	atomic_set(&dev->num_inst, 0);
> -	mutex_init(&dev->dev_mutex);
>  
>  	dev->vfd = pxp_videodev;
>  	vfd = &dev->vfd;
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 371b4e81328c107269f89da23818ab0abd0179da..0851f4a9ae52d3096f454da643cfdc5017e000b1 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -1033,15 +1033,17 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, &state->sd);
>  
> -	mutex_init(&state->lock);
> +	ret = devm_mutex_init(dev, &state->lock);
> +	if (ret)
> +		return ret;
>  
>  	ret = imx8mq_mipi_csi_subdev_init(state);
>  	if (ret < 0)
> -		goto mutex;
> +		return ret;
>  
>  	ret = imx8mq_mipi_csi_init_icc(pdev);
>  	if (ret)
> -		goto mutex;
> +		return ret;
>  
>  	/* Enable runtime PM. */
>  	pm_runtime_enable(dev);
> @@ -1068,8 +1070,6 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
>  	v4l2_async_unregister_subdev(&state->sd);
>  icc:
>  	imx8mq_mipi_csi_release_icc(pdev);
> -mutex:
> -	mutex_destroy(&state->lock);
>  
>  	return ret;
>  }
> @@ -1087,7 +1087,6 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
>  	imx8mq_mipi_csi_runtime_suspend(&pdev->dev);
>  	media_entity_cleanup(&state->sd.entity);
>  	v4l2_subdev_cleanup(&state->sd);
> -	mutex_destroy(&state->lock);
>  	pm_runtime_set_suspended(&pdev->dev);
>  	imx8mq_mipi_csi_release_icc(pdev);
>  }
> diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
> index 02d57229b9b3a600303cc0429e102139385071d6..384a2672884e96d17cca542ef51fbef62328b66a 100644
> --- a/drivers/media/platform/nxp/mx2_emmaprp.c
> +++ b/drivers/media/platform/nxp/mx2_emmaprp.c
> @@ -824,7 +824,9 @@ static int emmaprp_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	mutex_init(&pcdev->dev_mutex);
> +	ret = devm_mutex_init(&pdev->dev, &pcdev->dev_mutex);
> +	if (ret)
> +		return ret;
>  
>  	vfd = video_device_alloc();
>  	if (!vfd) {
> @@ -878,8 +880,6 @@ static int emmaprp_probe(struct platform_device *pdev)
>  unreg_dev:
>  	v4l2_device_unregister(&pcdev->v4l2_dev);
>  
> -	mutex_destroy(&pcdev->dev_mutex);
> -
>  	return ret;
>  }
>  
> @@ -892,7 +892,6 @@ static void emmaprp_remove(struct platform_device *pdev)
>  	video_unregister_device(pcdev->vfd);
>  	v4l2_m2m_release(pcdev->m2m_dev);
>  	v4l2_device_unregister(&pcdev->v4l2_dev);
> -	mutex_destroy(&pcdev->dev_mutex);
>  }
>  
>  static struct platform_driver emmaprp_pdrv = {

-- 
Regards,

Laurent Pinchart

