Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCB3CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXlrzBCMamjHmGtmAEIZStsfrt12b8LW2N5iogEp644=; b=qcBSYdh11jQ1C/ugwEBG8l/FWC
	/g8txul92txVO4L3ORpMe+jMWO1RkXr635wDY9OV0ssYdbF8+HYs1yGEEgrXZGlIX6I5zzHH9Z+Ma
	ZEBzuzF872x+gs/M2Ux/TCAjkAhtCkrktnp/dp7+DoEfHie/O4ZvAuOvmO67hu2hQbTf9IBfQqiZk
	kIjsfg7NdgV2SSdDfczyO9HueXg9bo8yDvxCeTp5L025mjDSVuLq2og9XJdSr3LcMeFlXG9Ms/AKG
	dghk5VMTTYKwx7hPzWs8UnCg5WR3jiocmour82hlZo40RtWP1kvp4KZjaI1MfCwT/tNXLlC89jmNz
	c1E6TJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBX7L-00000002fPK-1KYc;
	Wed, 22 Oct 2025 11:35:00 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBX7I-00000002fNc-2J5a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 11:34:57 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cs6Vf3z00z6K6kK;
	Wed, 22 Oct 2025 19:33:30 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id BD332140157;
	Wed, 22 Oct 2025 19:34:54 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 dubpeml100005.china.huawei.com (7.214.146.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Oct 2025 12:34:53 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Conor Dooley <conor@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, <linux-cxl@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, Dan Williams <dan.j.williams@intel.com>, "H . Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>
CC: <james.morse@arm.com>, Will Deacon <will@kernel.org>, Davidlohr Bueso
	<dave@stgolabs.net>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Dave Jiang <dave.jiang@intel.com>
Subject: [PATCH v4 2/6] memregion: Support fine grained invalidate by cpu_cache_invalidate_memregion()
Date: Wed, 22 Oct 2025 12:33:45 +0100
Message-ID: <20251022113349.1711388-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022113349.1711388-1-Jonathan.Cameron@huawei.com>
References: <20251022113349.1711388-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_043456_871945_CC72FBA2 
X-CRM114-Status: GOOD (  20.94  )
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

Extend cpu_cache_invalidate_memregion() to support invalidate certain range
of memory by introducing start and length parameters. Control of types of
invalidation is left for when usecases turn up. For now everything is
Clean and Invalidate.

Where the range is unknown, use the provided cpu_cache_invalidate_all()
helper to act as documentation of intent that is clearer than passing
(0, -1) to cpu_cache_invalidate_memregion().

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v4: Add cpu_cache_invalidate_all() helper for the (0, -1) case that
    applies when we don't have the invalidate range so just want to
    invalidate all caches. - (Thanks to Dan Williams for this suggestion).
v3: Rebase on top of previous patch that removed the IO_RESDESC_*
    parameter.
---
 arch/x86/mm/pat/set_memory.c |  2 +-
 drivers/cxl/core/region.c    |  5 ++++-
 drivers/nvdimm/region.c      |  2 +-
 drivers/nvdimm/region_devs.c |  2 +-
 include/linux/memregion.h    | 13 +++++++++++--
 5 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 0cfee2544ad4..05e7704f0128 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -368,7 +368,7 @@ bool cpu_cache_has_invalidate_memregion(void)
 }
 EXPORT_SYMBOL_NS_GPL(cpu_cache_has_invalidate_memregion, "DEVMEM");
 
-int cpu_cache_invalidate_memregion(void)
+int cpu_cache_invalidate_memregion(phys_addr_t start, size_t len)
 {
 	if (WARN_ON_ONCE(!cpu_cache_has_invalidate_memregion()))
 		return -ENXIO;
diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index 36489cb086f3..7d0f6f07352f 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -236,7 +236,10 @@ static int cxl_region_invalidate_memregion(struct cxl_region *cxlr)
 		return -ENXIO;
 	}
 
-	cpu_cache_invalidate_memregion();
+	if (!cxlr->params.res)
+		return -ENXIO;
+	cpu_cache_invalidate_memregion(cxlr->params.res->start,
+				       resource_size(cxlr->params.res));
 	return 0;
 }
 
diff --git a/drivers/nvdimm/region.c b/drivers/nvdimm/region.c
index 47e263ecedf7..53567f3ed427 100644
--- a/drivers/nvdimm/region.c
+++ b/drivers/nvdimm/region.c
@@ -110,7 +110,7 @@ static void nd_region_remove(struct device *dev)
 	 * here is ok.
 	 */
 	if (cpu_cache_has_invalidate_memregion())
-		cpu_cache_invalidate_memregion();
+		cpu_cache_invalidate_all();
 }
 
 static int child_notify(struct device *dev, void *data)
diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
index c375b11aea6d..1220530a23b6 100644
--- a/drivers/nvdimm/region_devs.c
+++ b/drivers/nvdimm/region_devs.c
@@ -90,7 +90,7 @@ static int nd_region_invalidate_memregion(struct nd_region *nd_region)
 		}
 	}
 
-	cpu_cache_invalidate_memregion();
+	cpu_cache_invalidate_all();
 out:
 	for (i = 0; i < nd_region->ndr_mappings; i++) {
 		struct nd_mapping *nd_mapping = &nd_region->mapping[i];
diff --git a/include/linux/memregion.h b/include/linux/memregion.h
index 945646bde825..a55f62cc5266 100644
--- a/include/linux/memregion.h
+++ b/include/linux/memregion.h
@@ -27,6 +27,9 @@ static inline void memregion_free(int id)
 /**
  * cpu_cache_invalidate_memregion - drop any CPU cached data for
  *     memregion
+ * @start: start physical address of the target memory region.
+ * @len: length of the target memory region. -1 for all the regions of
+ *       the target type.
  *
  * Perform cache maintenance after a memory event / operation that
  * changes the contents of physical memory in a cache-incoherent manner.
@@ -45,7 +48,7 @@ static inline void memregion_free(int id)
  * the cache maintenance.
  */
 #ifdef CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
-int cpu_cache_invalidate_memregion(void);
+int cpu_cache_invalidate_memregion(phys_addr_t start, size_t len);
 bool cpu_cache_has_invalidate_memregion(void);
 #else
 static inline bool cpu_cache_has_invalidate_memregion(void)
@@ -53,10 +56,16 @@ static inline bool cpu_cache_has_invalidate_memregion(void)
 	return false;
 }
 
-static inline int cpu_cache_invalidate_memregion(void)
+static inline int cpu_cache_invalidate_memregion(phys_addr_t start, size_t len)
 {
 	WARN_ON_ONCE("CPU cache invalidation required");
 	return -ENXIO;
 }
 #endif
+
+static inline int cpu_cache_invalidate_all(void)
+{
+	return cpu_cache_invalidate_memregion(0, -1);
+}
+
 #endif /* _MEMREGION_H_ */
-- 
2.48.1


