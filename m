Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD52C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESkIGke1iFE9Q6toiTpobF2/Kkn44Z+9eDYKIOwSHmg=; b=qGJPPWi5Hal+dKTgu85dVFHGhy
	mbS2RMtfehYw6DHSYUy8uQSC2RoN5otAHY/89f+rm0P0hPuXtgg41Hv4bZrch9m14+Av1gtKOqUNL
	zg/DBrihi77T3SAs1yCO1YksYdkiQn3Coh1PuDcf3iBnYlpfbtEBJOSdPywGL9GR6f/+Y8olgEa+Z
	Mpr316ieRIpjW0H12AgRGjE+KwuPmmSdPuGRv8MGi6UcbuUJTRsSgxK2nlOSFh5o3JUPkajM6TWJs
	FqXpdydCvpzTahZwApA0VEilkOmWd0UtiNcFVUb4Fxx4/97AChq/HunIqmYVWdNRwNbUwx7ljRen/
	PyHcwq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGe-00000001gbR-0FO6;
	Fri, 04 Sep 2026 10:35:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RGc-00000001gaN-3kzG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:35:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A622843E53;
	Fri,  4 Sep 2026 10:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844A31F00A3E;
	Fri,  4 Sep 2026 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518130;
	bh=ESkIGke1iFE9Q6toiTpobF2/Kkn44Z+9eDYKIOwSHmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k02l9Yaxmnpzl9kswKAtm4zrmDePBloJ1RK0TJ3W3Sd/TsB0j0MVjfSi1BelD0tx7
	 82RWtQ9ttePRC7m4TAsTbJwjabh/oSX8Kmv70VA+82SwRr/Z0EZi5nP6eH6S/lgOu1
	 1Wob4A9K8xTMOaQkiSdliOZAV5nRCdgy+H6NsujCMY1ElEJ40wPe2kvjafAX0lIlft
	 fTre5+z/yfvGWx05PJHIUeHClTOkTC4YUrSDN5GSkbmrQVvr2ygEXR47cUyCEWuDDp
	 0voGyUvHa6pVctTPcwV/ccAqXxDsVjzZAK5x6+sYMSUQZ4+jnkhaAT+jr25AjceRrH
	 P0s6JOjoNShZw==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 5/9] swiotlb: Align shared IO TLB pools to the shared granule size
Date: Fri,  4 Sep 2026 16:04:48 +0530
Message-ID: <20260904103452.1197239-6-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
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

swiotlb pools used by confidential-computing guests are shared with the
host and therefore must be converted at the host shared-granule size. A
PAGE_SIZE-sized or PAGE_SIZE-aligned pool is not sufficient when the host
tracks shared state at a larger granularity.

Round swiotlb pool sizes to mem_cc_shared_granule_size(), allocate the
pools at that alignment, and use the same aligned size when decrypting,
encrypting and freeing pool memory. Apply the same rule to dynamically
allocated swiotlb pools.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/swiotlb.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index ded7016a46a7..f8936b03d942 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -369,7 +369,8 @@ void __init swiotlb_update_mem_attributes(void)
 
 	if (!mem->nslabs || mem->late_alloc)
 		return;
-	bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
+
+	bytes = mem_cc_align_to_shared_granule(mem->nslabs << IO_TLB_SHIFT);
 
 	if (io_tlb_default_mem.cc_shared) {
 		int ret;
@@ -436,8 +437,8 @@ static void __init *swiotlb_memblock_alloc(unsigned long nslabs,
 		unsigned int flags,
 		int (*remap)(void *tlb, unsigned long nslabs))
 {
-	size_t bytes = PAGE_ALIGN(nslabs << IO_TLB_SHIFT);
 	void *tlb;
+	size_t bytes = mem_cc_align_to_shared_granule(nslabs << IO_TLB_SHIFT);
 
 	/*
 	 * By default allocate the bounce buffer memory from low memory, but
@@ -445,9 +446,9 @@ static void __init *swiotlb_memblock_alloc(unsigned long nslabs,
 	 * memory encryption.
 	 */
 	if (flags & SWIOTLB_ANY)
-		tlb = memblock_alloc(bytes, PAGE_SIZE);
+		tlb = memblock_alloc(bytes, mem_cc_shared_granule_size());
 	else
-		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
+		tlb = memblock_alloc_low(bytes, mem_cc_shared_granule_size());
 
 	if (!tlb) {
 		pr_warn("%s: Failed to allocate %zu bytes tlb structure\n",
@@ -456,7 +457,7 @@ static void __init *swiotlb_memblock_alloc(unsigned long nslabs,
 	}
 
 	if (remap && remap(tlb, nslabs) < 0) {
-		memblock_free(tlb, PAGE_ALIGN(bytes));
+		memblock_free(tlb, bytes);
 		pr_warn("%s: Failed to remap %zu bytes\n", __func__, bytes);
 		return NULL;
 	}
@@ -578,7 +579,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		swiotlb_adjust_nareas(num_possible_cpus());
 
 retry:
-	order = get_order(nslabs << IO_TLB_SHIFT);
+	order = get_order(mem_cc_align_to_shared_granule(nslabs << IO_TLB_SHIFT));
 	nslabs = SLABS_PER_PAGE << order;
 
 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
@@ -587,6 +588,8 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		if (vstart)
 			break;
 		order--;
+		if (order < get_order(mem_cc_shared_granule_size()))
+			break;
 		nslabs = SLABS_PER_PAGE << order;
 		retried = true;
 	}
@@ -667,7 +670,7 @@ void __init swiotlb_exit(void)
 
 	pr_info("tearing down default memory pool\n");
 	tbl_vaddr = (unsigned long)phys_to_virt(mem->start);
-	tbl_size = PAGE_ALIGN(mem->end - mem->start);
+	tbl_size = mem_cc_align_to_shared_granule(mem->end - mem->start);
 	slots_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), mem->nslabs));
 
 	if (io_tlb_default_mem.cc_shared) {
@@ -711,12 +714,14 @@ void __init swiotlb_exit(void)
 static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes,
 		u64 phys_limit, unsigned long attrs)
 {
-	unsigned int order = get_order(bytes);
 	bool cc_shared = attrs & __DMA_ATTR_ALLOC_CC_SHARED;
+	unsigned int order;
 	struct page *page;
 	phys_addr_t paddr;
 	void *vaddr;
 
+	bytes = mem_cc_align_to_shared_granule(bytes);
+	order = get_order(bytes);
 	page = alloc_pages(gfp, order);
 	if (!page)
 		return NULL;
@@ -807,6 +812,7 @@ static void swiotlb_free_tlb(void *vaddr, size_t bytes, bool cc_shared)
 	    dma_free_from_pool(NULL, vaddr, bytes))
 		return;
 
+	bytes = mem_cc_align_to_shared_granule(bytes);
 	/* Intentional leak if pages cannot be encrypted again. */
 	if (!cc_shared ||
 	    !set_memory_encrypted((unsigned long)vaddr, PFN_UP(bytes)))
-- 
2.43.0


