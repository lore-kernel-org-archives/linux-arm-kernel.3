Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4125D58E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kanCFeNtmoqsE80GUPjGn4xqHS1sdBUq7vbrjsSrXI8=; b=2E0CMXXBkDkU/JS3ukQBm3zO/V
	8Uf6YGYZOyyE0C19wtK8g1SrTXTR0ke7dnJa7+QQWLrll97zu+q4z0VLWphBUSWyhM2b6dPvJSU4X
	07+fZyL2cgCzdXG26BgD84nSUgKIXtCJ3bdQLl6iRELTNTr5s/bhovODm/Aqr2WjP1hwhVXCDf80z
	a8G0soMQxVlQBe32yBsXkgCkTdG9WNxzyI/RtFmORCjJfiOCDDVeVi9VRxxpi1cUVUgO0Sw93+VCc
	6XJoa5jLzVPyk/fZVIktcAYRkA3ZR0WMNf0urOoJNWVf62U7yIEEdeus4qiqqx0eLsmGPQcv5BTqX
	gIvaAIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwx1U-0000000CMAL-2Z6h;
	Mon, 02 Mar 2026 06:44:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwx1R-0000000CM7h-1AIC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 06:44:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A1DB1596;
	Sun,  1 Mar 2026 22:44:45 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C2EF63F7BD;
	Sun,  1 Mar 2026 22:44:49 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: [PATCH V2 2/2] arm64/mm: Directly use TTBRx_EL1_CnP
Date: Mon,  2 Mar 2026 06:44:37 +0000
Message-Id: <20260302064437.2791034-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260302064437.2791034-1-anshuman.khandual@arm.com>
References: <20260302064437.2791034-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_224453_444235_4CEF64F0 
X-CRM114-Status: GOOD (  13.19  )
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

Replace all TTBR_CNP_BIT macro instances with TTBRx_EL1_CNP_BIT which
is a standard field from tools sysreg format. Drop the now redundant
custom macro TTBR_CNP_BIT. No functional change.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kvmarm@lists.linux.dev
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable-hwdef.h | 2 --
 arch/arm64/kernel/mte.c                | 4 ++--
 arch/arm64/kvm/hyp/nvhe/hyp-init.S     | 4 ++--
 arch/arm64/mm/context.c                | 2 +-
 arch/arm64/mm/mmu.c                    | 2 +-
 5 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index d49180bb7cb3..5e6809a462c7 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -223,8 +223,6 @@
  */
 #define S1_TABLE_AP		(_AT(pmdval_t, 3) << 61)
 
-#define TTBR_CNP_BIT		(UL(1) << 0)
-
 /*
  * TCR flags.
  */
diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 32148bf09c1d..eceead1686f2 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -315,8 +315,8 @@ void mte_cpu_setup(void)
 	 * CnP is not a boot feature so MTE gets enabled before CnP, but let's
 	 * make sure that is the case.
 	 */
-	BUG_ON(read_sysreg(ttbr0_el1) & TTBR_CNP_BIT);
-	BUG_ON(read_sysreg(ttbr1_el1) & TTBR_CNP_BIT);
+	BUG_ON(read_sysreg(ttbr0_el1) & TTBRx_EL1_CnP);
+	BUG_ON(read_sysreg(ttbr1_el1) & TTBRx_EL1_CnP);
 
 	/* Normal Tagged memory type at the corresponding MAIR index */
 	sysreg_clear_set(mair_el1,
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 0d42eedc7167..445eb0743af2 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -130,7 +130,7 @@ SYM_CODE_START_LOCAL(___kvm_hyp_init)
 	ldr	x1, [x0, #NVHE_INIT_PGD_PA]
 	phys_to_ttbr x2, x1
 alternative_if ARM64_HAS_CNP
-	orr	x2, x2, #TTBR_CNP_BIT
+	orr	x2, x2, #TTBRx_EL1_CnP
 alternative_else_nop_endif
 	msr	ttbr0_el2, x2
 
@@ -291,7 +291,7 @@ SYM_TYPED_FUNC_START(__pkvm_init_switch_pgd)
 	/* Install the new pgtables */
 	phys_to_ttbr x5, x0
 alternative_if ARM64_HAS_CNP
-	orr	x5, x5, #TTBR_CNP_BIT
+	orr	x5, x5, #TTBRx_EL1_CnP
 alternative_else_nop_endif
 	msr	ttbr0_el2, x5
 
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 718c495832d0..0f4a28b87469 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -354,7 +354,7 @@ void cpu_do_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm)
 
 	/* Skip CNP for the reserved ASID */
 	if (system_supports_cnp() && asid)
-		ttbr0 |= TTBR_CNP_BIT;
+		ttbr0 |= TTBRx_EL1_CnP;
 
 	/* SW PAN needs a copy of the ASID in TTBR0 for entry */
 	if (IS_ENABLED(CONFIG_ARM64_SW_TTBR0_PAN))
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a6a00accf4f9..c22678769c37 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2188,7 +2188,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
 	phys_addr_t ttbr1 = phys_to_ttbr(virt_to_phys(pgdp));
 
 	if (cnp)
-		ttbr1 |= TTBR_CNP_BIT;
+		ttbr1 |= TTBRx_EL1_CnP;
 
 	replace_phys = (void *)__pa_symbol(idmap_cpu_replace_ttbr1);
 
-- 
2.30.2


