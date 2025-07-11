Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A49C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkcH1itRq1XRShskisW7wcb37ZW0RX2cW0UQXKn0aVY=; b=BJ1yput5D6lGz0p9xc7E5f7Ojo
	lRzfrrdLNXGjRid5Mbdu5AGZYmk/46Ke7VlK43/GF0cpr/u4SRJEbRMkzSV3hp5R8yIgfFPezWS9O
	jT8EjLG+RAMYn3RGSwm40Ue7IcfAYQyww+U7nIyf0Tsj1o4j91cI2J8OztYBnhniX9+G51+aNvjPG
	WtvuA/t2mnQO8CG5Zt5BkX1oUV97PLycrIP4nNZU4gz5MYUh6vC6xssnwJbzdLGf26AzlaFdBitaa
	xv7/gM97NUMbPfWvXYAXaW+O6JzIO/mSwu4yXS+u9H4WuQpmUMZv2YrMzhHlbg1LUDrOyAcq6BaTO
	7XUn4Stw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIve-0000000Faho-3wGc;
	Fri, 11 Jul 2025 18:57:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIca-0000000FX67-2n5c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:37:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BC3E2247;
	Fri, 11 Jul 2025 11:37:09 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 184733F694;
	Fri, 11 Jul 2025 11:37:16 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>,
	Lecopzer Chen <lecopzerc@nvidia.com>,
	Carl Worth <carl@os.amperecomputing.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
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
	James Morse <james.morse@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [RFC PATCH 05/36] ACPI / PPTT: Add a helper to fill a cpumask from a processor container
Date: Fri, 11 Jul 2025 18:36:17 +0000
Message-Id: <20250711183648.30766-6-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113720_789909_062BAB43 
X-CRM114-Status: GOOD (  18.30  )
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

The PPTT describes CPUs and caches, as well as processor containers.
The ACPI table for MPAM describes the set of CPUs that can access an MSC
with the UID of a processor container.

Add a helper to find the processor container by its id, then walk
the possible CPUs to fill a cpumask with the CPUs that have this
processor container as a parent.

CC: Dave Martin <dave.martin@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/acpi/pptt.c  | 93 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  6 +++
 2 files changed, 99 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 54676e3d82dd..13619b1b821b 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -298,6 +298,99 @@ static struct acpi_pptt_processor *acpi_find_processor_node(struct acpi_table_he
 	return NULL;
 }
 
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
+ *                                       processor containers
+ * @acpi_cpu_id:	The UID of the processor container.
+ * @cpus		The resulting CPU mask.
+ *
+ * Find the specified Processor Container, and fill @cpus with all the cpus
+ * below it.
+ *
+ * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
+ * Container, they may exist purely to describe a Private resource. CPUs
+ * have to be leaves, so a Processor Container is a non-leaf that has the
+ * 'ACPI Processor ID valid' flag set.
+ *
+ * Return: 0 for a complete walk, or an error if the mask is incomplete.
+ */
+int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
+{
+	struct acpi_pptt_processor *cpu_node;
+	struct acpi_table_header *table_hdr;
+	struct acpi_subtable_header *entry;
+	bool leaf_flag, has_leaf_flag = false;
+	unsigned long table_end;
+	acpi_status status;
+	u32 proc_sz;
+	int ret = 0;
+
+	cpumask_clear(cpus);
+
+	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
+	if (ACPI_FAILURE(status))
+		return 0;
+
+	if (table_hdr->revision > 1)
+		has_leaf_flag = true;
+
+	table_end = (unsigned long)table_hdr + table_hdr->length;
+	entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
+			     sizeof(struct acpi_table_pptt));
+	proc_sz = sizeof(struct acpi_pptt_processor);
+	while ((unsigned long)entry + proc_sz <= table_end) {
+		cpu_node = (struct acpi_pptt_processor *)entry;
+		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
+		    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) {
+			leaf_flag = cpu_node->flags & ACPI_PPTT_ACPI_LEAF_NODE;
+			if ((has_leaf_flag && !leaf_flag) ||
+			    (!has_leaf_flag && !acpi_pptt_leaf_node(table_hdr, cpu_node))) {
+				if (cpu_node->acpi_processor_id == acpi_cpu_id)
+					acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
+			}
+		}
+		entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
+				     entry->length);
+	}
+
+	acpi_put_table(table_hdr);
+
+	return ret;
+}
+
 static u8 acpi_cache_type(enum cache_type type)
 {
 	switch (type) {
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index f102c0fe3431..8c3165c2b083 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1541,6 +1541,7 @@ int find_acpi_cpu_topology(unsigned int cpu, int level);
 int find_acpi_cpu_topology_cluster(unsigned int cpu);
 int find_acpi_cpu_topology_package(unsigned int cpu);
 int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
+int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
 #else
 static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
 {
@@ -1562,6 +1563,11 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
 {
 	return -EINVAL;
 }
+static inline int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
+						    cpumask_t *cpus)
+{
+	return -EINVAL;
+}
 #endif
 
 void acpi_arch_init(void);
-- 
2.39.5


