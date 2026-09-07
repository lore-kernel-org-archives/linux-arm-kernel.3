Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74200C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zll3jkAF+tLjIy1FB2YfJYKG7wnrj2w3ollIYbYKORY=; b=1bZsEiu8aifI+KeEc75LLNNwS4
	X4p7nCs5m2UoiN0OhXnzR37zjtX0siXJT6+2dyzcdx6d16ZipPNg6GwMzC0VHRGMRtjoXWP5mlR+r
	Ccl5F6e3aKdonzCB3jCTsy6RJgxwr3G5mDjDN/jntlJ4EC1x2RRai0G62SFjqKLJZLuAmt/yUZJVd
	TInUEKZIpB5FOh/OXk+Boz1nVV/GeO5/wVR+YpE4mu8x4ZTR5rTee9Vh4iexJyu/wPr5NHc5h/bs1
	b4NSQpPzsBCr7YD/iDU5e7xzMFqKklGZfdGgzt+/wxZTfiT9WOoXpMr6C7I8wHTuP8H4T3adCQmhA
	L1oNwuNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cM4-00000007K1k-2DmD;
	Mon, 07 Sep 2026 16:38:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cM3-00000007K0q-2S0m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:37:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B1FE601DE;
	Mon,  7 Sep 2026 16:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EF41F00A3E;
	Mon,  7 Sep 2026 16:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799078;
	bh=Zll3jkAF+tLjIy1FB2YfJYKG7wnrj2w3ollIYbYKORY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jf4xvxp7r/Z8Z39ZlKwoSaMvTsC0e+lKBYm3NWf/FPYaYgKfZMTNvmcic8JgOjGxd
	 vXb6tHu7nsCQ2xzwdo9tfZBWH4wRuj6AY2iNHfAY7OnduTVKH1wVcoQMgPYteqQAJ9
	 trYap4SyCn0zzjlJfJG4zUM/nvdatWZinV00zEnsu0Z7DyB3yjOT16oB6rSFGi49OF
	 JlnegUf/ULgd7lnDNOS8AqffgOpG7iFHQ5/tg/70iDMUYSAGqSW2MaRC5YRAc/5j1+
	 tnW0QXfIY1KVRARAnik6nY6uZjbL86G2yYCTTIE5I9omzuF10KyS22fYD3PK6Uq1V+
	 FbrQDX93yhOEA==
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
Subject: [PATCH v2 06/14] arm64: assembler: Remove endianness helper macros
Date: Mon,  7 Sep 2026 17:37:17 +0100
Message-ID: <20260907163726.17104-7-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907163726.17104-1-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog


