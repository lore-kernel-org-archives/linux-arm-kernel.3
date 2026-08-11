Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD38FC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVtoFL/X2Cg8V2fpSt9ioOxaBxnq9YunbAkI7H2qxik=; b=PjnqwVmEGprdLxbrR2ha4nZwX8
	cLZGKTYy7gl6y4av/tyDmm4zzx95xPcsY+YwNQm+HyBp7HsPnnIRZLWfgUS7lWR6SFPLvGesEenf3
	aSsrlIW/BZwLexOafHZZRCYrst7Mw8qK2PsWKC4UrjeZrtVLgKKWjqwJ7iZhPDxQx9bc0xScCoezN
	ZjiNgIPZXzmFnZjTgVGYiyjqe90t2vmqCARa5mpenoyYTACQ06yVzwT4kN+CY61iePNYgtvBCkQJt
	yoPfXT/gquif/50fXFhrlEDTOlsrGgQYPgHFTBJsxjdYwMjYkChKzdHuaIm9v1J+emheT0BcSUC0a
	iQVt20wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn3J-0000000E9TR-45bn;
	Tue, 11 Aug 2026 14:02:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn3G-0000000E9Rl-1l6v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:01:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D870860A61;
	Tue, 11 Aug 2026 14:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369A01F00A3A;
	Tue, 11 Aug 2026 14:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456917;
	bh=OVtoFL/X2Cg8V2fpSt9ioOxaBxnq9YunbAkI7H2qxik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SpdsE61K1u0jLCWh6kUs1baLWdTEdZztiAz2wKLlQ00BASOUNsUVApf1NasS+wcra
	 e+9bAYX0iaUPE3tOXc69ijfVRge67ZBEssLsKc01W223y1huZVK8Cdtyu8SHkSIwM+
	 RyhlgqpnUgsdMHulcDvrVtUh4KS4VEjpO2IHkNf3HAnxBuXeGR3Jv1yU38uVZSR5lO
	 nUM8TWVsBflIBX0dsO3gIyd5uO3PZKlV0uYYmBl+p2jkuqWIy0mKUu8Uq/PPlfccZy
	 iFLeyn8Fwyxql88EK190MjZWqrbPem2af0oCXjXq1HrmfQtgGSNAGw443+m42MAEJC
	 t9jy0+xxQSttg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 06/12] arm64: assembler: Remove endianness helper macros
Date: Tue, 11 Aug 2026 15:01:25 +0100
Message-ID: <20260811140132.22778-7-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811140132.22778-1-will@kernel.org>
References: <20260811140132.22778-1-will@kernel.org>
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

The CPU_LE()/CPU_BE() helper macros are only used by head.S. Since
big-endian support depends on BROKEN, remove the last users along with
the macro definitions. The unused regs_to_64() assembly macro, which
somewhat bizarrely behaves differently depend on the endianness, is also
removed.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/assembler.h | 31 ------------------------------
 arch/arm64/kernel/head.S           |  3 +--
 2 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index effae53e9739..45279e577ff5 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -133,37 +133,6 @@ lr	.req	x30		// link register
 	b	\label
 	.endm
 
-/*
- * Select code when configured for BE.
- */
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define CPU_BE(code...) code
-#else
-#define CPU_BE(code...)
-#endif
-
-/*
- * Select code when configured for LE.
- */
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define CPU_LE(code...)
-#else
-#define CPU_LE(code...) code
-#endif
-
-/*
- * Define a macro that constructs a 64-bit value by concatenating two
- * 32-bit registers. Note that on big endian systems the order of the
- * registers is swapped.
- */
-#ifndef CONFIG_CPU_BIG_ENDIAN
-	.macro	regs_to_64, rd, lbits, hbits
-#else
-	.macro	regs_to_64, rd, hbits, lbits
-#endif
-	orr	\rd, \lbits, \hbits, lsl #32
-	.endm
-
 /*
  * Pseudo-ops for PC-relative adr/ldr/str <reg>, <symbol> where
  * <symbol> is within the range +/- 4 GB of the PC.
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..8951ce693552 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -138,8 +138,7 @@ SYM_CODE_START_LOCAL(record_mmu_state)
 	b.ne	0f
 	mrs	x19, sctlr_el2
 0:
-CPU_LE( tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
-CPU_BE( tbz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
+	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
 	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
 	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
 	csel	x19, xzr, x19, eq		// clear x19 if Z
-- 
2.55.0.679.g6767b8d81c-goog


