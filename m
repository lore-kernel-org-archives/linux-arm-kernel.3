Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78464C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6U6CzEMH5BVpdW/mdUj1S531VjRG8KnjKO+evEMgyU=; b=XVOQDtzceFiTJD4qC4okiLAqCS
	617wSbhpU+jC0VTyjD3jiMeandXSC6mQTLFQcrDUSqM4xtj4GJnH23A6hALMAIwMfiR6yigFB5aEk
	70EbHbi73ixsisFDSHR4XIhvd9ZbYYwRsAfeiYpv1ZWhnGA17XQpJ66ezkjlhJ+lRHSJ81H6y9e39
	aeRkTek8ghaz8ufCcktmvwKqWhu8G/J8lQzbBtOGSKTsq45HAaqxQWfBQ8/7EZHULhKXSbzhUOF3g
	dco6JNy9xFAOMOQWxVQiF8G328fxpRH8QxiMkFyv7D2ji1J5lg43ZXp8SM+htnULn7xyX3TyDGz8/
	r6+Sgxpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUXc-000000004A8-0Aqc;
	Fri, 06 Jun 2025 10:43:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUKP-000000002tW-21ax;
	Fri, 06 Jun 2025 10:29:39 +0000
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B5BA149B;
	Fri,  6 Jun 2025 12:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749205769;
	bh=8CEzxdIV+2aRtC0PtQKkli9DkHXfXShenAcDp/owwRY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ze36v+A21xfr61znbfxYt4Rk4zxuLKsTvpN4xS3IcvO+gJr34cyhKkBFoG03c+Zm0
	 lZSo0gH+68a7yGZKND7LY9EcBVPjhptS2BAaeLZnmrmzNiMoHmRBlwOuO+KZV/RzcW
	 FqKxiFBl/od/cE0bXIxcr/iMfNZ61T3qe3eEjTG8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 06 Jun 2025 12:29:23 +0200
Subject: [PATCH v7 3/4] media: pisp_be: Split jobs creation and scheduling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-3-46169f0622b7@ideasonboard.com>
References: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
In-Reply-To: <20250606-pispbe-mainline-split-jobs-handling-v6-v7-0-46169f0622b7@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=12686;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=8CEzxdIV+2aRtC0PtQKkli9DkHXfXShenAcDp/owwRY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoQsMJIQuMTolpJr/4egEnJNl3dkYnu8L3fh3Gf
 wPmHtDWIfyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaELDCQAKCRByNAaPFqFW
 PA64EADDySBRRHXygcfzeR5Tz6wsWq8pwNjcsAjr2sjDeI5tU2GjdZ8CEZYGZK/rukOJBdU/SLH
 TY9bx+H+SJ3/G1s24BSUHFAGDqz4JxRm4BkWP6Wpvhhq5N0Vczsd/SCgo0vcX/lKLYA0ejnSz4B
 qzhrUWiWSpj/rZi59wM3yS/NK1ccQqPIiXTCwIj46e9woIwFE1/01WLqOxGxP6Opw9PNPCGaBUg
 P8Xt3g+Rpnhl5YCeQDHJ/PNuInEmwp3yrdI09dg7td8t5bVDKxwOXWxMCyPZKq5MWeDso+cRD1B
 R6mg56sMvJXBlpLiAo5fqZiFLjvKN7KIRdVS61m0N8S/CY26ZMdviHleiEyH/I4mjPfRGXbnAIB
 8MTIaOlwLxw1QW4Cf7hszfPU48HnVt6/GreK3QxuRMScmXXb47q1NbKE3+p7SkbIa9hznviFknM
 GA4BnSM3b5agSmitdao7YBWirszsEXw8NFGHdXb6OmMaQy/ckA+pGLCH9myyWwhXalbrcuGpg4w
 1E0GlVz+iXCKt/TreWgSnlgade2elKfsH595lHyLTRzC982aYB/DAg2NkAOGc0l09jNXQUihPJX
 Nfd8aYFG7BV4l5jvBfOHtCsIb6I/dqqg2N8VuXVIo4HWicyiVI2VVkKB/OnXR7xixWdHLwgBZgs
 yupODJLPudPjCAQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_032937_821778_B5FE80E4 
X-CRM114-Status: GOOD (  30.20  )
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

Currently the 'pispbe_schedule()' function does two things:

1) Tries to assemble a job by inspecting all the video node queues
   to make sure all the required buffers are available
2) Submit the job to the hardware

The pispbe_schedule() function is called at:

- video device start_streaming() time
- video device qbuf() time
- irq handler

As assembling a job requires inspecting all queues, it is a rather
time consuming operation which is better not run in IRQ context.

To avoid the executing the time consuming job creation in interrupt
context split the job creation and job scheduling in two distinct
operations. When a well-formed job is created, append it to the
newly introduced 'pispbe->job_queue' where it will be dequeued from
by the scheduling routine.

As the per-node 'ready_queue' buffer list is only accessed in vb2
ops callbacks, protected by a mutex, it is not necessary to guard it
with a dedicated spinlock so drop it. Also use the spin_lock_irq()
variant in all functions not called from an IRQ context where the
spin_lock_irqsave() version was used.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 152 +++++++++++----------
 1 file changed, 79 insertions(+), 73 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 92c452891d6c..c25f7d9b404c 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -161,8 +161,6 @@ struct pispbe_node {
 	struct mutex node_lock;
 	/* vb2_queue lock */
 	struct mutex queue_lock;
-	/* Protect pispbe_node->ready_queue and pispbe_buffer->ready_list */
-	spinlock_t ready_lock;
 	struct list_head ready_queue;
 	struct vb2_queue queue;
 	struct v4l2_format format;
@@ -190,6 +188,8 @@ struct pispbe_hw_enables {
 
 /* Records a job configuration and memory addresses. */
 struct pispbe_job_descriptor {
+	struct list_head queue;
+	struct pispbe_buffer *buffers[PISPBE_NUM_NODES];
 	dma_addr_t hw_dma_addrs[N_HW_ADDRESSES];
 	struct pisp_be_tiles_config *config;
 	struct pispbe_hw_enables hw_enables;
@@ -215,8 +215,10 @@ struct pispbe_dev {
 	unsigned int sequence;
 	u32 streaming_map;
 	struct pispbe_job queued_job, running_job;
-	spinlock_t hw_lock; /* protects "hw_busy" flag and streaming_map */
+	/* protects "hw_busy" flag, streaming_map and job_queue */
+	spinlock_t hw_lock;
 	bool hw_busy; /* non-zero if a job is queued or is being started */
+	struct list_head job_queue;
 	int irq;
 	u32 hw_version;
 	u8 done, started;
@@ -440,41 +442,47 @@ static void pispbe_xlate_addrs(struct pispbe_dev *pispbe,
  * For Output0, Output1, Tdn and Stitch, a buffer only needs to be
  * available if the blocks are enabled in the config.
  *
- * Needs to be called with hw_lock held.
+ * If all the buffers required to form a job are available, append the
+ * job descriptor to the job queue to be later queued to the HW.
  *
  * Returns 0 if a job has been successfully prepared, < 0 otherwise.
  */
-static int pispbe_prepare_job(struct pispbe_dev *pispbe,
-			      struct pispbe_job_descriptor *job)
+static int pispbe_prepare_job(struct pispbe_dev *pispbe)
 {
 	struct pispbe_buffer *buf[PISPBE_NUM_NODES] = {};
+	struct pispbe_job_descriptor *job;
+	unsigned int streaming_map;
 	unsigned int config_index;
 	struct pispbe_node *node;
-	unsigned long flags;
 
-	lockdep_assert_held(&pispbe->hw_lock);
+	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
+		static const u32 mask = BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE);
 
-	memset(job, 0, sizeof(struct pispbe_job_descriptor));
+		if ((pispbe->streaming_map & mask) != mask)
+			return -ENODEV;
 
-	if (((BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)) &
-		pispbe->streaming_map) !=
-			(BIT(CONFIG_NODE) | BIT(MAIN_INPUT_NODE)))
-		return -ENODEV;
+		/*
+		 * Take a copy of streaming_map: nodes activated after this
+		 * point are ignored when preparing this job.
+		 */
+		streaming_map = pispbe->streaming_map;
+	}
+
+	job = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return -ENOMEM;
 
 	node = &pispbe->node[CONFIG_NODE];
-	spin_lock_irqsave(&node->ready_lock, flags);
 	buf[CONFIG_NODE] = list_first_entry_or_null(&node->ready_queue,
 						    struct pispbe_buffer,
 						    ready_list);
-	if (buf[CONFIG_NODE]) {
-		list_del(&buf[CONFIG_NODE]->ready_list);
-		pispbe->queued_job.buf[CONFIG_NODE] = buf[CONFIG_NODE];
+	if (!buf[CONFIG_NODE]) {
+		kfree(job);
+		return -ENODEV;
 	}
-	spin_unlock_irqrestore(&node->ready_lock, flags);
 
-	/* Exit early if no config buffer has been queued. */
-	if (!buf[CONFIG_NODE])
-		return -ENODEV;
+	list_del(&buf[CONFIG_NODE]->ready_list);
+	job->buffers[CONFIG_NODE] = buf[CONFIG_NODE];
 
 	config_index = buf[CONFIG_NODE]->vb.vb2_buf.index;
 	job->config = &pispbe->config[config_index];
@@ -495,7 +503,7 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
 			continue;
 
 		buf[i] = NULL;
-		if (!(pispbe->streaming_map & BIT(i)))
+		if (!(streaming_map & BIT(i)))
 			continue;
 
 		if ((!(rgb_en & PISP_BE_RGB_ENABLE_OUTPUT0) &&
@@ -522,25 +530,25 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
 		node = &pispbe->node[i];
 
 		/* Pull a buffer from each V4L2 queue to form the queued job */
-		spin_lock_irqsave(&node->ready_lock, flags);
 		buf[i] = list_first_entry_or_null(&node->ready_queue,
 						  struct pispbe_buffer,
 						  ready_list);
 		if (buf[i]) {
 			list_del(&buf[i]->ready_list);
-			pispbe->queued_job.buf[i] = buf[i];
+			job->buffers[i] = buf[i];
 		}
-		spin_unlock_irqrestore(&node->ready_lock, flags);
 
 		if (!buf[i] && !ignore_buffers)
 			goto err_return_buffers;
 	}
 
-	pispbe->queued_job.valid = true;
-
 	/* Convert buffers to DMA addresses for the hardware */
 	pispbe_xlate_addrs(pispbe, job, buf);
 
+	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
+		list_add_tail(&job->queue, &pispbe->job_queue);
+	}
+
 	return 0;
 
 err_return_buffers:
@@ -551,33 +559,39 @@ static int pispbe_prepare_job(struct pispbe_dev *pispbe,
 			continue;
 
 		/* Return the buffer to the ready_list queue */
-		spin_lock_irqsave(&n->ready_lock, flags);
 		list_add(&buf[i]->ready_list, &n->ready_queue);
-		spin_unlock_irqrestore(&n->ready_lock, flags);
 	}
 
-	memset(&pispbe->queued_job, 0, sizeof(pispbe->queued_job));
+	kfree(job);
 
 	return -ENODEV;
 }
 
 static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
 {
-	struct pispbe_job_descriptor job;
-	unsigned long flags;
-	int ret;
+	struct pispbe_job_descriptor *job;
+
+	scoped_guard(spinlock_irqsave, &pispbe->hw_lock) {
+		if (clear_hw_busy)
+			pispbe->hw_busy = false;
+
+		if (pispbe->hw_busy)
+			return;
 
-	spin_lock_irqsave(&pispbe->hw_lock, flags);
+		job = list_first_entry_or_null(&pispbe->job_queue,
+					       struct pispbe_job_descriptor,
+					       queue);
+		if (!job)
+			return;
 
-	if (clear_hw_busy)
-		pispbe->hw_busy = false;
+		list_del(&job->queue);
 
-	if (pispbe->hw_busy)
-		goto unlock_and_return;
+		for (unsigned int i = 0; i < PISPBE_NUM_NODES; i++)
+			pispbe->queued_job.buf[i] = job->buffers[i];
+		pispbe->queued_job.valid = true;
 
-	ret = pispbe_prepare_job(pispbe, &job);
-	if (ret)
-		goto unlock_and_return;
+		pispbe->hw_busy = true;
+	}
 
 	/*
 	 * We can kick the job off without the hw_lock, as this can
@@ -585,16 +599,8 @@ static void pispbe_schedule(struct pispbe_dev *pispbe, bool clear_hw_busy)
 	 * only when the following job has been queued and an interrupt
 	 * is rised.
 	 */
-	pispbe->hw_busy = true;
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
-
-	pispbe_queue_job(pispbe, &job);
-
-	return;
-
-unlock_and_return:
-	/* No job has been queued, just release the lock and return. */
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+	pispbe_queue_job(pispbe, job);
+	kfree(job);
 }
 
 static void pispbe_isr_jobdone(struct pispbe_dev *pispbe,
@@ -846,18 +852,16 @@ static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
 		container_of(vbuf, struct pispbe_buffer, vb);
 	struct pispbe_node *node = vb2_get_drv_priv(buf->vb2_queue);
 	struct pispbe_dev *pispbe = node->pispbe;
-	unsigned long flags;
 
 	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
-	spin_lock_irqsave(&node->ready_lock, flags);
 	list_add_tail(&buffer->ready_list, &node->ready_queue);
-	spin_unlock_irqrestore(&node->ready_lock, flags);
 
 	/*
 	 * Every time we add a buffer, check if there's now some work for the hw
 	 * to do.
 	 */
-	pispbe_schedule(pispbe, false);
+	if (!pispbe_prepare_job(pispbe))
+		pispbe_schedule(pispbe, false);
 }
 
 static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
@@ -865,17 +869,16 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct pispbe_node *node = vb2_get_drv_priv(q);
 	struct pispbe_dev *pispbe = node->pispbe;
 	struct pispbe_buffer *buf, *tmp;
-	unsigned long flags;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(pispbe->dev);
 	if (ret < 0)
 		goto err_return_buffers;
 
-	spin_lock_irqsave(&pispbe->hw_lock, flags);
-	node->pispbe->streaming_map |=  BIT(node->id);
-	node->pispbe->sequence = 0;
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+	scoped_guard(spinlock_irq, &pispbe->hw_lock) {
+		node->pispbe->streaming_map |=  BIT(node->id);
+		node->pispbe->sequence = 0;
+	}
 
 	dev_dbg(pispbe->dev, "%s: for node %s (count %u)\n",
 		__func__, NODE_NAME(node), count);
@@ -883,17 +886,16 @@ static int pispbe_node_start_streaming(struct vb2_queue *q, unsigned int count)
 		node->pispbe->streaming_map);
 
 	/* Maybe we're ready to run. */
-	pispbe_schedule(pispbe, false);
+	if (!pispbe_prepare_job(pispbe))
+		pispbe_schedule(pispbe, false);
 
 	return 0;
 
 err_return_buffers:
-	spin_lock_irqsave(&pispbe->hw_lock, flags);
 	list_for_each_entry_safe(buf, tmp, &node->ready_queue, ready_list) {
 		list_del(&buf->ready_list);
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
 	}
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
 
 	return ret;
 }
@@ -903,7 +905,6 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 	struct pispbe_node *node = vb2_get_drv_priv(q);
 	struct pispbe_dev *pispbe = node->pispbe;
 	struct pispbe_buffer *buf;
-	unsigned long flags;
 
 	/*
 	 * Now this is a bit awkward. In a simple M2M device we could just wait
@@ -915,11 +916,7 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 	 * This may return buffers out of order.
 	 */
 	dev_dbg(pispbe->dev, "%s: for node %s\n", __func__, NODE_NAME(node));
-	spin_lock_irqsave(&pispbe->hw_lock, flags);
 	do {
-		unsigned long flags1;
-
-		spin_lock_irqsave(&node->ready_lock, flags1);
 		buf = list_first_entry_or_null(&node->ready_queue,
 					       struct pispbe_buffer,
 					       ready_list);
@@ -927,15 +924,23 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 			list_del(&buf->ready_list);
 			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 		}
-		spin_unlock_irqrestore(&node->ready_lock, flags1);
 	} while (buf);
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
 
 	vb2_wait_for_all_buffers(&node->queue);
 
-	spin_lock_irqsave(&pispbe->hw_lock, flags);
+	spin_lock_irq(&pispbe->hw_lock);
 	pispbe->streaming_map &= ~BIT(node->id);
-	spin_unlock_irqrestore(&pispbe->hw_lock, flags);
+
+	/* Release all jobs once all nodes have stopped streaming. */
+	if (pispbe->streaming_map == 0) {
+		struct pispbe_job_descriptor *job, *temp;
+
+		list_for_each_entry_safe(job, temp, &pispbe->job_queue, queue) {
+			list_del(&job->queue);
+			kfree(job);
+		}
+	}
+	spin_unlock_irq(&pispbe->hw_lock);
 
 	pm_runtime_mark_last_busy(pispbe->dev);
 	pm_runtime_put_autosuspend(pispbe->dev);
@@ -1393,7 +1398,6 @@ static int pispbe_init_node(struct pispbe_dev *pispbe, unsigned int id)
 	mutex_init(&node->node_lock);
 	mutex_init(&node->queue_lock);
 	INIT_LIST_HEAD(&node->ready_queue);
-	spin_lock_init(&node->ready_lock);
 
 	node->format.type = node->buf_type;
 	pispbe_node_def_fmt(node);
@@ -1677,6 +1681,8 @@ static int pispbe_probe(struct platform_device *pdev)
 	if (!pispbe)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&pispbe->job_queue);
+
 	dev_set_drvdata(&pdev->dev, pispbe);
 	pispbe->dev = &pdev->dev;
 	platform_set_drvdata(pdev, pispbe);

-- 
2.49.0


