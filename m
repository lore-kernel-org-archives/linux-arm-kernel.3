Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655A9CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6fRW6+cZDH7hUoH+xw53liH1veCcgR0fqqxFP5c5FI=; b=hVWGujR8gZjiFeGXrJnG/B8SSP
	IesDH9nl5cUmUE3oyiVsG304U9ADTnuXXhmw4bJcUqdCzd9E9Ugco3zEwq2G8B8X/nn+NZCVy/atb
	+htj8ObjE21kTTYKutUfAUHFUPYCYYuzTko+LbQnMRPYIyMlSFw4phnfAO49JfkOCX25oI5LGpzLi
	uVvdtldosUNTv/bMQNhCtKdz/ekrlxLiCSmxtsT3Mu0xi7463MYVW+7LtEaYNg6qY5k6VJsjSWZtH
	8l5NDjhe5jSOoFI7wwflLsEYjAMQsaEMfdCVcU+C/Hx73f2UJkfu7UhsZF6hiW7hLxPFl0Gq8eDpu
	Q6Z05B1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DWS-0000000CXys-1bsm;
	Mon, 13 Oct 2025 08:03:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DWP-0000000CXwT-2yJv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:03:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 454FD12FC;
	Mon, 13 Oct 2025 01:03:01 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 256AE3F738;
	Mon, 13 Oct 2025 01:03:04 -0700 (PDT)
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>,
	Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH v2 2/2] arm64/mm: Rename try_pgd_pgtable_alloc_init_mm
Date: Mon, 13 Oct 2025 13:32:20 +0530
Message-ID: <20251013080220.2027757-3-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013080220.2027757-1-linu.cherian@arm.com>
References: <20251013080220.2027757-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_010309_796234_269C359C 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

With BUG_ON in pgd_pgtable_alloc_init_mm moved up to higher layer,
gfp flags is the only difference between try_pgd_pgtable_alloc_init_mm
and pgd_pgtable_alloc_init_mm. Hence rename the "try" version
to pgd_pgtable_alloc_init_mm_gfp.

Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 arch/arm64/mm/mmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 34602339c1bf..ede591346196 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -559,7 +559,7 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
 }
 
 static phys_addr_t
-try_pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type, gfp_t gfp)
+pgd_pgtable_alloc_init_mm_gfp(enum pgtable_type pgtable_type, gfp_t gfp)
 {
 	return __pgd_pgtable_alloc(&init_mm, gfp, pgtable_type);
 }
@@ -594,7 +594,7 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	pte_t *ptep;
 	int i;
 
-	pte_phys = try_pgd_pgtable_alloc_init_mm(TABLE_PTE, gfp);
+	pte_phys = pgd_pgtable_alloc_init_mm_gfp(TABLE_PTE, gfp);
 	if (pte_phys == INVALID_PHYS_ADDR)
 		return -ENOMEM;
 	ptep = (pte_t *)phys_to_virt(pte_phys);
@@ -639,7 +639,7 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
 	pmd_t *pmdp;
 	int i;
 
-	pmd_phys = try_pgd_pgtable_alloc_init_mm(TABLE_PMD, gfp);
+	pmd_phys = pgd_pgtable_alloc_init_mm_gfp(TABLE_PMD, gfp);
 	if (pmd_phys == INVALID_PHYS_ADDR)
 		return -ENOMEM;
 	pmdp = (pmd_t *)phys_to_virt(pmd_phys);
-- 
2.43.0


