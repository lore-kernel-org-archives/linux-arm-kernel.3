Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A54C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BV6I4/zj4hqIeIaPpoEtPHmpX2qdJ+rI3zI8WqiWm2g=; b=pbjBNNNNJ0M5Uyifngx9qZONKd
	5Y8ISWu9P4/WaBG8LopOXx8PzB4x4I2cvYzxRbaaJa4L9R/s0Y/MvgViA2FSC0tLt9DqoHf49UVVl
	TPff6k4fetuDp3t5LohH2XsugVcc9YsdLf6KkwtIBO8QsaYXFiV+KLpx+Jkao/tR+LcJPMGGTw45S
	g5fV8KPrJtmlsv6Crkj1CCWto8qFdPjhFSY4fX9kx/eq43NZ0E6p6JnoctlZJlWOZ/tq5tshBsc8a
	AwT+ktBCRR068tUfU2Nxms7+3dUTueqHrRMJ3o1sobvuoPreNpVgeiwqtUWZfF1TuXgOB3w3EnZmz
	wAnYeBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFy0D-000000041dl-3QdP;
	Fri, 16 May 2025 16:33:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxbG-00000003yPd-3t5S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:07:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93987169C;
	Fri, 16 May 2025 09:07:42 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 782523F63F;
	Fri, 16 May 2025 09:07:53 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 04/11] coresight: etm4x: Hook CPU PM callbacks
Date: Fri, 16 May 2025 17:07:35 +0100
Message-Id: <20250516160742.1200904-5-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516160742.1200904-1-leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_090755_051185_EA0C18BD 
X-CRM114-Status: GOOD (  13.45  )
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

Since the CoreSight core layer has registered CPU PM notifiers, this
patch hooks CPU save and restore callbacks to be invoked from the core
layer.

The CPU PM notifier in the ETMv4 driver is no longer needed, remove it
along with its registration and unregistration code.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 73 +++++++++++-------------------------------
 1 file changed, 18 insertions(+), 55 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index fede0be5cd43..d5fd9e58a962 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1118,19 +1118,6 @@ static void etm4_pause_perf(struct coresight_device *csdev)
 	drvdata->paused = true;
 }
 
-static const struct coresight_ops_source etm4_source_ops = {
-	.cpu_id		= etm4_cpu_id,
-	.enable		= etm4_enable,
-	.disable	= etm4_disable,
-	.resume_perf	= etm4_resume_perf,
-	.pause_perf	= etm4_pause_perf,
-};
-
-static const struct coresight_ops etm4_cs_ops = {
-	.trace_id	= coresight_etm_get_trace_id,
-	.source_ops	= &etm4_source_ops,
-};
-
 static bool cpu_supports_sysreg_trace(void)
 {
 	u64 dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
@@ -1928,8 +1915,9 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
 
 	/* Save the TRFCR irrespective of whether the ETM is ON */
@@ -2051,46 +2039,29 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_lock(drvdata, csa);
 }
 
-static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
+static void etm4_cpu_restore(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
 	if (drvdata->trfcr)
 		write_trfcr(drvdata->save_trfcr);
 	if (drvdata->state_needs_restore)
 		__etm4_cpu_restore(drvdata);
 }
 
-static int etm4_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
-			      void *v)
-{
-	struct etmv4_drvdata *drvdata;
-	unsigned int cpu = smp_processor_id();
-
-	if (!etmdrvdata[cpu])
-		return NOTIFY_OK;
-
-	drvdata = etmdrvdata[cpu];
-
-	if (WARN_ON_ONCE(drvdata->cpu != cpu))
-		return NOTIFY_BAD;
-
-	switch (cmd) {
-	case CPU_PM_ENTER:
-		if (etm4_cpu_save(drvdata))
-			return NOTIFY_BAD;
-		break;
-	case CPU_PM_EXIT:
-	case CPU_PM_ENTER_FAILED:
-		etm4_cpu_restore(drvdata);
-		break;
-	default:
-		return NOTIFY_DONE;
-	}
-
-	return NOTIFY_OK;
-}
+static const struct coresight_ops_source etm4_source_ops = {
+	.cpu_id		= etm4_cpu_id,
+	.enable		= etm4_enable,
+	.disable	= etm4_disable,
+	.resume_perf	= etm4_resume_perf,
+	.pause_perf	= etm4_pause_perf,
+	.save		= etm4_cpu_save,
+	.restore	= etm4_cpu_restore,
+};
 
-static struct notifier_block etm4_cpu_pm_nb = {
-	.notifier_call = etm4_cpu_pm_notify,
+static const struct coresight_ops etm4_cs_ops = {
+	.trace_id	= coresight_etm_get_trace_id,
+	.source_ops	= &etm4_source_ops,
 };
 
 /* Setup PM. Deals with error conditions and counts */
@@ -2098,16 +2069,12 @@ static int __init etm4_pm_setup(void)
 {
 	int ret;
 
-	ret = cpu_pm_register_notifier(&etm4_cpu_pm_nb);
-	if (ret)
-		return ret;
-
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING,
 					"arm/coresight4:starting",
 					etm4_starting_cpu, etm4_dying_cpu);
 
 	if (ret)
-		goto unregister_notifier;
+		return ret;
 
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
 					"arm/coresight4:online",
@@ -2121,15 +2088,11 @@ static int __init etm4_pm_setup(void)
 
 	/* failed dyn state - remove others */
 	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
-
-unregister_notifier:
-	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
 	return ret;
 }
 
 static void etm4_pm_clear(void)
 {
-	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
 	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
 	if (hp_online) {
 		cpuhp_remove_state_nocalls(hp_online);
-- 
2.34.1


