Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8D7C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZio5ihiewdQc3eivALge5UGavX8m/SbEzMOo86p8KQ=; b=X3M6f2KVWUmPj6VM72wpuiou/n
	v5GGZMYv2GmkoX6s60tL1HNID3jrC7qb3cxlHkk6tN51NaDaXOp5GWIWVIlJ1fulBvbDa9dqfN2Rq
	LMQrvgB0se0aX4Om2U1AswquyEa4UODHVFicPds0Bl4NW0Q8yC3dtlZASOLMGALxlgS6sUNaniaCf
	HqRKJmA1xIs5LBDjdkwLHPmxBonUMSmsJ4k34CFZYtZJZkgAY1Sh1Q4eBYzMYTHXz/UPSq81KU8PR
	uXfsq0rrBFakWl9c4lP+Su9SYBRQPNRsN4347M8Lxq6L9xg0LccqtireEFxvOzAydB0cL19Whh/HI
	4NHtnIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukrck-00000004z2n-2YjU;
	Sat, 09 Aug 2025 22:01:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqxl-00000004vvw-0qJA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 21:18:50 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3C7831440;
	Sat,  9 Aug 2025 23:17:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774277;
	bh=N7cq/K5euvXenMdMQutvAiyMmRVmUCAEvZOhL7pPZdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RQLEhiSP8XhhQ/Z+MsLrdn9MpFs2i1jAiNZmqcZ/wsyqg9KiYrDb+f90Pl9sV5Ura
	 GmCfOloFcoPHsInQy96nokin1mwDexUwfmHevcPpLPOaYFZZ4SNA3on472k36ZTIcm
	 Qp3+nsGh7QmlUUqVwEeXWH0+4CHkRX2jNbuK/fl8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 58/76] media: s5p-mfc: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:35 +0300
Message-ID: <20250809211654.28887-59-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141849_381643_E8F1D5C8 
X-CRM114-Status: GOOD (  13.27  )
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
---
Changes since v1:

- Drop fh_to_ctx() macro
---
 .../platform/samsung/s5p-mfc/s5p_mfc_common.h |  4 +---
 .../platform/samsung/s5p-mfc/s5p_mfc_dec.c    | 22 ++++++++---------
 .../platform/samsung/s5p-mfc/s5p_mfc_enc.c    | 24 +++++++++----------
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
index a29228b4207f..58dc1768082c 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h
@@ -767,11 +767,9 @@ struct mfc_control {
 #define s5p_mfc_hw_call(f, op, args...) \
 	((f && f->op) ? f->op(args) : (typeof(f->op(args)))(-ENODEV))
 
-#define fh_to_ctx(__fh) container_of(__fh, struct s5p_mfc_ctx, fh)
-
 static inline struct s5p_mfc_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct s5p_mfc_ctx, fh);
 }
 
 #define ctrl_to_ctx(__ctrl) \
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
index aefa6da5c609..606e1a7121b5 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
@@ -345,7 +345,7 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 /* Get format */
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct v4l2_pix_format_mplane *pix_mp;
 
 	mfc_debug_enter();
@@ -442,7 +442,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 	struct v4l2_pix_format_mplane *pix_mp;
 	const struct s5p_mfc_buf_size *buf_size = dev->variant->buf_size;
@@ -598,7 +598,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 					  struct v4l2_requestbuffers *reqbufs)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (reqbufs->memory != V4L2_MEMORY_MMAP) {
 		mfc_debug(2, "Only V4L2_MEMORY_MMAP is supported\n");
@@ -619,7 +619,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 static int vidioc_querybuf(struct file *file, void *priv,
 						   struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret;
 	int i;
 
@@ -647,7 +647,7 @@ static int vidioc_querybuf(struct file *file, void *priv,
 /* Queue a buffer */
 static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->state == MFCINST_ERROR) {
 		mfc_err("Call on QBUF after unrecoverable error\n");
@@ -666,7 +666,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 	const struct v4l2_event ev = {
 		.type = V4L2_EVENT_EOS
 	};
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	if (ctx->state == MFCINST_ERROR) {
@@ -695,7 +695,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 static int vidioc_expbuf(struct file *file, void *priv,
 	struct v4l2_exportbuffer *eb)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (eb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_expbuf(&ctx->vq_src, eb);
@@ -708,7 +708,7 @@ static int vidioc_expbuf(struct file *file, void *priv,
 static int vidioc_streamon(struct file *file, void *priv,
 			   enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = -EINVAL;
 
 	mfc_debug_enter();
@@ -724,7 +724,7 @@ static int vidioc_streamon(struct file *file, void *priv,
 static int vidioc_streamoff(struct file *file, void *priv,
 			    enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_streamoff(&ctx->vq_src, type);
@@ -801,7 +801,7 @@ static const struct v4l2_ctrl_ops s5p_mfc_dec_ctrl_ops = {
 static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	u32 left, right, top, bottom;
 	u32 width, height;
@@ -856,7 +856,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 static int vidioc_decoder_cmd(struct file *file, void *priv,
 			      struct v4l2_decoder_cmd *cmd)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	struct s5p_mfc_buf *buf;
 	unsigned long flags;
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
index 9b77dbd856e7..694b68788a95 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
@@ -1389,8 +1389,8 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	mfc_debug(2, "f->type = %d ctx->state = %d\n", f->type, ctx->state);
 	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
@@ -1472,8 +1472,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 
 static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	int ret = 0;
 
@@ -1531,7 +1531,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 					  struct v4l2_requestbuffers *reqbufs)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 
 	/* if memory is not mmp or userptr or dmabuf return error */
@@ -1601,7 +1601,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 static int vidioc_querybuf(struct file *file, void *priv,
 						   struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 
 	/* if memory is not mmp or userptr or dmabuf return error */
@@ -1636,7 +1636,7 @@ static int vidioc_querybuf(struct file *file, void *priv,
 /* Queue a buffer */
 static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->state == MFCINST_ERROR) {
 		mfc_err("Call on QBUF after unrecoverable error\n");
@@ -1657,10 +1657,10 @@ static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 /* Dequeue a buffer */
 static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	const struct v4l2_event ev = {
 		.type = V4L2_EVENT_EOS
 	};
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
 	int ret;
 
 	if (ctx->state == MFCINST_ERROR) {
@@ -1685,7 +1685,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 static int vidioc_expbuf(struct file *file, void *priv,
 	struct v4l2_exportbuffer *eb)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (eb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_expbuf(&ctx->vq_src, eb);
@@ -1698,7 +1698,7 @@ static int vidioc_expbuf(struct file *file, void *priv,
 static int vidioc_streamon(struct file *file, void *priv,
 			   enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_streamon(&ctx->vq_src, type);
@@ -1711,7 +1711,7 @@ static int vidioc_streamon(struct file *file, void *priv,
 static int vidioc_streamoff(struct file *file, void *priv,
 			    enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_streamoff(&ctx->vq_src, type);
@@ -2284,7 +2284,7 @@ static const struct v4l2_ctrl_ops s5p_mfc_enc_ctrl_ops = {
 static int vidioc_s_parm(struct file *file, void *priv,
 			 struct v4l2_streamparm *a)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (a->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		ctx->enc_params.rc_framerate_num =
@@ -2301,7 +2301,7 @@ static int vidioc_s_parm(struct file *file, void *priv,
 static int vidioc_g_parm(struct file *file, void *priv,
 			 struct v4l2_streamparm *a)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (a->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
 		a->parm.output.timeperframe.denominator =
@@ -2318,7 +2318,7 @@ static int vidioc_g_parm(struct file *file, void *priv,
 static int vidioc_encoder_cmd(struct file *file, void *priv,
 			      struct v4l2_encoder_cmd *cmd)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	struct s5p_mfc_buf *buf;
 	unsigned long flags;
-- 
Regards,

Laurent Pinchart


