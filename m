Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92939CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 04:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmpSMpIm1VV+9IijFW7VrkonxJwhyYP06l08JAkdKoY=; b=49FZMfutkcfgm6RUeHmzMiEjW/
	rhKWGUKNckmn5NnTeoldHkUvhxhMff77asM9Tosjl0+ERF5v42VAgcMQdRs4r6AV3LxxwxAZaC78n
	k8HgpHB5N0/PddhhKApRFpMA9ij46VsEJRf8IedkPjR/EC5DcY2cVqmhHMoHuTn5HanxXb1DE5JQE
	4jzbx2Kym8Azu994kUKZXZvWQ+JX70qbBu75zFm8plA3221OpoxKw4Znvqd48h2S6WWHS9VJJH86c
	RCGUZfIC+X80y4EfcrOOmclDXvB/hD59VWwWt5qWCeg6rxra45qUG6L3lbB+riX1FJKbXmj2BvrXw
	4YRkzCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yg7-00000009VJV-1juo;
	Sat, 18 Oct 2025 04:36:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yg4-00000009VGp-2IAb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 04:36:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E17E3605DA;
	Sat, 18 Oct 2025 04:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AED0C116D0;
	Sat, 18 Oct 2025 04:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760762183;
	bh=oVy/e66OZErUv0ljGHWjH/vFmXCXXdtO5v7arPRygeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dvAu53uC4HoC9WirzBqhUcDMIEqBqINGiaEwSDOu49khgSoKKraeYFaTdLfGsHakc
	 vRWMTIQPsN2EqIbkonAq4bxpq3WZJRhhJI6n6eCz9E96jxEhBQXB6/G868LcNepxj9
	 6e4Jw50hp8dxAEEStS5JvFvok41Zuhiyxl+RsxMkpDFIMybAWmZrCegzv5FdpyZRKP
	 mYqbeArqz71rjS38h5cUrsOizQUjywezDO+DgAqFDfhuFjPwf3v1adT2goLDFcPPZ1
	 jGF5Fuw/zwD2oSYyOtIyKlBIxWnSKwI2ENAXwv8ywvlvREGshSqnV63MFXUFYFX8hO
	 sdsXUjVG2E5Lw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 07/10] lib/crypto: arm/blake2b: Migrate optimized code into library
Date: Fri, 17 Oct 2025 21:31:03 -0700
Message-ID: <20251018043106.375964-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251018043106.375964-1-ebiggers@kernel.org>
References: <20251018043106.375964-1-ebiggers@kernel.org>
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

Migrate the arm-optimized BLAKE2b code from arch/arm/crypto/ to
lib/crypto/arm/.  This makes the BLAKE2b library able to use it, and it
also simplifies the code because it's easier to integrate with the
library than crypto_shash.

This temporarily makes the arm-optimized BLAKE2b code unavailable via
crypto_shash.  A later commit reimplements the blake2b-* crypto_shash
algorithms on top of the BLAKE2b library API, making it available again.

Note that as per the lib/crypto/ convention, the optimized code is now
enabled by default.  So, this also fixes the longstanding issue where
the optimized BLAKE2b code was not enabled by default.

To see the diff from arch/arm/crypto/blake2b-neon-glue.c to
lib/crypto/arm/blake2b.h, view this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/Kconfig                       |  16 ---
 arch/arm/crypto/Makefile                      |   2 -
 arch/arm/crypto/blake2b-neon-glue.c           | 104 ------------------
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   1 +
 .../crypto/arm}/blake2b-neon-core.S           |  29 ++---
 lib/crypto/arm/blake2b.h                      |  41 +++++++
 7 files changed, 59 insertions(+), 135 deletions(-)
 delete mode 100644 arch/arm/crypto/blake2b-neon-glue.c
 rename {arch/arm/crypto => lib/crypto/arm}/blake2b-neon-core.S (94%)
 create mode 100644 lib/crypto/arm/blake2b.h

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index c436eec22d86c..f30d743df2643 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -31,26 +31,10 @@ config CRYPTO_NHPOLY1305_NEON
 	  NHPoly1305 hash function (Adiantum)
 
 	  Architecture: arm using:
 	  - NEON (Advanced SIMD) extensions
 
-config CRYPTO_BLAKE2B_NEON
-	tristate "Hash functions: BLAKE2b (NEON)"
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_BLAKE2B
-	help
-	  BLAKE2b cryptographic hash function (RFC 7693)
-
-	  Architecture: arm using
-	  - NEON (Advanced SIMD) extensions
-
-	  BLAKE2b digest algorithm optimized with ARM NEON instructions.
-	  On ARM processors that have NEON support but not the ARMv8
-	  Crypto Extensions, typically this BLAKE2b implementation is
-	  much faster than the SHA-2 family and slightly faster than
-	  SHA-1.
-
 config CRYPTO_AES_ARM
 	tristate "Ciphers: AES"
 	select CRYPTO_ALGAPI
 	select CRYPTO_AES
 	help
diff --git a/arch/arm/crypto/Makefile b/arch/arm/crypto/Makefile
index 6346a73effc06..86dd43313dbfd 100644
--- a/arch/arm/crypto/Makefile
+++ b/arch/arm/crypto/Makefile
@@ -3,17 +3,15 @@
 # Arch-specific CryptoAPI modules.
 #
 
 obj-$(CONFIG_CRYPTO_AES_ARM) += aes-arm.o
 obj-$(CONFIG_CRYPTO_AES_ARM_BS) += aes-arm-bs.o
-obj-$(CONFIG_CRYPTO_BLAKE2B_NEON) += blake2b-neon.o
 obj-$(CONFIG_CRYPTO_NHPOLY1305_NEON) += nhpoly1305-neon.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM_CE) += aes-arm-ce.o
 obj-$(CONFIG_CRYPTO_GHASH_ARM_CE) += ghash-arm-ce.o
 
 aes-arm-y	:= aes-cipher-core.o aes-cipher-glue.o
 aes-arm-bs-y	:= aes-neonbs-core.o aes-neonbs-glue.o
-blake2b-neon-y  := blake2b-neon-core.o blake2b-neon-glue.o
 aes-arm-ce-y	:= aes-ce-core.o aes-ce-glue.o
 ghash-arm-ce-y	:= ghash-ce-core.o ghash-ce-glue.o
 nhpoly1305-neon-y := nh-neon-core.o nhpoly1305-neon-glue.o
diff --git a/arch/arm/crypto/blake2b-neon-glue.c b/arch/arm/crypto/blake2b-neon-glue.c
deleted file mode 100644
index 2ff443a91724f..0000000000000
--- a/arch/arm/crypto/blake2b-neon-glue.c
+++ /dev/null
@@ -1,104 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * BLAKE2b digest algorithm, NEON accelerated
- *
- * Copyright 2020 Google LLC
- */
-
-#include <crypto/internal/blake2b.h>
-#include <crypto/internal/hash.h>
-
-#include <linux/module.h>
-#include <linux/sizes.h>
-
-#include <asm/neon.h>
-#include <asm/simd.h>
-
-asmlinkage void blake2b_compress_neon(struct blake2b_state *state,
-				      const u8 *block, size_t nblocks, u32 inc);
-
-static void blake2b_compress_arch(struct blake2b_state *state,
-				  const u8 *block, size_t nblocks, u32 inc)
-{
-	do {
-		const size_t blocks = min_t(size_t, nblocks,
-					    SZ_4K / BLAKE2B_BLOCK_SIZE);
-
-		kernel_neon_begin();
-		blake2b_compress_neon(state, block, blocks, inc);
-		kernel_neon_end();
-
-		nblocks -= blocks;
-		block += blocks * BLAKE2B_BLOCK_SIZE;
-	} while (nblocks);
-}
-
-static int crypto_blake2b_update_neon(struct shash_desc *desc,
-				      const u8 *in, unsigned int inlen)
-{
-	return crypto_blake2b_update_bo(desc, in, inlen, blake2b_compress_arch);
-}
-
-static int crypto_blake2b_finup_neon(struct shash_desc *desc, const u8 *in,
-				     unsigned int inlen, u8 *out)
-{
-	return crypto_blake2b_finup(desc, in, inlen, out,
-				    blake2b_compress_arch);
-}
-
-#define BLAKE2B_ALG(name, driver_name, digest_size)			\
-	{								\
-		.base.cra_name		= name,				\
-		.base.cra_driver_name	= driver_name,			\
-		.base.cra_priority	= 200,				\
-		.base.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY |	\
-					  CRYPTO_AHASH_ALG_BLOCK_ONLY |	\
-					  CRYPTO_AHASH_ALG_FINAL_NONZERO, \
-		.base.cra_blocksize	= BLAKE2B_BLOCK_SIZE,		\
-		.base.cra_ctxsize	= sizeof(struct blake2b_tfm_ctx), \
-		.base.cra_module	= THIS_MODULE,			\
-		.digestsize		= digest_size,			\
-		.setkey			= crypto_blake2b_setkey,	\
-		.init			= crypto_blake2b_init,		\
-		.update			= crypto_blake2b_update_neon,	\
-		.finup			= crypto_blake2b_finup_neon,	\
-		.descsize		= sizeof(struct blake2b_state),	\
-		.statesize		= BLAKE2B_STATE_SIZE,		\
-	}
-
-static struct shash_alg blake2b_neon_algs[] = {
-	BLAKE2B_ALG("blake2b-160", "blake2b-160-neon", BLAKE2B_160_HASH_SIZE),
-	BLAKE2B_ALG("blake2b-256", "blake2b-256-neon", BLAKE2B_256_HASH_SIZE),
-	BLAKE2B_ALG("blake2b-384", "blake2b-384-neon", BLAKE2B_384_HASH_SIZE),
-	BLAKE2B_ALG("blake2b-512", "blake2b-512-neon", BLAKE2B_512_HASH_SIZE),
-};
-
-static int __init blake2b_neon_mod_init(void)
-{
-	if (!(elf_hwcap & HWCAP_NEON))
-		return -ENODEV;
-
-	return crypto_register_shashes(blake2b_neon_algs,
-				       ARRAY_SIZE(blake2b_neon_algs));
-}
-
-static void __exit blake2b_neon_mod_exit(void)
-{
-	crypto_unregister_shashes(blake2b_neon_algs,
-				  ARRAY_SIZE(blake2b_neon_algs));
-}
-
-module_init(blake2b_neon_mod_init);
-module_exit(blake2b_neon_mod_exit);
-
-MODULE_DESCRIPTION("BLAKE2b digest algorithm, NEON accelerated");
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Eric Biggers <ebiggers@google.com>");
-MODULE_ALIAS_CRYPTO("blake2b-160");
-MODULE_ALIAS_CRYPTO("blake2b-160-neon");
-MODULE_ALIAS_CRYPTO("blake2b-256");
-MODULE_ALIAS_CRYPTO("blake2b-256-neon");
-MODULE_ALIAS_CRYPTO("blake2b-384");
-MODULE_ALIAS_CRYPTO("blake2b-384-neon");
-MODULE_ALIAS_CRYPTO("blake2b-512");
-MODULE_ALIAS_CRYPTO("blake2b-512-neon");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 045fd79cc1bed..56456eb786bf3 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -35,10 +35,11 @@ config CRYPTO_LIB_BLAKE2B
 	  the functions from <crypto/blake2b.h>.
 
 config CRYPTO_LIB_BLAKE2B_ARCH
 	bool
 	depends on CRYPTO_LIB_BLAKE2B && !UML
+	default y if ARM && KERNEL_MODE_NEON
 
 # BLAKE2s support is always built-in, so there's no CRYPTO_LIB_BLAKE2S option.
 
 config CRYPTO_LIB_BLAKE2S_ARCH
 	bool
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index f863417b16817..5c9a933928188 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -34,10 +34,11 @@ obj-$(CONFIG_CRYPTO_LIB_GF128MUL)		+= gf128mul.o
 obj-$(CONFIG_CRYPTO_LIB_BLAKE2B) += libblake2b.o
 libblake2b-y := blake2b.o
 CFLAGS_blake2b.o := -Wframe-larger-than=4096 #  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105930
 ifeq ($(CONFIG_CRYPTO_LIB_BLAKE2B_ARCH),y)
 CFLAGS_blake2b.o += -I$(src)/$(SRCARCH)
+obj-$(CONFIG_ARM) += arm/blake2b-neon-core.o
 endif # CONFIG_CRYPTO_LIB_BLAKE2B_ARCH
 
 ################################################################################
 
 # blake2s is used by the /dev/random driver which is always builtin
diff --git a/arch/arm/crypto/blake2b-neon-core.S b/lib/crypto/arm/blake2b-neon-core.S
similarity index 94%
rename from arch/arm/crypto/blake2b-neon-core.S
rename to lib/crypto/arm/blake2b-neon-core.S
index 0406a186377fb..b55c37f0b88fb 100644
--- a/arch/arm/crypto/blake2b-neon-core.S
+++ b/lib/crypto/arm/blake2b-neon-core.S
@@ -1,8 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * BLAKE2b digest algorithm, NEON accelerated
+ * BLAKE2b digest algorithm optimized with ARM NEON instructions.  On ARM
+ * processors that have NEON support but not the ARMv8 Crypto Extensions,
+ * typically this BLAKE2b implementation is much faster than the SHA-2 family
+ * and slightly faster than SHA-1.
  *
  * Copyright 2020 Google LLC
  *
  * Author: Eric Biggers <ebiggers@google.com>
  */
@@ -11,12 +14,12 @@
 
 	.text
 	.fpu		neon
 
 	// The arguments to blake2b_compress_neon()
-	STATE		.req	r0
-	BLOCK		.req	r1
+	CTX		.req	r0
+	DATA		.req	r1
 	NBLOCKS		.req	r2
 	INC		.req	r3
 
 	// Pointers to the rotation tables
 	ROR24_TABLE	.req	r4
@@ -232,14 +235,14 @@
 	vld1.8		{q8-q9}, [sp, :256]
 .endif
 .endm
 
 //
-// void blake2b_compress_neon(struct blake2b_state *state,
-//			      const u8 *block, size_t nblocks, u32 inc);
+// void blake2b_compress_neon(struct blake2b_ctx *ctx,
+//			      const u8 *data, size_t nblocks, u32 inc);
 //
-// Only the first three fields of struct blake2b_state are used:
+// Only the first three fields of struct blake2b_ctx are used:
 //	u64 h[8];	(inout)
 //	u64 t[2];	(inout)
 //	u64 f[2];	(in)
 //
 	.align		5
@@ -253,11 +256,11 @@ ENTRY(blake2b_compress_neon)
 	mov		sp, ip
 
 	adr		ROR24_TABLE, .Lror24_table
 	adr		ROR16_TABLE, .Lror16_table
 
-	mov		ip, STATE
+	mov		ip, CTX
 	vld1.64		{q0-q1}, [ip]!		// Load h[0..3]
 	vld1.64		{q2-q3}, [ip]!		// Load h[4..7]
 .Lnext_block:
 	  adr		r10, .Lblake2b_IV
 	vld1.64		{q14-q15}, [ip]		// Load t[0..1] and f[0..1]
@@ -279,18 +282,18 @@ ENTRY(blake2b_compress_neon)
 	// registers than the state registers, as the message doesn't change.
 	// Therefore we store a copy of the first 32 bytes of the message block
 	// (q8-q9) in an aligned buffer on the stack so that they can be
 	// reloaded when needed.  (We could just reload directly from the
 	// message buffer, but it's faster to use aligned loads.)
-	vld1.8		{q8-q9}, [BLOCK]!
+	vld1.8		{q8-q9}, [DATA]!
 	  veor		q6, q6, q14	// v[12..13] = IV[4..5] ^ t[0..1]
-	vld1.8		{q10-q11}, [BLOCK]!
+	vld1.8		{q10-q11}, [DATA]!
 	  veor		q7, q7, q15	// v[14..15] = IV[6..7] ^ f[0..1]
-	vld1.8		{q12-q13}, [BLOCK]!
+	vld1.8		{q12-q13}, [DATA]!
 	vst1.8		{q8-q9}, [sp, :256]
-	  mov		ip, STATE
-	vld1.8		{q14-q15}, [BLOCK]!
+	  mov		ip, CTX
+	vld1.8		{q14-q15}, [DATA]!
 
 	// Execute the rounds.  Each round is provided the order in which it
 	// needs to use the message words.
 	_blake2b_round	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
 	_blake2b_round	14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3
@@ -317,11 +320,11 @@ ENTRY(blake2b_compress_neon)
 	  vld1.64	{q10-q11}, [ip]		// Load old h[4..7]
 	veor		q2, q2, q6		// v[4..5] ^= v[12..13]
 	veor		q3, q3, q7		// v[6..7] ^= v[14..15]
 	veor		q0, q0, q8		// v[0..1] ^= h[0..1]
 	veor		q1, q1, q9		// v[2..3] ^= h[2..3]
-	  mov		ip, STATE
+	  mov		ip, CTX
 	  subs		NBLOCKS, NBLOCKS, #1	// nblocks--
 	  vst1.64	{q0-q1}, [ip]!		// Store new h[0..3]
 	veor		q2, q2, q10		// v[4..5] ^= h[4..5]
 	veor		q3, q3, q11		// v[6..7] ^= h[6..7]
 	  vst1.64	{q2-q3}, [ip]!		// Store new h[4..7]
diff --git a/lib/crypto/arm/blake2b.h b/lib/crypto/arm/blake2b.h
new file mode 100644
index 0000000000000..1b9154d119db4
--- /dev/null
+++ b/lib/crypto/arm/blake2b.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * BLAKE2b digest algorithm, NEON accelerated
+ *
+ * Copyright 2020 Google LLC
+ */
+
+#include <asm/neon.h>
+#include <asm/simd.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
+
+asmlinkage void blake2b_compress_neon(struct blake2b_ctx *ctx,
+				      const u8 *data, size_t nblocks, u32 inc);
+
+static void blake2b_compress(struct blake2b_ctx *ctx,
+			     const u8 *data, size_t nblocks, u32 inc)
+{
+	if (!static_branch_likely(&have_neon) || !may_use_simd()) {
+		blake2b_compress_generic(ctx, data, nblocks, inc);
+		return;
+	}
+	do {
+		const size_t blocks = min_t(size_t, nblocks,
+					    SZ_4K / BLAKE2B_BLOCK_SIZE);
+
+		kernel_neon_begin();
+		blake2b_compress_neon(ctx, data, blocks, inc);
+		kernel_neon_end();
+
+		data += blocks * BLAKE2B_BLOCK_SIZE;
+		nblocks -= blocks;
+	} while (nblocks);
+}
+
+#define blake2b_mod_init_arch blake2b_mod_init_arch
+static void blake2b_mod_init_arch(void)
+{
+	if (elf_hwcap & HWCAP_NEON)
+		static_branch_enable(&have_neon);
+}
-- 
2.51.1.dirty


