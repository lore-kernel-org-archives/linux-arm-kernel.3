Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD665C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 05:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J580WCxVeJH5vNA7sWZrKK4oxx/H4X5dA2TzX4qc31I=; b=KgWEaR7bisEBSAhp8+Nks+NIFW
	lSz9ghZjlhv4igtu0QJjnEWb7T84j0aMyusPcP7ddoGOuMHHfFpzdwclJua9a+vGV/KoP9JJH/SVz
	mou47VP8hzBhsys5gO4gaaE54vnq6kg1fIBUUfpP0mibsFRPXWZcvz+0moipf9bsBTw0pGcxzRbeH
	viG7nwY75/hJNSVgN/3Aw3sGtjHxEUpV5Ob+NeulotAaCRINGiUSjdrmqBEV0n4jSrXixWplQejxM
	IoJEhbqYTizw19HFTXRDJxt4t3/PropX5uGtQqoJAP3qn8KMkfO/KWFHwr9SwB1qKr0sZ9s8zRSEh
	OrG8UwOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkymP-0000000Gldw-30BQ;
	Thu, 20 Feb 2025 05:07:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkyku-0000000GlOc-3j77
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 05:05:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACE9216F3;
	Wed, 19 Feb 2025 21:06:02 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.38.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB3783F6A8;
	Wed, 19 Feb 2025 21:05:41 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3] arm64/hugetlb: Consistently use pud_sect_supported()
Date: Thu, 20 Feb 2025 10:35:34 +0530
Message-Id: <20250220050534.799645-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_210548_996966_A453AC1A 
X-CRM114-Status: UNSURE (   9.39  )
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

Let's be consistent in using pud_sect_supported() for PUD_SIZE sized pages.
Hence change hugetlb_mask_last_page() and arch_make_huge_pte() as required.
Also re-arranged the switch statement for a common warning message.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.14-rc3

Changes in V3:

- Re-arranged the switch statement for a common warning message per Ryan

Changes in V2:

https://lore.kernel.org/linux-arm-kernel/20250218113639.475947-1-anshuman.khandual@arm.com/

- Added an warning when PUD_SIZE is requested but not supported per Ryan

Changes in V1:

https://lore.kernel.org/linux-arm-kernel/20250217065414.49489-1-anshuman.khandual@arm.com/

 arch/arm64/mm/hugetlbpage.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 98a2a0e64e25..fd7448bb8c80 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -342,7 +342,9 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
 	switch (hp_size) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
-		return PGDIR_SIZE - PUD_SIZE;
+		if (pud_sect_supported())
+			return PGDIR_SIZE - PUD_SIZE;
+		break;
 #endif
 	case CONT_PMD_SIZE:
 		return PUD_SIZE - CONT_PMD_SIZE;
@@ -364,23 +366,21 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	switch (pagesize) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SIZE:
-		entry = pud_pte(pud_mkhuge(pte_pud(entry)));
+		if (pud_sect_supported())
+			return pud_pte(pud_mkhuge(pte_pud(entry)));
 		break;
 #endif
 	case CONT_PMD_SIZE:
-		entry = pmd_pte(pmd_mkcont(pte_pmd(entry)));
-		fallthrough;
+		return pmd_pte(pmd_mkhuge(pmd_mkcont(pte_pmd(entry))));
 	case PMD_SIZE:
-		entry = pmd_pte(pmd_mkhuge(pte_pmd(entry)));
-		break;
+		return pmd_pte(pmd_mkhuge(pte_pmd(entry)));
 	case CONT_PTE_SIZE:
-		entry = pte_mkcont(entry);
-		break;
+		return pte_mkcont(entry);
 	default:
-		pr_warn("%s: unrecognized huge page size 0x%lx\n",
-			__func__, pagesize);
 		break;
 	}
+	pr_warn("%s: unrecognized huge page size 0x%lx\n",
+		__func__, pagesize);
 	return entry;
 }
 
-- 
2.30.2


