Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73BFC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 05:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rKXKiKxusagH0d2kb7gVCeTetEKAsWH0/C66SRxQLq8=; b=ZYfaoNkwPMwzLSiLAUqcPjQflj
	4vBFl1nP8+M0n+gKwglKSkISbQod7kxGy1EIsx010Dxn+kTltOQ85h2rHcjZU2UE7A9LPkZUeZMSv
	FrcYGR4bNYb5gSXybK/OHRG6a8VrWkb5JETmm6D7Mzy8G+TadG+3BOFV6LTh0fo7+Sk99sjfNNrZN
	Elgjo+lLXo86wMz70qsVPnCKZbZikkJACmUfnSS0Q1K1QLJOlbvRQNsrWcK66IHQdXvyZhz2+9Sk/
	b+crIr2RR2nPDLGR+sXWTbPyl6yAFGnylVrUDBvf8OMslACThRFCcoAs+zTLa16FBK0sevaBBBXzL
	IzONBLEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dBh-00000008MLj-1dzy;
	Tue, 29 Apr 2025 05:07:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9d9n-00000008MDy-1DWS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 05:05:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96D361515;
	Mon, 28 Apr 2025 22:05:15 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.52.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F3693F5A1;
	Mon, 28 Apr 2025 22:05:18 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3] arm64/mm: Re-organise setting up FEAT_S1PIE registers PIRE0_EL1 and PIR_EL1
Date: Tue, 29 Apr 2025 10:35:11 +0530
Message-Id: <20250429050511.1663235-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_220523_415311_1884A958 
X-CRM114-Status: GOOD (  11.15  )
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

mov_q cannot really move PIE_E[0|1] macros into a general purpose register
as expected if those macro constants contain some 128 bit layout elements,
that are required for D128 page tables. The primary issue is that for D128,
PIE_E[0|1] are defined in terms of 128-bit types with shifting and masking,
which the assembler can't accommodate.

Instead pre-calculate these PIRE0_EL1/PIR_EL1 constants into asm-offsets.h
based PIE_E0_ASM/PIE_E1_ASM which can then be used in arch/arm64/mm/proc.S.

While here also drop PTE_MAYBE_NG/PTE_MAYBE_SHARED assembly overrides which
are not required any longer, as the compiler toolchains are smart enough to
compute both the PIE_[E0|E1]_ASM constants in all scenarios.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.15-rc4

Changes in V3:

- Dropped off macros PTE_MAYBE_NG and PTE_MAYBE_SHARED as per Ryan

Changes in V2:

https://lore.kernel.org/all/20250416035604.2717188-1-anshuman.khandual@arm.com/

- Added asm-offsets.c based PIE_E0_ASM and PIE_E1_ASM symbols as per Ard
- Moved PTE_MAYBE_NG and PTE_MAYBE_SHARED overrides inside asm-offsets.c
  along with the corresponding comment as per Ard

Changes in V1:

https://lore.kernel.org/linux-arm-kernel/20250410074024.1545768-1-anshuman.khandual@arm.com/

 arch/arm64/kernel/asm-offsets.c |  2 ++
 arch/arm64/mm/proc.S            | 19 ++-----------------
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index eb1a840e4110..30d4bbe68661 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -182,5 +182,7 @@ int main(void)
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
   DEFINE(FTRACE_OPS_DIRECT_CALL,	offsetof(struct ftrace_ops, direct_call));
 #endif
+  DEFINE(PIE_E0_ASM, PIE_E0);
+  DEFINE(PIE_E1_ASM, PIE_E1);
   return 0;
 }
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index fb30c8804f87..80d470aa469d 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -512,26 +512,11 @@ alternative_else_nop_endif
 	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
 	cbz	x1, .Lskip_indirection
 
-	/*
-	 * The PROT_* macros describing the various memory types may resolve to
-	 * C expressions if they include the PTE_MAYBE_* macros, and so they
-	 * can only be used from C code. The PIE_E* constants below are also
-	 * defined in terms of those macros, but will mask out those
-	 * PTE_MAYBE_* constants, whether they are set or not. So #define them
-	 * as 0x0 here so we can evaluate the PIE_E* constants in asm context.
-	 */
-
-#define PTE_MAYBE_NG		0
-#define PTE_MAYBE_SHARED	0
-
-	mov_q	x0, PIE_E0
+	mov_q	x0, PIE_E0_ASM
 	msr	REG_PIRE0_EL1, x0
-	mov_q	x0, PIE_E1
+	mov_q	x0, PIE_E1_ASM
 	msr	REG_PIR_EL1, x0
 
-#undef PTE_MAYBE_NG
-#undef PTE_MAYBE_SHARED
-
 	orr	tcr2, tcr2, TCR2_EL1_PIE
 	msr	REG_TCR2_EL1, x0
 
-- 
2.25.1


