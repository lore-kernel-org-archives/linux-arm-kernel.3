Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F47F34C56
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyG89jE+6tJBTZx0IWaNMJACTBVhPWY5g3vtXS6Nh70=; b=t2myoGHJrg8zklttOiKOv6aYiF
	7vwks6PH/CPZIF55zmgGnkkHivyxhyPDziYwKJEGzTruYrw58tC7Jlm/ycHwv1C6OwwD5Ojbsji30
	bNZBkZjjyaxgMhOV1WP7NEw64HuXSswv66UO0m3bzHVBs8JIWYhPTNehRbhRKDOavgPvK2Gij2Q6a
	YhDfRAMoI+uR6NL/+ZlL7u5GglVmNaVf/73uQuoxloQo8Iu8fGvFO8U67/6nwrSfDGvzyQj+8k8Ny
	47hWgyK8A9SsSu8mYXABEFhbrBdEWnZKCf0p9G0FxyY5ehBFRR/bLlt/KN+JlXaKS1tUhNvWgNlVT
	25Sar2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCI9L-0000000Fqdu-3zCB;
	Mon, 13 Apr 2026 14:20:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCI9G-0000000Fqa0-3SVn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 14:20:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1541F35A2;
	Mon, 13 Apr 2026 07:20:16 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3E9AD3F641;
	Mon, 13 Apr 2026 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776090021; bh=bQRfhRuZXvm88Pj7CcvZ2HThwnZUbwf3ay4bC+YJNcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vKPRu6Mwl2ZZRA06fdVuqAM6VU7H5lVY1TROAx2MOrMbcHPxSMvWxpl6PcVwzRJy1
	 x+ViviJc/9R6z+EvLreCZnbA2eryOwGG26L3GlByjzYsMGqdDrK4fXo+wfmSeNAo7C
	 0NbmhB1OhzwvjYCwJsc53EmXOVCkQlwKAqq1YMEc=
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
Subject: [PATCH v4 8/9] coresight: etm3x: fix inconsistencies with sysfs configuration
Date: Mon, 13 Apr 2026 15:20:01 +0100
Message-Id: <20260413142003.3549310-9-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413142003.3549310-1-yeoreum.yun@arm.com>
References: <20260413142003.3549310-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_072022_942272_38539E70 
X-CRM114-Status: GOOD (  20.45  )
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

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm.h   |  2 +
 .../coresight/coresight-etm3x-core.c          | 49 +++++++++----------
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index 8d1a1079b008..e381acb47d20 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -243,6 +243,7 @@ struct etm_config {
  * @boot_enable:true if we should start tracing at boot time.
  * @os_unlock:	true if access to management registers is allowed.
  * @traceid:	value of the current ID for this component.
+ * @active_config:	structure holding current running configuration parameters.
  * @config:	structure holding configuration parameters.
  */
 struct etm_drvdata {
@@ -258,6 +259,7 @@ struct etm_drvdata {
 	bool				boot_enable;
 	bool				os_unlock;
 	u32				traceid;
+	struct etm_config		active_config;
 	struct etm_config		config;
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index e42ca346da91..b7e3b5eea3f9 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -309,7 +309,7 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 				  struct perf_event *event)
 {
 	const struct etm_caps *caps = &drvdata->caps;
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct perf_event_attr *attr = &event->attr;
 	u8 ts_level;
 
@@ -368,7 +368,7 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 	int i, rc;
 	u32 etmcr;
 	const struct etm_caps *caps = &drvdata->caps;
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
@@ -442,29 +442,39 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 
 struct etm_enable_arg {
 	struct etm_drvdata *drvdata;
+	u32 traceid;
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
+	drvdata->traceid = arg->traceid;
+
 	arg->rc = etm_enable_hw(arg->drvdata);
 
 	/* The tracer didn't start */
-	if (arg->rc)
+	if (arg->rc) {
+		etm_release_trace_id(drvdata);
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
+	} else
+		drvdata->sticky_enable = true;
 }
 
 static int etm_cpu_id(struct coresight_device *csdev)
@@ -512,9 +522,6 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	struct etm_enable_arg arg = { };
 	int ret;
 
-	raw_spin_lock(&drvdata->spinlock);
-
-	drvdata->traceid = path->trace_id;
 
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
@@ -522,21 +529,20 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	 */
 	if (cpu_online(drvdata->cpu)) {
 		arg.drvdata = drvdata;
+		arg.traceid = path->trace_id;
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
-	raw_spin_unlock(&drvdata->spinlock);
-
 	if (!ret)
 		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
 	return ret;
@@ -565,7 +571,7 @@ static void etm_disable_hw(struct etm_drvdata *drvdata)
 {
 	int i;
 	const struct etm_caps *caps = &drvdata->caps;
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
@@ -636,7 +642,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	 * DYING hotplug callback is serviced by the ETM driver.
 	 */
 	cpus_read_lock();
-	raw_spin_lock(&drvdata->spinlock);
 
 	/*
 	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
@@ -645,7 +650,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm_disable_sysfs_smp_call,
 				 drvdata, 1);
 
-	raw_spin_unlock(&drvdata->spinlock);
 	cpus_read_unlock();
 
 	/*
@@ -711,15 +715,11 @@ static int etm_starting_cpu(unsigned int cpu)
 	if (!etmdrvdata[cpu])
 		return 0;
 
-	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
-	if (!etmdrvdata[cpu]->os_unlock) {
+	if (!etmdrvdata[cpu]->os_unlock)
 		etm_os_unlock(etmdrvdata[cpu]);
-		etmdrvdata[cpu]->os_unlock = true;
-	}
 
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
 		etm_enable_hw(etmdrvdata[cpu]);
-	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }
 
@@ -728,10 +728,8 @@ static int etm_dying_cpu(unsigned int cpu)
 	if (!etmdrvdata[cpu])
 		return 0;
 
-	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
 		etm_disable_hw(etmdrvdata[cpu]);
-	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }
 
@@ -884,7 +882,8 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	if (etm_arch_supported(drvdata->arch) == false)
 		return -EINVAL;
 
-	etm_set_default(&drvdata->config);
+	etm_set_default(&drvdata->active_config);
+	drvdata->config = drvdata->active_config;
 
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


