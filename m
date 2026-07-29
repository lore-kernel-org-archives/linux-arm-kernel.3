Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5802FC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4l4BnHw2qxdGwPOYqvmq1M1eVyFgdQYVQytkZNWLp0=; b=WdZzJXIulQ5Z+UFuToJZzXA1BQ
	58ZlP3GurQU7cX0Dbr0rssLHl1yy7EuRjA+ufGu2Ug27AHWofe7oB0PvdfAGmBUfScV6/sVWg8hpb
	2WAlSiDbDhvbrdp1sP3+wsRgJwqbJXE33wz3KaVJcl8f7rgKF4nhogUFkg8b0sG8KaULYewHdfcuX
	lKm2ZHasQFTk7tuMlDY0HgpbetJwsurdyAIsKS1M/n/789Te6KTkFb66TAwFUoCa4jwWw/ciIUIXn
	YHLE0jYYvLXwpEHKb+higL/Y20ENK95CUvbjjaIuyaAQMTND4mXoTKdxu3aypPv0izxMec4xX9ZR6
	WRIxpyUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Mm-00000007u1H-2G6Y;
	Wed, 29 Jul 2026 12:26:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3MO-00000007tia-3FlD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:26:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EE001688;
	Wed, 29 Jul 2026 05:26:03 -0700 (PDT)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 98C3B3F66F;
	Wed, 29 Jul 2026 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785327967; bh=9pt9F5ahtzBd14pRQkxk5jUbTZPc89HybW3uEpB8nXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ARmSwBGIrIjCTEepXWQvMyZHVXkAUESDhoa2ujc1AaA1CnmQ7bexwD4ti0KAPJMEM
	 TRKBTwFJ5EhUmuw6deN8IGfSU0Pd0uFAkLHBf65GI07C4mrnAEqGzzl2Y/Hh6mcqL0
	 bjgV3dzF5X+Ih/+wshUqRLsMTktj3pyW3cx3hiiE=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/17] arm64/mm: Enable 128 bit translation
Date: Wed, 29 Jul 2026 17:54:49 +0530
Message-ID: <20260729122452.3797443-15-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729122452.3797443-1-anshuman.khandual@arm.com>
References: <20260729122452.3797443-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_052608_932683_D93A9C8B 
X-CRM114-Status: GOOD (  14.75  )
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

All required changes to page table geometry and descriptor are now in place
for D128 translation to be enabled.

Since FEAT_D128 exclusively supports the permission indirection style for
page table entry permission management, given kernel compiled for FEAT_D128
requires both FEAT_S1PIE and FEAT_D128. If these architecture features are
not present during boot, the kernel panics just like it does when there is
a granule size mismatch. So added a new stuck CPU debug identifier for such
scenarios called CPU_STUCK_REASON_NO_D128.

TTBR0/1_EL1 and PAR_EL1 registers become 128 bit wide when D128 is enabled,
thus requiring MSRR/MRRS instructions for their updates. Because PA_BITS is
still capped at 52 bits, MRS/MSR instructions are currently sufficient for
the register accesses that basically operate on the lower 64 bits. Although
entire 128 bits for these registers get cleared during boot via MSRR.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/Makefile                |  4 ++++
 arch/arm64/include/asm/el2_setup.h |  9 +++++++++
 arch/arm64/include/asm/smp.h       |  1 +
 arch/arm64/kernel/head.S           | 12 ++++++++++++
 arch/arm64/mm/proc.S               | 23 +++++++++++++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 6b005c8fef70..12a6e62520e9 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -54,6 +54,10 @@ endif
 KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
 KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
 
+ifeq ($(CONFIG_ARM64_D128),y)
+KBUILD_AFLAGS	+= -march=armv9.3-a+d128
+endif
+
 # Avoid generating .eh_frame* sections.
 ifneq ($(CONFIG_UNWIND_TABLES),y)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index aa8ec9df8024..331e94381dd0 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -78,6 +78,15 @@
 	cbz	x0, .Lskip_hcrx_\@
 	mov_q	x0, (HCRX_EL2_MSCEn | HCRX_EL2_TCR2En | HCRX_EL2_EnFPM)
 
+#ifdef CONFIG_ARM64_D128
+	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
+	ubfx	x1, x1, #ID_AA64MMFR3_EL1_D128_SHIFT, #4
+	cbz	x1, .Lskip_d128_\@
+
+	orr	x0, x0, HCRX_EL2_D128En		// Disable MRRS/MSRR traps
+.Lskip_d128_\@:
+#endif
+
         /* Enable GCS if supported */
 	mrs_s	x1, SYS_ID_AA64PFR1_EL1
 	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 10ea4f543069..1dd675d2b84d 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -22,6 +22,7 @@
 
 #define CPU_STUCK_REASON_52_BIT_VA	(UL(1) << CPU_STUCK_REASON_SHIFT)
 #define CPU_STUCK_REASON_NO_GRAN	(UL(2) << CPU_STUCK_REASON_SHIFT)
+#define CPU_STUCK_REASON_NO_D128	(UL(3) << CPU_STUCK_REASON_SHIFT)
 
 #ifndef __ASSEMBLER__
 
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..4ad8047963ad 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -505,6 +505,18 @@ SYM_FUNC_START_LOCAL(__no_granule_support)
 	b	1b
 SYM_FUNC_END(__no_granule_support)
 
+#ifdef CONFIG_ARM64_D128
+SYM_FUNC_START(__no_d128_support)
+	/* Indicate that this CPU can't boot and is stuck in the kernel */
+	update_early_cpu_boot_status \
+		CPU_STUCK_IN_KERNEL | CPU_STUCK_REASON_NO_D128, x1, x2
+1:
+	wfe
+	wfi
+	b	1b
+SYM_FUNC_END(__no_d128_support)
+#endif
+
 SYM_FUNC_START_LOCAL(__primary_switch)
 	adrp	x1, reserved_pg_dir
 	adrp	x2, __pi_init_idmap_pg_dir
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 6db62d56e97e..5c8bfd56a781 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -541,7 +541,30 @@ alternative_else_nop_endif
 
 	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
 	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
+#ifdef CONFIG_ARM64_D128
+	cbnz	x1, .Lcheck_d128
+	bl	__no_d128_support
+.Lcheck_d128:
+	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
+	ubfx	x1, x1, #ID_AA64MMFR3_EL1_D128_SHIFT, #4
+	cbnz	x1, .Linit_d128
+	bl	__no_d128_support
+.Linit_d128:
+	/*
+	* Although the lower 64 bits in TTBRx_EL1 registers are now
+	* being used it is prudent to clear out the entire 128 bits
+	* just in case the kernel receives non-zero value in higher
+	* 64 bits from the EL3 which might corrupt the page tables.
+	*/
+	mov	x4, xzr
+	mov	x5, xzr
+
+	msrr	ttbr0_el1, x4, x5
+	msrr	ttbr1_el1, x4, x5
+	orr	tcr2, tcr2, #TCR2_EL1_D128
+#else
 	cbz	x1, .Lskip_indirection
+#endif
 
 	mov_q	x0, PIE_E0_ASM
 	msr	REG_PIRE0_EL1, x0
-- 
2.43.0


