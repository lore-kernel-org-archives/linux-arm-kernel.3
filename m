Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569C1CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Je6CohPv3apx2vuDRNebhx/FdlP9SZpeKCm0L/J5uoU=; b=mE8TV8XRGjawFd7kXOteafxFDR
	YhmGJIOl+jr+C/bW3VeDBRpLZJq7I3kunOgkYrDmVo1cOG63o+6XfO9pVsMsTLWmkSYkC5P6VOxty
	RGaVsTDSK+DwU5ld/K5GHygGfkyMxCdy6KhdIFjK2Kas2WRpnrmBM/6xJCkzmZw98Kerurpr8phxf
	gQ/TdqjJmV0S7JErTRUvtkvOPXvttNctYK6XKxVtTyqnWyUIjvkBpRbr81HdfXl53cbvV0AYcjf+L
	LUD+dtTCdluZaevFHpGbDMsM/d3UD3f45vY73ZF247VFcuGa9P0bxchm1uSs0v+tgC6I8S9l4x83y
	Ek9BXwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrq-000000047Hk-0qJB;
	Sat, 23 Aug 2025 06:36:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTjV-000000031Y4-2VPa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 15:31:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A680827DC;
	Fri, 22 Aug 2025 08:31:02 -0700 (PDT)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 970AB3F63F;
	Fri, 22 Aug 2025 08:31:05 -0700 (PDT)
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
Subject: [PATCH 01/33] cacheinfo: Expose the code to generate a cache-id from a device_node
Date: Fri, 22 Aug 2025 15:29:42 +0000
Message-Id: <20250822153048.2287-2-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250822153048.2287-1-james.morse@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_083113_732896_DEC055DF 
X-CRM114-Status: GOOD (  14.61  )
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

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall().

Expose the code that generates the cache-id. The parts of the MPAM
driver that run early can use this to set up the resctrl structures
before cacheinfo is ready in device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
---
Changes since v1:
 * Renamed cache_of_get_id() cache_of_calculate_id().
---
 drivers/base/cacheinfo.c  | 19 +++++++++++++------
 include/linux/cacheinfo.h |  1 +
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 613410705a47..f6289d142ba9 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -207,11 +207,10 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+unsigned long cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
-	u32 min_id = ~0;
+	unsigned long min_id = ~0UL;
 
 	for_each_of_cpu_node(cpu) {
 		u64 id = of_get_cpu_hwid(cpu, 0);
@@ -219,15 +218,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0UL;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	unsigned long id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0UL) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index c8f4f0a0b874..2dcbb69139e9 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -112,6 +112,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+unsigned long cache_of_calculate_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at
-- 
2.20.1


