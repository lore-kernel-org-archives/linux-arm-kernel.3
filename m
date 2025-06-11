Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C2CC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 02:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ0NuysIx3M3rdPPl/MKhzStxwQtqIEts+4Ymi0laA8=; b=Kubks7wSs2AgrjQYg4Lr5PVa0r
	jxb8Rpe3jW79EyfYO3RQZoD+xu3tdLQf8ErPQvJHE8uxPxg3AbxOxsJht4L7UoIF9o66ViGaFNcAs
	yDCYth11LGqlIQ8rvNF5ICbMvpmGmw44EeZIYJwiLIj0y9ndAbNZmWMKF5hypY2lFPT2IebhOHVdW
	fj2rFbIEdQQ3oEdHuVc5BceHrD1ujgXBIS2WQRCHb5xCYhTKUPZ+3M4F6Zf4jNLDyTO6N5lxIuCI8
	Q/64OWp+hyirzKCl5BfodmjL2o1Hg7v+2bSX+ROATfzRcIgkniWUdTbY34na5lO1izbyemwdQX7SW
	C22FYrag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBVa-00000008gWR-2xBp;
	Wed, 11 Jun 2025 02:48:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAxb-00000008cTp-3Kiz;
	Wed, 11 Jun 2025 02:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RQ0NuysIx3M3rdPPl/MKhzStxwQtqIEts+4Ymi0laA8=; b=nu+kdwmOvGVkcyFxcMyRqnP7pV
	KeIxTXXZ2B4YvtjC3cqMjmBm/qUPHUyMIiQ4bLuCX3mPXr0df1akD2+s9qgTBK4ag94VVvPr3FBsX
	FLFEhCk21UkvFvMlyykMbcjdSly8lrKmltYubdbiIt9m3Fb1d/NZE+h3v17w59ftfUdYGRY73/qu3
	uNUfXt68RLtE+mG2nvR+rU7xgGBRVUq+Mv4jSh57pGkmgouP3E8lF4/7Lw5qzMKWi9H33ipAxN1LE
	MGMR7tU4s6XnPvyd83ywhuEz+y0QS179/LoVjKHjgiOF1gqa3k2uSZVwP0Jk31jKZy+VzqZa4PyWI
	9m3qDxnw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAxX-000000024Pv-27qW;
	Wed, 11 Jun 2025 02:13:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99C95A512B4;
	Wed, 11 Jun 2025 02:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5ADC4CEED;
	Wed, 11 Jun 2025 02:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607977;
	bh=y8WVWV51riY9pcb/NwcVxpkYon0f0gIC9BCyDuk5o8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ekKPNR7jN30Hk3mvvl31DwbyHo9grTt3SevSXRieCrZOs1/c5U0k0z7ity/EEeYAr
	 R82sSxR+uwBe7KpRDnhgvDJzEld9ROUw8YfdH/g7pOK0d0mT9y45+pZB69gOe95Do2
	 24bFOZRl6b5lZihn3TD69oOYaSt+qBo/LThUau57YAgS0Ce2p8ZElBY0qhyrdGDIcW
	 Jqdnrau8IeTA8q8fYJ5dmFcoXPI62ogBNWTWuIkzDTnY4t3tOKp46/YQSmbz5WWnd/
	 ra1KUeoRrMv8hs0oq8Ioe2W3IN3ZZBR08DEcWJACPglOrfwAfGWl3584kZIuGsvfS9
	 aRTrhypS03iIA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 11/16] lib/crypto/sha512: migrate mips-optimized SHA-512 code to library
Date: Tue, 10 Jun 2025 19:09:18 -0700
Message-ID: <20250611020923.1482701-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611020923.1482701-1-ebiggers@kernel.org>
References: <20250611020923.1482701-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_031259_802366_9BB1CF4F 
X-CRM114-Status: GOOD (  20.56  )
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

Instead of exposing the mips-optimized SHA-512 code via mips-specific
crypto_shash algorithms, instead just implement the sha512_blocks()
library function.  This is much simpler, it makes the SHA-512 (and
SHA-384) library functions be mips-optimized, and it fixes the
longstanding issue where the mips-optimized SHA-512 code was disabled by
default.  SHA-512 still remains available through crypto_shash, but
individual architectures no longer need to handle it.

Note: to see the diff from
arch/mips/cavium-octeon/crypto/octeon-sha512.c to
lib/crypto/mips/sha512.h, view this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/cavium-octeon/crypto/Makefile       |   1 -
 .../mips/cavium-octeon/crypto/octeon-sha512.c | 166 ------------------
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 --
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/mips/sha512.h                      |  74 ++++++++
 6 files changed, 75 insertions(+), 178 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-sha512.c
 create mode 100644 lib/crypto/mips/sha512.h

diff --git a/arch/mips/cavium-octeon/crypto/Makefile b/arch/mips/cavium-octeon/crypto/Makefile
index db26c73fa0eda..168b19ef7ce89 100644
--- a/arch/mips/cavium-octeon/crypto/Makefile
+++ b/arch/mips/cavium-octeon/crypto/Makefile
@@ -6,6 +6,5 @@
 obj-y += octeon-crypto.o
 
 obj-$(CONFIG_CRYPTO_MD5_OCTEON)		+= octeon-md5.o
 obj-$(CONFIG_CRYPTO_SHA1_OCTEON)	+= octeon-sha1.o
 obj-$(CONFIG_CRYPTO_SHA256_OCTEON)	+= octeon-sha256.o
-obj-$(CONFIG_CRYPTO_SHA512_OCTEON)	+= octeon-sha512.o
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha512.c b/arch/mips/cavium-octeon/crypto/octeon-sha512.c
deleted file mode 100644
index 53de74f642db0..0000000000000
--- a/arch/mips/cavium-octeon/crypto/octeon-sha512.c
+++ /dev/null
@@ -1,166 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Cryptographic API.
- *
- * SHA-512 and SHA-384 Secure Hash Algorithm.
- *
- * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
- *
- * Based on crypto/sha512_generic.c, which is:
- *
- * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
- */
-
-#include <asm/octeon/crypto.h>
-#include <asm/octeon/octeon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha512_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-/*
- * We pass everything as 64-bit. OCTEON can handle misaligned data.
- */
-
-static void octeon_sha512_store_hash(struct sha512_state *sctx)
-{
-	write_octeon_64bit_hash_sha512(sctx->state[0], 0);
-	write_octeon_64bit_hash_sha512(sctx->state[1], 1);
-	write_octeon_64bit_hash_sha512(sctx->state[2], 2);
-	write_octeon_64bit_hash_sha512(sctx->state[3], 3);
-	write_octeon_64bit_hash_sha512(sctx->state[4], 4);
-	write_octeon_64bit_hash_sha512(sctx->state[5], 5);
-	write_octeon_64bit_hash_sha512(sctx->state[6], 6);
-	write_octeon_64bit_hash_sha512(sctx->state[7], 7);
-}
-
-static void octeon_sha512_read_hash(struct sha512_state *sctx)
-{
-	sctx->state[0] = read_octeon_64bit_hash_sha512(0);
-	sctx->state[1] = read_octeon_64bit_hash_sha512(1);
-	sctx->state[2] = read_octeon_64bit_hash_sha512(2);
-	sctx->state[3] = read_octeon_64bit_hash_sha512(3);
-	sctx->state[4] = read_octeon_64bit_hash_sha512(4);
-	sctx->state[5] = read_octeon_64bit_hash_sha512(5);
-	sctx->state[6] = read_octeon_64bit_hash_sha512(6);
-	sctx->state[7] = read_octeon_64bit_hash_sha512(7);
-}
-
-static void octeon_sha512_transform(struct sha512_state *sctx,
-				    const u8 *src, int blocks)
-{
-	do {
-		const u64 *block = (const u64 *)src;
-
-		write_octeon_64bit_block_sha512(block[0], 0);
-		write_octeon_64bit_block_sha512(block[1], 1);
-		write_octeon_64bit_block_sha512(block[2], 2);
-		write_octeon_64bit_block_sha512(block[3], 3);
-		write_octeon_64bit_block_sha512(block[4], 4);
-		write_octeon_64bit_block_sha512(block[5], 5);
-		write_octeon_64bit_block_sha512(block[6], 6);
-		write_octeon_64bit_block_sha512(block[7], 7);
-		write_octeon_64bit_block_sha512(block[8], 8);
-		write_octeon_64bit_block_sha512(block[9], 9);
-		write_octeon_64bit_block_sha512(block[10], 10);
-		write_octeon_64bit_block_sha512(block[11], 11);
-		write_octeon_64bit_block_sha512(block[12], 12);
-		write_octeon_64bit_block_sha512(block[13], 13);
-		write_octeon_64bit_block_sha512(block[14], 14);
-		octeon_sha512_start(block[15]);
-
-		src += SHA512_BLOCK_SIZE;
-	} while (--blocks);
-}
-
-static int octeon_sha512_update(struct shash_desc *desc, const u8 *data,
-				unsigned int len)
-{
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-	struct octeon_cop2_state state;
-	unsigned long flags;
-	int remain;
-
-	flags = octeon_crypto_enable(&state);
-	octeon_sha512_store_hash(sctx);
-
-	remain = sha512_base_do_update_blocks(desc, data, len,
-					      octeon_sha512_transform);
-
-	octeon_sha512_read_hash(sctx);
-	octeon_crypto_disable(&state, flags);
-	return remain;
-}
-
-static int octeon_sha512_finup(struct shash_desc *desc, const u8 *src,
-			       unsigned int len, u8 *hash)
-{
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-	struct octeon_cop2_state state;
-	unsigned long flags;
-
-	flags = octeon_crypto_enable(&state);
-	octeon_sha512_store_hash(sctx);
-
-	sha512_base_do_finup(desc, src, len, octeon_sha512_transform);
-
-	octeon_sha512_read_hash(sctx);
-	octeon_crypto_disable(&state, flags);
-	return sha512_base_finish(desc, hash);
-}
-
-static struct shash_alg octeon_sha512_algs[2] = { {
-	.digestsize	=	SHA512_DIGEST_SIZE,
-	.init		=	sha512_base_init,
-	.update		=	octeon_sha512_update,
-	.finup		=	octeon_sha512_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha512",
-		.cra_driver_name=	"octeon-sha512",
-		.cra_priority	=	OCTEON_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA512_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-}, {
-	.digestsize	=	SHA384_DIGEST_SIZE,
-	.init		=	sha384_base_init,
-	.update		=	octeon_sha512_update,
-	.finup		=	octeon_sha512_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha384",
-		.cra_driver_name=	"octeon-sha384",
-		.cra_priority	=	OCTEON_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA384_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-} };
-
-static int __init octeon_sha512_mod_init(void)
-{
-	if (!octeon_has_crypto())
-		return -ENOTSUPP;
-	return crypto_register_shashes(octeon_sha512_algs,
-				       ARRAY_SIZE(octeon_sha512_algs));
-}
-
-static void __exit octeon_sha512_mod_fini(void)
-{
-	crypto_unregister_shashes(octeon_sha512_algs,
-				  ARRAY_SIZE(octeon_sha512_algs));
-}
-
-module_init(octeon_sha512_mod_init);
-module_exit(octeon_sha512_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-512 and SHA-384 Secure Hash Algorithms (OCTEON)");
-MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
diff --git a/arch/mips/configs/cavium_octeon_defconfig b/arch/mips/configs/cavium_octeon_defconfig
index 88ae0aa85364b..effdfb2bb738b 100644
--- a/arch/mips/configs/cavium_octeon_defconfig
+++ b/arch/mips/configs/cavium_octeon_defconfig
@@ -155,11 +155,10 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_CRYPTO_CBC=y
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD5_OCTEON=y
 CONFIG_CRYPTO_SHA1_OCTEON=m
-CONFIG_CRYPTO_SHA512_OCTEON=m
 CONFIG_CRYPTO_DES=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 6bf073ae7613f..51a76a5ee3b16 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -20,16 +20,6 @@ config CRYPTO_SHA1_OCTEON
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: mips OCTEON
 
-config CRYPTO_SHA512_OCTEON
-	tristate "Hash functions: SHA-384 and SHA-512 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
-	select CRYPTO_SHA512
-	select CRYPTO_HASH
-	help
-	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
-
-	  Architecture: mips OCTEON using crypto instructions, when available
-
 endmenu
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 5f474a57a041c..7e54348f70ec1 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -179,10 +179,11 @@ config CRYPTO_LIB_SHA512
 config CRYPTO_LIB_SHA512_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA512
 	default y if ARM && !CPU_V7M
 	default y if ARM64
+	default y if MIPS && CPU_CAVIUM_OCTEON
 
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
diff --git a/lib/crypto/mips/sha512.h b/lib/crypto/mips/sha512.h
new file mode 100644
index 0000000000000..b3ffbc1e8ca8e
--- /dev/null
+++ b/lib/crypto/mips/sha512.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Cryptographic API.
+ *
+ * SHA-512 and SHA-384 Secure Hash Algorithm.
+ *
+ * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
+ *
+ * Based on crypto/sha512_generic.c, which is:
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
+ */
+
+#include <asm/octeon/crypto.h>
+#include <asm/octeon/octeon.h>
+
+/*
+ * We pass everything as 64-bit. OCTEON can handle misaligned data.
+ */
+
+static void sha512_blocks(struct sha512_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	struct octeon_cop2_state cop2_state;
+	unsigned long flags;
+
+	if (!octeon_has_crypto())
+		return sha512_blocks_generic(state, data, nblocks);
+
+	flags = octeon_crypto_enable(&cop2_state);
+	write_octeon_64bit_hash_sha512(state->h[0], 0);
+	write_octeon_64bit_hash_sha512(state->h[1], 1);
+	write_octeon_64bit_hash_sha512(state->h[2], 2);
+	write_octeon_64bit_hash_sha512(state->h[3], 3);
+	write_octeon_64bit_hash_sha512(state->h[4], 4);
+	write_octeon_64bit_hash_sha512(state->h[5], 5);
+	write_octeon_64bit_hash_sha512(state->h[6], 6);
+	write_octeon_64bit_hash_sha512(state->h[7], 7);
+
+	do {
+		const u64 *block = (const u64 *)data;
+
+		write_octeon_64bit_block_sha512(block[0], 0);
+		write_octeon_64bit_block_sha512(block[1], 1);
+		write_octeon_64bit_block_sha512(block[2], 2);
+		write_octeon_64bit_block_sha512(block[3], 3);
+		write_octeon_64bit_block_sha512(block[4], 4);
+		write_octeon_64bit_block_sha512(block[5], 5);
+		write_octeon_64bit_block_sha512(block[6], 6);
+		write_octeon_64bit_block_sha512(block[7], 7);
+		write_octeon_64bit_block_sha512(block[8], 8);
+		write_octeon_64bit_block_sha512(block[9], 9);
+		write_octeon_64bit_block_sha512(block[10], 10);
+		write_octeon_64bit_block_sha512(block[11], 11);
+		write_octeon_64bit_block_sha512(block[12], 12);
+		write_octeon_64bit_block_sha512(block[13], 13);
+		write_octeon_64bit_block_sha512(block[14], 14);
+		octeon_sha512_start(block[15]);
+
+		data += SHA512_BLOCK_SIZE;
+	} while (--nblocks);
+
+	state->h[0] = read_octeon_64bit_hash_sha512(0);
+	state->h[1] = read_octeon_64bit_hash_sha512(1);
+	state->h[2] = read_octeon_64bit_hash_sha512(2);
+	state->h[3] = read_octeon_64bit_hash_sha512(3);
+	state->h[4] = read_octeon_64bit_hash_sha512(4);
+	state->h[5] = read_octeon_64bit_hash_sha512(5);
+	state->h[6] = read_octeon_64bit_hash_sha512(6);
+	state->h[7] = read_octeon_64bit_hash_sha512(7);
+	octeon_crypto_disable(&cop2_state, flags);
+}
-- 
2.49.0


