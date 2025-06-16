Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73277C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSyutxJYfzmBxgusEDpD8+U/4MhI7IGfcdFzZV1oZI8=; b=wQfywgoMATWJyPuuTWYXZu/KNH
	KREBFv/3jNK5clhXKPcex4qoGlw5h+qQWbfrdpJfxGkcBKV5FT/p7+w+FkHCJpapbVlIwfviPCpUG
	fI+cYcDNOJ161YJDQPfyv1Q+PvEQHVs1CAyxVZTN0q77aV5wRggt9z/9lqdEG+KPF1qMqbUdOmRA0
	45sk5ECN0DsiCh42ZN/8i83D2i0jwG5f0Eu5hSPxtOayghhURmp5cxAiqma3AheLNftbSkBvemsiL
	31bxRImRI8LEpe+JxRgy5zBIeUxUa0zyYYGVzUYij+qi6kFF1Wqent+6ee9hTulwDpMIOsu7LDVk5
	nLldf3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDL9-000000054gP-29s1;
	Mon, 16 Jun 2025 17:09:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAfD-00000004gDb-3sOu;
	Mon, 16 Jun 2025 14:18:21 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA83D346;
	Mon, 16 Jun 2025 16:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750083480;
	bh=g5hkkCFVVy5nrxXUzmyCUC6UU/Y4W+zHRoFgMxj6+C8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fsa02vM4rIlIdskUmm7P8u4eBSuBRHcLo1QpPeMzgNmuXGa86y7DXYsYR+2vN5CXz
	 XXN5wborwvmaU2CdeNUnZxgsfow04oYeJq4WQ89f+E+QPFB8RAIVdEzXaypxDJxRtP
	 8141nuT/vHeib1Q/GidC+T8Q1nSpy23XUBpOtoww=
Date: Mon, 16 Jun 2025 17:17:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v7 4/4] media: pisp_be: Fix pm_runtime underrun in probe
Message-ID: <20250616141756.GC32454@pendragon.ideasonboard.com>
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
 <20250606-pispbe-mainline-split-jobs-handling-v6-v7-4-46169f0622b7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-4-46169f0622b7@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_071820_098980_CBF67668 
X-CRM114-Status: GOOD (  25.00  )
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

Hi Jacopo,

Thank you for the patch.

On Fri, Jun 06, 2025 at 12:29:24PM +0200, Jacopo Mondi wrote:
> During the probe() routine, the PiSP BE driver needs to power up the
> interface in order to identify and initialize the hardware.
> 
> The driver resumes the interface by calling the
> pispbe_runtime_resume() function directly, without going
> through the pm_runtime helpers, but later suspends it by calling
> pm_runtime_put_autosuspend().
> 
> This causes a PM usage count imbalance at probe time, notified by the
> runtime_pm framework with the below message in the system log:
> 
>  pispbe 1000880000.pisp_be: Runtime PM usage count underflow!
> 
> Fix this by resuming the interface using the pm runtime helpers instead
> of calling the resume function directly and use the pm_runtime framework
> in the probe() error path. While at it, remove manual suspend of the
> interface in the remove() function. The driver cannot be unloaded if in
> use, so simply disable runtime pm.
> 
> To simplify the implementation, make the driver depend on PM as the
> RPI5 platform where the ISP is integrated in uses the PM framework by
> default.
> 
> Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> --
> 
> Cc: stable@vger.kernel.org

This should go just below the Fixes: tag.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/raspberrypi/pisp_be/Kconfig   | 1 +
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 5 ++---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/Kconfig b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> index 46765a2e4c4d..a9e51fd94aad 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> +++ b/drivers/media/platform/raspberrypi/pisp_be/Kconfig
> @@ -3,6 +3,7 @@ config VIDEO_RASPBERRYPI_PISP_BE
>  	depends on V4L_PLATFORM_DRIVERS
>  	depends on VIDEO_DEV
>  	depends on ARCH_BCM2835 || COMPILE_TEST
> +	depends on PM
>  	select VIDEO_V4L2_SUBDEV_API
>  	select MEDIA_CONTROLLER
>  	select VIDEOBUF2_DMA_CONTIG
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index c25f7d9b404c..e49e4cc322db 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -1718,7 +1718,7 @@ static int pispbe_probe(struct platform_device *pdev)
>  	pm_runtime_use_autosuspend(pispbe->dev);
>  	pm_runtime_enable(pispbe->dev);
>  
> -	ret = pispbe_runtime_resume(pispbe->dev);
> +	ret = pm_runtime_resume_and_get(pispbe->dev);
>  	if (ret)
>  		goto pm_runtime_disable_err;
>  
> @@ -1740,7 +1740,7 @@ static int pispbe_probe(struct platform_device *pdev)
>  disable_devs_err:
>  	pispbe_destroy_devices(pispbe);
>  pm_runtime_suspend_err:
> -	pispbe_runtime_suspend(pispbe->dev);
> +	pm_runtime_put(pispbe->dev);
>  pm_runtime_disable_err:
>  	pm_runtime_dont_use_autosuspend(pispbe->dev);
>  	pm_runtime_disable(pispbe->dev);
> @@ -1754,7 +1754,6 @@ static void pispbe_remove(struct platform_device *pdev)
>  
>  	pispbe_destroy_devices(pispbe);
>  
> -	pispbe_runtime_suspend(pispbe->dev);
>  	pm_runtime_dont_use_autosuspend(pispbe->dev);
>  	pm_runtime_disable(pispbe->dev);
>  }

-- 
Regards,

Laurent Pinchart

