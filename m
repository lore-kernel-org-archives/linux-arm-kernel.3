Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7FDD5B879
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 04:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ntpMF8cty6KXv6czYD94o7yS9fFXOq372wYY/vJCZ3A=; b=yeeVSmsqcWwlbifA7Cr8+e18V9
	6h/7p5XBp2icj2gHml/9UGynzecWrHTxMP9EDev6upwV0X+1GHZrpp08w09hMTBE6ZYRGeV8yvt88
	6stByf3c0o9yCRBZA121z7wwFTUajaHHw0ygC+yDLYAZNDM+/zDoIa6JyVtNxeUoGa24M1WvsvyjB
	XnYlS2xmoLe3BCqIpEJXjO9lgRd1GQyCBKOGEpHPsaAfdKAFvCLXOwtg6vpx+GTNOCLeX+/ymz/Ux
	vdu61+Spx3Hmqk2aQhs7cqTzNB4QEJsG78vlqhSuJ5JGOYqognG+w1JTkElpCPgnVNs/3gRjAH0Us
	pHZhEcOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5e8V-0000000DCbY-3u3D;
	Tue, 29 Oct 2024 04:47:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5e6t-0000000DCJd-45JI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 04:45:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A90013D5;
	Mon, 28 Oct 2024 21:46:07 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.43.192])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 23BCA3F66E;
	Mon, 28 Oct 2024 21:45:34 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Re-organize arch_make_huge_pte()
Date: Tue, 29 Oct 2024 10:15:29 +0530
Message-Id: <20241029044529.2624785-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_214540_082303_61B421C3 
X-CRM114-Status: GOOD (  12.53  )
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

Core HugeTLB defines a fallback definition for arch_make_huge_pte(), which
calls platform provided pte_mkhuge(). But if any platform already provides
an override for arch_make_huge_pte(), then it does not need to provide the
helper pte_mkhuge().

arm64 override for arch_make_huge_pte() calls pte_mkhuge() internally, thus
creating an impression, that both of these callbacks are being used in core
HugeTLB and hence required to be defined. This drops off pte_mkhuge() which
was never required to begin with as there could not be any section mappings
at the PTE level. Re-organize arch_make_huge_pte() based on requested page
size and create the entry for the applicable page table level as needed. It
also removes a redundancy of clearing PTE_TABLE_BIT bit followed by setting
both PTE_TABLE_BIT and PTE_VALID bits (via PTE_TYPE_MASK) in the pte, while
creating CONT_PTE_SIZE size entries.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This applies on v6.12-rc5

 arch/arm64/include/asm/pgtable.h |  5 -----
 arch/arm64/mm/hugetlbpage.c      | 21 ++++++++++++++++-----
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index c329ea061dc9..fa4c32a9f572 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -438,11 +438,6 @@ static inline void __set_ptes(struct mm_struct *mm,
 	}
 }
 
-/*
- * Huge pte definitions.
- */
-#define pte_mkhuge(pte)		(__pte(pte_val(pte) & ~PTE_TABLE_BIT))
-
 /*
  * Hugetlb definitions.
  */
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 5f1e2103888b..3215adf48a1b 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -361,14 +361,25 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 {
 	size_t pagesize = 1UL << shift;
 
-	entry = pte_mkhuge(entry);
-	if (pagesize == CONT_PTE_SIZE) {
-		entry = pte_mkcont(entry);
-	} else if (pagesize == CONT_PMD_SIZE) {
+	switch (pagesize) {
+#ifndef __PAGETABLE_PMD_FOLDED
+	case PUD_SIZE:
+		entry = pud_pte(pud_mkhuge(pte_pud(entry)));
+		break;
+#endif
+	case CONT_PMD_SIZE:
 		entry = pmd_pte(pmd_mkcont(pte_pmd(entry)));
-	} else if (pagesize != PUD_SIZE && pagesize != PMD_SIZE) {
+		fallthrough;
+	case PMD_SIZE:
+		entry = pmd_pte(pmd_mkhuge(pte_pmd(entry)));
+		break;
+	case CONT_PTE_SIZE:
+		entry = pte_mkcont(entry);
+		break;
+	default:
 		pr_warn("%s: unrecognized huge page size 0x%lx\n",
 			__func__, pagesize);
+		break;
 	}
 	return entry;
 }
-- 
2.30.2


