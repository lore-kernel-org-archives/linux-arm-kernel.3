Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9911CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28gAGxAT6yyFPOrZbknmeVeC1tPuyb3t0ezhz06WVCM=; b=RJg1kHdbHY1hBsKELgu5sP++e4
	LgKNxkBnExhEqwxhCWy6KYiCMlzKyMjSx6phim5t7YV5EDPDiEU+HdCKvSbPncw28Bz8DkeUPzw/g
	7tDay5h+i4+wncbPc9PeRHyqDLivBQZiBEOWW5DETq23NzpvQuhMawcB718v9WzVKlZH37FBsaiaU
	W2v6UO4Pt2KMQe0pF2rrk2fA2MYeipCY/H0pbwm4NbRRFQxCCdN/dWDnHifWwouEiuiqmsmf7r9FK
	7IqX7c5yLRU8WCA8kQMb7YEB6QzLn2fpUQcEA1r1PLS3BrdvmWaUgog9HDnxEA17WgnTY9z+p9TO0
	WpLc1r8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3fR-0000000GPZl-22Rd;
	Thu, 04 Jun 2026 08:43:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3fQ-0000000GPYz-0cb7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 08:43:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CAB5543526;
	Thu,  4 Jun 2026 08:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D721F00893;
	Thu,  4 Jun 2026 08:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780562587;
	bh=28gAGxAT6yyFPOrZbknmeVeC1tPuyb3t0ezhz06WVCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nB9gQ4aFlKUpGUcihtsmI/cFkRNvSLQlBMVfFfId6za3U9oIZifeElqfvJ/gMMYLV
	 kK9nLDYi/76JeTYI0eOMh6Ev87PICHvhy0d1ZKgpW4V7V0HhFFF5pltK8QUwBgbaaU
	 AfTbyxMYiMbryQfwJ65A2G2jc3RkvI/TeFKscmT4OobGaUuPuVSaPsf+Y9qMoAzQ+w
	 qQShsxWWYTx1w+YWqV2DLGX6UxvSmK9OjRoCDsr0peBDdamrU4PWYXtZy55sxBwaSo
	 WpS//rd8RA5c1c8l+zl23/OHY/f2k3XfRfr004sW3x9c754aQDpKx39tz9vKXx6uZO
	 kzFmq6SY4lRqw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH v6 19/20] swiotlb: Preserve allocation virtual address for dynamic pools
Date: Thu,  4 Jun 2026 14:09:58 +0530
Message-ID: <20260604083959.1265923-20-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

swiotlb_alloc_tlb() can allocate from the DMA atomic pool when a decrypted
pool is needed from atomic context. With CONFIG_DMA_DIRECT_REMAP, the
atomic pool is backed by remapped virtual addresses, which are not the same
as the direct-map addresses returned by phys_to_virt().

swiotlb_init_io_tlb_pool() currently reconstructs the pool virtual address
from the physical start address. For atomic-pool backed allocations this
stores the wrong address in pool->vaddr. Later, swiotlb_free_tlb() passes
that address to dma_free_from_pool(), which will fail to recognize the
chunk

Pass the virtual address returned by the allocation path into
swiotlb_init_io_tlb_pool(), and store that address in pool->vaddr. This
keeps the pool free path using the same virtual address as the allocator.

Tested-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/swiotlb.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 14d834ca298b..e4bd8c9eaeda 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -302,9 +302,9 @@ void __init swiotlb_update_mem_attributes(void)
 }
 
 static void swiotlb_init_io_tlb_pool(struct io_tlb_pool *mem, phys_addr_t start,
-		unsigned long nslabs, bool late_alloc, unsigned int nareas)
+		void *vaddr, unsigned long nslabs, bool late_alloc,
+		unsigned int nareas)
 {
-	void *vaddr = phys_to_virt(start);
 	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
 
 	mem->nslabs = nslabs;
@@ -445,7 +445,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		return;
 	}
 
-	swiotlb_init_io_tlb_pool(mem, __pa(tlb), nslabs, false, nareas);
+	swiotlb_init_io_tlb_pool(mem, __pa(tlb), tlb, nslabs, false, nareas);
 	add_mem_pool(&io_tlb_default_mem, mem);
 
 	if (flags & SWIOTLB_VERBOSE)
@@ -553,7 +553,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		}
 	}
 
-	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), nslabs, true,
+	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), vstart, nslabs, true,
 				 nareas);
 	add_mem_pool(&io_tlb_default_mem, mem);
 
@@ -664,25 +664,26 @@ static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes,
  * @phys_limit:	Maximum allowed physical address of the buffer.
  * @attrs:	DMA attributes for the allocation.
  * @gfp:	GFP flags for the allocation.
+ * @vaddr:	Receives the virtual address for the allocated buffer.
  *
  * Return: Allocated pages, or %NULL on allocation failure.
  */
 static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
-		u64 phys_limit, unsigned long attrs, gfp_t gfp)
+		u64 phys_limit, unsigned long attrs, gfp_t gfp, void **vaddr)
 {
 	struct page *page;
 
+	*vaddr = NULL;
+
 	/*
 	 * Allocate from the atomic pools if memory is encrypted and
 	 * the allocation is atomic, because decrypting may block.
 	 */
 	if (!gfpflags_allow_blocking(gfp) && (attrs & DMA_ATTR_CC_SHARED)) {
-		void *vaddr;
-
 		if (!IS_ENABLED(CONFIG_DMA_COHERENT_POOL))
 			return NULL;
 
-		return dma_alloc_from_pool(dev, bytes, &vaddr, gfp,
+		return dma_alloc_from_pool(dev, bytes, vaddr, gfp,
 					   attrs, dma_coherent_ok);
 	}
 
@@ -705,6 +706,8 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
 			return NULL;
 	}
 
+	if (page)
+		*vaddr = phys_to_virt(page_to_phys(page));
 	return page;
 }
 
@@ -750,6 +753,7 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
 {
 	struct io_tlb_pool *pool;
 	unsigned int slot_order;
+	void *tlb_vaddr;
 	struct page *tlb;
 	size_t pool_size;
 	size_t tlb_size;
@@ -767,7 +771,8 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
 	pool->unencrypted = !!(attrs & DMA_ATTR_CC_SHARED);
 
 	tlb_size = nslabs << IO_TLB_SHIFT;
-	while (!(tlb = swiotlb_alloc_tlb(dev, tlb_size, phys_limit, attrs, gfp))) {
+	while (!(tlb = swiotlb_alloc_tlb(dev, tlb_size, phys_limit, attrs, gfp,
+					 &tlb_vaddr))) {
 		if (nslabs <= minslabs)
 			goto error_tlb;
 		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
@@ -781,12 +786,12 @@ static struct io_tlb_pool *swiotlb_alloc_pool(struct device *dev,
 	if (!pool->slots)
 		goto error_slots;
 
-	swiotlb_init_io_tlb_pool(pool, page_to_phys(tlb), nslabs, true, nareas);
+	swiotlb_init_io_tlb_pool(pool, page_to_phys(tlb), tlb_vaddr, nslabs,
+				 true, nareas);
 	return pool;
 
 error_slots:
-	swiotlb_free_tlb(page_address(tlb), tlb_size,
-			 !!(attrs & DMA_ATTR_CC_SHARED));
+	swiotlb_free_tlb(tlb_vaddr, tlb_size, !!(attrs & DMA_ATTR_CC_SHARED));
 error_tlb:
 	kfree(pool);
 error:
@@ -1995,7 +2000,8 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 			mem->unencrypted = false;
 		}
 
-		swiotlb_init_io_tlb_pool(pool, rmem->base, nslabs,
+		swiotlb_init_io_tlb_pool(pool, rmem->base, phys_to_virt(rmem->base),
+					 nslabs,
 					 false, nareas);
 		mem->force_bounce = true;
 		mem->for_alloc = true;
-- 
2.43.0


