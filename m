Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7F3E9D800
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSP06l2YTb1a3TWJPk0+VyryPfAjFlx1a5JgV4XHpd8=; b=YpcpB7sXTZWZzN+oFB9NSOPMPd
	X+5mm8EiQgoVfGLftA5OOtG0PRSxn4TzyBXI5FxMzi69Jo0iaF9oJB5cDeJZlWM5oYeaZln1c3rnl
	IG4U/k5SOxbIxjlsAkDuHQQaECFVWsENnDLZ1blMBJmNpQiKC2P4DHNG0txnC8lWzPx9W8sWgg9De
	XOyysy4E+0WwOOt0CN9P3sQYh7ov0YyTe+DNIuCGb7YuOP0dJQb9okahrJt5bBu9wHsB4h2x/aHu5
	MrG5lokI1kst501zj0ZlFWeaLnKnoZ9uhrgDqDDG8q8b2m99N3Zp39mj1izg5B3KwyqOG3jK9LhGN
	X4S61+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0c-00000004HMA-3Kgk;
	Sun, 05 Apr 2026 15:03:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0Z-00000004HIu-4AAK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71C491758;
	Sun,  5 Apr 2026 08:03:20 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B03B3F62B;
	Sun,  5 Apr 2026 08:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401406; bh=kgS6m9EaulNq/IDRCiQqlRgRzSWhamXTzLpxWfiqK+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ogIbS0P6A09y6LnJbTnIC0u+i+Cv+fIDRJTC4fGBoYYJKdKIM+Qkn2QPNj/ra1V1K
	 865j1XPwsd20GogbGgtGH89sZ2OMjGfWSOrPXfkycSsCEA3UGriCyrXwbZ9JtPMLNu
	 NV/Qq5UsRKgQcJGBuXMr6iGa3CyQJoLcIeSuyfUY=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:44 +0100
Subject: [PATCH v10 08/20] coresight: etm4x: Hook CPU PM callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-8-13e94754a8be@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=5553;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kgS6m9EaulNq/IDRCiQqlRgRzSWhamXTzLpxWfiqK+M=;
 b=JQMZ8+ZE7f1aE5NoKUcDw/wKOcdIVL9oczfSgDLt+9S3+0vtGhdLiAAoQm/qh4TUt8s2zmM/G
 v4fQSJrkQXxAOGH6S5huWd0ZG/FLpmbfOtY7OCXBxMQnZ3tAGk2UHI0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080328_119878_0B4CDDB0 
X-CRM114-Status: GOOD (  15.23  )
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

Add a helper etm4_pm_save_needed() to detect if need save context for
self-hosted PM mode and hook pm_save_disable() and pm_restore_enable()
callbacks through etm4_cs_pm_ops structure.  With this, ETMv4 PM
save/restore is integrated into the core layer's CPU PM.

Organize etm4_cs_ops and etm4_cs_pm_ops together for more readable.

The CPU PM notifier in the ETMv4 driver is no longer needed, remove it
along with its registration and unregistration code.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 75 +++++++---------------
 1 file changed, 24 insertions(+), 51 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 7b91fab9895d7b2a65ebb1161b117d9d3f5fca1b..3fe9ebf31fe19738c8cfa3cfe6d3464ab96726ce 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1203,11 +1203,6 @@ static const struct coresight_ops_source etm4_source_ops = {
 	.pause_perf	= etm4_pause_perf,
 };
 
-static const struct coresight_ops etm4_cs_ops = {
-	.trace_id	= coresight_etm_get_trace_id,
-	.source_ops	= &etm4_source_ops,
-};
-
 static bool cpu_supports_sysreg_trace(void)
 {
 	u64 dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
@@ -1861,6 +1856,11 @@ static int etm4_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
+static inline bool etm4_pm_save_needed(void)
+{
+	return pm_save_enable == PARAM_PM_SAVE_SELF_HOSTED;
+}
+
 static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int i, ret = 0;
@@ -2003,11 +2003,12 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
 
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+	if (!etm4_pm_save_needed())
 		return 0;
 
 	/*
@@ -2120,47 +2121,27 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_lock(drvdata, csa);
 }
 
-static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
+static void etm4_cpu_restore(struct coresight_device *csdev)
 {
-	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	if (!etm4_pm_save_needed())
 		return;
 
 	if (coresight_get_mode(drvdata->csdev))
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
+static const struct coresight_ops etm4_cs_ops = {
+	.trace_id	= coresight_etm_get_trace_id,
+	.source_ops	= &etm4_source_ops,
+};
 
-static struct notifier_block etm4_cpu_pm_nb = {
-	.notifier_call = etm4_cpu_pm_notify,
+static const struct coresight_ops etm4_cs_pm_ops = {
+	.trace_id		= coresight_etm_get_trace_id,
+	.source_ops		= &etm4_source_ops,
+	.pm_save_disable	= etm4_cpu_save,
+	.pm_restore_enable	= etm4_cpu_restore,
 };
 
 /* Setup PM. Deals with error conditions and counts */
@@ -2168,16 +2149,12 @@ static int __init etm4_pm_setup(void)
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
@@ -2191,15 +2168,11 @@ static int __init etm4_pm_setup(void)
 
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
@@ -2251,7 +2224,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 
 	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
 	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_PROC;
-	desc.ops = &etm4_cs_ops;
+	desc.ops = etm4_pm_save_needed() ? &etm4_cs_pm_ops : &etm4_cs_ops;
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etmv4_groups;
@@ -2306,7 +2279,7 @@ static int etm4_probe(struct device *dev)
 		pm_save_enable = coresight_loses_context_with_cpu(dev) ?
 			       PARAM_PM_SAVE_SELF_HOSTED : PARAM_PM_SAVE_NEVER;
 
-	if (pm_save_enable != PARAM_PM_SAVE_NEVER) {
+	if (etm4_pm_save_needed()) {
 		drvdata->save_state = devm_kmalloc(dev,
 				sizeof(struct etmv4_save_state), GFP_KERNEL);
 		if (!drvdata->save_state)

-- 
2.34.1


