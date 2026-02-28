Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B641FEE4C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 07:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GY7w9lG2hNjdddPK/8x1giPete9XsAMvnf7gDXNDb+Y=; b=LXI0vsqhhlXd3lOOoMtgPnDxGz
	4HZuOuwvBHB2m93DBXX8D8dD9eFOGa5/JRaxypWjHGxnPjGiNj+bFkbFjBFcItPQ/0Pxp7LfGPszv
	bcI0pZe666cq5YBicBvX6U6uvi2Ewi6JB78ykk5cX3n7oil4Ju94HSi1dDUGepamBLGzLjBNfwK6m
	oZv0aPTHpGeJnWPPmdUYYuCWIOFBPSV14sAOawsiWGZ6ZW+mxftTXG9+zFv+koSokdWXUIwjHjY/Q
	H/MoYAUNejwqdtYaq5XZ3+tHQ+tVhjQZUDx5MJFBltifZ3KxH8BDQ/7PSvAuk5/qKtWt7/GQfiPOo
	hGCbpLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEYF-00000009b7n-0Xv2;
	Sat, 28 Feb 2026 07:15:52 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwEY3-00000009b2l-2Ksy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 07:15:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GY7w9lG2hNjdddPK/8x1giPete9XsAMvnf7gDXNDb+Y=;
	b=F2yxSYtM126iXPXdt97LlTD02LO7RRIbC7ASktZs819acq4FuUmUfnDGPoEXJ5gfBqoq++I+U
	VDjuSx7eYE2bDrwHfE4kyrEq0bo0V6N7u9JZnmeORNH0RStBvhdzxjA5ALyY5zk4khG4RjBYism
	OW4U8djntX5MznrWT8xvruQ=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fNGYM6X91zcb1Z;
	Sat, 28 Feb 2026 15:10:15 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 041724056E;
	Sat, 28 Feb 2026 15:15:22 +0800 (CST)
Received: from huawei.com (10.50.87.63) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Feb
 2026 15:15:20 +0800
From: Yin Tirui <yintirui@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <willy@infradead.org>,
	<david@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <luto@kernel.org>,
	<peterz@infradead.org>, <akpm@linux-foundation.org>,
	<lorenzo.stoakes@oracle.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <Liam.Howlett@oracle.com>,
	<npache@redhat.com>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
	<baohua@kernel.org>, <lance.yang@linux.dev>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<anshuman.khandual@arm.com>, <rmclure@linux.ibm.com>,
	<kevin.brodsky@arm.com>, <apopple@nvidia.com>, <ajd@linux.ibm.com>,
	<pasha.tatashin@soleen.com>, <bhe@redhat.com>, <thuth@redhat.com>,
	<coxu@redhat.com>, <dan.j.williams@intel.com>, <yu-cheng.yu@intel.com>,
	<yangyicong@hisilicon.com>, <baolu.lu@linux.intel.com>, <jgross@suse.com>,
	<conor.dooley@microchip.com>, <Jonathan.Cameron@huawei.com>,
	<riel@surriel.com>
CC: <wangkefeng.wang@huawei.com>, <chenjun102@huawei.com>,
	<yintirui@huawei.com>
Subject: [PATCH RFC v3 4/4] mm: add PMD-level huge page support for remap_pfn_range()
Date: Sat, 28 Feb 2026 15:09:06 +0800
Message-ID: <20260228070906.1418911-5-yintirui@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228070906.1418911-1-yintirui@huawei.com>
References: <20260228070906.1418911-1-yintirui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.63]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_231536_232288_17B54E2A 
X-CRM114-Status: GOOD (  14.16  )
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

Add PMD-level huge page support to remap_pfn_range(), automatically
creating huge mappings when prerequisites are satisfied (size, alignment,
architecture support, etc.) and falling back to normal page mappings
otherwise.

Implement special huge PMD splitting by utilizing the pgtable deposit/
withdraw mechanism. When splitting is needed, the deposited pgtable is
withdrawn and populated with individual PTEs created from the original
huge mapping.

Signed-off-by: Yin Tirui <yintirui@huawei.com>
---
 mm/huge_memory.c | 36 ++++++++++++++++++++++++++++++++++--
 mm/memory.c      | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index d4ca8cfd7f9d..e463d51005ee 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1857,6 +1857,9 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	pmd = pmdp_get_lockless(src_pmd);
 	if (unlikely(pmd_present(pmd) && pmd_special(pmd) &&
 		     !is_huge_zero_pmd(pmd))) {
+		pgtable = pte_alloc_one(dst_mm);
+		if (unlikely(!pgtable))
+			goto out;
 		dst_ptl = pmd_lock(dst_mm, dst_pmd);
 		src_ptl = pmd_lockptr(src_mm, src_pmd);
 		spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
@@ -1870,6 +1873,12 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		 * able to wrongly write to the backend MMIO.
 		 */
 		VM_WARN_ON_ONCE(is_cow_mapping(src_vma->vm_flags) && pmd_write(pmd));
+
+		/* dax won't reach here, it will be intercepted at vma_needs_copy() */
+		VM_WARN_ON_ONCE(vma_is_dax(src_vma));
+
+		mm_inc_nr_ptes(dst_mm);
+		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
 		goto set_pmd;
 	}
 
@@ -2360,6 +2369,8 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	arch_check_zapped_pmd(vma, orig_pmd);
 	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
 	if (!vma_is_dax(vma) && vma_is_special_huge(vma)) {
+		if (pmd_special(orig_pmd))
+			zap_deposited_table(tlb->mm, pmd);
 		if (arch_needs_pgtable_deposit())
 			zap_deposited_table(tlb->mm, pmd);
 		spin_unlock(ptl);
@@ -3005,14 +3016,35 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 	if (!vma_is_anonymous(vma)) {
 		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
+
+		if (!vma_is_dax(vma) && vma_is_special_huge(vma)) {
+			pte_t entry;
+
+			if (!pmd_special(old_pmd)) {
+				zap_deposited_table(mm, pmd);
+				return;
+			}
+			pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+			if (unlikely(!pgtable))
+				return;
+			pmd_populate(mm, &_pmd, pgtable);
+			pte = pte_offset_map(&_pmd, haddr);
+			entry = pfn_pte(pmd_pfn(old_pmd), pmd_pgprot(old_pmd));
+			set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
+			pte_unmap(pte);
+
+			smp_wmb(); /* make pte visible before pmd */
+			pmd_populate(mm, pmd, pgtable);
+			return;
+		}
+
 		/*
 		 * We are going to unmap this huge page. So
 		 * just go ahead and zap it
 		 */
 		if (arch_needs_pgtable_deposit())
 			zap_deposited_table(mm, pmd);
-		if (!vma_is_dax(vma) && vma_is_special_huge(vma))
-			return;
+
 		if (unlikely(pmd_is_migration_entry(old_pmd))) {
 			const softleaf_t old_entry = softleaf_from_pmd(old_pmd);
 
diff --git a/mm/memory.c b/mm/memory.c
index 07778814b4a8..affccf38cbcf 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2890,6 +2890,40 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
 	return err;
 }
 
+#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
+static int remap_try_huge_pmd(struct mm_struct *mm, pmd_t *pmd,
+			unsigned long addr, unsigned long end,
+			unsigned long pfn, pgprot_t prot)
+{
+	pgtable_t pgtable;
+	spinlock_t *ptl;
+
+	if ((end - addr) != PMD_SIZE)
+		return 0;
+
+	if (!IS_ALIGNED(addr, PMD_SIZE))
+		return 0;
+
+	if (!IS_ALIGNED(pfn, HPAGE_PMD_NR))
+		return 0;
+
+	if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
+		return 0;
+
+	pgtable = pte_alloc_one(mm);
+	if (unlikely(!pgtable))
+		return 0;
+
+	mm_inc_nr_ptes(mm);
+	ptl = pmd_lock(mm, pmd);
+	set_pmd_at(mm, addr, pmd, pmd_mkspecial(pmd_mkhuge(pfn_pmd(pfn, prot))));
+	pgtable_trans_huge_deposit(mm, pmd, pgtable);
+	spin_unlock(ptl);
+
+	return 1;
+}
+#endif
+
 static inline int remap_pmd_range(struct mm_struct *mm, pud_t *pud,
 			unsigned long addr, unsigned long end,
 			unsigned long pfn, pgprot_t prot)
@@ -2905,6 +2939,12 @@ static inline int remap_pmd_range(struct mm_struct *mm, pud_t *pud,
 	VM_BUG_ON(pmd_trans_huge(*pmd));
 	do {
 		next = pmd_addr_end(addr, end);
+#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
+		if (remap_try_huge_pmd(mm, pmd, addr, next,
+				pfn + (addr >> PAGE_SHIFT), prot)) {
+			continue;
+		}
+#endif
 		err = remap_pte_range(mm, pmd, addr, next,
 				pfn + (addr >> PAGE_SHIFT), prot);
 		if (err)
-- 
2.22.0


