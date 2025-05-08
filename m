Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397C0C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 04:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o4KqX7P+h7Z5ErpaVh8/xf4UwA6O9To0gC4tmTaqBYI=; b=MI54Qn5zGTjDm8
	dG1eKNh7HOIeIx49/KZLBkNDGLDX81lD6wW8YqfDkgnwDCkx3hESuwAEUlLS1VX/Asw9OLF3sgWXa
	/hNUs8zXP6fPdjljne3F87AwRjG3GfihAyvCyatl5ZvgchtzxTvYxd0O3fV0vV2LT8Ek6i6uw8teD
	r+6plJuNcXcZykt2rNSfm4QDHMRVIT+RrVUXyMf1YcXseNE8j1Ou1IOI79wAAj+RY343SolszVV9u
	gQ6yk03PNC5ME0pK+JqxPltdbp/BBXEuKSCrViejHexSnkici9iViY3ZFQWybBsC69FUtXPz3ki5b
	R2442iUpPflv/l+nOPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtER-0000000HJ1B-3b9F;
	Thu, 08 May 2025 04:51:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtAx-0000000HIjY-1ngJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 04:48:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F3AC106F;
	Wed,  7 May 2025 21:47:50 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.54.182])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 069383F5A1;
	Wed,  7 May 2025 21:47:57 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2] arm64/debug: Drop redundant DBG_MDSCR_* macros
Date: Thu,  8 May 2025 10:17:52 +0530
Message-Id: <20250508044752.234543-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_214803_554504_5D3B007B 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

MDSCR_EL1 has already been defined in tools sysreg format and hence can be
used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
macros become redundant and hence can be dropped off completely. While here
convert all variables handling MDSCR_EL1 register as u64 which reflects its
true width as well.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.15-rc5

Changes in V2:

- Changed reg, val width to u64 in cortex_a76_erratum_1463225_svc_handler() per Ada
- Changed mdscr register width to uint64_t in enable_monitor_debug_exceptions() and
  install_ss() per Ada
    
Changes in V1:

https://lore.kernel.org/all/20250417105253.3188976-1-anshuman.khandual@arm.com/

 arch/arm64/include/asm/assembler.h            |  4 ++--
 arch/arm64/include/asm/debug-monitors.h       |  6 -----
 arch/arm64/kernel/debug-monitors.c            | 22 +++++++++----------
 arch/arm64/kernel/entry-common.c              |  4 ++--
 .../selftests/kvm/arm64/debug-exceptions.c    |  4 ++--
 5 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index ad63457a05c5..f229d96616e5 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -53,7 +53,7 @@
 	.macro	disable_step_tsk, flgs, tmp
 	tbz	\flgs, #TIF_SINGLESTEP, 9990f
 	mrs	\tmp, mdscr_el1
-	bic	\tmp, \tmp, #DBG_MDSCR_SS
+	bic	\tmp, \tmp, #MDSCR_EL1_SS
 	msr	mdscr_el1, \tmp
 	isb	// Take effect before a subsequent clear of DAIF.D
 9990:
@@ -63,7 +63,7 @@
 	.macro	enable_step_tsk, flgs, tmp
 	tbz	\flgs, #TIF_SINGLESTEP, 9990f
 	mrs	\tmp, mdscr_el1
-	orr	\tmp, \tmp, #DBG_MDSCR_SS
+	orr	\tmp, \tmp, #MDSCR_EL1_SS
 	msr	mdscr_el1, \tmp
 9990:
 	.endm
diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
index 8f6ba31b8658..1f37dd01482b 100644
--- a/arch/arm64/include/asm/debug-monitors.h
+++ b/arch/arm64/include/asm/debug-monitors.h
@@ -13,14 +13,8 @@
 #include <asm/ptrace.h>
 
 /* Low-level stepping controls. */
-#define DBG_MDSCR_SS		(1 << 0)
 #define DBG_SPSR_SS		(1 << 21)
 
-/* MDSCR_EL1 enabling bits */
-#define DBG_MDSCR_KDE		(1 << 13)
-#define DBG_MDSCR_MDE		(1 << 15)
-#define DBG_MDSCR_MASK		~(DBG_MDSCR_KDE | DBG_MDSCR_MDE)
-
 #define	DBG_ESR_EVT(x)		(((x) >> 27) & 0x7)
 
 /* AArch64 */
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 58f047de3e1c..08f1d02507cd 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -34,7 +34,7 @@ u8 debug_monitors_arch(void)
 /*
  * MDSCR access routines.
  */
-static void mdscr_write(u32 mdscr)
+static void mdscr_write(u64 mdscr)
 {
 	unsigned long flags;
 	flags = local_daif_save();
@@ -43,7 +43,7 @@ static void mdscr_write(u32 mdscr)
 }
 NOKPROBE_SYMBOL(mdscr_write);
 
-static u32 mdscr_read(void)
+static u64 mdscr_read(void)
 {
 	return read_sysreg(mdscr_el1);
 }
@@ -79,16 +79,16 @@ static DEFINE_PER_CPU(int, kde_ref_count);
 
 void enable_debug_monitors(enum dbg_active_el el)
 {
-	u32 mdscr, enable = 0;
+	u64 mdscr, enable = 0;
 
 	WARN_ON(preemptible());
 
 	if (this_cpu_inc_return(mde_ref_count) == 1)
-		enable = DBG_MDSCR_MDE;
+		enable = MDSCR_EL1_MDE;
 
 	if (el == DBG_ACTIVE_EL1 &&
 	    this_cpu_inc_return(kde_ref_count) == 1)
-		enable |= DBG_MDSCR_KDE;
+		enable |= MDSCR_EL1_KDE;
 
 	if (enable && debug_enabled) {
 		mdscr = mdscr_read();
@@ -100,16 +100,16 @@ NOKPROBE_SYMBOL(enable_debug_monitors);
 
 void disable_debug_monitors(enum dbg_active_el el)
 {
-	u32 mdscr, disable = 0;
+	u64 mdscr, disable = 0;
 
 	WARN_ON(preemptible());
 
 	if (this_cpu_dec_return(mde_ref_count) == 0)
-		disable = ~DBG_MDSCR_MDE;
+		disable = ~MDSCR_EL1_MDE;
 
 	if (el == DBG_ACTIVE_EL1 &&
 	    this_cpu_dec_return(kde_ref_count) == 0)
-		disable &= ~DBG_MDSCR_KDE;
+		disable &= ~MDSCR_EL1_KDE;
 
 	if (disable) {
 		mdscr = mdscr_read();
@@ -415,7 +415,7 @@ void kernel_enable_single_step(struct pt_regs *regs)
 {
 	WARN_ON(!irqs_disabled());
 	set_regs_spsr_ss(regs);
-	mdscr_write(mdscr_read() | DBG_MDSCR_SS);
+	mdscr_write(mdscr_read() | MDSCR_EL1_SS);
 	enable_debug_monitors(DBG_ACTIVE_EL1);
 }
 NOKPROBE_SYMBOL(kernel_enable_single_step);
@@ -423,7 +423,7 @@ NOKPROBE_SYMBOL(kernel_enable_single_step);
 void kernel_disable_single_step(void)
 {
 	WARN_ON(!irqs_disabled());
-	mdscr_write(mdscr_read() & ~DBG_MDSCR_SS);
+	mdscr_write(mdscr_read() & ~MDSCR_EL1_SS);
 	disable_debug_monitors(DBG_ACTIVE_EL1);
 }
 NOKPROBE_SYMBOL(kernel_disable_single_step);
@@ -431,7 +431,7 @@ NOKPROBE_SYMBOL(kernel_disable_single_step);
 int kernel_active_single_step(void)
 {
 	WARN_ON(!irqs_disabled());
-	return mdscr_read() & DBG_MDSCR_SS;
+	return mdscr_read() & MDSCR_EL1_SS;
 }
 NOKPROBE_SYMBOL(kernel_active_single_step);
 
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index b260ddc4d3e9..34d9205b4764 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -344,7 +344,7 @@ static DEFINE_PER_CPU(int, __in_cortex_a76_erratum_1463225_wa);
 
 static void cortex_a76_erratum_1463225_svc_handler(void)
 {
-	u32 reg, val;
+	u64 reg, val;
 
 	if (!unlikely(test_thread_flag(TIF_SINGLESTEP)))
 		return;
@@ -354,7 +354,7 @@ static void cortex_a76_erratum_1463225_svc_handler(void)
 
 	__this_cpu_write(__in_cortex_a76_erratum_1463225_wa, 1);
 	reg = read_sysreg(mdscr_el1);
-	val = reg | DBG_MDSCR_SS | DBG_MDSCR_KDE;
+	val = reg | MDSCR_EL1_SS | MDSCR_EL1_KDE;
 	write_sysreg(val, mdscr_el1);
 	asm volatile("msr daifclr, #8");
 	isb();
diff --git a/tools/testing/selftests/kvm/arm64/debug-exceptions.c b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
index c7fb55c9135b..e34963956fbc 100644
--- a/tools/testing/selftests/kvm/arm64/debug-exceptions.c
+++ b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
@@ -140,7 +140,7 @@ static void enable_os_lock(void)
 
 static void enable_monitor_debug_exceptions(void)
 {
-	uint32_t mdscr;
+	uint64_t mdscr;
 
 	asm volatile("msr daifclr, #8");
 
@@ -223,7 +223,7 @@ void install_hw_bp_ctx(uint8_t addr_bp, uint8_t ctx_bp, uint64_t addr,
 
 static void install_ss(void)
 {
-	uint32_t mdscr;
+	uint64_t mdscr;
 
 	asm volatile("msr daifclr, #8");
 
-- 
2.25.1


