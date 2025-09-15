Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72476CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2gpbXdq9RJxD2evTsYHE10mNgcHX5gUa+5+CXM/Rpo=; b=AFG6AO7038tC64EANn0SaZRg4A
	crcAzt/vwz5/XUiOxSJdYSUU9JXPhAU5QIQrKsVYnslvCVyQKRLTOrsKJi3uAsUKA4zeiSknGEw4d
	kRtONIMrY5T4KPva2SaUfKjPC08Tp+VZyc6FPZhowMOHtzMX6Mzg5ZSk41uddgLvpaGXpnknHIYxi
	WWraAyjZ7t8jcAA3vUpC8YYxBngvM2N70p+V8XrLL5g4zN+NPbERPRECLEdJpSMdgPdAA8Z5VJ4nH
	4dyqCnxBRMr4AAr229megOTBizcKxGuDt/lB/kau4adGTfoVJriAU0I7kLOcmaSstfNkFgKKyRPOV
	kmkN1tbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Wt-00000003fNG-0jwc;
	Mon, 15 Sep 2025 10:33:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Wq-00000003fKA-0rIZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:33:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 889071BF7;
	Mon, 15 Sep 2025 03:33:39 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BBCF3F66E;
	Mon, 15 Sep 2025 03:33:46 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:26 +0100
Subject: [PATCH v3 03/31] coresight: etm3x: Always set tracer's device mode
 on target CPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-3-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=4644;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=mC+z7bkskDMNUGHCIDBDZe0qK42FFY15wl+fYU0Xll0=;
 b=gKFfo5fRLxv0H1eG3TZrTvDl40tmCRp2Oi6gvi2O8PS8SatQn+DW+J7NuTo2A41nhxDeoUT3I
 jo9dh5zf3MBCOTcti9c7B5zVmkKcAHPCgcW2AdKlXMGT6qeLKEMDh15
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033348_353360_788C0B6D 
X-CRM114-Status: GOOD (  18.13  )
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

The ETMv3 driver shares the same issue as ETMv4 regarding race
conditions when accessing the device mode.

This commit applies the same fix: ensuring that the device mode is
modified only by the target CPU to eliminate race conditions across
CPUs.

Fixes: 22fd532eaa0c ("coresight: etm3x: adding operation mode for etm_enable()")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 54 +++++++++++++++-------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 45630a1cd32fbd05ec8b2a6979f0174cacce365e..f759a47eaed9e804e30530a232370c9504912ac6 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -442,10 +442,23 @@ struct etm_enable_arg {
 static void etm_enable_hw_smp_call(void *info)
 {
 	struct etm_enable_arg *arg = info;
+	struct coresight_device *csdev;
 
 	if (WARN_ON(!arg))
 		return;
+
+	csdev = arg->drvdata->csdev;
+	if (!coresight_take_mode(csdev, CS_MODE_SYSFS)) {
+		/* Someone is already using the tracer */
+		arg->rc = -EBUSY;
+		return;
+	}
+
 	arg->rc = etm_enable_hw(arg->drvdata);
+
+	/* The tracer didn't start */
+	if (arg->rc)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
 static int etm_cpu_id(struct coresight_device *csdev)
@@ -464,17 +477,26 @@ static int etm_enable_perf(struct coresight_device *csdev,
 			   struct perf_event *event,
 			   struct coresight_path *path)
 {
+	int ret = 0;
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
 		return -EINVAL;
 
+	if (!coresight_take_mode(csdev, CS_MODE_PERF))
+		return -EBUSY;
+
 	/* Configure the tracer based on the session's specifics */
 	etm_parse_event_config(drvdata, event);
 	drvdata->traceid = path->trace_id;
 
 	/* And enable it */
-	return etm_enable_hw(drvdata);
+	ret = etm_enable_hw(drvdata);
+	/* The tracer didn't start */
+	if (ret)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+
+	return ret;
 }
 
 static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
@@ -517,12 +539,6 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
 		      enum cs_mode mode, struct coresight_path *path)
 {
 	int ret;
-	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-
-	if (!coresight_take_mode(csdev, mode)) {
-		/* Someone is already using the tracer */
-		return -EBUSY;
-	}
 
 	switch (mode) {
 	case CS_MODE_SYSFS:
@@ -535,17 +551,12 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
 		ret = -EINVAL;
 	}
 
-	/* The tracer didn't start */
-	if (ret)
-		coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
-
 	return ret;
 }
 
-static void etm_disable_hw(void *info)
+static void etm_disable_hw(struct etm_drvdata *drvdata)
 {
 	int i;
-	struct etm_drvdata *drvdata = info;
 	struct etm_config *config = &drvdata->config;
 	struct coresight_device *csdev = drvdata->csdev;
 
@@ -567,6 +578,15 @@ static void etm_disable_hw(void *info)
 		"cpu: %d disable smp call done\n", drvdata->cpu);
 }
 
+static void etm_disable_hw_smp_call(void *info)
+{
+	struct etm_drvdata *drvdata = info;
+
+	etm_disable_hw(drvdata);
+
+	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
+}
+
 static void etm_disable_perf(struct coresight_device *csdev)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
@@ -588,6 +608,8 @@ static void etm_disable_perf(struct coresight_device *csdev)
 
 	CS_LOCK(drvdata->csa.base);
 
+	coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
+
 	/*
 	 * perf will release trace ids when _free_aux()
 	 * is called at the end of the session
@@ -612,7 +634,8 @@ static void etm_disable_sysfs(struct coresight_device *csdev)
 	 * Executing etm_disable_hw on the cpu whose ETM is being disabled
 	 * ensures that register writes occur when cpu is powered.
 	 */
-	smp_call_function_single(drvdata->cpu, etm_disable_hw, drvdata, 1);
+	smp_call_function_single(drvdata->cpu, etm_disable_hw_smp_call,
+				 drvdata, 1);
 
 	spin_unlock(&drvdata->spinlock);
 	cpus_read_unlock();
@@ -652,9 +675,6 @@ static void etm_disable(struct coresight_device *csdev,
 		WARN_ON_ONCE(mode);
 		return;
 	}
-
-	if (mode)
-		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
 static const struct coresight_ops_source etm_source_ops = {

-- 
2.34.1


