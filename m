Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC14CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu/GDtHXRZa9SaNeBI/oOAZeXRDXVDEVNpw7L9cgj2s=; b=ARjGy620vDpRIWMJ0dkKvI1FOl
	OpITLphFlIZOURyYPO4zkoGsbAGUkF0jACrIc3NfvXX+/0CEpkgrYWCrnotjo3HvEGffGBNcRIWGP
	ENjxeQxIQnnj75ypTt1/XoGq35AW5SfjfzQVw34sYmkZF9VUS1m4dpGlfjWIlFrRXk+wfixSCRY+E
	9LKgJd2nR9awYUZO8qT+hXm1mmtCgLkpF7gdfTatJ0GQ+TCbWM73WjNU13czcCN58ulHSmDqvLq5I
	TG6Ib5yL6D9SsIHkTzH7xd/6ZSUNNOBBaGE/ITBNcUIuCk/yswg8jecjN3Nx4Km2+3s3yxwzUnmze
	ISAVp9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Dw-000000081pl-1bOd;
	Thu, 21 May 2026 14:18:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Dt-000000081oK-3RV3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:18:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Dj-0007o0-Qt; Thu, 21 May 2026 16:17:55 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Di-0017O6-30;
	Thu, 21 May 2026 16:17:55 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Dj-00000004Wuk-1aW2;
	Thu, 21 May 2026 16:17:55 +0200
Date: Thu, 21 May 2026 16:17:55 +0200
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
Subject: Re: [PATCH v7 13/28] media: rockchip: rga: calculate x_div/y_div
 using v4l2_format_info
Message-ID: <ag8UEzt23aQHzGF-@pengutronix.de>
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
 <20260521-spu-rga3-v7-13-3f33e8c7145f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-13-3f33e8c7145f@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_071806_003084_A91FAAEA 
X-CRM114-Status: GOOD (  25.25  )
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

On Thu, 21 May 2026 00:44:18 +0200, Sven Püschel wrote:
> Calculate the x_div and y_div variables with the information from
> v4l2_format_info instead of storing these in the rga_fmt struct.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c | 45 +++++++---------------------
>  drivers/media/platform/rockchip/rga/rga.h    |  2 --
>  2 files changed, 11 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 40498796507e0..17f7a67c0b4bb 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -42,6 +42,7 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
>  {
>  	struct rga_corners_addr_offset offsets;
>  	struct rga_addr_offset *lt, *lb, *rt, *rb;
> +	const struct v4l2_format_info *format_info;
>  	unsigned int x_div = 0,
>  		     y_div = 0, uv_stride = 0, pixel_width = 0;
>  
> @@ -50,8 +51,16 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
>  	rt = &offsets.right_top;
>  	rb = &offsets.right_bottom;
>  
> -	x_div = frm->fmt->x_div;
> -	y_div = frm->fmt->y_div;
> +	format_info = v4l2_format_info(frm->pix.pixelformat);
> +	/* x_div is only used for the u/v planes.
> +	 * When the format doesn't have these, use 1 to avoid a division by zero.
> +	 */
> +	if (format_info->bpp[1])
> +		x_div = format_info->hdiv * format_info->bpp_div[1] /
> +			format_info->bpp[1];
> +	else
> +		x_div = 1;
> +	y_div = format_info->vdiv;
>  	uv_stride = frm->stride / x_div;
>  	pixel_width = frm->stride / frm->pix.width;
>  
> @@ -476,128 +485,96 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_ALPHA_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR8888,
>  		.depth = 32,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_ABGR32,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR8888,
>  		.depth = 32,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_XBGR32,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_XBGR8888,
>  		.depth = 32,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_RGB24,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_RGB888,
>  		.depth = 24,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_BGR24,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_RGB888,
>  		.depth = 24,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_ARGB444,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR4444,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_ARGB555,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR1555,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_RGB565,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_BGR565,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.y_div = 2,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV61,
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422SP,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV12,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.y_div = 2,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV12M,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.y_div = 2,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV16,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422SP,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUV420,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420P,
>  		.depth = 12,
> -		.y_div = 2,
> -		.x_div = 2,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422P,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 2,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_YVU420,
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420P,
>  		.depth = 12,
> -		.y_div = 2,
> -		.x_div = 2,
>  	},
>  };
>  
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 640e510285341..27b3c9b4f220c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -20,8 +20,6 @@
>  struct rga_fmt {
>  	u32 fourcc;
>  	int depth;
> -	u8 y_div;
> -	u8 x_div;
>  	u8 color_swap;
>  	u8 hw_format;
>  };
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

