Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F5CD15D88
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NptWsbp39CWS00Kmm8nsZN7jJw3cFG/I+I2bpkm5hXA=; b=l+UwV07npE0wQlhzbyW71ss8MF
	LGN7UCyb7Tq1FVokREkz5QEH28i6mwuWsqV+B+XNZ8hH/bkKRWhqw1tRwqA2PcxzQUtbAF3qknudK
	wd7OAwD67pimw/fdPuYJkwAWMLsfifLzHSAh5K4ue2T5iQs31wCV0JFOuwFHXLhzEujGaGz0Fp6Vc
	k8CvS6L8NiqHMlXQiy6UgCPYRv3dx2AQ9TNfR1K7O8iC5OvXOcbPJmoqV2nr7XX7kzNhfpfvEHcIs
	RsoRIn/J3SosRGk8bg6bGgcnDydqehwMuorSKJl0iKJ+7Hz5FN6AdKmHgCIZ0D0CSvOdn+twwsSTk
	UB7rgh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAy-00000006jRu-2u7y;
	Wed, 03 Dec 2025 15:53:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAm-00000006j91-3GKm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Dec 2025 15:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NptWsbp39CWS00Kmm8nsZN7jJw3cFG/I+I2bpkm5hXA=; b=Ql6oaJ5PMXFLj/coOjcKSfTeoM
	TtVmOAs/jo/9612k3wxx4FSzZmM4PK1vqN8NZk+B4s5dr7VNzrbFSTIOmyFI7lEZVLSvFCGP8edwo
	tRQNL9yBxzLqnoJFGA9kXJ+61jLhTjC4mvNy0ieQUaYopYKw8jQhsSWcUkrt4cim8RjvOYRpuj0yS
	LpN5CITokdCuvAzbYLizwcXsQnAmxo2IrPXE+4FtYXT7UQdBaRlybQ8DVUuG3XOlxXMhu40g6s+5q
	LbAEriSZDAJhpSF5gR/obDMSpb3AMWvp8J5jYgjhCb/tXKLZWUjKKZsGX5b03AYmexNE4uyn1rhw1
	n/rTGTBA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQoJA-00000002TB6-3VNN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 14:58:23 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQpAe-0007dW-HJ; Wed, 03 Dec 2025 16:53:36 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 03 Dec 2025 16:52:40 +0100
Subject: [PATCH v2 18/22] media: rockchip: rga: move rga_fmt to rga-hw.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251203-spu-rga3-v2-18-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
In-Reply-To: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_145821_169287_D94246A5 
X-CRM114-Status: GOOD (  27.85  )
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

Move rga_fmt to rga-hw in preparation of the RGA3 addition, as the struct
contains many RGA2 specific values. They are used to write the correct
register values quickly based on the chosen format. Therefore the
pointer to the rga_fmt struct is kept but changed to an opaque void
pointer outside of the rga-hw.h.

To enumerate and set the correct formats, two helper functions need to
be exposed in the rga_hw struct:

enum_format just get's the vidioc_enum_fmt format and it's return value
is also returned from vidioc_enum_fmt. This is a simple pass-through,
as the implementation is very simple.

adjust_and_map_format is a simple abstraction around the previous
rga_find_format. But unlike rga_find_format, it always returns a valid
format. Therefore the passed format value is also a pointer to update
it in case the values are not supported by the hardware.
Due to the RGA3 supporting different formats on the capture and output
side, an additional parameter is_capture has been added to support
this use-case.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c |  2 +-
 drivers/media/platform/rockchip/rga/rga-hw.c  | 53 +++++++++++++++++++++------
 drivers/media/platform/rockchip/rga/rga-hw.h  | 12 ++++++
 drivers/media/platform/rockchip/rga/rga.c     | 38 +++++--------------
 drivers/media/platform/rockchip/rga/rga.h     | 17 ++-------
 5 files changed, 68 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 8de6b9c3fd615..b0f226f7f06d9 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -158,7 +158,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
 	}
 
 	/* Fill the remaining planes */
-	info = v4l2_format_info(f->fmt->fourcc);
+	info = v4l2_format_info(f->pix.pixelformat);
 	for (i = info->mem_planes; i < info->comp_planes; i++)
 		dma_addrs[i] = dma_addrs[0] + get_plane_offset(f, info, i);
 
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 4dee33d8f7206..a868a34a1452e 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -44,14 +44,15 @@ rga_get_corner_addrs(struct rga_frame *frm, struct rga_addrs *addrs,
 	struct rga_addrs *lt, *lb, *rt, *rb;
 	unsigned int x_div = 0,
 		     y_div = 0, y_stride = 0, uv_stride = 0, pixel_width = 0;
+	struct rga_fmt *fmt = frm->fmt;
 
 	lt = &corner_addrs.left_top;
 	lb = &corner_addrs.left_bottom;
 	rt = &corner_addrs.right_top;
 	rb = &corner_addrs.right_bottom;
 
-	x_div = frm->fmt->x_div;
-	y_div = frm->fmt->y_div;
+	x_div = fmt->x_div;
+	y_div = fmt->y_div;
 	y_stride = frm->pix.plane_fmt[0].bytesperline;
 	uv_stride = y_stride / x_div;
 	pixel_width = y_stride / frm->pix.width;
@@ -162,6 +163,8 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	union rga_dst_vir_info dst_vir_info;
 	union rga_dst_act_info dst_act_info;
 	u32 in_stride, out_stride;
+	struct rga_fmt *in_fmt = ctx->in.fmt;
+	struct rga_fmt *out_fmt = ctx->out.fmt;
 
 	src_h = ctx->in.crop.height;
 	src_w = ctx->in.crop.width;
@@ -177,18 +180,18 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	dst_vir_info.val = dest[(RGA_DST_VIR_INFO - RGA_MODE_BASE_REG) >> 2];
 	dst_act_info.val = dest[(RGA_DST_ACT_INFO - RGA_MODE_BASE_REG) >> 2];
 
-	src_info.data.format = ctx->in.fmt->hw_format;
-	src_info.data.swap = ctx->in.fmt->color_swap;
-	dst_info.data.format = ctx->out.fmt->hw_format;
-	dst_info.data.swap = ctx->out.fmt->color_swap;
+	src_info.data.format = in_fmt->hw_format;
+	src_info.data.swap = in_fmt->color_swap;
+	dst_info.data.format = out_fmt->hw_format;
+	dst_info.data.swap = out_fmt->color_swap;
 
 	/*
 	 * CSC mode must only be set when the colorspace families differ between
 	 * input and output. It must remain unset (zeroed) if both are the same.
 	 */
 
-	if (RGA_COLOR_FMT_IS_YUV(ctx->in.fmt->hw_format) &&
-	    RGA_COLOR_FMT_IS_RGB(ctx->out.fmt->hw_format)) {
+	if (RGA_COLOR_FMT_IS_YUV(in_fmt->hw_format) &&
+	    RGA_COLOR_FMT_IS_RGB(out_fmt->hw_format)) {
 		switch (ctx->in.pix.colorspace) {
 		case V4L2_COLORSPACE_REC709:
 			src_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
@@ -199,8 +202,8 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 		}
 	}
 
-	if (RGA_COLOR_FMT_IS_RGB(ctx->in.fmt->hw_format) &&
-	    RGA_COLOR_FMT_IS_YUV(ctx->out.fmt->hw_format)) {
+	if (RGA_COLOR_FMT_IS_RGB(in_fmt->hw_format) &&
+	    RGA_COLOR_FMT_IS_YUV(out_fmt->hw_format)) {
 		switch (ctx->out.pix.colorspace) {
 		case V4L2_COLORSPACE_REC709:
 			dst_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
@@ -619,11 +622,35 @@ static struct rga_fmt formats[] = {
 	},
 };
 
+static void *rga_adjust_and_map_format(struct v4l2_pix_format_mplane *format,
+				       bool is_output)
+{
+	unsigned int i;
+
+	if (!format)
+		return &formats[0];
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++) {
+		if (formats[i].fourcc == format->pixelformat)
+			return &formats[i];
+	}
+
+	format->pixelformat = formats[0].fourcc;
+	return &formats[0];
+}
+
+static int rga_enum_format(struct v4l2_fmtdesc *f)
+{
+	if (f->index >= ARRAY_SIZE(formats))
+		return -EINVAL;
+
+	f->pixelformat = formats[f->index].fourcc;
+	return 0;
+}
+
 const struct rga_hw rga2_hw = {
 	.card_type = "rga2",
 	.has_internal_iommu = true,
-	.formats = formats,
-	.num_formats = ARRAY_SIZE(formats),
 	.cmdbuf_size = RGA_CMDBUF_SIZE,
 	.min_width = MIN_WIDTH,
 	.max_width = MAX_WIDTH,
@@ -636,4 +663,6 @@ const struct rga_hw rga2_hw = {
 	.start = rga_hw_start,
 	.handle_irq = rga_handle_irq,
 	.get_version = rga_get_version,
+	.adjust_and_map_format = rga_adjust_and_map_format,
+	.enum_format = rga_enum_format,
 };
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
index fffcab0131225..3bc4b1f5acba2 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.h
+++ b/drivers/media/platform/rockchip/rga/rga-hw.h
@@ -6,6 +6,8 @@
 #ifndef __RGA_HW_H__
 #define __RGA_HW_H__
 
+#include <linux/types.h>
+
 #define RGA_CMDBUF_SIZE 0x20
 
 /* Hardware limits */
@@ -431,4 +433,14 @@ union rga_pat_con {
 	} data;
 };
 
+struct rga_fmt {
+	u32 fourcc;
+	int depth;
+	u8 uv_factor;
+	u8 y_div;
+	u8 x_div;
+	u8 color_swap;
+	u8 hw_format;
+};
+
 #endif
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 7e30fafb25fab..c991cc64b4b7f 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -185,17 +185,6 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
 	return 0;
 }
 
-static struct rga_fmt *rga_fmt_find(struct rockchip_rga *rga, u32 pixelformat)
-{
-	unsigned int i;
-
-	for (i = 0; i < rga->hw->num_formats; i++) {
-		if (rga->hw->formats[i].fourcc == pixelformat)
-			return &rga->hw->formats[i];
-	}
-	return NULL;
-}
-
 struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type)
 {
 	if (V4L2_TYPE_IS_OUTPUT(type))
@@ -217,7 +206,6 @@ static int rga_open(struct file *file)
 		.crop.top = 0,
 		.crop.width = def_width,
 		.crop.height = def_height,
-		.fmt = &rga->hw->formats[0],
 	};
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
@@ -238,9 +226,11 @@ static int rga_open(struct file *file)
 	ctx->in = def_frame;
 	ctx->out = def_frame;
 
-	v4l2_fill_pixfmt_mp_aligned(&ctx->in.pix, ctx->in.fmt->fourcc,
+	ctx->in.fmt = rga->hw->adjust_and_map_format(&ctx->in.pix, true);
+	v4l2_fill_pixfmt_mp_aligned(&ctx->in.pix, ctx->in.pix.pixelformat,
 				    def_width, def_height, rga->hw->stride_alignment);
-	v4l2_fill_pixfmt_mp_aligned(&ctx->out.pix, ctx->out.fmt->fourcc,
+	ctx->out.fmt = rga->hw->adjust_and_map_format(&ctx->out.pix, false);
+	v4l2_fill_pixfmt_mp_aligned(&ctx->out.pix, ctx->out.pix.pixelformat,
 				    def_width, def_height, rga->hw->stride_alignment);
 
 	if (mutex_lock_interruptible(&rga->mutex)) {
@@ -322,15 +312,8 @@ vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 {
 	struct rockchip_rga *rga = video_drvdata(file);
-	struct rga_fmt *fmt;
 
-	if (f->index >= rga->hw->num_formats)
-		return -EINVAL;
-
-	fmt = &rga->hw->formats[f->index];
-	f->pixelformat = fmt->fourcc;
-
-	return 0;
+	return rga->hw->enum_format(f);
 }
 
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
@@ -355,15 +338,13 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct rga_ctx *ctx = file_to_rga_ctx(file);
 	struct rockchip_rga *rga = ctx->rga;
 	const struct rga_hw *hw = rga->hw;
-	struct rga_fmt *fmt;
 	u32 min_width = hw->min_width;
 	u32 max_width = hw->max_width;
 	u32 min_height = hw->min_height;
 	u32 max_height = hw->max_height;
 
-	fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
-	if (!fmt)
-		fmt = &hw->formats[0];
+	hw->adjust_and_map_format(pix_fmt,
+				  V4L2_TYPE_IS_OUTPUT(f->type));
 
 	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
 	    v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming) {
@@ -425,7 +406,8 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm = rga_get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-	frm->fmt = rga_fmt_find(rga, pix_fmt->pixelformat);
+	frm->fmt = rga->hw->adjust_and_map_format(pix_fmt,
+						  V4L2_TYPE_IS_OUTPUT(f->type));
 
 	/* Reset crop settings */
 	frm->crop.left = 0;
@@ -438,7 +420,7 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	v4l2_dbg(debug, 1, &rga->v4l2_dev,
 		 "[%s] fmt - %p4cc %dx%d (stride %d)\n",
 		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
-		  &frm->fmt->fourcc, pix_fmt->width, pix_fmt->height,
+		  &pix_fmt->pixelformat, pix_fmt->width, pix_fmt->height,
 		  pix_fmt->plane_fmt[0].bytesperline);
 
 	for (i = 0; i < pix_fmt->num_planes; i++) {
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index a7f891b94a478..980f70f842317 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -17,22 +17,12 @@
 #define DEFAULT_WIDTH 100
 #define DEFAULT_HEIGHT 100
 
-struct rga_fmt {
-	u32 fourcc;
-	int depth;
-	u8 uv_factor;
-	u8 y_div;
-	u8 x_div;
-	u8 color_swap;
-	u8 hw_format;
-};
-
 struct rga_frame {
 	/* Crop */
 	struct v4l2_rect crop;
 
 	/* Image format */
-	struct rga_fmt *fmt;
+	void *fmt;
 	struct v4l2_pix_format_mplane pix;
 };
 
@@ -145,8 +135,6 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 struct rga_hw {
 	const char *card_type;
 	bool has_internal_iommu;
-	struct rga_fmt *formats;
-	u32 num_formats;
 	size_t cmdbuf_size;
 	u32 min_width, min_height;
 	u32 max_width, max_height;
@@ -158,6 +146,9 @@ struct rga_hw {
 		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
 	bool (*handle_irq)(struct rockchip_rga *rga);
 	void (*get_version)(struct rockchip_rga *rga);
+	void *(*adjust_and_map_format)(struct v4l2_pix_format_mplane *format,
+				       bool is_output);
+	int (*enum_format)(struct v4l2_fmtdesc *f);
 };
 
 static inline bool rga_has_internal_iommu(const struct rockchip_rga *rga)

-- 
2.52.0


