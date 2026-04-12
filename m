Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DA2E937EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cfZPwHQMM6EXbP2fxDxFBF5KOdtO2T0F00hyj68224=; b=16ZcPihmoma9sxeMTY4SqJcdLH
	1RHa/bft6zR8kyZWzSwZew+mGaQSQJ/vq7udSJ23nOhCHpXrquT7EEhoBIc/Xyf3UNauABXy1oKhE
	oIJrUYWLhOmC+rOUDIcXhJAGIa9lD59IROHGjyLcrBsuLdL+/+aJWIGwV105/ry4UyjkGqGTxpJie
	gIUbuo1flRDQIBYk0IKksZNUka0DEvTREoJ7E5mVSHSYmgnPAbUfLO2+nMgVoE3h8ZvrQ8W4OTHK/
	ZSL26RUEqbUepoYpIggxsZsqp2ReAmnAZ7RKOS4nE5pU9gVgr6fmqmcy4gIn3MjLh6++8u0Vt1ydr
	V7xVnqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBz1r-0000000EYzH-2xEw;
	Sun, 12 Apr 2026 17:55:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBz1k-0000000EYsx-3oqI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:55:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B3C832FA;
	Sun, 12 Apr 2026 10:55:14 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 68AD43F7B4;
	Sun, 12 Apr 2026 10:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776016519; bh=mKawjLnXNWYlIwgbwkDtV+GuxhWy+F6OTu66yyuoBXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bEt1G7qL8bX2GHo1LJv7EPRTleftY8FaFRgMRHk60gozbhAHAqVuryNPxALHLGzpE
	 fzlr81KIUa9RY6cQchnUD9ZLEShjRIgefmqDLxFE7Dk6bPFWqVDKmQwmHknyiqGS4q
	 2wKptTxBgrjGRS+ByZbfec+AJJR+ZEbU/3bhQgJU=
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
Subject: [PATCH v3 5/5] coresight: etm3x: fix inconsistencies with sysfs configration
Date: Sun, 12 Apr 2026 18:55:06 +0100
Message-Id: <20260412175506.412301-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260412175506.412301-1-yeoreum.yun@arm.com>
References: <20260412175506.412301-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_105521_031209_74384BEE 
X-CRM114-Status: GOOD (  17.26  )
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

To resolve these inconsistencies, the configuration should be separated into:

  - active_config, which is applied configuration for the current session
  - config, which stores the settings configured via sysfs.

and apply configuration after taking a mode.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm.h   |  2 ++
 .../coresight/coresight-etm3x-core.c          | 20 ++++++++++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index 2ffe477c0c12..85ede334c9d0 100644
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
index f669eeeef538..efed6b8a7d72 100644
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
@@ -442,24 +442,30 @@ static int etm_enable_hw(struct etm_drvdata *drvdata)
 
 struct etm_enable_arg {
 	struct etm_drvdata *drvdata;
+	u32 traceid;
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
 
+	drvdata->active_config = drvdata->config;
+	drvdata->traceid = arg->traceid;
+
 	arg->rc = etm_enable_hw(arg->drvdata);
 
 	/* The tracer didn't start */
@@ -514,14 +520,13 @@ static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_pat
 
 	spin_lock(&drvdata->spinlock);
 
-	drvdata->traceid = path->trace_id;
-
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
 	 * hw configuration will take place on the local CPU during bring up.
 	 */
 	if (cpu_online(drvdata->cpu)) {
 		arg.drvdata = drvdata;
+		arg.traceid = path->trace_id;
 		ret = smp_call_function_single(drvdata->cpu,
 					       etm_enable_sysfs_smp_call, &arg, 1);
 		if (!ret)
@@ -565,7 +570,7 @@ static void etm_disable_hw(struct etm_drvdata *drvdata)
 {
 	int i;
 	const struct etm_caps *caps = &drvdata->caps;
-	struct etm_config *config = &drvdata->config;
+	struct etm_config *config = &drvdata->active_config;
 	struct coresight_device *csdev = drvdata->csdev;
 
 	CS_UNLOCK(drvdata->csa.base);
@@ -884,7 +889,8 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	if (etm_arch_supported(drvdata->arch) == false)
 		return -EINVAL;
 
-	etm_set_default(&drvdata->config);
+	etm_set_default(&drvdata->active_config);
+	drvdata->config = drvdata->active_config;
 
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


