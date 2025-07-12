Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C53C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 23:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DmkwOoDCk6FpJstARBhRMfWibfO27MXl8Jp0cb9ovY=; b=nF2R/7lAqqwUeCe1jnapAUIlmo
	cT5lkL8O+Ymk8Dxaz17H/GUCFDuux29Q24lJa5+M/BaGYuU79vkj9uk57tfsgqBcz5ml2S9LwCA3g
	UQ44QlrjWGg/yuBqm2SWh3NZYZ8pa1F09jjETO++M9bMfDStAwv9v3u8yxTQHtFEM9C8wCEkErO0P
	zKs3owv6JYZrwCbL7BGP07zTS34uJzYvdlJs6f4t5IeTXvhkgdXuNj8mN2oxN7DcYNUh1GiGLqy7k
	7AYelSa6/ll2vAbXrgeTJSaUVv9b2mJlBj/A5qA79gBYVmfRuCxb1zdZJQEf/TdbAQUvQJAlO9bjT
	KP/n+2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uak4O-0000000HAlM-3OGk;
	Sat, 12 Jul 2025 23:55:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajbu-0000000H7Zm-0Jgq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 49A4AA54792;
	Sat, 12 Jul 2025 23:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF62C4CEFC;
	Sat, 12 Jul 2025 23:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362785;
	bh=+8vC3G9AEhz9GDqIivLu8sIg+zlvL2n5kSxCFBEHZMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lthbmvWLFBZkamzkq8eewPrB6hxUeGFP3EWU1TNaUceuzv22JG1U/ehFGlSQkpWzu
	 DzydsCXzUVxfLwawFmojHbWMQStwkoX84VMjBL8v/xrjNIueNbMQtYw368aEjXkUs9
	 Kvx036/YNOsyCLXOFLczY0gss8kOZBCmHHhtrjl3ZohnG11dD4z3wPl9sCVTDl948i
	 k1RZAnEG/bFGoFwPRsErxiJ41wHc9+SUMwDMCpkU9YZbvrLVGojY4whVzVmaqjTacY
	 YhMs6KhPWS/C38aKivzy1VNf4aqICRdskNqNvw3YXULYYJQlucBeCqFXO/wuE1OZty
	 2X8nVMgRTzmFQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 10/26] lib/crypto: powerpc/sha1: Migrate optimized code into library
Date: Sat, 12 Jul 2025 16:23:01 -0700
Message-ID: <20250712232329.818226-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_162626_246937_4DE506E1 
X-CRM114-Status: GOOD (  21.23  )
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

Instead of exposing the powerpc-optimized SHA-1 code via
powerpc-specific crypto_shash algorithms, instead just implement the
sha1_blocks() library function.  This is much simpler, it makes the
SHA-1 library functions be powerpc-optimized, and it fixes the
longstanding issue where the powerpc-optimized SHA-1 code was disabled
by default.  SHA-1 still remains available through crypto_shash, but
individual architectures no longer need to handle it.

Note: to see the diff from arch/powerpc/crypto/sha1-spe-glue.c to
lib/crypto/powerpc/sha1.h, view this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/powerpc/configs/44x/akebono_defconfig    |   1 -
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/crypto/Kconfig                   |  16 ---
 arch/powerpc/crypto/Makefile                  |   4 -
 arch/powerpc/crypto/sha1-spe-glue.c           | 107 ------------------
 arch/powerpc/crypto/sha1.c                    |  78 -------------
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   4 +
 .../crypto/powerpc}/sha1-powerpc-asm.S        |   0
 .../crypto/powerpc}/sha1-spe-asm.S            |   0
 lib/crypto/powerpc/sha1.h                     |  67 +++++++++++
 12 files changed, 72 insertions(+), 208 deletions(-)
 delete mode 100644 arch/powerpc/crypto/sha1-spe-glue.c
 delete mode 100644 arch/powerpc/crypto/sha1.c
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/sha1-powerpc-asm.S (100%)
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/sha1-spe-asm.S (100%)
 create mode 100644 lib/crypto/powerpc/sha1.h

diff --git a/arch/powerpc/configs/44x/akebono_defconfig b/arch/powerpc/configs/44x/akebono_defconfig
index fde4824f235ef..1882eb2da354a 100644
--- a/arch/powerpc/configs/44x/akebono_defconfig
+++ b/arch/powerpc/configs/44x/akebono_defconfig
@@ -126,8 +126,7 @@ CONFIG_XMON_DEFAULT=y
 CONFIG_PPC_EARLY_DEBUG=y
 CONFIG_PPC_EARLY_DEBUG_44x_PHYSLOW=0x00010000
 CONFIG_PPC_EARLY_DEBUG_44x_PHYSHIGH=0x33f
 CONFIG_CRYPTO_PCBC=y
 CONFIG_CRYPTO_MD5=y
-CONFIG_CRYPTO_SHA1_PPC=y
 CONFIG_CRYPTO_DES=y
 # CONFIG_CRYPTO_HW is not set
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 379229c982a49..98f56e63ad21c 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -320,11 +320,10 @@ CONFIG_XMON=y
 CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD5_PPC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_SHA1_PPC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST6=m
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 3423c405cad4b..dca67aae5da3c 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -386,11 +386,10 @@ CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_MD5_PPC=m
-CONFIG_CRYPTO_SHA1_PPC=m
 CONFIG_CRYPTO_AES_GCM_P10=m
 CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
 CONFIG_CRYPTO_DEV_VMX=y
 CONFIG_SYSTEM_TRUSTED_KEYRING=y
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index caaa359f47420..cfe39fc221cf8 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -21,26 +21,10 @@ config CRYPTO_MD5_PPC
 	help
 	  MD5 message digest algorithm (RFC1321)
 
 	  Architecture: powerpc
 
-config CRYPTO_SHA1_PPC
-	tristate "Hash functions: SHA-1"
-	help
-	  SHA-1 secure hash algorithm (FIPS 180)
-
-	  Architecture: powerpc
-
-config CRYPTO_SHA1_PPC_SPE
-	tristate "Hash functions: SHA-1 (SPE)"
-	depends on SPE
-	help
-	  SHA-1 secure hash algorithm (FIPS 180)
-
-	  Architecture: powerpc using
-	  - SPE (Signal Processing Engine) extensions
-
 config CRYPTO_AES_PPC_SPE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (SPE)"
 	depends on SPE
 	select CRYPTO_SKCIPHER
 	help
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 8c2936ae466fc..bc8fd27344b8b 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -5,20 +5,16 @@
 # Arch-specific CryptoAPI modules.
 #
 
 obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
 obj-$(CONFIG_CRYPTO_MD5_PPC) += md5-ppc.o
-obj-$(CONFIG_CRYPTO_SHA1_PPC) += sha1-powerpc.o
-obj-$(CONFIG_CRYPTO_SHA1_PPC_SPE) += sha1-ppc-spe.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 obj-$(CONFIG_CRYPTO_CURVE25519_PPC64) += curve25519-ppc64le.o
 
 aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-spe-glue.o
 md5-ppc-y := md5-asm.o md5-glue.o
-sha1-powerpc-y := sha1-powerpc-asm.o sha1.o
-sha1-ppc-spe-y := sha1-spe-asm.o sha1-spe-glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
 curve25519-ppc64le-y := curve25519-ppc64le-core.o curve25519-ppc64le_asm.o
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
diff --git a/arch/powerpc/crypto/sha1-spe-glue.c b/arch/powerpc/crypto/sha1-spe-glue.c
deleted file mode 100644
index 04c88e173ce15..0000000000000
--- a/arch/powerpc/crypto/sha1-spe-glue.c
+++ /dev/null
@@ -1,107 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Glue code for SHA-1 implementation for SPE instructions (PPC)
- *
- * Based on generic implementation.
- *
- * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
- */
-
-#include <asm/switch_to.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <crypto/sha1_base.h>
-#include <linux/kernel.h>
-#include <linux/preempt.h>
-#include <linux/module.h>
-
-/*
- * MAX_BYTES defines the number of bytes that are allowed to be processed
- * between preempt_disable() and preempt_enable(). SHA1 takes ~1000
- * operations per 64 bytes. e500 cores can issue two arithmetic instructions
- * per clock cycle using one 32/64 bit unit (SU1) and one 32 bit unit (SU2).
- * Thus 2KB of input data will need an estimated maximum of 18,000 cycles.
- * Headroom for cache misses included. Even with the low end model clocked
- * at 667 MHz this equals to a critical time window of less than 27us.
- *
- */
-#define MAX_BYTES 2048
-
-asmlinkage void ppc_spe_sha1_transform(u32 *state, const u8 *src, u32 blocks);
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
-static void ppc_spe_sha1_block(struct sha1_state *sctx, const u8 *src,
-			       int blocks)
-{
-	do {
-		int unit = min(blocks, MAX_BYTES / SHA1_BLOCK_SIZE);
-
-		spe_begin();
-		ppc_spe_sha1_transform(sctx->state, src, unit);
-		spe_end();
-
-		src += unit * SHA1_BLOCK_SIZE;
-		blocks -= unit;
-	} while (blocks);
-}
-
-static int ppc_spe_sha1_update(struct shash_desc *desc, const u8 *data,
-			unsigned int len)
-{
-	return sha1_base_do_update_blocks(desc, data, len, ppc_spe_sha1_block);
-}
-
-static int ppc_spe_sha1_finup(struct shash_desc *desc, const u8 *src,
-			      unsigned int len, u8 *out)
-{
-	sha1_base_do_finup(desc, src, len, ppc_spe_sha1_block);
-	return sha1_base_finish(desc, out);
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	sha1_base_init,
-	.update		=	ppc_spe_sha1_update,
-	.finup		=	ppc_spe_sha1_finup,
-	.descsize	=	SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha1",
-		.cra_driver_name=	"sha1-ppc-spe",
-		.cra_priority	=	300,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA1_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int __init ppc_spe_sha1_mod_init(void)
-{
-	return crypto_register_shash(&alg);
-}
-
-static void __exit ppc_spe_sha1_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(ppc_spe_sha1_mod_init);
-module_exit(ppc_spe_sha1_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA1 Secure Hash Algorithm, SPE optimized");
-
-MODULE_ALIAS_CRYPTO("sha1");
-MODULE_ALIAS_CRYPTO("sha1-ppc-spe");
diff --git a/arch/powerpc/crypto/sha1.c b/arch/powerpc/crypto/sha1.c
deleted file mode 100644
index 4593946aa9b33..0000000000000
--- a/arch/powerpc/crypto/sha1.c
+++ /dev/null
@@ -1,78 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Cryptographic API.
- *
- * powerpc implementation of the SHA1 Secure Hash Algorithm.
- *
- * Derived from cryptoapi implementation, adapted for in-place
- * scatterlist interface.
- *
- * Derived from "crypto/sha1.c"
- * Copyright (c) Alan Smithee.
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
- */
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <crypto/sha1_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-asmlinkage void powerpc_sha_transform(u32 *state, const u8 *src);
-
-static void powerpc_sha_block(struct sha1_state *sctx, const u8 *data,
-			      int blocks)
-{
-	do {
-		powerpc_sha_transform(sctx->state, data);
-		data += 64;
-	} while (--blocks);
-}
-
-static int powerpc_sha1_update(struct shash_desc *desc, const u8 *data,
-			       unsigned int len)
-{
-	return sha1_base_do_update_blocks(desc, data, len, powerpc_sha_block);
-}
-
-/* Add padding and return the message digest. */
-static int powerpc_sha1_finup(struct shash_desc *desc, const u8 *src,
-			      unsigned int len, u8 *out)
-{
-	sha1_base_do_finup(desc, src, len, powerpc_sha_block);
-	return sha1_base_finish(desc, out);
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	sha1_base_init,
-	.update		=	powerpc_sha1_update,
-	.finup		=	powerpc_sha1_finup,
-	.descsize	=	SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha1",
-		.cra_driver_name=	"sha1-powerpc",
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA1_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int __init sha1_powerpc_mod_init(void)
-{
-	return crypto_register_shash(&alg);
-}
-
-static void __exit sha1_powerpc_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(sha1_powerpc_mod_init);
-module_exit(sha1_powerpc_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA1 Secure Hash Algorithm");
-
-MODULE_ALIAS_CRYPTO("sha1");
-MODULE_ALIAS_CRYPTO("sha1-powerpc");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 278ac6a7eca97..e842f173cadec 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -147,10 +147,11 @@ config CRYPTO_LIB_SHA1_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA1 && !UML
 	default y if ARM
 	default y if ARM64 && KERNEL_MODE_NEON
 	default y if MIPS && CPU_CAVIUM_OCTEON
+	default y if PPC
 
 config CRYPTO_LIB_SHA256
 	tristate
 	help
 	  Enable the SHA-256 library interface. This interface may be fulfilled
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 11c8ac54bf7d1..3f4199c079307 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -77,10 +77,14 @@ ifeq ($(CONFIG_ARM),y)
 libsha1-y += arm/sha1-armv4-large.o
 libsha1-$(CONFIG_KERNEL_MODE_NEON) += arm/sha1-armv7-neon.o \
 				      arm/sha1-ce-core.o
 endif
 libsha1-$(CONFIG_ARM64) += arm64/sha1-ce-core.o
+ifeq ($(CONFIG_PPC),y)
+libsha1-y += powerpc/sha1-powerpc-asm.o
+libsha1-$(CONFIG_SPE) += powerpc/sha1-spe-asm.o
+endif
 endif # CONFIG_CRYPTO_LIB_SHA1_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_SHA256) += libsha256.o
diff --git a/arch/powerpc/crypto/sha1-powerpc-asm.S b/lib/crypto/powerpc/sha1-powerpc-asm.S
similarity index 100%
rename from arch/powerpc/crypto/sha1-powerpc-asm.S
rename to lib/crypto/powerpc/sha1-powerpc-asm.S
diff --git a/arch/powerpc/crypto/sha1-spe-asm.S b/lib/crypto/powerpc/sha1-spe-asm.S
similarity index 100%
rename from arch/powerpc/crypto/sha1-spe-asm.S
rename to lib/crypto/powerpc/sha1-spe-asm.S
diff --git a/lib/crypto/powerpc/sha1.h b/lib/crypto/powerpc/sha1.h
new file mode 100644
index 0000000000000..e2c010f0370bd
--- /dev/null
+++ b/lib/crypto/powerpc/sha1.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SHA-1 optimized for PowerPC
+ *
+ * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
+ */
+
+#include <asm/switch_to.h>
+#include <linux/preempt.h>
+
+#ifdef CONFIG_SPE
+/*
+ * MAX_BYTES defines the number of bytes that are allowed to be processed
+ * between preempt_disable() and preempt_enable(). SHA1 takes ~1000
+ * operations per 64 bytes. e500 cores can issue two arithmetic instructions
+ * per clock cycle using one 32/64 bit unit (SU1) and one 32 bit unit (SU2).
+ * Thus 2KB of input data will need an estimated maximum of 18,000 cycles.
+ * Headroom for cache misses included. Even with the low end model clocked
+ * at 667 MHz this equals to a critical time window of less than 27us.
+ *
+ */
+#define MAX_BYTES 2048
+
+asmlinkage void ppc_spe_sha1_transform(struct sha1_block_state *state,
+				       const u8 *data, u32 nblocks);
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
+static void sha1_blocks(struct sha1_block_state *state,
+			const u8 *data, size_t nblocks)
+{
+	do {
+		u32 unit = min_t(size_t, nblocks, MAX_BYTES / SHA1_BLOCK_SIZE);
+
+		spe_begin();
+		ppc_spe_sha1_transform(state, data, unit);
+		spe_end();
+
+		data += unit * SHA1_BLOCK_SIZE;
+		nblocks -= unit;
+	} while (nblocks);
+}
+#else /* CONFIG_SPE */
+asmlinkage void powerpc_sha_transform(struct sha1_block_state *state,
+				      const u8 data[SHA1_BLOCK_SIZE]);
+
+static void sha1_blocks(struct sha1_block_state *state,
+			const u8 *data, size_t nblocks)
+{
+	do {
+		powerpc_sha_transform(state, data);
+		data += SHA1_BLOCK_SIZE;
+	} while (--nblocks);
+}
+#endif /* !CONFIG_SPE */
-- 
2.50.1


