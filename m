Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B8CC53209
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q67MuTbFmRK0rLKIDhqkamPgF1DCOyP4Qt5Gnmyo4Fo=; b=sTBWU40arVBidSuCxKAfGmBeQV
	cWVg4TX8fM75+fy8n1LLUI+5rS86yxgzcOTO0lgL5Lak7hwXR29S76l9iHVvvLUtf2NrioUgHY1iQ
	r1Hb6JKNiV+iAnk1z4qHqYaDEbXZRguSvdOzyDyRp5sQlXKiVf18jbU7ULN86MDI55ScJ/h/vciMX
	2kbeP0zHQ5dEEB/9Ww0bRet5GQNv1vGSRoH0RyDkJZ1NqWk3hq4rxq3cie1fUOrKnFa+ng9NIWHY4
	xJpbK2CTNrD8jRHDDQW+d7lswvPEh5+TG74uSYKd46AZfiym+HSfs879fYZLYlzIhqzoTfLcY912p
	ENoHkFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnah5-00000000IQO-3tm4;
	Sat, 25 Jul 2026 11:37:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnagq-00000000IHJ-3zl5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 11:37:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10B171477;
	Sat, 25 Jul 2026 04:37:07 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B60683F86F;
	Sat, 25 Jul 2026 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784979431; bh=GHTTzxHWLdl1uMrdB8kCdE27n2DxxXM4vDcg0NzZJF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bPKZeMMYBkdEDZO8Z4MhPVvO8s36MvKXa30C35CQa3cJ0BzmP81i/a6r+5YZS5O8L
	 lHZrM0gliQYkzSgED9ctAg5GqSn5921PnJ7IyjGtHg/jcWJDINBCplYvV2pkKBaLhv
	 derrKWH/VzGTnF1feq72lkHFNU5QC46mebTz9p70=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com,
	jie.gan@oss.qualcomm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v9 06/13] coresight: etm3x: fix inconsistencies with sysfs configuration
Date: Sat, 25 Jul 2026 12:36:38 +0100
Message-ID: <20260725113645.57519-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725113645.57519-1-yeoreum.yun@arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_043713_283311_E89A2765 
X-CRM114-Status: GOOD (  19.22  )
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

Fixes: 1925a470ce69 ("coresight: etm3x: splitting struct etm_drvdata")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm.h   |  4 +-
 .../coresight/coresight-etm3x-core.c          | 38 +++++++++----------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index 1d753cca2943..f3796162168d 100644
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
index 862ad0786699..93dc98145b66 100644
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
@@ -442,24 +442,30 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
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
+	drvdata = arg->drvdata;
+	csdev = drvdata->csdev;
 	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
 		/* Someone is already using the tracer */
 		arg->rc = -EBUSY;
 		return;
 	}
 
+	drvdata->active_config = arg->config;
+	drvdata->traceid = arg->path->trace_id;
+
 	arg->rc = etm_enable_hw(arg->drvdata);
 
 	/* The tracer didn't start */
@@ -468,6 +474,7 @@ static void etm_enable_sysfs_smp_call(void *info)
 		return;
 	}
 
+	drvdata->sticky_enable = true;
 	csdev->path = arg->path;
 }
 
@@ -512,10 +519,6 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	struct etm_enable_arg arg = { };
 	int ret;
 
-	spin_lock(&drvdata->spinlock);
-
-	drvdata->traceid = path->trace_id;
-
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
 	 * hw configuration will take place on the local CPU during bring up.
@@ -523,23 +526,24 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	if (cpu_online(drvdata->cpu)) {
 		arg.drvdata = drvdata;
 		arg.path = path;
+
+		raw_spin_lock(&drvdata->spinlock);
+		arg.config = drvdata->config;
+		raw_spin_unlock(&drvdata->spinlock);
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
-		etm_release_trace_id(drvdata);
-
-	spin_unlock(&drvdata->spinlock);
-
 	if (!ret)
 		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
+	else
+		etm_release_trace_id(drvdata);
+
 	return ret;
 }
 
@@ -565,7 +569,7 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
 static void etm_disable_hw(struct etm_drvdata *drvdata)
 {
 	int i;
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
@@ -631,8 +635,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	spin_lock(&drvdata->spinlock);
-
 	/*
 	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
 	 * ensures that register writes occur when cpu is powered.
@@ -640,8 +642,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm_disable_sysfs_smp_call,
 				 drvdata, 1);
 
-	spin_unlock(&drvdata->spinlock);
-
 	/*
 	 * we only release trace IDs when resetting sysfs.
 	 * This permits sysfs users to read the trace ID after the trace
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


