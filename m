Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFD5CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQr3bdbQbrzLhG7aZ/x+zGLWpUQOLCPlO5T+VAfNIus=; b=MmoQa2FooJRTSxikEwxzr1bUyg
	w/EWA5pSjGJ6Ji6thK64R5m3jGT2HYxGoYNhNYs552LhE1m0n8OMfuCju93N3FyJDAyxn5l3NQ+Rw
	+ScMA57Oi6MiLk67Qmetcj7GhMPcmIk4xsIb1ZWpe+YaknGvPO+IFs4rlGy0v1mpq9xupm5uDrC94
	tbPjAkW6s7Xxihw3LAohHdE+r1XQ2yTc2M+Ywjx/tcBPQunENp5lGwUGoF6p30DwHvc9Z40NfV1zG
	NdYf6z9oxbkt2P1dOaODtU4/PX2UH1qThL6ZVbvwn/FnqtH/BJBRPIVr8rFFUdlkf784ESmiTm089
	CMmcU9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uof9G-0000000CvkX-1uFO;
	Wed, 20 Aug 2025 09:30:26 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeS1-0000000Cn2n-0jXT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:45:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4c6Kfy16Bwz2Cg0Z;
	Wed, 20 Aug 2025 16:41:14 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id E07D6140279;
	Wed, 20 Aug 2025 16:45:36 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 20 Aug 2025 16:45:36 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 20 Aug 2025 16:45:36 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <sudeep.holla@arm.com>, <james.clark@linaro.org>, <robh@kernel.org>,
	<anshuman.khandual@arm.com>, <jonathan.cameron@huawei.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <prime.zeng@hisilicon.com>,
	<xuwei5@huawei.com>, <wangyushan12@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH v2 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
Date: Wed, 20 Aug 2025 16:45:34 +0800
Message-ID: <20250820084534.28037-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250820084534.28037-1-yangyicong@huawei.com>
References: <20250820084534.28037-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_014545_515420_0EC2064B 
X-CRM114-Status: GOOD (  17.70  )
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

CPU_CYCLES is expected to count the logical CPU (PE) clock. Currently it's
preferred to use PMCCNTR_EL0 for counting CPU_CYCLES, but it'll count
processor clock rather than the PE clock (ARM DDI0487 L.b D13.1.3) if
one of the SMT siblings is not idle on a multi-threaded implementation.
So don't use it on SMT cores.

Introduce topology_core_has_smt() for knowing the SMT implementation and
cached it in arm_pmu::has_smt during allocation.

When counting cycles on SMT CPU 2-3 and CPU 3 is idle, without this
patch we'll get:
[root@client1 tmp]# perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
--taskset 2 --timeout 1
[...]
 Performance counter stats for 'CPU(s) 2-3':

CPU2           2880457316      cycles
CPU3           2880459810      cycles
       1.254688470 seconds time elapsed

With this patch the idle state of CPU3 is observed as expected:
[root@client1 ~]#  perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
--taskset 2 --timeout 1
[...]
 Performance counter stats for 'CPU(s) 2-3':

CPU2           2558580492      cycles
CPU3               305749      cycles
       1.113626410 seconds time elapsed

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/arm_pmu.c        |  3 +++
 drivers/perf/arm_pmuv3.c      | 10 ++++++++++
 include/linux/arch_topology.h | 11 +++++++++++
 include/linux/perf/arm_pmu.h  |  1 +
 4 files changed, 25 insertions(+)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 5c310e803dd7..137ef55d6973 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -901,6 +901,9 @@ struct arm_pmu *armpmu_alloc(void)
 
 		events = per_cpu_ptr(pmu->hw_events, cpu);
 		events->percpu_pmu = pmu;
+
+		if (!pmu->has_smt && topology_core_has_smt(cpu))
+			pmu->has_smt = true;
 	}
 
 	return pmu;
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 69c5cc8f5606..32b58a0feb33 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -981,6 +981,7 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
 static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 				     struct perf_event *event)
 {
+	struct arm_pmu *cpu_pmu = to_arm_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 	unsigned long evtype = hwc->config_base & ARMV8_PMU_EVTYPE_EVENT;
 
@@ -1001,6 +1002,15 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
 	if (has_branch_stack(event))
 		return false;
 
+	/*
+	 * The PMCCNTR_EL0 increments from the processor clock rather than
+	 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
+	 * counting on a WFI PE if one of its SMT silbing is not idle on a
+	 * multi-threaded implementation. So don't use it on SMT cores.
+	 */
+	if (cpu_pmu->has_smt)
+		return false;
+
 	return true;
 }
 
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index d72d6e5aa200..daa1af2e8204 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -89,6 +89,17 @@ void remove_cpu_topology(unsigned int cpuid);
 void reset_cpu_topology(void);
 int parse_acpi_topology(void);
 void freq_inv_set_max_ratio(int cpu, u64 max_rate);
+
+/*
+ * Architectures like ARM64 don't have reliable architectural way to get SMT
+ * information and depend on the firmware (ACPI/OF) report. Non-SMT core won't
+ * initialize thread_id so we can use this to detect the SMT implementation.
+ */
+static inline bool topology_core_has_smt(int cpu)
+{
+	return cpu_topology[cpu].thread_id != -1;
+}
+
 #endif
 
 #endif /* _LINUX_ARCH_TOPOLOGY_H_ */
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 93c9a26492fc..2d39322c40c4 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -119,6 +119,7 @@ struct arm_pmu {
 
 	/* PMUv3 only */
 	int		pmuver;
+	bool		has_smt;
 	u64		reg_pmmir;
 	u64		reg_brbidr;
 #define ARMV8_PMUV3_MAX_COMMON_EVENTS		0x40
-- 
2.24.0


