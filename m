Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518EECCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 05:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZlJHbfMLGIB6bFiqI5hD3tSOrEPwYr5Ft6VD9gdkqE=; b=emaygwZkvdTum7txgSLwWyHi4O
	wEDQSfAKQJvPu7B7hprIbNmO2bqPef0RoBDd7QnJb1jPt0R/Jn4wrf7qPL+buK2VDrWW8ZnHQ8lc4
	0dBMG2ZIt9tmp4S2TlK2C9zbgF5IVsCOAE4XRx3VfhZFLgn/wykZcgycNdT9/aAG25hGs1HfFjRAW
	gsvETrDMjbh51JmPtBd7UON9fZDWbaNrJPFDZpB0ecxlJgVT68g+yV6tP9Oqr/yivrq65deD6S1Ae
	d1W8lovRC+sq7NCCOdOi25WT0iTaMPYPuKzDEnvdtwEbbolZl3lVCnhDxEzTAF//RAms0RGzfpDVe
	lKGSGu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgo-0000000C2rQ-0KLC;
	Sun, 26 Oct 2025 05:53:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgh-0000000C2la-3qoF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 05:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 751BD44B07;
	Sun, 26 Oct 2025 05:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021BAC4CEE7;
	Sun, 26 Oct 2025 05:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761457987;
	bh=whd3/UAU+Av8P94JmMwJInAffIEeimNA4qb0IpZM3BE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JkuRP+EvVU4pwZ7E6PK7sAdaSnn9Gseea3mkv7c7lrYvjNCdLocin68xIEW73mnIu
	 G1+xw1WwcuiedY94SAOKIfsoKHSKt5ujrL36GWVwkyuu88jHtFRqwIz/HC+kPKB46g
	 r7EBcLuZ6YVTkzr4gLDKn0ib+cL80u/w+62ZekNVooTRwHURSlSj9wFrS8PEKWkPkx
	 Puuj2RELLpDDFm9Yk1CMlIP0PlrIxXruVuJGjXMWxJohG3jBtTwRLMdlJp3iWrjIF4
	 zAVOdrZYQHiO6qRR5Tu4f2r1PDD5WQ6dS3U/zY7hnWNSinxfn6ZyFcClRen7R96M+x
	 XjAN4Bw14/yGA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/15] lib/crypto: arm64/sha3: Migrate optimized code into library
Date: Sat, 25 Oct 2025 22:50:26 -0700
Message-ID: <20251026055032.1413733-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251026055032.1413733-1-ebiggers@kernel.org>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_225308_050157_EEFAA625 
X-CRM114-Status: GOOD (  22.91  )
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

Instead of exposing the arm64-optimized SHA-3 code via arm64-specific
crypto_shash algorithms, instead just implement the sha3_absorb_blocks()
and sha3_keccakf() library functions.  This is much simpler, it makes
the SHA-3 library functions be arm64-optimized, and it fixes the
longstanding issue where the arm64-optimized SHA-3 code was disabled by
default.  SHA-3 still remains available through crypto_shash, but
individual architectures no longer need to handle it.

Note: to see the diff from arch/arm64/crypto/sha3-ce-glue.c to
lib/crypto/arm64/sha3.h, view this commit with 'git show -M10'.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/configs/defconfig                  |   2 +-
 arch/arm64/crypto/Kconfig                     |  11 --
 arch/arm64/crypto/Makefile                    |   3 -
 arch/arm64/crypto/sha3-ce-glue.c              | 150 ------------------
 lib/crypto/Kconfig                            |   5 +
 lib/crypto/Makefile                           |   5 +
 .../crypto/arm64}/sha3-ce-core.S              |   0
 lib/crypto/arm64/sha3.h                       |  62 ++++++++
 8 files changed, 73 insertions(+), 165 deletions(-)
 delete mode 100644 arch/arm64/crypto/sha3-ce-glue.c
 rename {arch/arm64/crypto => lib/crypto/arm64}/sha3-ce-core.S (100%)
 create mode 100644 lib/crypto/arm64/sha3.h

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd1042..20dd3a39faead 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1781,14 +1781,14 @@ CONFIG_SECURITY=y
 CONFIG_CRYPTO_USER=y
 CONFIG_CRYPTO_CHACHA20=m
 CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
-CONFIG_CRYPTO_SHA3_ARM64=m
 CONFIG_CRYPTO_SM3_ARM64_CE=m
 CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_CRYPTO_AES_ARM64_BS=m
 CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 91f3093eee6ab..376d6b50743ff 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -23,21 +23,10 @@ config CRYPTO_NHPOLY1305_NEON
 	  NHPoly1305 hash function (Adiantum)
 
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
-config CRYPTO_SHA3_ARM64
-	tristate "Hash functions: SHA-3 (ARMv8.2 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_HASH
-	select CRYPTO_SHA3
-	help
-	  SHA-3 secure hash algorithms (FIPS 202)
-
-	  Architecture: arm64 using:
-	  - ARMv8.2 Crypto Extensions
-
 config CRYPTO_SM3_NEON
 	tristate "Hash functions: SM3 (NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index a8b2cdbe202c1..fd3d590fa1137 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -3,13 +3,10 @@
 # linux/arch/arm64/crypto/Makefile
 #
 # Copyright (C) 2014 Linaro Ltd <ard.biesheuvel@linaro.org>
 #
 
-obj-$(CONFIG_CRYPTO_SHA3_ARM64) += sha3-ce.o
-sha3-ce-y := sha3-ce-glue.o sha3-ce-core.o
-
 obj-$(CONFIG_CRYPTO_SM3_NEON) += sm3-neon.o
 sm3-neon-y := sm3-neon-glue.o sm3-neon-core.o
 
 obj-$(CONFIG_CRYPTO_SM3_ARM64_CE) += sm3-ce.o
 sm3-ce-y := sm3-ce-glue.o sm3-ce-core.o
diff --git a/arch/arm64/crypto/sha3-ce-glue.c b/arch/arm64/crypto/sha3-ce-glue.c
deleted file mode 100644
index 250f4fb76b472..0000000000000
--- a/arch/arm64/crypto/sha3-ce-glue.c
+++ /dev/null
@@ -1,150 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * sha3-ce-glue.c - core SHA-3 transform using v8.2 Crypto Extensions
- *
- * Copyright (C) 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#include <asm/hwcap.h>
-#include <asm/neon.h>
-#include <asm/simd.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha3.h>
-#include <linux/cpufeature.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/unaligned.h>
-
-MODULE_DESCRIPTION("SHA3 secure hash using ARMv8 Crypto Extensions");
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("sha3-224");
-MODULE_ALIAS_CRYPTO("sha3-256");
-MODULE_ALIAS_CRYPTO("sha3-384");
-MODULE_ALIAS_CRYPTO("sha3-512");
-
-asmlinkage size_t sha3_ce_transform(struct sha3_state *state, const u8 *data,
-				    size_t nblocks, size_t block_size);
-
-static int arm64_sha3_update(struct shash_desc *desc, const u8 *data,
-			     unsigned int len)
-{
-	struct sha3_state *sctx = shash_desc_ctx(desc);
-	struct crypto_shash *tfm = desc->tfm;
-	unsigned int bs;
-	int blocks;
-
-	bs = crypto_shash_blocksize(tfm);
-	blocks = len / bs;
-	len -= blocks * bs;
-	do {
-		int rem;
-
-		kernel_neon_begin();
-		rem = sha3_ce_transform(sctx, data, blocks, bs);
-		kernel_neon_end();
-		data += (blocks - rem) * bs;
-		blocks = rem;
-	} while (blocks);
-	return len;
-}
-
-static int sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
-		      u8 *out)
-{
-	struct sha3_state *sctx = shash_desc_ctx(desc);
-	struct crypto_shash *tfm = desc->tfm;
-	__le64 *digest = (__le64 *)out;
-	u8 block[SHA3_224_BLOCK_SIZE];
-	unsigned int bs, ds;
-	int i;
-
-	ds = crypto_shash_digestsize(tfm);
-	bs = crypto_shash_blocksize(tfm);
-	memcpy(block, src, len);
-
-	block[len++] = 0x06;
-	memset(block + len, 0, bs - len);
-	block[bs - 1] |= 0x80;
-
-	kernel_neon_begin();
-	sha3_ce_transform(sctx, block, 1, bs);
-	kernel_neon_end();
-	memzero_explicit(block , sizeof(block));
-
-	for (i = 0; i < ds / 8; i++)
-		put_unaligned_le64(sctx->st[i], digest++);
-
-	if (ds & 4)
-		put_unaligned_le32(sctx->st[i], (__le32 *)digest);
-
-	return 0;
-}
-
-static struct shash_alg algs[] = { {
-	.digestsize		= SHA3_224_DIGEST_SIZE,
-	.init			= crypto_sha3_init,
-	.update			= arm64_sha3_update,
-	.finup			= sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
-	.base.cra_name		= "sha3-224",
-	.base.cra_driver_name	= "sha3-224-ce",
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
-	.base.cra_blocksize	= SHA3_224_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_priority	= 200,
-}, {
-	.digestsize		= SHA3_256_DIGEST_SIZE,
-	.init			= crypto_sha3_init,
-	.update			= arm64_sha3_update,
-	.finup			= sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
-	.base.cra_name		= "sha3-256",
-	.base.cra_driver_name	= "sha3-256-ce",
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
-	.base.cra_blocksize	= SHA3_256_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_priority	= 200,
-}, {
-	.digestsize		= SHA3_384_DIGEST_SIZE,
-	.init			= crypto_sha3_init,
-	.update			= arm64_sha3_update,
-	.finup			= sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
-	.base.cra_name		= "sha3-384",
-	.base.cra_driver_name	= "sha3-384-ce",
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
-	.base.cra_blocksize	= SHA3_384_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_priority	= 200,
-}, {
-	.digestsize		= SHA3_512_DIGEST_SIZE,
-	.init			= crypto_sha3_init,
-	.update			= arm64_sha3_update,
-	.finup			= sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
-	.base.cra_name		= "sha3-512",
-	.base.cra_driver_name	= "sha3-512-ce",
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
-	.base.cra_blocksize	= SHA3_512_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_priority	= 200,
-} };
-
-static int __init sha3_neon_mod_init(void)
-{
-	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
-}
-
-static void __exit sha3_neon_mod_fini(void)
-{
-	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
-}
-
-module_cpu_feature_match(SHA3, sha3_neon_mod_init);
-module_exit(sha3_neon_mod_fini);
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index a05f5a349cd8c..587490ca65654 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -200,10 +200,15 @@ config CRYPTO_LIB_SHA3
 	select CRYPTO_LIB_UTILS
 	help
 	  The SHA3 library functions.  Select this if your module uses any of
 	  the functions from <crypto/sha3.h>.
 
+config CRYPTO_LIB_SHA3_ARCH
+	bool
+	depends on CRYPTO_LIB_SHA3 && !UML
+	default y if ARM64 && KERNEL_MODE_NEON
+
 config CRYPTO_LIB_SM3
 	tristate
 
 source "lib/crypto/tests/Kconfig"
 
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 0cfdb511f32b6..5515e73bfd5e3 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -279,10 +279,15 @@ endif # CONFIG_CRYPTO_LIB_SHA512_ARCH
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_SHA3) += libsha3.o
 libsha3-y := sha3.o
 
+ifeq ($(CONFIG_CRYPTO_LIB_SHA3_ARCH),y)
+CFLAGS_sha3.o += -I$(src)/$(SRCARCH)
+libsha3-$(CONFIG_ARM64) += arm64/sha3-ce-core.o
+endif # CONFIG_CRYPTO_LIB_SHA3_ARCH
+
 ################################################################################
 
 obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS_FULL)		+= simd.o
diff --git a/arch/arm64/crypto/sha3-ce-core.S b/lib/crypto/arm64/sha3-ce-core.S
similarity index 100%
rename from arch/arm64/crypto/sha3-ce-core.S
rename to lib/crypto/arm64/sha3-ce-core.S
diff --git a/lib/crypto/arm64/sha3.h b/lib/crypto/arm64/sha3.h
new file mode 100644
index 0000000000000..6dd5183056da4
--- /dev/null
+++ b/lib/crypto/arm64/sha3.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <asm/neon.h>
+#include <asm/simd.h>
+#include <linux/cpufeature.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha3);
+
+asmlinkage size_t sha3_ce_transform(struct sha3_state *state, const u8 *data,
+				    size_t nblocks, size_t block_size);
+
+static void sha3_absorb_blocks(struct sha3_state *state, const u8 *data,
+			       size_t nblocks, size_t block_size)
+{
+	if (static_branch_likely(&have_sha3) && likely(may_use_simd())) {
+		do {
+			size_t rem;
+
+			kernel_neon_begin();
+			rem = sha3_ce_transform(state, data, nblocks,
+						block_size);
+			kernel_neon_end();
+			data += (nblocks - rem) * block_size;
+			nblocks = rem;
+		} while (nblocks);
+	} else {
+		sha3_absorb_blocks_generic(state, data, nblocks, block_size);
+	}
+}
+
+static void sha3_keccakf(struct sha3_state *state)
+{
+	if (static_branch_likely(&have_sha3) && likely(may_use_simd())) {
+		/*
+		 * Passing zeroes into sha3_ce_transform() gives the plain
+		 * Keccak-f permutation, which is what we want here.  Any
+		 * supported block size may be used.  Use SHA3_512_BLOCK_SIZE
+		 * since it's the shortest.
+		 */
+		static const u8 zeroes[SHA3_512_BLOCK_SIZE];
+
+		kernel_neon_begin();
+		sha3_ce_transform(state, zeroes, 1, sizeof(zeroes));
+		kernel_neon_end();
+	} else {
+		sha3_keccakf_generic(state);
+	}
+}
+
+#define sha3_mod_init_arch sha3_mod_init_arch
+static void sha3_mod_init_arch(void)
+{
+	if (cpu_have_named_feature(SHA3))
+		static_branch_enable(&have_sha3);
+}
-- 
2.51.1.dirty


