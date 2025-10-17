Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61F2CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBPCWZiy55RHokKkC5ao5le200oqx8OJnKt20FdBjOs=; b=WZcrXyalw/kZCKJUzBrrweSc7y
	l3scL3fLZ/0DdQcur+XKe8Dhhn70f5DAKkd7YSf1hedeHo7rsH3FT+Jv5eAI2AOh1ecZH/eSqe7bL
	0A2uckk6YhCe/Fyh2uZuQTvTXW+w0+HMZyNY/7cMEoYFdjd5DQ00GUsis75fPJK3ROcJJtXJjJo6U
	d58sW5GA3WOoKCRIdVtN/dt8caK9vpBsrq9YVg7G711a6lRhWrjOlwKY8ivuvRbKz51pH26pIkFYI
	9DIt1tH/Ho8rt2ACmcebV421EwHHLRMETc6eY3VWnsHzEL9+6rMmEje2B3rUBnc/vtRaa2tmkLYKq
	MKg0qepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pdZ-00000008jZD-1QBq;
	Fri, 17 Oct 2025 18:57:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pdX-00000008jYS-1WtO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:57:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 042E71515;
	Fri, 17 Oct 2025 11:57:03 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0185F3F66E;
	Fri, 17 Oct 2025 11:57:05 -0700 (PDT)
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
	Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 01/29] ACPI / PPTT: Add a helper to fill a cpumask from a processor container
Date: Fri, 17 Oct 2025 18:56:17 +0000
Message-Id: <20251017185645.26604-2-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251017185645.26604-1-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115711_595862_B700EE55 
X-CRM114-Status: GOOD (  18.17  )
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
Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v2:
 * Grouped two nested if clauses differently to reduce scope of cpu_node.
 * Removed stale comment refering to the return value.

Changes since v1:
 * Replaced commit message with wording from Dave.
 * Fixed a stray plural.
 * Moved further down in the file to make use of get_pptt() helper.
 * Added a break to exit the loop early.

Changes since RFC:
 * Removed leaf_flag local variable from acpi_pptt_get_cpus_from_container()

Changes since RFC:
 * Dropped has_leaf_flag dodging of acpi_pptt_leaf_node()
 * Added missing : in kernel-doc
 * Made helper return void as this never actually returns an error.
---
 drivers/acpi/pptt.c  | 82 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  3 ++
 2 files changed, 85 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 54676e3d82dd..58cfa3916a13 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -817,3 +817,85 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
 	return find_acpi_cpu_topology_tag(cpu, PPTT_ABORT_PACKAGE,
 					  ACPI_PPTT_ACPI_IDENTICAL);
 }
+
+/**
+ * acpi_pptt_get_child_cpus() - Find all the CPUs below a PPTT processor node
+ * @table_hdr:		A reference to the PPTT table.
+ * @parent_node:	A pointer to the processor node in the @table_hdr.
+ * @cpus:		A cpumask to fill with the CPUs below @parent_node.
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
+ * @acpi_cpu_id:	The UID of the processor container.
+ * @cpus:		The resulting CPU mask.
+ *
+ * Find the specified Processor Container, and fill @cpus with all the cpus
+ * below it.
+ *
+ * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
+ * Container, they may exist purely to describe a Private resource. CPUs
+ * have to be leaves, so a Processor Container is a non-leaf that has the
+ * 'ACPI Processor ID valid' flag set.
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
+					acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
+					break;
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
2.39.5


