Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8FEC79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJrqXzm1RgA1zc/T2scZywYeVxqva7PTGuSCFxHRGhQ=; b=J11o/cPiVg/CNF2a0VXRHvFy0w
	Tb0tys4sbIpybc/6zrgEMxu/2mMon12HUcJN6ALfRUjMNkY11bA7xWs3sremrFyLXPDBbLaQSbEIl
	IhMdYO8TZsLT/thnFlACRcgIWT89gN64qIjaeRz/ZF5WnjyCGOQXI0izsBqHJFlEa7Ku6qErJCw1O
	7QsgtB9Nfdtd5s/ckVwYCi76Pugmqy1K57EFXwbOsqg6k0sMSTuSqa0HlShW5bGVYEbosUEKS3h6L
	+EL9PRK+wjVmE2B1q5ve+r1SyrVHeVn0UezCscD7ZkKx89Ad0LEWIXvSpdqzShJYFr4//C22bLF9v
	DwbuxHlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cMM-00000007KKw-2hhM;
	Mon, 07 Sep 2026 16:38:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cMK-00000007KIj-3IOl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:38:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C098417E8;
	Mon,  7 Sep 2026 16:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B68B1F00AC4;
	Mon,  7 Sep 2026 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799096;
	bh=cJrqXzm1RgA1zc/T2scZywYeVxqva7PTGuSCFxHRGhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ir3y2FjAD4kEffnFLSp0BzrQ5G5MO5Cc/NdZaerNSQgN2sUO2a3qYvD/uhkkXlaRw
	 lUuqQI9JlbZVx2hqjitH60UOmJo4obI7OTFa8s7KzuINzGhPp8pV/+LkiKtvrKXxuS
	 RY0gUlh6flyXo2H3MlynsNwwY73dx7GR61EiSDYvTpfLyssJpYIbVKn5HMYXEitklr
	 iVxQC5UDMVR2ACHAi30NqMCTwgKs+85usUVnPc+QP9WUvyd8N0ZxoJpvFI9JCS1CGW
	 W+cugKLWwm9QavwEqLJWUdvoonSjFky0xKPLNqHqZmYzFCEE9F7jQONzdXgJuw3XiO
	 EdNKmFIXeBAfA==
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
Subject: [PATCH v2 12/14] arm64: image: Remove endianness handling for generating image header
Date: Mon,  7 Sep 2026 17:37:23 +0100
Message-ID: <20260907163726.17104-13-will@kernel.org>
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

Since big-endian support for arm64 depends on BROKEN, we don't need to
bother jumping through hoops to generate a little-endian kernel image
header for a big-endian target. We can just ignore the possibility
instead.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/assembler.h | 11 -----------
 arch/arm64/kernel/head.S           |  4 ++--
 arch/arm64/kernel/image.h          | 24 ++----------------------
 3 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 42a167a75486..43bc5037c234 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -521,17 +521,6 @@ alternative_else_nop_endif
 #define EXPORT_SYMBOL_NOKASAN(name)	EXPORT_SYMBOL(name)
 #endif
 
-	/*
-	 * Emit a 64-bit absolute little endian symbol reference in a way that
-	 * ensures that it will be resolved at build time, even when building a
-	 * PIE binary. This requires cooperation from the linker script, which
-	 * must emit the lo32/hi32 halves individually.
-	 */
-	.macro	le64sym, sym
-	.long	\sym\()_lo32
-	.long	\sym\()_hi32
-	.endm
-
 	/*
 	 * mov_q - move an immediate constant into a 64-bit register using
 	 *         between 2 and 4 movz/movk instructions (depending on the
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index d5c1ea0c5b3c..0b9c973a5327 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -61,8 +61,8 @@
 	efi_signature_nop			// special NOP to identity as PE/COFF executable
 	b	primary_entry			// branch to kernel start, magic
 	.quad	0				// Image load offset from start of RAM, little-endian
-	le64sym	_kernel_size_le			// Effective size of kernel image, little-endian
-	le64sym	_kernel_flags_le		// Informative flags, little-endian
+	.quad	_kernel_size_le			// Effective size of kernel image, little-endian
+	.quad	_kernel_flags_le		// Informative flags, little-endian
 	.quad	0				// reserved
 	.quad	0				// reserved
 	.quad	0				// reserved
diff --git a/arch/arm64/kernel/image.h b/arch/arm64/kernel/image.h
index 5c10ca773363..208843f96b4d 100644
--- a/arch/arm64/kernel/image.h
+++ b/arch/arm64/kernel/image.h
@@ -13,21 +13,6 @@
 
 #include <asm/image.h>
 
-/*
- * There aren't any ELF relocations we can use to endian-swap values known only
- * at link time (e.g. the subtraction of two symbol addresses), so we must get
- * the linker to endian-swap certain values before emitting them.
- *
- * Note that, in order for this to work when building the ELF64 PIE executable
- * (for KASLR), these values should not be referenced via R_AARCH64_ABS64
- * relocations, since these are fixed up at runtime rather than at build time
- * when PIE is in effect. So we need to split them up in 32-bit high and low
- * words.
- */
-#define DEFINE_IMAGE_LE64(sym, data)				\
-	sym##_lo32 = (data) & 0xffffffff;			\
-	sym##_hi32 = (data) >> 32
-
 #define __HEAD_FLAG(field)	(__HEAD_FLAG_##field << \
 					ARM64_IMAGE_FLAG_##field##_SHIFT)
 
@@ -41,13 +26,8 @@
 				 __HEAD_FLAG(PAGE_SIZE) | \
 				 __HEAD_FLAG(PHYS_BASE))
 
-/*
- * These will output as part of the Image header, which should be little-endian
- * regardless of the endianness of the kernel. While constant values could be
- * endian swapped in head.S, all are done here for consistency.
- */
 #define HEAD_SYMBOLS						\
-	DEFINE_IMAGE_LE64(_kernel_size_le, _end - _text);	\
-	DEFINE_IMAGE_LE64(_kernel_flags_le, __HEAD_FLAGS);
+	_kernel_size_le		=  _end - _text;		\
+	_kernel_flags_le	= __HEAD_FLAGS;
 
 #endif /* __ARM64_KERNEL_IMAGE_H */
-- 
2.55.0.979.g7e5102b832-goog


