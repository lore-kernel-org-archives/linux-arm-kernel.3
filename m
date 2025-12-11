Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDC8D3E78A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 01:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByKJBLbmCqNNMMVmN3HtbO+jgEjco70c87Wq9YzShm0=; b=Z0FOl8C6pkMkiH/CaRZaY3GNtX
	t5XzlIK1+LXbdAEvxhu3X6GHesemar04GAgi12XaMFpd/dMcrHB8znDIfuvqPO4UU5N9X+OLXKODQ
	ksq1OXZqTCZXIJDCN6D3fEWqrYmwIw/pysq9rR4Pw77KbrLhR/R+3aRJxReEwWIiolVAX+5QrD6Ar
	TRltyMRjaWf1OElhKBUnCtxLq0RLmRMpzcFZ+TBFdFU6+um9f6j7HB65ypwv1O7g8zBEXDMrFM3DR
	Hf+/14rodex9QLkZ+RdxIubA83ERVZ8lejQ/JGPKDm/ZTTXLEsw1QmYsJ7qTlrqOH4+zhZSNPqaOs
	VH5c+goQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMc-0000000G3lt-3XHV;
	Thu, 11 Dec 2025 01:21:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMT-0000000G3bp-3jIA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 01:20:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9662544451;
	Thu, 11 Dec 2025 01:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A5FC4CEF7;
	Thu, 11 Dec 2025 01:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765416053;
	bh=QEHq2etmS9RjJGySP14SepK+6u8TcOGeThrTyyMUghY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z7Or81+sGQOl7njUSzB1NJP8F+n0mw8cPNvUhuYhBRAMptPLW60SZBqzUpSZo1oob
	 zuccGi9gEQ8/9/8qik0R94TRftm5alM5xrec8osyJzlM/0qTLtfisNUUZL7IJHapmS
	 dWlwdE03JGTTvQp/OjG+vjUcGaNXqwhB/j6SQnBL63boqrxiq24zP3SPkGiKsXxW0Y
	 b/MsWTR8RQg4oHNBZembxV1Z8vCVL2XVaZ4UO+rf5Fi/UkasxLSsq1WpZHltU+IK2n
	 gucQ6sTnObUhamATNukQtO/De/uofkralSRSE6XBk5eG0W+PEuKv+9keBcV1CpIpR7
	 NXXunKNCGYWyA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 04/12] lib/crypto: arm64/nh: Migrate optimized code into library
Date: Wed, 10 Dec 2025 17:18:36 -0800
Message-ID: <20251211011846.8179-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211011846.8179-1-ebiggers@kernel.org>
References: <20251211011846.8179-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_172053_967084_C81AD291 
X-CRM114-Status: GOOD (  17.80  )
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

Migrate the arm64 NEON implementation of NH into lib/crypto/.  This
makes the nh() function be optimized on arm64 kernels.

Note: this temporarily makes the adiantum template not utilize the arm64
optimized NH code.  This is resolved in a later commit that converts the
adiantum template to use nh() instead of "nhpoly1305".

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/Kconfig                     | 10 ---
 arch/arm64/crypto/Makefile                    |  3 -
 arch/arm64/crypto/nhpoly1305-neon-glue.c      | 79 -------------------
 lib/crypto/Kconfig                            |  1 +
 lib/crypto/Makefile                           |  1 +
 .../crypto/arm64}/nh-neon-core.S              |  3 +-
 lib/crypto/arm64/nh.h                         | 34 ++++++++
 7 files changed, 37 insertions(+), 94 deletions(-)
 delete mode 100644 arch/arm64/crypto/nhpoly1305-neon-glue.c
 rename {arch/arm64/crypto => lib/crypto/arm64}/nh-neon-core.S (97%)
 create mode 100644 lib/crypto/arm64/nh.h

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index bdd276a6e540..da1c9ea8ea83 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -13,20 +13,10 @@ config CRYPTO_GHASH_ARM64_CE
 	  GCM GHASH function (NIST SP800-38D)
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
-config CRYPTO_NHPOLY1305_NEON
-	tristate "Hash functions: NHPoly1305 (NEON)"
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_NHPOLY1305
-	help
-	  NHPoly1305 hash function (Adiantum)
-
-	  Architecture: arm64 using:
-	  - NEON (Advanced SIMD) extensions
-
 config CRYPTO_SM3_NEON
 	tristate "Hash functions: SM3 (NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 1e330aa08d3f..3ab4b58e5c4c 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -39,13 +39,10 @@ obj-$(CONFIG_CRYPTO_AES_ARM64_CE_BLK) += aes-ce-blk.o
 aes-ce-blk-y := aes-glue-ce.o aes-ce.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_NEON_BLK) += aes-neon-blk.o
 aes-neon-blk-y := aes-glue-neon.o aes-neon.o
 
-obj-$(CONFIG_CRYPTO_NHPOLY1305_NEON) += nhpoly1305-neon.o
-nhpoly1305-neon-y := nh-neon-core.o nhpoly1305-neon-glue.o
-
 obj-$(CONFIG_CRYPTO_AES_ARM64) += aes-arm64.o
 aes-arm64-y := aes-cipher-core.o aes-cipher-glue.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_BS) += aes-neon-bs.o
 aes-neon-bs-y := aes-neonbs-core.o aes-neonbs-glue.o
diff --git a/arch/arm64/crypto/nhpoly1305-neon-glue.c b/arch/arm64/crypto/nhpoly1305-neon-glue.c
deleted file mode 100644
index 013de6ac569a..000000000000
--- a/arch/arm64/crypto/nhpoly1305-neon-glue.c
+++ /dev/null
@@ -1,79 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * NHPoly1305 - ε-almost-∆-universal hash function for Adiantum
- * (ARM64 NEON accelerated version)
- *
- * Copyright 2018 Google LLC
- */
-
-#include <asm/neon.h>
-#include <asm/simd.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/simd.h>
-#include <crypto/nhpoly1305.h>
-#include <linux/module.h>
-
-asmlinkage void nh_neon(const u32 *key, const u8 *message, size_t message_len,
-			__le64 hash[NH_NUM_PASSES]);
-
-static int nhpoly1305_neon_update(struct shash_desc *desc,
-				  const u8 *src, unsigned int srclen)
-{
-	if (srclen < 64 || !crypto_simd_usable())
-		return crypto_nhpoly1305_update(desc, src, srclen);
-
-	do {
-		unsigned int n = min_t(unsigned int, srclen, SZ_4K);
-
-		scoped_ksimd()
-			crypto_nhpoly1305_update_helper(desc, src, n, nh_neon);
-		src += n;
-		srclen -= n;
-	} while (srclen);
-	return 0;
-}
-
-static int nhpoly1305_neon_digest(struct shash_desc *desc,
-				  const u8 *src, unsigned int srclen, u8 *out)
-{
-	return crypto_nhpoly1305_init(desc) ?:
-	       nhpoly1305_neon_update(desc, src, srclen) ?:
-	       crypto_nhpoly1305_final(desc, out);
-}
-
-static struct shash_alg nhpoly1305_alg = {
-	.base.cra_name		= "nhpoly1305",
-	.base.cra_driver_name	= "nhpoly1305-neon",
-	.base.cra_priority	= 200,
-	.base.cra_ctxsize	= sizeof(struct nhpoly1305_key),
-	.base.cra_module	= THIS_MODULE,
-	.digestsize		= POLY1305_DIGEST_SIZE,
-	.init			= crypto_nhpoly1305_init,
-	.update			= nhpoly1305_neon_update,
-	.final			= crypto_nhpoly1305_final,
-	.digest			= nhpoly1305_neon_digest,
-	.setkey			= crypto_nhpoly1305_setkey,
-	.descsize		= sizeof(struct nhpoly1305_state),
-};
-
-static int __init nhpoly1305_mod_init(void)
-{
-	if (!cpu_have_named_feature(ASIMD))
-		return -ENODEV;
-
-	return crypto_register_shash(&nhpoly1305_alg);
-}
-
-static void __exit nhpoly1305_mod_exit(void)
-{
-	crypto_unregister_shash(&nhpoly1305_alg);
-}
-
-module_init(nhpoly1305_mod_init);
-module_exit(nhpoly1305_mod_exit);
-
-MODULE_DESCRIPTION("NHPoly1305 ε-almost-∆-universal hash function (NEON-accelerated)");
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Eric Biggers <ebiggers@google.com>");
-MODULE_ALIAS_CRYPTO("nhpoly1305");
-MODULE_ALIAS_CRYPTO("nhpoly1305-neon");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index c6ee7ca77632..aa3f850ece24 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -116,10 +116,11 @@ config CRYPTO_LIB_NH
 
 config CRYPTO_LIB_NH_ARCH
 	bool
 	depends on CRYPTO_LIB_NH && !UML
 	default y if ARM && KERNEL_MODE_NEON
+	default y if ARM64 && KERNEL_MODE_NEON
 
 config CRYPTO_LIB_POLY1305
 	tristate
 	help
 	  The Poly1305 library functions.  Select this if your module uses any
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 6dae7e182847..e3a13952bc2a 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -134,10 +134,11 @@ libmldsa-y := mldsa.o
 obj-$(CONFIG_CRYPTO_LIB_NH) += libnh.o
 libnh-y := nh.o
 ifeq ($(CONFIG_CRYPTO_LIB_NH_ARCH),y)
 CFLAGS_nh.o += -I$(src)/$(SRCARCH)
 libnh-$(CONFIG_ARM) += arm/nh-neon-core.o
+libnh-$(CONFIG_ARM64) += arm64/nh-neon-core.o
 endif
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_POLY1305) += libpoly1305.o
diff --git a/arch/arm64/crypto/nh-neon-core.S b/lib/crypto/arm64/nh-neon-core.S
similarity index 97%
rename from arch/arm64/crypto/nh-neon-core.S
rename to lib/crypto/arm64/nh-neon-core.S
index 13eda08fda1e..6fa57fce8085 100644
--- a/arch/arm64/crypto/nh-neon-core.S
+++ b/lib/crypto/arm64/nh-neon-core.S
@@ -6,11 +6,10 @@
  *
  * Author: Eric Biggers <ebiggers@google.com>
  */
 
 #include <linux/linkage.h>
-#include <linux/cfi_types.h>
 
 	KEY		.req	x0
 	MESSAGE		.req	x1
 	MESSAGE_LEN	.req	x2
 	HASH		.req	x3
@@ -61,11 +60,11 @@
  * void nh_neon(const u32 *key, const u8 *message, size_t message_len,
  *		__le64 hash[NH_NUM_PASSES])
  *
  * It's guaranteed that message_len % 16 == 0.
  */
-SYM_TYPED_FUNC_START(nh_neon)
+SYM_FUNC_START(nh_neon)
 
 	ld1		{K0.4s,K1.4s}, [KEY], #32
 	  movi		PASS0_SUMS.2d, #0
 	  movi		PASS1_SUMS.2d, #0
 	ld1		{K2.4s}, [KEY], #16
diff --git a/lib/crypto/arm64/nh.h b/lib/crypto/arm64/nh.h
new file mode 100644
index 000000000000..08902630bdd1
--- /dev/null
+++ b/lib/crypto/arm64/nh.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ARM64 accelerated implementation of NH
+ *
+ * Copyright 2018 Google LLC
+ */
+
+#include <asm/hwcap.h>
+#include <asm/simd.h>
+#include <linux/cpufeature.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
+
+asmlinkage void nh_neon(const u32 *key, const u8 *message, size_t message_len,
+			__le64 hash[NH_NUM_PASSES]);
+
+static bool nh_arch(const u32 *key, const u8 *message, size_t message_len,
+		    __le64 hash[NH_NUM_PASSES])
+{
+	if (static_branch_likely(&have_neon) && message_len >= 64 &&
+	    may_use_simd()) {
+		scoped_ksimd()
+			nh_neon(key, message, message_len, hash);
+		return true;
+	}
+	return false;
+}
+
+#define nh_mod_init_arch nh_mod_init_arch
+static void nh_mod_init_arch(void)
+{
+	if (cpu_have_named_feature(ASIMD))
+		static_branch_enable(&have_neon);
+}
-- 
2.52.0


