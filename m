Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFF5C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 03:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IHjokFECuKURgN69sQ89qCuiAI8kV82BRYg7ZgYLQh0=; b=Z0NvrBBVM+tYPjvTJ2txZ8O/vi
	4DvJU/NgZi9o9DtvjR+EPZf9eZigNaTnmtk4vB/KggRJAHCdz59R0n+tnAXDO0QCZfTfTTG+5Ot12
	F1TFfzEf15/K+y/zlQMLckR8PDFl+hfDaxliqbPT5iPhM2zb3E9l9bkAvMzjVs5A2kRlFhRIYc1PA
	83qWCTMNw878F+8qzM+NjrgiVoW8Zjz/1CU1oapt+9sPPgLzW2s1KSHlVmtK4n6+EUtDVeWtShZnj
	9Qn0iXIjXTzQQB0doTWq8sHkv3AEi34DypFRB7/1/uxDRxEFNZ7S3EAzLcd56aZvP2C2xV831/SyO
	PmtTVNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4tua-000000086K9-0RJ0;
	Wed, 16 Apr 2025 03:58:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4tsj-000000085wL-1Jh1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 03:56:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E9391516;
	Tue, 15 Apr 2025 20:56:09 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 339E53F694;
	Tue, 15 Apr 2025 20:56:08 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64/mm: Re-organise setting up FEAT_S1PIE registers PIRE0_EL1 and PIR_EL1
Date: Wed, 16 Apr 2025 09:26:04 +0530
Message-Id: <20250416035604.2717188-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_205613_439727_78987447 
X-CRM114-Status: GOOD (  12.14  )
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

While here also move PTE_MAYBE_NG/PTE_MAYBE_SHARED assembly overrides into
arch/arm64/kernel/asm-offsets.c to ensure PIRE0_EL1/PIR_EL1 are calculated
in assembly without arm64_use_ng_mappings and lpa2_is_enabled() symbols
being accessible. Also move the corresponding comment as well.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.15-rc2

Changes in V2:

- Added asm-offsets.c based PIE_E0_ASM and PIE_E1_ASM symbols as per Ard
- Moved PTE_MAYBE_NG and PTE_MAYBE_SHARED overrides inside asm-offsets.c
  along with the corresponding comment as per Ard

Changes in V1:

https://lore.kernel.org/linux-arm-kernel/20250410074024.1545768-1-anshuman.khandual@arm.com/

 arch/arm64/kernel/asm-offsets.c | 16 ++++++++++++++++
 arch/arm64/mm/proc.S            | 19 ++-----------------
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index eb1a840e4110..5b99a78f6882 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -182,5 +182,21 @@ int main(void)
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
   DEFINE(FTRACE_OPS_DIRECT_CALL,	offsetof(struct ftrace_ops, direct_call));
 #endif
+	/*
+	 * The PROT_* macros describing the various memory types may resolve to
+	 * C expressions if they include the PTE_MAYBE_* macros, and so they
+	 * can only be used from C code. The PIE_E* constants below are also
+	 * defined in terms of those macros, but will mask out those
+	 * PTE_MAYBE_* constants, whether they are set or not. So #define them
+	 * as 0x0 here so we can evaluate the PIE_E* constants in asm context.
+	 */
+#undef PTE_MAYBE_NG
+#define PTE_MAYBE_NG		0
+
+#undef PTE_MAYBE_SHARED
+#define PTE_MAYBE_SHARED	0
+
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


