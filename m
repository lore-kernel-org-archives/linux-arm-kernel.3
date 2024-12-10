Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E474DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9REnebzyjfPxxMpTCj4FwaNdmIHmIALF4gB+MZXLD2g=; b=PaYk+3pVA932SMqjjVI9voASlX
	eidPGkoiQBWBRS8pbQuw0u+hAo1/7di9U8uJhNjcx5SfB3eHQb5j14LSmOxZOY6et+q/hzFlxA9TW
	AheN9GpiQoLtW3t4leKRd1/nZOgYzZicg8Upc+DfOA5/176AgefhGJ2S/ZkSg5uM36Vn2m72kCZLf
	RnJYjoGOqcjVgBs7dF3SykAG+LP+weTQWhneBSMRc/t4o66HtXGfTzKW+fgA7exQnJ/IIqkeVV/qb
	JJERnqxUlsuYtV0VRreEBON6HCs7SQCWthz4PEsrCSFKpf4mepn6yzci1QFpDp239He9BRd5UMsuK
	4TxsLFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1AZ-0000000BkKp-1dlj;
	Tue, 10 Dec 2024 14:24:59 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL12M-0000000BiHL-3Jwl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:16:34 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Y711f2zPkz1T6w6;
	Tue, 10 Dec 2024 22:13:58 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id ACA6B1A0188;
	Tue, 10 Dec 2024 22:16:23 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 10 Dec 2024 22:16:23 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v5 04/10] drivers/perf: hisi: Refactor the detection of associated CPUs
Date: Tue, 10 Dec 2024 22:15:19 +0800
Message-ID: <20241210141525.37788-5-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241210141525.37788-1-yangyicong@huawei.com>
References: <20241210141525.37788-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061631_175699_572996E4 
X-CRM114-Status: GOOD (  20.48  )
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

There are two type of PMUs supported currently:
1) PMUs locate on SCCL (Super CPU Cluster [1]), associated with certain
   CCL (CPU cluster [1])(e.g. L3C PMU) or not (e.g. DDRC PMU)
2) PMUs locate on the SICL (Super IO Cluster [1]), which has no
   association with certain CPU topology (e.g. CPA PMU)

Currently the associated CPUs of the PMU is detected in the cpuhp online
callback as below:
- for type 1) the CPUs match PMU's sccl_id and ccl_id
- for type 2) PMU's sccl_id is -1 and all online CPUs will be associated

Since uncore PMUs are not bound to certain CPU context and event could be
counting started by any online CPU, the associated CPUs are just a
preference. Below disadvantages are observed in current implementation:
- the PMU cannot be used if its associated CPUs are offline
- SICL PMUs are associated to all the online CPUs implicitly without
  the consideration of locality

So refactor the way we detect the associated CPUs in below aspects:
- add a clear definition of hisi_pmu::associated_cpus
- initialize hisi_pmu::on_cpu based on locality if no associated CPU
  found, otherwise update it from associated CPUs
- drop the detection with a sccl_id of -1 for SICL PMUs

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/perf/hisi-pmu.rst?h=v6.12-rc1

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_pmu.c | 22 +++++++++++++++-------
 drivers/perf/hisilicon/hisi_uncore_pmu.h |  6 +++++-
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index c775e4722dac..e0f5fefcfee9 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -446,10 +446,6 @@ static bool hisi_pmu_cpu_is_associated_pmu(struct hisi_pmu *hisi_pmu)
 {
 	int sccl_id, ccl_id;
 
-	/* If SCCL_ID is -1, the PMU is in a SICL and has no CPU affinity */
-	if (hisi_pmu->sccl_id == -1)
-		return true;
-
 	if (hisi_pmu->ccl_id == -1) {
 		/* If CCL_ID is -1, the PMU only shares the same SCCL */
 		hisi_read_sccl_and_ccl_id(&sccl_id, NULL);
@@ -467,13 +463,25 @@ int hisi_uncore_pmu_online_cpu(unsigned int cpu, struct hlist_node *node)
 	struct hisi_pmu *hisi_pmu = hlist_entry_safe(node, struct hisi_pmu,
 						     node);
 
-	if (!hisi_pmu_cpu_is_associated_pmu(hisi_pmu))
+	/*
+	 * If the CPU is not associated to PMU, initialize the hisi_pmu->on_cpu
+	 * based on the locality if it hasn't been initialized yet. For PMUs
+	 * do have associated CPUs, it'll be updated later.
+	 */
+	if (!hisi_pmu_cpu_is_associated_pmu(hisi_pmu)) {
+		if (hisi_pmu->on_cpu != -1)
+			return 0;
+
+		hisi_pmu->on_cpu = cpumask_local_spread(0, dev_to_node(hisi_pmu->dev));
+		WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(cpu)));
 		return 0;
+	}
 
 	cpumask_set_cpu(cpu, &hisi_pmu->associated_cpus);
 
-	/* If another CPU is already managing this PMU, simply return. */
-	if (hisi_pmu->on_cpu != -1)
+	/* If another associated CPU is already managing this PMU, simply return. */
+	if (hisi_pmu->on_cpu != -1 &&
+	    cpumask_test_cpu(hisi_pmu->on_cpu, &hisi_pmu->associated_cpus))
 		return 0;
 
 	/* Use this CPU in cpumask for event counting */
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
index 25b2d43b72bf..bd48338ce937 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
@@ -87,7 +87,11 @@ struct hisi_pmu {
 	const struct hisi_uncore_ops *ops;
 	const struct hisi_pmu_dev_info *dev_info;
 	struct hisi_pmu_hwevents pmu_events;
-	/* associated_cpus: All CPUs associated with the PMU */
+	/*
+	 * CPUs associated to the PMU and are preferred to use for counting.
+	 * Could be empty if PMU has no association (e.g. PMU on SICL), in
+	 * which case any online CPU will be used.
+	 */
 	cpumask_t associated_cpus;
 	/* CPU used for counting */
 	int on_cpu;
-- 
2.24.0


