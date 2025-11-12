Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90435CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 01:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xXceKPMp8UFg2aPwvJeptDALB/4lrD/age8qUK3AD0=; b=aUGgJMt+62LMMFLOBsH6SRkdlU
	P4T0tYhY2sP80+z9Y2rCIp2JPOBnVWDLust3NMgOYI0b1R/3a4G0XkNkuxCq+RloIgyw+BTQNfNL6
	swaANM/BvLJU//NsTECHQL9SP/MruZDKLd/GIml1yERnHX9z9CXiAeQ/iUrLUpRdN6uFp4Cb3Qodc
	Jr1nP4Isl32UQ3Q4xCtadq7gwoXU0B1/hBaGnU2vU2oCjlJI5TG7lSFnWIQBCmRLcgT41ZUXot+qM
	XjhSZHlp7HlqFqrIuhydHfW3R+Uv3p0y0SXyPVBl1h9SV0bHz78nr+CYtyzE494zXo9OK4w7vAUOL
	OafQLLuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIzp6-00000007y4C-3CTe;
	Wed, 12 Nov 2025 01:39:00 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIzoy-00000007y0V-2lmn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 01:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762911527; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=/xXceKPMp8UFg2aPwvJeptDALB/4lrD/age8qUK3AD0=;
	b=tMDXmwB4sKQYZqo3MiqzBn6qOuQE5KAqwu6HHK2eWhKcq9Su0Qm8t08VcHVg2u5YhdmVblmq1hGbAMojvcjsjTmJLrbvFy54NcejF2osMGoeVpA5Wtl/exSq5t/zbU/E2SU1M+ANhP+zZAaNfcDCjU6DxurDJQR/kUczXOzB41Y=
Received: from localhost.localdomain(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WsEIP2t_1762911525 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 12 Nov 2025 09:38:45 +0800
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
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Yin Fengwei <fengwei_yin@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH -v5 1/2] mm: add spurious fault fixing support for huge pmd
Date: Wed, 12 Nov 2025 09:38:21 +0800
Message-Id: <20251112013822.54334-2-ying.huang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251112013822.54334-1-ying.huang@linux.alibaba.com>
References: <20251112013822.54334-1-ying.huang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_173853_443912_011C3BE9 
X-CRM114-Status: GOOD (  28.17  )
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

The page faults may be spurious because of the racy access to the page
table.  For example, a non-populated virtual page is accessed on 2
CPUs simultaneously, thus the page faults are triggered on both CPUs.
However, it's possible that one CPU (say CPU A) cannot find the reason
for the page fault if the other CPU (say CPU B) has changed the page
table before the PTE is checked on CPU A.  Most of the time, the
spurious page faults can be ignored safely.  However, if the page
fault is for the write access, it's possible that a stale read-only
TLB entry exists in the local CPU and needs to be flushed on some
architectures.  This is called the spurious page fault fixing.

In the current kernel, there is spurious fault fixing support for pte,
but not for huge pmd because no architectures need it. But in the
next patch in the series, we will change the write protection fault
handling logic on arm64, so that some stale huge pmd entries may
remain in the TLB. These entries need to be flushed via the huge pmd
spurious fault fixing mechanism.

Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: David Hildenbrand <david@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Yin Fengwei <fengwei_yin@linux.alibaba.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
---
 include/linux/huge_mm.h |  2 +-
 include/linux/pgtable.h |  4 +++
 mm/huge_memory.c        | 33 ++++++++++++++--------
 mm/internal.h           |  2 +-
 mm/memory.c             | 62 ++++++++++++++++++++++++++++++-----------
 5 files changed, 73 insertions(+), 30 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index f327d62fc985..887a632ce7a0 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -11,7 +11,7 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf);
 int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
 		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma);
-void huge_pmd_set_accessed(struct vm_fault *vmf);
+bool huge_pmd_set_accessed(struct vm_fault *vmf);
 int copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
 		  struct vm_area_struct *vma);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 32e8457ad535..ee3148ef87f6 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1232,6 +1232,10 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
 #define flush_tlb_fix_spurious_fault(vma, address, ptep) flush_tlb_page(vma, address)
 #endif
 
+#ifndef flush_tlb_fix_spurious_fault_pmd
+#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp) do { } while (0)
+#endif
+
 /*
  * When walking page tables, get the address of the next boundary,
  * or the end address of the range if that comes earlier.  Although no
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1d1b74950332..c7aeb639d063 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1641,17 +1641,30 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
 EXPORT_SYMBOL_GPL(vmf_insert_folio_pud);
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
-void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+/**
+ * touch_pmd - Mark page table pmd entry as accessed and dirty (for write)
+ * @vma: The VMA covering @addr
+ * @addr: The virtual address
+ * @pmd: pmd pointer into the page table mapping @addr
+ * @write: Whether it's a write access
+ *
+ * Return: whether the pmd entry is changed
+ */
+bool touch_pmd(struct vm_area_struct *vma, unsigned long addr,
 	       pmd_t *pmd, bool write)
 {
-	pmd_t _pmd;
+	pmd_t entry;
 
-	_pmd = pmd_mkyoung(*pmd);
+	entry = pmd_mkyoung(*pmd);
 	if (write)
-		_pmd = pmd_mkdirty(_pmd);
+		entry = pmd_mkdirty(entry);
 	if (pmdp_set_access_flags(vma, addr & HPAGE_PMD_MASK,
-				  pmd, _pmd, write))
+				  pmd, entry, write)) {
 		update_mmu_cache_pmd(vma, addr, pmd);
+		return true;
+	}
+
+	return false;
 }
 
 int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
@@ -1841,18 +1854,14 @@ void huge_pud_set_accessed(struct vm_fault *vmf, pud_t orig_pud)
 }
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
-void huge_pmd_set_accessed(struct vm_fault *vmf)
+bool huge_pmd_set_accessed(struct vm_fault *vmf)
 {
 	bool write = vmf->flags & FAULT_FLAG_WRITE;
 
-	vmf->ptl = pmd_lock(vmf->vma->vm_mm, vmf->pmd);
 	if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd)))
-		goto unlock;
-
-	touch_pmd(vmf->vma, vmf->address, vmf->pmd, write);
+		return false;
 
-unlock:
-	spin_unlock(vmf->ptl);
+	return touch_pmd(vmf->vma, vmf->address, vmf->pmd, write);
 }
 
 static vm_fault_t do_huge_zero_wp_pmd(struct vm_fault *vmf)
diff --git a/mm/internal.h b/mm/internal.h
index 1561fc2ff5b8..27ad37a41868 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1402,7 +1402,7 @@ int __must_check try_grab_folio(struct folio *folio, int refs,
  */
 void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 	       pud_t *pud, bool write);
-void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+bool touch_pmd(struct vm_area_struct *vma, unsigned long addr,
 	       pmd_t *pmd, bool write);
 
 /*
diff --git a/mm/memory.c b/mm/memory.c
index 74b45e258323..6e5a08c4fd2e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6115,6 +6115,45 @@ static vm_fault_t wp_huge_pud(struct vm_fault *vmf, pud_t orig_pud)
 	return VM_FAULT_FALLBACK;
 }
 
+/*
+ * The page faults may be spurious because of the racy access to the
+ * page table.  For example, a non-populated virtual page is accessed
+ * on 2 CPUs simultaneously, thus the page faults are triggered on
+ * both CPUs.  However, it's possible that one CPU (say CPU A) cannot
+ * find the reason for the page fault if the other CPU (say CPU B) has
+ * changed the page table before the PTE is checked on CPU A.  Most of
+ * the time, the spurious page faults can be ignored safely.  However,
+ * if the page fault is for the write access, it's possible that a
+ * stale read-only TLB entry exists in the local CPU and needs to be
+ * flushed on some architectures.  This is called the spurious page
+ * fault fixing.
+ *
+ * Note: flush_tlb_fix_spurious_fault() is defined as flush_tlb_page()
+ * by default and used as such on most architectures, while
+ * flush_tlb_fix_spurious_fault_pmd() is defined as NOP by default and
+ * used as such on most architectures.
+ */
+static void fix_spurious_fault(struct vm_fault *vmf,
+			       enum pgtable_level ptlevel)
+{
+	/* Skip spurious TLB flush for retried page fault */
+	if (vmf->flags & FAULT_FLAG_TRIED)
+		return;
+	/*
+	 * This is needed only for protection faults but the arch code
+	 * is not yet telling us if this is a protection fault or not.
+	 * This still avoids useless tlb flushes for .text page faults
+	 * with threads.
+	 */
+	if (vmf->flags & FAULT_FLAG_WRITE) {
+		if (ptlevel == PGTABLE_LEVEL_PTE)
+			flush_tlb_fix_spurious_fault(vmf->vma, vmf->address,
+						     vmf->pte);
+		else
+			flush_tlb_fix_spurious_fault_pmd(vmf->vma, vmf->address,
+							 vmf->pmd);
+	}
+}
 /*
  * These routines also need to handle stuff like marking pages dirty
  * and/or accessed for architectures that don't do it in hardware (most
@@ -6196,23 +6235,11 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 	}
 	entry = pte_mkyoung(entry);
 	if (ptep_set_access_flags(vmf->vma, vmf->address, vmf->pte, entry,
-				vmf->flags & FAULT_FLAG_WRITE)) {
+				vmf->flags & FAULT_FLAG_WRITE))
 		update_mmu_cache_range(vmf, vmf->vma, vmf->address,
 				vmf->pte, 1);
-	} else {
-		/* Skip spurious TLB flush for retried page fault */
-		if (vmf->flags & FAULT_FLAG_TRIED)
-			goto unlock;
-		/*
-		 * This is needed only for protection faults but the arch code
-		 * is not yet telling us if this is a protection fault or not.
-		 * This still avoids useless tlb flushes for .text page faults
-		 * with threads.
-		 */
-		if (vmf->flags & FAULT_FLAG_WRITE)
-			flush_tlb_fix_spurious_fault(vmf->vma, vmf->address,
-						     vmf->pte);
-	}
+	else
+		fix_spurious_fault(vmf, PGTABLE_LEVEL_PTE);
 unlock:
 	pte_unmap_unlock(vmf->pte, vmf->ptl);
 	return 0;
@@ -6309,7 +6336,10 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 				if (!(ret & VM_FAULT_FALLBACK))
 					return ret;
 			} else {
-				huge_pmd_set_accessed(&vmf);
+				vmf.ptl = pmd_lock(mm, vmf.pmd);
+				if (!huge_pmd_set_accessed(&vmf))
+					fix_spurious_fault(&vmf, PGTABLE_LEVEL_PMD);
+				spin_unlock(vmf.ptl);
 				return 0;
 			}
 		}
-- 
2.39.5


