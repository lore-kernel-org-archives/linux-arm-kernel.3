Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692A0CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auFfhLAHPUsxE9iJFWDgyUb0v5Pep7y3U3F/9J9quSM=; b=wMQg1QmRDAszknhEWYH9tUMDQf
	KzT6RJmbJcZ0LeKxu28fa2NuM2hD9Cooz29ngwrHIRUtB0RXyHwmiUSR4LgoCUHPqW5Vu6LL8rlK9
	2HmNWtIPlMSeQOG6P0Rs7+7CFPWhHZMlNgyvXFNDRiBrCn3xF00baRBR8KbrfaLpuZgPIcetNgnf7
	qX+AXadp77hct79LYqIRCLwfC+5XJB87mvBcIf3DRnxQOzYtDEtBCr1dL8CpPzjf4iukNinvscFip
	wnbXFnEYA2GHVJ/KaP5QQVvgdybldxl8RAzeplbTHD6DMO7aVRr3s7U2AiOdh7xC3SKOp2Wuu0QDR
	621uMzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uploZ-00000004f6W-0gQ6;
	Sat, 23 Aug 2025 10:49:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmm-000000032Ys-1ASk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:34:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E05DB27DC;
	Fri, 22 Aug 2025 08:34:26 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D25AC3F63F;
	Fri, 22 Aug 2025 08:34:29 -0700 (PDT)
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
Subject: [PATCH 03/33] ACPI / PPTT: Add a helper to fill a cpumask from a processor container
Date: Fri, 22 Aug 2025 15:30:18 +0000
Message-Id: <20250822153048.2287-38-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250822153048.2287-1-james.morse@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_083436_413876_1495D3AB 
X-CRM114-Status: GOOD (  18.26  )
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
Changes since RFC:
 * Dropped has_leaf_flag dodging of acpi_pptt_leaf_node()
 * Added missing : in kernel-doc
 * Made helper return void as this never actually returns an error.
---
 drivers/acpi/pptt.c  | 86 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  3 ++
 2 files changed, 89 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 54676e3d82dd..4791ca2bdfac 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -298,6 +298,92 @@ static struct acpi_pptt_processor *acpi_find_processor_node(struct acpi_table_he
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
+ * @cpus:		The resulting CPU mask.
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
+void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
+{
+	struct acpi_pptt_processor *cpu_node;
+	struct acpi_table_header *table_hdr;
+	struct acpi_subtable_header *entry;
+	unsigned long table_end;
+	acpi_status status;
+	bool leaf_flag;
+	u32 proc_sz;
+
+	cpumask_clear(cpus);
+
+	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
+	if (ACPI_FAILURE(status))
+		return;
+
+	table_end = (unsigned long)table_hdr + table_hdr->length;
+	entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
+			     sizeof(struct acpi_table_pptt));
+	proc_sz = sizeof(struct acpi_pptt_processor);
+	while ((unsigned long)entry + proc_sz <= table_end) {
+		cpu_node = (struct acpi_pptt_processor *)entry;
+		if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
+		    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID) {
+			leaf_flag = acpi_pptt_leaf_node(table_hdr, cpu_node);
+			if (!leaf_flag) {
+				if (cpu_node->acpi_processor_id == acpi_cpu_id)
+					acpi_pptt_get_child_cpus(table_hdr, cpu_node, cpus);
+			}
+		}
+		entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
+				     entry->length);
+	}
+
+	acpi_put_table(table_hdr);
+}
+
 static u8 acpi_cache_type(enum cache_type type)
 {
 	switch (type) {
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 1c5bb1e887cd..f97a9ff678cc 100644
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
2.20.1


