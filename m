Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9603C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmTMNOeQjXDCVChUubdNwDHcMziBJ9gNz+o9RD2bflg=; b=vwv0faKy6k3q1X4hmWEiLVqczn
	kcmH8tS73eHyvheTwZVjVFRauXGsAGrcGeQCjdXB253HnV7SNHarkMVQ1sXcrwyL6UOHPnt0gl9yB
	lEXItCtmLO0eCuZ0h2mCDVmowQp+Ycn0YTF/E6Y2RNKW1tRzIPsw7Yb9YrcuXm2jOgCsHYJax5PCA
	jG3GDy/RlOf0gEs1JnH81fVPGSmSvY+3mwMck8KI1YsrNzpwWAjp02C2hAjzHnb4O8vjaQCo+AB7i
	f/aGWvUdQkprW9xUSdprLoCNN2HC16Z3deMy/9JisaHf6pkcVPY4oYQVmT8LURXkr7sh533ktjLTP
	J5Os4+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NkC-00000006Dbv-410G;
	Mon, 28 Apr 2025 12:37:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NEe-000000065vP-1O95
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:05:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C4D122C7;
	Mon, 28 Apr 2025 05:05:13 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.78.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 73D993F66E;
	Mon, 28 Apr 2025 05:05:09 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	anshuman.khandual@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	ioworker0@gmail.com,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	namit@vmware.com,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 4/7] arm64: Add batched version of ptep_modify_prot_start
Date: Mon, 28 Apr 2025 17:34:11 +0530
Message-Id: <20250428120414.12101-5-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250428120414.12101-1-dev.jain@arm.com>
References: <20250428120414.12101-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_050520_464960_A9A47932 
X-CRM114-Status: GOOD (  11.53  )
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

Override the generic definition to use get_and_clear_full_ptes(), so that
we do a TLBI possibly only on the "contpte-edges" of the large PTE block,
instead of doing it for every contpte block, which happens for ptep_get_and_clear().

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/pgtable.h |  5 +++++
 arch/arm64/mm/mmu.c              | 12 +++++++++---
 include/linux/pgtable.h          |  4 ++++
 mm/pgtable-generic.c             | 16 +++++++++++-----
 4 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 2a77f11b78d5..8872ea5f0642 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1553,6 +1553,11 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
 				    unsigned long addr, pte_t *ptep,
 				    pte_t old_pte, pte_t new_pte);
 
+#define modify_prot_start_ptes modify_prot_start_ptes
+extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
+				    unsigned long addr, pte_t *ptep,
+				    unsigned int nr);
+
 #ifdef CONFIG_ARM64_CONTPTE
 
 /*
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8fcf59ba39db..fe60be8774f4 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1523,7 +1523,8 @@ static int __init prevent_bootmem_remove_init(void)
 early_initcall(prevent_bootmem_remove_init);
 #endif
 
-pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
+pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t *ptep, unsigned int nr)
 {
 	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
 		/*
@@ -1532,9 +1533,14 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
 		 * in cases where cpu is affected with errata #2645198.
 		 */
 		if (pte_user_exec(ptep_get(ptep)))
-			return ptep_clear_flush(vma, addr, ptep);
+			return clear_flush_ptes(vma, addr, ptep, nr);
 	}
-	return ptep_get_and_clear(vma->vm_mm, addr, ptep);
+	return get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);
+}
+
+pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
+{
+	return modify_prot_start_ptes(vma, addr, ptep, 1);
 }
 
 void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index ed287289335f..10cdb87ccecf 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -828,6 +828,10 @@ extern pte_t ptep_clear_flush(struct vm_area_struct *vma,
 			      pte_t *ptep);
 #endif
 
+extern pte_t clear_flush_ptes(struct vm_area_struct *vma,
+			      unsigned long address,
+			      pte_t *ptep, unsigned int nr);
+
 #ifndef __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
 extern pmd_t pmdp_huge_clear_flush(struct vm_area_struct *vma,
 			      unsigned long address,
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 5a882f2b10f9..e238f88c3cac 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -90,17 +90,23 @@ int ptep_clear_flush_young(struct vm_area_struct *vma,
 }
 #endif
 
-#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
-pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
-		       pte_t *ptep)
+pte_t clear_flush_ptes(struct vm_area_struct *vma, unsigned long address,
+		       pte_t *ptep, unsigned int nr)
 {
 	struct mm_struct *mm = (vma)->vm_mm;
 	pte_t pte;
-	pte = ptep_get_and_clear(mm, address, ptep);
+	pte = get_and_clear_full_ptes(mm, address, ptep, nr, 0);
 	if (pte_accessible(mm, pte))
-		flush_tlb_page(vma, address);
+		flush_tlb_range(vma, address, address + nr * PAGE_SIZE);
 	return pte;
 }
+
+#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
+pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
+		       pte_t *ptep)
+{
+	return clear_flush_ptes(vma, address, ptep, 1);
+}
 #endif
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-- 
2.30.2


