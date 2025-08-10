Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A41C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 02:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bnSCK3cWyPUKgoWQ0Ffs1bZP/+YwxZqwixz0W811us=; b=oNi655tmXeMHSoLe5ZM/WUZ5aG
	MprFKo525VnlphhqBotSYDHaN+V17DuXeORQbRSML4149smUarjF2HgQKW9tcN7TBUuAN6bUZ1g4+
	d9h89IR2qc+NLYIpUaGFkgwhN0D8IbsiZdw4VByp5EMUGzUIWHYZhaVyfanKvu5cjLVA/iO+0ikzQ
	HdzHR+fxUoi+2SsiB84wrdTIsJ6LTS6jZmvuHTF3zb1kIkEPBv6n3L335kuxAtcaMCJBxHb+sQEbu
	MAwP41tE6exyb/aE+gYfBlXiQFnm88ycj78BnWMLkwn3XmYWVyfXpkH6IcZ3Da4z8n03uKqVd0m1+
	dtxUxJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukvYJ-00000005ArZ-1AlS;
	Sun, 10 Aug 2025 02:12:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukuvg-000000057kk-3aOw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 01:32:58 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D126818B9;
	Sun, 10 Aug 2025 03:32:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789525;
	bh=QwRGZ/Pi2MaQpi0no0sbMn5zIZOMJ0XolwJSE9V9Yh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g29x3np3hw7voCROFMH0afuZA1lBKmEpj+FThpQsWn8DiV5nXhbxfwLAsycDgAqB2
	 ztk2bYy5S4k+sOJvbgCmK3J5J1kefAzhR/8PnWbjuk/zUY0hZSoa68qWTgIgQ74kLZ
	 IBne+7azupelXEYUrLZ6+C5+puFmpAIEqc2NXzlU=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 57/76] media: s5p-mfc: Store s5p_mfc_ctx in vb2_queue.drv_priv
Date: Sun, 10 Aug 2025 04:30:39 +0300
Message-ID: <20250810013100.29776-58-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_183257_027472_71E39F06 
X-CRM114-Status: GOOD (  13.20  )
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


