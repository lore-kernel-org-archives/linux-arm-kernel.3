Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C588C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjv22v1xGTt25bs3TKcd3H88s+e1Tagn0TixvBFl8wM=; b=Aln3ewqb+9953zVxH/AC4fAOlx
	kV/O1aewd9Ylz692caWdCGSQtT+6POalPyX+6RFnUoswD5gdfr2LvWSGKJbw/x0ZPudHAeX4if4NT
	MzQNyols2lmPItlIACW0LgEoORmXNofnkyAPSHEinTJyCI99FQeetrCyrfBIBOdz7qQTTRFykHlr9
	wHVZ+Eu5gd+A2dQ7FsP02irx7JEGQfIoktVo+EjrDCksS22lqZLRJrwp5X6JpX6XBmytA5cj5hn0R
	fnO5Vhu14+2rwB8lVTm9xjAwKDC0DRImeWKXSh9cPCNeeehkdqV3+6DGc9QT4BrIkUQOJ5U+3g3mA
	uj6MZ+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NgK-00000006Csy-2Arn;
	Mon, 28 Apr 2025 12:33:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NEI-000000065mO-2aHR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:05:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B16941762;
	Mon, 28 Apr 2025 05:04:51 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.78.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 939A63F7BD;
	Mon, 28 Apr 2025 05:04:48 -0700 (PDT)
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
Subject: [PATCH 2/7] mm: Optimize mprotect() by batch-skipping PTEs
Date: Mon, 28 Apr 2025 17:34:09 +0530
Message-Id: <20250428120414.12101-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250428120414.12101-1-dev.jain@arm.com>
References: <20250428120414.12101-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_050458_737935_B90D8FD0 
X-CRM114-Status: GOOD (  11.32  )
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

In case of prot_numa, there are various cases in which we can skip to the
next iteration. Since the skip condition is based on the folio and not
the PTEs, we can skip a PTE batch.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mprotect.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 8d635c7fc81f..33eabc995584 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -91,6 +91,9 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
 	bool toptier;
 	int nid;
 
+	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
+		return true;
+
 	/* Also skip shared copy-on-write pages */
 	if (is_cow_mapping(vma->vm_flags) &&
 	    (folio_maybe_dma_pinned(folio) ||
@@ -126,8 +129,10 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
 }
 
 static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
-		unsigned long addr, pte_t oldpte, int target_node)
+		unsigned long addr, pte_t *pte, pte_t oldpte, int target_node,
+		int max_nr, int *nr)
 {
+	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	struct folio *folio;
 	int ret;
 
@@ -136,12 +141,16 @@ static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
 		return true;
 
 	folio = vm_normal_folio(vma, addr, oldpte);
-	if (!folio || folio_is_zone_device(folio) ||
-	    folio_test_ksm(folio))
+	if (!folio)
 		return true;
+
 	ret = prot_numa_skip(vma, folio, target_node);
-	if (ret)
+	if (ret) {
+		if (folio_test_large(folio) && max_nr != 1)
+			*nr = folio_pte_batch(folio, addr, pte, oldpte,
+					      max_nr, flags, NULL, NULL, NULL);
 		return ret;
+	}
 	if (folio_use_access_time(folio))
 		folio_xchg_access_time(folio,
 			jiffies_to_msecs(jiffies));
@@ -159,6 +168,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
 	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
 	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
+	int nr;
 
 	tlb_change_page_size(tlb, PAGE_SIZE);
 	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
@@ -173,8 +183,10 @@ static long change_pte_range(struct mmu_gather *tlb,
 	flush_tlb_batched_pending(vma->vm_mm);
 	arch_enter_lazy_mmu_mode();
 	do {
+		nr = 1;
 		oldpte = ptep_get(pte);
 		if (pte_present(oldpte)) {
+			int max_nr = (end - addr) >> PAGE_SHIFT;
 			pte_t ptent;
 
 			/*
@@ -182,8 +194,9 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 * pages. See similar comment in change_huge_pmd.
 			 */
 			if (prot_numa &&
-			    prot_numa_avoid_fault(vma, addr,
-						  oldpte, target_node))
+			    prot_numa_avoid_fault(vma, addr, pte,
+						  oldpte, target_node,
+							  max_nr, &nr))
 					continue;
 
 			oldpte = ptep_modify_prot_start(vma, addr, pte);
@@ -300,7 +313,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 				pages++;
 			}
 		}
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+	} while (pte += nr, addr += nr * PAGE_SIZE, addr != end);
 	arch_leave_lazy_mmu_mode();
 	pte_unmap_unlock(pte - 1, ptl);
 
-- 
2.30.2


