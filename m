Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7610BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zDleg4Mg/E7jKipTuQZM26MqfRH8PXTsxP2sSTdHnok=; b=1dxh78amd9kuH96VEC+BVAKMou
	EVjAH7GmfYik2bvi7aT/TBtjTLunIvVSyGfc3Ebb4OAAcq4jraoR5Oj1AbUIJ1y97+P4Q5Lr5GCTA
	sPHC+CyFMEIqHIuxAtltNwfRJrTsqUu+RcE1+BPK7S+oMrHktNhBl8LsOGnPQamZGFaqP3ddRurch
	lUqksb/XPPsy0P6yIfUZHSaeRit0TdA+/g6qqI2D6GsmsB4VBHEwE+rrdY+kMc7rowGarhge6yUrW
	1WRDIMSbOxR3XyRwAamla/6Xz8VmS0C14Opg68R9BuAP0FMSdTTq0a9mR7AzhQiLCP3+h6GL1rAGp
	Hjd+EPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsVQ-00000006RhC-0TWI;
	Fri, 31 Oct 2025 17:01:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsVO-00000006Rh6-2i1J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:01:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C352603E1;
	Fri, 31 Oct 2025 17:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020B1C4CEF1;
	Fri, 31 Oct 2025 17:01:35 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH] mm/huge_memory: Initialise the tags of the huge zero folio
Date: Fri, 31 Oct 2025 16:57:50 +0000
Message-ID: <20251031170133.280742-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
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

On arm64 with MTE enabled, a page mapped as Normal Tagged (PROT_MTE) in
user space will need to have its allocation tags initialised. This is
normally done in the arm64 set_pte_at() after checking the memory
attributes. Such page is also marked with the PG_mte_tagged flag to
avoid subsequent clearing. Since this relies on having a struct page,
pte_special() mappings are ignored.

Commit d82d09e48219 ("mm/huge_memory: mark PMD mappings of the huge zero
folio special") maps the huge zero folio special and the arm64
set_pmd_at() will no longer zero the tags. There is no guarantee that
the tags are zero, especially if parts of this huge page have been
previously tagged.

Allocate the huge zero folio with the __GFP_ZEROTAGS flag. In addition,
do not warn in the arm64 __access_remote_tags() when reading tags from
the huge zero page.

Fixes: d82d09e48219 ("mm/huge_memory: mark PMD mappings of the huge zero folio special")
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>
---

It's fairly easy to detect this by regularly dropping the caches to
force the reallocation of the huge zero folio. I bundled the arm64
change in here as well since they are both related to the commit mapping
the huge zero folio as special.

I don't have any preference how this patch goes in, either the mm tree
or the arm64 fixes one is fine by me.

 arch/arm64/kernel/mte.c | 3 ++-
 mm/huge_memory.c        | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 43f7a2f39403..32148bf09c1d 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -476,7 +476,8 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 
 		folio = page_folio(page);
 		if (folio_test_hugetlb(folio))
-			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio));
+			WARN_ON_ONCE(!folio_test_hugetlb_mte_tagged(folio) &&
+				     !is_huge_zero_folio(folio));
 		else
 			WARN_ON_ONCE(!page_mte_tagged(page) && !is_zero_page(page));
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1b81680b4225..b7498e51282a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -214,7 +214,8 @@ static bool get_huge_zero_folio(void)
 	if (likely(atomic_inc_not_zero(&huge_zero_refcount)))
 		return true;
 
-	zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO) & ~__GFP_MOVABLE,
+	zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO | __GFP_ZEROTAGS) &
+				 ~__GFP_MOVABLE,
 			HPAGE_PMD_ORDER);
 	if (!zero_folio) {
 		count_vm_event(THP_ZERO_PAGE_ALLOC_FAILED);

