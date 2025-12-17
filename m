Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFF7D68BC8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 23:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpzPemYiHT1crddOmv6B2QjiU767m3aR+s44o3T+MFM=; b=VF4skoUhsWReSZdtsm+DgqWGrB
	0GkFiIfh3J/3OWrICw1N5BR3EtZqU1qhlxwU3B+JIsLut16iYHLyFEOymHO2Q3X5mv4gLF+vDMDXd
	R3EmgXzZVsJ9bXUF0LxrZ5FITPfHx/sX57GvFPRjnl1hekIrmC0r+suC6g8ODboXbX0WICCKDuchj
	WvMX+KZJm8xs+Sp3MbvSIy3pLiS+lm2YIo0fFiAT64VSswp2M1E3sCMXhjNFoLFS0xU+px28FcXUu
	bM62zfxHlyP0/xKreU1DXSFAq4kWsXfwahfpNcGvBmpDFnLpzPTpCYcjK+MotNAWDhk3a4A6VSvSA
	qFU1YBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW1O1-00000007Zg8-2Pdd;
	Wed, 17 Dec 2025 23:56:53 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW1Nz-00000007Zfb-3HcY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 23:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1766015811;
 bh=LpzPemYiHT1crddOmv6B2QjiU767m3aR+s44o3T+MFM=;
 b=MVMqOvzzVNPGaBWv3vOSLhd0eONqQ6Fpz70raemIp74yAJJFFtR2KF5vWAHJJhVfLzW/4CEvA
 7l/lGzaxgklHZ/kIB0hiGiaX4GA9WTUoE1+9Ry52kNmeqmLc/DckBvWcGzPfKI2BlP71XR3PF1g
 jyKnPRImOG5eJngj5enMyq7/ZEJMkDfbuH8cBFiBZUDnFq5km2gI8jQHg2tU6wGZZ4pSuBXD7sU
 pTNDsNwTA/TqVor6FqjMNQL9slYkYykfpJvSeDnOgqyAWKL7YRd8cd59gzPRkzijEcyLMKAbKjp
 XhHLo0y2my5yrBgKqqMIjM7tfnN8b5dAnxPBrsIO8hbQ==
X-Forward-Email-ID: 6943433547898a7fd2fefbd0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.0.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <0b08a231-5560-471e-8d8d-0431f3ada0ac@kwiboo.se>
Date: Thu, 18 Dec 2025 00:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/17] media: rkvdec: Add H264 support for the VDPU381
 variant
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
 Hans de Goede <hansg@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Diederik de Haas <didi.debian@cknow.org>,
 linux-kernel@vger.kernel.org
References: <20251217174059.1341784-1-detlev.casanova@collabora.com>
 <20251217174059.1341784-15-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251217174059.1341784-15-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_155651_820772_5189160B 
X-CRM114-Status: GOOD (  30.54  )
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

Hi Detlev,

On 12/17/2025 6:40 PM, Detlev Casanova wrote:
> This decoder variant is found in Rockchip RK3588 SoC family.
> 
> Like for rkvdec on rk3399, it supports the NV12, NV15, NV16 and NV20
> output formats and level up to 5.1.
> 
> The maximum width and height have been significantly increased
> supporting up to 65520 pixels for both.
> 
> Also make sure to only expose the first core and ignore the other
> until mutli-core is supported.
> 
> Fluster score for JVT-AVC_V1 is 129/135.
> 
> Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>  .../rockchip/rkvdec/rkvdec-h264-common.h      |   2 +
>  .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 469 ++++++++++++++++++
>  .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 424 ++++++++++++++++
>  .../media/platform/rockchip/rkvdec/rkvdec.c   |  84 ++++
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   8 +
>  6 files changed, 988 insertions(+)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
> 

[snip]

> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index f7353d0acdab..1ddae1b23434 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -29,6 +29,7 @@
>  
>  #include "rkvdec.h"
>  #include "rkvdec-regs.h"
> +#include "rkvdec-vdpu381-regs.h"
>  #include "rkvdec-rcb.h"
>  
>  static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
> @@ -90,6 +91,9 @@ static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
>  {
>  	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
>  			    pix_mp->width, pix_mp->height);
> +
> +	ctx->colmv_offset = pix_mp->plane_fmt[0].sizeimage;
> +
>  	pix_mp->plane_fmt[0].sizeimage += 128 *
>  		DIV_ROUND_UP(pix_mp->width, 16) *
>  		DIV_ROUND_UP(pix_mp->height, 16);
> @@ -367,6 +371,26 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>  	}
>  };
>  
> +static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize = {
> +			.min_width = 64,
> +			.max_width =  65520,
> +			.step_width = 64,
> +			.min_height = 64,
> +			.max_height =  65520,
> +			.step_height = 16,
> +		},
> +		.ctrls = &rkvdec_h264_ctrls,
> +		.ops = &rkvdec_vdpu381_h264_fmt_ops,
> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts = rkvdec_h264_decoded_fmts,
> +		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +		.capability = RKVDEC_CAPABILITY_H264,
> +	},
> +};
> +
>  static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
>  {
>  	return (ctx->dev->variant->capabilities & capability) == capability;
> @@ -1241,6 +1265,35 @@ static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
>  	return IRQ_HANDLED;
>  }
>  
> +static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
> +{
> +	struct rkvdec_dev *rkvdec = ctx->dev;
> +	enum vb2_buffer_state state;
> +	bool need_reset = 0;
> +	u32 status;
> +
> +	status = readl(rkvdec->regs + VDPU381_REG_STA_INT);
> +	writel(0, rkvdec->regs + VDPU381_REG_STA_INT);
> +
> +	if (status & VDPU381_STA_INT_DEC_RDY_STA) {
> +		state = VB2_BUF_STATE_DONE;
> +	} else {
> +		state = VB2_BUF_STATE_ERROR;
> +		if (status & (VDPU381_STA_INT_SOFTRESET_RDY |
> +			      VDPU381_STA_INT_TIMEOUT |
> +			      VDPU381_STA_INT_ERROR))
> +			rkvdec_iommu_restore(rkvdec);
> +	}
> +
> +	if (need_reset)
> +		rkvdec_iommu_restore(rkvdec);
> +
> +	if (cancel_delayed_work(&rkvdec->watchdog_work))
> +		rkvdec_job_finish(ctx, state);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
>  {
>  	struct rkvdec_dev *rkvdec = priv;
> @@ -1308,6 +1361,19 @@ static int rkvdec_disable_multicore(struct rkvdec_dev *rkvdec)
>  	return 0;
>  }
>  
> +static const struct rcb_size_info vdpu381_rcb_sizes[] = {
> +	{6,	PIC_WIDTH},	// intrar
> +	{1,	PIC_WIDTH},	// transdr (Is actually 0.4*pic_width)
> +	{1,	PIC_HEIGHT},	// transdc (Is actually 0.1*pic_height)
> +	{3,	PIC_WIDTH},	// streamdr
> +	{6,	PIC_WIDTH},	// interr
> +	{3,	PIC_HEIGHT},	// interc
> +	{22,	PIC_WIDTH},	// dblkr
> +	{6,	PIC_WIDTH},	// saor
> +	{11,	PIC_WIDTH},	// fbcr
> +	{67,	PIC_HEIGHT},	// filtc col
> +};

This feel a little bit out of place, should it be moved just above
vdpu381_variant_ops and after rk3399_rkvdec_variant ?

> +
>  static const struct rkvdec_variant_ops rk3399_variant_ops = {
>  	.irq_handler = rk3399_irq_handler,
>  };
> @@ -1341,6 +1407,19 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
>  			RKVDEC_CAPABILITY_VP9,
>  };
>  
> +static const struct rkvdec_variant_ops vdpu381_variant_ops = {
> +	.irq_handler = vdpu381_irq_handler,
> +};
> +
> +static const struct rkvdec_variant rk3588_vdpu381_variant = {

Are we expecting other soc use vdpu381 ? Or are there some reason why
some of the structs are just named vdpu381 and this one both rk3588 and
vdpu381 ?

Regards,
Jonas

> +	.coded_fmts = vdpu381_coded_fmts,
> +	.num_coded_fmts = ARRAY_SIZE(vdpu381_coded_fmts),
> +	.rcb_sizes = vdpu381_rcb_sizes,
> +	.num_rcb_sizes = ARRAY_SIZE(vdpu381_rcb_sizes),
> +	.ops = &vdpu381_variant_ops,
> +	.capabilities = RKVDEC_CAPABILITY_H264,
> +};
> +
>  static const struct of_device_id of_rkvdec_match[] = {
>  	{
>  		.compatible = "rockchip,rk3288-vdec",
> @@ -1354,6 +1433,10 @@ static const struct of_device_id of_rkvdec_match[] = {
>  		.compatible = "rockchip,rk3399-vdec",
>  		.data = &rk3399_rkvdec_variant,
>  	},
> +	{
> +		.compatible = "rockchip,rk3588-vdec",
> +		.data = &rk3588_vdpu381_variant,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> @@ -1387,6 +1470,7 @@ static int rkvdec_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	rkvdec->num_clocks = ret;
> +	rkvdec->axi_clk = devm_clk_get(&pdev->dev, "axi");
>  
>  	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(rkvdec->regs))
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index 75a9ba988794..1ad9a4fc31db 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -29,6 +29,10 @@
>  
>  #define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
>  
> +#define RKVDEC_1080P_PIXELS		(1920 * 1088)
> +#define RKVDEC_4K_PIXELS		(4096 * 2304)
> +#define RKVDEC_8K_PIXELS		(7680 * 4320)
> +
>  struct rkvdec_ctx;
>  struct rkvdec_rcb_config;
>  
> @@ -132,6 +136,7 @@ struct rkvdec_dev {
>  	struct device *dev;
>  	struct clk_bulk_data *clocks;
>  	unsigned int num_clocks;
> +	struct clk *axi_clk;
>  	void __iomem *regs;
>  	struct mutex vdev_lock; /* serializes ioctls */
>  	struct delayed_work watchdog_work;
> @@ -150,6 +155,7 @@ struct rkvdec_ctx {
>  	struct rkvdec_dev *dev;
>  	enum rkvdec_image_fmt image_fmt;
>  	struct rkvdec_rcb_config *rcb_config;
> +	u32 colmv_offset;
>  	void *priv;
>  };
>  
> @@ -180,4 +186,6 @@ extern const struct rkvdec_coded_fmt_ops rkvdec_h264_fmt_ops;
>  extern const struct rkvdec_coded_fmt_ops rkvdec_hevc_fmt_ops;
>  extern const struct rkvdec_coded_fmt_ops rkvdec_vp9_fmt_ops;
>  
> +extern const struct rkvdec_coded_fmt_ops rkvdec_vdpu381_h264_fmt_ops;
> +
>  #endif /* RKVDEC_H_ */


