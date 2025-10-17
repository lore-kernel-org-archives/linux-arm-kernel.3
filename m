Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CF7CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LwD1S+b0UnFoK13OPEl2YRKbpFXFx3jGC1idxnHEk8=; b=XJoKlCZOzL2oF/W68dXDbjlp/I
	9Rs4q2kta1u2jLl1hGYNy6nOZw9md4J803i9p6hPj2MupxBSJ3hAr7muZ2J0W0kzOeqPI55Qaxkp0
	6IPSsyPRk1kq+kitHMFwExaMV0dducUx7yYgI3mvb63nPtQ1+T7vSh+ZW1NBnMLfProFyEGg7xXfA
	pXCpWh5zfrZ/HLdRHixdJocly+5ZPN23xFcoNcm63LualvtCNZiie54Mw0rUR0dBm93L+3+Emgsc6
	IzoShAaCruq3BwOhA/yNXv9vRb//HLFqH0l4rCeQEbf/M68wBTMQqLk7DyBNq5SB6V1oGQBjsQkPU
	es2M5ufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pdm-00000008jgg-3cux;
	Fri, 17 Oct 2025 18:57:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pdj-00000008jet-15zs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:57:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72F581515;
	Fri, 17 Oct 2025 11:57:13 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FF1D3F66E;
	Fri, 17 Oct 2025 11:57:16 -0700 (PDT)
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
Subject: [PATCH v3 03/29] ACPI / PPTT: Find cache level by cache-id
Date: Fri, 17 Oct 2025 18:56:19 +0000
Message-Id: <20251017185645.26604-4-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251017185645.26604-1-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115723_375202_135AB362 
X-CRM114-Status: GOOD (  21.51  )
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

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>
---
Changes sinec v2:
 * Search all caches, not just unified caches. This removes the need to count
   the caches first, but means a failure to find the table walks the table
   three times for different cache types.
 * Fixed return value of the no-acpi stub.
 * Punctuation typo in a comment,
 * Keep trying to parse the table even if a bogus CPU is encountered.
 * Specified CPUs share caches with other CPUs.

Changes since v1:
 * Droppeed the cleanup based table freeing, use acpi_get_pptt() instead.
 * Removed a confusing comment.
 * Clarified the kernel doc.

Changes since RFC:
 * acpi_count_levels() now returns a value.
 * Converted the table-get stuff to use Jonathan's cleanup helper.
 * Dropped Sudeep's Review tag due to the cleanup change.
---
 drivers/acpi/pptt.c  | 82 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  5 +++
 2 files changed, 87 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 63c3a344c075..50c8f2a3c927 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -350,6 +350,27 @@ static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *ta
 	return found;
 }
 
+static struct acpi_pptt_cache *
+acpi_find_any_type_cache_node(struct acpi_table_header *table_hdr,
+			      u32 acpi_cpu_id, unsigned int level,
+			      struct acpi_pptt_processor **node)
+{
+	struct acpi_pptt_cache *cache;
+
+	cache = acpi_find_cache_node(table_hdr, acpi_cpu_id, CACHE_TYPE_UNIFIED,
+				     level, node);
+	if (cache)
+		return cache;
+
+	cache = acpi_find_cache_node(table_hdr, acpi_cpu_id, CACHE_TYPE_DATA,
+				     level, node);
+	if (cache)
+		return cache;
+
+	return acpi_find_cache_node(table_hdr, acpi_cpu_id, CACHE_TYPE_INST,
+				    level, node);
+}
+
 /**
  * update_cache_properties() - Update cacheinfo for the given processor
  * @this_leaf: Kernel cache info structure being updated
@@ -903,3 +924,64 @@ void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
 				     entry->length);
 	}
 }
+
+/*
+ * find_acpi_cache_level_from_id() - Get the level of the specified cache
+ * @cache_id: The id field of the cache
+ *
+ * Determine the level relative to any CPU for the cache identified by
+ * cache_id. This allows the property to be found even if the CPUs are offline.
+ *
+ * The returned level can be used to group caches that are peers.
+ *
+ * The PPTT table must be rev 3 or later.
+ *
+ * If one CPU's L2 is shared with another CPU as L3, this function will return
+ * an unpredictable value.
+ *
+ * Return: -ENOENT if the PPTT doesn't exist, the revision isn't supported or
+ * the cache cannot be found.
+ * Otherwise returns a value which represents the level of the specified cache.
+ */
+int find_acpi_cache_level_from_id(u32 cache_id)
+{
+	int level, cpu;
+	u32 acpi_cpu_id;
+	struct acpi_pptt_cache *cache;
+	struct acpi_table_header *table;
+	struct acpi_pptt_cache_v1 *cache_v1;
+	struct acpi_pptt_processor *cpu_node;
+
+	table = acpi_get_pptt();
+	if (!table)
+		return -ENOENT;
+
+	if (table->revision < 3)
+		return -ENOENT;
+
+	for_each_possible_cpu(cpu) {
+		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
+		if (!cpu_node)
+			continue;
+
+		/* Start at 1 for L1 */
+		level = 1;
+		cache = acpi_find_any_type_cache_node(table, acpi_cpu_id, level,
+						      &cpu_node);
+		while (cache) {
+			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
+						cache, sizeof(*cache));
+
+			if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
+			    cache_v1->cache_id == cache_id)
+				return level;
+
+			level++;
+			cache = acpi_find_any_type_cache_node(table, acpi_cpu_id,
+							      level, &cpu_node);
+		}
+	}
+
+	return -ENOENT;
+}
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4752ebd48132..be074bdfd4d1 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1542,6 +1542,7 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu);
 int find_acpi_cpu_topology_package(unsigned int cpu);
 int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
 void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
+int find_acpi_cache_level_from_id(u32 cache_id);
 #else
 static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
 {
@@ -1565,6 +1566,10 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
 }
 static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
 						     cpumask_t *cpus) { }
+static inline int find_acpi_cache_level_from_id(u32 cache_id)
+{
+	return -ENOENT;
+}
 #endif
 
 void acpi_arch_init(void);
-- 
2.39.5


