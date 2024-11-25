Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1FED3B7F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohDBbX5wykAAdNyCI+XvgU3CimrF19MrDkF4qpXyhuM=; b=4mZkX2mq/hN6vi5wmhSqvgcJpn
	9aJx8Ll1hhNOGv5vh8MuXTqNVYOwTqPWGrlCWKTeuSQ5ui7GbEBtkPxTbf6pw/rYoi0Si4jOW0l5p
	jwlfAKfijefpxXWQmREa0JI9Pwk9cTnmD2JhJbwOD8g4xH1dH5iYyMPcDDjENd5Z0rIvpoK8KtMi+
	xkHuc4gabqGzzb+mtfVMrJke2bZXVRVbDWEaYPlr2N+ZNTr7c8fsAzRj+fkyk85xla6d3fVpay5JW
	4Il4kxBrDNb/wJMbbnPmJESUrnkAlz9vAgc3HqyeG9ifpCpwoBKRN04z9qWg/XHBDIdaKfcUENFGt
	K53UQesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFW9w-00000007hr8-3SLz;
	Mon, 25 Nov 2024 10:17:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVhq-00000007dmS-1crK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:48:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C16821756;
	Mon, 25 Nov 2024 01:49:03 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8DBBF3F66E;
	Mon, 25 Nov 2024 01:48:31 -0800 (PST)
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
Subject: [PATCH 5/9] coresight-etb10: change etb_drvdata spinlock's type to raw_spinlock_t
Date: Mon, 25 Nov 2024 09:48:12 +0000
Message-Id: <20241125094816.365472-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125094816.365472-1-yeoreum.yun@arm.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_014834_509936_67FE38B1 
X-CRM114-Status: GOOD (  19.25  )
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

In coresight-etb10 drivers, etb_drvdata->spinlock can be held
during __schedule() by perf_event_task_sched_out()/in().

Since etb_drvdata->spinlock type is spinlock_t and
perf_event_task_sched_out()/in() is called after acquiring rq_lock,
which is raw_spinlock_t (an unsleepable lock),
this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.

To address this, change type etb_drvdata->spinlock in coresight-etb10 drivers,
which can be called by perf_event_task_sched_out()/in(),
from spinlock_t to raw_spinlock_t.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etb10.c | 62 +++++++------------
 1 file changed, 22 insertions(+), 40 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index aea9ac9c4bd0..ec439f8fbc1e 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -84,7 +84,7 @@ struct etb_drvdata {
 	struct clk		*atclk;
 	struct coresight_device	*csdev;
 	struct miscdevice	miscdev;
-	spinlock_t		spinlock;
+	raw_spinlock_t		spinlock;
 	local_t			reading;
 	pid_t			pid;
 	u8			*buf;
@@ -141,56 +141,47 @@ static int etb_enable_hw(struct etb_drvdata *drvdata)
 
 static int etb_enable_sysfs(struct coresight_device *csdev)
 {
-	int ret = 0;
-	unsigned long flags;
+	int ret;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* Don't messup with perf sessions. */
-	if (coresight_get_mode(csdev) == CS_MODE_PERF) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (coresight_get_mode(csdev) == CS_MODE_PERF)
+		return -EBUSY;
 
 	if (coresight_get_mode(csdev) == CS_MODE_DISABLED) {
 		ret = etb_enable_hw(drvdata);
 		if (ret)
-			goto out;
+			return ret;
 
 		coresight_set_mode(csdev, CS_MODE_SYSFS);
 	}
 
 	csdev->refcnt++;
-out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
-	return ret;
+
+	return 0;
 }
 
 static int etb_enable_perf(struct coresight_device *csdev, void *data)
 {
-	int ret = 0;
+	int ret;
 	pid_t pid;
-	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_output_handle *handle = data;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* No need to continue if the component is already in used by sysFS. */
-	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+		return -EBUSY;
 
 	/* Get a handle on the pid of the process to monitor */
 	pid = buf->pid;
 
-	if (drvdata->pid != -1 && drvdata->pid != pid) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (drvdata->pid != -1 && drvdata->pid != pid)
+		return -EBUSY;
 
 	/*
 	 * No HW configuration is needed if the sink is already in
@@ -198,7 +189,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 	 */
 	if (drvdata->pid == pid) {
 		csdev->refcnt++;
-		goto out;
+		return 0;
 	}
 
 	/*
@@ -208,7 +199,7 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 	 */
 	ret = etb_set_buffer(csdev, handle);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = etb_enable_hw(drvdata);
 	if (!ret) {
@@ -218,8 +209,6 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 		csdev->refcnt++;
 	}
 
-out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	return ret;
 }
 
@@ -350,13 +339,11 @@ static void etb_disable_hw(struct etb_drvdata *drvdata)
 static int etb_disable(struct coresight_device *csdev)
 {
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	unsigned long flags;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	csdev->refcnt--;
 	if (csdev->refcnt) {
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
 		return -EBUSY;
 	}
 
@@ -366,7 +353,6 @@ static int etb_disable(struct coresight_device *csdev)
 	/* Dissociate from monitored process. */
 	drvdata->pid = -1;
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	dev_dbg(&csdev->dev, "ETB disabled\n");
 	return 0;
@@ -434,7 +420,7 @@ static unsigned long etb_update_buffer(struct coresight_device *csdev,
 	const u32 *barrier;
 	u32 read_ptr, write_ptr, capacity;
 	u32 status, read_data;
-	unsigned long offset, to_read = 0, flags;
+	unsigned long offset, to_read = 0;
 	struct cs_buffers *buf = sink_config;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
@@ -443,11 +429,11 @@ static unsigned long etb_update_buffer(struct coresight_device *csdev,
 
 	capacity = drvdata->buffer_depth * ETB_FRAME_SIZE_WORDS;
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
 	/* Don't do anything if another tracer is using this sink */
 	if (csdev->refcnt != 1)
-		goto out;
+		return 0;
 
 	__etb_disable_hw(drvdata);
 	CS_UNLOCK(drvdata->base);
@@ -565,8 +551,6 @@ static unsigned long etb_update_buffer(struct coresight_device *csdev,
 
 	__etb_enable_hw(drvdata);
 	CS_LOCK(drvdata->base);
-out:
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	return to_read;
 }
@@ -585,15 +569,13 @@ static const struct coresight_ops etb_cs_ops = {
 
 static void etb_dump(struct etb_drvdata *drvdata)
 {
-	unsigned long flags;
+	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
-	spin_lock_irqsave(&drvdata->spinlock, flags);
 	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
 		__etb_disable_hw(drvdata);
 		etb_dump_hw(drvdata);
 		__etb_enable_hw(drvdata);
 	}
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	dev_dbg(&drvdata->csdev->dev, "ETB dumped\n");
 }
@@ -746,7 +728,7 @@ static int etb_probe(struct amba_device *adev, const struct amba_id *id)
 	drvdata->base = base;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 
-	spin_lock_init(&drvdata->spinlock);
+	raw_spin_lock_init(&drvdata->spinlock);
 
 	drvdata->buffer_depth = etb_get_buffer_depth(drvdata);
 
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


