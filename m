Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F96C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 05:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+L069aWcjLrB3wappLbuGG8uPbPUjJehCiHPiPcnjiU=; b=RguY7hYbk+Z1wHOMOS0vkwvYaB
	VdKO0ckay4fHFzmezLAYY1LfwqUG2X2wjH1CFGa9T7uy4mmEUom0yA7jx/lj1pOz3v1owBBvc9A5+
	l702qX9Mb9LnIMZ7ss4GsHHqU4U4yh2/yaA10J9PFVFjmrofJaNSd/YEhcfJtnnuvvoGjeuvpO76g
	zlRDGGN6hX0FYey7zkEQWw6PRpbhoJTH0q/h441v5qTu+JYr3Co5HxG8HpnGIaVmxTbni9LZHQHd6
	1TwDUYBPyzOck98WlLk2AijyQS/ijs2LRgdsoLnSdkbT3br5bHlD9sIL310Wy5BJ8I5YSgc7nEAY6
	xbRAM6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wentA-00000000jkn-2kMM;
	Wed, 01 Jul 2026 05:53:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1went9-00000000jk8-2Sq3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 05:53:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57ED94114B;
	Wed,  1 Jul 2026 05:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DDF1F00A3A;
	Wed,  1 Jul 2026 05:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782885215;
	bh=+L069aWcjLrB3wappLbuGG8uPbPUjJehCiHPiPcnjiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nfeku7BDXTkIy8A310rCK/bLDUec4Q6+EStCdhDLuKplUKfkzzbEA1N+9Qu1PK4uB
	 DeXHVZgxZaBeTm41qj17yyASNycpUjPazL5zuE9gE+NBcmVlltOuq9SAciZMWbHlcr
	 kz9h2kHnJ5VlGcCh5hjCUePDYG9qdYeAZCnR6rro0ndPy84SOZ66j3E3RRnXjJZvYD
	 GWfxQLtbuOHUXjP9IOT1ywuIelJyynfyEP9FBGXpvolQlhyYw7WDAE7wUG8OAaJIFr
	 iLXsVYsIoELudjnDKAm3BFbrLHsG0zrVwX3FX6s+GNeqTktiNcvSnD2rAP96vh8LCQ
	 C0z3J+SCHHVVg==
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
Subject: [PATCH v7 21/22] dma: swiotlb: handle set_memory_decrypted() failures
Date: Wed,  1 Jul 2026 11:19:25 +0530
Message-ID: <20260701054926.825925-22-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701054926.825925-1-aneesh.kumar@kernel.org>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
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

Check the return value when converting swiotlb pools between encrypted and
decrypted mappings. If the default pool cannot be decrypted after early
initialization, mark the pool fully used so it cannot satisfy future bounce
allocations.

For late initialization, return the `set_memory_decrypted()` failure. For
restricted DMA pools, fail device initialization if the reserved pool
cannot be decrypted.

This prevents swiotlb from using pools whose encryption attributes do not
match their metadata, and avoids returning pages with uncertain encryption
state back to the allocator.

Tested-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Petr Tesarik <ptesarik@suse.com>
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/swiotlb.c | 80 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 65 insertions(+), 15 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 4d0f2c04d891..8b7e47504304 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -248,6 +248,23 @@ static inline unsigned long nr_slots(u64 val)
 	return DIV_ROUND_UP(val, IO_TLB_SIZE);
 }
 
+static void swiotlb_mark_pool_used(struct io_tlb_pool *pool)
+{
+	unsigned long i;
+
+	for (i = 0; i < pool->nareas; i++) {
+		pool->areas[i].index = 0;
+		pool->areas[i].used = pool->area_nslabs;
+	}
+
+	for (i = 0; i < pool->nslabs; i++) {
+		pool->slots[i].list = 0;
+		pool->slots[i].orig_addr = INVALID_PHYS_ADDR;
+		pool->slots[i].alloc_size = 0;
+		pool->slots[i].pad_slots = 0;
+	}
+}
+
 /*
  * Early SWIOTLB allocation may be too early to allow an architecture to
  * perform the desired operations.  This function allows the architecture to
@@ -272,8 +289,16 @@ void __init swiotlb_update_mem_attributes(void)
 		return;
 	bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
 
-	if (io_tlb_default_mem.cc_shared)
-		set_memory_decrypted((unsigned long)mem->vaddr, bytes >> PAGE_SHIFT);
+	if (io_tlb_default_mem.cc_shared) {
+		int ret;
+
+		ret = set_memory_decrypted((unsigned long)mem->vaddr,
+					   bytes >> PAGE_SHIFT);
+		if (ret) {
+			pr_warn("Failed to decrypt default memory pool, disabling it\n");
+			swiotlb_mark_pool_used(mem);
+		}
+	}
 }
 
 static void swiotlb_init_io_tlb_pool(struct io_tlb_pool *mem, phys_addr_t start,
@@ -442,9 +467,10 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 {
 	struct io_tlb_pool *mem = &io_tlb_default_mem.defpool;
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+	unsigned int order, area_order, slot_order;
+	bool leak_pages = false;
 	unsigned int nareas;
 	unsigned char *vstart = NULL;
-	unsigned int order, area_order;
 	bool retried = false;
 	int rc = 0;
 
@@ -504,6 +530,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 			(PAGE_SIZE << order) >> 20);
 	}
 
+	rc = -ENOMEM;
 	nareas = limit_nareas(default_nareas, nslabs);
 	area_order = get_order(array_size(sizeof(*mem->areas), nareas));
 	mem->areas = (struct io_tlb_area *)
@@ -511,14 +538,20 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	if (!mem->areas)
 		goto error_area;
 
+	slot_order = get_order(array_size(sizeof(*mem->slots), nslabs));
 	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
-		get_order(array_size(sizeof(*mem->slots), nslabs)));
+					      slot_order);
 	if (!mem->slots)
 		goto error_slots;
 
-	if (io_tlb_default_mem.cc_shared)
-		set_memory_decrypted((unsigned long)vstart,
-				     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
+	if (io_tlb_default_mem.cc_shared) {
+		rc = set_memory_decrypted((unsigned long)vstart,
+					  (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
+		if (rc) {
+			leak_pages = true;
+			goto error_decrypt;
+		}
+	}
 
 	swiotlb_init_io_tlb_pool(mem, virt_to_phys(vstart), vstart, nslabs, true,
 				 nareas);
@@ -527,16 +560,20 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	swiotlb_print_info();
 	return 0;
 
+error_decrypt:
+	free_pages((unsigned long)mem->slots, slot_order);
 error_slots:
 	free_pages((unsigned long)mem->areas, area_order);
 error_area:
-	free_pages((unsigned long)vstart, order);
-	return -ENOMEM;
+	if (!leak_pages)
+		free_pages((unsigned long)vstart, order);
+	return rc;
 }
 
 void __init swiotlb_exit(void)
 {
 	struct io_tlb_pool *mem = &io_tlb_default_mem.defpool;
+	bool leak_pages = false;
 	unsigned long tbl_vaddr;
 	size_t tbl_size, slots_size;
 	unsigned int area_order;
@@ -552,19 +589,23 @@ void __init swiotlb_exit(void)
 	tbl_size = PAGE_ALIGN(mem->end - mem->start);
 	slots_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), mem->nslabs));
 
-	if (io_tlb_default_mem.cc_shared)
-		set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT);
+	if (io_tlb_default_mem.cc_shared) {
+		if (set_memory_encrypted(tbl_vaddr, tbl_size >> PAGE_SHIFT))
+			leak_pages = true;
+	}
 
 	if (mem->late_alloc) {
 		area_order = get_order(array_size(sizeof(*mem->areas),
 			mem->nareas));
 		free_pages((unsigned long)mem->areas, area_order);
-		free_pages(tbl_vaddr, get_order(tbl_size));
+		if (!leak_pages)
+			free_pages(tbl_vaddr, get_order(tbl_size));
 		free_pages((unsigned long)mem->slots, get_order(slots_size));
 	} else {
 		memblock_free(mem->areas,
 			array_size(sizeof(*mem->areas), mem->nareas));
-		memblock_phys_free(mem->start, tbl_size);
+		if (!leak_pages)
+			memblock_phys_free(mem->start, tbl_size);
 		memblock_free(mem->slots, slots_size);
 	}
 
@@ -1957,9 +1998,18 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 		 * restricted mem pool is shared by default
 		 */
 		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
+			int ret;
+
 			mem->cc_shared = true;
-			set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
-					     rmem->size >> PAGE_SHIFT);
+			ret = set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
+						   rmem->size >> PAGE_SHIFT);
+			if (ret) {
+				dev_err(dev, "Failed to decrypt restricted DMA pool\n");
+				kfree(pool->areas);
+				kfree(pool->slots);
+				kfree(mem);
+				return ret;
+			}
 		} else {
 			mem->cc_shared = false;
 		}
-- 
2.43.0


