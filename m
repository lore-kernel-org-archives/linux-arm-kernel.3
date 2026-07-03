Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EA4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yg0lz8Jg9E5VcjlhmOCHXO4YaykLXADpl2rfVwfd4X0=; b=Uh5HT+padLZfm8wbFUg9Fe+Hx2
	MqJwEhNpzsQn3oHkK4v8aV21XENBKjBYsqGeoJBWXLkbhDW+OXU7NI4zXrWu9BEPs3zMynNXIAFpy
	P10ZW4TdpLahEgpFtbTQEB7hzOH/t5rmgLIkaAz86S0KdsKJAMCy5SWCDelipoGOBM/BZhVEQAxCV
	gGngY0CEIPm89izmpq0e+r3WWW8ofXSGt4EXrhJfF63XwrLK0ylv6Bh9ShK/lnF8GZs2I6BivXGaN
	DQKTbQrahK+3Mq0XhCiy62V0gRR32JRE+mYnQA4WK/xJw5+YKi0EmezeJZJOJdJJE95D53cvvFKX4
	t/TZ7DQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcID-00000006pXw-3Q19;
	Fri, 03 Jul 2026 11:42:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcIA-00000006pVs-1Ntc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:42:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61F7D3587;
	Fri,  3 Jul 2026 04:42:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 85C5A3F673;
	Fri,  3 Jul 2026 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783078964; bh=BRu+bhG7aKPiwT5vuH3zvlt7PlvdsDOhL/vNEPHmmuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bZE5qae5+56oO0S3uNA4ZnaxllNJL7xt1NU0E09fQ779TxsZvP3TNcLz3cnjE+9yK
	 aPal0ieAg0R7/f/NZT22vH0T1f8E7ieCwBTMhNTpGz/7JKySJSfrYj3blLLbOsbd5J
	 JP0rBHMBYdhLeAFN9ToEtIptslmqlwFr3u/d4WVI=
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
	apopple@nvidia.com,
	rcampbell@nvidia.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	ak@linux.intel.com,
	nao.horiguchi@gmail.com,
	mel@csn.ul.ie,
	j-nomura@ce.jp.nec.com,
	pfalcato@suse.de,
	tglx@kernel.org,
	dave.hansen@intel.com,
	jpoimboe@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH v3 2/6] mm/rmap: use huge_ptep_get() in try_to_unmap_one()
Date: Fri,  3 Jul 2026 11:41:55 +0000
Message-ID: <20260703114202.365553-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703114202.365553-1-dev.jain@arm.com>
References: <20260703114202.365553-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_044246_447336_F0286208 
X-CRM114-Status: GOOD (  12.21  )
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

try_to_unmap_one() handles hugetlb folios when memory failure needs
to replace a poisoned hugetlb mapping with a hwpoison entry. In that
case page_vma_mapped_walk() returns the pte pointer to the hugetlb folio
in pvmw.pte, but the code reads it with ptep_get().

On arches which provide their own huge_ptep_get() to dereference a huge
pte pointer, accessing via ptep_get() would cause pte_pfn(), pte_present()
etc to misbehave.

It is not clear whether this has a trivially visible effect to userspace.

Just use huge_ptep_get() for dereferencing a huge pte pointer.

Fixes: c7ab0d2fdc84 ("mm: convert try_to_unmap_one() to use page_vma_mapped_walk()")
Cc: stable@vger.kernel.org
Reported-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 include/linux/hugetlb.h |  2 ++
 mm/rmap.c               | 16 ++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 2abaf99321e90..6996d02acf171 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -1261,6 +1261,8 @@ static inline void hugetlb_count_sub(long l, struct mm_struct *mm)
 {
 }
 
+pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
+
 static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 					  unsigned long addr, pte_t *ptep)
 {
diff --git a/mm/rmap.c b/mm/rmap.c
index 1c77d5dc06e9f..03737daa348c0 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2095,14 +2095,19 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
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
+			pteval = ptep_get(pvmw.pte);
+		}
 		if (likely(pte_present(pteval))) {
 			pfn = pte_pfn(pteval);
 		} else {
+			/*
+			 * Handle PFN swap PTEs, such as device-exclusive ones,
+			 * that actually map pages.
+			 */
 			const softleaf_t entry = softleaf_from_pte(pteval);
 
 			pfn = softleaf_to_pfn(entry);
@@ -2110,7 +2115,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		}
 
 		subpage = folio_page(folio, pfn - folio_pfn(folio));
-		address = pvmw.address;
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
 
-- 
2.43.0


