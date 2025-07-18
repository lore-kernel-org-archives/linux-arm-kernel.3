Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB2DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhDCjH6stdqZo9ZnL0wmZ30wbFq9dPNv+va0qFU4qrs=; b=t1RdlISQQwh4yYM/1TMukLT4C1
	BgqSQFWYnzLJSgDqfFPj+wYgp5IHB0A0yDlwOZgd9nTY8dp57u6NPBh5pDvdnmnSlmetcE+Y7RtNT
	OkmEqwhsXRjcVkQvY+MbSfH5eFWULYi14ENUn7sHTYoU3bEquFkr8y8Z5uC3HcjY47vk4CbyOzk0j
	I0CaVEXulipd+Zjb7H0cSJDUs6BAWAzVKHCX4nsGXj5uYYQ0SziQLNVupPf/WSLmgI992lWUHU/QD
	sSFnnxcawyTK2EscvDQScviYc7FzYa0Z4RPdxJA2YhGawTPlK+WkCRAZ3eMQUF76EQD3LeJfpkxul
	QhrPAbCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uch4Y-0000000C8CA-3zeS;
	Fri, 18 Jul 2025 09:08:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgzl-0000000C7Hq-1v59
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:03:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 633DF1A32;
	Fri, 18 Jul 2025 02:03:01 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (unknown [10.164.18.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9B413F66E;
	Fri, 18 Jul 2025 02:03:00 -0700 (PDT)
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
Subject: [PATCH v5 1/7] mm: Refactor MM_CP_PROT_NUMA skipping case into new function
Date: Fri, 18 Jul 2025 14:32:38 +0530
Message-Id: <20250718090244.21092-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250718090244.21092-1-dev.jain@arm.com>
References: <20250718090244.21092-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_020309_613849_8B62F0B4 
X-CRM114-Status: GOOD (  12.17  )
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

Reduce indentation by refactoring the prot_numa case into a new function.
No functional change intended.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mprotect.c | 101 +++++++++++++++++++++++++++-----------------------
 1 file changed, 55 insertions(+), 46 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 88709c01177b..2a9c73bd0778 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -83,6 +83,59 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 	return pte_dirty(pte);
 }
 
+static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long addr,
+			   pte_t oldpte, pte_t *pte, int target_node)
+{
+	struct folio *folio;
+	bool toptier;
+	int nid;
+
+	/* Avoid TLB flush if possible */
+	if (pte_protnone(oldpte))
+		return true;
+
+	folio = vm_normal_folio(vma, addr, oldpte);
+	if (!folio)
+		return true;
+
+	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
+		return true;
+
+	/* Also skip shared copy-on-write pages */
+	if (is_cow_mapping(vma->vm_flags) &&
+	    (folio_maybe_dma_pinned(folio) || folio_maybe_mapped_shared(folio)))
+		return true;
+
+	/*
+	 * While migration can move some dirty pages,
+	 * it cannot move them all from MIGRATE_ASYNC
+	 * context.
+	 */
+	if (folio_is_file_lru(folio) && folio_test_dirty(folio))
+		return true;
+
+	/*
+	 * Don't mess with PTEs if page is already on the node
+	 * a single-threaded process is running on.
+	 */
+	nid = folio_nid(folio);
+	if (target_node == nid)
+		return true;
+
+	toptier = node_is_toptier(nid);
+
+	/*
+	 * Skip scanning top tier node if normal numa
+	 * balancing is disabled
+	 */
+	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) && toptier)
+		return true;
+
+	if (folio_use_access_time(folio))
+		folio_xchg_access_time(folio, jiffies_to_msecs(jiffies));
+	return false;
+}
+
 static long change_pte_range(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
@@ -117,53 +170,9 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 * pages. See similar comment in change_huge_pmd.
 			 */
 			if (prot_numa) {
-				struct folio *folio;
-				int nid;
-				bool toptier;
-
-				/* Avoid TLB flush if possible */
-				if (pte_protnone(oldpte))
-					continue;
-
-				folio = vm_normal_folio(vma, addr, oldpte);
-				if (!folio || folio_is_zone_device(folio) ||
-				    folio_test_ksm(folio))
-					continue;
-
-				/* Also skip shared copy-on-write pages */
-				if (is_cow_mapping(vma->vm_flags) &&
-				    (folio_maybe_dma_pinned(folio) ||
-				     folio_maybe_mapped_shared(folio)))
-					continue;
-
-				/*
-				 * While migration can move some dirty pages,
-				 * it cannot move them all from MIGRATE_ASYNC
-				 * context.
-				 */
-				if (folio_is_file_lru(folio) &&
-				    folio_test_dirty(folio))
-					continue;
-
-				/*
-				 * Don't mess with PTEs if page is already on the node
-				 * a single-threaded process is running on.
-				 */
-				nid = folio_nid(folio);
-				if (target_node == nid)
-					continue;
-				toptier = node_is_toptier(nid);
-
-				/*
-				 * Skip scanning top tier node if normal numa
-				 * balancing is disabled
-				 */
-				if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
-				    toptier)
+				if (prot_numa_skip(vma, addr, oldpte, pte,
+						   target_node))
 					continue;
-				if (folio_use_access_time(folio))
-					folio_xchg_access_time(folio,
-						jiffies_to_msecs(jiffies));
 			}
 
 			oldpte = ptep_modify_prot_start(vma, addr, pte);
-- 
2.30.2


