Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E4E1093170
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 04:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1lJ1WRe867Cj9VD9EUWM1NxQJGT4WiWiqOcaGzcpeM=; b=Yb08d9qFwBgxQ77smjdTCvVjDW
	vLpyRvz9gl+7ZHi8i/WkuiQ/0rumhP0xKV/8FdkSO1oju5eQBNXunwrbgT89/HAFd3YlMyFA8YY54
	Tog9iSnJxnsto85NVaqrXIEaMiFavwVYskH1HRsctnic0+Rx/sKPlXJK4tKWgP2jg+ITmwd3LWXl1
	Pt7BXXnOjkBEB3ioZxI+njpo9lh90aJn7FQsSYDdOmWWEF22vk+yEBClzzTjAHxFM0mXEsH5ck/aT
	8p0kU0MeZl1Gnkf2C9Up4o1ACSeXqjhGK6v+qiSPQfyJUU9tifRAHYwPNN+9Ul2xU7jwjg0+NdKVl
	13UZSbew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3nhv-0000000E0Jg-1fsO;
	Sat, 21 Mar 2026 04:13:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ngw-0000000DzPx-1TIy;
	Sat, 21 Mar 2026 04:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 418E040114;
	Sat, 21 Mar 2026 04:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AD3C2BCB0;
	Sat, 21 Mar 2026 04:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774066321;
	bh=YW10uVd2NOXIvAeaMesS4TeFHv3aOha7K5DncxOyXD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gxRI9h+PiGlfUssVJ/ANjwz9oPux4fSSu8nEwUaUHSgdPLGgE8ut8izsvQXupb2rh
	 u69G2HclNr4+yP0tH8PO3bbymNCKpT+KdOJcgEXMIIrzExfVthhslVIEWLECgm+rnm
	 2qM0wTjkEVkkY+XUQUwfYMjxF0CoTpdeNhlxfr3Azv6HzJXqpGgbPUAufjyxjnEtUj
	 gZQKPwrD3PBVCNTCLB6AyciIgCQK95h81dMPbpuGI5xxGQM+D1goGMihROhPYXrDUk
	 2TZeirP1qCDjOpMPdfAqZZZkSnNAHsdiVWSsPtEWjGG1hOoXBw3IZrNKf8/6Qwm+IZ
	 Mmkj/qQp2gecA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 07/12] lib/crypto: arm64/sm3: Migrate optimized code into library
Date: Fri, 20 Mar 2026 21:09:30 -0700
Message-ID: <20260321040935.410034-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321040935.410034-1-ebiggers@kernel.org>
References: <20260321040935.410034-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211202_472379_909535C6 
X-CRM114-Status: GOOD (  20.18  )
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

Instead of exposing the arm64-optimized SM3 code via arm64-specific
crypto_shash algorithms, instead just implement the sm3_blocks() library
function.  This is much simpler, it makes the SM3 library functions be
arm64-optimized, and it fixes the longstanding issue where the
arm64-optimized SM3 code was disabled by default.  SM3 still remains
available through crypto_shash, but individual architectures no longer
need to handle it.

Tweak the SM3 assembly function prototypes to match what the library
expects, including changing the block count from 'int' to 'size_t'.
sm3_ce_transform() had to be updated to access 'x2' instead of 'w2',
while sm3_neon_transform() already used 'x2'.

Remove the CFI stubs which are no longer needed because the SM3 assembly
functions are no longer ever indirectly called.

Remove the dependency on KERNEL_MODE_NEON.  It was unnecessary, because
KERNEL_MODE_NEON is always enabled on arm64.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/configs/defconfig                  |  2 +-
 arch/arm64/crypto/Kconfig                     | 22 ------
 arch/arm64/crypto/Makefile                    |  6 --
 arch/arm64/crypto/sm3-ce-glue.c               | 70 -------------------
 arch/arm64/crypto/sm3-neon-glue.c             | 67 ------------------
 lib/crypto/Kconfig                            |  1 +
 lib/crypto/Makefile                           | 13 +++-
 .../crypto => lib/crypto/arm64}/sm3-ce-core.S | 11 ++-
 .../crypto/arm64}/sm3-neon-core.S             |  9 ++-
 lib/crypto/arm64/sm3.h                        | 41 +++++++++++
 10 files changed, 62 insertions(+), 180 deletions(-)
 delete mode 100644 arch/arm64/crypto/sm3-ce-glue.c
 delete mode 100644 arch/arm64/crypto/sm3-neon-glue.c
 rename {arch/arm64/crypto => lib/crypto/arm64}/sm3-ce-core.S (93%)
 rename {arch/arm64/crypto => lib/crypto/arm64}/sm3-neon-core.S (98%)
 create mode 100644 lib/crypto/arm64/sm3.h

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..b4458bee767a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1914,13 +1914,13 @@ CONFIG_CRYPTO_USER=y
 CONFIG_CRYPTO_CHACHA20=m
 CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA3=m
+CONFIG_CRYPTO_SM3=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
-CONFIG_CRYPTO_SM3_ARM64_CE=m
 CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_CRYPTO_AES_ARM64_BS=m
 CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 82794afaffc9..b595062fd842 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -13,32 +13,10 @@ config CRYPTO_GHASH_ARM64_CE
 	  GCM GHASH function (NIST SP800-38D)
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
-config CRYPTO_SM3_NEON
-	tristate "Hash functions: SM3 (NEON)"
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_HASH
-	select CRYPTO_LIB_SM3
-	help
-	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012)
-
-	  Architecture: arm64 using:
-	  - NEON (Advanced SIMD) extensions
-
-config CRYPTO_SM3_ARM64_CE
-	tristate "Hash functions: SM3 (ARMv8.2 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_HASH
-	select CRYPTO_LIB_SM3
-	help
-	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012)
-
-	  Architecture: arm64 using:
-	  - ARMv8.2 Crypto Extensions
-
 config CRYPTO_AES_ARM64_CE_BLK
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (ARMv8 Crypto Extensions)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 8a8e3e551ed3..a169f9033401 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -3,16 +3,10 @@
 # linux/arch/arm64/crypto/Makefile
 #
 # Copyright (C) 2014 Linaro Ltd <ard.biesheuvel@linaro.org>
 #
 
-obj-$(CONFIG_CRYPTO_SM3_NEON) += sm3-neon.o
-sm3-neon-y := sm3-neon-glue.o sm3-neon-core.o
-
-obj-$(CONFIG_CRYPTO_SM3_ARM64_CE) += sm3-ce.o
-sm3-ce-y := sm3-ce-glue.o sm3-ce-core.o
-
 obj-$(CONFIG_CRYPTO_SM4_ARM64_CE) += sm4-ce-cipher.o
 sm4-ce-cipher-y := sm4-ce-cipher-glue.o sm4-ce-cipher-core.o
 
 obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_BLK) += sm4-ce.o
 sm4-ce-y := sm4-ce-glue.o sm4-ce-core.o
diff --git a/arch/arm64/crypto/sm3-ce-glue.c b/arch/arm64/crypto/sm3-ce-glue.c
deleted file mode 100644
index 24c1fcfae072..000000000000
--- a/arch/arm64/crypto/sm3-ce-glue.c
+++ /dev/null
@@ -1,70 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * sm3-ce-glue.c - SM3 secure hash using ARMv8.2 Crypto Extensions
- *
- * Copyright (C) 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#include <crypto/internal/hash.h>
-#include <crypto/sm3.h>
-#include <crypto/sm3_base.h>
-#include <linux/cpufeature.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-#include <asm/simd.h>
-
-MODULE_DESCRIPTION("SM3 secure hash using ARMv8 Crypto Extensions");
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_LICENSE("GPL v2");
-
-asmlinkage void sm3_ce_transform(struct sm3_state *sst, u8 const *src,
-				 int blocks);
-
-static int sm3_ce_update(struct shash_desc *desc, const u8 *data,
-			 unsigned int len)
-{
-	int remain;
-
-	scoped_ksimd() {
-		remain = sm3_base_do_update_blocks(desc, data, len, sm3_ce_transform);
-	}
-	return remain;
-}
-
-static int sm3_ce_finup(struct shash_desc *desc, const u8 *data,
-			unsigned int len, u8 *out)
-{
-	scoped_ksimd() {
-		sm3_base_do_finup(desc, data, len, sm3_ce_transform);
-	}
-	return sm3_base_finish(desc, out);
-}
-
-static struct shash_alg sm3_alg = {
-	.digestsize		= SM3_DIGEST_SIZE,
-	.init			= sm3_base_init,
-	.update			= sm3_ce_update,
-	.finup			= sm3_ce_finup,
-	.descsize		= SM3_STATE_SIZE,
-	.base.cra_name		= "sm3",
-	.base.cra_driver_name	= "sm3-ce",
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-				  CRYPTO_AHASH_ALG_FINUP_MAX,
-	.base.cra_blocksize	= SM3_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_priority	= 400,
-};
-
-static int __init sm3_ce_mod_init(void)
-{
-	return crypto_register_shash(&sm3_alg);
-}
-
-static void __exit sm3_ce_mod_fini(void)
-{
-	crypto_unregister_shash(&sm3_alg);
-}
-
-module_cpu_feature_match(SM3, sm3_ce_mod_init);
-module_exit(sm3_ce_mod_fini);
diff --git a/arch/arm64/crypto/sm3-neon-glue.c b/arch/arm64/crypto/sm3-neon-glue.c
deleted file mode 100644
index 15f30cc24f32..000000000000
--- a/arch/arm64/crypto/sm3-neon-glue.c
+++ /dev/null
@@ -1,67 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * sm3-neon-glue.c - SM3 secure hash using NEON instructions
- *
- * Copyright (C) 2022 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
- */
-
-#include <asm/simd.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sm3.h>
-#include <crypto/sm3_base.h>
-#include <linux/cpufeature.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-
-asmlinkage void sm3_neon_transform(struct sm3_state *sst, u8 const *src,
-				   int blocks);
-
-static int sm3_neon_update(struct shash_desc *desc, const u8 *data,
-			   unsigned int len)
-{
-	scoped_ksimd()
-		return sm3_base_do_update_blocks(desc, data, len,
-						 sm3_neon_transform);
-}
-
-static int sm3_neon_finup(struct shash_desc *desc, const u8 *data,
-			  unsigned int len, u8 *out)
-{
-	scoped_ksimd()
-		sm3_base_do_finup(desc, data, len, sm3_neon_transform);
-	return sm3_base_finish(desc, out);
-}
-
-static struct shash_alg sm3_alg = {
-	.digestsize		= SM3_DIGEST_SIZE,
-	.init			= sm3_base_init,
-	.update			= sm3_neon_update,
-	.finup			= sm3_neon_finup,
-	.descsize		= SM3_STATE_SIZE,
-	.base.cra_name		= "sm3",
-	.base.cra_driver_name	= "sm3-neon",
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-				  CRYPTO_AHASH_ALG_FINUP_MAX,
-	.base.cra_blocksize	= SM3_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_priority	= 200,
-};
-
-static int __init sm3_neon_init(void)
-{
-	return crypto_register_shash(&sm3_alg);
-}
-
-static void __exit sm3_neon_fini(void)
-{
-	crypto_unregister_shash(&sm3_alg);
-}
-
-module_init(sm3_neon_init);
-module_exit(sm3_neon_fini);
-
-MODULE_DESCRIPTION("SM3 secure hash using NEON instructions");
-MODULE_AUTHOR("Jussi Kivilinna <jussi.kivilinna@iki.fi>");
-MODULE_AUTHOR("Tianjia Zhang <tianjia.zhang@linux.alibaba.com>");
-MODULE_LICENSE("GPL v2");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index c5819e2518f6..a4e55b6a03af 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -272,9 +272,10 @@ config CRYPTO_LIB_SM3
 	  functions from <crypto/sm3.h>.
 
 config CRYPTO_LIB_SM3_ARCH
 	bool
 	depends on CRYPTO_LIB_SM3 && !UML
+	default y if ARM64
 
 source "lib/crypto/tests/Kconfig"
 
 endmenu
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index a961615c8c7f..48ed6ee5e3c9 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -347,15 +347,22 @@ CFLAGS_sha3.o += -I$(src)/$(SRCARCH)
 libsha3-$(CONFIG_ARM64) += arm64/sha3-ce-core.o
 endif # CONFIG_CRYPTO_LIB_SHA3_ARCH
 
 ################################################################################
 
+obj-$(CONFIG_CRYPTO_LIB_SM3) += libsm3.o
+libsm3-y := sm3.o
+ifeq ($(CONFIG_CRYPTO_LIB_SM3_ARCH),y)
+CFLAGS_sm3.o += -I$(src)/$(SRCARCH)
+libsm3-$(CONFIG_ARM64) += arm64/sm3-ce-core.o \
+			  arm64/sm3-neon-core.o
+endif # CONFIG_CRYPTO_LIB_SM3_ARCH
+
+################################################################################
+
 obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS_FULL)		+= simd.o
 
-obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
-libsm3-y					:= sm3.o
-
 # clean-files must be defined unconditionally
 clean-files += arm/sha256-core.S arm/sha512-core.S
 clean-files += arm64/sha256-core.S arm64/sha512-core.S
diff --git a/arch/arm64/crypto/sm3-ce-core.S b/lib/crypto/arm64/sm3-ce-core.S
similarity index 93%
rename from arch/arm64/crypto/sm3-ce-core.S
rename to lib/crypto/arm64/sm3-ce-core.S
index ca70cfacd0d0..9cef7ea7f34f 100644
--- a/arch/arm64/crypto/sm3-ce-core.S
+++ b/lib/crypto/arm64/sm3-ce-core.S
@@ -4,11 +4,10 @@
  *
  * Copyright (C) 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
 
 #include <linux/linkage.h>
-#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 
 	.irp		b, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
 	.set		.Lv\b\().4s, \b
 	.endr
@@ -68,15 +67,15 @@
 	sm3partw2	\s4\().4s, v7.4s, v6.4s
 	.endif
 	.endm
 
 	/*
-	 * void sm3_ce_transform(struct sm3_state *sst, u8 const *src,
-	 *                       int blocks)
+	 * void sm3_ce_transform(struct sm3_block_state *state,
+	 *			 const u8 *data, size_t nblocks)
 	 */
 	.text
-SYM_TYPED_FUNC_START(sm3_ce_transform)
+SYM_FUNC_START(sm3_ce_transform)
 	/* load state */
 	ld1		{v8.4s-v9.4s}, [x0]
 	rev64		v8.4s, v8.4s
 	rev64		v9.4s, v9.4s
 	ext		v8.16b, v8.16b, v8.16b, #8
@@ -85,11 +84,11 @@ SYM_TYPED_FUNC_START(sm3_ce_transform)
 	adr_l		x8, .Lt
 	ldp		s13, s14, [x8]
 
 	/* load input */
 0:	ld1		{v0.16b-v3.16b}, [x1], #64
-	sub		w2, w2, #1
+	sub		x2, x2, #1
 
 	mov		v15.16b, v8.16b
 	mov		v16.16b, v9.16b
 
 CPU_LE(	rev32		v0.16b, v0.16b		)
@@ -121,11 +120,11 @@ CPU_LE(	rev32		v3.16b, v3.16b		)
 
 	eor		v8.16b, v8.16b, v15.16b
 	eor		v9.16b, v9.16b, v16.16b
 
 	/* handled all input blocks? */
-	cbnz		w2, 0b
+	cbnz		x2, 0b
 
 	/* save state */
 	rev64		v8.4s, v8.4s
 	rev64		v9.4s, v9.4s
 	ext		v8.16b, v8.16b, v8.16b, #8
diff --git a/arch/arm64/crypto/sm3-neon-core.S b/lib/crypto/arm64/sm3-neon-core.S
similarity index 98%
rename from arch/arm64/crypto/sm3-neon-core.S
rename to lib/crypto/arm64/sm3-neon-core.S
index 4357e0e51be3..ad874af13802 100644
--- a/arch/arm64/crypto/sm3-neon-core.S
+++ b/lib/crypto/arm64/sm3-neon-core.S
@@ -7,11 +7,10 @@
  * Copyright (C) 2021 Jussi Kivilinna <jussi.kivilinna@iki.fi>
  * Copyright (c) 2022 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  */
 
 #include <linux/linkage.h>
-#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 
 /* Context structure */
 
 #define state_h0 0
@@ -343,18 +342,18 @@
 #define SCHED_W_W5W0W1W2W3W4_3(iop_num, round) \
 	SCHED_W_3_##iop_num(round, W5, W0, W1, W2, W3, W4)
 
 
 	/*
-	 * Transform blocks*64 bytes (blocks*16 32-bit words) at 'src'.
+	 * Transform nblocks*64 bytes (nblocks*16 32-bit words) at 'data'.
 	 *
-	 * void sm3_neon_transform(struct sm3_state *sst, u8 const *src,
-	 *                         int blocks)
+	 * void sm3_neon_transform(struct sm3_block_state *state,
+	 *			   const u8 *data, size_t nblocks)
 	 */
 	.text
 .align 3
-SYM_TYPED_FUNC_START(sm3_neon_transform)
+SYM_FUNC_START(sm3_neon_transform)
 	ldp		ra, rb, [RSTATE, #0]
 	ldp		rc, rd, [RSTATE, #8]
 	ldp		re, rf, [RSTATE, #16]
 	ldp		rg, rh, [RSTATE, #24]
 
diff --git a/lib/crypto/arm64/sm3.h b/lib/crypto/arm64/sm3.h
new file mode 100644
index 000000000000..beb9cd82bb7d
--- /dev/null
+++ b/lib/crypto/arm64/sm3.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SM3 optimized for ARM64
+ *
+ * Copyright 2026 Google LLC
+ */
+#include <asm/simd.h>
+#include <linux/cpufeature.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
+
+asmlinkage void sm3_neon_transform(struct sm3_block_state *state,
+				   const u8 *data, size_t nblocks);
+asmlinkage void sm3_ce_transform(struct sm3_block_state *state,
+				 const u8 *data, size_t nblocks);
+
+static void sm3_blocks(struct sm3_block_state *state,
+		       const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_neon) && likely(may_use_simd())) {
+		scoped_ksimd() {
+			if (static_branch_likely(&have_ce))
+				sm3_ce_transform(state, data, nblocks);
+			else
+				sm3_neon_transform(state, data, nblocks);
+		}
+	} else {
+		sm3_blocks_generic(state, data, nblocks);
+	}
+}
+
+#define sm3_mod_init_arch sm3_mod_init_arch
+static void sm3_mod_init_arch(void)
+{
+	if (cpu_have_named_feature(ASIMD)) {
+		static_branch_enable(&have_neon);
+		if (cpu_have_named_feature(SM3))
+			static_branch_enable(&have_ce);
+	}
+}
-- 
2.53.0


