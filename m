Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37802CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvPyGdPkRkYP0vyojlp4dtErlk4fybtiD+CgGdEdldI=; b=p2rO45D+F8SL8BFJjHtHoJhAwX
	baHhxO1rIPYyroB8PFMW4fAs0dsZAcwM2Q95rl8WkpAgaJlAd7qz2KvXfnRWpQNJhyEO6ekYh6Fe1
	LhSX8Mjipt5pWE8uszHdz4OR6/Fzuf5KT4/negt1H/SsyxXL0UK1TsBf69/yX1YMEwQPklQWtpkBN
	rPqkJ1F2f61RqwmwbVnOoRp5dif7Q+gBdbr3in+LjfF4a7i3kTUOd/G9J2K8EqnxDn1EvS1E4Id1P
	EBjyibNo9bdXo8ZyUsO6lHtnl7ch8DlwC61J/3h02h1ifzD5tUmfzVkXJqB09XZpZ7dGgWPo1M7Is
	qNhLXPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Io-000000082xS-3PIM;
	Thu, 21 May 2026 14:23:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Il-000000082wE-2t7o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:23:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Ic-00005O-K7; Thu, 21 May 2026 16:22:58 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Ia-0017OY-2m;
	Thu, 21 May 2026 16:22:57 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Ib-00000004Wwg-1IML;
	Thu, 21 May 2026 16:22:57 +0200
Date: Thu, 21 May 2026 16:22:57 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v7 15/28] media: rockchip: rga: align stride to 4 bytes
Message-ID: <ag8VQas7BPnKZNxd@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
 <20260521-spu-rga3-v7-15-3f33e8c7145f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-15-3f33e8c7145f@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_072307_720415_5C7D46DA 
X-CRM114-Status: GOOD (  25.36  )
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

On Thu, 21 May 2026 00:44:20 +0200, Sven Püschel wrote:
> Add an alignment setting to rga_hw to set the desired stride alignment.
> As the RGA2 register for the stride counts in word units, the code
> already divides the bytesperline value by 4 when writing it into the
> register. Therefore fix the alignment to a multiple of 4 to avoid
> potential off by one errors due from the division.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> 
> ---
> Changed in v6:
> - Drop unintended change from fmt->fourcc to pix_fmt->pixelformat
>   Flagged by Sashiko:
>   https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86%40pengutronix.de?part=15
> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c |  1 +
>  drivers/media/platform/rockchip/rga/rga.c    | 11 ++++++-----
>  drivers/media/platform/rockchip/rga/rga.h    |  1 +
>  3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 9881c14f908d5..dac3cb6aa17d3 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -580,6 +580,7 @@ const struct rga_hw rga2_hw = {
>  	.max_width = MAX_WIDTH,
>  	.min_height = MIN_HEIGHT,
>  	.max_height = MAX_HEIGHT,
> +	.stride_alignment = 4,
>  
>  	.start = rga_hw_start,
>  	.handle_irq = rga_handle_irq,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index bf6bbcbfc869b..d080cb672740b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -234,10 +234,10 @@ static int rga_open(struct file *file)
>  	ctx->in = def_frame;
>  	ctx->out = def_frame;
>  
> -	v4l2_fill_pixfmt_mp(&ctx->in.pix,
> -			    ctx->in.fmt->fourcc, def_width, def_height);
> -	v4l2_fill_pixfmt_mp(&ctx->out.pix,
> -			    ctx->out.fmt->fourcc, def_width, def_height);
> +	v4l2_fill_pixfmt_mp_aligned(&ctx->in.pix, ctx->in.fmt->fourcc,
> +				    def_width, def_height, rga->hw->stride_alignment);
> +	v4l2_fill_pixfmt_mp_aligned(&ctx->out.pix, ctx->out.fmt->fourcc,
> +				    def_width, def_height, rga->hw->stride_alignment);
>  
>  	if (mutex_lock_interruptible(&rga->mutex)) {
>  		ret = -ERESTARTSYS;
> @@ -393,7 +393,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  		fmt = &hw->formats[0];
>  
>  	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frmsize);
> -	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
> +	v4l2_fill_pixfmt_mp_aligned(pix_fmt, fmt->fourcc,
> +				    pix_fmt->width, pix_fmt->height, hw->stride_alignment);
>  	pix_fmt->field = V4L2_FIELD_NONE;
>  
>  	return 0;
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 04aeb7b429523..38518146910a6 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -150,6 +150,7 @@ struct rga_hw {
>  	size_t cmdbuf_size;
>  	u32 min_width, min_height;
>  	u32 max_width, max_height;
> +	u8 stride_alignment;
>  
>  	void (*start)(struct rockchip_rga *rga,
>  		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
> 
> -- 
> 2.54.0
> 
> 

-- 
Pengutronix e.K.                           | Michael Tretter             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

