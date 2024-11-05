Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A706D12671
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaJyc33YpasxmzVq2msy7/YeZGB80Mh1Vt6dUG0iHBU=; b=klnnMweh/lVIKfh1OtFZPsZFzL
	6xuSgdmbBd8FG4C1/CiKOeRnMj4bBdR8c9KbKy6f/Ua3fASDTkks52joyw8LMB9n6K6sgINpRRJ/A
	m7kF08jPqimzbWyCHHD6U1TyZAEeaULmCnzb1mYGkpxUA0sBdv5cHhjYmvjCDjxQXzAiK+XAAIPhc
	Q0339ztCJxK9mhF7hD57IbUYF8PnyfjXhbiVn/LOGMMi0PBIAClWNH2eN8kqlF78aVnlOxpfhp8kU
	shesCbwcuwoWphUBLIQJWor97vcYBnt8AhswRkipa5ZIfp/6GpA/+2QxCtahE8wORt/oZ344IWsdi
	vDoJsY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8G5y-0000000GYfl-1lWA;
	Tue, 05 Nov 2024 09:43:30 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Fw3-0000000GWRr-1DZA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:33:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XjNQY6b8tzQppk;
	Tue,  5 Nov 2024 17:32:05 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id E48321800A0;
	Tue,  5 Nov 2024 17:33:11 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 5 Nov 2024 17:33:10 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>
Subject: [PATCH v8 3/4] arm64: topology: Support SMT control on ACPI based system
Date: Tue, 5 Nov 2024 17:32:36 +0800
Message-ID: <20241105093237.63565-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241105093237.63565-1-yangyicong@huawei.com>
References: <20241105093237.63565-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_013315_645161_D33611B2 
X-CRM114-Status: GOOD (  20.27  )
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

For ACPI we'll build the topology from PPTT and we cannot directly
get the SMT number of each core. Instead using a temporary xarray
to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
and SMT information of the first core in its heterogeneous CPU cluster
when building the topology. Then we can know the largest SMT number
in the system. If a homogeneous system's using ACPI 6.2 or later,
all the CPUs should be under the root node of PPTT. There'll be
only one entry in the xarray and all the CPUs in the system will
be assumed identical.

The core's SMT control provides two interface to the users [1]:
1) enable/disable SMT by writing on/off
2) enable/disable SMT by writing thread number 1/max_thread_number

If a system have more than one SMT thread number the 2) may
not handle it well, since there're multiple thread numbers in the
system and 2) only accept 1/max_thread_number. So issue a warning
to notify the users if such system detected.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kernel/topology.c | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 1a2c72f3e7f8..47f838d6e823 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -15,8 +15,10 @@
 #include <linux/arch_topology.h>
 #include <linux/cacheinfo.h>
 #include <linux/cpufreq.h>
+#include <linux/cpu_smt.h>
 #include <linux/init.h>
 #include <linux/percpu.h>
+#include <linux/xarray.h>
 
 #include <asm/cpu.h>
 #include <asm/cputype.h>
@@ -37,17 +39,28 @@ static bool __init acpi_cpu_is_threaded(int cpu)
 	return !!is_threaded;
 }
 
+struct cpu_smt_info {
+	int thread_num;
+	int core_id;
+};
+
 /*
  * Propagate the topology information of the processor_topology_node tree to the
  * cpu_topology array.
  */
 int __init parse_acpi_topology(void)
 {
+	int max_smt_thread_num = 0;
+	struct cpu_smt_info *entry;
+	struct xarray hetero_cpu;
+	unsigned long hetero_id;
 	int cpu, topology_id;
 
 	if (acpi_disabled)
 		return 0;
 
+	xa_init(&hetero_cpu);
+
 	for_each_possible_cpu(cpu) {
 		topology_id = find_acpi_cpu_topology(cpu, 0);
 		if (topology_id < 0)
@@ -57,6 +70,32 @@ int __init parse_acpi_topology(void)
 			cpu_topology[cpu].thread_id = topology_id;
 			topology_id = find_acpi_cpu_topology(cpu, 1);
 			cpu_topology[cpu].core_id   = topology_id;
+
+			/*
+			 * In the PPTT, CPUs below a node with the 'identical
+			 * implementation' flag have the same number of threads.
+			 * Count the number of threads for only one CPU (i.e.
+			 * one core_id) among those with the same hetero_id.
+			 * See the comment of find_acpi_cpu_topology_hetero_id()
+			 * for more details.
+			 *
+			 * One entry is created for each node having:
+			 * - the 'identical implementation' flag
+			 * - its parent not having the flag
+			 */
+			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
+			entry = (struct cpu_smt_info *)xa_load(&hetero_cpu, hetero_id);
+			if (!entry) {
+				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+				WARN_ON(!entry);
+
+				entry->core_id = topology_id;
+				entry->thread_num = 1;
+				xa_store(&hetero_cpu, hetero_id,
+					 entry, GFP_KERNEL);
+			} else if (entry->core_id == topology_id) {
+				entry->thread_num++;
+			}
 		} else {
 			cpu_topology[cpu].thread_id  = -1;
 			cpu_topology[cpu].core_id    = topology_id;
@@ -67,6 +106,24 @@ int __init parse_acpi_topology(void)
 		cpu_topology[cpu].package_id = topology_id;
 	}
 
+	/*
+	 * This should be a short loop depending on the number of heterogeneous
+	 * CPU clusters. Typically on a homogeneous system there's only one
+	 * entry in the XArray.
+	 */
+	xa_for_each(&hetero_cpu, hetero_id, entry) {
+		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
+			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
+
+		if (entry->thread_num > max_smt_thread_num)
+			max_smt_thread_num = entry->thread_num;
+
+		xa_erase(&hetero_cpu, hetero_id);
+		kfree(entry);
+	}
+
+	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+	xa_destroy(&hetero_cpu);
 	return 0;
 }
 #endif
-- 
2.24.0


