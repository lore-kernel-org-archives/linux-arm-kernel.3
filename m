Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD55F3092E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIp8xOMbTbR13gIFUKES3OFetO+KypUcHaHgvMkgBlg=; b=cXrM4KCae+qnE+ZOZJrd3VJLjw
	xVD8Fk5jLeOdM8emHHLQAhWW2e9Wa7PdszZU6QERiDPe7tcgshAwrLmcM/V0YdnfAVTp2jUKRfy8L
	ulAdU/DHv7fm6i0cVixwDnMmUAYxu15F2/l2hp+ytVW2YHE5adA/HmESH5MO/PM6QChrK7z9pHuVM
	qOfF8nVdWMqD6VVyfexRPba7Vkhlhqu/j3PDHTr9peCTiCSVCNqa9J7riyuRPwTYwiskbLu8hZndy
	ISakkQSKa/+0dlAXKV9dBB649QPsdo3ntyEoc59LjjHXTut8/MHPLg0iOwxSSbcMvWgGP3qnDaQOR
	YYuXwN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mI-00000001XlP-0bez;
	Thu, 05 Mar 2026 10:17:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mF-00000001Xhy-3QCI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:17:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D763D1596;
	Thu,  5 Mar 2026 02:17:48 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 437B93F694;
	Thu,  5 Mar 2026 02:17:53 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:35 +0000
Subject: [PATCH v6 04/19] coresight: etm4x: Hook CPU PM callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-4-eff765d211a9@arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=4070;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=lOEiQp8QZsgi+YOSH5x2rPbcdFBdRnYuz/09dLLAnks=;
 b=eKKGaVcIHdnDfoMCM+P7JVJ18iW0yUUp0d0tvwYXjJ+ZB7JRV864e1YGmPuUUXRNjMI9fVl1j
 LWNkKMFcxhkBH77zc2oclX6T5WNldlvX5kQynmPZV1ed/9B1F1XigfV
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_021755_956756_E2AF8701 
X-CRM114-Status: GOOD (  14.12  )
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

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 59 ++++------------------
 1 file changed, 11 insertions(+), 48 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index add4cc9c1eca42b58d8f9d7bb3dc8d2ea1241ee2..ab2031647616111d0689442149bcfdb0accbb218 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1208,11 +1208,6 @@ static const struct coresight_ops_source etm4_source_ops = {
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
@@ -2008,8 +2003,9 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	return ret;
 }
 
-static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
+static int etm4_cpu_save(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
 
 	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
@@ -2125,8 +2121,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	etm4_cs_lock(drvdata, csa);
 }
 
-static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
+static void etm4_cpu_restore(struct coresight_device *csdev)
 {
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
 	if (pm_save_enable != PARAM_PM_SAVE_SELF_HOSTED)
 		return;
 
@@ -2134,38 +2132,11 @@ static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
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
-
-static struct notifier_block etm4_cpu_pm_nb = {
-	.notifier_call = etm4_cpu_pm_notify,
+static const struct coresight_ops etm4_cs_ops = {
+	.trace_id		= coresight_etm_get_trace_id,
+	.pm_save_disable	= etm4_cpu_save,
+	.pm_restore_enable	= etm4_cpu_restore,
+	.source_ops		= &etm4_source_ops,
 };
 
 /* Setup PM. Deals with error conditions and counts */
@@ -2173,16 +2144,12 @@ static int __init etm4_pm_setup(void)
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
@@ -2196,15 +2163,11 @@ static int __init etm4_pm_setup(void)
 
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


