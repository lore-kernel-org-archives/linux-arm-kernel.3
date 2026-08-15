Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65BCC5DF6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 04:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdWP5M8fepkFBrH2JRckg07b+cTfpP4Tn08yEnDUFpM=; b=2Yi7WhDDofvwwaWJS+iDwARYSj
	zRPEdUxqU8t1nX1fvJdPNKlGzUfN6SVIj/t/GiMnMjzN/H6SYXuJ0UdP6JIyiouEIvHFuOlQLrm3b
	JW+Vzo5nlZVwT/Y59xFUl4N6jPkpJQXvCXfGBbvtU1wqkD33NsRlfRmFcAKGceA9+cN6vWT7V35Pb
	qtjTrB3gylw7rZiuwS6YmrslgViBW1V2gAiu6kmYRTHpjat7oHaxiOQ9mIhtvll6NVhJgCjhVVeKx
	aoCJH/bM7F9swaOvy1JB26mULhKOQaYW5DsTET3vVylPcmjKOdVvVLot1A/B3rt3XDcdwJcTRHFdN
	nUeYhVzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HV-00000003V4R-08sF;
	Sat, 15 Aug 2026 04:46:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6HC-00000003Uxt-0PGQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 04:45:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EE4E60A92;
	Sat, 15 Aug 2026 04:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516991F00A3D;
	Sat, 15 Aug 2026 04:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786769144;
	bh=AdWP5M8fepkFBrH2JRckg07b+cTfpP4Tn08yEnDUFpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jtzxYTp79rvJ3tknzX5+zQxTKPH9Krwr573PMHQgZmdpOlgg1GNO3F1eDmEWlY6Rr
	 uoFCFPKhT7degHBRC2iEFsXSzeNaWB6mNK5RzFeSxHdY82X7XFH/7P/9XMzziK4nFZ
	 TR4lKjtMB62iLTvWr0SVkW0BrTAvZpw5XZxj5pfAweHVY3J+vXsgyqrBfQN7xnAx27
	 f7AUPu0KQ99r09GW/ASY+Ur9x9d5CXnehRTfU4/dqsdoxII1oPK6ihz9wsABReEs1D
	 gXjdyOT5UeAOSjZAq/P6iZb7frRN7sdRnfZ8ZYoLAIYmvbITLZwsEBgsTXpBcRkVxT
	 P79oyiedVRzeg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	live-patching@vger.kernel.org,
	Song Liu <song@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-toolchains@vger.kernel.org
Subject: [PATCH 03/12] arm64/bti: Fix BTI linker failures with long branches into .idmap.text
Date: Fri, 14 Aug 2026 21:45:20 -0700
Message-ID: <a9662e64de17882d2ef2401bad0d8172ef48bc4b.1786768375.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786768375.git.jpoimboe@kernel.org>
References: <cover.1786768375.git.jpoimboe@kernel.org>
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

On a kernel whose text exceeds the +/128MB direct branch range, the
linker inserts veneers.  With BTI enabled, the veneers' indirect branch
targets need a BTI landing pad, which not all functions have starting
with Clang 21 (and for all versions of GCC).

In such cases the linker can emit a second veneer close to the target
which has the landing pad along with a direct branch to the target.  But
a long branch to .idmap.text never gets one because it's missing the
executable section flag.

With the LLVM linker, it's a silent failure, presumably only discovered
by a BTI exception at runtime.  With the GNU linker it's even worse, as
it dereferences the missing stub/veneer group entry and seg faults (this
was how I discovered it).

Make sure the section is executable by adding the "x" flag to all the
creators of the input section.

Also manually add "bti c" to primary_entry() and enter_vhe(), otherwise
the linker-generated veneer page pushes the .idmap.text past its
asserted 4KB size:

  ld.bfd: ID map text too big or misaligned

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=34525
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/cpu-reset.S | 2 +-
 arch/arm64/kernel/head.S      | 7 ++++---
 arch/arm64/kernel/hyp-stub.S  | 1 +
 arch/arm64/kernel/sleep.S     | 2 +-
 arch/arm64/mm/proc.S          | 8 ++++----
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/cpu-reset.S b/arch/arm64/kernel/cpu-reset.S
index c87445dde6745..9943a7c70f6b0 100644
--- a/arch/arm64/kernel/cpu-reset.S
+++ b/arch/arm64/kernel/cpu-reset.S
@@ -14,7 +14,7 @@
 #include <asm/virt.h>
 
 .text
-.pushsection    .idmap.text, "a"
+.pushsection    .idmap.text, "ax"
 
 /*
  * cpu_soft_restart(el2_switch, entry, arg0, arg1, arg2)
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca8..541721488bef9 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -71,7 +71,7 @@
 
 	__EFI_PE_HEADER
 
-	.section ".idmap.text","a"
+	.section ".idmap.text","ax"
 
 	/*
 	 * The following callee saved general purpose registers are used on the
@@ -83,6 +83,7 @@
 	 *  x21        primary_entry() .. start_kernel()        FDT pointer passed at boot in x0
 	 */
 SYM_CODE_START(primary_entry)
+	bti	c
 	bl	record_mmu_state
 	bl	preserve_boot_args
 
@@ -251,7 +252,7 @@ SYM_FUNC_END(__primary_switched)
  * end early head section, begin head code that is also used for
  * hotplug and needs to have the same protections as the text region
  */
-	.section ".idmap.text","a"
+	.section ".idmap.text","ax"
 
 /*
  * Starting from EL2 or EL1, configure the CPU to execute at the highest
@@ -455,7 +456,7 @@ SYM_FUNC_END(set_cpu_boot_mode_flag)
  * Checks if the selected granule size is supported by the CPU.
  * If it isn't, park the CPU
  */
-	.section ".idmap.text","a"
+	.section ".idmap.text","ax"
 SYM_FUNC_START(__enable_mmu)
 	mrs	x3, ID_AA64MMFR0_EL1
 	ubfx	x3, x3, #ID_AA64MMFR0_EL1_TGRAN_SHIFT, 4
diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
index 37c6976e44a4c..5f9c5ffb4afc1 100644
--- a/arch/arm64/kernel/hyp-stub.S
+++ b/arch/arm64/kernel/hyp-stub.S
@@ -167,6 +167,7 @@ SYM_CODE_END(__finalise_el2)
 	.pushsection	.idmap.text, "ax"
 
 SYM_CODE_START_LOCAL(enter_vhe)
+	bti	c
 	// Invalidate TLBs before enabling the MMU
 	tlbi	vmalle1
 	dsb	nsh
diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index f093cdf71be11..dfb5b8bc8cdb5 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -97,7 +97,7 @@ SYM_FUNC_START(__cpu_suspend_enter)
 	ret
 SYM_FUNC_END(__cpu_suspend_enter)
 
-	.pushsection ".idmap.text", "a"
+	.pushsection ".idmap.text", "ax"
 SYM_CODE_START(cpu_resume)
 	mov	x0, xzr
 	bl	init_kernel_el
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 22866b49be372..b8ff93c748bf1 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -175,7 +175,7 @@ alternative_else_nop_endif
 SYM_FUNC_END(cpu_do_resume)
 #endif
 
-	.pushsection ".idmap.text", "a"
+	.pushsection ".idmap.text", "ax"
 
 .macro	__idmap_cpu_set_reserved_ttbr1, tmp1, tmp2
 	adrp	\tmp1, reserved_pg_dir
@@ -211,7 +211,7 @@ SYM_FUNC_ALIAS(__pi_idmap_cpu_replace_ttbr1, idmap_cpu_replace_ttbr1)
 #define KPTI_NG_PTE_FLAGS	(PTE_ATTRINDX(MT_NORMAL) | PTE_TYPE_PAGE | \
 				 PTE_AF | PTE_SHARED | PTE_UXN | PTE_WRITE)
 
-	.pushsection ".idmap.text", "a"
+	.pushsection ".idmap.text", "ax"
 
 	.macro	pte_to_phys, phys, pte
 	and	\phys, \pte, #PTE_ADDR_LOW
@@ -438,7 +438,7 @@ SYM_FUNC_END(idmap_kpti_install_ng_mappings)
 	.popsection
 #endif
 
-	.pushsection ".idmap.text", "a"
+	.pushsection ".idmap.text", "ax"
 SYM_TYPED_FUNC_START(wait_linear_map_split_to_ptes)
 	/* Must be same registers as in idmap_kpti_install_ng_mappings */
 	swapper_ttb	.req	x3
@@ -479,7 +479,7 @@ SYM_FUNC_END(wait_linear_map_split_to_ptes)
  * Output:
  *	Return in x0 the value of the SCTLR_EL1 register.
  */
-	.pushsection ".idmap.text", "a"
+	.pushsection ".idmap.text", "ax"
 SYM_FUNC_START(__cpu_setup)
 	tlbi	vmalle1				// Invalidate local TLB
 	dsb	nsh
-- 
2.55.0


