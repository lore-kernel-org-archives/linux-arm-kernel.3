Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0786DCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfG0V69koVBOJggfcatQYxPO10prL+EIbje4/cq+whw=; b=JIdEb6R7N9BxM2GSfIwCI3NcKu
	nWPmtJkZ8qfygyRlMPZkyMMLhOUqGVeSLBrknxBM6LKfTHqO8uxDAa7P+yePRPoFSWzEAgzNxbX6Z
	QzTqhxJ1btYCg7Nx2sTtI69JH9Pher5Jp/24RGVvf9hJEEPkV0QHYImdJvEeDrd1zRsTy+6HQI5xv
	jfLnp/zk7yr1W5cukgivE924BjPyvFjbUFtzjahzvI0Rjji08IlgtHGSf8cHIyEhuzPociE7HxHPf
	34EReXej2UBBdRMLfMBzIhCCZu1eWSSeJDn5vOgB7vioVB6z1UqsGKEd4tXbvSP4nIjFXH3l4l7jy
	u4ipqC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2tj-00000007mYd-2xU2;
	Thu, 21 May 2026 12:53:11 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2th-00000007mXd-0wLR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:53:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ2tX-00021U-76; Thu, 21 May 2026 14:52:59 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ2tW-0016dq-12;
	Thu, 21 May 2026 14:52:58 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ2tW-00000004VlF-3CuZ;
	Thu, 21 May 2026 14:52:58 +0200
Date: Thu, 21 May 2026 14:52:58 +0200
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
Subject: Re: [PATCH v7 08/28] media: rockchip: rga: use stride for offset
 calculation
Message-ID: <ag8AKgcwkZTuI3H9@pengutronix.de>
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
 <20260521-spu-rga3-v7-8-3f33e8c7145f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-8-3f33e8c7145f@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_055309_415379_116D0274 
X-CRM114-Status: GOOD (  23.35  )
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

On Thu, 21 May 2026 00:44:13 +0200, Sven Püschel wrote:
> Use the stride instead of the width for the offset calculation. This
> ensures that the bytesperline value doesn't need to match the width
> value of the image.
> 
> Furthermore this patch removes the dependency on the uv_factor property
> and instead reuses the v4l2_format_info to determine the correct
> division factor.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c | 14 +++++++++-----
>  drivers/media/platform/rockchip/rga/rga.c     | 16 ----------------
>  drivers/media/platform/rockchip/rga/rga.h     |  1 -
>  3 files changed, 9 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index bb575873f2b24..65fc0d5b4aa10 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -14,7 +14,6 @@
>  #include <media/videobuf2-dma-sg.h>
>  #include <media/videobuf2-v4l2.h>
>  
> -#include "rga-hw.h"
>  #include "rga.h"
>  
>  static ssize_t fill_descriptors(struct rga_dma_desc *desc, size_t max_desc,
> @@ -95,14 +94,19 @@ static int rga_buf_init(struct vb2_buffer *vb)
>  	return 0;
>  }
>  
> -static int get_plane_offset(struct rga_frame *f, int plane)
> +static int get_plane_offset(struct rga_frame *f,
> +			    const struct v4l2_format_info *info,
> +			    int plane)
>  {
> +	u32 stride = f->pix.plane_fmt[0].bytesperline;
> +
>  	if (plane == 0)
>  		return 0;
>  	if (plane == 1)
> -		return f->width * f->height;
> +		return stride * f->height;
>  	if (plane == 2)
> -		return f->width * f->height + (f->width * f->height / f->fmt->uv_factor);
> +		return stride * f->height +
> +		       (stride * f->height / info->hdiv / info->vdiv);
>  
>  	return -EINVAL;
>  }
> @@ -148,7 +152,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
>  	/* Fill the remaining planes */
>  	info = v4l2_format_info(f->fmt->fourcc);
>  	for (i = info->mem_planes; i < info->comp_planes; i++)
> -		offsets[i] = get_plane_offset(f, i);
> +		offsets[i] = get_plane_offset(f, info, i);
>  
>  	rbuf->offset.y_off = offsets[0];
>  	rbuf->offset.u_off = offsets[1];
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 4e710a050cb7c..c07207edffdb6 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -190,7 +190,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_ALPHA_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR8888,
>  		.depth = 32,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -199,7 +198,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR8888,
>  		.depth = 32,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -208,7 +206,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_XBGR8888,
>  		.depth = 32,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -217,7 +214,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_RGB888,
>  		.depth = 24,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -226,7 +222,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_RGB888,
>  		.depth = 24,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -235,7 +230,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR4444,
>  		.depth = 16,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -244,7 +238,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR1555,
>  		.depth = 16,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -253,7 +246,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_BGR565,
>  		.depth = 16,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -262,7 +254,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.uv_factor = 4,
>  		.y_div = 2,
>  		.x_div = 1,
>  	},
> @@ -271,7 +262,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422SP,
>  		.depth = 16,
> -		.uv_factor = 2,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -280,7 +270,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.uv_factor = 4,
>  		.y_div = 2,
>  		.x_div = 1,
>  	},
> @@ -289,7 +278,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.uv_factor = 4,
>  		.y_div = 2,
>  		.x_div = 1,
>  	},
> @@ -298,7 +286,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422SP,
>  		.depth = 16,
> -		.uv_factor = 2,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -307,7 +294,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420P,
>  		.depth = 12,
> -		.uv_factor = 4,
>  		.y_div = 2,
>  		.x_div = 2,
>  	},
> @@ -316,7 +302,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422P,
>  		.depth = 16,
> -		.uv_factor = 2,
>  		.y_div = 1,
>  		.x_div = 2,
>  	},
> @@ -325,7 +310,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420P,
>  		.depth = 12,
> -		.uv_factor = 4,
>  		.y_div = 2,
>  		.x_div = 2,
>  	},
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 2db10acecb405..477cf5b62bbb2 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -17,7 +17,6 @@
>  struct rga_fmt {
>  	u32 fourcc;
>  	int depth;
> -	u8 uv_factor;
>  	u8 y_div;
>  	u8 x_div;
>  	u8 color_swap;
> 
> -- 
> 2.54.0
> 
> 

