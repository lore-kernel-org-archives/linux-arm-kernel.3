Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97ACC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 21:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6uAk+OwnqqcFGu0HejJdV2yCVgc1kZMiGF6XxJ+Hhs=; b=V+jkrTH8i9RUWzK+M1McF3IJfQ
	yNXnZWCxYPZhOgiPW/HPnv3wqtnaq7b6BJXwBNIJ8JTzHKvu8ukmrlsK4HIsxo+uOUtjAfZ8W6HWJ
	gx36mW+42/lKOkq5oR14TphEdMjXxIJ3tuyZfhGfKgwy5Y7AiTrr2Ez9b67vFghIbpSiNH5eo56ww
	OJbhwPsnxkPZOxwT3T8YAeeomY0cKU7CCGJLlgJMv9DPu4SNbK1QAqsrSpD2vt4kjk5k4JVT0YvxR
	MhiGrNVBVP69svp9XUHps1VBrCerr+qMX4xmtfQaJ2DGg0MSjU64RNYwIo16iE6YaUmZ+BqeGTWYJ
	JFidawLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukrXm-00000004ykY-04bj;
	Sat, 09 Aug 2025 21:56:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqxi-00000004vuv-0UP4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 21:18:47 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 27946502;
	Sat,  9 Aug 2025 23:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774274;
	bh=wo5NKGaetHKlFIyopd6naw1ltpha/XckyBihK5e7a2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kw3waXLOGNj76PNveWGPyPxKByAfWkx/AsizDNDZE6VIBcC6eSRiRBZqPaItTVZwq
	 kIF5uUqnRh69MHnWwEeQQc7Mp+7ahKa436oPMBtr1S7UY81Jyz6K+ibsrgV9vYhLNr
	 81tunb/LzieweRLb0jncX6RajVoDxLdH1jQ41bmA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 56/76] media: s5p-jpeg: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:33 +0300
Message-ID: <20250809211654.28887-57-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141846_296857_E598C1CE 
X-CRM114-Status: GOOD (  10.96  )
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 .../platform/samsung/s5p-jpeg/jpeg-core.c     | 27 ++++++++-----------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
index 65f256db4c76..81792f7f8b16 100644
--- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
@@ -580,14 +580,9 @@ static inline struct s5p_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *c)
 	return container_of(c->handler, struct s5p_jpeg_ctx, ctrl_handler);
 }
 
-static inline struct s5p_jpeg_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct s5p_jpeg_ctx, fh);
-}
-
 static inline struct s5p_jpeg_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct s5p_jpeg_ctx, fh);
 }
 
 static int s5p_jpeg_to_user_subsampling(struct s5p_jpeg_ctx *ctx)
@@ -1015,8 +1010,8 @@ static int s5p_jpeg_open(struct file *file)
 
 static int s5p_jpeg_release(struct file *file)
 {
-	struct s5p_jpeg *jpeg = video_drvdata(file);
 	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
+	struct s5p_jpeg *jpeg = video_drvdata(file);
 
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
@@ -1253,7 +1248,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
 static int s5p_jpeg_querycap(struct file *file, void *priv,
 			   struct v4l2_capability *cap)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->mode == S5P_JPEG_ENCODE) {
 		strscpy(cap->driver, S5P_JPEG_M2M_NAME,
@@ -1301,7 +1296,7 @@ static int enum_fmt(struct s5p_jpeg_ctx *ctx,
 static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->mode == S5P_JPEG_ENCODE)
 		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
@@ -1314,7 +1309,7 @@ static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 static int s5p_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->mode == S5P_JPEG_ENCODE)
 		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
@@ -1340,7 +1335,7 @@ static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct vb2_queue *vq;
 	struct s5p_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format *pix = &f->fmt.pix;
-	struct s5p_jpeg_ctx *ct = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ct = file_to_ctx(file);
 
 	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
 	if (!vq)
@@ -1480,7 +1475,7 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct s5p_jpeg_fmt *fmt,
 static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 	struct v4l2_pix_format *pix = &f->fmt.pix;
 	struct s5p_jpeg_fmt *fmt;
 	int ret;
@@ -1539,7 +1534,7 @@ static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 static int s5p_jpeg_try_fmt_vid_out(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 	struct s5p_jpeg_fmt *fmt;
 
 	fmt = s5p_jpeg_find_format(ctx, f->fmt.pix.pixelformat,
@@ -1686,7 +1681,7 @@ static int s5p_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
+	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
 }
 
 static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
@@ -1698,7 +1693,7 @@ static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
+	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
 }
 
 static int s5p_jpeg_subscribe_event(struct v4l2_fh *fh,
@@ -1795,7 +1790,7 @@ static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
 static int s5p_jpeg_g_selection(struct file *file, void *priv,
 			 struct v4l2_selection *s)
 {
-	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
-- 
Regards,

Laurent Pinchart


