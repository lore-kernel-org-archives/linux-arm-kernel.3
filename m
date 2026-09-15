Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A258C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/mMPc3Fxgkqvv4WACytuClKmyWkzg1Y/xZ5fBiBi2o=; b=XvSM7OcMJ8Hlu9bZIA/TihBqJr
	s6NXt2W3J+fhSjDgofTCryEaRCnaNnvdq6qL0z8RIYP8D3DjsxoyQO3dXFJGsoXWvcUw/pAuI5gXe
	EwxBTHsuuew6V8ZJFN06M33x50p7wxYwIrKllCBG7IderLfRIrSu4vkF3xRt3fluyOqpcF7gXzBJ5
	EZjXjaIrUq3gmhHZjG7QHvIxQkAWpEEOMuKsZ7rPjRtpKTMqwJMPFo+eG+HgNdHd5dYxJfRdoAogV
	QSC8JBM9STMileknNKxLdRqch3RhclHlsb+vpUIE+jqJDij/J1uLCkobbhXdgQGd2h6ISuHjzadUj
	wnmuyjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RSg-00000006Cvg-3DDI;
	Tue, 15 Sep 2026 11:36:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RRC-00000006BRm-2N2d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:35:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AEE9169E;
	Tue, 15 Sep 2026 04:34:54 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5889F3F86F;
	Tue, 15 Sep 2026 04:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789472098; bh=e0rclFqMC0eAmxpUWaIU2Q1JqHHqdj9jdGG9lzmKhpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L4PTubePCr9JPAdADoVQuxyO1CBj0prkCgSgoG9cAboSS9xnvJjCi8gWMEHCIsPD7
	 OfeLyNuh/P9NL+QOvKnhz7lpD6SD3R+NFZVSpkNgT8m71nzYXDdF5S6w8o+KAi/fDo
	 dvLqtE6ofKi4JVBfJNNSLduNxfkOYhKXrcrs9frg=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 15 Sep 2026 12:34:39 +0100
Subject: [PATCH v11 4/9] coresight: etm3x: fix inconsistencies with sysfs
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-separate_etm_cfg_v2-v11-4-d2b258d51747@arm.com>
References: <20260915-separate_etm_cfg_v2-v11-0-d2b258d51747@arm.com>
In-Reply-To: <20260915-separate_etm_cfg_v2-v11-0-d2b258d51747@arm.com>
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11685; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=e0rclFqMC0eAmxpUWaIU2Q1JqHHqdj9jdGG9lzmKhpw=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqqS1Uc2TxvZc8KYfEMM/S5lHKT39Oe4w67Yy34
 TF7zAtVBQyJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqktVAAKCRBt1cPRWsUx
 M5b/DACopfpIlq30vG/jViSDbt0NtmxfgYWF05bbaDGR6Ay61xmxG7LlE5WTxW1DLBdSeZPFw2r
 9WNIdj+h/0zEfRYRVTkq2swTx+c8aXDY9SGuPGoefc4GS9krw3VvfXSkKkq3PyOjxcSezYd2tNY
 bkU6aq1MVvhXoikukBjvkqtm6HPQMER/0zFkE+GeDWU7qnZdf8IktbyLdR/5aHo6hAAeAKKJX7p
 q1O0kI48h1+ELh8sultqg1NkgvfCZJ/QxOqN7xfqGjIafyCgJRqg9Ar2d0r7PiNVHFK1cpEM+Ni
 rLJxx7tkefHpl3viZjmpHHFmAGecYwM3s7to+er3jgCUfl+bERyJHvYqBLWBVySmRLCsE9FeLUG
 03THX3eocYPmRZKUNO4lI/TfWteEsss/mC+SLVEk6ZOlBq+rGo8Zed2f7SMXMvIMc6lgPew/nul
 ASdE9TrO0hOHz+isD2s9no2qjtnFfM0h7bPGuU745JSvA5yfG9IUVMKMWrAaL7VonvJ14=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_043502_220891_DE3F6D29 
X-CRM114-Status: GOOD (  26.44  )
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

The current ETM3x configuration via sysfs can lead to the following
inconsistencies:

  - If a configuration is modified via sysfs while a perf session is
    active, the running configuration may differ between before
    a sched-out and after a subsequent sched-in.

To resolve these issues, separate the configuration into:

  - active_config: the configuration applied to the current session
  - config: the configuration set via sysfs

Additionally:

  - Since active_config and related fields are accessed only by the local CPU
    in etm_enable/disable_sysfs_smp_call() (similar to perf enable/disable),
    remove the lock/unlock from the sysfs enable/disable path and
    starting/dying_cpu path except when to access config fields only.

  - Some of sysfs interface read etm register directly. To reduce lock
    scope while the etm_enable_hw()/etm_disable_hw(), handle it via
    IPI so that registers could be read from on proper CPU.

Fixes: 1925a470ce69 ("coresight: etm3x: splitting struct etm_drvdata")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm.h        |  4 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 68 ++++++++++--------
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    | 80 +++++++++++++++-------
 3 files changed, 100 insertions(+), 52 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index 1d753cca29439..f3796162168d4 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -226,7 +226,8 @@ struct etm_config {
  * @etmccr:	value of register ETMCCR.
  * @etmccer:	value of register ETMCCER.
  * @traceid:	value of the current ID for this component.
- * @config:	structure holding configuration parameters.
+ * @active_config:	structure holding current running configuration.
+ * @config:	structure holding sysfs mode configuration.
  */
 struct etm_drvdata {
 	struct csdev_access		csa;
@@ -248,6 +249,7 @@ struct etm_drvdata {
 	u32				etmccr;
 	u32				etmccer;
 	u32				traceid;
+	struct etm_config		active_config;
 	struct etm_config		config;
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 862ad0786699c..fd76a57e5f861 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -308,7 +308,7 @@ void etm_config_trace_mode(struct etm_config *config)
 static int etm_parse_event_config(struct etm_drvdata *drvdata,
 				  struct perf_event *event)
 {
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct perf_event_attr *attr = &event->attr;
 	u8 ts_level;
 
@@ -367,7 +367,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 {
 	int i, rc;
 	u32 etmcr;
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
@@ -442,32 +442,30 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 struct etm_enable_arg {
 	struct etm_drvdata *drvdata;
 	struct coresight_path *path;
+	struct etm_config config;
 	int rc;
 };
 
 static void etm_enable_sysfs_smp_call(void *info)
 {
 	struct etm_enable_arg *arg = info;
+	struct etm_drvdata *drvdata;
 	struct coresight_device *csdev;
 
 	if (WARN_ON(!arg))
 		return;
 
-	csdev = arg->drvdata->csdev;
-	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
-		/* Someone is already using the tracer */
-		arg->rc = -EBUSY;
-		return;
-	}
+	drvdata = arg->drvdata;
+	csdev = drvdata->csdev;
 
-	arg->rc = etm_enable_hw(arg->drvdata);
+	drvdata->active_config = arg->config;
+	drvdata->traceid = arg->path->trace_id;
 
-	/* The tracer didn't start */
-	if (arg->rc) {
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
+	arg->rc = etm_enable_hw(arg->drvdata);
+	if (arg->rc)
 		return;
-	}
 
+	drvdata->sticky_enable = true;
 	csdev->path = arg->path;
 }
 
@@ -512,9 +510,10 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	struct etm_enable_arg arg = { };
 	int ret;
 
-	spin_lock(&drvdata->spinlock);
-
-	drvdata->traceid = path->trace_id;
+	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
+		/* Someone is already using the tracer */
+		return -EBUSY;
+	}
 
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
@@ -523,23 +522,27 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	if (cpu_online(drvdata->cpu)) {
 		arg.drvdata = drvdata;
 		arg.path = path;
+
+		scoped_guard(spinlock, &drvdata->spinlock) {
+			arg.config = drvdata->config;
+		}
+
 		ret = smp_call_function_single(drvdata->cpu,
 					       etm_enable_sysfs_smp_call, &arg, 1);
 		if (!ret)
 			ret = arg.rc;
-		if (!ret)
-			drvdata->sticky_enable = true;
 	} else {
 		ret = -ENODEV;
 	}
 
-	if (ret)
+	if (!ret) {
+		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
+	} else {
 		etm_release_trace_id(drvdata);
+		/* The tracer didn't start */
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+	}
 
-	spin_unlock(&drvdata->spinlock);
-
-	if (!ret)
-		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
 	return ret;
 }
 
@@ -565,7 +568,7 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
 static void etm_disable_hw(struct etm_drvdata *drvdata)
 {
 	int i;
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
@@ -593,7 +596,6 @@ static void etm_disable_sysfs_smp_call(void *info)
 	etm_disable_hw(drvdata);
 
 	drvdata->csdev->path = NULL;
-	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
 }
 
 static void etm_disable_perf(struct coresight_device *csdev)
@@ -630,8 +632,9 @@ static void etm_disable_perf(struct coresight_device *csdev)
 static void etm_disable_sysfs(struct coresight_device *csdev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-
-	spin_lock(&drvdata->spinlock);
+	struct etm_config *config = &drvdata->config;
+	const struct etm_config *active_config = &drvdata->active_config;
+	int i;
 
 	/*
 	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
@@ -640,7 +643,14 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm_disable_sysfs_smp_call,
 				 drvdata, 1);
 
-	spin_unlock(&drvdata->spinlock);
+	/*
+	 * Userspace may read seq_curr_state and cntr_val through sysfs
+	 * after the sysfs-session has been disabled.
+	 */
+	for (i = 0; i < drvdata->nr_cntr; i++)
+		config->cntr_val[i] = active_config->cntr_val[i];
+
+	config->seq_curr_state = active_config->seq_curr_state;
 
 	/*
 	 * we only release trace IDs when resetting sysfs.
@@ -649,6 +659,8 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	 * prior trace id allocation method
 	 */
 
+	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
+
 	dev_dbg(&csdev->dev, "ETM tracing disabled\n");
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index d4846d6364945..2c8c129228589 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -6,10 +6,48 @@
 
 #include <linux/pid_namespace.h>
 #include <linux/pm_runtime.h>
+#include <linux/smp.h>
 #include <linux/sysfs.h>
 #include "coresight-etm.h"
 #include "coresight-priv.h"
 
+struct etm_readl_cslocked_arg {
+	struct etm_drvdata *drvdata;
+	u32 off;
+	unsigned long *val;
+};
+
+static void etm_readl_cslocked_smp_call(void *info)
+{
+	struct etm_readl_cslocked_arg *arg = info;
+
+	CS_UNLOCK(arg->drvdata->csa.base);
+	*arg->val = etm_readl(arg->drvdata, arg->off);
+	CS_LOCK(arg->drvdata->csa.base);
+}
+
+static int etm_readl_cslocked(struct etm_drvdata *drvdata, u32 off,
+			      unsigned long *val)
+{
+	int ret;
+	struct etm_readl_cslocked_arg arg;
+
+	ret = pm_runtime_get_sync(drvdata->csdev->dev.parent);
+	if (ret < 0)
+		goto out;
+
+	arg.drvdata = drvdata;
+	arg.off = off;
+	arg.val = val;
+
+	ret = smp_call_function_single(drvdata->cpu,
+				       etm_readl_cslocked_smp_call,
+				       (void *)&arg, 1);
+out:
+	pm_runtime_put(drvdata->csdev->dev.parent);
+	return ret;
+}
+
 static ssize_t nr_addr_cmp_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
@@ -45,18 +83,13 @@ static DEVICE_ATTR_RO(nr_ctxid_cmp);
 static ssize_t etmsr_show(struct device *dev,
 			  struct device_attribute *attr, char *buf)
 {
-	unsigned long flags, val;
+	int ret;
+	unsigned long val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	pm_runtime_get_sync(dev->parent);
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-	CS_UNLOCK(drvdata->csa.base);
-
-	val = etm_readl(drvdata, ETMSR);
-
-	CS_LOCK(drvdata->csa.base);
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
-	pm_runtime_put(dev->parent);
+	ret = etm_readl_cslocked(drvdata, ETMSR, &val);
+	if (ret)
+		return ret;
 
 	return sprintf(buf, "%#lx\n", val);
 }
@@ -74,7 +107,7 @@ static ssize_t reset_store(struct device *dev,
 	ret = kstrtoul(buf, 16, &val);
 	if (ret)
 		return ret;
-	if (coresight_get_mode(drvdata->csdev))
+	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
 		return -EBUSY;
 
 	if (val) {
@@ -719,7 +752,9 @@ static DEVICE_ATTR_RW(cntr_rld_event);
 static ssize_t cntr_val_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
+	int ret;
 	u32 val;
+	unsigned long val2;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
@@ -728,7 +763,10 @@ static ssize_t cntr_val_show(struct device *dev,
 		val = config->cntr_val[config->cntr_idx];
 		spin_unlock(&drvdata->spinlock);
 	} else {
-		val = etm_readl(drvdata, ETMCNTVRn(config->cntr_idx));
+		ret = etm_readl_cslocked(drvdata, ETMCNTVRn(config->cntr_idx), &val2);
+		if (ret)
+			return ret;
+		val = val2;
 	}
 
 	return sysfs_emit(buf, "%#x\n", val);
@@ -746,7 +784,7 @@ static ssize_t cntr_val_store(struct device *dev,
 	ret = kstrtoul(buf, 16, &val);
 	if (ret)
 		return ret;
-	if (coresight_get_mode(drvdata->csdev))
+	if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
 		return -EBUSY;
 
 	spin_lock(&drvdata->spinlock);
@@ -934,7 +972,8 @@ static DEVICE_ATTR_RW(seq_13_event);
 static ssize_t seq_curr_state_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
-	unsigned long val, flags;
+	int ret;
+	unsigned long val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
 
@@ -943,15 +982,10 @@ static ssize_t seq_curr_state_show(struct device *dev,
 		goto out;
 	}
 
-	pm_runtime_get_sync(dev->parent);
-	spin_lock_irqsave(&drvdata->spinlock, flags);
-
-	CS_UNLOCK(drvdata->csa.base);
-	val = (etm_readl(drvdata, ETMSQR) & ETM_SQR_MASK);
-	CS_LOCK(drvdata->csa.base);
-
-	spin_unlock_irqrestore(&drvdata->spinlock, flags);
-	pm_runtime_put(dev->parent);
+	ret = etm_readl_cslocked(drvdata, ETMSQR, &val);
+	if (ret)
+		return ret;
+	val &= ETM_SQR_MASK;
 out:
 	return sprintf(buf, "%#lx\n", val);
 }

-- 
2.43.0


