Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C1D109C027
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yERvGj4+hNBBP/TB2QZfrjKJsxBO7iD+bmxyMw2TwUE=; b=R1dBkEltBd9v72QpnNcFSgug7X
	XpD6n5wrMWRkQ7DfecUvEqs238uyIp67hIiFfe0XGcIOa0PYjsNYdczOym4r9XjSlHCzTA8mVB1Ut
	/jvZHi/6UiaQJe2ogZ4tVXPsEKBAEQwmJzHXxzpn4PniRhLfUuVaXDR16A39HqEGfjpeokpsPvyEC
	DY+6CZGAtv93EFQj3kNGrn2CRj/kzPji/mFjhYW4kAAUnmebIZs/U9vPIvLQLLjw5c0/ceotB6kCm
	Kn85/Gk56oL1uQDqTk1lLGgetAGFkMqT2Eh1L+N4fU85aoqbTqreY3ekByu1FZJri5EL++iOmrHqh
	i5VEO8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PaI-00000003gjf-1hbT;
	Wed, 25 Mar 2026 14:51:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZh-00000003fdW-24Eg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Mar 2026 14:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yERvGj4+hNBBP/TB2QZfrjKJsxBO7iD+bmxyMw2TwUE=; b=ZyEq6Ox85qRBdFM20a377JFSEs
	DGtjcBjMkEYW6wDGEkpQaEnsP4BNiO+eXNmTu65bK5Eexf/SqoH5sGehtcS323/IJ8Xo2icUHHvNd
	fuHnrD8iEBU1g058mTfebOoeL64Yo3vkIzxbY2cRqu2ZDrAUF1Hg8yhAFPvfjSH1Nh8wICCWNur7v
	/vN/wvaBtefCa3Gw64pwf/0yKp1Jdy9RfBQYWwcZbpzizoTs1xH6Pzot+aubBNRtUMxMARmiJGzbq
	ajkALxab3mly1kwijrnnX12oIdUnpXHShcmW9hm/m8idIwPVgmyc75vXcP4i/fX4wfQGx3yQKw2Ri
	ixs2o5aQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZb-00000006OYL-3KAn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:51:12 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w5PZT-00050C-K4; Wed, 25 Mar 2026 15:50:59 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 25 Mar 2026 15:50:39 +0100
Subject: [PATCH v4 08/27] media: rockchip: rga: remove redundant rga_frame
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-spu-rga3-v4-8-e90ec1c61354@pengutronix.de>
References: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
In-Reply-To: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_145108_079274_503DB644 
X-CRM114-Status: GOOD (  17.36  )
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
index c07207edffdb6..ca8d8a53dc251 100644
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
2.53.0


