Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46018C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxLW9a5uIRyLMe0RsHsncn9uy7ea431PLI5WNlQHzzc=; b=wh7avwit26csWBwQqfSWYpMD4J
	oKdrR4WbjKS3fJw1Xtc8JrvlwsFolvQc2GewFYJumEOg95AW6HXi1v5lA27ds7D6zuSKU9OY/NK5C
	rcouDtZIgo/sodm8FMcR7cpvrO0ViHWz2vAH6VJmYx/Ktfq32X9dd7GKj2hX6b6QywIZYyu3IJhyB
	xoQrAXZdE1Qvr6Z/BeKw9qltAHyLd6vDPcbVcOVZJmCiEc8fusGshbuSmF98JdiHgWcpiByatv7v1
	Yb+N4JHQ2RRRsLk2bbWsAfTECB4LZS7eWrdKwylilhKKlebvq7dAuJXGzLrGVQv601LjkmEkldrKi
	MS6ywnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNU-000000082u6-2lrw;
	Thu, 24 Jul 2025 17:05:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewef-00000007hiX-3Ni0;
	Thu, 24 Jul 2025 14:10:43 +0000
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 192281AE0;
	Thu, 24 Jul 2025 16:10:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366201;
	bh=xCWgxUWmumR8zNj2gqTiVA/oEQoilTZsmfWQf+Brozw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FFC/5UcTJ5je+ep01rbYWGenO7M3cg2X6U5P/iHuLmtHmYRU2FED9qBd5Agl+rS1V
	 E5h8Y3CqTnavobCobLHnYDQ04n6+AOWnZ3mlP9MWR0f/M6Vf5X/OlN1b+Z6Iqr8lZ6
	 CaAM1faMrxAZ/ZvxRdq5ndhBbKR52Yfgz2DQk02A=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:18 +0200
Subject: [PATCH v2 11/27] media: videobuf2-v4l2: Support vb2_queue embedded
 in a context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-11-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12219;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=xCWgxUWmumR8zNj2gqTiVA/oEQoilTZsmfWQf+Brozw=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7PkODGmQchPp/R/KD+SQTS1LSqZTXjXhY+z
 HDmSU6jEg2JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zwAKCRByNAaPFqFW
 PIgcD/9pXOiyoLLXbLspCvvQd+I1Wvtk6wl4GCCQiMTO8K7EAxiBe50Y92MH7i+L/iOECc57mkW
 O+JEN4hdUDtUTVWpxz25T/u3Qb8DG8J4dlRLlN3LEK7/rtorquAcmm7ZURajHR5d+I6n03k/wQK
 KMKI3/BuUxZEgX1oohwB7W5bVr+EDeZ7VME9vvUFbqsGvAYMtSpSrN12Zjl9oc/rEV+4CkIY/d6
 2SYb49sEqog64UJKM4NnhI/xYNiHgQTPibuP9qc3/sZ/jUwWxFb1jqc5tsS4LCB4j5YYgY/NL0A
 GnxnkiuF1/pYYUAyNQ2sCbUxj+ToWvGZ10h2w6N22Sa59cT1CfxIa3bXV5J6Szsh2a6XC4gQTSP
 OPj/9RNOOs0kUGjTNTWJCd5BmpEOn6SEzsSWR1unYFu1tqzKNn63SPxO8N6ToO9kXc/AFw9eGXq
 JWH8VBIuMP85MnRqNEZ5hCi9eNXz+pzTsAt8Bapoup/xRvUCXPsDwKlYZoTrJSEjSN0JzWJ+TrV
 i5S4CyU5P7q8YiDVgNml/cM9a7ZdGZvS4IADNMvcw5t5p4S8buJriO3FZZPRUtxfEkFNZ5tqMeu
 9xEwo7zgVseUP0DyVRslwr0kQnVEG/bg/ddXx/FHr4CS/IwXnRa3d/xKn9ZoyvnyIMbZNnLO+B0
 NWVw8v9Y9ZTztiA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_071042_132382_C44405F7 
X-CRM114-Status: GOOD (  19.78  )
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

Support device drivers that implement multi-context operations in the
videobuf2 core by providing an helper to retrieve the vb2_queue from
the context associated with an open file handle. If no context is
associated with a file handle, retrieve it from the video device
default context, created by the core for multi-context aware drivers.

Fall-back to use the vb2_queue from the video_device to support existing
drivers which are not context aware.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 139 +++++++++++++++---------
 1 file changed, 88 insertions(+), 51 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 1cd26faee50338aefeb670c6865da7c2d43f44d3..ad7892551f54c5abc7db7641bb8fb89d77b1337f 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -998,23 +998,46 @@ EXPORT_SYMBOL_GPL(vb2_poll);
  * and so they simplify the driver code.
  */
 
+/*
+ * Helper to get the vb2 queue either from:
+ * 1) The video context bound to the open file handle
+ * 2) The default context for context-aware drivers if userspace has not bound
+ *    a context to the file handle
+ * 3) From the video device for non-context aware drivers
+ */
+static struct vb2_queue *get_vb2_queue(struct file *file,
+				       struct video_device *vdev)
+{
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	struct video_device_context *ctx =
+				video_device_context_from_file(file, vdev);
+
+	return ctx ? &ctx->queue
+		   : vdev->default_context ? &vdev->default_context->queue
+		   : vdev->queue;
+#else
+	return vdev->queue;
+#endif /* CONFIG_MEDIA_CONTROLLER */
+}
+
 /* vb2 ioctl helpers */
 
 int vb2_ioctl_remove_bufs(struct file *file, void *priv,
 			  struct v4l2_remove_buffers *d)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vdev->queue->type != d->type)
+	if (q->type != d->type)
 		return -EINVAL;
 
 	if (d->count == 0)
 		return 0;
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
 
-	return vb2_core_remove_bufs(vdev->queue, d->index, d->count);
+	return vb2_core_remove_bufs(q, d->index, d->count);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);
 
@@ -1022,21 +1045,21 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
 			  struct v4l2_requestbuffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
-	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	int res = vb2_verify_memory_type(q, p->memory, p->type);
 	u32 flags = p->flags;
 
-	vb2_set_flags_and_caps(vdev->queue, p->memory, &flags,
-			       &p->capabilities, NULL);
+	vb2_set_flags_and_caps(q, p->memory, &flags, &p->capabilities, NULL);
 	p->flags = flags;
 	if (res)
 		return res;
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
+	res = vb2_core_reqbufs(q, p->memory, p->flags, &p->count);
 	/* If count == 0, then the owner has released all buffers and he
 	   is no longer owner of the queue. Otherwise we have a new owner. */
 	if (res == 0)
-		vdev->queue->owner = p->count ? file->private_data : NULL;
+		q->owner = p->count ? file->private_data : NULL;
 	return res;
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_reqbufs);
@@ -1045,11 +1068,12 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 			  struct v4l2_create_buffers *p)
 {
 	struct video_device *vdev = video_devdata(file);
-	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->format.type);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	int res = vb2_verify_memory_type(q, p->memory, p->format.type);
 
-	p->index = vb2_get_num_buffers(vdev->queue);
-	vb2_set_flags_and_caps(vdev->queue, p->memory, &p->flags,
-			       &p->capabilities, &p->max_num_buffers);
+	p->index = vb2_get_num_buffers(q);
+	vb2_set_flags_and_caps(q, p->memory, &p->flags, &p->capabilities,
+			       &p->max_num_buffers);
 	/*
 	 * If count == 0, then just check if memory and type are valid.
 	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
@@ -1058,12 +1082,12 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 		return res != -EBUSY ? res : 0;
 	if (res)
 		return res;
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
 
-	res = vb2_create_bufs(vdev->queue, p);
+	res = vb2_create_bufs(q, p);
 	if (res == 0)
-		vdev->queue->owner = file->private_data;
+		q->owner = file->private_data;
 	return res;
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_create_bufs);
@@ -1072,69 +1096,76 @@ int vb2_ioctl_prepare_buf(struct file *file, void *priv,
 			  struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_prepare_buf(vdev->queue, vdev->v4l2_dev->mdev, p);
+	return vb2_prepare_buf(q, vdev->v4l2_dev->mdev, p);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_prepare_buf);
 
 int vb2_ioctl_querybuf(struct file *file, void *priv, struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
 	/* No need to call vb2_queue_is_busy(), anyone can query buffers. */
-	return vb2_querybuf(vdev->queue, p);
+	return vb2_querybuf(q, p);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_querybuf);
 
 int vb2_ioctl_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_qbuf(vdev->queue, vdev->v4l2_dev->mdev, p);
+	return vb2_qbuf(q, vdev->v4l2_dev->mdev, p);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_qbuf);
 
 int vb2_ioctl_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_dqbuf(vdev->queue, p, file->f_flags & O_NONBLOCK);
+	return vb2_dqbuf(q, p, file->f_flags & O_NONBLOCK);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_dqbuf);
 
 int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_streamon(vdev->queue, i);
+	return vb2_streamon(q, i);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_streamon);
 
 int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_streamoff(vdev->queue, i);
+	return vb2_streamoff(q, i);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_streamoff);
 
 int vb2_ioctl_expbuf(struct file *file, void *priv, struct v4l2_exportbuffer *p)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		return -EBUSY;
-	return vb2_expbuf(vdev->queue, p);
+	return vb2_expbuf(q, p);
 }
 EXPORT_SYMBOL_GPL(vb2_ioctl_expbuf);
 
@@ -1143,20 +1174,22 @@ EXPORT_SYMBOL_GPL(vb2_ioctl_expbuf);
 int vb2_fop_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	return vb2_mmap(vdev->queue, vma);
+	return vb2_mmap(q, vma);
 }
 EXPORT_SYMBOL_GPL(vb2_fop_mmap);
 
 int _vb2_fop_release(struct file *file, struct mutex *lock)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
 	if (lock)
 		mutex_lock(lock);
-	if (!vdev->queue->owner || file->private_data == vdev->queue->owner) {
-		vb2_queue_release(vdev->queue);
-		vdev->queue->owner = NULL;
+	if (!q->owner || file->private_data == q->owner) {
+		vb2_queue_release(q);
+		q->owner = NULL;
 	}
 	if (lock)
 		mutex_unlock(lock);
@@ -1167,7 +1200,8 @@ EXPORT_SYMBOL_GPL(_vb2_fop_release);
 int vb2_fop_release(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	struct mutex *lock = q->lock ? q->lock : vdev->lock;
 
 	return _vb2_fop_release(file, lock);
 }
@@ -1177,19 +1211,20 @@ ssize_t vb2_fop_write(struct file *file, const char __user *buf,
 		size_t count, loff_t *ppos)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	struct mutex *lock = q->lock ? q->lock : vdev->lock;
 	int err = -EBUSY;
 
-	if (!(vdev->queue->io_modes & VB2_WRITE))
+	if (!(q->io_modes & VB2_WRITE))
 		return -EINVAL;
 	if (lock && mutex_lock_interruptible(lock))
 		return -ERESTARTSYS;
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		goto exit;
-	err = vb2_write(vdev->queue, buf, count, ppos,
-		       file->f_flags & O_NONBLOCK);
-	if (vdev->queue->fileio)
-		vdev->queue->owner = file->private_data;
+	err = vb2_write(q, buf, count, ppos,
+			file->f_flags & O_NONBLOCK);
+	if (q->fileio)
+		q->owner = file->private_data;
 exit:
 	if (lock)
 		mutex_unlock(lock);
@@ -1201,20 +1236,21 @@ ssize_t vb2_fop_read(struct file *file, char __user *buf,
 		size_t count, loff_t *ppos)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct mutex *lock = vdev->queue->lock ? vdev->queue->lock : vdev->lock;
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
+	struct mutex *lock = q->lock ? q->lock : vdev->lock;
 	int err = -EBUSY;
 
-	if (!(vdev->queue->io_modes & VB2_READ))
+	if (!(q->io_modes & VB2_READ))
 		return -EINVAL;
 	if (lock && mutex_lock_interruptible(lock))
 		return -ERESTARTSYS;
-	if (vb2_queue_is_busy(vdev->queue, file))
+	if (vb2_queue_is_busy(q, file))
 		goto exit;
-	vdev->queue->owner = file->private_data;
-	err = vb2_read(vdev->queue, buf, count, ppos,
+	q->owner = file->private_data;
+	err = vb2_read(q, buf, count, ppos,
 		       file->f_flags & O_NONBLOCK);
-	if (!vdev->queue->fileio)
-		vdev->queue->owner = NULL;
+	if (!q->fileio)
+		q->owner = NULL;
 exit:
 	if (lock)
 		mutex_unlock(lock);
@@ -1225,7 +1261,7 @@ EXPORT_SYMBOL_GPL(vb2_fop_read);
 __poll_t vb2_fop_poll(struct file *file, poll_table *wait)
 {
 	struct video_device *vdev = video_devdata(file);
-	struct vb2_queue *q = vdev->queue;
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 	struct mutex *lock = q->lock ? q->lock : vdev->lock;
 	__poll_t res;
 	void *fileio;
@@ -1241,7 +1277,7 @@ __poll_t vb2_fop_poll(struct file *file, poll_table *wait)
 
 	fileio = q->fileio;
 
-	res = vb2_poll(vdev->queue, file, wait);
+	res = vb2_poll(q, file, wait);
 
 	/* If fileio was started, then we have a new queue owner. */
 	if (!fileio && q->fileio)
@@ -1257,8 +1293,9 @@ unsigned long vb2_fop_get_unmapped_area(struct file *file, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct vb2_queue *q = get_vb2_queue(file, vdev);
 
-	return vb2_get_unmapped_area(vdev->queue, addr, len, pgoff, flags);
+	return vb2_get_unmapped_area(q, addr, len, pgoff, flags);
 }
 EXPORT_SYMBOL_GPL(vb2_fop_get_unmapped_area);
 #endif

-- 
2.49.0


