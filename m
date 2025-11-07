Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2ABCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bk0IwWnjLZWWBPr8tYpBc4OlVTIa1fnyW2eOVK5lx9I=; b=qX/VGtF6GxlebpOkRxwm/biE6o
	LoQlbvs6fquUpJR48Aw+seIEXmMEdMLQAtSTYbQ2dOgFRb3StG6Rb0iiw3bzI1LdBNheQgiCPsUmy
	Z5zI/sU6gi0BaTID8JlHmM3x4FjBFU+Tqd66hVYq7JUJ/VBOhsxKfzguH8sUY/cN8PgLXCeDC2uN/
	EbH3yO+1kDyfdvMJBTcKm8bru7eQn8MnUhh/BIx/efEAdM69b6hJuw9aVmhVD5RDdRAPFnO0i5KP7
	txsSMq47savGl2Vl9fEBEop5tJdMx8+323ER0ZESl686Pa1+A6vLZmLueWwoFNWyA2Y6bU4aL7eSv
	9/Yf4hWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLgm-0000000HIiI-3Pa8;
	Fri, 07 Nov 2025 12:35:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLgk-0000000HIhP-0uXg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 12:35:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 003521516;
	Fri,  7 Nov 2025 04:35:26 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC6913F66E;
	Fri,  7 Nov 2025 04:35:28 -0800 (PST)
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH 01/33] ACPI / PPTT: Add a helper to fill a cpumask from a processor container
Date: Fri,  7 Nov 2025 12:34:18 +0000
Message-ID: <20251107123450.664001-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_043534_363779_9CEA0BE2 
X-CRM114-Status: GOOD (  16.46  )
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

The ACPI MPAM table uses the UID of a processor container specified in
the PPTT to indicate the subset of CPUs and cache topology that can
access each MPAM System Component (MSC).

This information is not directly useful to the kernel. The equivalent
cpumask is needed instead.

Add a helper to find the processor container by its id, then walk
the possible CPUs to fill a cpumask with the CPUs that have this
processor container as a parent.

CC: Dave Martin <dave.martin@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v3:
Refer to processor hierarchy in comments (Jonathan)
Fix indent (Jonathan)
---
 drivers/acpi/pptt.c  | 85 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  3 ++
 2 files changed, 88 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 54676e3d82dd..69917cc6bd2f 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -817,3 +817,88 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
 	return find_acpi_cpu_topology_tag(cpu, PPTT_ABORT_PACKAGE,
 					  ACPI_PPTT_ACPI_IDENTICAL);
 }
+
+/**
+ * acpi_pptt_get_child_cpus() - Find all the CPUs below a PPTT
+ * processor hierarchy node
+ *
+ * @table_hdr:		A reference to the PPTT table
+ * @parent_node:	A pointer to the processor hierarchy node in the
+ *			table_hdr
+ * @cpus:		A cpumask to fill with the CPUs below @parent_node
+ *
+ * Walks up the PPTT from every possible CPU to find if the provided
+ * @parent_node is a parent of this CPU.
+ */
+static void acpi_pptt_get_child_cpus(struct acpi_table_header *table_hdr,
+				     struct acpi_pptt_processor *parent_node,
+				     cpumask_t *cpus)
+{
+	struct acpi_pptt_processor *cpu_node;
+	u32 acpi_id;
+	int cpu;
+
+	cpumask_clear(cpus);
+
+	for_each_possible_cpu(cpu) {
+		acpi_id = get_acpi_id_for_cpu(cpu);
+		cpu_node = acpi_find_processor_node(table_hdr, acpi_id);
+
+		while (cpu_node) {
+			if (cpu_node == parent_node) {
+				cpumask_set_cpu(cpu, cpus);
+				break;
+			}
+			cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
+		}
+	}
+}
+
+/**
+ * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
+ *                                       processor container
+ * @acpi_cpu_id:	The UID of the processor container
+ * @cpus:		The resulting CPU mask
+ *
+ * Find the specified Processor Container, and fill @cpus with all the cpus
+ * below it.
+ *
+ * Not all 'Processor Hierarchy' entries in the PPTT are either a CPU
+ * or a Processor Container, they may exist purely to describe a
+ * Private resource. CPUs have to be leaves, so a Processor Container
+ * is a non-leaf that has the 'ACPI Processor ID valid' flag set.
+ */
+void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
+{
+	struct acpi_table_header *table_hdr;
+	struct acpi_subtable_header *entry;
+	unsigned long table_end;
+	u32 proc_sz;
+
+	cpumask_clear(cpus);
+
+	table_hdr = acpi_get_pptt();
+	if (!table_hdr)
+		return;
+
+	table_end = (unsigned long)table_hdr + table_hdr->length;
+	entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
+			     sizeof(struct acpi_table_pptt));
+	proc_sz = sizeof(struct acpi_pptt_processor);
+	while ((unsigned long)entry + proc_sz <= table_end) {
+
+		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR) {
+			struct acpi_pptt_processor *cpu_node;
+
+			cpu_node = (struct acpi_pptt_processor *)entry;
+			if (cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID &&
+			    !acpi_pptt_leaf_node(table_hdr, cpu_node) &&
+			    cpu_node->acpi_processor_id == acpi_cpu_id) {
+				acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
+				break;
+			}
+		}
+		entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
+				     entry->length);
+	}
+}
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 5ff5d99f6ead..4752ebd48132 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1541,6 +1541,7 @@ int find_acpi_cpu_topology(unsigned int cpu, int level);
 int find_acpi_cpu_topology_cluster(unsigned int cpu);
 int find_acpi_cpu_topology_package(unsigned int cpu);
 int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
+void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
 #else
 static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
 {
@@ -1562,6 +1563,8 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
 {
 	return -EINVAL;
 }
+static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
+						     cpumask_t *cpus) { }
 #endif
 
 void acpi_arch_init(void);
-- 
2.43.0


