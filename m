Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C94FC61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZMBIw4N/XFRVBR6OQWXmAU9GDE2aov+oSzOLOWnWJU=; b=z4heeUI8KK1O9NE4RDx1W4t4ye
	hd3cZphv6ByCfm2fyOjDBxnWtSC2qQg89hiocL1tlqvPmAGHhOMUCk/o9CNJ6Q3/iAko6gj23DzQW
	g7TKcEhvaqgBj1kALco/XZXxH+ihmFwudpZWmdFosSBi3uxcSmstpmK59PlX0RT3LtjsbBX+2FiBC
	hr9cf+UPBVM4PIh6HMPd2hmRwbupo2DEnpqxtpVsiUtZ9WOALo7+CppptxU2oMnpoROLTCQTHIPJ/
	Cjg4KZ9m0ewok4ylLyqMzpQLBcZw97NG8VXih4J1WLk80ClpVYnDCbhQzSVhwxokiTf88b29x1LU4
	1+haxUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynLz-00000000TXD-0Tko;
	Tue, 25 Aug 2026 09:21:59 +0000
Received: from mail-m60220.netease.com ([210.79.60.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynLu-00000000TVU-2pUX;
	Tue, 25 Aug 2026 09:21:57 +0000
Received: from xxm-vm.localdomain (unknown [61.154.14.87])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4b3ea0c12;
	Tue, 25 Aug 2026 17:21:47 +0800 (GMT+08:00)
From: Simon Xue <xxm@rock-chips.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Simon Xue <xxm@rock-chips.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] iommu/rockchip: Reduce rk_iommu_ops to pure data
Date: Tue, 25 Aug 2026 17:21:31 +0800
Message-Id: <20260825092132.154150-2-xxm@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825092132.154150-1-xxm@rock-chips.com>
References: <20260825092132.154150-1-xxm@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa03839cf3d09d3kunm5f4590cc6e032e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQhlCVhpJGU5LT0JCQ09PSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ0xZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=VZbBGT9LmaIaylnzYbgkenzSH3C75sjykxWVf9i+3fkRXQQv7h3smRWgdyFasyOMuF2QrheC6RflMdaCjX6P58h6LFl5XOfW5UIgElBB144BpyWGiagR2GC/edbtV7ETRfopIWvLC2WjplpHydeBLdIEj5qWuA0faC9dBDQusDU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=PZMBIw4N/XFRVBR6OQWXmAU9GDE2aov+oSzOLOWnWJU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_022155_433063_55C3E3A8 
X-CRM114-Status: GOOD (  16.21  )
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

Fold the per-version pt_address()/mk_dtentries()/mk_ptentries()
callbacks into single encoders that pick the layout at runtime. Only v2
can address more than 32 bits, so the layout is derived from paddr_mask.
rk_iommu_ops now carries only data.

Signed-off-by: Simon Xue <xxm@rock-chips.com>
---
 drivers/iommu/rockchip-iommu.c | 105 ++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 55 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 21af2f621c76..9a5aabb2b9c8 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -85,9 +85,7 @@
 #define RK_IOMMU_PGSIZE_BITMAP 0x007ff000
 
 struct rk_iommu_ops {
-	phys_addr_t (*pt_address)(u32 dte);
-	u32 (*mk_dtentries)(dma_addr_t pt_dma);
-	u32 (*mk_ptentries)(phys_addr_t page, int prot);
+	phys_addr_t paddr_mask;	/* valid physical-address bits */
 	u64 dma_bit_mask;
 	gfp_t gfp_flags;
 };
@@ -182,11 +180,6 @@ static struct rk_iommu_domain *to_rk_domain(struct iommu_domain *dom)
 #define RK_DTE_PT_ADDRESS_MASK    0xfffff000
 #define RK_DTE_PT_VALID           BIT(0)
 
-static inline phys_addr_t rk_dte_pt_address(u32 dte)
-{
-	return (phys_addr_t)dte & RK_DTE_PT_ADDRESS_MASK;
-}
-
 /*
  * In v2:
  * 31:12 - PT address bit 31:0
@@ -203,15 +196,24 @@ static inline phys_addr_t rk_dte_pt_address(u32 dte)
 #define PAGE_DESC_HI_MASK1	GENMASK_ULL(35, 32)
 #define PAGE_DESC_HI_MASK2	GENMASK_ULL(39, 36)
 
-static inline phys_addr_t rk_dte_pt_address_v2(u32 dte)
+static inline bool rk_ops_is_v2(const struct rk_iommu_ops *ops)
 {
-	u64 dte_v2 = dte;
+	return ops->paddr_mask > DMA_BIT_MASK(32);
+}
+
+static inline phys_addr_t rk_dte_pt_address(const struct rk_iommu_ops *ops, u32 dte)
+{
+	if (rk_ops_is_v2(ops)) {
+		u64 dte_v2 = dte;
 
-	dte_v2 = ((dte_v2 & DTE_HI_MASK2) << DTE_HI_SHIFT2) |
-		 ((dte_v2 & DTE_HI_MASK1) << DTE_HI_SHIFT1) |
-		 (dte_v2 & RK_DTE_PT_ADDRESS_MASK);
+		dte_v2 = ((dte_v2 & DTE_HI_MASK2) << DTE_HI_SHIFT2) |
+			 ((dte_v2 & DTE_HI_MASK1) << DTE_HI_SHIFT1) |
+			 (dte_v2 & RK_DTE_PT_ADDRESS_MASK);
 
-	return (phys_addr_t)dte_v2;
+		return (phys_addr_t)dte_v2;
+	}
+
+	return (phys_addr_t)dte & RK_DTE_PT_ADDRESS_MASK;
 }
 
 static inline bool rk_dte_is_pt_valid(u32 dte)
@@ -219,18 +221,17 @@ static inline bool rk_dte_is_pt_valid(u32 dte)
 	return dte & RK_DTE_PT_VALID;
 }
 
-static inline u32 rk_mk_dte(dma_addr_t pt_dma)
+static inline u32 rk_mk_dte(const struct rk_iommu_ops *ops, dma_addr_t pt_dma)
 {
-	return (pt_dma & RK_DTE_PT_ADDRESS_MASK) | RK_DTE_PT_VALID;
-}
+	if (rk_ops_is_v2(ops)) {
+		pt_dma = (pt_dma & RK_DTE_PT_ADDRESS_MASK) |
+			 ((pt_dma & PAGE_DESC_HI_MASK1) >> DTE_HI_SHIFT1) |
+			 (pt_dma & PAGE_DESC_HI_MASK2) >> DTE_HI_SHIFT2;
 
-static inline u32 rk_mk_dte_v2(dma_addr_t pt_dma)
-{
-	pt_dma = (pt_dma & RK_DTE_PT_ADDRESS_MASK) |
-		 ((pt_dma & PAGE_DESC_HI_MASK1) >> DTE_HI_SHIFT1) |
-		 (pt_dma & PAGE_DESC_HI_MASK2) >> DTE_HI_SHIFT2;
+		return (pt_dma & RK_DTE_PT_ADDRESS_MASK_V2) | RK_DTE_PT_VALID;
+	}
 
-	return (pt_dma & RK_DTE_PT_ADDRESS_MASK_V2) | RK_DTE_PT_VALID;
+	return (pt_dma & RK_DTE_PT_ADDRESS_MASK) | RK_DTE_PT_VALID;
 }
 
 /*
@@ -264,16 +265,6 @@ static inline bool rk_pte_is_page_valid(u32 pte)
 	return pte & RK_PTE_PAGE_VALID;
 }
 
-/* TODO: set cache flags per prot IOMMU_CACHE */
-static u32 rk_mk_pte(phys_addr_t page, int prot)
-{
-	u32 flags = 0;
-	flags |= (prot & IOMMU_READ) ? RK_PTE_PAGE_READABLE : 0;
-	flags |= (prot & IOMMU_WRITE) ? RK_PTE_PAGE_WRITABLE : 0;
-	page &= RK_PTE_PAGE_ADDRESS_MASK;
-	return page | flags | RK_PTE_PAGE_VALID;
-}
-
 /*
  * In v2:
  * 31:12 - Page address bit 31:0
@@ -285,14 +276,22 @@ static u32 rk_mk_pte(phys_addr_t page, int prot)
  *     0 - 1 if Page @ Page address is valid
  */
 
-static u32 rk_mk_pte_v2(phys_addr_t page, int prot)
+/* TODO: set cache flags per prot IOMMU_CACHE */
+static u32 rk_mk_pte(const struct rk_iommu_ops *ops, phys_addr_t page, int prot)
 {
 	u32 flags = 0;
 
 	flags |= (prot & IOMMU_READ) ? RK_PTE_PAGE_READABLE : 0;
 	flags |= (prot & IOMMU_WRITE) ? RK_PTE_PAGE_WRITABLE : 0;
 
-	return rk_mk_dte_v2(page) | flags;
+	/*
+	 * v2 encodes the page address exactly like a DTE
+	 */
+	if (rk_ops_is_v2(ops))
+		return rk_mk_dte(ops, page) | flags;
+
+	page &= RK_PTE_PAGE_ADDRESS_MASK;
+	return page | flags | RK_PTE_PAGE_VALID;
 }
 
 static u32 rk_mk_pte_invalid(u32 pte)
@@ -521,7 +520,7 @@ static int rk_iommu_force_reset(struct rk_iommu *iommu)
 	 * and verifying that upper 5 (v1) or 7 (v2) nybbles are read back.
 	 */
 	for (i = 0; i < iommu->num_mmu; i++) {
-		dte_addr = iommu->rk_ops->pt_address(DTE_ADDR_DUMMY);
+		dte_addr = rk_dte_pt_address(iommu->rk_ops, DTE_ADDR_DUMMY);
 		rk_iommu_write(iommu->bases[i], RK_MMU_DTE_ADDR, dte_addr);
 
 		if (dte_addr != rk_iommu_read(iommu->bases[i], RK_MMU_DTE_ADDR)) {
@@ -562,7 +561,7 @@ static void log_iova(struct rk_iommu *iommu, int index, dma_addr_t iova)
 	page_offset = rk_iova_page_offset(iova);
 
 	mmu_dte_addr = rk_iommu_read(base, RK_MMU_DTE_ADDR);
-	mmu_dte_addr_phys = iommu->rk_ops->pt_address(mmu_dte_addr);
+	mmu_dte_addr_phys = rk_dte_pt_address(iommu->rk_ops, mmu_dte_addr);
 
 	dte_addr_phys = mmu_dte_addr_phys + (4 * dte_index);
 	dte_addr = phys_to_virt(dte_addr_phys);
@@ -571,14 +570,14 @@ static void log_iova(struct rk_iommu *iommu, int index, dma_addr_t iova)
 	if (!rk_dte_is_pt_valid(dte))
 		goto print_it;
 
-	pte_addr_phys = iommu->rk_ops->pt_address(dte) + (pte_index * 4);
+	pte_addr_phys = rk_dte_pt_address(iommu->rk_ops, dte) + (pte_index * 4);
 	pte_addr = phys_to_virt(pte_addr_phys);
 	pte = *pte_addr;
 
 	if (!rk_pte_is_page_valid(pte))
 		goto print_it;
 
-	page_addr_phys = iommu->rk_ops->pt_address(pte) + page_offset;
+	page_addr_phys = rk_dte_pt_address(iommu->rk_ops, pte) + page_offset;
 	page_flags = pte & RK_PTE_PAGE_FLAGS_MASK;
 
 print_it:
@@ -674,13 +673,13 @@ static phys_addr_t rk_iommu_iova_to_phys(struct iommu_domain *domain,
 	if (!rk_dte_is_pt_valid(dte))
 		goto out;
 
-	pt_phys = rk_domain->rk_ops->pt_address(dte);
+	pt_phys = rk_dte_pt_address(rk_domain->rk_ops, dte);
 	page_table = (u32 *)phys_to_virt(pt_phys);
 	pte = page_table[rk_iova_pte_index(iova)];
 	if (!rk_pte_is_page_valid(pte))
 		goto out;
 
-	phys = rk_domain->rk_ops->pt_address(pte) + rk_iova_page_offset(iova);
+	phys = rk_dte_pt_address(rk_domain->rk_ops, pte) + rk_iova_page_offset(iova);
 out:
 	spin_unlock_irqrestore(&rk_domain->dt_lock, flags);
 
@@ -753,13 +752,13 @@ static u32 *rk_dte_get_page_table(struct rk_iommu_domain *rk_domain,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	dte = rk_domain->rk_ops->mk_dtentries(pt_dma);
+	dte = rk_mk_dte(rk_domain->rk_ops, pt_dma);
 	*dte_addr = dte;
 
 	rk_table_flush(rk_domain,
 		       rk_domain->dt_dma + dte_index * sizeof(u32), 1);
 done:
-	pt_phys = rk_domain->rk_ops->pt_address(dte);
+	pt_phys = rk_dte_pt_address(rk_domain->rk_ops, dte);
 	return (u32 *)phys_to_virt(pt_phys);
 }
 
@@ -801,7 +800,7 @@ static int rk_iommu_map_iova(struct rk_iommu_domain *rk_domain, u32 *pte_addr,
 		if (rk_pte_is_page_valid(pte))
 			goto unwind;
 
-		pte_addr[pte_count] = rk_domain->rk_ops->mk_ptentries(paddr, prot);
+		pte_addr[pte_count] = rk_mk_pte(rk_domain->rk_ops, paddr, prot);
 
 		paddr += SPAGE_SIZE;
 	}
@@ -823,7 +822,7 @@ static int rk_iommu_map_iova(struct rk_iommu_domain *rk_domain, u32 *pte_addr,
 			    pte_count * SPAGE_SIZE);
 
 	iova += pte_count * SPAGE_SIZE;
-	page_phys = rk_domain->rk_ops->pt_address(pte_addr[pte_count]);
+	page_phys = rk_dte_pt_address(rk_domain->rk_ops, pte_addr[pte_count]);
 	pr_err("iova: %pad already mapped to %pa cannot remap to phys: %pa prot: %#x\n",
 	       &iova, &page_phys, &paddr, prot);
 
@@ -860,7 +859,7 @@ static int rk_iommu_map(struct iommu_domain *domain, unsigned long _iova,
 	pte_index = rk_iova_pte_index(iova);
 	pte_addr = &page_table[pte_index];
 
-	pte_dma = rk_domain->rk_ops->pt_address(dte_index) + pte_index * sizeof(u32);
+	pte_dma = rk_dte_pt_address(rk_domain->rk_ops, dte_index) + pte_index * sizeof(u32);
 	ret = rk_iommu_map_iova(rk_domain, pte_addr, pte_dma, iova,
 				paddr, size, prot);
 
@@ -898,7 +897,7 @@ static size_t rk_iommu_unmap(struct iommu_domain *domain, unsigned long _iova,
 		return 0;
 	}
 
-	pt_phys = rk_domain->rk_ops->pt_address(dte);
+	pt_phys = rk_dte_pt_address(rk_domain->rk_ops, dte);
 	pte_addr = (u32 *)phys_to_virt(pt_phys) + rk_iova_pte_index(iova);
 	pte_dma = pt_phys + rk_iova_pte_index(iova) * sizeof(u32);
 	unmap_size = rk_iommu_unmap_iova(rk_domain, pte_addr, pte_dma, size);
@@ -957,7 +956,7 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
 
 	for (i = 0; i < iommu->num_mmu; i++) {
 		rk_iommu_write(iommu->bases[i], RK_MMU_DTE_ADDR,
-			       iommu->rk_ops->mk_dtentries(rk_domain->dt_dma));
+			       rk_mk_dte(iommu->rk_ops, rk_domain->dt_dma));
 		rk_iommu_base_command(iommu->bases[i], RK_MMU_CMD_ZAP_CACHE);
 		rk_iommu_write(iommu->bases[i], RK_MMU_INT_MASK, RK_MMU_IRQ_MASK);
 
@@ -1139,7 +1138,7 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
 	for (i = 0; i < NUM_DT_ENTRIES; i++) {
 		u32 dte = rk_domain->dt[i];
 		if (rk_dte_is_pt_valid(dte)) {
-			phys_addr_t pt_phys = rk_domain->rk_ops->pt_address(dte);
+			phys_addr_t pt_phys = rk_dte_pt_address(rk_domain->rk_ops, dte);
 			u32 *page_table = phys_to_virt(pt_phys);
 			dma_unmap_single(rk_domain->dma_dev, pt_phys,
 					 SPAGE_SIZE, DMA_TO_DEVICE);
@@ -1356,17 +1355,13 @@ static const struct dev_pm_ops rk_iommu_pm_ops = {
 };
 
 static struct rk_iommu_ops iommu_data_ops_v1 = {
-	.pt_address = &rk_dte_pt_address,
-	.mk_dtentries = &rk_mk_dte,
-	.mk_ptentries = &rk_mk_pte,
+	.paddr_mask = DMA_BIT_MASK(32),
 	.dma_bit_mask = DMA_BIT_MASK(32),
 	.gfp_flags = GFP_DMA32,
 };
 
 static struct rk_iommu_ops iommu_data_ops_v2 = {
-	.pt_address = &rk_dte_pt_address_v2,
-	.mk_dtentries = &rk_mk_dte_v2,
-	.mk_ptentries = &rk_mk_pte_v2,
+	.paddr_mask = DMA_BIT_MASK(40),
 	.dma_bit_mask = DMA_BIT_MASK(40),
 	.gfp_flags = 0,
 };
-- 
2.34.1


