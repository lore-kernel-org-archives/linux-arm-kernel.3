Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5F0CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 03:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EltDD6XaVHb4ywefi6tfTUXJyF6xjUHuaP+jJuKR6OU=; b=XWXhxRW00LO8PskYEOIwueauNd
	3NFrPd3H0dfqkMOWXZf7+ypFVjQ6Zs567fNhu8x9d3gEOPn/u+eloLenlKLTBR5ezmoKaPpRrI70/
	F9CTBMf80b9ZA+TTjJH1nf6eggIT/IZ6tY43CgCmHSVKyLV7oNtlGqe6GjOeDGH3o1s7s9wmyFXj8
	bdqLUHB2UnTUOXiFPvKAW9rurT+w5R/3zIbTIcx8vg2cLVBA4vbVrTbEdy845qqhjm9khm+goQs9E
	13DiODJ+cCJPPK/ypvkwXAdTX3LljtVlMQxw4Ct21F3DfzRRrackyMq7+nvZMdKlUt3+wzjUfparw
	ixnaEEcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxzvA-00000002flv-0pos;
	Mon, 15 Sep 2025 03:30:28 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxzv3-00000002fis-0Jo7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 03:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757907015; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=EltDD6XaVHb4ywefi6tfTUXJyF6xjUHuaP+jJuKR6OU=;
	b=FVLTOjrJFABFdizVlxbn8PKNiLtOx78GUqPS8BabpPDUARSC8qNyoBsmqCNJlcQqVBt6OdQsZK40FE0u/n/3DgREyoclwpmfNnom/lRiQ93+Tb3zzxCv4jDPaT+1a6UuhwuLYUtUlYiy8sj0WFoiq4X9XHGsSY2SDr9KxplEj2w=
Received: from localhost.localdomain(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wnx2CMR_1757907013 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 15 Sep 2025 11:30:14 +0800
From: Huang Ying <ying.huang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>
Cc: Huang Ying <ying.huang@linux.alibaba.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yin Fengwei <fengwei_yin@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 1/2] mm: add spurious fault fixing support for huge pmd
Date: Mon, 15 Sep 2025 11:29:45 +0800
Message-Id: <20250915032946.33203-2-ying.huang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250915032946.33203-1-ying.huang@linux.alibaba.com>
References: <20250915032946.33203-1-ying.huang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_203021_747855_4DDAB2AA 
X-CRM114-Status: GOOD (  20.31  )
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

In the current kernel, there is spurious fault fixing support for pte,
but not for huge pmd because no architectures need it. But in the
next patch in the series, we will change the write protection fault
handling logic on arm64, so that some stale huge pmd entries may
remain in the TLB. These entries need to be flushed via the huge pmd
spurious fault fixing mechanism.

Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yicong Yang <yangyicong@hisilicon.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Yin Fengwei <fengwei_yin@linux.alibaba.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
---
 include/linux/pgtable.h |  4 ++++
 mm/huge_memory.c        | 25 +++++++++++++++++++++----
 mm/internal.h           |  4 ++--
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2b80fd456c8b..d7604ad34d36 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1232,6 +1232,10 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
 #define flush_tlb_fix_spurious_fault(vma, address, ptep) flush_tlb_page(vma, address)
 #endif
 
+#ifndef flush_tlb_fix_spurious_fault_pmd
+#define flush_tlb_fix_spurious_fault_pmd(vma, address, ptep) do { } while (0)
+#endif
+
 /*
  * When walking page tables, get the address of the next boundary,
  * or the end address of the range if that comes earlier.  Although no
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 9c38a95e9f09..0e2ef6b007c2 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1650,8 +1650,8 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
 EXPORT_SYMBOL_GPL(vmf_insert_folio_pud);
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
-void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
-	       pmd_t *pmd, bool write)
+int touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	      pmd_t *pmd, bool write)
 {
 	pmd_t _pmd;
 
@@ -1659,8 +1659,12 @@ void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
 	if (write)
 		_pmd = pmd_mkdirty(_pmd);
 	if (pmdp_set_access_flags(vma, addr & HPAGE_PMD_MASK,
-				  pmd, _pmd, write))
+				  pmd, _pmd, write)) {
 		update_mmu_cache_pmd(vma, addr, pmd);
+		return 1;
+	}
+
+	return 0;
 }
 
 int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
@@ -1857,7 +1861,20 @@ void huge_pmd_set_accessed(struct vm_fault *vmf)
 	if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd)))
 		goto unlock;
 
-	touch_pmd(vmf->vma, vmf->address, vmf->pmd, write);
+	if (!touch_pmd(vmf->vma, vmf->address, vmf->pmd, write)) {
+		/* Skip spurious TLB flush for retried page fault */
+		if (vmf->flags & FAULT_FLAG_TRIED)
+			goto unlock;
+		/*
+		 * This is needed only for protection faults but the arch code
+		 * is not yet telling us if this is a protection fault or not.
+		 * This still avoids useless tlb flushes for .text page faults
+		 * with threads.
+		 */
+		if (vmf->flags & FAULT_FLAG_WRITE)
+			flush_tlb_fix_spurious_fault_pmd(vmf->vma, vmf->address,
+							 vmf->pmd);
+	}
 
 unlock:
 	spin_unlock(vmf->ptl);
diff --git a/mm/internal.h b/mm/internal.h
index 45b725c3dc03..743ce97c7248 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1406,8 +1406,8 @@ int __must_check try_grab_folio(struct folio *folio, int refs,
  */
 void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 	       pud_t *pud, bool write);
-void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
-	       pmd_t *pmd, bool write);
+int touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	      pmd_t *pmd, bool write);
 
 /*
  * Parses a string with mem suffixes into its order. Useful to parse kernel
-- 
2.39.5


