Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373FB1091927
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 21:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlFXMwHCttTPX03qJ1wfzCV1aYfnM/IWk47OtkeslS0=; b=OZDba7HFuRrLHktmYSC6e187O/
	ib5WGqUIvDMtuTV5r4KaLpwCWQBayG/EpitjoO2cRt5+/XWh7LibDEpeqy25YXbZcolcCg9ooHhkb
	dBI8GGs3CO50MoAemasYe0GQU0uX+aaTIA/cb0zlN4+t4JdZSbl4IT3oR5L0KJUZdeVXHgGTPfFbM
	gHopiYSdhSGY+yb5qvRa3mXGIGSiST4HPbkZPCngVYLqFGS94hF7ZETInMIwchY1wliEsKhgdpIje
	kXi5dyMVFT4FafQmA8zWmHugc/Co+AS8HriI99rP5DdaTmbfI56ohbX1LwxFM26EKx9oZGTNSc2Kk
	RvNegc2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3L0B-0000000Bawk-3yAg;
	Thu, 19 Mar 2026 21:33:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3L08-0000000Bavl-2OeA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 21:33:58 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 79E34838;
	Thu, 19 Mar 2026 22:32:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773955956;
	bh=tzCaIgA8T0NJiMqXwAsDS9LpmbMwGbINnJroJi2ZhHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GX38tiwLN6DSYm9GEXrKsPN7SjL9S+iDBJ8NS20B32cwZtCaXMktaDfnTxMwW0BbQ
	 sEra/ZAhbLpKZyUhUf3svvp0bWPV/4iNWnlp3Vb/o4m40wDXjGDSs9TNA8ASzeZhNu
	 MjZNAs8s2LVufrMuon8q10FM+vsb9DPuoI00AEgQ=
Date: Thu, 19 Mar 2026 23:33:48 +0200
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
Subject: Re: [PATCH RESEND v2] media: nxp: imx8-isi: Fix potential
 out-of-bounds issues
Message-ID: <20260319213348.GA950375@killaraus.ideasonboard.com>
References: <20260228-isi-v2-1-f6f9208c6844@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-isi-v2-1-f6f9208c6844@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_143356_756696_3B33A483 
X-CRM114-Status: GOOD (  29.26  )
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

Hello Guoniu,

Thank you for the patch.

On Sat, Feb 28, 2026 at 05:35:53PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The maximum downscaling factor supported by ISI can be up to 16. Add
> minimum value constraint before applying the setting to hardware.
> Otherwise, the process will not respond even when Ctrl+C is executed.

Could you share how you can trigger this from userspace ? I'd like to
test it and see where the absence of response comes from.

> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v2:
> - Fix possible side-effects caused by 'max_val' in CLAMP_DOWNSCALE_16 macro.
> - Add space line between two paragraph in comment.
> - Link to v1: https://lore.kernel.org/r/20260122-isi-v1-1-c3ec6e264f13@nxp.com
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 16 ++++++++++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  |  6 +++---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c |  6 ++----
>  3 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3..84e134f4d5fb26be652ac3e6aecd459bb2a0d1c6 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -59,6 +59,22 @@ struct v4l2_m2m_dev;
>  #define MXC_ISI_M2M			"mxc-isi-m2m"
>  #define MXC_MAX_PLANES			3
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
> +#define CLAMP_DOWNSCALE_16(val, max_val)			\

Let's add a MXC_ISI_ prefix.

> +({								\
> +	typeof(max_val) __max_val = (max_val);			\
> +								\
> +	clamp((val), max(1U, __max_val >> 4), __max_val);	\

I think you should round the division up here:

	clamp((val), max(1U, (__max_val + 15) / 16, __max_val);	\

Let's assume the input size (max_val) is 1000. Without rounding up, the
output size will be clamped to 1000 / 16 = 62. This leads to a
downscaling factor slightly above 16.

> +})

Any reason not to make this an inline function instead of a macro ?

> +
>  struct mxc_isi_dev;
>  struct mxc_isi_m2m_ctx;
>  
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index f425ac7868547da401e86ce5a9b70a9890e72541..8860d89713667d06abc94e6024526fabac46feb7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -509,9 +509,9 @@ __mxc_isi_m2m_try_fmt_vid(struct mxc_isi_m2m_ctx *ctx,
>  			  const enum mxc_isi_video_type type)
>  {
>  	if (type == MXC_ISI_VIDEO_M2M_CAP) {
> -		/* Downscaling only  */
> -		pix->width = min(pix->width, ctx->queues.out.format.width);
> -		pix->height = min(pix->height, ctx->queues.out.format.height);
> +		/* Downscaling one-sixteenth only  */

There are two spaces after "only".

> +		pix->width = CLAMP_DOWNSCALE_16(pix->width, ctx->queues.out.format.width);
> +		pix->height = CLAMP_DOWNSCALE_16(pix->height, ctx->queues.out.format.height);

To keep lines shorter, you can write

		const struct v4l2_pix_format_mplane *format =
			&ctx->queues.out.format;

		/* Downscaling only, by up to 16. */
		pix->width = CLAMP_DOWNSCALE_16(pix->width, format->width);
		pix->height = CLAMP_DOWNSCALE_16(pix->height, format->height);

>  	}
>  
>  	return mxc_isi_format_try(ctx->m2m->pipe, pix, type);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0f2eeb779e9aa2461593b0d635f41..c3ffc8a38d1269c0a4e6493b4d75690f01cc87bb 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -647,10 +647,8 @@ static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
>  

There's a comment above that states

		/* The sink crop is bound by the sink format downscaling only). */

That's not right, let's fix it:

		/*
		 * The ISI supports downscaling only, with a factor up to 16.
		 * Clamp the compose rectangle size accordingly.
		 */

Reading the driver code to check how rounding is done when programming
the hardware, I noticed that we clamp the bilinear scaling ratio to
ISI_DOWNSCALE_THRESHOLD, defined as 0x4000:

	return min_t(u32, from * 0x1000 / (to * *dec), ISI_DOWNSCALE_THRESHOLD);

The ratio is documented to be a Q2.12 value, so 0x4000 is x1.0. The code
seems wrong to me, what do you think ?

>  		sel->r.left = 0;
>  		sel->r.top = 0;
> -		sel->r.width = clamp(sel->r.width, MXC_ISI_MIN_WIDTH,
> -				     format->width);
> -		sel->r.height = clamp(sel->r.height, MXC_ISI_MIN_HEIGHT,
> -				      format->height);
> +		sel->r.width = CLAMP_DOWNSCALE_16(sel->r.width, format->width);
> +		sel->r.height = CLAMP_DOWNSCALE_16(sel->r.height, format->height);
>  
>  		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
>  						    MXC_ISI_PIPE_PAD_SINK);
> 
> ---
> base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
> change-id: 20260122-isi-74f87fbb9a6f

-- 
Regards,

Laurent Pinchart

