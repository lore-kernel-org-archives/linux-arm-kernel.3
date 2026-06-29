Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C35C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+d8r8anuMfDqDG/HAIweba5xqaFQqia2CnTwKCI/bxc=; b=R3FzZVon5uD5oJ0w5Im9Xjogu0
	GutcBtgFdsM+2GtDLXgaOdEB05YttjC/yIRexEVN4GLLd/zGW3Iojuh+mHZgq3SGXotv7DRi3UqXa
	dLsyo1q39+KvKgJgbFzUWg63dEh5xxhORYWma4UZfGrQm68Ho0ia2zvoYoevAu4gN3qdi2M14I2BQ
	ssUALIFpLVdnfpBFg1hVOqjPdDYAAY7x1nXc0XM8Qgj3zurzxlQ96dwMUlbpsQ4O4mVuYrUWYOyh0
	zelth3eC58kXjbMpKp/2k2IoFh2meR32v21jl8TQFtrdK6LPCtwH1/O/gq9vuMieQDkn3pi2hJp/H
	+oPLB4FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7rF-0000000E5E8-2wwL;
	Mon, 29 Jun 2026 09:00:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7r3-0000000E53h-2G0m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:00:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 411971758;
	Mon, 29 Jun 2026 02:00:32 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E26E63F836;
	Mon, 29 Jun 2026 02:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782723636; bh=8EnwiIfgwlN2Y7BNtdTxzvy00l8ApsOSgyW1urhamks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZhW3ezUlVFTcJsmsFBBxs7qZ5QOU42V8GWRix9ZbPvb3s7puqEd43XSNevE/jROKY
	 1QVLE2jrZGro8no2IiPAloESyLnh4Zdnv+4BJCIA79zNgMcVKqwY/n7X8PvjDmJ4Tp
	 bYEeaGAfB7EeUrYPfzBzWyMeEawHoT3ETq+KZUIo=
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
Subject: [PATCH v8 12/13] coresight: etm3x: fix inconsistencies with sysfs configuration
Date: Mon, 29 Jun 2026 10:00:05 +0100
Message-ID: <20260629090007.1718746-13-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629090007.1718746-1-yeoreum.yun@arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_020037_656045_2C533578 
X-CRM114-Status: GOOD (  18.95  )
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
 drivers/hwtracing/coresight/coresight-etm.h   |  2 +
 .../coresight/coresight-etm3x-core.c          | 38 +++++++++----------
 2 files changed, 21 insertions(+), 19 deletions(-)

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
index ccfde9eda537..ed27e35b42ec 100644
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
@@ -443,24 +443,30 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
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
@@ -469,6 +475,7 @@ static void etm_enable_sysfs_smp_call(void *info)
 		return;
 	}
 
+	drvdata->sticky_enable = true;
 	csdev->path = arg->path;
 }
 
@@ -513,10 +520,6 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 	struct etm_enable_arg arg = { };
 	int ret;
 
-	raw_spin_lock(&drvdata->spinlock);
-
-	drvdata->traceid = path->trace_id;
-
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
 	 * hw configuration will take place on the local CPU during bring up.
@@ -524,23 +527,24 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
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
-	raw_spin_unlock(&drvdata->spinlock);
-
 	if (!ret)
 		dev_dbg(&csdev->dev, "ETM tracing enabled\n");
+	else
+		etm_release_trace_id(drvdata);
+
 	return ret;
 }
 
@@ -567,7 +571,7 @@ static void etm_disable_hw(struct etm_drvdata *drvdata)
 {
 	int i;
 	const struct etm_caps *caps = &drvdata->caps;
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
@@ -633,8 +637,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	raw_spin_lock(&drvdata->spinlock);
-
 	/*
 	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
 	 * ensures that register writes occur when cpu is powered.
@@ -642,8 +644,6 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	smp_call_function_single(drvdata->cpu, etm_disable_sysfs_smp_call,
 				 drvdata, 1);
 
-	raw_spin_unlock(&drvdata->spinlock);
-
 	/*
 	 * we only release trace IDs when resetting sysfs.
 	 * This permits sysfs users to read the trace ID after the trace
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


