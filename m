Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C670C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJ9+VwJc5+foS9GrwZSfngya9vpuQzk7Jh3nW8pcrb4=; b=BRG5YaYiaCpFQIl/V+OnSgl7IZ
	ftVLn8V4nuFXJo/AlrhbbUZZyIqrByjYjbCfVqccnW/c9XCBQXbUICoubj/gGRGzENzmJIJ0tXuaE
	3/E7wAf+tmDlSF4qSiXZRvwQ9P0WxzkLRfuJhecj1+koYbiEGpkq4dvF4Is9xdEmD9Bor9ehyvy+I
	EGR+Ir3+kYKdLS6TiqjGqiCP95+d7GzsuYA6IKDjL3iIYTP5SAPYXNUMcF/7mUKNrWL1VGvFPKhH1
	Ey4XXH+PmeqA17vqUdNPMVgF/rno000KthL4w25s54TILAabB0Azs7nzvzz0Ahk+dyw0nlLuOJS0I
	9nBRvsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNr0z-00000001YVN-1JOf;
	Sat, 07 Jun 2025 10:43:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqyo-00000001YOZ-1TR7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 10:40:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE579A50A3E;
	Sat,  7 Jun 2025 10:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53668C4CEE4;
	Sat,  7 Jun 2025 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749292848;
	bh=eWu4R/aeGRLfrKZIE7FEYm2z8GGKF6eg/OFYcB5PEL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fMQgjZCC4sOWlzI3AYAVNiE9UyxRgJ1+TKKAVWaIrI658rhXPKF/pvc+pJ2kc5ftE
	 BvM0yrmzknDZgZSDOpuRh72NWnXj0p9J0/lp0VCxCKzakuWC8Hxty/FpUii+dmFX8N
	 Gg382+7n2CPi2I/orJLMIaNXuqsK5jfv64HH7R472DWJZIWnmmjAosSgBG25AvxMBF
	 1QlYvy7KCwA1eTXJaCIFWxWDeXv/1oT70ix37GgfefTUO4U/uSQuSpoET8qwUGEYdQ
	 vcxlqHIYzoKcV2p4s06cPwdMFLAl3+b6YAiojIAS4Ae/74vu5IXA6AgGYhjyRPwlZE
	 LlfaTAoh6Z0LA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uNqyk-004o03-HI;
	Sat, 07 Jun 2025 11:40:46 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH 1/2] arm64: Remove .inst workarounds after binutils bump
Date: Sat,  7 Jun 2025 11:40:40 +0100
Message-Id: <20250607104041.1406771-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250607104041.1406771-1-maz@kernel.org>
References: <20250607104041.1406771-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, ardb@kernel.org, arnd@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_034050_543675_74D9E90A 
X-CRM114-Status: GOOD (  15.09  )
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

Binutils version up to (and including) 2.25 have a pathological
behaviour when it comes to mixing .inst directive and arithmetic
involving labels. The assembler complains about non-constant
expressions and compilation stops pretty quickly.

Now that our base binutils version is 2.30, we can drop the hackish
workarounds we had in both the alternative and sysreg code.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/Kconfig                          |  3 ---
 arch/arm64/Makefile                         |  4 ---
 arch/arm64/include/asm/alternative-macros.h | 28 ++++++++-------------
 arch/arm64/include/asm/sysreg.h             | 21 ----------------
 tools/arch/arm64/include/asm/sysreg.h       | 21 ----------------
 5 files changed, 11 insertions(+), 66 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af3371..95697700f1992 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -404,9 +404,6 @@ config ARCH_SUPPORTS_UPROBES
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
 
-config BROKEN_GAS_INST
-	def_bool !$(as-instr,1:\n.inst 0\n.rept . - 1b\n\nnop\n.endr\n)
-
 config BUILTIN_RETURN_ADDRESS_STRIPS_PAC
 	bool
 	# Clang's __builtin_return_address() strips the PAC since 12.0.0
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 73a10f65ce8bc..212bf394ea43f 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -29,10 +29,6 @@ cc_has_k_constraint := $(call try-run,echo				\
 		return 0;						\
 	}' | $(CC) -S -x c -o "$$TMP" -,,-DCONFIG_CC_HAS_K_CONSTRAINT=1)
 
-ifeq ($(CONFIG_BROKEN_GAS_INST),y)
-$(warning Detected assembler with broken .inst; disassembly will be unreliable)
-endif
-
 # The GCC option -ffreestanding is required in order to compile code containing
 # ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
 CC_FLAGS_FPU	:= -ffreestanding
diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
index c8c77f9e36d60..61c2cbe618b9f 100644
--- a/arch/arm64/include/asm/alternative-macros.h
+++ b/arch/arm64/include/asm/alternative-macros.h
@@ -40,17 +40,6 @@
 /*
  * alternative assembly primitive:
  *
- * If any of these .org directive fail, it means that insn1 and insn2
- * don't have the same length. This used to be written as
- *
- * .if ((664b-663b) != (662b-661b))
- * 	.error "Alternatives instruction length mismatch"
- * .endif
- *
- * but most assemblers die if insn1 or insn2 have a .inst. This should
- * be fixed in a binutils release posterior to 2.25.51.0.2 (anything
- * containing commit 4e4d08cf7399b606 or c1baaddf8861).
- *
  * Alternatives with callbacks do not generate replacement instructions.
  */
 #define __ALTERNATIVE_CFG(oldinstr, newinstr, cpucap, cfg_enabled)	\
@@ -65,8 +54,9 @@
 	"663:\n\t"							\
 	newinstr "\n"							\
 	"664:\n\t"							\
-	".org	. - (664b-663b) + (662b-661b)\n\t"			\
-	".org	. - (662b-661b) + (664b-663b)\n\t"			\
+	".if ((664b-663b) != (662b-661b))\n"				\
+	".error \"Alternatives instruction length mismatch\"\n"		\
+	".endif\n"							\
 	".previous\n"							\
 	".endif\n"
 
@@ -99,6 +89,12 @@
 	.byte \alt_len
 .endm
 
+.macro check_alternative_sizes
+	.if ((664b-663b) != (662b-661b))
+	.error "Alternatives instruction length mismatch"
+	.endif
+.endm
+
 .macro alternative_insn insn1, insn2, cap, enable = 1
 	.if \enable
 661:	\insn1
@@ -107,8 +103,7 @@
 	.popsection
 	.subsection 1
 663:	\insn2
-664:	.org	. - (664b-663b) + (662b-661b)
-	.org	. - (662b-661b) + (664b-663b)
+664:	check_alternative_sizes
 	.previous
 	.endif
 .endm
@@ -179,8 +174,7 @@
  */
 .macro alternative_endif
 664:
-	.org	. - (664b-663b) + (662b-661b)
-	.org	. - (662b-661b) + (664b-663b)
+	check_alternative_sizes
 	.if .Lasm_alt_mode==0
 	.previous
 	.endif
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index f1bb0d10c39a3..42084cdd3fce8 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -50,8 +50,6 @@
 #define sys_reg_CRm(id)	(((id) >> CRm_shift) & CRm_mask)
 #define sys_reg_Op2(id)	(((id) >> Op2_shift) & Op2_mask)
 
-#ifndef CONFIG_BROKEN_GAS_INST
-
 #ifdef __ASSEMBLY__
 // The space separator is omitted so that __emit_inst(x) can be parsed as
 // either an assembler directive or an assembler macro argument.
@@ -60,25 +58,6 @@
 #define __emit_inst(x)			".inst " __stringify((x)) "\n\t"
 #endif
 
-#else  /* CONFIG_BROKEN_GAS_INST */
-
-#ifndef CONFIG_CPU_BIG_ENDIAN
-#define __INSTR_BSWAP(x)		(x)
-#else  /* CONFIG_CPU_BIG_ENDIAN */
-#define __INSTR_BSWAP(x)		((((x) << 24) & 0xff000000)	| \
-					 (((x) <<  8) & 0x00ff0000)	| \
-					 (((x) >>  8) & 0x0000ff00)	| \
-					 (((x) >> 24) & 0x000000ff))
-#endif	/* CONFIG_CPU_BIG_ENDIAN */
-
-#ifdef __ASSEMBLY__
-#define __emit_inst(x)			.long __INSTR_BSWAP(x)
-#else  /* __ASSEMBLY__ */
-#define __emit_inst(x)			".long " __stringify(__INSTR_BSWAP(x)) "\n\t"
-#endif	/* __ASSEMBLY__ */
-
-#endif	/* CONFIG_BROKEN_GAS_INST */
-
 /*
  * Instructions for modifying PSTATE fields.
  * As per Arm ARM for v8-A, Section "C.5.1.3 op0 == 0b00, architectural hints,
diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
index 690b6ebd118f4..58aebe6e65da5 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -49,8 +49,6 @@
 #define sys_reg_CRm(id)	(((id) >> CRm_shift) & CRm_mask)
 #define sys_reg_Op2(id)	(((id) >> Op2_shift) & Op2_mask)
 
-#ifndef CONFIG_BROKEN_GAS_INST
-
 #ifdef __ASSEMBLY__
 // The space separator is omitted so that __emit_inst(x) can be parsed as
 // either an assembler directive or an assembler macro argument.
@@ -59,25 +57,6 @@
 #define __emit_inst(x)			".inst " __stringify((x)) "\n\t"
 #endif
 
-#else  /* CONFIG_BROKEN_GAS_INST */
-
-#ifndef CONFIG_CPU_BIG_ENDIAN
-#define __INSTR_BSWAP(x)		(x)
-#else  /* CONFIG_CPU_BIG_ENDIAN */
-#define __INSTR_BSWAP(x)		((((x) << 24) & 0xff000000)	| \
-					 (((x) <<  8) & 0x00ff0000)	| \
-					 (((x) >>  8) & 0x0000ff00)	| \
-					 (((x) >> 24) & 0x000000ff))
-#endif	/* CONFIG_CPU_BIG_ENDIAN */
-
-#ifdef __ASSEMBLY__
-#define __emit_inst(x)			.long __INSTR_BSWAP(x)
-#else  /* __ASSEMBLY__ */
-#define __emit_inst(x)			".long " __stringify(__INSTR_BSWAP(x)) "\n\t"
-#endif	/* __ASSEMBLY__ */
-
-#endif	/* CONFIG_BROKEN_GAS_INST */
-
 /*
  * Instructions for modifying PSTATE fields.
  * As per Arm ARM for v8-A, Section "C.5.1.3 op0 == 0b00, architectural hints,
-- 
2.39.2


