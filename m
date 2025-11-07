Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9085DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiGnZBnxEG3KkcwAPw+2pDW0vAUhsvIdd9TEfoPVvG4=; b=KejlZWCawKK+MGHckbPr+KapcW
	u0czP7PH1e8XcqGLHxXterMTvj900qXNNd+mZibQOfvMMPyvLhnuIkclQXKVeHHRBAFCPvxZSS8bN
	YKsTX6TU3NFGYgQwT07NxVrQq9i1rIDMWF8DB4zGIORsoGwfqYxpS/JeG86mGK8qYOpTcIuzDPLKm
	/ZwRdWECI9L4nShdYMPxPh48anAt1oFk8eYVFBCZLhQ16eK1A+c6FOhA8JiPP4pFbHSkTZTLZmcQ1
	Y+Ogyn6i1EHiCFZaOkuhKtdO4NYJLyCkMlsQ9wuBsMjVh3UyWPXASixjSzOJPSR2wbbhp69I9+q7L
	S0dzcXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLhC-0000000HIsm-1ZRX;
	Fri, 07 Nov 2025 12:36:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLhA-0000000HIr7-2Pif
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 12:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TiGnZBnxEG3KkcwAPw+2pDW0vAUhsvIdd9TEfoPVvG4=; b=i8QtaeYZRTn8go4VUwLG3B1DMJ
	lfAY+ywTi1ss827hSHIc24EhfcYpFyxMw56ZkRo0o4RHzQoZ3cnUzoC7Mjtcs8/3yh/dMUHy3G625
	VU3wvkweOeuaSOQY9XpoSJnmC22tg/8EasN7X1aNZVRsvhnToBy+lY379h/UgzDUvXmEiyiTn1LyP
	G5CUxNK8mPHKj1Xk7Kj+SElhe88Sx0MkToCpMTc/+Fxx85ogXZoba09Q6TwQShr5kwrk1qMNtQkIC
	uRTj7d6EGUzbUlsPbonENwXh9maMcJeq7TQDgcdFuu0jHXK7eTTsTpj4FM7BQ6MRtmBrb9DWCbH4l
	y6U3asNg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKpP-00000006NtX-1SYk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:40:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 876B4153B;
	Fri,  7 Nov 2025 04:35:46 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62A543F66E;
	Fri,  7 Nov 2025 04:35:49 -0800 (PST)
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
	Rohit Mathew <Rohit.Mathew@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH 05/33] ACPI / PPTT: Add a helper to fill a cpumask from a cache_id
Date: Fri,  7 Nov 2025 12:34:22 +0000
Message-ID: <20251107123450.664001-6-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107123450.664001-1-ben.horgan@arm.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_114027_739191_195ED144 
X-CRM114-Status: GOOD (  16.61  )
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
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v3:
Equivalent changes to the previous patch:
 Tags dropped due to rework
 Fallout/simplification from adding acpi_pptt_cache_v1_full
 Look for each cache type before incrementing level
---
 drivers/acpi/pptt.c  | 62 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  6 +++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 71841c106020..7b4cb17c12c0 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -981,3 +981,65 @@ int find_acpi_cache_level_from_id(u32 cache_id)
 
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
+		bool not_empty = true;
+		u32 acpi_cpu_id;
+		struct acpi_pptt_cache_v1_full *cache;
+		struct acpi_pptt_processor *cpu_node;
+
+		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
+		if (!cpu_node)
+			continue;
+
+		for (int level = 1; not_empty; level++) {
+			int cache_type[] = {CACHE_TYPE_INST, CACHE_TYPE_DATA, CACHE_TYPE_UNIFIED};
+
+			not_empty = false;
+			for (int i = 0; i < ARRAY_SIZE(cache_type); i++) {
+				cache = acpi_find_cache_node(table, acpi_cpu_id, cache_type[i],
+							     level, &cpu_node);
+
+				if (!cache)
+					continue;
+
+				not_empty = true;
+
+				if (acpi_pptt_cache_id_is_valid(cache) &&
+				    cache->extra.cache_id == cache_id)
+					cpumask_set_cpu(cpu, cpus);
+			}
+		}
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


