Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C4F1091926
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 21:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G89visizU/92hf0SLiKRNbw2/G7HUH6BhZacmH6Okyk=; b=tpux9gEf9HNAnydABUADk4fmpg
	z8wSrWTY/jECqwsLRhlrhgH9k18cs5oGk83SEq9fNjWS9aVqGof9RUWKF0x8KoOsShg0Kmw2WTNIS
	nrdkB/pAZ9dAN/Rd2jG96MEyGNvvGMU4QcO6FjYIDpy1C4GAQBbeJk8oYmPpI7wtQQctmsal88X2T
	EG89DmI+W3189f9vL8YkQljoJdwpD3JiV9PG/S3OC7/eJmcNNoudJNbtabQ2QuctytI2XH9mTTBGL
	8ntQzc9nl8+/Vzts6oExGZ3qdIl7epKc970zzuajDdil7kr2nt0xrHCAadH6c0ruCnz5a86W+GpEK
	YtHph8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LEL-0000000Bbgc-3c5d;
	Thu, 19 Mar 2026 21:48:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LEJ-0000000Bbg5-0WCJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 21:48:36 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7BA61838;
	Thu, 19 Mar 2026 22:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773956839;
	bh=A2biq4caq2/pSsQ/KuL6rT7TR2Y09X0AsHLcXBFJU6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8+aNMGGKEFufXx2QMHh/YxIv32y4Kq4tDsLyRV+MCbdcFRsftjdr78fe7tg1luQc
	 CnhxMP8z1yCYWPPREps6n94jPLqjmse8M9E10xALVFKFN6wnGmeeFpkxMWWegDzZYB
	 9swtfZ2DZmCdDyOidpW4PMsSLytgzGKyDxgfyC9U=
Date: Thu, 19 Mar 2026 23:48:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexi Birlinger <alexi.birlinger@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: nxp: imx8-isi: Reduce minimum queued
 buffers from 2 to 0
Message-ID: <20260319214831.GB950375@killaraus.ideasonboard.com>
References: <20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com>
 <20260312-isi_min_buffers-v2-1-d5ea1c79ad81@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312-isi_min_buffers-v2-1-d5ea1c79ad81@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_144835_301649_07B0F8EF 
X-CRM114-Status: GOOD (  21.05  )
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

Hi Guoniu,

Thank you for the patch.

On Thu, Mar 12, 2026 at 11:12:34AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Fix a hang issue when capturing a single frame with applications like cam
> in libcamera. It would hang waiting for the driver to complete the buffer,
> but streaming never starts because min_queued_buffers was set to 2.
> 
> The ISI module uses a ping-pong buffer mechanism that requires two buffers
> to be programmed at all times. However, when fewer than 2 user buffers are
> available, the driver use internal discard buffers to fill the remaining
> slot(s). Reduce minimum queued buffers from 2 to 0 allows streaming to
> start without any queued buffers.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v2:
> - Reduce min_queued_buffers from 2 to 0 suggested by Jacopo Mondi
>   https://lore.kernel.org/linux-media/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com/T/#mcd4b7dcc218a02e2f218ba2c83b947ccefd9308b
> - Add fix tag
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 13682bf6e9f8895bb9eb1f92d5f74b0d5968544e..1be3a728f32f89338a75ddcc4e96e7501ed954e1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -1410,7 +1410,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->buf_struct_size = sizeof(struct mxc_isi_buffer);
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	q->min_queued_buffers = 2;
> +	q->min_queued_buffers = 0;

A simple way to fix the issue, that's nice.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	q->lock = &video->lock;
>  	q->dev = pipe->isi->dev;
>  
> 

-- 
Regards,

Laurent Pinchart

