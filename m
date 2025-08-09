Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC61C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 21:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miZPlBLdx1vOyGu9jvpSEQ4cWqxJcEyv3giJOq/eiMA=; b=RqhMjaCC0M/9lj1W5eMp1rP8Kh
	9aoM18Jg0IC6752YGem/RNLEbMJZAKkuyOKzPH009OcIv3ruXiA1BYiQySAGbsPEbCbID25OGz9oB
	Qtm9fsBSADWV/LsWsoXfy36jiWxSxFH0lbRz2KFC/qkDbHdPHurlGYHQmgno1ivonGPh4c7wIGNX0
	Dnl5M91EkAqJVWRKc4gKftcW0igyRiev5JoQkikGsau+5c74+ZzweLRfMr09bBxzTIkH2ohuGF1kU
	Wy6JvJzqA4RjLaufYCdQCgk5lDmmPKT4/KqCV27Dd/RSr84g0scwO5QjbandxBEFUg4fVIul+NmGa
	o4BKqgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukraF-00000004yuP-3Udz;
	Sat, 09 Aug 2025 21:58:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukqxj-00000004vvX-2qNU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 21:18:48 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B91A6162B;
	Sat,  9 Aug 2025 23:17:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774275;
	bh=Mxd2mSbeF4bs69HYy7o/QbBRt6eGtBubrq/fYOZXaVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CtZvurcqwrNKYtTyjpXBysvAcwe87jUZKJjeCNG/Q6IOpUAGa0mWKUcSnztwQ6fPx
	 Ey20WP5ZEaUJqcPa6pTKeNPpFm9T4mCRtobGLtx047QWK1ZzdaoHzCLK4jsJ0FCgmw
	 3T2wL7eyil+SN5d06969Oi8DdyrXgdx4lPRtIRO0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 57/76] media: s5p-mfc: Store s5p_mfc_ctx in vb2_queue.drv_priv
Date: Sun, 10 Aug 2025 00:16:34 +0300
Message-ID: <20250809211654.28887-58-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_141847_858979_C984409D 
X-CRM114-Status: GOOD (  13.03  )
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

The driver stores a pointer to a v4l2_fh in the vb2_queue.drv_priv,
which it then has to cast to a s5p_mfc_ctx pointer in all vb2 queue
operations. Store the pointer to the s5p_mfc_ctx instead to avoid the
cast. While at it, use the vb2_get_drv_priv() helper to access the
field.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c     |  4 ++--
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c | 10 +++++-----
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index a5e756049620..4948d734eb02 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -876,7 +876,7 @@ static int s5p_mfc_open(struct file *file)
 	/* Init videobuf2 queue for CAPTURE */
 	q = &ctx->vq_dst;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	q->drv_priv = &ctx->fh;
+	q->drv_priv = ctx;
 	q->lock = &dev->mfc_mutex;
 	if (vdev == dev->vfd_dec) {
 		q->io_modes = VB2_MMAP;
@@ -903,7 +903,7 @@ static int s5p_mfc_open(struct file *file)
 	/* Init videobuf2 queue for OUTPUT */
 	q = &ctx->vq_src;
 	q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
-	q->drv_priv = &ctx->fh;
+	q->drv_priv = ctx;
 	q->lock = &dev->mfc_mutex;
 	if (vdev == dev->vfd_dec) {
 		q->io_modes = VB2_MMAP;
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
index 3efbc3367906..aefa6da5c609 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
@@ -937,7 +937,7 @@ static int s5p_mfc_queue_setup(struct vb2_queue *vq,
 			unsigned int *plane_count, unsigned int psize[],
 			struct device *alloc_devs[])
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	const struct v4l2_format_info *format;
 
@@ -1006,7 +1006,7 @@ static int s5p_mfc_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct vb2_queue *vq = vb->vb2_queue;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	unsigned int i;
 
 	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
@@ -1068,7 +1068,7 @@ static int s5p_mfc_buf_init(struct vb2_buffer *vb)
 
 static int s5p_mfc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(q->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(q);
 	struct s5p_mfc_dev *dev = ctx->dev;
 
 	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
@@ -1085,7 +1085,7 @@ static int s5p_mfc_start_streaming(struct vb2_queue *q, unsigned int count)
 static void s5p_mfc_stop_streaming(struct vb2_queue *q)
 {
 	unsigned long flags;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(q->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(q);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	int aborted = 0;
 
@@ -1130,7 +1130,7 @@ static void s5p_mfc_stop_streaming(struct vb2_queue *q)
 static void s5p_mfc_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_queue *vq = vb->vb2_queue;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	unsigned long flags;
 	struct s5p_mfc_buf *mfc_buf;
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
index 6c603dcd5664..9b77dbd856e7 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
@@ -2418,7 +2418,7 @@ static int s5p_mfc_queue_setup(struct vb2_queue *vq,
 			unsigned int *buf_count, unsigned int *plane_count,
 			unsigned int psize[], struct device *alloc_devs[])
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	struct s5p_mfc_dev *dev = ctx->dev;
 
 	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
@@ -2477,7 +2477,7 @@ static int s5p_mfc_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct vb2_queue *vq = vb->vb2_queue;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	unsigned int i;
 	int ret;
 
@@ -2516,7 +2516,7 @@ static int s5p_mfc_buf_init(struct vb2_buffer *vb)
 static int s5p_mfc_buf_prepare(struct vb2_buffer *vb)
 {
 	struct vb2_queue *vq = vb->vb2_queue;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	int ret;
 
 	if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
@@ -2557,7 +2557,7 @@ static int s5p_mfc_buf_prepare(struct vb2_buffer *vb)
 
 static int s5p_mfc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(q->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(q);
 	struct s5p_mfc_dev *dev = ctx->dev;
 
 	if (IS_MFCV6_PLUS(dev) &&
@@ -2588,7 +2588,7 @@ static int s5p_mfc_start_streaming(struct vb2_queue *q, unsigned int count)
 static void s5p_mfc_stop_streaming(struct vb2_queue *q)
 {
 	unsigned long flags;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(q->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(q);
 	struct s5p_mfc_dev *dev = ctx->dev;
 
 	if ((ctx->state == MFCINST_FINISHING ||
@@ -2617,7 +2617,7 @@ static void s5p_mfc_stop_streaming(struct vb2_queue *q)
 static void s5p_mfc_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_queue *vq = vb->vb2_queue;
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(vq->drv_priv);
+	struct s5p_mfc_ctx *ctx = vb2_get_drv_priv(vq);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	unsigned long flags;
 	struct s5p_mfc_buf *mfc_buf;
-- 
Regards,

Laurent Pinchart


