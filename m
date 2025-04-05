Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B42C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 18:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DPxsuZPz/G/GRxTFNY0ns+MM+7+KxbKKGtUq4YfWYk=; b=CE/XwUn0dRQ3wBp5BNEL82maSx
	SwPUEpDDmL2/MXvQaSs8BgctNIPUM7cRN58pqcqiOQ1fdvDhjKyU2RHd6+ckwf6Wj054ZWK8EosNX
	4w7V/zQBp9LSSV/VA9KyuaBpETr/C3GKP/5Q/39mjyh1AGFK9tFx3H0aakxRjgISJv2s7GZqyQjAv
	xkR8pJzG8I3ECJSYXaxPM5ZkIS5OZGL9L3f8sUjRLtbGVQGKn6h0p699dR0lIcF80aRSFAxx8IOXb
	tjgUCabWDyS7LXvXzLApl2UBeNONM0POjVGUw/3iwUwUsPNh8DTssz/VcSCq43bCHefcLt7nAfNrg
	8ew6XaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18PL-0000000EN7Q-2NTL;
	Sat, 05 Apr 2025 18:38:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18IA-0000000ELct-0pq3;
	Sat, 05 Apr 2025 18:30:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B9F45C4B5B;
	Sat,  5 Apr 2025 18:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F6FC4CEEB;
	Sat,  5 Apr 2025 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877853;
	bh=HxORmLohzzHt6n63UhUGqHHR5CkahzSnOC2Vk+mIi7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ndae7o8kUNJmzQkUvuztaFnxK5ugJ8vgqdrgDJe+jl6mFgNi0sIvQIOrwDhjEet5s
	 HhCI08eamGOfY7KKnd3X6l6Hsy497+r6AEPWFtjKXcIXvkOpEd2ZulNvZ+w/8LdDrm
	 EQiNvt7ulyWUfoS8WfyMplzr7vfKN9o0Zfkah9/o98CK6m4ymYXzabER5sXNTEao8N
	 /r7adv60+BmThd+P/xsGwVgqwCbPI7XzH0tcPVcVNGlfDWO7Mj7GNJ2POE+R5VrnRF
	 JgxqzfvAhadTq5y1DhSuOXxfPqBq+QHzuOcMWLE7l9C+F1etgLLmgkcX8PgrRpDGIK
	 b8cqwxV2eXNxg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 1/9] crypto: riscv/chacha - implement library instead of skcipher
Date: Sat,  5 Apr 2025 11:26:01 -0700
Message-ID: <20250405182609.404216-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405182609.404216-1-ebiggers@kernel.org>
References: <20250405182609.404216-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_113054_357055_FBA6FE21 
X-CRM114-Status: GOOD (  19.12  )
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

From: Eric Biggers <ebiggers@google.com>

Currently the RISC-V optimized ChaCha20 is only wired up to the
crypto_skcipher API, which makes it unavailable to users of the library
API.  The crypto_skcipher API for ChaCha20 is going to change to be
implemented on top of the library API, so the library API needs to be
supported.  And of course it's needed anyway to serve the library users.

Therefore, change the RISC-V ChaCha20 code to implement the library API
instead of the crypto_skcipher API.

The library functions take the ChaCha state matrix directly (instead of
key and IV) and support both ChaCha20 and ChaCha12.  To make the RISC-V
code work properly for that, change the assembly code to take the state
matrix directly and add a nrounds parameter.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/crypto/Kconfig               |  11 +--
 arch/riscv/crypto/chacha-riscv64-glue.c | 106 ++++++++----------------
 arch/riscv/crypto/chacha-riscv64-zvkb.S |  71 ++++++++--------
 3 files changed, 75 insertions(+), 113 deletions(-)

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index c67095a3d6690..6392e1e11bc96 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -17,18 +17,15 @@ config CRYPTO_AES_RISCV64
 	  - Zvbb vector extension (XTS)
 	  - Zvkb vector crypto extension (CTR)
 	  - Zvkg vector crypto extension (XTS)
 
 config CRYPTO_CHACHA_RISCV64
-	tristate "Ciphers: ChaCha"
+	tristate
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
-	select CRYPTO_SKCIPHER
-	help
-	  Length-preserving ciphers: ChaCha20 stream cipher algorithm
-
-	  Architecture: riscv64 using:
-	  - Zvkb vector crypto extension
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_LIB_CHACHA_GENERIC
+	default CRYPTO_LIB_CHACHA_INTERNAL
 
 config CRYPTO_GHASH_RISCV64
 	tristate "Hash functions: GHASH"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_GCM
diff --git a/arch/riscv/crypto/chacha-riscv64-glue.c b/arch/riscv/crypto/chacha-riscv64-glue.c
index 10b46f36375af..68caef7a3d50b 100644
--- a/arch/riscv/crypto/chacha-riscv64-glue.c
+++ b/arch/riscv/crypto/chacha-riscv64-glue.c
@@ -1,101 +1,63 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * ChaCha20 using the RISC-V vector crypto extensions
+ * ChaCha stream cipher (RISC-V optimized)
  *
  * Copyright (C) 2023 SiFive, Inc.
  * Author: Jerry Shih <jerry.shih@sifive.com>
  */
 
 #include <asm/simd.h>
 #include <asm/vector.h>
-#include <crypto/internal/chacha.h>
-#include <crypto/internal/skcipher.h>
+#include <crypto/chacha.h>
+#include <crypto/internal/simd.h>
 #include <linux/linkage.h>
 #include <linux/module.h>
 
-asmlinkage void chacha20_zvkb(const u32 key[8], const u8 *in, u8 *out,
-			      size_t len, const u32 iv[4]);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(use_zvkb);
 
-static int riscv64_chacha20_crypt(struct skcipher_request *req)
+asmlinkage void chacha_zvkb(u32 state[16], const u8 *in, u8 *out,
+			    size_t nblocks, int nrounds);
+
+void hchacha_block_arch(const u32 *state, u32 *out, int nrounds)
 {
-	u32 iv[CHACHA_IV_SIZE / sizeof(u32)];
-	u8 block_buffer[CHACHA_BLOCK_SIZE];
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	const struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct skcipher_walk walk;
-	unsigned int nbytes;
-	unsigned int tail_bytes;
-	int err;
+	hchacha_block_generic(state, out, nrounds);
+}
+EXPORT_SYMBOL(hchacha_block_arch);
 
-	iv[0] = get_unaligned_le32(req->iv);
-	iv[1] = get_unaligned_le32(req->iv + 4);
-	iv[2] = get_unaligned_le32(req->iv + 8);
-	iv[3] = get_unaligned_le32(req->iv + 12);
+void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
+		       int nrounds)
+{
+	u8 block_buffer[CHACHA_BLOCK_SIZE];
+	unsigned int full_blocks = bytes / CHACHA_BLOCK_SIZE;
+	unsigned int tail_bytes = bytes % CHACHA_BLOCK_SIZE;
 
-	err = skcipher_walk_virt(&walk, req, false);
-	while (walk.nbytes) {
-		nbytes = walk.nbytes & ~(CHACHA_BLOCK_SIZE - 1);
-		tail_bytes = walk.nbytes & (CHACHA_BLOCK_SIZE - 1);
-		kernel_vector_begin();
-		if (nbytes) {
-			chacha20_zvkb(ctx->key, walk.src.virt.addr,
-				      walk.dst.virt.addr, nbytes, iv);
-			iv[0] += nbytes / CHACHA_BLOCK_SIZE;
-		}
-		if (walk.nbytes == walk.total && tail_bytes > 0) {
-			memcpy(block_buffer, walk.src.virt.addr + nbytes,
-			       tail_bytes);
-			chacha20_zvkb(ctx->key, block_buffer, block_buffer,
-				      CHACHA_BLOCK_SIZE, iv);
-			memcpy(walk.dst.virt.addr + nbytes, block_buffer,
-			       tail_bytes);
-			tail_bytes = 0;
-		}
-		kernel_vector_end();
+	if (!static_branch_likely(&use_zvkb) || !crypto_simd_usable())
+		return chacha_crypt_generic(state, dst, src, bytes, nrounds);
 
-		err = skcipher_walk_done(&walk, tail_bytes);
+	kernel_vector_begin();
+	if (full_blocks) {
+		chacha_zvkb(state, src, dst, full_blocks, nrounds);
+		src += full_blocks * CHACHA_BLOCK_SIZE;
+		dst += full_blocks * CHACHA_BLOCK_SIZE;
 	}
-
-	return err;
+	if (tail_bytes) {
+		memcpy(block_buffer, src, tail_bytes);
+		chacha_zvkb(state, block_buffer, block_buffer, 1, nrounds);
+		memcpy(dst, block_buffer, tail_bytes);
+	}
+	kernel_vector_end();
 }
-
-static struct skcipher_alg riscv64_chacha_alg = {
-	.setkey = chacha20_setkey,
-	.encrypt = riscv64_chacha20_crypt,
-	.decrypt = riscv64_chacha20_crypt,
-	.min_keysize = CHACHA_KEY_SIZE,
-	.max_keysize = CHACHA_KEY_SIZE,
-	.ivsize = CHACHA_IV_SIZE,
-	.chunksize = CHACHA_BLOCK_SIZE,
-	.walksize = 4 * CHACHA_BLOCK_SIZE,
-	.base = {
-		.cra_blocksize = 1,
-		.cra_ctxsize = sizeof(struct chacha_ctx),
-		.cra_priority = 300,
-		.cra_name = "chacha20",
-		.cra_driver_name = "chacha20-riscv64-zvkb",
-		.cra_module = THIS_MODULE,
-	},
-};
+EXPORT_SYMBOL(chacha_crypt_arch);
 
 static int __init riscv64_chacha_mod_init(void)
 {
 	if (riscv_isa_extension_available(NULL, ZVKB) &&
 	    riscv_vector_vlen() >= 128)
-		return crypto_register_skcipher(&riscv64_chacha_alg);
-
-	return -ENODEV;
-}
-
-static void __exit riscv64_chacha_mod_exit(void)
-{
-	crypto_unregister_skcipher(&riscv64_chacha_alg);
+		static_branch_enable(&use_zvkb);
+	return 0;
 }
-
 module_init(riscv64_chacha_mod_init);
-module_exit(riscv64_chacha_mod_exit);
 
-MODULE_DESCRIPTION("ChaCha20 (RISC-V accelerated)");
+MODULE_DESCRIPTION("ChaCha stream cipher (RISC-V optimized)");
 MODULE_AUTHOR("Jerry Shih <jerry.shih@sifive.com>");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS_CRYPTO("chacha20");
diff --git a/arch/riscv/crypto/chacha-riscv64-zvkb.S b/arch/riscv/crypto/chacha-riscv64-zvkb.S
index bf057737ac693..ab4423b3880ea 100644
--- a/arch/riscv/crypto/chacha-riscv64-zvkb.S
+++ b/arch/riscv/crypto/chacha-riscv64-zvkb.S
@@ -44,24 +44,24 @@
 #include <linux/linkage.h>
 
 .text
 .option arch, +zvkb
 
-#define KEYP		a0
+#define STATEP		a0
 #define INP		a1
 #define OUTP		a2
-#define LEN		a3
-#define IVP		a4
+#define NBLOCKS		a3
+#define NROUNDS		a4
 
 #define CONSTS0		a5
 #define CONSTS1		a6
 #define CONSTS2		a7
 #define CONSTS3		t0
 #define TMP		t1
 #define VL		t2
 #define STRIDE		t3
-#define NROUNDS		t4
+#define ROUND_CTR	t4
 #define KEY0		s0
 #define KEY1		s1
 #define KEY2		s2
 #define KEY3		s3
 #define KEY4		s4
@@ -130,18 +130,20 @@
 	vror.vi		\b1, \b1, 32 - 7
 	vror.vi		\b2, \b2, 32 - 7
 	vror.vi		\b3, \b3, 32 - 7
 .endm
 
-// void chacha20_zvkb(const u32 key[8], const u8 *in, u8 *out, size_t len,
-//		      const u32 iv[4]);
+// void chacha_zvkb(u32 state[16], const u8 *in, u8 *out, size_t nblocks,
+//		    int nrounds);
 //
-// |len| must be nonzero and a multiple of 64 (CHACHA_BLOCK_SIZE).
-// The counter is treated as 32-bit, following the RFC7539 convention.
-SYM_FUNC_START(chacha20_zvkb)
-	srli		LEN, LEN, 6	// Bytes to blocks
-
+// |nblocks| is the number of 64-byte blocks to process, and must be nonzero.
+//
+// |state| gives the ChaCha state matrix, including the 32-bit counter in
+// state[12] following the RFC7539 convention; note that this differs from the
+// original Salsa20 paper which uses a 64-bit counter in state[12..13].  The
+// updated 32-bit counter is written back to state[12] before returning.
+SYM_FUNC_START(chacha_zvkb)
 	addi		sp, sp, -96
 	sd		s0, 0(sp)
 	sd		s1, 8(sp)
 	sd		s2, 16(sp)
 	sd		s3, 24(sp)
@@ -155,30 +157,30 @@ SYM_FUNC_START(chacha20_zvkb)
 	sd		s11, 88(sp)
 
 	li		STRIDE, 64
 
 	// Set up the initial state matrix in scalar registers.
-	li		CONSTS0, 0x61707865	// "expa" little endian
-	li		CONSTS1, 0x3320646e	// "nd 3" little endian
-	li		CONSTS2, 0x79622d32	// "2-by" little endian
-	li		CONSTS3, 0x6b206574	// "te k" little endian
-	lw		KEY0, 0(KEYP)
-	lw		KEY1, 4(KEYP)
-	lw		KEY2, 8(KEYP)
-	lw		KEY3, 12(KEYP)
-	lw		KEY4, 16(KEYP)
-	lw		KEY5, 20(KEYP)
-	lw		KEY6, 24(KEYP)
-	lw		KEY7, 28(KEYP)
-	lw		COUNTER, 0(IVP)
-	lw		NONCE0, 4(IVP)
-	lw		NONCE1, 8(IVP)
-	lw		NONCE2, 12(IVP)
+	lw		CONSTS0, 0(STATEP)
+	lw		CONSTS1, 4(STATEP)
+	lw		CONSTS2, 8(STATEP)
+	lw		CONSTS3, 12(STATEP)
+	lw		KEY0, 16(STATEP)
+	lw		KEY1, 20(STATEP)
+	lw		KEY2, 24(STATEP)
+	lw		KEY3, 28(STATEP)
+	lw		KEY4, 32(STATEP)
+	lw		KEY5, 36(STATEP)
+	lw		KEY6, 40(STATEP)
+	lw		KEY7, 44(STATEP)
+	lw		COUNTER, 48(STATEP)
+	lw		NONCE0, 52(STATEP)
+	lw		NONCE1, 56(STATEP)
+	lw		NONCE2, 60(STATEP)
 
 .Lblock_loop:
 	// Set vl to the number of blocks to process in this iteration.
-	vsetvli		VL, LEN, e32, m1, ta, ma
+	vsetvli		VL, NBLOCKS, e32, m1, ta, ma
 
 	// Set up the initial state matrix for the next VL blocks in v0-v15.
 	// v{i} holds the i'th 32-bit word of the state matrix for all blocks.
 	// Note that only the counter word, at index 12, differs across blocks.
 	vmv.v.x		v0, CONSTS0
@@ -201,20 +203,20 @@ SYM_FUNC_START(chacha20_zvkb)
 
 	// Load the first half of the input data for each block into v16-v23.
 	// v{16+i} holds the i'th 32-bit word for all blocks.
 	vlsseg8e32.v	v16, (INP), STRIDE
 
-	li		NROUNDS, 20
+	mv		ROUND_CTR, NROUNDS
 .Lnext_doubleround:
-	addi		NROUNDS, NROUNDS, -2
+	addi		ROUND_CTR, ROUND_CTR, -2
 	// column round
 	chacha_round	v0, v4, v8, v12, v1, v5, v9, v13, \
 			v2, v6, v10, v14, v3, v7, v11, v15
 	// diagonal round
 	chacha_round	v0, v5, v10, v15, v1, v6, v11, v12, \
 			v2, v7, v8, v13, v3, v4, v9, v14
-	bnez		NROUNDS, .Lnext_doubleround
+	bnez		ROUND_CTR, .Lnext_doubleround
 
 	// Load the second half of the input data for each block into v24-v31.
 	// v{24+i} holds the {8+i}'th 32-bit word for all blocks.
 	addi		TMP, INP, 32
 	vlsseg8e32.v	v24, (TMP), STRIDE
@@ -269,16 +271,17 @@ SYM_FUNC_START(chacha20_zvkb)
 	vssseg8e32.v	v24, (TMP), STRIDE
 
 	// Update the counter, the remaining number of blocks, and the input and
 	// output pointers according to the number of blocks processed (VL).
 	add		COUNTER, COUNTER, VL
-	sub		LEN, LEN, VL
+	sub		NBLOCKS, NBLOCKS, VL
 	slli		TMP, VL, 6
 	add		OUTP, OUTP, TMP
 	add		INP, INP, TMP
-	bnez		LEN, .Lblock_loop
+	bnez		NBLOCKS, .Lblock_loop
 
+	sw		COUNTER, 48(STATEP)
 	ld		s0, 0(sp)
 	ld		s1, 8(sp)
 	ld		s2, 16(sp)
 	ld		s3, 24(sp)
 	ld		s4, 32(sp)
@@ -289,6 +292,6 @@ SYM_FUNC_START(chacha20_zvkb)
 	ld		s9, 72(sp)
 	ld		s10, 80(sp)
 	ld		s11, 88(sp)
 	addi		sp, sp, 96
 	ret
-SYM_FUNC_END(chacha20_zvkb)
+SYM_FUNC_END(chacha_zvkb)
-- 
2.49.0


