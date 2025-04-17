Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751A5C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cqsfCnsdqVDNm2R6Qq8NoZDEGeiGQvanaeRzvewneI4=; b=pMhYnzI0+xvm45
	Go7v+eDtKpXDV2bz6zzXm/UCS+HxNSyUkAqaCQXc0qMOfc6bEJqJjN6f4jMLe4f6T2S1+kFARBEql
	iOYEDu/4UAr1VMXShgYpCB5qRHGy4ptjl8oBKXqBCdt7HiLjyzzWcZof4afYkjW2BMN0NJgdAujwt
	JLzRbQdD2EFmSgPbIiZ/tEDxyL9YJ55t+Zi6huHZ+wbt2sraId+PB/RTMuZ8pAsArZfZLkqH9tEaK
	tnZWX5wiwKF8n7wch0Fk9MlzoaDAaSrittjR8nw6fKqRgcNWUmESyHgIwzEH7H571VYhRtK5UgPtq
	DSssdcnkHI68R3VQdtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5NBX-0000000CkkU-09X5;
	Thu, 17 Apr 2025 11:13:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Mrd-0000000ChUQ-3yv7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 10:53:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A75E31515;
	Thu, 17 Apr 2025 03:52:58 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.48.140])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B7813F59E;
	Thu, 17 Apr 2025 03:52:57 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: inux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64/debug: Drop redundant DBG_MDSCR_* macros
Date: Thu, 17 Apr 2025 16:22:53 +0530
Message-Id: <20250417105253.3188976-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_035302_081713_31A30B31 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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
This patch applies on v6.15-rc2

 arch/arm64/include/asm/assembler.h      |  4 ++--
 arch/arm64/include/asm/debug-monitors.h |  6 ------
 arch/arm64/kernel/debug-monitors.c      | 22 +++++++++++-----------
 arch/arm64/kernel/entry-common.c        |  2 +-
 4 files changed, 14 insertions(+), 20 deletions(-)

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
index b260ddc4d3e9..6dbfc1008007 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -354,7 +354,7 @@ static void cortex_a76_erratum_1463225_svc_handler(void)
 
 	__this_cpu_write(__in_cortex_a76_erratum_1463225_wa, 1);
 	reg = read_sysreg(mdscr_el1);
-	val = reg | DBG_MDSCR_SS | DBG_MDSCR_KDE;
+	val = reg | MDSCR_EL1_SS | MDSCR_EL1_KDE;
 	write_sysreg(val, mdscr_el1);
 	asm volatile("msr daifclr, #8");
 	isb();
-- 
2.25.1


