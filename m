Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74158CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjFXQLbS6kZHb3LLBkBkfGA1ASvZSnrHkXGdGRThNL8=; b=fiGWUz2sOPbp58egEyW+hnnO5q
	9fl6/kPTbKKrOR0IJpy+ROmGI2j0xN85sXLomgn9pJi96Vw9On1f/6skeW5HsdBYL+mC1p2sWFLsp
	reXGKaoFr8nq+2Npxwfx6DZJjmbHaLL5pQBSMoPbZrhFeDunYoS8uV4qi64X8YproAeum7y2bA8d4
	BcQZFSgll50gDREI2vzdOYi6NnxjQRYpdSTE1QrK8JPKYjw42anDDdwNLJWZ2Chysc3tR5t9Lprw3
	PbjB79WMLtMxDbLlRRlgWDJJqHI92GG8awLFxPMOfoSGlcsU6qmv1KiDYSNzChhjBHct+JLGjuxd5
	x5FrjtUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY9-0000000DFSp-0tx2;
	Mon, 11 May 2026 11:11:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY0-0000000DFFc-0rLH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E87EA22C8;
	Mon, 11 May 2026 04:11:33 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1B043F85F;
	Mon, 11 May 2026 04:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497899; bh=kihX/ty1j9272h5l+H5pHt2IGG7EUSk4TJN56sJjaYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=djwVpaVOdCsgq0MiS+lLnjTBMhxy2d8HstdyCpIVCsdeC8OHvbzsoL1bqwTld8ABO
	 4tqzCuKOndO7WfzzB8t6yz6ERZybJeXoIOI2PEOWgbbhFttroUFHNACoLxulsJ7LMT
	 Xttwq3nrk4defx22iNxLNFf6pCJtvLpxRHs4vNuc=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:56 +0100
Subject: [PATCH v12 12/28] coresight: etm4x: Hook CPU PM callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-12-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=5182;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kihX/ty1j9272h5l+H5pHt2IGG7EUSk4TJN56sJjaYs=;
 b=6huoKqwnqX6vXpZaxklv/TIzNJsGJXPT6ZQeui8Vn0KKhXSrwspDSwpPJgjPW/Vp72mCrvYt5
 51rqboy7wmWArjWKA3CIfyHx5fB+At0W3ILPh9rfQ8nzTBj5UFWXoX6
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041140_465753_EAE881A4 
X-CRM114-Status: GOOD (  15.29  )
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


