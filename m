Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2857DCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxNzN0ZapQ1Gh00oodcdyvsRLgrNv9RugztmUS5jUxg=; b=nxsNBip0lBxx/QPkn1khiYgUzD
	lzRUngpkRVnFFX4sBrotkvzF5dh/fS8Qw+5YC6uwq+zLEd+688qI2n0SlbBGITyq7pYFDnrFuRZbl
	AXYRt2rltR8S60mq9waWqD8DD5zLs9Ax9jAN4LMz1X2YjuNBUR3x8rQuw8mwaHqLM5ivLIwMKkuYz
	p48E7yRy465oIBwmNx6hfLFRN+LpKPbOQBuUS4iHcp72KdhbrU2eU3HPEBUJjGeCHQInK7F9r7ntS
	W1SxB8pD4egobWHJniJQiU6966yQco93dSF4IEmJ3CZt5RJxEyYCCTFWujXyi99sD43iimyVPGh/M
	RiHmQ4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwml-0000000Fu6Y-1Wtc;
	Mon, 17 Nov 2025 10:48:39 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwmi-0000000Fu5Y-3J0O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 10:48:38 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d94GF3pJgzHnHDn;
	Mon, 17 Nov 2025 18:48:05 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 3677B140159;
	Mon, 17 Nov 2025 18:48:34 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 dubpeml100005.china.huawei.com (7.214.146.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 17 Nov 2025 10:48:32 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Conor Dooley <conor@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, <linux-cxl@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, Dan Williams <dan.j.williams@intel.com>, "H . Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Drew Fustini
	<fustini@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <james.morse@arm.com>, Will Deacon <will@kernel.org>, Davidlohr Bueso
	<dave@stgolabs.net>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Dave Jiang <dave.jiang@intel.com>
Subject: [PATCH v6 1/7] memregion: Drop unused IORES_DESC_* parameter from cpu_cache_invalidate_memregion()
Date: Mon, 17 Nov 2025 10:47:54 +0000
Message-ID: <20251117104800.2041329-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251117104800.2041329-1-Jonathan.Cameron@huawei.com>
References: <20251117104800.2041329-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_024837_109420_77E3DFBE 
X-CRM114-Status: GOOD (  17.74  )
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

The res_desc parameter was originally introduced for documentation purposes
and with the idea that with HDM-DB CXL invalidation could be triggered from
the device. That has not come to pass and the continued existence of the
option is confusing when we add a range in the following patch which might
not be a strict subset of the res_desc. So avoid that confusion by dropping
the parameter.

Link: https://lore.kernel.org/linux-mm/686eedb25ed02_24471002e@dwillia2-xfh.jf.intel.com.notmuch/
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Suggested-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---
v6: No change.
v5: No change.
v4: Dan's tag (thanks!)
V3: New patch.
    As Dan calls out in the linked mail, an alternative might be to lookup
    the ranges and enforce the descriptor but his expressed preference
    was for dropping the parameter.
---
 arch/x86/mm/pat/set_memory.c | 2 +-
 drivers/cxl/core/region.c    | 2 +-
 drivers/nvdimm/region.c      | 2 +-
 drivers/nvdimm/region_devs.c | 2 +-
 include/linux/memregion.h    | 7 +++----
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index d2d54b8c4dbb..0cfee2544ad4 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -368,7 +368,7 @@ bool cpu_cache_has_invalidate_memregion(void)
 }
 EXPORT_SYMBOL_NS_GPL(cpu_cache_has_invalidate_memregion, "DEVMEM");
 
-int cpu_cache_invalidate_memregion(int res_desc)
+int cpu_cache_invalidate_memregion(void)
 {
 	if (WARN_ON_ONCE(!cpu_cache_has_invalidate_memregion()))
 		return -ENXIO;
diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index e14c1d305b22..36489cb086f3 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -236,7 +236,7 @@ static int cxl_region_invalidate_memregion(struct cxl_region *cxlr)
 		return -ENXIO;
 	}
 
-	cpu_cache_invalidate_memregion(IORES_DESC_CXL);
+	cpu_cache_invalidate_memregion();
 	return 0;
 }
 
diff --git a/drivers/nvdimm/region.c b/drivers/nvdimm/region.c
index cd9b52040d7b..47e263ecedf7 100644
--- a/drivers/nvdimm/region.c
+++ b/drivers/nvdimm/region.c
@@ -110,7 +110,7 @@ static void nd_region_remove(struct device *dev)
 	 * here is ok.
 	 */
 	if (cpu_cache_has_invalidate_memregion())
-		cpu_cache_invalidate_memregion(IORES_DESC_PERSISTENT_MEMORY);
+		cpu_cache_invalidate_memregion();
 }
 
 static int child_notify(struct device *dev, void *data)
diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
index a5ceaf5db595..c375b11aea6d 100644
--- a/drivers/nvdimm/region_devs.c
+++ b/drivers/nvdimm/region_devs.c
@@ -90,7 +90,7 @@ static int nd_region_invalidate_memregion(struct nd_region *nd_region)
 		}
 	}
 
-	cpu_cache_invalidate_memregion(IORES_DESC_PERSISTENT_MEMORY);
+	cpu_cache_invalidate_memregion();
 out:
 	for (i = 0; i < nd_region->ndr_mappings; i++) {
 		struct nd_mapping *nd_mapping = &nd_region->mapping[i];
diff --git a/include/linux/memregion.h b/include/linux/memregion.h
index c01321467789..945646bde825 100644
--- a/include/linux/memregion.h
+++ b/include/linux/memregion.h
@@ -26,8 +26,7 @@ static inline void memregion_free(int id)
 
 /**
  * cpu_cache_invalidate_memregion - drop any CPU cached data for
- *     memregions described by @res_desc
- * @res_desc: one of the IORES_DESC_* types
+ *     memregion
  *
  * Perform cache maintenance after a memory event / operation that
  * changes the contents of physical memory in a cache-incoherent manner.
@@ -46,7 +45,7 @@ static inline void memregion_free(int id)
  * the cache maintenance.
  */
 #ifdef CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
-int cpu_cache_invalidate_memregion(int res_desc);
+int cpu_cache_invalidate_memregion(void);
 bool cpu_cache_has_invalidate_memregion(void);
 #else
 static inline bool cpu_cache_has_invalidate_memregion(void)
@@ -54,7 +53,7 @@ static inline bool cpu_cache_has_invalidate_memregion(void)
 	return false;
 }
 
-static inline int cpu_cache_invalidate_memregion(int res_desc)
+static inline int cpu_cache_invalidate_memregion(void)
 {
 	WARN_ON_ONCE("CPU cache invalidation required");
 	return -ENXIO;
-- 
2.48.1


