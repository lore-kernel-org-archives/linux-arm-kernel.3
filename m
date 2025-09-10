Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B684CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64M6y3EYD/RvD1QuMt45CT1xSK7MVYmUlWttIk4Sck4=; b=jfoF4MQb7XF+NbNjiKaFB4pe1d
	9wikl8Kk03PjZ/jJ9mT8s0sWSSdm9Y9k9t62P0w6mX/9CraT98R1bNvHta/9b690+RInmAcQvQSy7
	PcFvkvSqITIwTBzFwXCehK66ptG29snWZWNDWFvzdgYpjwpNZs/nS/34JqemKI/2CtF93svS4Q3jb
	sVr6BNqJru6DNz10CNzw2xL8ej7ycuXJ0L2ZD0XnhDfzjK+6sBz1rQWT0VnzcBbZbqZ5f7LWQfro2
	5Pzx61JppgEMsNXPsPokD2Ecc6+mggGiZW31w2x6FFlPfsUY9A1xmYp05QFt0UqaivhY0wtHNBI/L
	QP5BGsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRfU-0000000GcfE-3bRj;
	Wed, 10 Sep 2025 20:43:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwRfS-0000000Gcd9-0DwH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 20:43:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0026F1D34;
	Wed, 10 Sep 2025 13:43:41 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A22B3F63F;
	Wed, 10 Sep 2025 13:43:44 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: James Morse <james.morse@arm.com>,
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rohit Mathew <Rohit.Mathew@arm.com>
Subject: [PATCH v2 04/29] ACPI / PPTT: Add a helper to fill a cpumask from a cache_id
Date: Wed, 10 Sep 2025 20:42:44 +0000
Message-Id: <20250910204309.20751-5-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250910204309.20751-1-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_134350_185410_A703AD9A 
X-CRM114-Status: GOOD (  18.70  )
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

MPAM identifies CPUs by the cache_id in the PPTT cache structure.

The driver needs to know which CPUs are associated with the cache.
The CPUs may not all be online, so cacheinfo does not have the
information.

Add a helper to pull this information out of the PPTT.

CC: Rohit Mathew <Rohit.Mathew@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
Changes since v1:
 * Added punctuation to the commit message.
 * Removed a comment about an alternative implementaion.
 * Made the loop continue with a warning if a CPU is missing from the PPTT.

Changes since RFC:
 * acpi_count_levels() now returns a value.
 * Converted the table-get stuff to use Jonathan's cleanup helper.
 * Dropped Sudeep's Review tag due to the cleanup change.
---
 drivers/acpi/pptt.c  | 59 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  6 +++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index c5f2a51d280b..c379a9952b00 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -966,3 +966,62 @@ int find_acpi_cache_level_from_id(u32 cache_id)
 
 	return -ENOENT;
 }
+
+/**
+ * acpi_pptt_get_cpumask_from_cache_id() - Get the cpus associated with the
+ *					   specified cache
+ * @cache_id: The id field of the unified cache
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
+	u32 acpi_cpu_id;
+	int level, cpu, num_levels;
+	struct acpi_pptt_cache *cache;
+	struct acpi_pptt_cache_v1 *cache_v1;
+	struct acpi_pptt_processor *cpu_node;
+	struct acpi_table_header *table __free(acpi_table) = acpi_get_table_ret(ACPI_SIG_PPTT, 0);
+
+	cpumask_clear(cpus);
+
+	if (IS_ERR(table))
+		return -ENOENT;
+
+	if (table->revision < 3)
+		return -ENOENT;
+
+	for_each_possible_cpu(cpu) {
+		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
+		if (WARN_ON_ONCE(!cpu_node))
+			continue;
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
+				cpumask_set_cpu(cpu, cpus);
+		}
+	}
+
+	return 0;
+}
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 5bdca5546697..c5fd92cda487 100644
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
 	return -EINVAL;
 }
+static inline int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id,
+						      cpumask_t *cpus)
+{
+	return -ENOENT;
+}
 #endif
 
 void acpi_arch_init(void);
-- 
2.39.5


