Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F981E6F062
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 07:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21sb1tjXgMlGdW+ATutO10jP0fJ5nU9o5OtfgIrQcAI=; b=YwxWe9A3iJ/x7Rd+XXxTB1m2EW
	WC3aR2YltKt0Ie6qYFJKRGyadMyL9eD8+P0vNx67UrZUySExZAzue1N20j6yIaeWUgEp0VRnpgpRe
	j4/YRK3CDIQN47H1Vaca4c4GRRKCEacdOkIqsm6vYZjk/8ES4QaBCMJLYsNCM5z0knqKG6iARlpXx
	csFj4xJGcH2cpMz0dI7byVFd7hE6HTE6peiXfupEDliLw0S9nEeRDZNdpR90BcgP+JtWEEvixVOMg
	lbOckEc4bTSM3n6kjdb5DciNcWqXu5dhLd0cCbkRPcyrs50oeosAAz9pRFt9g/I8zaX3drlcfeZtG
	mF3uWI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwkM-0000000Edtd-3x1O;
	Tue, 23 Dec 2025 07:23:54 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXwkJ-0000000EdsJ-15Ba
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 07:23:53 +0000
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4db5yD2KcWzcb0v;
	Tue, 23 Dec 2025 15:20:36 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F93040562;
	Tue, 23 Dec 2025 15:23:40 +0800 (CST)
Received: from localhost.localdomain (10.90.31.46) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 23 Dec 2025 15:23:39 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <viresh.kumar@linaro.org>, <rafael@kernel.org>, <ionela.voinescu@arm.com>,
	<beata.michalska@arm.com>, <pierre.gondois@arm.com>,
	<zhenglifeng1@huawei.com>
CC: <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<zhanjie9@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <yubowen8@huawei.com>, <lihuisong@huawei.com>,
	<zhangpengjie2@huawei.com>, <wangzhi12@huawei.com>
Subject: [PATCH v5 3/3] cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs
Date: Tue, 23 Dec 2025 15:21:19 +0800
Message-ID: <20251223072119.3372582-4-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20251223072119.3372582-1-zhanjie9@hisilicon.com>
References: <20251223072119.3372582-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_232351_660005_53BBD8DD 
X-CRM114-Status: GOOD (  21.36  )
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
context.

Furthermore, with the CPPC FIE registered, it throws repeated warnings of
"cppc_scale_freq_workfn: failed to read perf counters" on our platform with
the CPC regs in System Memory and a power-down idle state enabled.  That's
because the remote CPU can be in a power-down idle state, and reading its
perf counters returns 0.  Moving the FIE handling back to the scheduler
tick process makes the CPU handle its own perf counters, so it won't be
idle and the issue would be inherently solved.

To address the above issues, update arch_freq_scale directly in ticks for
non-PCC regs and keep the deferred update mechanism for PCC regs.

Reviewed-by: Lifeng Zheng <zhenglifeng1@huawei.com>
Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>
Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/cpufreq/cppc_cpufreq.c | 77 +++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 947b4e2e1d4e..36e8a75a37f1 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -54,31 +54,24 @@ static int cppc_perf_from_fbctrs(struct cppc_perf_fb_ctrs *fb_ctrs_t0,
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
@@ -102,6 +95,24 @@ static void cppc_scale_freq_workfn(struct kthread_work *work)
 	per_cpu(arch_freq_scale, cppc_fi->cpu) = local_freq_scale;
 }
 
+static void cppc_scale_freq_tick(void)
+{
+	__cppc_scale_freq_tick(&per_cpu(cppc_freq_inv, smp_processor_id()));
+}
+
+static struct scale_freq_data cppc_sftd = {
+	.source = SCALE_FREQ_SOURCE_CPPC,
+	.set_freq_scale = cppc_scale_freq_tick,
+};
+
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
@@ -110,7 +121,14 @@ static void cppc_irq_work(struct irq_work *irq_work)
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
 
@@ -121,13 +139,14 @@ static void cppc_scale_freq_tick(void)
 	irq_work_queue(&cppc_fi->irq_work);
 }
 
-static struct scale_freq_data cppc_sftd = {
+static struct scale_freq_data cppc_sftd_pcc = {
 	.source = SCALE_FREQ_SOURCE_CPPC,
-	.set_freq_scale = cppc_scale_freq_tick,
+	.set_freq_scale = cppc_scale_freq_tick_pcc,
 };
 
 static void cppc_cpufreq_cpu_fie_init(struct cpufreq_policy *policy)
 {
+	struct scale_freq_data *sftd = &cppc_sftd;
 	struct cppc_freq_invariance *cppc_fi;
 	int cpu, ret;
 
@@ -138,8 +157,11 @@ static void cppc_cpufreq_cpu_fie_init(struct cpufreq_policy *policy)
 		cppc_fi = &per_cpu(cppc_freq_inv, cpu);
 		cppc_fi->cpu = cpu;
 		cppc_fi->cpu_data = policy->driver_data;
-		kthread_init_work(&cppc_fi->work, cppc_scale_freq_workfn);
-		init_irq_work(&cppc_fi->irq_work, cppc_irq_work);
+		if (cppc_perf_ctrs_in_pcc_cpu(cpu)) {
+			kthread_init_work(&cppc_fi->work, cppc_scale_freq_workfn);
+			init_irq_work(&cppc_fi->irq_work, cppc_irq_work);
+			sftd = &cppc_sftd_pcc;
+		}
 
 		ret = cppc_get_perf_ctrs(cpu, &cppc_fi->prev_perf_fb_ctrs);
 
@@ -155,7 +177,7 @@ static void cppc_cpufreq_cpu_fie_init(struct cpufreq_policy *policy)
 	}
 
 	/* Register for freq-invariance */
-	topology_set_scale_freq_source(&cppc_sftd, policy->cpus);
+	topology_set_scale_freq_source(sftd, policy->cpus);
 }
 
 /*
@@ -178,6 +200,8 @@ static void cppc_cpufreq_cpu_fie_exit(struct cpufreq_policy *policy)
 	topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_CPPC, policy->related_cpus);
 
 	for_each_cpu(cpu, policy->related_cpus) {
+		if (!cppc_perf_ctrs_in_pcc_cpu(cpu))
+			continue;
 		cppc_fi = &per_cpu(cppc_freq_inv, cpu);
 		irq_work_sync(&cppc_fi->irq_work);
 		kthread_cancel_work_sync(&cppc_fi->work);
@@ -206,6 +230,7 @@ static void cppc_fie_kworker_init(void)
 		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
 			PTR_ERR(kworker_fie));
 		fie_disabled = FIE_DISABLED;
+		kworker_fie = NULL;
 		return;
 	}
 
@@ -215,20 +240,24 @@ static void cppc_fie_kworker_init(void)
 			ret);
 		kthread_destroy_worker(kworker_fie);
 		fie_disabled = FIE_DISABLED;
+		kworker_fie = NULL;
 	}
 }
 
 static void __init cppc_freq_invariance_init(void)
 {
-	if (fie_disabled != FIE_ENABLED && fie_disabled != FIE_DISABLED) {
-		fie_disabled = FIE_ENABLED;
-		if (cppc_perf_ctrs_in_pcc()) {
+	bool perf_ctrs_in_pcc = cppc_perf_ctrs_in_pcc();
+
+	if (fie_disabled == FIE_UNSET) {
+		if (perf_ctrs_in_pcc) {
 			pr_info("FIE not enabled on systems with registers in PCC\n");
 			fie_disabled = FIE_DISABLED;
+		} else {
+			fie_disabled = FIE_ENABLED;
 		}
 	}
 
-	if (fie_disabled)
+	if (fie_disabled || !perf_ctrs_in_pcc)
 		return;
 
 	cppc_fie_kworker_init();
@@ -236,10 +265,8 @@ static void __init cppc_freq_invariance_init(void)
 
 static void cppc_freq_invariance_exit(void)
 {
-	if (fie_disabled)
-		return;
-
-	kthread_destroy_worker(kworker_fie);
+	if (kworker_fie)
+		kthread_destroy_worker(kworker_fie);
 }
 
 #else
-- 
2.33.0


