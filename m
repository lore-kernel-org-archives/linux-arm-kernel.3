Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCB6C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNmXxUwPUUbE0uhZLdV/DpoiIzAnJIP9flb3a3foWIU=; b=iTX59U0oI3EZ95RdCyRz+Gd/G5
	uGwFHS7wEFSH9fJ7AzbqN9RrMCb5HJkD1h0DZzi+uZW4WVWLJXTMgOXqKinz9IunvO6c49a4YHTb8
	3xX48/J59QzYpEil/CJxrDgCh8r+xkaSTzO2nPqLdXhCbiSmskeWo9OtBhn2O2GCIXpvmRxoA0A1F
	sfJykZ12Qba2VcofZRGbCYaJOuijub8T4vMYLfauOi6NGTcS8EQRdZM6uWQIvrBQOQBGVqJQy71xD
	Uzi9LVxikt7558iG+SP38op+J2FvsmRgYGHXqauyMXJRhsga3t1qBc/qqfc8WJSEGzWkIRB4aTdSu
	K9skbSTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJx1-0000000Cqbz-0P45;
	Thu, 20 Mar 2025 17:45:03 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJtx-0000000CqBJ-2YuX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:41:55 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZJXqW3MDtz6M4LB;
	Fri, 21 Mar 2025 01:38:31 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BA7F21405A0;
	Fri, 21 Mar 2025 01:41:51 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Mar 2025 18:41:51 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<james.morse@arm.com>, <conor@kernel.org>, Yicong Yang
	<yangyicong@huawei.com>, <linux-acpi@vger.kernel.org>
CC: <linux-arch@vger.kernel.org>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, <linux-mm@kvack.org>,
	<gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: [RFC PATCH 1/6] memregion: Support fine grained invalidate by cpu_cache_invalidate_memregion()
Date: Thu, 20 Mar 2025 17:41:13 +0000
Message-ID: <20250320174118.39173-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
References: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_104153_953723_0A6A27F2 
X-CRM114-Status: GOOD (  15.25  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Extend cpu_cache_invalidate_memregion() to support invalidate certain
range of memory. Control of types of invalidation is left for when
usecases turn up. For now everything is Clean and Invalidate.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/x86/mm/pat/set_memory.c | 2 +-
 drivers/cxl/core/region.c    | 6 +++++-
 drivers/nvdimm/region.c      | 3 ++-
 drivers/nvdimm/region_devs.c | 3 ++-
 include/linux/memregion.h    | 8 ++++++--
 5 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index ef4514d64c05..5d2adec1b0d4 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -354,7 +354,7 @@ bool cpu_cache_has_invalidate_memregion(void)
 }
 EXPORT_SYMBOL_NS_GPL(cpu_cache_has_invalidate_memregion, "DEVMEM");
 
-int cpu_cache_invalidate_memregion(int res_desc)
+int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len)
 {
 	if (WARN_ON_ONCE(!cpu_cache_has_invalidate_memregion()))
 		return -ENXIO;
diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index e8d11a988fd9..6d1c9eee4cd9 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -238,7 +238,11 @@ static int cxl_region_invalidate_memregion(struct cxl_region *cxlr)
 		}
 	}
 
-	cpu_cache_invalidate_memregion(IORES_DESC_CXL);
+	if (!cxlr->params.res)
+		return -ENXIO;
+	cpu_cache_invalidate_memregion(IORES_DESC_CXL,
+				       cxlr->params.res->start,
+				       resource_size(cxlr->params.res));
 	return 0;
 }
 
diff --git a/drivers/nvdimm/region.c b/drivers/nvdimm/region.c
index 88dc062af5f8..033e40f4dc52 100644
--- a/drivers/nvdimm/region.c
+++ b/drivers/nvdimm/region.c
@@ -110,7 +110,8 @@ static void nd_region_remove(struct device *dev)
 	 * here is ok.
 	 */
 	if (cpu_cache_has_invalidate_memregion())
-		cpu_cache_invalidate_memregion(IORES_DESC_PERSISTENT_MEMORY);
+		cpu_cache_invalidate_memregion(IORES_DESC_PERSISTENT_MEMORY,
+					       0, -1);
 }
 
 static int child_notify(struct device *dev, void *data)
diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
index 37417ce5ec7b..eefd294a0f13 100644
--- a/drivers/nvdimm/region_devs.c
+++ b/drivers/nvdimm/region_devs.c
@@ -90,7 +90,8 @@ static int nd_region_invalidate_memregion(struct nd_region *nd_region)
 		}
 	}
 
-	cpu_cache_invalidate_memregion(IORES_DESC_PERSISTENT_MEMORY);
+	cpu_cache_invalidate_memregion(IORES_DESC_PERSISTENT_MEMORY,
+				       0, -1);
 out:
 	for (i = 0; i < nd_region->ndr_mappings; i++) {
 		struct nd_mapping *nd_mapping = &nd_region->mapping[i];
diff --git a/include/linux/memregion.h b/include/linux/memregion.h
index c01321467789..91d088ee3695 100644
--- a/include/linux/memregion.h
+++ b/include/linux/memregion.h
@@ -28,6 +28,9 @@ static inline void memregion_free(int id)
  * cpu_cache_invalidate_memregion - drop any CPU cached data for
  *     memregions described by @res_desc
  * @res_desc: one of the IORES_DESC_* types
+ * @start: start physical address of the target memory region.
+ * @len: length of the target memory region. -1 for all the regions of
+ *       the target type.
  *
  * Perform cache maintenance after a memory event / operation that
  * changes the contents of physical memory in a cache-incoherent manner.
@@ -46,7 +49,7 @@ static inline void memregion_free(int id)
  * the cache maintenance.
  */
 #ifdef CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
-int cpu_cache_invalidate_memregion(int res_desc);
+int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len);
 bool cpu_cache_has_invalidate_memregion(void);
 #else
 static inline bool cpu_cache_has_invalidate_memregion(void)
@@ -54,7 +57,8 @@ static inline bool cpu_cache_has_invalidate_memregion(void)
 	return false;
 }
 
-static inline int cpu_cache_invalidate_memregion(int res_desc)
+static inline int cpu_cache_invalidate_memregion(int res_desc,
+						 phys_addr_t start, size_t len)
 {
 	WARN_ON_ONCE("CPU cache invalidation required");
 	return -ENXIO;
-- 
2.43.0


