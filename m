Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1924CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 17:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7zmf+DQBrj5oBxKGDaplnoUfyJDtyQHm5LPs+rfdPc=; b=zUm6sErgDnUqBT0DYOuINYI7Ln
	S3DSHeKZaO6u0ks0Bc+m3cra+AGq9wlax69KSqw6uA09r2lszWOCS2PzcnWh45TpBzfqxF4Ogn25X
	8KSMi1WFXSxP+wzXI6TZifSTMfTVu2aKwin4AovVMrAy1AmfIWX7OqlDfpI6DBNuPPCEdBLnZxYQE
	QI6iN2bJ1Spa1h8skRiOLNk5R3HbAxT6pbAU4uLqv0/ED11WztvQadZZoDXzsf9wYX5pmgvEktzTX
	128brARItpsrqnQCFQvobK6LoT76lf331C3Q+4Zkh+0NROfJWbwd5n5LfggpY390YR4XO7rpu/xnX
	0L/OvwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkvE-00000005KlN-0eze;
	Wed, 20 May 2026 17:41:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkvB-00000005Kk7-2mLZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 17:41:31 +0000
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4142642B;
	Wed, 20 May 2026 19:41:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779298874;
	bh=iTxehStzlB1GozKYMCfNJeZ67nC8BTcSqdK5qvQx330=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZL8/nn9I+dEVKV+TvrU0ZHScVI4DiFx5+tExY2OgzDi+5DYB8ozCjW4c8O9WM/AeW
	 m4jyPNsizBE19NFwzuudLRPG+GKWYyWCaimyvmSzH65E3VyCa0HH8hQvj12dCuo7+q
	 05LuqYpvTeqX2mRugW2qRi7/yovvPXR+5DUEL3uo=
Date: Wed, 20 May 2026 19:41:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	Frank Li <frank.li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: nxp: imx8-isi: Fix potential out-of-bounds
 issues
Message-ID: <20260520174126.GA12108@killaraus.ideasonboard.com>
References: <20260323-isi-v3-0-8df53b24e622@oss.nxp.com>
 <20260323-isi-v3-1-8df53b24e622@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-isi-v3-1-8df53b24e622@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_104129_849042_4CE6E20A 
X-CRM114-Status: GOOD (  27.12  )
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

On Mon, Mar 23, 2026 at 04:33:30PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The maximum downscaling factor supported by ISI can be up to 16. Add
> minimum value constraint before applying the setting to hardware.
> Otherwise, the process will not respond even when Ctrl+C is executed.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v3:
> - Replace CLAMP_DOWNSCALE_16 macro with inline function
> - Adjust downscale threshold from 0x4000 to 0x2000
> - Clarify downscaling limit in comment
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 16 ++++++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   |  2 +-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  | 11 ++++++++---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 13 ++++++++-----
>  4 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 3cbd35305af0..822466445b72 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -11,6 +11,7 @@
>  #define __MXC_ISI_CORE_H__
>  
>  #include <linux/list.h>
> +#include <linux/math.h>
>  #include <linux/mutex.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> @@ -413,4 +414,19 @@ static inline void mxc_isi_debug_cleanup(struct mxc_isi_dev *isi)
>  }
>  #endif
>  
> +/*
> + * ISI scaling engine works in two parts: it performs pre-decimation of
> + * the image followed by bilinear filtering to achieve the desired
> + * downscaling factor.
> + *
> + * The decimation filter provides a maximum downscaling factor of 8, and
> + * the subsequent bilinear filter provides a maximum downscaling factor
> + * of 2. Combined, the maximum scaling factor can be up to 16.
> + */
> +static inline unsigned int
> +mxc_isi_clamp_downscale_16(unsigned int val, unsigned int max_val)
> +{
> +	return clamp(val, max(1U, DIV_ROUND_UP(max_val, 16)), max_val);
> +}
> +
>  #endif /* __MXC_ISI_CORE_H__ */
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 9225a7ac1c3e..37e59d687ed7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -11,7 +11,7 @@
>  #include "imx8-isi-core.h"
>  #include "imx8-isi-regs.h"
>  
> -#define	ISI_DOWNSCALE_THRESHOLD		0x4000
> +#define	ISI_DOWNSCALE_THRESHOLD		0x2000

This should be split to a separate patch as it's a separate fix.

>  static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)
>  {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index a39ad7a1ab18..a0e2061f4344 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -508,10 +508,15 @@ __mxc_isi_m2m_try_fmt_vid(struct mxc_isi_m2m_ctx *ctx,
>  			  struct v4l2_pix_format_mplane *pix,
>  			  const enum mxc_isi_video_type type)
>  {
> +	const struct v4l2_pix_format_mplane *format =
> +		&ctx->queues.out.format;

This can go in the 'if' below.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'll take this patch without the ISI_DOWNSCALE_THRESHOLD change in my
tree, and will send a separate patch for ISI_DOWNSCALE_THRESHOLD.

> +
>  	if (type == MXC_ISI_VIDEO_M2M_CAP) {
> -		/* Downscaling only  */
> -		pix->width = min(pix->width, ctx->queues.out.format.width);
> -		pix->height = min(pix->height, ctx->queues.out.format.height);
> +		/* Downscaling only, by up to 16. */
> +		pix->width = mxc_isi_clamp_downscale_16(pix->width,
> +							format->width);
> +		pix->height = mxc_isi_clamp_downscale_16(pix->height,
> +							 format->height);
>  	}
>  
>  	return mxc_isi_format_try(ctx->m2m->pipe, pix, type);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0..b290821d03d2 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -641,16 +641,19 @@ static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
>  			/* Composing is supported on the sink only. */
>  			return -EINVAL;
>  
> -		/* The sink crop is bound by the sink format downscaling only). */
> +		/*
> +		 * The ISI supports downscaling only, with a factor up to 16.
> +		 * Clamp the compose rectangle size accordingly.
> +		 */
>  		format = mxc_isi_pipe_get_pad_format(pipe, state,
>  						     MXC_ISI_PIPE_PAD_SINK);
>  
>  		sel->r.left = 0;
>  		sel->r.top = 0;
> -		sel->r.width = clamp(sel->r.width, MXC_ISI_MIN_WIDTH,
> -				     format->width);
> -		sel->r.height = clamp(sel->r.height, MXC_ISI_MIN_HEIGHT,
> -				      format->height);
> +		sel->r.width = mxc_isi_clamp_downscale_16(sel->r.width,
> +							  format->width);
> +		sel->r.height = mxc_isi_clamp_downscale_16(sel->r.height,
> +							   format->height);
>  
>  		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
>  						    MXC_ISI_PIPE_PAD_SINK);
> 

-- 
Regards,

Laurent Pinchart

