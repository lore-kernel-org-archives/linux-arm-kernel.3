Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1ADEDF176
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v3HP9pKLCjYb6MhZZvb/AlwTXXa2k1faRC9l/m+AddM=; b=bxrPODbY5rsUcAbXCSkte2+LzT
	g/s1Uynj+Z2PXcYzN6q9IcTRk7G/J6o2iLnsJctXSNxsxZGuARAuZjcawlT0707iGv6gyUkvujQpm
	1UyC5tsA/sW0aJ3uM75zFyK1MhYA3ZURIWcBgkbNlGB4S2pv4Xj2YdLTffoTSclu0DWX3FDtAIoab
	/5U90lPKoqmeVqMrgSyQ/CLapBQgdFb5tGY5B7sQGalLHyVXj91GBUPch2z2CujbJ8Fzi44LV0SNe
	Ppwxm81Xhj8eFSsHO4eI5xuMSqPNBlC2ZPweLRwffcc+igobHSlAAYU3hxIDWqIaBnMlfmLS8G6ac
	2vSmZY4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvw3-00000003fsQ-3n6E;
	Fri, 13 Feb 2026 16:22:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvw2-00000003fsG-1v3N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 16:22:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FBEF6001A;
	Fri, 13 Feb 2026 16:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FE3C116C6;
	Fri, 13 Feb 2026 16:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770999745;
	bh=d4NP+fYMPgAztZy77Zo0mSw1PpGN755kbgXloR2xrac=;
	h=From:To:Cc:Subject:Date:From;
	b=BB7ESeYfmafFLwTPuVAp96rCF+fbTkXRnfpXaiWuixbMiuL+vR6c8cDvTSgm54cjD
	 oQOdodRSYB6eiwReWiNSuLcmFli20fBAEp4h42L2P75Rbm7cB19Pl79CftDOxhgelk
	 kJB35JH8+zJkXk1h0DfL4ezXq9lqA0pNC5JSI1xsYchkuw7l+N4kEqh5MGuLYf9OSU
	 FgOCi5mxyqc0l//1TL2NVN+B7OIEPrye2jfBFkolYAEeFtFwbUiqWhnDba8++4lMcN
	 qHi/CqRp3n/aS34yx54dB1OJji6ekWMscjavccAx2biHoEHhuK2mxJ2K+cxkr9zO8a
	 Rqo0YghTk2kkg==
From: Arnd Bergmann <arnd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Rohan McLure <rmclure@linux.ibm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] arm64: hugetlbpage: avoid unused-but-set-parameter warning (gcc-16)
Date: Fri, 13 Feb 2026 17:22:14 +0100
Message-Id: <20260213162219.1042965-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

gcc-16 warns about an instance that older compilers did not:

arch/arm64/mm/hugetlbpage.c: In function 'huge_pte_clear':
arch/arm64/mm/hugetlbpage.c:369:57: error: parameter 'addr' set but not used [-Werror=unused-but-set-parameter=]

The issue here is that __pte_clear() does not actually use its second
argument when CONFIG_ARM64_CONTPTE is disabled.

Replace the macro with an inline function to let the compiler see
how the argument is used.

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: replace my original patch with Catalin's suggestion
---
 arch/arm64/include/asm/pgtable.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a17eb8a76788..b3e58735c49b 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -144,8 +144,6 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
 
 #define pte_none(pte)		(!pte_val(pte))
-#define __pte_clear(mm, addr, ptep) \
-				__set_pte(ptep, __pte(0))
 #define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))
 
 /*
@@ -1284,6 +1282,13 @@ static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 /*
  * Atomic pte/pmd modifications.
  */
+
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
+{
+	__set_pte(ptep, __pte(0));
+}
+
 static inline int __ptep_test_and_clear_young(struct vm_area_struct *vma,
 					      unsigned long address,
 					      pte_t *ptep)
-- 
2.39.5


