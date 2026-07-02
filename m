Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AB6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 05:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjKhHiE7LlhaAGsJKE82OwSqB6wQcOg4HsColPic8ig=; b=QJocADkbeMo024JvIp2BUhBFpa
	+YSdZbIu3gLf1YCqOSMRVX2QgKC+cNcl4MhXnmGsDY8AQCE73aVOSvYMyzfJh25yZwyBx2C0oowrR
	Ti0r+vULq3vxP3OMWZTZeGylAmrsy8esiobGW/nezc5gIQXcoxSomsOMXsPEMXER/VnEJkuHKcPJs
	ZPPHt1onAYC7y3XNOMM/MTJB/lQGwPiayRLFci4FqVxPvYP9nTCXozkcr6nfOqWVCWGEowv/a4V3Y
	4j/XYrH+OAl3gJBedAtJA7TXS2rN0nCC8b/daTnXUUtRXAgCfX3sYwDaiGDz9WRQQqMZLqLt7s9U2
	gR7H4q/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf9kp-00000003aIe-09o4;
	Thu, 02 Jul 2026 05:14:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf9km-00000003aHk-0MZV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 05:14:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6CB3582;
	Wed,  1 Jul 2026 22:14:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 218A43F85F;
	Wed,  1 Jul 2026 22:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782969261; bh=T62Rm8CforrQHCgI1jL51VN6OPOgVlXbC7gVEXEkr9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QOBxtronwSwnHmv9SwXu4hDfj37PApl4TlCG0do4RCYGpXUWt4nD5YqM9fmYpV7+8
	 Z0BzPJY/0ZDSSsWbBljm+FgtEHXp0U26TjOlmBTEeL/gukZ7RANUd01Z6J9oyC0xTc
	 4ACwViY/VzUpniG0iOXDyzwZGa6p6YDnhaVNJ4CQ=
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
Subject: [PATCH v2 1/6] arm64: make huge_ptep_get handled unaligned addresses
Date: Thu,  2 Jul 2026 05:13:35 +0000
Message-ID: <20260702051341.126509-2-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702051341.126509-1-dev.jain@arm.com>
References: <20260702051341.126509-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_221424_166498_BA67C0E4 
X-CRM114-Status: GOOD (  12.51  )
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

huge_ptep_get() can be handed a virtual address pointing to the middle of
a contpmd/contpte mapped hugetlb folio (examples of callers are
pagemap_hugetlb_range, page_mapped_in_vma).

The arm64 helper rewalks the pgtables in find_num_contig to answer whether
the huge pte we have maps a contpmd or a contpte hugetlb folio, and
returns CONT_PMDS or CONT_PTES, so that it can collect a/d bits over the
contiguous ptes. We can falsely return CONT_PTES instead of CONT_PMDS
if the addr is not aligned.

Fix this by aligning the pmdp pointer down to a contpmd base before
checking equality with the passed huge pte pointer, to correctly answer
whether the huge pte is the base of a contpmd block.

Fixes: 29cb80519689 ("arm64: hugetlb: Cleanup huge_pte size discovery mechanisms")
Cc: stable@vger.kernel.org
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 30772a909aea3..8e799c1fe0aa6 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -87,7 +87,7 @@ static int find_num_contig(struct mm_struct *mm, unsigned long addr,
 	p4dp = p4d_offset(pgdp, addr);
 	pudp = pud_offset(p4dp, addr);
 	pmdp = pmd_offset(pudp, addr);
-	if ((pte_t *)pmdp == ptep) {
+	if ((pte_t *)PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS) == ptep) {
 		*pgsize = PMD_SIZE;
 		return CONT_PMDS;
 	}
-- 
2.43.0


