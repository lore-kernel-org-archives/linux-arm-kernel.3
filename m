Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5B91062894
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZn69aSTWK4ykH3XWex0QTAymTnM/roC64mVHOuxiKk=; b=xc8myvXVMjcGmwloSCQ8cLKIXr
	D9N4EV+C7JIZF+bsVA6MBAz8b9Ez/MlJJPM/72xxFgpS5Q9yiLbPI3NO/Y3G+2d0EyVX2uDm08kwV
	TtuzGY/YeaQDWl/Os80E4D8tMJ6USJNq/LyrgUE465MuimEu7oZU421DXRVpPaAWzZ0mwPq5g0FLb
	svWOIkmnhn2uGj3LAcanQPgrVnL58DVYkU2hh5riLDW2o+A29CqGdWwuJpkgdUA0eXDD8sGCOivAr
	U4LYobs499BLZ7Kyd80+0Y2gPevvN+eHFFDsDFn74QjiyX263z6LCRZ55jJKTIrCA7lMvzwHrkmC3
	cZjPDgzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J1e-0000000BaqE-1C8l;
	Wed, 11 Mar 2026 12:50:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J1a-0000000Bane-1U91
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:50:55 +0000
Received: from ideasonboard.com (static.170.20.224.46.clients.your-server.de [46.224.20.170])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DFB42D9;
	Wed, 11 Mar 2026 13:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773233382;
	bh=3hhQtJuyqLfFjdpmAoRFR4RP69ILCV1ozU6Cm359k30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHrIy0CR45EZlV1l5rTU+qJAHjLkLLzxBHX1/7bdAfKSMdurCcsSdm8exKTB5Cg7g
	 4T8bf5ab/el19dB+y+0N2VZtjdjoQlWvn+2qTg4rClIbcRw9AFOPKUSn9pFIMQtvtE
	 sYM8cBikFR0glniq+jgSZhqJUueoZYOqy8WeAGQI=
Date: Wed, 11 Mar 2026 13:50:46 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexi Birlinger <alexi.birlinger@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 1/2] media: nxp: imx8-isi: Reduce minimum queued buffers
 from 2 to 1
Message-ID: <abFeguTCJQmoCLPK@zed>
References: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
 <20260311-isi_min_buffers-v1-1-c9299d6e8ae6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-isi_min_buffers-v1-1-c9299d6e8ae6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_055054_534781_FAB9C4D9 
X-CRM114-Status: GOOD (  18.83  )
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

Hello Guoniu

On Wed, Mar 11, 2026 at 04:02:58PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Fix a hang issue when capturing a single frame with applications like cam
> in libcamera. It would hang waiting for the driver to complete the buffer,
> but streaming never starts because min_queued_buffers was set to 2.
>
> The ISI module uses a ping-pong buffer mechanism that requires two buffers
> to be programmed at all times. However, when fewer than 2 user buffers are
> available, the driver use internal discard buffers to fill the remaining
> slot(s). Reduce minimum queued buffers from 2 to 1 allows streaming to

Does it mean the ISI can use internal buffer discard for both buffer
slots ? Can we make min_queued_buffers == 0 ?

> start with a single buffer providing more flexibility for applications.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 13682bf6e9f8895bb9eb1f92d5f74b0d5968544e..2405baf21594cd18cf2b349234313c5e103b7802 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -1410,7 +1410,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->buf_struct_size = sizeof(struct mxc_isi_buffer);
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	q->min_queued_buffers = 2;
> +	q->min_queued_buffers = 1;
>  	q->lock = &video->lock;
>  	q->dev = pipe->isi->dev;
>
>
> --
> 2.34.1
>
>

