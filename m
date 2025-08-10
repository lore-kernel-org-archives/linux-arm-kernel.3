Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4011FC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 02:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wU0hSee2lFO39yMm0HN9w0cubQ8+FxBGyZbKUBylFs4=; b=WgdoPuCcP6KW7pg4DaE4y4WdZk
	XZkDNFnkNnMlX45UqVCbV4q3bOlLH/7pfAVqznzgxlL6qy2Ppv9RCHYCdKnpGlMIS+cpewCVv0SSR
	HO1AqIigvQ/80CYoCRa47795sqgffZ+eU8ag0et/XFXHkrNjJIOwo87h4FUvO0mfj1AHa0DXQgvGF
	SQu0jczn0jG4b+72/JtMxN29W6Yto4fYqJ4P9UHUEQxVkMFevr/PnUk6cThQ1zE4Aq0CzpUiwqwcK
	DJhpcEe/T/FvfEH71IM+pGTP9PNtkYY8NJM8O2ejcth4PB/vmpgK+bTC/bqCsYAkNudSdew+ad75X
	s59A6zGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukvVq-00000005AkM-1r2f;
	Sun, 10 Aug 2025 02:10:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukuvf-000000057jo-0nPv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 01:32:56 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1A3817E6;
	Sun, 10 Aug 2025 03:32:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789523;
	bh=jwqlxk4NCB9/9cggY1tcnIIyudxvGHVCX5SraW0cVEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F4WuiE1Ji/IpN0xndc4ogpGE9ISIPTE8cf+KPt+283Zez+Z5gZSSGxyHJz3S416wx
	 NW6YD2pfHuaDbMQcBOZqzxDykg3ZqKb2jFbNEe6BegQS9zngUUd4pSpySSHOuo6hPN
	 sOovHPG9rmWdwMCBZdXXYKdDoJDcPFqllv2J4+Mk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 56/76] media: s5p-jpeg: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:38 +0300
Message-ID: <20250810013100.29776-57-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_183255_371385_CA0BEF8E 
X-CRM114-Status: GOOD (  11.38  )
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

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


