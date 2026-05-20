Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99484CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 22:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xz+RJeO4ygrdvK9c7aJFTt3IWH+IMH4Scp0Rqi70iVU=; b=Ky4YdR020cIsio0D1Duz6ZVr1I
	ZBSTURknD2T8bjO5j/C4PNAR+NJOPOS8WT2PQV7FPVwHvAbwGmS5rrhMzAlGZ6X6CrGpxQM0Rb4DW
	qiATqTppP2+o1/gN7noanapV4MG29QcIV873ifKRjg5haf1QlsaUmcJIoWCedwvXcp/dFDvOx6A5m
	b4J4/EytcxMQUmHg3ByQDjqprYB9bs6pMqnisVE6Z40okZuB1DqPN7MCyaa/dTMOf337XfcoMU72w
	IeaGHjRYTvsWYPGnrK5qtLwuerQqhSBiXiP63reQqWkdNPiQmZk4vQwqvIhwnAdDBN006NqQQ6u+q
	5pee1stQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPpgG-000000062ts-3AIT;
	Wed, 20 May 2026 22:46:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPpf5-000000061Ge-3LMq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 22:45:14 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wPpev-0005vy-5D; Thu, 21 May 2026 00:45:01 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Thu, 21 May 2026 00:44:28 +0200
Subject: [PATCH v7 23/28] media: rockchip: rga: remove stride from
 rga_frame
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-spu-rga3-v7-23-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
In-Reply-To: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
 p.zabel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_154512_025009_59813BA6 
X-CRM114-Status: GOOD (  17.78  )
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

Remove the stride variable from rga_frame. Despite the comment it
didn't involve any calculation and is just a copy of the
plane_fmt[0].bytesperline value. Therefore avoid this struct member
and use the bytesperline value directly in the places where it is
required.

Also drop the dependency on the depth format member, which was only
used to calculate the stride of the default format. This is already done
by the v4l2_fill_pixfmt_mp_aligned helper and used as stride in try_fmt.
Therefore using it's value also for the default format stride is just
more consistent.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 36 ++++++++++------------------
 drivers/media/platform/rockchip/rga/rga.c    |  5 +---
 drivers/media/platform/rockchip/rga/rga.h    |  4 ----
 3 files changed, 13 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 73584706a47e2..fac3975e2d0cd 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -44,7 +44,7 @@ rga_get_corner_addrs(struct rga_frame *frm, struct rga_addrs *addrs,
 	struct rga_addrs *lt, *lb, *rt, *rb;
 	const struct v4l2_format_info *format_info;
 	unsigned int x_div = 0,
-		     y_div = 0, uv_stride = 0, pixel_width = 0;
+		     y_div = 0, y_stride = 0, uv_stride = 0, pixel_width = 0;
 
 	lt = &corner_addrs.left_top;
 	lb = &corner_addrs.left_bottom;
@@ -61,14 +61,15 @@ rga_get_corner_addrs(struct rga_frame *frm, struct rga_addrs *addrs,
 	else
 		x_div = 1;
 	y_div = format_info->vdiv;
-	uv_stride = frm->stride / x_div;
-	pixel_width = frm->stride / frm->pix.width;
+	y_stride = frm->pix.plane_fmt[0].bytesperline;
+	uv_stride = y_stride / x_div;
+	pixel_width = y_stride / frm->pix.width;
 
-	lt->y_addr = addrs->y_addr + y * frm->stride + x * pixel_width;
+	lt->y_addr = addrs->y_addr + y * y_stride + x * pixel_width;
 	lt->u_addr = addrs->u_addr + (y / y_div) * uv_stride + x / x_div;
 	lt->v_addr = addrs->v_addr + (y / y_div) * uv_stride + x / x_div;
 
-	lb->y_addr = lt->y_addr + (h - 1) * frm->stride;
+	lb->y_addr = lt->y_addr + (h - 1) * y_stride;
 	lb->u_addr = lt->u_addr + (h / y_div - 1) * uv_stride;
 	lb->v_addr = lt->v_addr + (h / y_div - 1) * uv_stride;
 
@@ -169,6 +170,7 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	union rga_src_act_info src_act_info;
 	union rga_dst_vir_info dst_vir_info;
 	union rga_dst_act_info dst_act_info;
+	u32 in_stride, out_stride;
 
 	src_h = ctx->in.crop.height;
 	src_w = ctx->in.crop.width;
@@ -291,13 +293,15 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	 * Calculate the framebuffer virtual strides and active size,
 	 * note that the step of vir_stride / vir_width is 4 byte words
 	 */
-	src_vir_info.data.vir_stride = ctx->in.stride >> 2;
-	src_vir_info.data.vir_width = ctx->in.stride >> 2;
+	in_stride = ctx->in.pix.plane_fmt[0].bytesperline;
+	src_vir_info.data.vir_stride = in_stride >> 2;
+	src_vir_info.data.vir_width = in_stride >> 2;
 
 	src_act_info.data.act_height = src_h - 1;
 	src_act_info.data.act_width = src_w - 1;
 
-	dst_vir_info.data.vir_stride = ctx->out.stride >> 2;
+	out_stride = ctx->out.pix.plane_fmt[0].bytesperline;
+	dst_vir_info.data.vir_stride = out_stride >> 2;
 	dst_act_info.data.act_height = dst_h - 1;
 	dst_act_info.data.act_width = dst_w - 1;
 
@@ -481,97 +485,81 @@ static struct rga_fmt formats[] = {
 		.fourcc = V4L2_PIX_FMT_ARGB32,
 		.color_swap = RGA_COLOR_ALPHA_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
-		.depth = 32,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_ABGR32,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR8888,
-		.depth = 32,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_XBGR32,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_XBGR8888,
-		.depth = 32,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_RGB24,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
-		.depth = 24,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_BGR24,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_RGB888,
-		.depth = 24,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_ARGB444,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR4444,
-		.depth = 16,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_ARGB555,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_ABGR1555,
-		.depth = 16,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_RGB565,
 		.color_swap = RGA_COLOR_RB_SWAP,
 		.hw_format = RGA_COLOR_FMT_BGR565,
-		.depth = 16,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV21,
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
-		.depth = 12,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV61,
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
-		.depth = 16,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
-		.depth = 12,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV12M,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420SP,
-		.depth = 12,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_NV16,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422SP,
-		.depth = 16,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_YUV420,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
-		.depth = 12,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_YUV422P,
 		.color_swap = RGA_COLOR_NONE_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV422P,
-		.depth = 16,
 	},
 	{
 		.fourcc = V4L2_PIX_FMT_YVU420,
 		.color_swap = RGA_COLOR_UV_SWAP,
 		.hw_format = RGA_COLOR_FMT_YUV420P,
-		.depth = 12,
 	},
 };
 
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index e44e81814b7cb..e52d0577b236c 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -267,8 +267,6 @@ static int rga_open(struct file *file)
 		.fmt = &rga->hw->formats[0],
 	};
 
-	def_frame.stride = (def_width * def_frame.fmt->depth) >> 3;
-
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
@@ -481,7 +479,6 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
 	frm->fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
-	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
 
 	/*
 	 * Copy colorimetry from output to capture as required by the
@@ -507,7 +504,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
 		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
 		  &frm->fmt->fourcc, pix_fmt->width, pix_fmt->height,
-		  frm->stride);
+		  pix_fmt->plane_fmt[0].bytesperline);
 
 	for (i = 0; i < pix_fmt->num_planes; i++) {
 		v4l2_dbg(debug, 1, &rga->v4l2_dev,
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index d47c6821ce2c9..227ab6c0532c2 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -19,7 +19,6 @@
 
 struct rga_fmt {
 	u32 fourcc;
-	int depth;
 	u8 color_swap;
 	u8 hw_format;
 };
@@ -31,9 +30,6 @@ struct rga_frame {
 	/* Image format */
 	struct rga_fmt *fmt;
 	struct v4l2_pix_format_mplane pix;
-
-	/* Variables that can calculated once and reused */
-	u32 stride;
 };
 
 struct rga_dma_desc {

-- 
2.54.0


