Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A06CD6E7E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6zutEIRGavVIVZpcG6VxJC2GEi3uTdxrfMhYyJetwM=; b=aOVuZI4TG9/MO81831piuPKUo9
	IGl5vpVBFgLm2nTbW9Fj43CpIcuJjCCnkVRxImBzrl+4wom1oCtpDFj7NuGRFiJBVzD7RgPBbEKf5
	t9MT5I0PNysnR0ujp1cXOzVaF98vVCLMv7bI4qGkEkxz8kb3A/VbqLZJhdL37SbHl6dKnBCblTkle
	DP0lAnWBr8Ny6bW3u3ZAKG2kGutyr1ZoVn1AZeL2b2Ik3D/JKwCeW+mcSK7pdRE9b5fVa/owTwQju
	RZjtEh5FlQrU4uR8ZrPAjGNO15NI5uUtRZkNR9Qm7ABd2Wd7Fu2uXrTa1d2GlZoxZg2PGBJvIxfJP
	UrdxOqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciS-00000001EdN-044u;
	Fri, 05 Jun 2026 22:08:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciL-00000001EKB-0LIh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:30 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci4-0000LW-3e; Sat, 06 Jun 2026 00:08:12 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:51 +0200
Subject: [PATCH 05/17] media: v4l2-mem2mem: support running multiple jobs
 in parallel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-5-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_150829_308773_8C1C4075 
X-CRM114-Status: GOOD (  24.54  )
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

Add support for running multiple jobs in parallel for SoCs containing
multiple identical devices. An example is the Rockchip RK3588 SoC,
which contains two identical RGA3 devices. Therefore it is desirable to
have the kernel schedule the work across all available devices and only
expose one video device to the userspace.

Previously the curr_ctx member of a v4l2_m2m_dev was used to track the
currently running context. But the currently running context will always
be at the top of the job_queue. As the TRANS_RUNNING flag can be used to
check if the queue head is already running, the curr_ctx member can be
completely dropped

To avoid queueing too many parallel jobs, the
v4l2_m2m_set_max_parallel_jobs method is added. It allows a driver
to set the number of parallel jobs and avoids calling device_run when
the given number of jobs is already running. This is set to 1 by default
to prevent parallel job runs. Drivers with the need and support for
scheduling jobs can adjust this value accordingly.

Note that this change doesn't allow a context to be used multiple times
in parallel. So a single stream won't be able to utilize multiple devices
at once, but N streams can utilize up to N devices. This is caused by the
fact that a context is not added multiple times to the job_list and also
holds the job_flags to distinguish if it's currently running.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 89 ++++++++++++++++++++++------------
 include/media/v4l2-mem2mem.h           |  3 ++
 2 files changed, 62 insertions(+), 30 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe0..14ac9c85803d1 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -84,16 +84,15 @@ static const char * const m2m_entity_name[] = {
  *			v4l2_m2m_unregister_media_controller().
  * @intf_devnode:	&struct media_intf devnode pointer with the interface
  *			with controls the M2M device.
- * @curr_ctx:		currently running instance
  * @job_queue:		instances queued to run
  * @job_spinlock:	protects job_queue
  * @job_work:		worker to run queued jobs.
  * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
+ * @max_parallel_jobs:	max job_queue instances number marked as running
  * @m2m_ops:		driver callbacks
  * @kref:		device reference count
  */
 struct v4l2_m2m_dev {
-	struct v4l2_m2m_ctx	*curr_ctx;
 #ifdef CONFIG_MEDIA_CONTROLLER
 	struct media_entity	*source;
 	struct media_pad	source_pad;
@@ -108,6 +107,7 @@ struct v4l2_m2m_dev {
 	spinlock_t		job_spinlock;
 	struct work_struct	job_work;
 	unsigned long		job_queue_flags;
+	u32			max_parallel_jobs;
 
 	const struct v4l2_m2m_ops *m2m_ops;
 
@@ -123,6 +123,12 @@ static struct v4l2_m2m_queue_ctx *get_queue_ctx(struct v4l2_m2m_ctx *m2m_ctx,
 		return &m2m_ctx->cap_q_ctx;
 }
 
+void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
+				    u32 max_parallel_jobs)
+{
+	m2m_dev->max_parallel_jobs = max_parallel_jobs;
+}
+
 struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
 				       enum v4l2_buf_type type)
 {
@@ -229,14 +235,22 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_buf_remove_by_idx);
 void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2m_dev)
 {
 	unsigned long flags;
-	void *ret = NULL;
+	struct v4l2_m2m_ctx *first_ctx;
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
-	if (m2m_dev->curr_ctx)
-		ret = m2m_dev->curr_ctx->priv;
+	if (list_empty(&m2m_dev->job_queue)) {
+		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+		return NULL;
+	}
+
+	first_ctx = list_first_entry(&m2m_dev->job_queue,
+				     struct v4l2_m2m_ctx, queue);
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
-	return ret;
+	if (first_ctx->job_flags & TRANS_RUNNING)
+		return first_ctx->priv;
+	else
+		return NULL;
 }
 EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
 
@@ -252,13 +266,11 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
 static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
 {
 	unsigned long flags;
+	struct v4l2_m2m_ctx *ctx;
+	struct v4l2_m2m_ctx *chosen_ctx = NULL;
+	u32 running_jobs = 0;
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
-	if (NULL != m2m_dev->curr_ctx) {
-		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
-		dprintk("Another instance is running, won't run now\n");
-		return;
-	}
 
 	if (list_empty(&m2m_dev->job_queue)) {
 		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
@@ -272,13 +284,30 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
 		return;
 	}
 
-	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
-				   struct v4l2_m2m_ctx, queue);
-	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
+	list_for_each_entry(ctx, &m2m_dev->job_queue, queue) {
+		if (!(ctx->job_flags & TRANS_RUNNING)) {
+			chosen_ctx = ctx;
+			break;
+		}
+
+		running_jobs++;
+	}
+	if (running_jobs >= m2m_dev->max_parallel_jobs) {
+		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+		dprintk("Maximum number of parallel jobs reached\n");
+		return;
+	}
+	if (!chosen_ctx) {
+		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+		dprintk("All jobs already running\n");
+		return;
+	}
+
+	chosen_ctx->job_flags |= TRANS_RUNNING;
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
-	dprintk("Running job on m2m_ctx: %p\n", m2m_dev->curr_ctx);
-	m2m_dev->m2m_ops->device_run(m2m_dev->curr_ctx->priv);
+	dprintk("Running job on m2m_ctx: %p\n", chosen_ctx);
+	m2m_dev->m2m_ops->device_run(chosen_ctx->priv);
 }
 
 /*
@@ -469,15 +498,14 @@ static void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
 static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 				 struct v4l2_m2m_ctx *m2m_ctx)
 {
-	if (!m2m_dev->curr_ctx || m2m_dev->curr_ctx != m2m_ctx) {
+	if (!m2m_ctx || !(m2m_ctx->job_flags & TRANS_RUNNING)) {
 		dprintk("Called by an instance not currently running\n");
 		return false;
 	}
 
-	list_del(&m2m_dev->curr_ctx->queue);
-	m2m_dev->curr_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
-	wake_up(&m2m_dev->curr_ctx->finished);
-	m2m_dev->curr_ctx = NULL;
+	list_del(&m2m_ctx->queue);
+	m2m_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
+	wake_up(&m2m_ctx->finished);
 	return true;
 }
 
@@ -544,16 +572,19 @@ EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
 void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
 {
 	unsigned long flags;
-	struct v4l2_m2m_ctx *curr_ctx;
+	struct v4l2_m2m_ctx *ctx;
+	struct v4l2_m2m_ctx *ctx_safe;
 
 	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
 	m2m_dev->job_queue_flags |= QUEUE_PAUSED;
-	curr_ctx = m2m_dev->curr_ctx;
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
-	if (curr_ctx)
-		wait_event(curr_ctx->finished,
-			   !(curr_ctx->job_flags & TRANS_RUNNING));
+	list_for_each_entry_safe(ctx, ctx_safe, &m2m_dev->job_queue, queue) {
+		if (!(ctx->job_flags & TRANS_RUNNING))
+			break;
+
+		wait_event(ctx->finished, !(ctx->job_flags & TRANS_RUNNING));
+	}
 }
 EXPORT_SYMBOL(v4l2_m2m_suspend);
 
@@ -896,10 +927,8 @@ int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 	q_ctx->num_rdy = 0;
 	spin_unlock_irqrestore(&q_ctx->rdy_spinlock, flags);
 
-	if (m2m_dev->curr_ctx == m2m_ctx) {
-		m2m_dev->curr_ctx = NULL;
+	if (m2m_ctx->job_flags & TRANS_RUNNING)
 		wake_up(&m2m_ctx->finished);
-	}
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
 
 	return 0;
@@ -1194,12 +1223,12 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l2_m2m_ops *m2m_ops)
 	if (!m2m_dev)
 		return ERR_PTR(-ENOMEM);
 
-	m2m_dev->curr_ctx = NULL;
 	m2m_dev->m2m_ops = m2m_ops;
 	INIT_LIST_HEAD(&m2m_dev->job_queue);
 	spin_lock_init(&m2m_dev->job_spinlock);
 	INIT_WORK(&m2m_dev->job_work, v4l2_m2m_device_run_work);
 	kref_init(&m2m_dev->kref);
+	m2m_dev->max_parallel_jobs = 1;
 
 	return m2m_dev;
 }
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 31de25d792b98..e6177d0eaf637 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -594,6 +594,9 @@ static inline void v4l2_m2m_set_dst_buffered(struct v4l2_m2m_ctx *m2m_ctx,
 	m2m_ctx->cap_q_ctx.buffered = buffered;
 }
 
+void v4l2_m2m_set_max_parallel_jobs(struct v4l2_m2m_dev *m2m_dev,
+				    u32 max_parallel_jobs);
+
 /**
  * v4l2_m2m_ctx_release() - release m2m context
  *

-- 
2.54.0


