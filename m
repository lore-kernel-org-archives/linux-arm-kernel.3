Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BA9C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:
	References:In-Reply-To:Message-Id:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIpcE3DcMWrfSX+Dke3Gf+/LT4mjSrvIFI40rk+L1CU=; b=R1j0x/WGe65L8JhLP6S2AebBZd
	DHlRpIpv10+6JDms2JdNpRGxQekoaj9lCa5UeHDw9Ix8hLUuU7tvgrZ6WArl0cr4kOSwi++g75JAi
	RX04z6L2YBHb71Ry2oVvKtTcf+ArlpHGfI+DS8sLS9oGrt/1tnyDcp0Gw5DjdweBODYISFT1XVOAI
	1hWQ/GG9obhiNulirxpDZyaa1QLl+6EoScutwONN5J2n2MrOlVGJzbGg/8V4EUsSIEfpUeOGT6EYq
	rUchrLq77pApIoD7AyVW9C6T2zI5dLDyEpsnm/L3m3iezKCPaMelCZJL+dO0fJbGBGmyzAwwMJpzS
	un8VhTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wwV-000000038dg-3heD;
	Sun, 27 Apr 2025 08:00:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vXh-00000002zeR-2DFI;
	Sun, 27 Apr 2025 06:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Subject:From:References:
	In-Reply-To:Message-Id:Date:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yIpcE3DcMWrfSX+Dke3Gf+/LT4mjSrvIFI40rk+L1CU=; b=Dgom6VFShUn9aleEZyzB24e8pV
	W/T7vczOVY94TOv3CgNyWGKyI1NtRXZe5Q5PEwvNqWyelWmmP7CkPFT6XewLSLU2KU712FFEwx0bD
	577k08IYzkk8Q2XXryV9UpzcYYYbNYLU2/Y8FSBo9V/fSyIY0gMs0HSzw9l7Rbrs2fAMPEDDpm+ix
	2XWxG2zYX9r4JxW2VrmWJK2uVwjUxuRv/99ut0rFZl6DroXHQBlt3SmfDG5oz+9eksNWG4bsj6ucZ
	VgD3AK9/vWv0ecoRLhu4IH18Mu/T46oX9bpaH0A7nmLnb3QOpO1JFyMlJI/oUMnIy8thDbuoo5+wC
	Is42a2bg==;
Received: from abb.hmeau.com ([144.6.53.87])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8vXY-0000000CPQ0-0bWT;
	Sun, 27 Apr 2025 06:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yIpcE3DcMWrfSX+Dke3Gf+/LT4mjSrvIFI40rk+L1CU=; b=WYVidzVTQqPe+nzd36S0Ym9SNr
	Z2CeNx11juFaC8iDAaxd3B6rv/SqQfl+CrWcSL974GrnJo+6veKOC+kPJQDwqip0RGbJQ/c7Ix3OM
	pSWuYrjuTT3lGBqT+5jvDEqTSu/GRRZ8DBPzBDPhfQOiTog23S0XQ94u2V/Vp6w29hYbKC5OtRY9L
	49Zior9qNAOEyAgBXOM9+Md8J3xT97zybFC5WgeLHjLgvweRJRnVEs36KNNhkeNjs55S7w9aFj6RF
	ORVvV8LxjsDkLtZ/7AhKprhOFLrUjxybxGjxeQ5AqxjrIZlBBfmHzFy4ecmHDyg/B+0Sx+9Js0xGH
	opTlZEgg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8vXT-001LVl-2T;
	Sun, 27 Apr 2025 14:30:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 14:30:55 +0800
Date: Sun, 27 Apr 2025 14:30:55 +0800
Message-Id: <ebaf96389274ac47be8d0848b7b89fde4d7a2da0.1745734678.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745734678.git.herbert@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v2 PATCH 06/13] crypto: powerpc/sha256 - implement library instead
 of shash
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld " <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_073104_080605_CB51EDEC 
X-CRM114-Status: GOOD (  18.56  )
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

Instead of providing crypto_shash algorithms for the arch-optimized
SHA-256 code, instead implement the SHA-256 library.  This is much
simpler, it makes the SHA-256 library functions be arch-optimized, and
it fixes the longstanding issue where the arch-optimized SHA-256 was
disabled by default.  SHA-256 still remains available through
crypto_shash, but individual architectures no longer need to handle it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 arch/powerpc/crypto/Kconfig                   |  11 --
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/sha256-spe-glue.c         | 128 ------------------
 arch/powerpc/lib/crypto/Kconfig               |   6 +
 arch/powerpc/lib/crypto/Makefile              |   3 +
 .../powerpc/{ => lib}/crypto/sha256-spe-asm.S |   0
 arch/powerpc/lib/crypto/sha256.c              |  70 ++++++++++
 7 files changed, 79 insertions(+), 141 deletions(-)
 delete mode 100644 arch/powerpc/crypto/sha256-spe-glue.c
 rename arch/powerpc/{ => lib}/crypto/sha256-spe-asm.S (100%)
 create mode 100644 arch/powerpc/lib/crypto/sha256.c

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 4bf7b01228e7..caaa359f4742 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -39,17 +39,6 @@ config CRYPTO_SHA1_PPC_SPE
 	  Architecture: powerpc using
 	  - SPE (Signal Processing Engine) extensions
 
-config CRYPTO_SHA256_PPC_SPE
-	tristate "Hash functions: SHA-224 and SHA-256 (SPE)"
-	depends on SPE
-	select CRYPTO_SHA256
-	select CRYPTO_HASH
-	help
-	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
-
-	  Architecture: powerpc using
-	  - SPE (Signal Processing Engine) extensions
-
 config CRYPTO_AES_PPC_SPE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (SPE)"
 	depends on SPE
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index f13aec8a1833..8c2936ae466f 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -9,7 +9,6 @@ obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
 obj-$(CONFIG_CRYPTO_MD5_PPC) += md5-ppc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC) += sha1-powerpc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC_SPE) += sha1-ppc-spe.o
-obj-$(CONFIG_CRYPTO_SHA256_PPC_SPE) += sha256-ppc-spe.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 obj-$(CONFIG_CRYPTO_CURVE25519_PPC64) += curve25519-ppc64le.o
@@ -18,7 +17,6 @@ aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-
 md5-ppc-y := md5-asm.o md5-glue.o
 sha1-powerpc-y := sha1-powerpc-asm.o sha1.o
 sha1-ppc-spe-y := sha1-spe-asm.o sha1-spe-glue.o
-sha256-ppc-spe-y := sha256-spe-asm.o sha256-spe-glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
 curve25519-ppc64le-y := curve25519-ppc64le-core.o curve25519-ppc64le_asm.o
diff --git a/arch/powerpc/crypto/sha256-spe-glue.c b/arch/powerpc/crypto/sha256-spe-glue.c
deleted file mode 100644
index 42c76bf8062d..000000000000
--- a/arch/powerpc/crypto/sha256-spe-glue.c
+++ /dev/null
@@ -1,128 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Glue code for SHA-256 implementation for SPE instructions (PPC)
- *
- * Based on generic implementation. The assembler module takes care 
- * about the SPE registers so it can run from interrupt context.
- *
- * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
- */
-
-#include <asm/switch_to.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha256_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/preempt.h>
-
-/*
- * MAX_BYTES defines the number of bytes that are allowed to be processed
- * between preempt_disable() and preempt_enable(). SHA256 takes ~2,000
- * operations per 64 bytes. e500 cores can issue two arithmetic instructions
- * per clock cycle using one 32/64 bit unit (SU1) and one 32 bit unit (SU2).
- * Thus 1KB of input data will need an estimated maximum of 18,000 cycles.
- * Headroom for cache misses included. Even with the low end model clocked
- * at 667 MHz this equals to a critical time window of less than 27us.
- *
- */
-#define MAX_BYTES 1024
-
-extern void ppc_spe_sha256_transform(u32 *state, const u8 *src, u32 blocks);
-
-static void spe_begin(void)
-{
-	/* We just start SPE operations and will save SPE registers later. */
-	preempt_disable();
-	enable_kernel_spe();
-}
-
-static void spe_end(void)
-{
-	disable_kernel_spe();
-	/* reenable preemption */
-	preempt_enable();
-}
-
-static void ppc_spe_sha256_block(struct crypto_sha256_state *sctx,
-				 const u8 *src, int blocks)
-{
-	do {
-		/* cut input data into smaller blocks */
-		int unit = min(blocks, MAX_BYTES / SHA256_BLOCK_SIZE);
-
-		spe_begin();
-		ppc_spe_sha256_transform(sctx->state, src, unit);
-		spe_end();
-
-		src += unit * SHA256_BLOCK_SIZE;
-		blocks -= unit;
-	} while (blocks);
-}
-
-static int ppc_spe_sha256_update(struct shash_desc *desc, const u8 *data,
-			unsigned int len)
-{
-	return sha256_base_do_update_blocks(desc, data, len,
-					    ppc_spe_sha256_block);
-}
-
-static int ppc_spe_sha256_finup(struct shash_desc *desc, const u8 *src,
-				unsigned int len, u8 *out)
-{
-	sha256_base_do_finup(desc, src, len, ppc_spe_sha256_block);
-	return sha256_base_finish(desc, out);
-}
-
-static struct shash_alg algs[2] = { {
-	.digestsize	=	SHA256_DIGEST_SIZE,
-	.init		=	sha256_base_init,
-	.update		=	ppc_spe_sha256_update,
-	.finup		=	ppc_spe_sha256_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha256",
-		.cra_driver_name=	"sha256-ppc-spe",
-		.cra_priority	=	300,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA256_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-}, {
-	.digestsize	=	SHA224_DIGEST_SIZE,
-	.init		=	sha224_base_init,
-	.update		=	ppc_spe_sha256_update,
-	.finup		=	ppc_spe_sha256_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha224",
-		.cra_driver_name=	"sha224-ppc-spe",
-		.cra_priority	=	300,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA224_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-} };
-
-static int __init ppc_spe_sha256_mod_init(void)
-{
-	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
-}
-
-static void __exit ppc_spe_sha256_mod_fini(void)
-{
-	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
-}
-
-module_init(ppc_spe_sha256_mod_init);
-module_exit(ppc_spe_sha256_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-224 and SHA-256 Secure Hash Algorithm, SPE optimized");
-
-MODULE_ALIAS_CRYPTO("sha224");
-MODULE_ALIAS_CRYPTO("sha224-ppc-spe");
-MODULE_ALIAS_CRYPTO("sha256");
-MODULE_ALIAS_CRYPTO("sha256-ppc-spe");
diff --git a/arch/powerpc/lib/crypto/Kconfig b/arch/powerpc/lib/crypto/Kconfig
index bf6d0ab22c27..ffa541ad6d5d 100644
--- a/arch/powerpc/lib/crypto/Kconfig
+++ b/arch/powerpc/lib/crypto/Kconfig
@@ -13,3 +13,9 @@ config CRYPTO_POLY1305_P10
 	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC
+
+config CRYPTO_SHA256_PPC_SPE
+	tristate
+	depends on SPE
+	default CRYPTO_LIB_SHA256
+	select CRYPTO_ARCH_HAVE_LIB_SHA256
diff --git a/arch/powerpc/lib/crypto/Makefile b/arch/powerpc/lib/crypto/Makefile
index 5709ae14258a..27f231f8e334 100644
--- a/arch/powerpc/lib/crypto/Makefile
+++ b/arch/powerpc/lib/crypto/Makefile
@@ -5,3 +5,6 @@ chacha-p10-crypto-y := chacha-p10-glue.o chacha-p10le-8x.o
 
 obj-$(CONFIG_CRYPTO_POLY1305_P10) += poly1305-p10-crypto.o
 poly1305-p10-crypto-y := poly1305-p10-glue.o poly1305-p10le_64.o
+
+obj-$(CONFIG_CRYPTO_SHA256_PPC_SPE) += sha256-ppc-spe.o
+sha256-ppc-spe-y := sha256.o sha256-spe-asm.o
diff --git a/arch/powerpc/crypto/sha256-spe-asm.S b/arch/powerpc/lib/crypto/sha256-spe-asm.S
similarity index 100%
rename from arch/powerpc/crypto/sha256-spe-asm.S
rename to arch/powerpc/lib/crypto/sha256-spe-asm.S
diff --git a/arch/powerpc/lib/crypto/sha256.c b/arch/powerpc/lib/crypto/sha256.c
new file mode 100644
index 000000000000..6b0f079587eb
--- /dev/null
+++ b/arch/powerpc/lib/crypto/sha256.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SHA-256 Secure Hash Algorithm, SPE optimized
+ *
+ * Based on generic implementation. The assembler module takes care
+ * about the SPE registers so it can run from interrupt context.
+ *
+ * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
+ */
+
+#include <asm/switch_to.h>
+#include <crypto/internal/sha2.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/preempt.h>
+
+/*
+ * MAX_BYTES defines the number of bytes that are allowed to be processed
+ * between preempt_disable() and preempt_enable(). SHA256 takes ~2,000
+ * operations per 64 bytes. e500 cores can issue two arithmetic instructions
+ * per clock cycle using one 32/64 bit unit (SU1) and one 32 bit unit (SU2).
+ * Thus 1KB of input data will need an estimated maximum of 18,000 cycles.
+ * Headroom for cache misses included. Even with the low end model clocked
+ * at 667 MHz this equals to a critical time window of less than 27us.
+ *
+ */
+#define MAX_BYTES 1024
+
+extern void ppc_spe_sha256_transform(u32 *state, const u8 *src, u32 blocks);
+
+static void spe_begin(void)
+{
+	/* We just start SPE operations and will save SPE registers later. */
+	preempt_disable();
+	enable_kernel_spe();
+}
+
+static void spe_end(void)
+{
+	disable_kernel_spe();
+	/* reenable preemption */
+	preempt_enable();
+}
+
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+			const u8 *data, size_t nblocks)
+{
+	do {
+		/* cut input data into smaller blocks */
+		u32 unit = min_t(size_t, nblocks,
+				 MAX_BYTES / SHA256_BLOCK_SIZE);
+
+		spe_begin();
+		ppc_spe_sha256_transform(state, data, unit);
+		spe_end();
+
+		data += unit * SHA256_BLOCK_SIZE;
+		nblocks -= unit;
+	} while (nblocks);
+}
+EXPORT_SYMBOL_GPL(sha256_blocks_arch);
+
+bool sha256_is_arch_optimized(void)
+{
+	return true;
+}
+EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm, SPE optimized");
-- 
2.39.5


