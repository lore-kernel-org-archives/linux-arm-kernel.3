Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881A6C021B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQ4JkF977H/+ieppMDbN6K1cUGF/oUaf2nJCjP87TKU=; b=Xl/6/r73Y2YvahsnbmF1kRHwLw
	rdN7mNsuBnU5WNy/54Lo1FK2nLU6acH1uDOw/z7qD5Xnmfj503uhLPW5Ly+A9ounUnWCTYwJkUlGz
	9372X8Mg60jfsDF231nBWhPUnVRb20YgeSQDZgCCD48gXqIHrcW2dtgsXVWGTMslhs6J82Vs3o+kZ
	/xzyGEVD8hBpuGqgtLtBom4KO79AZmFXUJkb6l5LAzM2ZDqv+Ac5x8z7yI6fgUTcb6tn0voslRIAN
	eG6f3odvoXB9dMe6zNIZv5LY7JOtzjKlHh9IdDBTXzZAXiUrjuJEDmsDsTpWWF/bR+2Ls7QL4RHCO
	/t7/dOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPwh-000000054jb-3hp8;
	Fri, 21 Feb 2025 10:07:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPaj-00000004zh2-1b2D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:45:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB89A12FC;
	Fri, 21 Feb 2025 01:45:22 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D4B73F59E;
	Fri, 21 Feb 2025 01:45:01 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64/mm/hotplug: Replace pxx_present() with pxx_valid()
Date: Fri, 21 Feb 2025 15:14:49 +0530
Message-Id: <20250221094449.1188427-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221094449.1188427-1-anshuman.khandual@arm.com>
References: <20250221094449.1188427-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_014505_460435_45C0FDB0 
X-CRM114-Status: GOOD (  10.66  )
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

pte_present() asserts either the entry has PTE_VALID or PTE_PRESENT_INVALID
bit set. Although PTE_PRESENT_INVALID bit only gets set on user space page
table entries to represent pxx_present_invalid() state. So present invalid
state is not really possible in kernel page table entries including linear
and vmemap mapping which get teared down during memory hot remove operation
. Hence just check for pxx_valid() instead of pxx_present() in all relevant
places.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/mmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 66906c45c7f6..33a8b77b5e6b 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -863,7 +863,7 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
 		if (pte_none(pte))
 			continue;
 
-		WARN_ON(!pte_present(pte));
+		WARN_ON(!pte_valid(pte));
 		__pte_clear(&init_mm, addr, ptep);
 		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 		if (free_mapped)
@@ -886,7 +886,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 		if (pmd_none(pmd))
 			continue;
 
-		WARN_ON(!pmd_present(pmd));
+		WARN_ON(!pmd_valid(pmd));
 		if (pmd_sect(pmd)) {
 			pmd_clear(pmdp);
 
@@ -919,7 +919,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 		if (pud_none(pud))
 			continue;
 
-		WARN_ON(!pud_present(pud));
+		WARN_ON(!pud_valid(pud));
 		if (pud_sect(pud)) {
 			pud_clear(pudp);
 
@@ -1032,7 +1032,7 @@ static void free_empty_pmd_table(pud_t *pudp, unsigned long addr,
 		if (pmd_none(pmd))
 			continue;
 
-		WARN_ON(!pmd_present(pmd) || !pmd_table(pmd) || pmd_sect(pmd));
+		WARN_ON(!pmd_valid(pmd) || !pmd_table(pmd) || pmd_sect(pmd));
 		free_empty_pte_table(pmdp, addr, next, floor, ceiling);
 	} while (addr = next, addr < end);
 
@@ -1072,7 +1072,7 @@ static void free_empty_pud_table(p4d_t *p4dp, unsigned long addr,
 		if (pud_none(pud))
 			continue;
 
-		WARN_ON(!pud_present(pud) || !pud_table(pud) || pud_sect(pud));
+		WARN_ON(!pud_valid(pud) || !pud_table(pud) || pud_sect(pud));
 		free_empty_pmd_table(pudp, addr, next, floor, ceiling);
 	} while (addr = next, addr < end);
 
-- 
2.30.2


