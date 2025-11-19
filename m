Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B226CF31B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBt3kqE5yj1jkTqlPcBNfqaOYjHF3/TryY+04642h+s=; b=OkAuN2DginqoAR1GUJ/ClqPCQJ
	ZwwM4V2/rjIS238kY6bcEHgI+YEuTrJxikNJTPoC/JXUAP6DdwEjPRGPDsYrVmhwlLN0D3hddKVZo
	SlUR4pxyIGVHjPP2NgVcK4YlrWVwQHvvtonNOxJqR8YYfQ5dppx8U4dBGVAvrEprJ8UHXU+a4sT7D
	KjPdZvRrPb1kZ5HDjKlApOWI0LVpbqfYjtCsrgwHPsNwCp4jkaZKNIIjhmsp3Eex0Ks1O5y0SODnc
	1Uir/4RDyZi4v2QrFwqhM0cdPNr4ehBC7WpUUQ+Y/SF+XWYiWh3Atg4AA6y5h7T+rlcj2repssltl
	X+mW5oPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhE8-000000036sh-2Ux2;
	Wed, 19 Nov 2025 12:24:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhE4-000000036r0-1l1U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 12:23:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F5DFFEC;
	Wed, 19 Nov 2025 04:23:48 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4CA2B3F740;
	Wed, 19 Nov 2025 04:23:50 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: james.morse@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	catalin.marinas@arm.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	david@redhat.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	will@kernel.org,
	xhao@linux.alibaba.com,
	reinette.chatre@intel.com,
	Rohit Mathew <Rohit.Mathew@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v6 05/34] ACPI / PPTT: Add a helper to fill a cpumask from a cache_id
Date: Wed, 19 Nov 2025 12:22:35 +0000
Message-ID: <20251119122305.302149-6-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119122305.302149-1-ben.horgan@arm.com>
References: <20251119122305.302149-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_042358_625510_EB707AB7 
X-CRM114-Status: GOOD (  18.63  )
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

From: James Morse <james.morse@arm.com>

MPAM identifies CPUs by the cache_id in the PPTT cache structure.

The driver needs to know which CPUs are associated with the cache.
The CPUs may not all be online, so cacheinfo does not have the
information.

Add a helper to pull this information out of the PPTT.

CC: Rohit Mathew <Rohit.Mathew@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Carl Worth <carl@os.amperecomputing.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Hanjun Guo <guohanjun@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v4:
Same changes as previous patch in series
do/while
initialisation of acpi_cpu_id
use new version of acpi_pptt_cache_v1_full

Changes since v3:
Equivalent changes to the previous patch:
 Tags dropped due to rework
 Fallout/simplification from adding acpi_pptt_cache_v1_full
 Look for each cache type before incrementing level
---
 drivers/acpi/pptt.c  | 65 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  6 ++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index da49b56a1ef2..de5f8c018333 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -998,3 +998,68 @@ int find_acpi_cache_level_from_id(u32 cache_id)
 
 	return -ENOENT;
 }
+
+/**
+ * acpi_pptt_get_cpumask_from_cache_id() - Get the cpus associated with the
+ *					   specified cache
+ * @cache_id: The id field of the cache
+ * @cpus: Where to build the cpumask
+ *
+ * Determine which CPUs are below this cache in the PPTT. This allows the property
+ * to be found even if the CPUs are offline.
+ *
+ * The PPTT table must be rev 3 or later,
+ *
+ * Return: -ENOENT if the PPTT doesn't exist, or the cache cannot be found.
+ * Otherwise returns 0 and sets the cpus in the provided cpumask.
+ */
+int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus)
+{
+	int cpu;
+	struct acpi_table_header *table;
+
+	cpumask_clear(cpus);
+
+	table = acpi_get_pptt();
+	if (!table)
+		return -ENOENT;
+
+	if (table->revision < 3)
+		return -ENOENT;
+
+	for_each_possible_cpu(cpu) {
+		bool empty;
+		int level = 1;
+		u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+		struct acpi_pptt_cache *cache;
+		struct acpi_pptt_processor *cpu_node;
+
+		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
+		if (!cpu_node)
+			continue;
+
+		do {
+			int cache_type[] = {CACHE_TYPE_INST, CACHE_TYPE_DATA, CACHE_TYPE_UNIFIED};
+
+			empty = true;
+			for (int i = 0; i < ARRAY_SIZE(cache_type); i++) {
+				struct acpi_pptt_cache_v1_full *cache_v1;
+
+				cache = acpi_find_cache_node(table, acpi_cpu_id, cache_type[i],
+							     level, &cpu_node);
+
+				if (!cache)
+					continue;
+
+				empty = false;
+
+				cache_v1 = upgrade_pptt_cache(cache);
+				if (cache_v1 && cache_v1->cache_id == cache_id)
+					cpumask_set_cpu(cpu, cpus);
+			}
+			level++;
+		} while (!empty);
+	}
+
+	return 0;
+}
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index be074bdfd4d1..a9dbacabdf89 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1543,6 +1543,7 @@ int find_acpi_cpu_topology_package(unsigned int cpu);
 int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
 void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
 int find_acpi_cache_level_from_id(u32 cache_id);
+int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus);
 #else
 static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
 {
@@ -1570,6 +1571,11 @@ static inline int find_acpi_cache_level_from_id(u32 cache_id)
 {
 	return -ENOENT;
 }
+static inline int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id,
+						      cpumask_t *cpus)
+{
+	return -ENOENT;
+}
 #endif
 
 void acpi_arch_init(void);
-- 
2.43.0


