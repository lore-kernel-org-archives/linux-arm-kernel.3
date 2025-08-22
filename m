Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DB6CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfo2TOzOBazAylG+ND6b8kKath0O2DX5FlwI+qA2T+U=; b=yoAqtduPAMNBw2gZIC1SsfVmDl
	2iv1i/rnu7aw1dVMOVPgEVgVkeIW3gUHF8qhaz6/9mX5a1XmjqVDwFzZG150PhDkYJYEc/Rykx9IR
	ErNCzyqsB2dqdWpUtPdPHQVrXCtdjDiRepYXtvE6yWFLhHNpFG1/QQ4DIVY8DGdT02r04IIAZoCqa
	uKujNS8oHxKB/odXO3ZMvxDEik6K9Ucu/Ojay3P9Yv2fMyg79VqSHFe4DIc1Xu/03cZg/JSWDdg1V
	7+euLRM/iOnCNPfRtk0EMBmXY+9M/t9mXYWKrNI5QUw9oxJkVEqMNF4Efr2496QkpFrDo6EC+sOWY
	uk48rqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkeU-00000004TCh-08w8;
	Sat, 23 Aug 2025 09:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTju-000000031bC-3t87
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 15:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hfo2TOzOBazAylG+ND6b8kKath0O2DX5FlwI+qA2T+U=; b=SltWjvH68FlRtKUIYCbIas+CBP
	2aA2vEaZuOJjEKUCBdPuPAFO5+TuNQYsr0uh+LZVI17ssCbC2TeR0eSHYZby5UQzoD99jPzg65EIZ
	wuCxUGpC3ZBon/eV9HZ4T5PD7iktjyPnmD03bFNo4mw9EvHAF5q58hQLbTyzASkuQ8O7UvZZp4BFy
	hGNttvZAQPEhv0xpUlR9zQozBoahHFVgACGWx2rf2CMj5IRnlUH2nqECSfqCTAg0jvBIHOzsM2qsX
	UuN1CaecoDdyh1U9af4fq/ucahHjYRttANxL57ZwFCs8kRRt7UJZaNju114IUhjAcIAiz8/UloRVd
	IXSJ6UHQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTjr-00000000yf6-2gyV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:31:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63A14288E;
	Fri, 22 Aug 2025 08:31:26 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CD053F63F;
	Fri, 22 Aug 2025 08:31:29 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: James Morse <james.morse@arm.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Rafael Wysocki <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 05/33] ACPI / PPTT: Find cache level by cache-id
Date: Fri, 22 Aug 2025 15:29:46 +0000
Message-Id: <20250822153048.2287-6-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250822153048.2287-1-james.morse@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_163136_057588_3F7EFDA9 
X-CRM114-Status: GOOD (  19.72  )
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

The MPAM table identifies caches by id. The MPAM driver also wants to know
the cache level to determine if the platform is of the shape that can be
managed via resctrl. Cacheinfo has this information, but only for CPUs that
are online.

Waiting for all CPUs to come online is a problem for platforms where
CPUs are brought online late by user-space.

Add a helper that walks every possible cache, until it finds the one
identified by cache-id, then return the level.
Add a cleanup based free-ing mechanism for acpi_get_table().

CC: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since RFC:
 * acpi_count_levels() now returns a value.
 * Converted the table-get stuff to use Jonathan's cleanup helper.
 * Dropped Sudeep's Review tag due to the cleanup change.
---
 drivers/acpi/pptt.c  | 64 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h | 17 ++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 8f9b9508acba..660457644a5b 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -907,3 +907,67 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
 	return find_acpi_cpu_topology_tag(cpu, PPTT_ABORT_PACKAGE,
 					  ACPI_PPTT_ACPI_IDENTICAL);
 }
+
+/**
+ * find_acpi_cache_level_from_id() - Get the level of the specified cache
+ * @cache_id: The id field of the unified cache
+ *
+ * Determine the level relative to any CPU for the unified cache identified by
+ * cache_id. This allows the property to be found even if the CPUs are offline.
+ *
+ * The returned level can be used to group unified caches that are peers.
+ *
+ * The PPTT table must be rev 3 or later,
+ *
+ * If one CPUs L2 is shared with another as L3, this function will return
+ * an unpredictable value.
+ *
+ * Return: -ENOENT if the PPTT doesn't exist, or the cache cannot be found.
+ * Otherwise returns a value which represents the level of the specified cache.
+ */
+int find_acpi_cache_level_from_id(u32 cache_id)
+{
+	u32 acpi_cpu_id;
+	int level, cpu, num_levels;
+	struct acpi_pptt_cache *cache;
+	struct acpi_pptt_cache_v1 *cache_v1;
+	struct acpi_pptt_processor *cpu_node;
+	struct acpi_table_header *table __free(acpi_table) = acpi_get_table_ret(ACPI_SIG_PPTT, 0);
+
+	if (IS_ERR(table))
+		return PTR_ERR(table);
+
+	if (table->revision < 3)
+		return -ENOENT;
+
+	/*
+	 * If we found the cache first, we'd still need to walk from each CPU
+	 * to find the level...
+	 */
+	for_each_possible_cpu(cpu) {
+		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
+		if (!cpu_node)
+			return -ENOENT;
+		num_levels = acpi_count_levels(table, cpu_node, NULL);
+
+		/* Start at 1 for L1 */
+		for (level = 1; level <= num_levels; level++) {
+			cache = acpi_find_cache_node(table, acpi_cpu_id,
+						     ACPI_PPTT_CACHE_TYPE_UNIFIED,
+						     level, &cpu_node);
+			if (!cache)
+				continue;
+
+			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
+						cache,
+						sizeof(struct acpi_pptt_cache));
+
+			if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
+			    cache_v1->cache_id == cache_id)
+				return level;
+		}
+	}
+
+	return -ENOENT;
+}
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index f97a9ff678cc..30c10b1dcdb2 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -8,6 +8,7 @@
 #ifndef _LINUX_ACPI_H
 #define _LINUX_ACPI_H
 
+#include <linux/cleanup.h>
 #include <linux/errno.h>
 #include <linux/ioport.h>	/* for struct resource */
 #include <linux/resource_ext.h>
@@ -221,6 +222,17 @@ void acpi_reserve_initial_tables (void);
 void acpi_table_init_complete (void);
 int acpi_table_init (void);
 
+static inline struct acpi_table_header *acpi_get_table_ret(char *signature, u32 instance)
+{
+	struct acpi_table_header *table;
+	int status = acpi_get_table(signature, instance, &table);
+
+	if (ACPI_FAILURE(status))
+		return ERR_PTR(-ENOENT);
+	return table;
+}
+DEFINE_FREE(acpi_table, struct acpi_table_header *, if (!IS_ERR(_T)) acpi_put_table(_T))
+
 int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
 int __init_or_acpilib acpi_table_parse_entries(char *id,
 		unsigned long table_size, int entry_id,
@@ -1542,6 +1554,7 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu);
 int find_acpi_cpu_topology_package(unsigned int cpu);
 int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
 void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
+int find_acpi_cache_level_from_id(u32 cache_id);
 #else
 static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
 {
@@ -1565,6 +1578,10 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
 }
 static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
 						     cpumask_t *cpus) { }
+static inline int find_acpi_cache_level_from_id(u32 cache_id)
+{
+	return -EINVAL;
+}
 #endif
 
 void acpi_arch_init(void);
-- 
2.20.1


