Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD00C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2fqn0sLuea+GgAXaF6jDMicxFyeS8CTiS9Ax1VxD1A=; b=2vOzQNZVfq4RKv/d5t9mSioSRH
	tNFBnEdGqOmVl41vHrPz98d50lm6vtRlTyGCf6T8t5Wfrxf3NyfMzGw8hQ89m9jfQEjxN8A/yX9PF
	KccusogJVN4jf7/WiXG/xhnzClUCv3AH9YycnUsyI2f5lvWAzRogtgY4rD81Lm03aTOHnjFL6krWI
	Ji5XiSUyfvecYdWyKZXzTUjWxcoVyICoYn+GPEj8kMR4zCtNxd5nQDK+BmGdcNtC4YEY8iAzOvyv1
	GCW3Trh0yvGPSd9pKmv06NnhlluloMxzUot8m+hq2yUKHtABKqAnMYt6s1nRZkA6M/es354/on5du
	RWps7WXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NeN-00000006COB-3WQk;
	Mon, 28 Apr 2025 12:31:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NE9-000000065iP-0I8W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:04:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF0C21595;
	Mon, 28 Apr 2025 05:04:41 -0700 (PDT)
Received: from K4MQJ0H1H2.arm.com (unknown [10.163.78.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54F5D3F66E;
	Mon, 28 Apr 2025 05:04:37 -0700 (PDT)
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
Subject: [PATCH 1/7] mm: Refactor code in mprotect
Date: Mon, 28 Apr 2025 17:34:08 +0530
Message-Id: <20250428120414.12101-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250428120414.12101-1-dev.jain@arm.com>
References: <20250428120414.12101-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_050449_197265_D3CFF676 
X-CRM114-Status: GOOD (  12.83  )
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

Reduce indentation in change_pte_range() by refactoring some of the code
into a new function. No functional change.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/mprotect.c | 116 +++++++++++++++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 48 deletions(-)

diff --git a/mm/mprotect.c b/mm/mprotect.c
index 62c1f7945741..8d635c7fc81f 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -83,6 +83,71 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
 	return pte_dirty(pte);
 }
 
+
+
+static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
+		int target_node)
+{
+	bool toptier;
+	int nid;
+
+	/* Also skip shared copy-on-write pages */
+	if (is_cow_mapping(vma->vm_flags) &&
+	    (folio_maybe_dma_pinned(folio) ||
+	     folio_maybe_mapped_shared(folio)))
+		return true;
+
+	/*
+	 * While migration can move some dirty pages,
+	 * it cannot move them all from MIGRATE_ASYNC
+	 * context.
+	 */
+	if (folio_is_file_lru(folio) &&
+	    folio_test_dirty(folio))
+		return true;
+
+	/*
+	 * Don't mess with PTEs if page is already on the node
+	 * a single-threaded process is running on.
+	 */
+	nid = folio_nid(folio);
+	if (target_node == nid)
+		return true;
+	toptier = node_is_toptier(nid);
+
+	/*
+	 * Skip scanning top tier node if normal numa
+	 * balancing is disabled
+	 */
+	if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
+	    toptier)
+		return true;
+	return false;
+}
+
+static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
+		unsigned long addr, pte_t oldpte, int target_node)
+{
+	struct folio *folio;
+	int ret;
+
+	/* Avoid TLB flush if possible */
+	if (pte_protnone(oldpte))
+		return true;
+
+	folio = vm_normal_folio(vma, addr, oldpte);
+	if (!folio || folio_is_zone_device(folio) ||
+	    folio_test_ksm(folio))
+		return true;
+	ret = prot_numa_skip(vma, folio, target_node);
+	if (ret)
+		return ret;
+	if (folio_use_access_time(folio))
+		folio_xchg_access_time(folio,
+			jiffies_to_msecs(jiffies));
+	return false;
+}
+
 static long change_pte_range(struct mmu_gather *tlb,
 		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
@@ -116,56 +181,11 @@ static long change_pte_range(struct mmu_gather *tlb,
 			 * Avoid trapping faults against the zero or KSM
 			 * pages. See similar comment in change_huge_pmd.
 			 */
-			if (prot_numa) {
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
+			if (prot_numa &&
+			    prot_numa_avoid_fault(vma, addr,
+						  oldpte, target_node))
 					continue;
 
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
-					continue;
-				if (folio_use_access_time(folio))
-					folio_xchg_access_time(folio,
-						jiffies_to_msecs(jiffies));
-			}
-
 			oldpte = ptep_modify_prot_start(vma, addr, pte);
 			ptent = pte_modify(oldpte, newprot);
 
-- 
2.30.2


