Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3462D68BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 00:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvEXWqKK+pGQWpjDdPq8RyfPUrVlkUPlYSwpNxrBFsE=; b=Xg6h3iiQqv7d5RD1PfbX1bH2ky
	oejFeJsqUTJNtke2EYCX4b8x55VgVYiaUghMLxT93LKPaP9GMNz8nzjSYj97graD+4jGYgaeO4V8n
	YF0rnjBk0AjRVmTBT4Zp2mVY9Ni2f16VCBn1kFGUiwl8ShWP2eiZuxPnbyKiGg3M2vvFQ3HvC3RJ4
	Iyk68fEIGHo0jSIXDRXdupWqrNlTyrKxwEpn9jtDSnEnS1zaWN9NIqru7q41qXcidfxwEEfqcqViU
	PEqB8itmKRdlqs47KRCXOBkbGGPeWUiqhapqFbgwiMuCM9BOlXIO27nZ7WlWwYfhlN09Kz6dAYlkn
	1IZUeQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCTBN-00000006bUX-21qX;
	Sun, 17 Nov 2024 00:30:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCT53-00000006Zsu-3I4E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 00:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 17EF3A40C3D;
	Sun, 17 Nov 2024 00:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702A8C4CEC3;
	Sun, 17 Nov 2024 00:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731803035;
	bh=HgR1LEY3VEIzOlaLOqyuvwljcBVjiL79uYLCzgDKDDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m17zfdcUmnOLe8DQbOyMMXD3CE0kIL6HKxvxjId6ZFnU5PJfVjkVnxBFz1Wwrb4b1
	 mA4o87HzsC0Gs3CxAXgAGmSv8ASzgPT3F8pvz0GQ+3lSqegRpXWzwSCN/Ay+nsrEOG
	 Vk2vzTn2Z+wI6fwh/Ds3+g46FyHJlPImUj+ZAD/7gXPfZN5oSQ0wbxrqgzZ3edp1oB
	 ucPc/xBWdsnOYCcwH0cwEIb02rutjadO2VRpIW2BdVxrPwN28zxN3Jx0+5oY8GNTqT
	 rO4kR78EKtwAyV/3YXp4M/fDJ7L6HsVb0DsWP5iDaPLuhORb2+ryZZvrzxH96Eb4Zl
	 FCFLLc9bGXmnA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 05/11] arm/crc-t10dif: expose CRC-T10DIF function through lib
Date: Sat, 16 Nov 2024 16:22:38 -0800
Message-ID: <20241117002244.105200-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241117002244.105200-1-ebiggers@kernel.org>
References: <20241117002244.105200-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_162358_002097_1AF646A4 
X-CRM114-Status: GOOD (  21.29  )
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

Move the arm CRC-T10DIF assembly code into the lib directory and wire it
up to the library interface.  This allows it to be used without going
through the crypto API.  It remains usable via the crypto API too via
the shash algorithms that use the library interface.  Thus all the
arch-specific "shash" code becomes unnecessary and is removed.

Note: to see the diff from arch/arm/crypto/crct10dif-ce-glue.c to
arch/arm/lib/crc-t10dif-glue.c, view this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/Kconfig                              |   1 +
 arch/arm/crypto/Kconfig                       |  11 --
 arch/arm/crypto/Makefile                      |   2 -
 arch/arm/crypto/crct10dif-ce-glue.c           | 124 ------------------
 arch/arm/lib/Makefile                         |   3 +
 .../crc-t10dif-core.S}                        |   0
 arch/arm/lib/crc-t10dif-glue.c                |  77 +++++++++++
 7 files changed, 81 insertions(+), 137 deletions(-)
 delete mode 100644 arch/arm/crypto/crct10dif-ce-glue.c
 rename arch/arm/{crypto/crct10dif-ce-core.S => lib/crc-t10dif-core.S} (100%)
 create mode 100644 arch/arm/lib/crc-t10dif-glue.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 851260303234..b9081b1a0c06 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -6,10 +6,11 @@ config ARM
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
 	select ARCH_HAS_CRC32 if KERNEL_MODE_NEON
+	select ARCH_HAS_CRC_T10DIF if KERNEL_MODE_NEON
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DMA_ALLOC if MMU
 	select ARCH_HAS_DMA_OPS
 	select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index ea0ebf336d0d..32650c8431d9 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -220,18 +220,7 @@ config CRYPTO_CHACHA20_NEON
 	  stream cipher algorithms
 
 	  Architecture: arm using:
 	  - NEON (Advanced SIMD) extensions
 
-config CRYPTO_CRCT10DIF_ARM_CE
-	tristate "CRCT10DIF"
-	depends on KERNEL_MODE_NEON
-	depends on CRC_T10DIF
-	select CRYPTO_HASH
-	help
-	  CRC16 CRC algorithm used for the T10 (SCSI) Data Integrity Field (DIF)
-
-	  Architecture: arm using:
-	  - PMULL (Polynomial Multiply Long) instructions
-
 endmenu
 
diff --git a/arch/arm/crypto/Makefile b/arch/arm/crypto/Makefile
index 38ec5cc1e844..3d0e23ff9e74 100644
--- a/arch/arm/crypto/Makefile
+++ b/arch/arm/crypto/Makefile
@@ -18,11 +18,10 @@ obj-$(CONFIG_CRYPTO_CURVE25519_NEON) += curve25519-neon.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM_CE) += aes-arm-ce.o
 obj-$(CONFIG_CRYPTO_SHA1_ARM_CE) += sha1-arm-ce.o
 obj-$(CONFIG_CRYPTO_SHA2_ARM_CE) += sha2-arm-ce.o
 obj-$(CONFIG_CRYPTO_GHASH_ARM_CE) += ghash-arm-ce.o
-obj-$(CONFIG_CRYPTO_CRCT10DIF_ARM_CE) += crct10dif-arm-ce.o
 
 aes-arm-y	:= aes-cipher-core.o aes-cipher-glue.o
 aes-arm-bs-y	:= aes-neonbs-core.o aes-neonbs-glue.o
 sha1-arm-y	:= sha1-armv4-large.o sha1_glue.o
 sha1-arm-neon-y	:= sha1-armv7-neon.o sha1_neon_glue.o
@@ -34,11 +33,10 @@ libblake2s-arm-y:= blake2s-core.o blake2s-glue.o
 blake2b-neon-y  := blake2b-neon-core.o blake2b-neon-glue.o
 sha1-arm-ce-y	:= sha1-ce-core.o sha1-ce-glue.o
 sha2-arm-ce-y	:= sha2-ce-core.o sha2-ce-glue.o
 aes-arm-ce-y	:= aes-ce-core.o aes-ce-glue.o
 ghash-arm-ce-y	:= ghash-ce-core.o ghash-ce-glue.o
-crct10dif-arm-ce-y	:= crct10dif-ce-core.o crct10dif-ce-glue.o
 chacha-neon-y := chacha-scalar-core.o chacha-glue.o
 chacha-neon-$(CONFIG_KERNEL_MODE_NEON) += chacha-neon-core.o
 poly1305-arm-y := poly1305-core.o poly1305-glue.o
 nhpoly1305-neon-y := nh-neon-core.o nhpoly1305-neon-glue.o
 curve25519-neon-y := curve25519-core.o curve25519-glue.o
diff --git a/arch/arm/crypto/crct10dif-ce-glue.c b/arch/arm/crypto/crct10dif-ce-glue.c
deleted file mode 100644
index a8b74523729e..000000000000
--- a/arch/arm/crypto/crct10dif-ce-glue.c
+++ /dev/null
@@ -1,124 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Accelerated CRC-T10DIF using ARM NEON and Crypto Extensions instructions
- *
- * Copyright (C) 2016 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#include <linux/crc-t10dif.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-
-#include <crypto/internal/hash.h>
-#include <crypto/internal/simd.h>
-
-#include <asm/neon.h>
-#include <asm/simd.h>
-
-#define CRC_T10DIF_PMULL_CHUNK_SIZE	16U
-
-asmlinkage u16 crc_t10dif_pmull64(u16 init_crc, const u8 *buf, size_t len);
-asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
-				  u8 out[16]);
-
-static int crct10dif_init(struct shash_desc *desc)
-{
-	u16 *crc = shash_desc_ctx(desc);
-
-	*crc = 0;
-	return 0;
-}
-
-static int crct10dif_update_ce(struct shash_desc *desc, const u8 *data,
-			       unsigned int length)
-{
-	u16 *crc = shash_desc_ctx(desc);
-
-	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE && crypto_simd_usable()) {
-		kernel_neon_begin();
-		*crc = crc_t10dif_pmull64(*crc, data, length);
-		kernel_neon_end();
-	} else {
-		*crc = crc_t10dif_generic(*crc, data, length);
-	}
-
-	return 0;
-}
-
-static int crct10dif_update_neon(struct shash_desc *desc, const u8 *data,
-			         unsigned int length)
-{
-	u16 *crcp = shash_desc_ctx(desc);
-	u8 buf[16] __aligned(16);
-	u16 crc = *crcp;
-
-	if (length > CRC_T10DIF_PMULL_CHUNK_SIZE && crypto_simd_usable()) {
-		kernel_neon_begin();
-		crc_t10dif_pmull8(crc, data, length, buf);
-		kernel_neon_end();
-
-		crc = 0;
-		data = buf;
-		length = sizeof(buf);
-	}
-
-	*crcp = crc_t10dif_generic(crc, data, length);
-	return 0;
-}
-
-static int crct10dif_final(struct shash_desc *desc, u8 *out)
-{
-	u16 *crc = shash_desc_ctx(desc);
-
-	*(u16 *)out = *crc;
-	return 0;
-}
-
-static struct shash_alg algs[] = {{
-	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
-	.init			= crct10dif_init,
-	.update			= crct10dif_update_neon,
-	.final			= crct10dif_final,
-	.descsize		= CRC_T10DIF_DIGEST_SIZE,
-
-	.base.cra_name		= "crct10dif",
-	.base.cra_driver_name	= "crct10dif-arm-neon",
-	.base.cra_priority	= 150,
-	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-}, {
-	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
-	.init			= crct10dif_init,
-	.update			= crct10dif_update_ce,
-	.final			= crct10dif_final,
-	.descsize		= CRC_T10DIF_DIGEST_SIZE,
-
-	.base.cra_name		= "crct10dif",
-	.base.cra_driver_name	= "crct10dif-arm-ce",
-	.base.cra_priority	= 200,
-	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-}};
-
-static int __init crc_t10dif_mod_init(void)
-{
-	if (!(elf_hwcap & HWCAP_NEON))
-		return -ENODEV;
-
-	return crypto_register_shashes(algs, 1 + !!(elf_hwcap2 & HWCAP2_PMULL));
-}
-
-static void __exit crc_t10dif_mod_exit(void)
-{
-	crypto_unregister_shashes(algs, 1 + !!(elf_hwcap2 & HWCAP2_PMULL));
-}
-
-module_init(crc_t10dif_mod_init);
-module_exit(crc_t10dif_mod_exit);
-
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_DESCRIPTION("Accelerated CRC-T10DIF using ARM NEON and Crypto Extensions");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("crct10dif");
diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 01cd4db2ed47..007874320937 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -46,5 +46,8 @@ endif
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-arm.o
 crc32-arm-y := crc32-glue.o crc32-core.o
+
+obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-arm.o
+crc-t10dif-arm-y := crc-t10dif-glue.o crc-t10dif-core.o
diff --git a/arch/arm/crypto/crct10dif-ce-core.S b/arch/arm/lib/crc-t10dif-core.S
similarity index 100%
rename from arch/arm/crypto/crct10dif-ce-core.S
rename to arch/arm/lib/crc-t10dif-core.S
diff --git a/arch/arm/lib/crc-t10dif-glue.c b/arch/arm/lib/crc-t10dif-glue.c
new file mode 100644
index 000000000000..70d391d1b697
--- /dev/null
+++ b/arch/arm/lib/crc-t10dif-glue.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Accelerated CRC-T10DIF using ARM NEON and Crypto Extensions instructions
+ *
+ * Copyright (C) 2016 Linaro Ltd <ard.biesheuvel@linaro.org>
+ */
+
+#include <linux/crc-t10dif.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+
+#include <crypto/internal/simd.h>
+
+#include <asm/neon.h>
+#include <asm/simd.h>
+
+static DEFINE_STATIC_KEY_FALSE(have_neon);
+static DEFINE_STATIC_KEY_FALSE(have_pmull);
+
+#define CRC_T10DIF_PMULL_CHUNK_SIZE	16U
+
+asmlinkage u16 crc_t10dif_pmull64(u16 init_crc, const u8 *buf, size_t len);
+asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
+				  u8 out[16]);
+
+u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
+{
+	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE &&
+	    static_branch_likely(&have_pmull) && crypto_simd_usable()) {
+		kernel_neon_begin();
+		crc = crc_t10dif_pmull64(crc, data, length);
+		kernel_neon_end();
+		return crc;
+	}
+	if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
+	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
+		u8 buf[16] __aligned(16);
+
+		kernel_neon_begin();
+		crc_t10dif_pmull8(crc, data, length, buf);
+		kernel_neon_end();
+
+		crc = 0;
+		data = buf;
+		length = sizeof(buf);
+	}
+	return crc_t10dif_generic(crc, data, length);
+}
+EXPORT_SYMBOL(crc_t10dif_arch);
+
+static int __init crc_t10dif_arm_init(void)
+{
+	if (elf_hwcap & HWCAP_NEON) {
+		static_branch_enable(&have_neon);
+		if (elf_hwcap2 & HWCAP2_PMULL)
+			static_branch_enable(&have_pmull);
+	}
+	return 0;
+}
+arch_initcall(crc_t10dif_arm_init);
+
+static void __exit crc_t10dif_arm_exit(void)
+{
+}
+module_exit(crc_t10dif_arm_exit);
+
+bool crc_t10dif_is_optimized(void)
+{
+	return static_key_enabled(&have_neon);
+}
+EXPORT_SYMBOL(crc_t10dif_is_optimized);
+
+MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
+MODULE_DESCRIPTION("Accelerated CRC-T10DIF using ARM NEON and Crypto Extensions");
+MODULE_LICENSE("GPL v2");
-- 
2.47.0


