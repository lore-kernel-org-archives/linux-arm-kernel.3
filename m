Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDCDCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkEqpJkeo0d+Bt79cOK1uUetQ2OYv0MJp805ocnhHkw=; b=wd/rkBH0h/TigP/rhbWWp24/ix
	0k4bGGke8GSr2V6fMC2HJhSeFd+eE0gddO8AOV7P9QS7zbCT5jswAc+NjF3NJN40MIdyjLvxOBzWN
	ixKsIk1SsXeg++tqT6gypTyMy3x8K38TduaLF10OzAov+GkvJEDCIKDufNe7uC0+7OlhwnKZ3bw3a
	jC2PmN5rXCLGnGogp7eiCmo/9anh0+EEymCPMWiLw4p84QlZ/nhq7kcsri0Qe9//Zh2LsKBsA2tIl
	5REYAGBDUNxZK4HumC88bP3K7F8xAFRs2YmyEpEHXl0ovyvxYHmoolv8iv4HO2kb5FT9NLifz3f/V
	ts3vxhiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjRC-0000000EtBN-39Sn;
	Wed, 03 Jun 2026 11:07:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjR9-0000000Et7Q-2ePA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:07:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4396749FF;
	Wed,  3 Jun 2026 04:06:58 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6BBB93F86F;
	Wed,  3 Jun 2026 04:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484823; bh=1eQhgk72nu4iO7OJFT9TavJ4ZsTC0pyfvUy/bYwcXkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Twj3dJDJe/y8J5qBgH+0VOC30PNsTizjTwQ777dzjw0n++8GzDSTi3eVY6Am6n+sb
	 DWw3/GodMxNFMOBFnAKj2RFWqVcitQb54Wj347QpAmfRsrNCte4kAY0MoP7Q0to1xT
	 c2SV+fxf45EmdyPI8+ETuFenYBANOiEviO4nveQw=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	stable@vger.kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v4 10/20] arm64: fpsimd: Use assembler for baseline SME instructions
Date: Wed,  3 Jun 2026 12:06:20 +0100
Message-Id: <20260603110630.1027435-11-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260603110630.1027435-1-mark.rutland@arm.com>
References: <20260603110630.1027435-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040703_745002_A5C99430 
X-CRM114-Status: GOOD (  15.28  )
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

We currently support assemblers which do not support SME instructions,
and have macros to manually encode SME instructions. This was
necessary historically as SME support was developed before assembler
support was widely available, but things have changed:

* All currently supported versions of LLVM support baseline SME
  instructions. Building the kernel requires LLVM 15+, while LLVM 13+
  supports SME.

* GNU binutils has supported baseline SME instructions since 2.38, which
  was released on 09 February 2022. Toolchains using this or later are
  widely available. For example Debian 12 (released on 10 June 2023)
  provides binutils 2.40. Toolchains provided kernel.org provide
  binutils 2.38+ since the GCC 12.1.0 release (released between 06 May
  2022 and 17 August 2022).

* For various reasons, SME support was marked as BROKEN, and re-enabled
  in v6.16 (released on 27 July 2025). The earliest support LTS kernel
  with SME support is v6.18.y, v6.18 was tagged on 30 November 2025, and
  contemporary toolchains (GCC 15.2 and binutils 2.45) supported
  baseline SME instructions.

* Any distribution which intends to support SME will presumably have a
  toolchain that supports baseline SME instructions such that userspace
  can be built.

Considering the above, there's no practical benefit to allowing SME to
be built when the toolchain doesn't support baseline SME instructions.

Make CONFIG_ARM64_SME depend on assembler support for SME, and remove
the manual encoding of SME instructions. The various _sme_<insn> macros
are kept for now, and will be cleaned up in subsequent patches.

A couple of SME2 instructions require a more recent toolchain, and are
left as-is for now. I've looked through releases of binutils and LLVM to
find when support was added, and noted this in a comment.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig                    |  5 ++++
 arch/arm64/include/asm/fpsimdmacros.h | 38 +++++++++++----------------
 2 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943b..378e50fef247a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2247,10 +2247,15 @@ config ARM64_SVE
 	  booting the kernel.  If unsure and you are not observing these
 	  symptoms, you should assume that it is safe to say Y.
 
+config AS_HAS_SME
+	# Supported by LLVM 13+ and binutils 2.38+
+	def_bool $(as-instr,.arch_extension sme)
+
 config ARM64_SME
 	bool "ARM Scalable Matrix Extension support"
 	default y
 	depends on ARM64_SVE
+	depends on AS_HAS_SME
 	help
 	  The Scalable Matrix Extension (SME) is an extension to the AArch64
 	  execution state which utilises a substantial subset of the SVE
diff --git a/arch/arm64/include/asm/fpsimdmacros.h b/arch/arm64/include/asm/fpsimdmacros.h
index 4ba23e493cb69..4a9bf46e52913 100644
--- a/arch/arm64/include/asm/fpsimdmacros.h
+++ b/arch/arm64/include/asm/fpsimdmacros.h
@@ -149,46 +149,38 @@
 	pfalse	p\np\().b
 .endm
 
-/* SME instruction encodings for non-SME-capable assemblers */
-/* (pre binutils 2.38/LLVM 13) */
+/* Deprecated macros for SME instructions */
 
 /* RDSVL X\nx, #\imm */
 .macro _sme_rdsvl nx, imm
-	_check_general_reg \nx
-	_check_num (\imm), -0x20, 0x1f
-	.inst	0x04bf5800			\
-		| (\nx)				\
-		| (((\imm) & 0x3f) << 5)
+	.arch_extension sme
+	rdsvl x\nx, #\imm
 .endm
 
 /*
  * STR (vector from ZA array):
- *	STR ZA[\nw, #\offset], [X\nxbase, #\offset, MUL VL]
+ *	STR ZA[W\nw, #\offset], [X\nxbase, #\offset, MUL VL]
  */
 .macro _sme_str_zav nw, nxbase, offset=0
-	_sme_check_wv \nw
-	_check_general_reg \nxbase
-	_check_num (\offset), -0x100, 0xff
-	.inst	0xe1200000			\
-		| (((\nw) & 3) << 13)		\
-		| ((\nxbase) << 5)		\
-		| ((\offset) & 7)
+	.arch_extension sme
+	str	za[w\nw, #\offset], [x\nxbase, #\offset, MUL VL]
 .endm
 
 /*
  * LDR (vector to ZA array):
- *	LDR ZA[\nw, #\offset], [X\nxbase, #\offset, MUL VL]
+ *	LDR ZA[w\nw, #\offset], [X\nxbase, #\offset, MUL VL]
  */
 .macro _sme_ldr_zav nw, nxbase, offset=0
-	_sme_check_wv \nw
-	_check_general_reg \nxbase
-	_check_num (\offset), -0x100, 0xff
-	.inst	0xe1000000			\
-		| (((\nw) & 3) << 13)		\
-		| ((\nxbase) << 5)		\
-		| ((\offset) & 7)
+	.arch_extension sme
+	ldr	za[w\nw, #\offset], [x\nxbase, #\offset, MUL VL]
 .endm
 
+/*
+ * SME2 instruction encodings for older assemblers.
+ * Supported by binutils 2.41+.
+ * Supported by LLVM 16+
+ */
+
 /*
  * LDR (ZT0)
  *
-- 
2.30.2


