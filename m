Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77098CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 03:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnIwMEDz1qTDFDjs/OIC2pGmm2uwXLmKbBPOoO7YT7k=; b=3ZxVtpHa3LAgaYsH3E2e9OyXpj
	04YWWqL36uDk9VXeJLP//fBIeFi7NTIWR75xRpRvV+VY2yN/FcUHy2K0s+mhYYG2H5HbxXVQqcy6Y
	xQCzuEetTekshR1DoNuu7hLVO4R1HAWqgS8Pk4sCdGiBuWDsRZF44BRvuFFK0bwi/PAK5EeXAaWvg
	/vXAg8XetOjD4iUCgMt+JvjX9/4OE7MJSa1vLdTU0wj+Zm1YrKkLPxwPsWZs1WTaQpOm72ZUI4Hvo
	LjJmzJTtX40An4nsdWHf32Z/PnjmFeteghFLJiZOSCPE8lV5tkPNhc1I5zynOLIWPwZ3mqOPEWH3n
	uDMD+RBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mr-000000013l9-0NZ9;
	Wed, 13 May 2026 03:34:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0Mj-000000013eX-1mm7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 03:34:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DCF0B60128;
	Wed, 13 May 2026 03:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46335C2BCFA;
	Wed, 13 May 2026 03:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778643272;
	bh=Ab2hQoImpnCesBxD7mSC6H2W3UbT0AZPaZqbzGazFII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LTOCjVpCjl9KwyWSki2aEgEylNyJ1o0zPJj19wM8xNi9yqDeQLZYo9yS/anZD6//6
	 Sk9KFdSblayCO9ZjJpR7OgXC25hdS3614+CFYV0AZeuCJ3K4XBoVUTvTRF20/TTzWA
	 OKEq3SFKPpekh/yHn7F3eSPHTmC/jZ/J3FkEpwqltWCUeJdTXYPe7LD/jBFwhr21/t
	 HlhanXoxgjhP2uP2Uc4gtkBaRWe08Xv09WQPs/4bC1wuNqsRQgAYVe4bQPMkLJGiK7
	 ypytQeY4yrCTWocStNcyjk2h+Xo43/5H2wFSscEQjdxLCs+wKnMFdxqtgdqkpkT8mv
	 lfAZoD3Xwq2rw==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Song Liu <song@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v3 04/21] arm64: Rename TRAMP_VALIAS -> TRAMP_VALIAS_ASM in asm-offsets
Date: Tue, 12 May 2026 20:33:38 -0700
Message-ID: <74623fad8c45d26a3da6c5420b00156d8f7c2150.1778642120.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778642120.git.jpoimboe@kernel.org>
References: <cover.1778642120.git.jpoimboe@kernel.org>
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
Message-ID: <20260513033338.41LW8CIRcLNtMnnnf33ZgjaugZrr5JQXP_WhDnDUe5Q@z>

Rename the asm-offsets TRAMP_VALIAS macro to TRAMP_VALIAS_ASM, following
the naming convention already used by PIE_E0_ASM and PIE_E1_ASM.  This
disambiguates the asm-offsets-generated constant from the C macro of the
same name defined in fixmap.h and vectors.h.

This is needed by a later patch which adds new includes to asm-offsets.c
that would otherwise conflict with the C version.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/arm64/kernel/asm-offsets.c | 2 +-
 arch/arm64/kernel/entry.S       | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index b6367ff3a49ca..44b92f582c127 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -153,7 +153,7 @@ int main(void)
   DEFINE(ARM64_FTR_SYSVAL,	offsetof(struct arm64_ftr_reg, sys_val));
   BLANK();
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
-  DEFINE(TRAMP_VALIAS,		TRAMP_VALIAS);
+  DEFINE(TRAMP_VALIAS_ASM,	TRAMP_VALIAS);
 #endif
 #ifdef CONFIG_ARM_SDE_INTERFACE
   DEFINE(SDEI_EVENT_INTREGS,	offsetof(struct sdei_registered_event, interrupted_regs));
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index d4cbdfb23d733..85f6305c1f568 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -102,7 +102,7 @@
 	.endm
 
 	.macro	tramp_alias, dst, sym
-	.set	.Lalias\@, TRAMP_VALIAS + \sym - .entry.tramp.text
+	.set	.Lalias\@, TRAMP_VALIAS_ASM + \sym - .entry.tramp.text
 	movz	\dst, :abs_g2_s:.Lalias\@
 	movk	\dst, :abs_g1_nc:.Lalias\@
 	movk	\dst, :abs_g0_nc:.Lalias\@
@@ -626,10 +626,10 @@ SYM_CODE_END(ret_to_user)
 #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1003
 alternative_if ARM64_WORKAROUND_QCOM_FALKOR_E1003
 	/* ASID already in \tmp[63:48] */
-	movk	\tmp, #:abs_g2_nc:(TRAMP_VALIAS >> 12)
-	movk	\tmp, #:abs_g1_nc:(TRAMP_VALIAS >> 12)
+	movk	\tmp, #:abs_g2_nc:(TRAMP_VALIAS_ASM >> 12)
+	movk	\tmp, #:abs_g1_nc:(TRAMP_VALIAS_ASM >> 12)
 	/* 2MB boundary containing the vectors, so we nobble the walk cache */
-	movk	\tmp, #:abs_g0_nc:((TRAMP_VALIAS & ~(SZ_2M - 1)) >> 12)
+	movk	\tmp, #:abs_g0_nc:((TRAMP_VALIAS_ASM & ~(SZ_2M - 1)) >> 12)
 	isb
 	tlbi	vae1, \tmp
 	dsb	nsh
-- 
2.53.0


