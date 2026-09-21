Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A63C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XD9KbmPFTDvG/++FINRoeRjfo1Owk1SK7Ef5Ny4pkE=; b=wpaKHNybiAmcOZbMFP12IH18Bg
	oQ5ANegX2kQaLht5HDAywfJAHsmW3zADZqWOjVTWJ4ZNr/Nk2xTnIAJO80CP/smkQAbb0cPibxoU6
	rhg1VyghLAArB8BZsw7NkgNeGm34q1J+QGwdBHRWQdRapNiTV1umMV9K77PNFfsb9juHITtJNGcmD
	ImnhgWZ9oQHyLMyV/L9Ph8Snq9dF7pG3o9muHu+kbVo5dYlH7PimGt/rAlkC8mmnvdPX9mEKArQWh
	v1brBlI+JzlRX/cV6x7Lp896dDd7ykPN/Cmfl+3GVKtDPynSKftb6KLvjzgtkHZJl/G0BOfpTUbz8
	S+2abhHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fLp-00000002SpU-19ZJ;
	Mon, 21 Sep 2026 14:50:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fLd-00000002ShS-0ney
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:50:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9619B600C8;
	Mon, 21 Sep 2026 14:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAD21F00893;
	Mon, 21 Sep 2026 14:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002224;
	bh=2XD9KbmPFTDvG/++FINRoeRjfo1Owk1SK7Ef5Ny4pkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HhhVBHd70NwE6tFDSR7EWwSk5kUn7dx1kha7j/ncW7XELIYaoWokPSNoeR4Gb7csH
	 manH/KE1JbmJ0i/7twyR8DQ5XrSNGVGXxOuKAD+RPrR+xXRboXZTQPlJ3QmEqu859i
	 HZU0YFWzKtkC9U5gYk+hQL+Nk1Q/jBfPYKwtVIz5itpVENE+9110tsSKuHgFvohU87
	 NP77rfhWL7u4mvtugGaq0ws9V+9f5uQ3MDPuE4Cb8F3CfiH0z1Pbw4bXnIUOU/GE2O
	 JQkgUxAsfSs1Z5A0oGnQxHSA6wqJm37P5biOyVae7LUBXaPY5G/IlRwsFO2EbC8dFE
	 osNmzMILFDf9Q==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	christian.koenig@amd.com,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v7 09/13] swiotlb: Align shared IO TLB pools to the shared granule size
Date: Mon, 21 Sep 2026 20:18:43 +0530
Message-ID: <20260921144847.501151-10-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921144847.501151-1-aneesh.kumar@kernel.org>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
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

Align and size the early memblock pool to the common CoCo shared
granule. Use the same rounded extent when the pool is transitioned and
when it is released. Re-zero the extent after a successful
private-to-shared transition because the architecture operation may
change memory contents. This deliberately leaves the slot count
unchanged: any rounded tail belongs to the pool allocation but is not
advertised as allocatable SWIOTLB space.

Replace the default and dynamic pool set_memory calls with the helpers
so alignment validation and architecture dispatch are kept in one place.
As before, pages are intentionally leaked if their private state cannot
be restored safely.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/swiotlb.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index ded7016a46a7..9928d75efc2d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -22,6 +22,7 @@
 
 #include <linux/cache.h>
 #include <linux/cc_platform.h>
+#include <linux/cc_shared.h>
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
 #include <linux/dma-direct.h>
@@ -38,7 +39,6 @@
 #include <linux/pfn.h>
 #include <linux/rculist.h>
 #include <linux/scatterlist.h>
-#include <linux/set_memory.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/swiotlb.h>
@@ -369,16 +369,18 @@ void __init swiotlb_update_mem_attributes(void)
 
 	if (!mem->nslabs || mem->late_alloc)
 		return;
-	bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
+
+	bytes = ALIGN(mem->nslabs << IO_TLB_SHIFT, cc_shared_granule_size());
 
 	if (io_tlb_default_mem.cc_shared) {
 		int ret;
 
-		ret = set_memory_decrypted((unsigned long)mem->vaddr,
-					   bytes >> PAGE_SHIFT);
+		ret = cc_make_shared(mem->vaddr, bytes);
 		if (ret) {
 			pr_warn("Failed to decrypt default memory pool, disabling it\n");
 			swiotlb_mark_pool_used(mem);
+		} else {
+			memset(mem->vaddr, 0, bytes);
 		}
 	}
 }
@@ -436,8 +438,8 @@ static void __init *swiotlb_memblock_alloc(unsigned long nslabs,
 		unsigned int flags,
 		int (*remap)(void *tlb, unsigned long nslabs))
 {
-	size_t bytes = PAGE_ALIGN(nslabs << IO_TLB_SHIFT);
 	void *tlb;
+	size_t bytes = ALIGN(nslabs << IO_TLB_SHIFT, cc_shared_granule_size());
 
 	/*
 	 * By default allocate the bounce buffer memory from low memory, but
@@ -445,9 +447,9 @@ static void __init *swiotlb_memblock_alloc(unsigned long nslabs,
 	 * memory encryption.
 	 */
 	if (flags & SWIOTLB_ANY)
-		tlb = memblock_alloc(bytes, PAGE_SIZE);
+		tlb = memblock_alloc(bytes, cc_shared_granule_size());
 	else
-		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
+		tlb = memblock_alloc_low(bytes, cc_shared_granule_size());
 
 	if (!tlb) {
 		pr_warn("%s: Failed to allocate %zu bytes tlb structure\n",
@@ -456,7 +458,7 @@ static void __init *swiotlb_memblock_alloc(unsigned long nslabs,
 	}
 
 	if (remap && remap(tlb, nslabs) < 0) {
-		memblock_free(tlb, PAGE_ALIGN(bytes));
+		memblock_free(tlb, bytes);
 		pr_warn("%s: Failed to remap %zu bytes\n", __func__, bytes);
 		return NULL;
 	}
@@ -578,7 +580,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		swiotlb_adjust_nareas(num_possible_cpus());
 
 retry:
-	order = get_order(nslabs << IO_TLB_SHIFT);
+	order = get_order(ALIGN(nslabs << IO_TLB_SHIFT, cc_shared_granule_size()));
 	nslabs = SLABS_PER_PAGE << order;
 
 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
@@ -587,6 +589,8 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		if (vstart)
 			break;
 		order--;
+		if (order < get_order(cc_shared_granule_size()))
+			break;
 		nslabs = SLABS_PER_PAGE << order;
 		retried = true;
 	}
@@ -626,8 +630,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		goto error_slots;
 
 	if (io_tlb_default_mem.cc_shared) {
-		rc = set_memory_decrypted((unsigned long)vstart,
-					  (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
+		rc = cc_make_shared(vstart, nslabs << IO_TLB_SHIFT);
 		if (rc) {
 			leak_pages = true;
 			goto error_decrypt;
@@ -667,11 +670,11 @@ void __init swiotlb_exit(void)
 
 	pr_info("tearing down default memory pool\n");
 	tbl_vaddr = (unsigned long)phys_to_virt(mem->start);
-	tbl_size = PAGE_ALIGN(mem->end - mem->start);
+	tbl_size = ALIGN(mem->end - mem->start, cc_shared_granule_size());
 	slots_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), mem->nslabs));
 
 	if (io_tlb_default_mem.cc_shared) {
-		if (set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT))
+		if (cc_make_private((void *)tbl_vaddr, tbl_size))
 			leak_pages = true;
 	}
 
@@ -711,12 +714,15 @@ void __init swiotlb_exit(void)
 static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes,
 		u64 phys_limit, unsigned long attrs)
 {
-	unsigned int order = get_order(bytes);
 	bool cc_shared = attrs & __DMA_ATTR_ALLOC_CC_SHARED;
+	unsigned int order;
 	struct page *page;
 	phys_addr_t paddr;
 	void *vaddr;
 
+	if (cc_shared)
+		bytes = ALIGN(bytes, cc_shared_granule_size());
+	order = get_order(bytes);
 	page = alloc_pages(gfp, order);
 	if (!page)
 		return NULL;
@@ -728,13 +734,13 @@ static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes,
 	}
 
 	vaddr = phys_to_virt(paddr);
-	if (cc_shared && set_memory_decrypted((unsigned long)vaddr, PFN_UP(bytes)))
+	if (cc_shared && cc_make_shared(vaddr, bytes))
 		goto error;
 	return page;
 
 error:
 	/* Intentional leak if pages cannot be encrypted again. */
-	if (cc_shared && !set_memory_encrypted((unsigned long)vaddr, PFN_UP(bytes)))
+	if (cc_shared && !cc_make_private(vaddr, bytes))
 		__free_pages(page, order);
 	return NULL;
 }
@@ -807,9 +813,11 @@ static void swiotlb_free_tlb(void *vaddr, size_t bytes, bool cc_shared)
 	    dma_free_from_pool(NULL, vaddr, bytes))
 		return;
 
+	if (cc_shared)
+		bytes = ALIGN(bytes, cc_shared_granule_size());
 	/* Intentional leak if pages cannot be encrypted again. */
 	if (!cc_shared ||
-	    !set_memory_encrypted((unsigned long)vaddr, PFN_UP(bytes)))
+	    !cc_make_private(vaddr, bytes))
 		__free_pages(virt_to_page(vaddr), get_order(bytes));
 }
 
-- 
2.43.0


