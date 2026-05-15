Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E304CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjFXQLbS6kZHb3LLBkBkfGA1ASvZSnrHkXGdGRThNL8=; b=eiqSeUp6GTKuwWtu9AMZBtDaLb
	8yw4t7PAz1w/614wyhI+u1OupVL4E2+FsUuN+WqQG2jRreKck/aumAGsgVbXYkyL9UGYsOSsLzbi/
	yucEQGAVQJ3AB3R6SrlWrODNsHdu+upAUq8DM64L0oM7prsppKlHDRArqLMo0nOieyCyBopPnGybZ
	FUGiHINW6U2GdHQ7cz7Vtu+XkFZTAWVM69H0hIxeMwwTmQ2MCdBNcYQOt1dpGa1m3qKKlZo5/F8d7
	rPKFX0T+dMQGStk3xeTwfMn63qFmI386QG1xgzqf9WXxhyPn6UjaqQmILR/pd20p+9CDmemx7K8lc
	z6CzGzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqP-00000009J4J-0EHa;
	Fri, 15 May 2026 20:09:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqF-00000009Ivn-0BnY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C535F35E8;
	Fri, 15 May 2026 13:08:56 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FB533F836;
	Fri, 15 May 2026 13:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875742; bh=kihX/ty1j9272h5l+H5pHt2IGG7EUSk4TJN56sJjaYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CrtFRPHithVE5Q21OkM9kO4uvKYotaNh4Dxr+P42uTDEsWCMSqU9BPR8utQY6JqA5
	 K5yqcIvVIKhzNPaDma4MVtnazXLfbmQqkAbHVC6nz0iH2Z6ZUIph7MgxV2CIZuQXHB
	 e5Isus/rmCObElGbxbPcPfr2QE85TLBtOs/Cu2Pc=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:19 +0100
Subject: [PATCH v14 12/28] coresight: etm4x: Hook CPU PM callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-12-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=5182;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kihX/ty1j9272h5l+H5pHt2IGG7EUSk4TJN56sJjaYs=;
 b=N9bb86zPBgmzgv8JtLZll86jKPjIhh7Sp90Cbr6v5v/ZaJilpJztZBBAo7jKlL5mP2XAHtDni
 6TDJc46hbV1Du5ZCKi77j//dQhoPrZlKQz/nc/z1ls7VzqglhgH4AfE
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_130903_177891_967E4A99 
X-CRM114-Status: GOOD (  15.43  )
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
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 73 +++++++---------------
 1 file changed, 23 insertions(+), 50 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 7011a20d20042cfbeaac51797cd8592275bbf1ca..5cd70f0f3710a5ec6406a89c034d30230f782b13 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1195,11 +1195,6 @@ static const struct coresight_ops_source etm4_source_ops = {
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
@@ -1853,6 +1848,11 @@ static int etm4_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
+static inline bool etm4_pm_save_needed(struct etmv4_drvdata *drvdata)
+{
+	return !!drvdata->save_state;
+}
+
 static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 {
 	int i, ret = 0;
@@ -1995,11 +1995,12 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
 
-	if (!drvdata->save_state)
+	if (!etm4_pm_save_needed(drvdata))
 		return 0;
 
 	/*
@@ -2112,47 +2113,27 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_lock(drvdata, csa);
 }
 
-static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
+static void etm4_cpu_restore(struct coresight_device *csdev)
 {
-	if (!drvdata->save_state)
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	if (!etm4_pm_save_needed(drvdata))
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
@@ -2160,16 +2141,12 @@ static int __init etm4_pm_setup(void)
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
@@ -2183,15 +2160,11 @@ static int __init etm4_pm_setup(void)
 
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
@@ -2270,7 +2243,7 @@ static int etm4_add_coresight_dev(struct etm4_init_arg *init_arg)
 
 	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
 	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_PROC;
-	desc.ops = &etm4_cs_ops;
+	desc.ops = etm4_pm_save_needed(drvdata) ? &etm4_cs_pm_ops : &etm4_cs_ops;
 	desc.pdata = pdata;
 	desc.dev = dev;
 	desc.groups = coresight_etmv4_groups;

-- 
2.34.1


