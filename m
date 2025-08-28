Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D297C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lf5ZECxAaWM8BOsOzxfdrHVFn9MCgibsgnagZszPAMk=; b=SD6l/VwTPgaRPg3WuwBOVGN7sZ
	I9qI+eSp5uFZ4YxRQAc/qwL7dP8C01fAmNfu9m0pCkXHwmY3/AOp8m9QuUyluJZzl3chalkLMKM8u
	as5sxGK7WS9+no737hQBQT5FaVVltLIfEX2pEXmElVmI/5Rf5rl3ey3Z/0kacLpIJTfhF+eaQipmE
	CWP5wq3cQXNZrnXlUIHtBif5xn40dzvBp3MXZGV1nox72j0JIUrFAev5RFpz8DpK1HFSwCMDhcl1/
	ZXFaeI6JyM5At8tGdD8/UUZVEHZX+KQRKbMPiqt0GhjLu3Ne8dMulLS+MssZRBFhrEqQ9+8mxI4Ya
	FnHEnFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLQ-00000002Phv-2v7F;
	Thu, 28 Aug 2025 17:23:28 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraVq-00000001IEa-0dmG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 11:09:52 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cCJWC3Rz1z1R8vR;
	Thu, 28 Aug 2025 19:06:47 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 2F409180043;
	Thu, 28 Aug 2025 19:09:44 +0800 (CST)
Received: from localhost.localdomain (10.90.31.46) by
 kwepemo100006.china.huawei.com (7.202.195.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 28 Aug 2025 19:09:43 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <viresh.kumar@linaro.org>, <rafael@kernel.org>, <ionela.voinescu@arm.com>,
	<beata.michalska@arm.com>, <zhenglifeng1@huawei.com>
CC: <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<zhanjie9@hisilicon.com>, <jonathan.cameron@huawei.com>
Subject: [PATCH v2 2/2] cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs
Date: Thu, 28 Aug 2025 19:02:12 +0800
Message-ID: <20250828110212.2108653-3-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250828110212.2108653-1-zhanjie9@hisilicon.com>
References: <20250828110212.2108653-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_040950_573919_30D4B540 
X-CRM114-Status: GOOD (  19.39  )
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

Currently, the CPPC Frequency Invariance Engine (FIE) is invoked from the
scheduler tick but defers the update of arch_freq_scale to a separate
thread because cppc_get_perf_ctrs() would sleep if the CPC regs are in PCC.

However, this deferred update mechanism is unnecessary and introduces extra
overhead for non-PCC register spaces (e.g. System Memory or FFH), where
accessing the regs won't sleep and can be safely performed from the tick
context.  Also, reading perf counters of a remote CPU may return 0 if it's
in a low-power idle state, e.g. power down or reset.

Update arch_freq_scale directly in ticks for non-PCC regs and keep the
deferred update mechanism for PCC regs.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/cpufreq/cppc_cpufreq.c | 52 +++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 7724318b3415..66d74b062ceb 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -55,31 +55,24 @@ static int cppc_perf_from_fbctrs(struct cppc_cpudata *cpu_data,
 				 struct cppc_perf_fb_ctrs *fb_ctrs_t1);
 
 /**
- * cppc_scale_freq_workfn - CPPC arch_freq_scale updater for frequency invariance
- * @work: The work item.
+ * __cppc_scale_freq_tick - CPPC arch_freq_scale updater for frequency invariance
+ * @cppc_fi: per-cpu CPPC FIE data.
  *
- * The CPPC driver register itself with the topology core to provide its own
+ * The CPPC driver registers itself with the topology core to provide its own
  * implementation (cppc_scale_freq_tick()) of topology_scale_freq_tick() which
  * gets called by the scheduler on every tick.
  *
  * Note that the arch specific counters have higher priority than CPPC counters,
  * if available, though the CPPC driver doesn't need to have any special
  * handling for that.
- *
- * On an invocation of cppc_scale_freq_tick(), we schedule an irq work (since we
- * reach here from hard-irq context), which then schedules a normal work item
- * and cppc_scale_freq_workfn() updates the per_cpu arch_freq_scale variable
- * based on the counter updates since the last tick.
  */
-static void cppc_scale_freq_workfn(struct kthread_work *work)
+static void __cppc_scale_freq_tick(struct cppc_freq_invariance *cppc_fi)
 {
-	struct cppc_freq_invariance *cppc_fi;
 	struct cppc_perf_fb_ctrs fb_ctrs = {0};
 	struct cppc_cpudata *cpu_data;
 	unsigned long local_freq_scale;
 	u64 perf;
 
-	cppc_fi = container_of(work, struct cppc_freq_invariance, work);
 	cpu_data = cppc_fi->cpu_data;
 
 	if (cppc_get_perf_ctrs(cppc_fi->cpu, &fb_ctrs)) {
@@ -104,6 +97,14 @@ static void cppc_scale_freq_workfn(struct kthread_work *work)
 	per_cpu(arch_freq_scale, cppc_fi->cpu) = local_freq_scale;
 }
 
+static void cppc_scale_freq_workfn(struct kthread_work *work)
+{
+	struct cppc_freq_invariance *cppc_fi;
+
+	cppc_fi = container_of(work, struct cppc_freq_invariance, work);
+	__cppc_scale_freq_tick(cppc_fi);
+}
+
 static void cppc_irq_work(struct irq_work *irq_work)
 {
 	struct cppc_freq_invariance *cppc_fi;
@@ -112,7 +113,14 @@ static void cppc_irq_work(struct irq_work *irq_work)
 	kthread_queue_work(kworker_fie, &cppc_fi->work);
 }
 
-static void cppc_scale_freq_tick(void)
+/*
+ * Reading perf counters may sleep if the CPC regs are in PCC.  Thus, we
+ * schedule an irq work in scale_freq_tick (since we reach here from hard-irq
+ * context), which then schedules a normal work item cppc_scale_freq_workfn()
+ * that updates the per_cpu arch_freq_scale variable based on the counter
+ * updates since the last tick.
+ */
+static void cppc_scale_freq_tick_pcc(void)
 {
 	struct cppc_freq_invariance *cppc_fi = &per_cpu(cppc_freq_inv, smp_processor_id());
 
@@ -123,6 +131,11 @@ static void cppc_scale_freq_tick(void)
 	irq_work_queue(&cppc_fi->irq_work);
 }
 
+static void cppc_scale_freq_tick(void)
+{
+	__cppc_scale_freq_tick(&per_cpu(cppc_freq_inv, smp_processor_id()));
+}
+
 static struct scale_freq_data cppc_sftd = {
 	.source = SCALE_FREQ_SOURCE_CPPC,
 	.set_freq_scale = cppc_scale_freq_tick,
@@ -140,8 +153,10 @@ static void cppc_cpufreq_cpu_fie_init(struct cpufreq_policy *policy)
 		cppc_fi = &per_cpu(cppc_freq_inv, cpu);
 		cppc_fi->cpu = cpu;
 		cppc_fi->cpu_data = policy->driver_data;
-		kthread_init_work(&cppc_fi->work, cppc_scale_freq_workfn);
-		init_irq_work(&cppc_fi->irq_work, cppc_irq_work);
+		if (cppc_perf_ctrs_in_pcc()) {
+			kthread_init_work(&cppc_fi->work, cppc_scale_freq_workfn);
+			init_irq_work(&cppc_fi->irq_work, cppc_irq_work);
+		}
 
 		ret = cppc_get_perf_ctrs(cpu, &cppc_fi->prev_perf_fb_ctrs);
 		if (ret && cpu_online(cpu)) {
@@ -174,6 +189,9 @@ static void cppc_cpufreq_cpu_fie_exit(struct cpufreq_policy *policy)
 	/* policy->cpus will be empty here, use related_cpus instead */
 	topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_CPPC, policy->related_cpus);
 
+	if (!cppc_perf_ctrs_in_pcc())
+		return;
+
 	for_each_cpu(cpu, policy->related_cpus) {
 		cppc_fi = &per_cpu(cppc_freq_inv, cpu);
 		irq_work_sync(&cppc_fi->irq_work);
@@ -206,9 +224,11 @@ static void __init cppc_freq_invariance_init(void)
 		}
 	}
 
-	if (fie_disabled)
+	if (fie_disabled || !cppc_perf_ctrs_in_pcc())
 		return;
 
+	cppc_sftd.set_freq_scale = cppc_scale_freq_tick_pcc;
+
 	kworker_fie = kthread_run_worker(0, "cppc_fie");
 	if (IS_ERR(kworker_fie)) {
 		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
@@ -228,7 +248,7 @@ static void __init cppc_freq_invariance_init(void)
 
 static void cppc_freq_invariance_exit(void)
 {
-	if (fie_disabled)
+	if (fie_disabled || !cppc_perf_ctrs_in_pcc())
 		return;
 
 	kthread_destroy_worker(kworker_fie);
-- 
2.33.0


