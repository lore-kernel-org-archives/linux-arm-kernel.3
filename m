Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C735EF43848
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOE5WRrPXesOYHXgj94NMoQF987fGrhqrCB2/YC8c0w=; b=kRp9094jL/Vnkk9CO9Lf7njeeV
	PTrjOJZURIdJKkbChBIw9zqF9n7wKu5WdQ9Onm1QR2/T1100N7bii3OHb+anTr6XmqnXopHbiYVhj
	Qz04CNZBTo7Cr+0Nm0AipZFL6F6S4izWfMbj8bLR6znDKinrPl52tWRKx75ljEmIC7Fs9vwFIxp1b
	HVRe5lBmuQJ/NT0+stT6ZXW5JRKFIYhzTkcqa/BZHJoWySpYw6+NUU8sPep5sWDk840hL3QgFvT6S
	oGNhb+tUoNuxkawEQBw2IvSf15QFrbDB7QyayCUDEfpHR7G4tt7HAW/CssbuoRI6Ncr/zG1I96WfC
	9O3d9xSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wz-00000001Pkw-0ATF;
	Wed, 15 Apr 2026 16:56:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD3Wv-00000001PgK-3JK9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 16:55:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14FDC32D1;
	Wed, 15 Apr 2026 09:55:51 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D91CB3F7D8;
	Wed, 15 Apr 2026 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776272156; bh=WNMVfjl8gaY3hVEW67D1uHMsfHd4ddBYKHiIsXZZOYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hyn6kJjnOq74GEIuygELvwNojFv+O7sX9PQj9YIZDMSGvosb9x80PxinpYS0N+voM
	 OyOXvbIznM4loqHOCjeaMe/awUXEm/ZuX8iK+u+WgCZzuUEtfxIMTJFUYKRlCO1g0o
	 czYjCc6S03LsvlIdGckIZqJLR1dToi/qvPBbgv04=
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
Subject: [PATCH v5 11/12] coresight: etm3x: fix inconsistencies with sysfs configuration
Date: Wed, 15 Apr 2026 17:55:27 +0100
Message-Id: <20260415165528.3369607-12-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415165528.3369607-1-yeoreum.yun@arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_095557_918949_4C1D937A 
X-CRM114-Status: GOOD (  19.82  )
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
 .../coresight/coresight-etm3x-core.c          | 49 ++++++++++---------
 2 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index 932bec82fb47..01f1a7f2559c 100644
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
index e42ca346da91..706a4c7a40df 100644
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
@@ -442,29 +442,38 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 
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
 	if (arg->rc)
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
+	else
+		drvdata->sticky_enable = true;
 }
 
 static int etm_cpu_id(struct coresight_device *csdev)
@@ -512,9 +521,6 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	struct etm_enable_arg arg = { };
 	int ret;
 
-	raw_spin_lock(&drvdata->spinlock);
-
-	drvdata->traceid = path->trace_id;
 
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
@@ -522,23 +528,25 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
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
+	else
+		etm_release_trace_id(drvdata);
+
 	return ret;
 }
 
@@ -565,7 +573,7 @@ static void etm_disable_hw(struct etm_drvdata *drvdata)
 {
 	int i;
 	const struct etm_caps *caps = &drvdata->caps;
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
@@ -636,7 +644,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	 * DYING hotplug callback is serviced by the ETM driver.
 	 */
 	cpus_read_lock();
-	raw_spin_lock(&drvdata->spinlock);
 
 	/*
 	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
@@ -645,7 +652,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm_disable_sysfs_smp_call,
 				 drvdata, 1);
 
-	raw_spin_unlock(&drvdata->spinlock);
 	cpus_read_unlock();
 
 	/*
@@ -711,15 +717,11 @@ static int etm_starting_cpu(unsigned int cpu)
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
 
@@ -728,10 +730,8 @@ static int etm_dying_cpu(unsigned int cpu)
 	if (!etmdrvdata[cpu])
 		return 0;
 
-	raw_spin_lock(&etmdrvdata[cpu]->spinlock);
 	if (coresight_get_mode(etmdrvdata[cpu]->csdev))
 		etm_disable_hw(etmdrvdata[cpu]);
-	raw_spin_unlock(&etmdrvdata[cpu]->spinlock);
 	return 0;
 }
 
@@ -884,7 +884,8 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	if (etm_arch_supported(drvdata->arch) == false)
 		return -EINVAL;
 
-	etm_set_default(&drvdata->config);
+	etm_set_default(&drvdata->active_config);
+	drvdata->config = drvdata->active_config;
 
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


