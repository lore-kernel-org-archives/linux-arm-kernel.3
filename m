Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1A4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 05:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEOwCzDNDZHVfKU5Zplsz4V5uu4yg9zuzedo1YwjSlA=; b=JcohWyQZ+0WzmzMUAeaRcplBCr
	ma3m6tFPUKSZlKgjFmkeu6rf0vwrTrAsjevEDmXdOwoWIxQM2IGSohesXXit2aVp4R9vIYluQ4sBZ
	7nXQgLn5vB5TpK7LnW8zr92P1D9J79MTfxo2fxAjXHFwOiZlIsarJqFX4aWOuNiEGelJLDVPn6gBB
	4aEiA9wWUfL5kIJjgLZUjwt4zEKKsiC0xQSE2J3DXy+M9pf4utnp48kdUN6LRDX2k0Duv7u/M3sA+
	DnB2ybxrooGLypXWKvmLBe2/mvnDs2+8DhPFVjbroTU5AnufcVICUib6F3tDox93i7xpZRerU3HLw
	Zo4CU3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf9l7-00000003aOM-1BxN;
	Thu, 02 Jul 2026 05:14:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf9l4-00000003aNQ-3luk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 05:14:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A3AE357C;
	Wed,  1 Jul 2026 22:14:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 537A23F85F;
	Wed,  1 Jul 2026 22:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782969281; bh=ienzyGRe9B9tWaT5v8xmSHn5lDIwPDVd/gVOyC2GvTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F0NeD8GEIbiGiBvjgRh6bIapiMQcvdM5rJEBK1vIEktyr6tBfzLDihurGU4RxsUVA
	 I8OKgZC2FeEZcu/UdxUcxPHIFVOTE29K/MwoK0gdo4quBfKkJ3giy3PNvKj1BmmAWe
	 eceYU5/wDyKPtl7yAaFgZLddDmTIh9NWemZP5vOw=
From: Dev Jain <dev.jain@arm.com>
To: muchun.song@linux.dev,
	osalvador@suse.de,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	david@kernel.org,
	liam@infradead.org
Cc: Dev Jain <dev.jain@arm.com>,
	riel@surriel.com,
	vbabka@kernel.org,
	harry@kernel.org,
	jannh@google.com,
	lance.yang@linux.dev,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcampbell@nvidia.com,
	apopple@nvidia.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	j-nomura@ce.jp.nec.com,
	nao.horiguchi@gmail.com,
	ak@linux.intel.com,
	mel@csn.ul.ie,
	pfalcato@suse.de,
	jpoimboe@kernel.org,
	dave.hansen@intel.com,
	tglx@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v2 3/6] mm/rmap: use huge_ptep_get() in try_to_migrate_one()
Date: Thu,  2 Jul 2026 05:13:37 +0000
Message-ID: <20260702051341.126509-4-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702051341.126509-1-dev.jain@arm.com>
References: <20260702051341.126509-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_221443_016896_025D5D4C 
X-CRM114-Status: GOOD (  12.08  )
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

try_to_migrate_one() is used by folio migration to replace a present
mapping with a migration entry. For hugetlb folios, page_vma_mapped_walk()
returns the pte pointer to the hugetlb folio in pvmw.pte, but the code
reads the huge pte entry with ptep_get().

On arches which provide their own huge_ptep_get() to dereference a huge
pte pointer, accessing via ptep_get() would cause pte_pfn(), pte_present()
etc to misbehave.

It is not clear whether this has a trivially visible effect to userspace.

Use huge_ptep_get() to dereference a huge pte pointer.

Commit a98a2f0c8ce1 copied the bug from try_to_unmap_one into
try_to_migrate_one.

Fixes: a98a2f0c8ce1 ("mm/rmap: split migration into its own function")
Cc: stable@vger.kernel.org
Acked-by: Muchun Song <muchun.song@linux.dev>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/rmap.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index aa8a254efaecc..abc3a44baaa3d 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2505,11 +2505,16 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		/* Unexpected PMD-mapped THP? */
 		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
 
-		/*
-		 * Handle PFN swap PTEs, such as device-exclusive ones, that
-		 * actually map pages.
-		 */
-		pteval = ptep_get(pvmw.pte);
+		address = pvmw.address;
+		if (folio_test_hugetlb(folio)) {
+			pteval = huge_ptep_get(mm, address, pvmw.pte);
+		} else {
+			/*
+			 * Handle PFN swap PTEs, such as device-exclusive ones,
+			 * that actually map pages.
+			 */
+			pteval = ptep_get(pvmw.pte);
+		}
 		if (likely(pte_present(pteval))) {
 			pfn = pte_pfn(pteval);
 		} else {
@@ -2520,7 +2525,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		}
 
 		subpage = folio_page(folio, pfn - folio_pfn(folio));
-		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
 
-- 
2.43.0


