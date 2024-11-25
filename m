Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C023D3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwdG2KjCoa5YAh/+cggXfn4fva4fNtrVZr0O3AYCFYM=; b=34TxuoW+48BNAdJtB/XaZZh8z2
	SVdocclCWK3TmpVpLQ22zEZFN9EXzPbnJV4+BB6kFiMayJ3sf5g+CE7Hs1gESSghIW9BMwzqUj15k
	kCZHzzjDnot+n0JZ+Oy+78tr/uwVSTz1A3wOe4Qnn7OA065dHsajCFj14bmiBCAIesfp77PVbCt0i
	qBGmUD54b9WjVK7DclS1vEsGKY/bWNiKBLCjUn0/oNcFFpFfjVsHCSuGRXq74LjlB7Jx5u2j4wwnY
	EBiF+EunmUd08gXuyoGdiQlEcYTouU2dphgCJdSkCuzy0/kxA118JTluAdzTL6NMkYEio4DxdKyH7
	ZCJvMNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWA1-00000007hxd-1Nza;
	Mon, 25 Nov 2024 10:17:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVhx-00000007doc-2WcP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:48:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48BBD1692;
	Mon, 25 Nov 2024 01:49:11 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14E203F66E;
	Mon, 25 Nov 2024 01:48:38 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	nd@arm.com,
	Levi Yun <yeoreum.yun@arm.com>
Subject: [PATCH 8/9] coresight-tmc: change tmc_drvdata spinlock's type to raw_spinlock_t
Date: Mon, 25 Nov 2024 09:48:15 +0000
Message-Id: <20241125094816.365472-9-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125094816.365472-1-yeoreum.yun@arm.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_014841_785643_F5372344 
X-CRM114-Status: GOOD (  29.25  )
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

From: Levi Yun <yeoreum.yun@arm.com>

In coresight-tmc drivers, tmc_drvdata->spinlock can be held
during __schedule() by perf_event_task_sched_out()/in().

Since tmc_drvdata->spinlock type is spinlock_t and
perf_event_task_sched_out()/in() is called after acquiring rq_lock,
which is raw_spinlock_t (an unsleepable lock),
this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.

To address this, change type tmc_drvdata->spinlock in coresight-tmc drivers,
which can be called by perf_event_task_sched_out()/in(),
from spinlock_t to raw_spinlock_t.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  |   9 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   | 195 +++++++----------
 .../hwtracing/coresight/coresight-tmc-etr.c   | 199 ++++++++----------
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
 4 files changed, 169 insertions(+), 236 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 3a482fd2cb22..d6499eb14745 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -492,7 +492,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 	drvdata->base = base;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 
-	spin_lock_init(&drvdata->spinlock);
+	raw_spin_lock_init(&drvdata->spinlock);
 
 	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
 	drvdata->config_type = BMVAL(devid, 6, 7);
@@ -593,13 +593,12 @@ static int tmc_probe(struct amba_device *adev, const struct amba_id *id)
 
 static void tmc_shutdown(struct amba_device *adev)
 {
-	unsigned long flags;
 	struct tmc_drvdata *drvdata = amba_get_drvdata(adev);
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED)
-		goto out;
+		return;
 
 	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR)
 		tmc_etr_disable_hw(drvdata);
@@ -609,8 +608,6 @@ static void tmc_shutdown(struct amba_device *adev)
 	 * callback which is required for making coresight modular since
 	 * the system is going down after this.
 	 */
-out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 }
 
 static void __tmc_remove(struct device *dev)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d4f641cd9de6..b2f97defbba2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -182,9 +182,9 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 	 * If we don't have a buffer release the lock and allocate memory.
 	 * Otherwise keep the lock and move along.
 	 */
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	if (!drvdata->buf) {
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 		/* Allocating the memory here while outside of the spinlock */
 		buf = kzalloc(drvdata->size, GFP_KERNEL);
@@ -192,7 +192,7 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 			return -ENOMEM;
 
 		/* Let's try again */
-		spin_lock_irqsave(&drvdata->spinlock, flags);
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
 	if (drvdata->reading) {
@@ -235,7 +235,7 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 		used = false;
 	}
 out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	/* Free memory outside the spinlock if need be */
 	if (!used)
@@ -248,12 +248,12 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 {
 	int ret = 0;
 	pid_t pid;
-	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = data;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	do {
 		ret = -EINVAL;
 		if (drvdata->reading)
@@ -296,7 +296,6 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 			csdev->refcnt++;
 		}
 	} while (0);
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	return ret;
 }
@@ -328,31 +327,24 @@ static int tmc_enable_etf_sink(struct coresight_device *csdev,
 
 static int tmc_disable_etf_sink(struct coresight_device *csdev)
 {
-	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		if (drvdata->reading)
+			return -EBUSY;
 
-	if (drvdata->reading) {
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		return -EBUSY;
-	}
+		csdev->refcnt--;
+		if (csdev->refcnt)
+			return -EBUSY;
 
-	csdev->refcnt--;
-	if (csdev->refcnt) {
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		return -EBUSY;
+		/* Complain if we (somehow) got out of sync */
+		WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
+		tmc_etb_disable_hw(drvdata);
+		/* Dissociate from monitored process. */
+		drvdata->pid = -1;
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
 	}
 
-	/* Complain if we (somehow) got out of sync */
-	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
-	tmc_etb_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
-	coresight_set_mode(csdev, CS_MODE_DISABLED);
-
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
-
 	dev_dbg(&csdev->dev, "TMC-ETB/ETF disabled\n");
 	return 0;
 }
@@ -362,26 +354,23 @@ static int tmc_enable_etf_link(struct coresight_device *csdev,
 			       struct coresight_connection *out)
 {
 	int ret = 0;
-	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	bool first_enable = false;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (drvdata->reading) {
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		return -EBUSY;
-	}
-
-	if (csdev->refcnt == 0) {
-		ret = tmc_etf_enable_hw(drvdata);
-		if (!ret) {
-			coresight_set_mode(csdev, CS_MODE_SYSFS);
-			first_enable = true;
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		if (drvdata->reading)
+			return -EBUSY;
+
+		if (csdev->refcnt == 0) {
+			ret = tmc_etf_enable_hw(drvdata);
+			if (!ret) {
+				coresight_set_mode(csdev, CS_MODE_SYSFS);
+				first_enable = true;
+			}
 		}
+		if (!ret)
+			csdev->refcnt++;
 	}
-	if (!ret)
-		csdev->refcnt++;
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (first_enable)
 		dev_dbg(&csdev->dev, "TMC-ETF enabled\n");
@@ -392,23 +381,20 @@ static void tmc_disable_etf_link(struct coresight_device *csdev,
 				 struct coresight_connection *in,
 				 struct coresight_connection *out)
 {
-	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	bool last_disable = false;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (drvdata->reading) {
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		return;
-	}
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		if (drvdata->reading)
+			return;
 
-	csdev->refcnt--;
-	if (csdev->refcnt == 0) {
-		tmc_etf_disable_hw(drvdata);
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
-		last_disable = true;
+		csdev->refcnt--;
+		if (csdev->refcnt == 0) {
+			tmc_etf_disable_hw(drvdata);
+			coresight_set_mode(csdev, CS_MODE_DISABLED);
+			last_disable = true;
+		}
 	}
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (last_disable)
 		dev_dbg(&csdev->dev, "TMC-ETF disabled\n");
@@ -477,7 +463,7 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
 	u32 *buf_ptr;
 	u64 read_ptr, write_ptr;
 	u32 status;
-	unsigned long offset, to_read = 0, flags;
+	unsigned long offset, to_read = 0;
 	struct cs_buffers *buf = sink_config;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
@@ -488,11 +474,11 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
 	if (WARN_ON_ONCE(coresight_get_mode(csdev) != CS_MODE_PERF))
 		return 0;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* Don't do anything if another tracer is using this sink */
 	if (csdev->refcnt != 1)
-		goto out;
+		return 0;
 
 	CS_UNLOCK(drvdata->base);
 
@@ -584,8 +570,6 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
 	 * is expected by the perf ring buffer.
 	 */
 	CS_LOCK(drvdata->base);
-out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	return to_read;
 }
@@ -615,56 +599,43 @@ const struct coresight_ops tmc_etf_cs_ops = {
 int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
 {
 	enum tmc_mode mode;
-	int ret = 0;
-	unsigned long flags;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
 			 drvdata->config_type != TMC_CONFIG_TYPE_ETF))
 		return -EINVAL;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
-	if (drvdata->reading) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (drvdata->reading)
+		return -EBUSY;
 
 	/* Don't interfere if operated from Perf */
-	if (coresight_get_mode(drvdata->csdev) == CS_MODE_PERF) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (coresight_get_mode(drvdata->csdev) == CS_MODE_PERF)
+		return -EINVAL;
 
 	/* If drvdata::buf is NULL the trace data has been read already */
-	if (drvdata->buf == NULL) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (drvdata->buf == NULL)
+		return -EINVAL;
 
 	/* Disable the TMC if need be */
 	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
 		/* There is no point in reading a TMC in HW FIFO mode */
 		mode = readl_relaxed(drvdata->base + TMC_MODE);
-		if (mode != TMC_MODE_CIRCULAR_BUFFER) {
-			ret = -EINVAL;
-			goto out;
-		}
+		if (mode != TMC_MODE_CIRCULAR_BUFFER)
+			return -EINVAL;
 		__tmc_etb_disable_hw(drvdata);
 	}
 
 	drvdata->reading = true;
-out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
-	return ret;
+	return 0;
 }
 
 int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
 {
 	char *buf = NULL;
 	enum tmc_mode mode;
-	unsigned long flags;
 	int rc = 0;
 
 	/* config types are set a boot time and never change */
@@ -672,41 +643,37 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
 			 drvdata->config_type != TMC_CONFIG_TYPE_ETF))
 		return -EINVAL;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-
-	/* Re-enable the TMC if need be */
-	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
-		/* There is no point in reading a TMC in HW FIFO mode */
-		mode = readl_relaxed(drvdata->base + TMC_MODE);
-		if (mode != TMC_MODE_CIRCULAR_BUFFER) {
-			spin_unlock_irqrestore(&drvdata->spinlock, flags);
-			return -EINVAL;
-		}
-		/*
-		 * The trace run will continue with the same allocated trace
-		 * buffer. As such zero-out the buffer so that we don't end
-		 * up with stale data.
-		 *
-		 * Since the tracer is still enabled drvdata::buf
-		 * can't be NULL.
-		 */
-		memset(drvdata->buf, 0, drvdata->size);
-		rc = __tmc_etb_enable_hw(drvdata);
-		if (rc) {
-			spin_unlock_irqrestore(&drvdata->spinlock, flags);
-			return rc;
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		/* Re-enable the TMC if need be */
+		if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
+			/* There is no point in reading a TMC in HW FIFO mode */
+			mode = readl_relaxed(drvdata->base + TMC_MODE);
+			if (mode != TMC_MODE_CIRCULAR_BUFFER)
+				return -EINVAL;
+
+			/*
+			 * The trace run will continue with the same allocated trace
+			 * buffer. As such zero-out the buffer so that we don't end
+			 * up with stale data.
+			 *
+			 * Since the tracer is still enabled drvdata::buf
+			 * can't be NULL.
+			 */
+			memset(drvdata->buf, 0, drvdata->size);
+			rc = __tmc_etb_enable_hw(drvdata);
+			if (rc)
+				return rc;
+		} else {
+			/*
+			 * The ETB/ETF is not tracing and the buffer was just read.
+			 * As such prepare to free the trace buffer.
+			 */
+			buf = drvdata->buf;
+			drvdata->buf = NULL;
 		}
-	} else {
-		/*
-		 * The ETB/ETF is not tracing and the buffer was just read.
-		 * As such prepare to free the trace buffer.
-		 */
-		buf = drvdata->buf;
-		drvdata->buf = NULL;
-	}
 
-	drvdata->reading = false;
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		drvdata->reading = false;
+	}
 
 	/*
 	 * Free allocated memory outside of the spinlock.  There is no need
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f..6672bea4d2b9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1176,10 +1176,10 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 	 * buffer, provided the size matches. Any allocation has to be done
 	 * with the lock released.
 	 */
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
 	if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 		/* Allocate memory with the locks released */
 		free_buf = new_buf = tmc_etr_setup_sysfs_buf(drvdata);
@@ -1187,7 +1187,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 			return new_buf;
 
 		/* Let's try again */
-		spin_lock_irqsave(&drvdata->spinlock, flags);
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
 	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
@@ -1206,7 +1206,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 	}
 
 out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	/* Free memory outside the spinlock if need be */
 	if (free_buf)
@@ -1216,35 +1216,31 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 
 static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 {
-	int ret = 0;
-	unsigned long flags;
+	int ret;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
 
 	if (IS_ERR(sysfs_buf))
 		return PTR_ERR(sysfs_buf);
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-
-	/*
-	 * In sysFS mode we can have multiple writers per sink.  Since this
-	 * sink is already enabled no memory is needed and the HW need not be
-	 * touched, even if the buffer size has changed.
-	 */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		csdev->refcnt++;
-		goto out;
-	}
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		/*
+		 * In sysFS mode we can have multiple writers per sink.  Since this
+		 * sink is already enabled no memory is needed and the HW need not be
+		 * touched, even if the buffer size has changed.
+		 */
+		if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
+			csdev->refcnt++;
+			return 0;
+		}
 
-	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
-	if (!ret) {
-		coresight_set_mode(csdev, CS_MODE_SYSFS);
-		csdev->refcnt++;
+		ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
+		if (!ret) {
+			coresight_set_mode(csdev, CS_MODE_SYSFS);
+			csdev->refcnt++;
+		}
 	}
 
-out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
-
 	if (!ret)
 		dev_dbg(&csdev->dev, "TMC-ETR enabled\n");
 
@@ -1557,32 +1553,28 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 		      void *config)
 {
 	bool lost = false;
-	unsigned long flags, offset, size = 0;
+	unsigned long offset, size = 0;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etr_perf_buffer *etr_perf = config;
 	struct etr_buf *etr_buf = etr_perf->etr_buf;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-
-	/* Don't do anything if another tracer is using this sink */
-	if (csdev->refcnt != 1) {
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		goto out;
-	}
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		/* Don't do anything if another tracer is using this sink */
+		if (csdev->refcnt != 1)
+			goto out;
 
-	if (WARN_ON(drvdata->perf_buf != etr_buf)) {
-		lost = true;
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		goto out;
-	}
+		if (WARN_ON(drvdata->perf_buf != etr_buf)) {
+			lost = true;
+			goto out;
+		}
 
-	CS_UNLOCK(drvdata->base);
+		CS_UNLOCK(drvdata->base);
 
-	tmc_flush_and_stop(drvdata);
-	tmc_sync_etr_buf(drvdata);
+		tmc_flush_and_stop(drvdata);
+		tmc_sync_etr_buf(drvdata);
 
-	CS_LOCK(drvdata->base);
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		CS_LOCK(drvdata->base);
+	}
 
 	lost = etr_buf->full;
 	offset = etr_buf->offset;
@@ -1644,33 +1636,27 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 
 static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 {
-	int rc = 0;
+	int rc;
 	pid_t pid;
-	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = data;
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
 	 /* Don't use this sink if it is already claimed by sysFS */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		rc = -EBUSY;
-		goto unlock_out;
-	}
+	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
+		return -EBUSY;
 
-	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
-		rc = -EINVAL;
-		goto unlock_out;
-	}
+	if (WARN_ON(!etr_perf || !etr_perf->etr_buf))
+		return -EINVAL;
 
 	/* Get a handle on the pid of the session owner */
 	pid = etr_perf->pid;
 
 	/* Do not proceed if this device is associated with another session */
-	if (drvdata->pid != -1 && drvdata->pid != pid) {
-		rc = -EBUSY;
-		goto unlock_out;
-	}
+	if (drvdata->pid != -1 && drvdata->pid != pid)
+		return -EBUSY;
 
 	/*
 	 * No HW configuration is needed if the sink is already in
@@ -1678,7 +1664,7 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	 */
 	if (drvdata->pid == pid) {
 		csdev->refcnt++;
-		goto unlock_out;
+		return 0;
 	}
 
 	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
@@ -1690,8 +1676,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 		csdev->refcnt++;
 	}
 
-unlock_out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	return rc;
 }
 
@@ -1710,33 +1694,26 @@ static int tmc_enable_etr_sink(struct coresight_device *csdev,
 
 static int tmc_disable_etr_sink(struct coresight_device *csdev)
 {
-	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-
-	if (drvdata->reading) {
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		return -EBUSY;
-	}
-
-	csdev->refcnt--;
-	if (csdev->refcnt) {
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		return -EBUSY;
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		if (drvdata->reading)
+			return -EBUSY;
+
+		csdev->refcnt--;
+		if (csdev->refcnt)
+			return -EBUSY;
+
+		/* Complain if we (somehow) got out of sync */
+		WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
+		tmc_etr_disable_hw(drvdata);
+		/* Dissociate from monitored process. */
+		drvdata->pid = -1;
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		/* Reset perf specific data */
+		drvdata->perf_buf = NULL;
 	}
 
-	/* Complain if we (somehow) got out of sync */
-	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
-	tmc_etr_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
-	coresight_set_mode(csdev, CS_MODE_DISABLED);
-	/* Reset perf specific data */
-	drvdata->perf_buf = NULL;
-
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
-
 	dev_dbg(&csdev->dev, "TMC-ETR disabled\n");
 	return 0;
 }
@@ -1756,70 +1733,62 @@ const struct coresight_ops tmc_etr_cs_ops = {
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
-	unsigned long flags;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
 		return -EINVAL;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (drvdata->reading) {
-		ret = -EBUSY;
-		goto out;
-	}
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
+
+	if (drvdata->reading)
+		return -EBUSY;
 
 	/*
 	 * We can safely allow reads even if the ETR is operating in PERF mode,
 	 * since the sysfs session is captured in mode specific data.
 	 * If drvdata::sysfs_data is NULL the trace data has been read already.
 	 */
-	if (!drvdata->sysfs_buf) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (!drvdata->sysfs_buf)
+		return -EINVAL;
 
 	/* Disable the TMC if we are trying to read from a running session. */
 	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
 		__tmc_etr_disable_hw(drvdata);
 
 	drvdata->reading = true;
-out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	return ret;
 }
 
 int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 {
-	unsigned long flags;
 	struct etr_buf *sysfs_buf = NULL;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
 		return -EINVAL;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock) {
+		/* RE-enable the TMC if need be */
+		if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
+			/*
+			 * The trace run will continue with the same allocated trace
+			 * buffer. Since the tracer is still enabled drvdata::buf can't
+			 * be NULL.
+			 */
+			__tmc_etr_enable_hw(drvdata);
+		} else {
+			/*
+			 * The ETR is not tracing and the buffer was just read.
+			 * As such prepare to free the trace buffer.
+			 */
+			sysfs_buf = drvdata->sysfs_buf;
+			drvdata->sysfs_buf = NULL;
+		}
 
-	/* RE-enable the TMC if need be */
-	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
-		/*
-		 * The trace run will continue with the same allocated trace
-		 * buffer. Since the tracer is still enabled drvdata::buf can't
-		 * be NULL.
-		 */
-		__tmc_etr_enable_hw(drvdata);
-	} else {
-		/*
-		 * The ETR is not tracing and the buffer was just read.
-		 * As such prepare to free the trace buffer.
-		 */
-		sysfs_buf = drvdata->sysfs_buf;
-		drvdata->sysfs_buf = NULL;
+		drvdata->reading = false;
 	}
 
-	drvdata->reading = false;
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
-
 	/* Free allocated memory out side of the spinlock */
 	if (sysfs_buf)
 		tmc_etr_free_sysfs_buf(sysfs_buf);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2671926be62a..60b395025bc4 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -195,7 +195,7 @@ struct tmc_drvdata {
 	void __iomem		*base;
 	struct coresight_device	*csdev;
 	struct miscdevice	miscdev;
-	spinlock_t		spinlock;
+	raw_spinlock_t		spinlock;
 	pid_t			pid;
 	bool			reading;
 	union {
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


