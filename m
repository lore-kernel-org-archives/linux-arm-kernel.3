Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1048C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 09:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ge5yNcYoGO8Q8M1beansVs9YraJQPdsSzpie8QIQsEM=; b=pStSOgDR3rNAgWT4/P3+AcPXTA
	evln6O3WfUqfTVoVSyWUl5RaGvucDIL3008ktnMCnUP3eh2V+AX3K6yN9xP32wogBBXyRfB21Omxo
	mQZfYGc5UCDR/fV9Dmon9xOR20f2NhzjYDwWE2Vfd8VcoiLT+rv9O2u/Rf4KQcg43MVcYV3CyKwHm
	eITLSH6rmHPWC8YsrrG/kl5y5ITt2jMurI2vmJDpKLHFmYaB5evVCTAqTvJ/foBGOCit8Edyjp7EW
	4bgzScOh1S2DvTGozMIkqv8wkAz4svxDaIv/uuNBn1GJzL6l8UUqfWIDuCuLmi/bZH5TrjWbgtGZ6
	2Bp4qqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uch6y-0000000C8PF-2rrt;
	Fri, 18 Jul 2025 09:10:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgzt-0000000C7Kx-38ht
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:03:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BC46176C;
	Fri, 18 Jul 2025 02:03:10 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CCBC3F66E;
	Fri, 18 Jul 2025 02:03:09 -0700 (PDT)
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
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v5 2/7] mm: Optimize mprotect() for MM_CP_PROT_NUMA by batch-skipping PTEs
Date: Fri, 18 Jul 2025 14:32:39 +0530
Message-Id: <20250718090244.21092-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250718090244.21092-1-dev.jain@arm.com>
References: <20250718090244.21092-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_020317_863126_50636A44 
X-CRM114-Status: GOOD (  15.43  )
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

For the MM_CP_PROT_NUMA skipping case, observe that, if we skip an
iteration due to the underlying folio satisfying any of the skip
conditions, then for all subsequent ptes which map the same folio, the
iteration will be skipped for them too. Therefore, we can optimize
by using folio_pte_batch() to batch skip the iterations.

Use prot_numa_skip() introduced in the previous patch to determine whether
we need to skip the iteration. Change its signature to have a double
pointer to a folio, which will be used by mprotect_folio_pte_batch() to
determine the number of iterations we can safely skip.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mprotect.c | 55 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 2a9c73bd0778..97adc62c50ab 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -83,28 +83,43 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 	return pte_dirty(pte);
 }
 
+static int mprotect_folio_pte_batch(struct folio *folio, pte_t *ptep,
+				    pte_t pte, int max_nr_ptes)
+{
+	/* No underlying folio, so cannot batch */
+	if (!folio)
+		return 1;
+
+	if (!folio_test_large(folio))
+		return 1;
+
+	return folio_pte_batch(folio, ptep, pte, max_nr_ptes);
+}
+
 static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long addr,
-			   pte_t oldpte, pte_t *pte, int target_node)
+			   pte_t oldpte, pte_t *pte, int target_node,
+			   struct folio **foliop)
 {
-	struct folio *folio;
+	struct folio *folio = NULL;
+	bool ret = true;
 	bool toptier;
 	int nid;
 
 	/* Avoid TLB flush if possible */
 	if (pte_protnone(oldpte))
-		return true;
+		goto skip;
 
 	folio = vm_normal_folio(vma, addr, oldpte);
 	if (!folio)
-		return true;
+		goto skip;
 
 	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
-		return true;
+		goto skip;
 
 	/* Also skip shared copy-on-write pages */
 	if (is_cow_mapping(vma->vm_flags) &&
 	    (folio_maybe_dma_pinned(folio) || folio_maybe_mapped_shared(folio)))
-		return true;
+		goto skip;
 
 	/*
 	 * While migration can move some dirty pages,
@@ -112,7 +127,7 @@ static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long addr,
 	 * context.
 	 */
 	if (folio_is_file_lru(folio) && folio_test_dirty(folio))
-		return true;
+		goto skip;
 
 	/*
 	 * Don't mess with PTEs if page is already on the node
@@ -120,7 +135,7 @@ static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long addr,
 	 */
 	nid = folio_nid(folio);
 	if (target_node == nid)
-		return true;
+		goto skip;
 
 	toptier = node_is_toptier(nid);
 
@@ -129,11 +144,15 @@ static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long addr,
 	 * balancing is disabled
 	 */
 	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) && toptier)
-		return true;
+		goto skip;
 
+	ret = false;
 	if (folio_use_access_time(folio))
 		folio_xchg_access_time(folio, jiffies_to_msecs(jiffies));
-	return false;
+
+skip:
+	*foliop = folio;
+	return ret;
 }
 
 static long change_pte_range(struct mmu_gather *tlb,
@@ -147,6 +166,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
 	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
 	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
+	int nr_ptes;
 
 	tlb_change_page_size(tlb, PAGE_SIZE);
 	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
@@ -161,8 +181,11 @@ static long change_pte_range(struct mmu_gather *tlb,
 	flush_tlb_batched_pending(vma->vm_mm);
 	arch_enter_lazy_mmu_mode();
 	do {
+		nr_ptes = 1;
 		oldpte = ptep_get(pte);
 		if (pte_present(oldpte)) {
+			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
+			struct folio *folio;
 			pte_t ptent;
 
 			/*
@@ -170,9 +193,15 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 * pages. See similar comment in change_huge_pmd.
 			 */
 			if (prot_numa) {
-				if (prot_numa_skip(vma, addr, oldpte, pte,
-						   target_node))
+				int ret = prot_numa_skip(vma, addr, oldpte, pte,
+							 target_node, &folio);
+				if (ret) {
+
+					/* determine batch to skip */
+					nr_ptes = mprotect_folio_pte_batch(folio,
+						  pte, oldpte, max_nr_ptes);
 					continue;
+				}
 			}
 
 			oldpte = ptep_modify_prot_start(vma, addr, pte);
@@ -289,7 +318,7 @@ static long change_pte_range(struct mmu_gather *tlb,
 				pages++;
 			}
 		}
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
 	arch_leave_lazy_mmu_mode();
 	pte_unmap_unlock(pte - 1, ptl);
 
-- 
2.30.2


