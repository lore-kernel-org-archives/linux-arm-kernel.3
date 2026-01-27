Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E2CD2F03F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edudnAaaVpCh4gHdlA/qSD6x98u6BoHHqgE0/nm/2iI=; b=S9jeJBZjXNgmEa30FKMn/6pO+B
	gKEfqCiq6EN0bi7MQjf/0iBK1ngs4r2G1CEyFSEHzf9lSWUnEjKXzDkvOCNZcXBVz+fGbkRtJxaRh
	aXLUb6jxo5Zq5F2Qy9xCzt+qQktQUsG0AxKmN9nTymTFaBeb3EEiXNkL9uGaxgbIPbC53faDnzdzz
	JUulEnKBaB9Am9lWENS8/tSk4kCpviw4FdHPsW4VWLX2ZkOtqQqJIShQzNU2i8jEIY+AdCLamdkhl
	5qIaIrgqnYfZUAI3gJ90N/Ftt6yhofFufGu+UAhw7pMrozMjX/xDa/RVkRrSOsLi3KXCKddFa/NCd
	MHJnE5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkFl-0000000EQmB-2Xr1;
	Tue, 27 Jan 2026 14:41:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkF3-0000000EQ6f-3r6X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:40:31 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vkkEk-0007YT-Nh; Tue, 27 Jan 2026 15:40:10 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 27 Jan 2026 15:39:17 +0100
Subject: [PATCH v3 08/27] media: rockchip: rga: remove redundant rga_frame
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260127-spu-rga3-v3-8-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
In-Reply-To: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_064030_157922_DB3F004D 
X-CRM114-Status: GOOD (  17.53  )
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

Remove the redundant rga_frame variables width, height and color space.
The value of these variables is already contained in the pix member
of rga_frame. The code also keeps these values in sync. Therefore drop
them in favor of the existing pix member.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-buf.c |  6 ++---
 drivers/media/platform/rockchip/rga/rga-hw.c  |  6 ++---
 drivers/media/platform/rockchip/rga/rga.c     | 32 ++++++++++-----------------
 drivers/media/platform/rockchip/rga/rga.h     |  5 -----
 4 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 65fc0d5b4aa10..ffc6162b2e681 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -103,10 +103,10 @@ static int get_plane_offset(struct rga_frame *f,
 	if (plane == 0)
 		return 0;
 	if (plane == 1)
-		return stride * f->height;
+		return stride * f->pix.height;
 	if (plane == 2)
-		return stride * f->height +
-		       (stride * f->height / info->hdiv / info->vdiv);
+		return stride * f->pix.height +
+		       (stride * f->pix.height / info->hdiv / info->vdiv);
 
 	return -EINVAL;
 }
diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 43ed742a16492..f1d5237472941 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -53,7 +53,7 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
 	x_div = frm->fmt->x_div;
 	y_div = frm->fmt->y_div;
 	uv_stride = frm->stride / x_div;
-	pixel_width = frm->stride / frm->width;
+	pixel_width = frm->stride / frm->pix.width;
 
 	lt->y_off = offset->y_off + y * frm->stride + x * pixel_width;
 	lt->u_off = offset->u_off + (y / y_div) * uv_stride + x / x_div;
@@ -191,7 +191,7 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 
 	if (RGA_COLOR_FMT_IS_YUV(ctx->in.fmt->hw_format) &&
 	    RGA_COLOR_FMT_IS_RGB(ctx->out.fmt->hw_format)) {
-		switch (ctx->in.colorspace) {
+		switch (ctx->in.pix.colorspace) {
 		case V4L2_COLORSPACE_REC709:
 			src_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
 			break;
@@ -203,7 +203,7 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 
 	if (RGA_COLOR_FMT_IS_RGB(ctx->in.fmt->hw_format) &&
 	    RGA_COLOR_FMT_IS_YUV(ctx->out.fmt->hw_format)) {
-		switch (ctx->out.colorspace) {
+		switch (ctx->out.pix.colorspace) {
 		case V4L2_COLORSPACE_REC709:
 			dst_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
 			break;
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index da4d5bec7a0a5..20d1d9cb7625d 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -329,9 +329,6 @@ static struct rga_fmt *rga_fmt_find(u32 pixelformat)
 }
 
 static struct rga_frame def_frame = {
-	.width = DEFAULT_WIDTH,
-	.height = DEFAULT_HEIGHT,
-	.colorspace = V4L2_COLORSPACE_DEFAULT,
 	.crop.left = 0,
 	.crop.top = 0,
 	.crop.width = DEFAULT_WIDTH,
@@ -363,9 +360,9 @@ static int rga_open(struct file *file)
 	ctx->out = def_frame;
 
 	v4l2_fill_pixfmt_mp(&ctx->in.pix,
-			    ctx->in.fmt->fourcc, ctx->out.width, ctx->out.height);
+			    ctx->in.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGHT);
 	v4l2_fill_pixfmt_mp(&ctx->out.pix,
-			    ctx->out.fmt->fourcc, ctx->out.width, ctx->out.height);
+			    ctx->out.fmt->fourcc, DEFAULT_WIDTH, DEFAULT_HEIGHT);
 
 	if (mutex_lock_interruptible(&rga->mutex)) {
 		kfree(ctx);
@@ -453,10 +450,8 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
 
-	v4l2_fill_pixfmt_mp(pix_fmt, frm->fmt->fourcc, frm->width, frm->height);
-
+	*pix_fmt = frm->pix;
 	pix_fmt->field = V4L2_FIELD_NONE;
-	pix_fmt->colorspace = frm->colorspace;
 
 	return 0;
 }
@@ -505,27 +500,24 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	frm = rga_get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-	frm->width = pix_fmt->width;
-	frm->height = pix_fmt->height;
 	frm->size = 0;
 	for (i = 0; i < pix_fmt->num_planes; i++)
 		frm->size += pix_fmt->plane_fmt[i].sizeimage;
 	frm->fmt = rga_fmt_find(pix_fmt->pixelformat);
 	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
-	frm->colorspace = pix_fmt->colorspace;
 
 	/* Reset crop settings */
 	frm->crop.left = 0;
 	frm->crop.top = 0;
-	frm->crop.width = frm->width;
-	frm->crop.height = frm->height;
+	frm->crop.width = pix_fmt->width;
+	frm->crop.height = pix_fmt->height;
 
 	frm->pix = *pix_fmt;
 
 	v4l2_dbg(debug, 1, &rga->v4l2_dev,
 		 "[%s] fmt - %p4cc %dx%d (stride %d, sizeimage %d)\n",
 		  V4L2_TYPE_IS_OUTPUT(f->type) ? "OUTPUT" : "CAPTURE",
-		  &frm->fmt->fourcc, frm->width, frm->height,
+		  &frm->fmt->fourcc, pix_fmt->width, pix_fmt->height,
 		  frm->stride, frm->size);
 
 	for (i = 0; i < pix_fmt->num_planes; i++) {
@@ -579,8 +571,8 @@ static int vidioc_g_selection(struct file *file, void *priv,
 	} else {
 		s->r.left = 0;
 		s->r.top = 0;
-		s->r.width = f->width;
-		s->r.height = f->height;
+		s->r.width = f->pix.width;
+		s->r.height = f->pix.height;
 	}
 
 	return 0;
@@ -629,8 +621,8 @@ static int vidioc_s_selection(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	if (s->r.left + s->r.width > f->width ||
-	    s->r.top + s->r.height > f->height ||
+	if (s->r.left + s->r.width > f->pix.width ||
+	    s->r.top + s->r.height > f->pix.height ||
 	    s->r.width < MIN_WIDTH || s->r.height < MIN_HEIGHT) {
 		v4l2_dbg(debug, 1, &rga->v4l2_dev, "unsupported crop value.\n");
 		return -EINVAL;
@@ -821,8 +813,8 @@ static int rga_probe(struct platform_device *pdev)
 		goto rel_m2m;
 	}
 
-	def_frame.stride = (def_frame.width * def_frame.fmt->depth) >> 3;
-	def_frame.size = def_frame.stride * def_frame.height;
+	def_frame.stride = (DEFAULT_WIDTH * def_frame.fmt->depth) >> 3;
+	def_frame.size = def_frame.stride * DEFAULT_HEIGHT;
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
 	if (ret) {
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 477cf5b62bbb2..c4a3905a48f0d 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -24,11 +24,6 @@ struct rga_fmt {
 };
 
 struct rga_frame {
-	/* Original dimensions */
-	u32 width;
-	u32 height;
-	u32 colorspace;
-
 	/* Crop */
 	struct v4l2_rect crop;
 

-- 
2.52.0


