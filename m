Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1926D10BE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvSoVXsXJaF6FhP0ZQOvDa+hyLFyvo6McM7V8aRgxqg=; b=2M6t88MKdpfOtHFe/QgWSYHLcA
	EEnZ7eXRHMlAoZaVMtosqNcP+Glh/3uPvudtOYMRsuGQPSgqcZe+T+G+U1A3RHz8Q1qKuTeRglhL0
	1LRPOPJO7NIpLuSGtjMLejmzFSUpvXveHAXC4cdcLS8A211Yr217BFEgEb04Vt97TeXZx3dzMOyot
	JDYmuty+/Fdd8vhj1qTbwVvd9bVAg8mzvDWCLah7dSp0AL1kCnTWnKFnQx6yWgyqJADCPJEcUKKP3
	K8em4hTd7b/br2OXH/B0eK1M0J60fn+gchKv9eAYU2IexZ3H5KBxd05L6GNTpMr9ehWGcRH6M2TjU
	bdbencKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bN6-000000068sg-2RBH;
	Sat, 26 Oct 2024 07:38:04 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bAW-000000066se-2Die
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 07:25:07 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XbB3H5YZlz20qbD;
	Sat, 26 Oct 2024 15:23:55 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 9AA8114010D;
	Sat, 26 Oct 2024 15:24:50 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 26 Oct 2024 15:24:50 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v3 2/8] drivers/perf: hisi: Improve the detection of associated CPUs
Date: Sat, 26 Oct 2024 15:24:18 +0800
Message-ID: <20241026072424.29887-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241026072424.29887-1-yangyicong@huawei.com>
References: <20241026072424.29887-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_002505_105304_4CEBFA43 
X-CRM114-Status: GOOD (  24.26  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Currently the associated CPUs are detected in the cpuhp online
callback. If the CPU's sccl_id or the ccl_id matches the PMU's,
they're associated. There's an exception that some PMUs locate
on the SICL and will match no CPUs. The events of these PMUs
can be opened on any online CPUs. To handle this we just check
whether the PMU's sccl_id is -1, if so we know it locates on
SICL and make any CPU associated to it.

This can be tweaked so in this patch just do the below changes:
- If the PMU doesn't match any CPU then associated it to online CPUs
- Choose the target CPU according to the NUMA affinity for opening
  events

The function is implemented by hisi_pmu_init_associated_cpus() and
invoked in hisi_pmu_init().

Also the associated_cpus are maintained with all the online CPUs. This
is redundant since we'll always schedule the events on the online CPUs.
Get rid of this and make associated_cpus contain offline CPUs as well.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_pmu.c | 56 +++++++++++++++++++-----
 drivers/perf/hisilicon/hisi_uncore_pmu.h |  5 +++
 2 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index 416f72a813fc..c3549e16e0c3 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -399,6 +399,27 @@ void hisi_uncore_pmu_disable(struct pmu *pmu)
 }
 EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_disable, HISI_PMU);
 
+static void hisi_pmu_init_associated_cpus(struct hisi_pmu *hisi_pmu)
+{
+	/*
+	 * If the associated_cpus has already been initialized, for example
+	 * determined by comparing the sccl_id and ccl_id with the CPU's
+	 * mpidr_el1, then do nothing here. Otherwise the PMU has no affinity
+	 * and could be opened on any online CPU.
+	 */
+	if (!cpumask_empty(&hisi_pmu->associated_cpus))
+		return;
+
+	cpumask_copy(&hisi_pmu->associated_cpus, cpu_online_mask);
+	hisi_pmu->dummy_associated_cpus = true;
+
+	/*
+	 * Otherwise the associated CPUs haven't been online yet. Pick a
+	 * nearest CPU according to the PMU's numa node instead.
+	 */
+	hisi_pmu->on_cpu = cpumask_local_spread(0, dev_to_node(hisi_pmu->dev));
+	WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(hisi_pmu->on_cpu)));
+}
 
 /*
  * The Super CPU Cluster (SCCL) and CPU Cluster (CCL) IDs can be
@@ -446,10 +467,6 @@ static bool hisi_pmu_cpu_is_associated_pmu(struct hisi_pmu *hisi_pmu)
 {
 	int sccl_id, ccl_id;
 
-	/* If SCCL_ID is -1, the PMU is in a SICL and has no CPU affinity */
-	if (hisi_pmu->sccl_id == -1)
-		return true;
-
 	if (hisi_pmu->ccl_id == -1) {
 		/* If CCL_ID is -1, the PMU only shares the same SCCL */
 		hisi_read_sccl_and_ccl_id(&sccl_id, NULL);
@@ -467,13 +484,29 @@ int hisi_uncore_pmu_online_cpu(unsigned int cpu, struct hlist_node *node)
 	struct hisi_pmu *hisi_pmu = hlist_entry_safe(node, struct hisi_pmu,
 						     node);
 
-	if (!hisi_pmu_cpu_is_associated_pmu(hisi_pmu))
-		return 0;
+	/*
+	 * If the CPU is not in the associated_cpus, it maybe a new CPU.
+	 * Test whether it's associated or not.
+	 */
+	if (!cpumask_test_cpu(cpu, &hisi_pmu->associated_cpus)) {
+		if (!hisi_pmu_cpu_is_associated_pmu(hisi_pmu))
+			return 0;
+
+		/*
+		 * We found an associated CPU so we don't need to use the dummy
+		 * associated CPUs. Update it.
+		 */
+		if (hisi_pmu->dummy_associated_cpus) {
+			cpumask_clear(&hisi_pmu->associated_cpus);
+			hisi_pmu->dummy_associated_cpus = false;
+		}
 
-	cpumask_set_cpu(cpu, &hisi_pmu->associated_cpus);
+		cpumask_set_cpu(cpu, &hisi_pmu->associated_cpus);
+	}
 
-	/* If another CPU is already managing this PMU, simply return. */
-	if (hisi_pmu->on_cpu != -1)
+	/* If another associated CPU is already managing this PMU, simply return. */
+	if (hisi_pmu->on_cpu != -1 &&
+	    cpumask_test_cpu(hisi_pmu->on_cpu, &hisi_pmu->associated_cpus))
 		return 0;
 
 	/* Use this CPU in cpumask for event counting */
@@ -492,9 +525,6 @@ int hisi_uncore_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node)
 						     node);
 	unsigned int target;
 
-	if (!cpumask_test_and_clear_cpu(cpu, &hisi_pmu->associated_cpus))
-		return 0;
-
 	/* Nothing to do if this CPU doesn't own the PMU */
 	if (hisi_pmu->on_cpu != cpu)
 		return 0;
@@ -521,6 +551,8 @@ void hisi_pmu_init(struct hisi_pmu *hisi_pmu, struct module *module)
 {
 	struct pmu *pmu = &hisi_pmu->pmu;
 
+	hisi_pmu_init_associated_cpus(hisi_pmu);
+
 	pmu->module             = module;
 	pmu->parent             = hisi_pmu->dev;
 	pmu->task_ctx_nr        = perf_invalid_context;
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
index 25b2d43b72bf..0e2f844b5fd9 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
@@ -89,6 +89,11 @@ struct hisi_pmu {
 	struct hisi_pmu_hwevents pmu_events;
 	/* associated_cpus: All CPUs associated with the PMU */
 	cpumask_t associated_cpus;
+	/*
+	 * If the real associated CPUs not onlined by the time initializing,
+	 * we'll initialize with online CPUs and indicate it.
+	 */
+	bool dummy_associated_cpus;
 	/* CPU used for counting */
 	int on_cpu;
 	int irq;
-- 
2.24.0


