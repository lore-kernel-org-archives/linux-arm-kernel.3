Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C7CC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBbnBsoQOsqmQUWyzyFmTyl77XzI3l6yBgRmAehPfxk=; b=pkJn2l8iBU8n+KweTxERaAn9S+
	21b9YEd0xW+v/TXA/Ek36T+oE8FprIrOnFKQ13rYMzZBT3OFpGiJpSYvBhw19K5/7EFlYxyzsJT7H
	ieTbPRXLu1SbJMpJOZLNYcwlBTSl/qiTeYjiCtuEE/+9yPGTbeXho+VTTJrEhMsEFj9WP53VuFG5K
	mmYNTnpRkLzEygwacFyfXPgpY3S4nAO3z1ZR/VOGWaDdytRWsv38j1hhpveLhRyR7gLUsxDYEAkXE
	TWK9i0Va43KXp4VKd0tWdl3Q3HOaY3GbOzZDuY5bEfLSiMKZfzK+BaXLvFLCeyW3JuOX3PziSqWAT
	5ArLHIXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZxZ-0000000Emgx-0nF7;
	Fri, 18 Sep 2026 14:53:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZxD-0000000EmNL-1xek
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:52:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B4AE43BB2;
	Fri, 18 Sep 2026 14:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03171F00898;
	Fri, 18 Sep 2026 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743163;
	bh=xBbnBsoQOsqmQUWyzyFmTyl77XzI3l6yBgRmAehPfxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kmn6+DrCCo5LNkhZEzRRQp5BvAXFh/JTqdrVQI/FS4gan1XDFdtkJaaddDTpuJeLN
	 PGGoFTWlbzBEJFf01vdcrb8xir628jU6SlZp7EVFCEGVVBoRy5X29M9oYxVM4xEH7U
	 PWKLGopgQ0D8gMryeZgkP1InKVjXiqgqxnmgQR3uaToAFVlpXt2SUtony46upvLe6v
	 OqC75NTl6BzWciP0WaQLleCjqsekuxUyqD8AtHZSFq6vddL7eiTHzKbItDv8DyJRSi
	 LV63mEOZWkyjuKoyAYBKh7Fi1+2Q4nt5NYpFykuM2uffBH5Dg5qVvOSvzVTa5A98Jv
	 6rc2vV2XaG+5g==
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
Subject: [PATCH v3 06/13] arm64: assembler: Remove endianness helper macros
Date: Fri, 18 Sep 2026 15:52:08 +0100
Message-ID: <20260918145217.1669-7-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/assembler.h | 31 ------------------------------
 arch/arm64/kernel/head.S           |  3 +--
 2 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 0b58b550e8dc..42a167a75486 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -129,37 +129,6 @@ lr	.req	x30		// link register
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
2.55.0.1082.g2b9226bbc0-goog


