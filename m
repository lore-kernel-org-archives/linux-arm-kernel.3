Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF77C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 19:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3Kc+QzvysllmMiF1OC6mseL9rAH12tzHcdNPQ1HpIg=; b=KDJlKSz1MMkBpIBAUx6Dr65Ye8
	Z+2FVCodJS9klPOIG8RkiINYGA3h/e/3j/DqXuMe3URsWjraPxgc6on2SWLs0cqYv6LhMcjMnNo7Q
	9IV2RVNRRvnwK75SS61GHt0S2kpg0C/m+jYc0Y7G62LmFKb1ylqO7sn0WDL4XuFZqLfCSXgPfhzMn
	BYVv+qxAd32qPaDK5P4Oqw0xA/pIDQMBZGoEYStT6Hx0vhIk2wZ+XLe1b3OXNexpbfyc5VRyqHgwa
	KnuUxpKVQLqG6IOdLu9j2KzqvOgC57pvhkhCRhCoJ7G+DJuH0/WkIw18gGqBid+0HI6lp1CaFL1cC
	meN/cF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJ0J-0000000FbFj-1B4t;
	Fri, 11 Jul 2025 19:01:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIch-0000000FX87-0dQ7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:37:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46AE52247;
	Fri, 11 Jul 2025 11:37:16 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9B5D3F694;
	Fri, 11 Jul 2025 11:37:23 -0700 (PDT)
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
Subject: [RFC PATCH 07/36] ACPI / PPTT: Find cache level by cache-id
Date: Fri, 11 Jul 2025 18:36:19 +0000
Message-Id: <20250711183648.30766-8-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250711183648.30766-1-james.morse@arm.com>
References: <20250711183648.30766-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_113727_277630_BF6CB079 
X-CRM114-Status: GOOD (  18.37  )
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

acpi_count_levels() expects its levels parameter to be initialised to
zero as it passes it to acpi_find_cache_level() as starting_level.
The existing callers do this. Document it.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/acpi/pptt.c  | 73 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  5 +++
 2 files changed, 78 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 13ca2eee3b98..f53748a5df19 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -912,3 +912,76 @@ int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
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
+	acpi_status status;
+	int level, cpu, num_levels;
+	struct acpi_pptt_cache *cache;
+	struct acpi_table_header *table;
+	struct acpi_pptt_cache_v1 *cache_v1;
+	struct acpi_pptt_processor *cpu_node;
+
+	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
+	if (ACPI_FAILURE(status)) {
+		acpi_pptt_warn_missing();
+		return -ENOENT;
+	}
+
+	if (table->revision < 3) {
+		acpi_put_table(table);
+		return -ENOENT;
+	}
+
+	/*
+	 * If we found the cache first, we'd still need to walk from each CPU
+	 * to find the level...
+	 */
+	for_each_possible_cpu(cpu) {
+		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
+		if (!cpu_node)
+			break;
+		acpi_count_levels(table, cpu_node, &num_levels, NULL);
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
+			    cache_v1->cache_id == cache_id) {
+				acpi_put_table(table);
+				return level;
+			}
+		}
+	}
+
+	acpi_put_table(table);
+	return -ENOENT;
+}
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 8c3165c2b083..82947f6d2a43 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1542,6 +1542,7 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu);
 int find_acpi_cpu_topology_package(unsigned int cpu);
 int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
 int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
+int find_acpi_cache_level_from_id(u32 cache_id);
 #else
 static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
 {
@@ -1568,6 +1569,10 @@ static inline int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
 {
 	return -EINVAL;
 }
+static inline int find_acpi_cache_level_from_id(u32 cache_id)
+{
+	return -EINVAL;
+}
 #endif
 
 void acpi_arch_init(void);
-- 
2.39.5


