Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDB4C19776
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 02:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NaVJPU5y7lqSzMNw28F6sdzyzS5CHpENnBBa/1pv/7Y=; b=46fzvibJCGa1gUlr+xviCfpPqU
	9UUxClrXob1vQujL+2n1NbzM/7bim3UqMpwPVi4rsFMrwOLsdI/LXmbWAfRBywLH/LK6yHN0pNH/h
	4q/vuJ3MdN6BfdCVFUshL2m0Pty8p3jqKZ85abXm/MjYcIeu4j/Wuk49AdpPP93soq4gzommyvXDl
	3Xeh7vut3yg4tHmjuVm5HQDlMbrEOup9s2uB0J3u4E2XsehSB6E5RDOR84Mi7HWeoTz/I+rR2mz71
	v5w1VzjQJ3NBK00jMa3yoRTvqdFchz73IGq9BGQBaYQ2oOxWcLj5iKY/e6o9ByssxM2ebS8KkLXll
	/iTMBh3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnTb6-000000066Au-0IKN;
	Thu, 27 Feb 2025 02:26:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnTZX-000000065mD-2euJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 02:24:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC0EB1515;
	Wed, 26 Feb 2025 18:24:36 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6504A3F673;
	Wed, 26 Feb 2025 18:24:18 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64/mm: Convert __pte_to_phys() and __phys_to_pte_val() as functions
Date: Thu, 27 Feb 2025 07:54:12 +0530
Message-Id: <20250227022412.2015835-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_182423_714069_1C623A24 
X-CRM114-Status: UNSURE (   9.14  )
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

When CONFIG_ARM64_PA_BITS_52 is enabled, page table helpers __pte_to_phys()
and __phys_to_pte_val() are functions which return phys_addr_t and pteval_t
respectively as expected. But otherwise without this config being enabled,
they are defined as macros and their return types are implicit.

Until now this has worked out correctly as both pte_t and phys_addr_t data
types have been 64 bits. But with the introduction of 128 bit page tables,
pte_t becomes 128 bits. Hence this ends up with incorrect widths after the
conversions, which leads to compiler warnings.

Fix these warnings by converting __pte_to_phys() and __phys_to_pte_val()
as functions instead where the return types are handled explicitly.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.14-rc3

Changes in V2:

- Changed the helper macros as functions instead per Mark
- Dropped irrelevant (now) in-code comments per Mark

Changes in V1:

https://lore.kernel.org/all/20250219035646.536707-1-anshuman.khandual@arm.com/

 arch/arm64/include/asm/pgtable.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0b2a2ad1b9e8..4ebfa60ea5c6 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -68,10 +68,6 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 #define pte_ERROR(e)	\
 	pr_err("%s:%d: bad pte %016llx.\n", __FILE__, __LINE__, pte_val(e))
 
-/*
- * Macros to convert between a physical address and its placement in a
- * page table entry, taking care of 52-bit addresses.
- */
 #ifdef CONFIG_ARM64_PA_BITS_52
 static inline phys_addr_t __pte_to_phys(pte_t pte)
 {
@@ -84,8 +80,15 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 	return (phys | (phys >> PTE_ADDR_HIGH_SHIFT)) & PHYS_TO_PTE_ADDR_MASK;
 }
 #else
-#define __pte_to_phys(pte)	(pte_val(pte) & PTE_ADDR_LOW)
-#define __phys_to_pte_val(phys)	(phys)
+static inline phys_addr_t __pte_to_phys(pte_t pte)
+{
+	return pte_val(pte) & PTE_ADDR_LOW;
+}
+
+static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
+{
+	return phys;
+}
 #endif
 
 #define pte_pfn(pte)		(__pte_to_phys(pte) >> PAGE_SHIFT)
-- 
2.30.2


