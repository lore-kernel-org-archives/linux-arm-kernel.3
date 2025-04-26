Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82A7C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 08:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPe+Rg7WHMoAQoebqyD1uvu2R3d2LQH1qq+8QNTU8FY=; b=lZ68rvWigWLqzc0MEGeBSvWUtT
	QZQkVo+Qi/yDuFgujTDIVSrb2KfLycVReKUfxscqQvXHHNqV23TXdl+fTyvn13cSs2FcrTtaEW/Cd
	+gKMh7F9mNaGEhWhXqHQAAdgbMXkym70u9oyvTMEaj624jYKvRJCH39DmQCCl06Df8M1xh+4Nu6NQ
	aTG3f3L3XXwafWwZZUnwwjxroX4FIal7m+MJ0+Vn4ngcbxxeIobvoac9JSUD6Vy2rVbn0/GQFaBU7
	jAVUyxPi9F0PpGvjxwNw48p5g3krSfwhuvMrktZiB2bVM5pEktGl3/hyLDF5VextjTnloxjkMT51J
	jm+gyiqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ao1-00000001ilE-0Utp;
	Sat, 26 Apr 2025 08:22:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ZO4-00000001acf-2J7y;
	Sat, 26 Apr 2025 06:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFA065C2B3F;
	Sat, 26 Apr 2025 06:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63090C4CEEF;
	Sat, 26 Apr 2025 06:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745650303;
	bh=fl9W9kw6x9BtAcwxv3i+lwM7Nx55GbUHoaN+qSOzLYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZOhqNi6jKvwE/bGNJHEEzumLVwD4vQ4MdZmRQyxWFjNVj9gLa8xf7HHYYcgDr8cNt
	 ey2CgVy31XIuZz0sZl0MIsJtb4VpzZpe7TKsv2l02Z0rdslmGj42z+UEGiIecNVJjW
	 okWg21t2PACCIz7mefRbEBpLp0d/oyIj02HKGE0uVlLc4JVscx7c4EHfk40T4zM90O
	 JN72RyEDsNIivdlySFaoDmYdqTO1N/g2oLLJDqD0YkqdAJAkhkbM9r1dNO1j07ezMV
	 D4f5Yww36zjfTz40EbVhi9CK3eVl5oPoXRJX9MruzTclUBWQQ6+TUBrwWqIKjUhuwN
	 x7kRfImsZ0WDg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 08/13] crypto: s390/sha256 - implement library instead of shash
Date: Fri, 25 Apr 2025 23:50:34 -0700
Message-ID: <20250426065041.1551914-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426065041.1551914-1-ebiggers@kernel.org>
References: <20250426065041.1551914-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_235144_692127_D814F9C0 
X-CRM114-Status: GOOD (  17.95  )
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
---
 arch/s390/configs/debug_defconfig |   1 -
 arch/s390/configs/defconfig       |   1 -
 arch/s390/crypto/Kconfig          |  10 ---
 arch/s390/crypto/Makefile         |   1 -
 arch/s390/crypto/sha256_s390.c    | 144 ------------------------------
 arch/s390/lib/crypto/Kconfig      |   6 ++
 arch/s390/lib/crypto/Makefile     |   2 +
 arch/s390/lib/crypto/sha256.c     |  47 ++++++++++
 8 files changed, 55 insertions(+), 157 deletions(-)
 delete mode 100644 arch/s390/crypto/sha256_s390.c
 create mode 100644 arch/s390/lib/crypto/sha256.c

diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index 6f2c9ce1b1548..de69faa4d94f3 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -793,11 +793,10 @@ CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_CRYPTO_SHA512_S390=m
 CONFIG_CRYPTO_SHA1_S390=m
-CONFIG_CRYPTO_SHA256_S390=m
 CONFIG_CRYPTO_SHA3_256_S390=m
 CONFIG_CRYPTO_SHA3_512_S390=m
 CONFIG_CRYPTO_GHASH_S390=m
 CONFIG_CRYPTO_AES_S390=m
 CONFIG_CRYPTO_DES_S390=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index f18a7d97ac216..f12679448e976 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -780,11 +780,10 @@ CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_CRYPTO_SHA512_S390=m
 CONFIG_CRYPTO_SHA1_S390=m
-CONFIG_CRYPTO_SHA256_S390=m
 CONFIG_CRYPTO_SHA3_256_S390=m
 CONFIG_CRYPTO_SHA3_512_S390=m
 CONFIG_CRYPTO_GHASH_S390=m
 CONFIG_CRYPTO_AES_S390=m
 CONFIG_CRYPTO_DES_S390=m
diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index a2bfd6eef0ca3..e2c27588b21a9 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -20,20 +20,10 @@ config CRYPTO_SHA1_S390
 
 	  Architecture: s390
 
 	  It is available as of z990.
 
-config CRYPTO_SHA256_S390
-	tristate "Hash functions: SHA-224 and SHA-256"
-	select CRYPTO_HASH
-	help
-	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
-
-	  Architecture: s390
-
-	  It is available as of z9.
-
 config CRYPTO_SHA3_256_S390
 	tristate "Hash functions: SHA3-224 and SHA3-256"
 	select CRYPTO_HASH
 	help
 	  SHA3-224 and SHA3-256 secure hash algorithms (FIPS 202)
diff --git a/arch/s390/crypto/Makefile b/arch/s390/crypto/Makefile
index e3853774e1a3a..21757d86cd499 100644
--- a/arch/s390/crypto/Makefile
+++ b/arch/s390/crypto/Makefile
@@ -2,11 +2,10 @@
 #
 # Cryptographic API
 #
 
 obj-$(CONFIG_CRYPTO_SHA1_S390) += sha1_s390.o sha_common.o
-obj-$(CONFIG_CRYPTO_SHA256_S390) += sha256_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA512_S390) += sha512_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_256_S390) += sha3_256_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_512_S390) += sha3_512_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_DES_S390) += des_s390.o
 obj-$(CONFIG_CRYPTO_AES_S390) += aes_s390.o
diff --git a/arch/s390/crypto/sha256_s390.c b/arch/s390/crypto/sha256_s390.c
deleted file mode 100644
index e6876c49414d5..0000000000000
--- a/arch/s390/crypto/sha256_s390.c
+++ /dev/null
@@ -1,144 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Cryptographic API.
- *
- * s390 implementation of the SHA256 and SHA224 Secure Hash Algorithm.
- *
- * s390 Version:
- *   Copyright IBM Corp. 2005, 2011
- *   Author(s): Jan Glauber (jang@de.ibm.com)
- */
-#include <asm/cpacf.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <linux/cpufeature.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-
-#include "sha.h"
-
-static int s390_sha256_init(struct shash_desc *desc)
-{
-	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA256_H0;
-	sctx->state[1] = SHA256_H1;
-	sctx->state[2] = SHA256_H2;
-	sctx->state[3] = SHA256_H3;
-	sctx->state[4] = SHA256_H4;
-	sctx->state[5] = SHA256_H5;
-	sctx->state[6] = SHA256_H6;
-	sctx->state[7] = SHA256_H7;
-	sctx->count = 0;
-	sctx->func = CPACF_KIMD_SHA_256;
-
-	return 0;
-}
-
-static int sha256_export(struct shash_desc *desc, void *out)
-{
-	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-	struct crypto_sha256_state *octx = out;
-
-	octx->count = sctx->count;
-	memcpy(octx->state, sctx->state, sizeof(octx->state));
-	return 0;
-}
-
-static int sha256_import(struct shash_desc *desc, const void *in)
-{
-	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-	const struct crypto_sha256_state *ictx = in;
-
-	sctx->count = ictx->count;
-	memcpy(sctx->state, ictx->state, sizeof(ictx->state));
-	sctx->func = CPACF_KIMD_SHA_256;
-	return 0;
-}
-
-static struct shash_alg sha256_alg = {
-	.digestsize	=	SHA256_DIGEST_SIZE,
-	.init		=	s390_sha256_init,
-	.update		=	s390_sha_update_blocks,
-	.finup		=	s390_sha_finup,
-	.export		=	sha256_export,
-	.import		=	sha256_import,
-	.descsize	=	S390_SHA_CTX_SIZE,
-	.statesize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha256",
-		.cra_driver_name=	"sha256-s390",
-		.cra_priority	=	300,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA256_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int s390_sha224_init(struct shash_desc *desc)
-{
-	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA224_H0;
-	sctx->state[1] = SHA224_H1;
-	sctx->state[2] = SHA224_H2;
-	sctx->state[3] = SHA224_H3;
-	sctx->state[4] = SHA224_H4;
-	sctx->state[5] = SHA224_H5;
-	sctx->state[6] = SHA224_H6;
-	sctx->state[7] = SHA224_H7;
-	sctx->count = 0;
-	sctx->func = CPACF_KIMD_SHA_256;
-
-	return 0;
-}
-
-static struct shash_alg sha224_alg = {
-	.digestsize	=	SHA224_DIGEST_SIZE,
-	.init		=	s390_sha224_init,
-	.update		=	s390_sha_update_blocks,
-	.finup		=	s390_sha_finup,
-	.export		=	sha256_export,
-	.import		=	sha256_import,
-	.descsize	=	S390_SHA_CTX_SIZE,
-	.statesize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha224",
-		.cra_driver_name=	"sha224-s390",
-		.cra_priority	=	300,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA224_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int __init sha256_s390_init(void)
-{
-	int ret;
-
-	if (!cpacf_query_func(CPACF_KIMD, CPACF_KIMD_SHA_256))
-		return -ENODEV;
-	ret = crypto_register_shash(&sha256_alg);
-	if (ret < 0)
-		goto out;
-	ret = crypto_register_shash(&sha224_alg);
-	if (ret < 0)
-		crypto_unregister_shash(&sha256_alg);
-out:
-	return ret;
-}
-
-static void __exit sha256_s390_fini(void)
-{
-	crypto_unregister_shash(&sha224_alg);
-	crypto_unregister_shash(&sha256_alg);
-}
-
-module_cpu_feature_match(S390_CPU_FEATURE_MSA, sha256_s390_init);
-module_exit(sha256_s390_fini);
-
-MODULE_ALIAS_CRYPTO("sha256");
-MODULE_ALIAS_CRYPTO("sha224");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA256 and SHA224 Secure Hash Algorithm");
diff --git a/arch/s390/lib/crypto/Kconfig b/arch/s390/lib/crypto/Kconfig
index 069b355fe51aa..e3f855ef43934 100644
--- a/arch/s390/lib/crypto/Kconfig
+++ b/arch/s390/lib/crypto/Kconfig
@@ -3,5 +3,11 @@
 config CRYPTO_CHACHA_S390
 	tristate
 	default CRYPTO_LIB_CHACHA
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+
+config CRYPTO_SHA256_S390
+	tristate
+	default CRYPTO_LIB_SHA256
+	select CRYPTO_ARCH_HAVE_LIB_SHA256
+	select CRYPTO_LIB_SHA256_GENERIC
diff --git a/arch/s390/lib/crypto/Makefile b/arch/s390/lib/crypto/Makefile
index 06c2cf77178ef..920197967f463 100644
--- a/arch/s390/lib/crypto/Makefile
+++ b/arch/s390/lib/crypto/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_CRYPTO_CHACHA_S390) += chacha_s390.o
 chacha_s390-y := chacha-glue.o chacha-s390.o
+
+obj-$(CONFIG_CRYPTO_SHA256_S390) += sha256.o
diff --git a/arch/s390/lib/crypto/sha256.c b/arch/s390/lib/crypto/sha256.c
new file mode 100644
index 0000000000000..50c592ce7a5de
--- /dev/null
+++ b/arch/s390/lib/crypto/sha256.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SHA-256 optimized using the CP Assist for Cryptographic Functions (CPACF)
+ *
+ * Copyright 2025 Google LLC
+ */
+#include <asm/cpacf.h>
+#include <crypto/internal/sha2.h>
+#include <linux/cpufeature.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_cpacf_sha256);
+
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+			const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_cpacf_sha256))
+		cpacf_kimd(CPACF_KIMD_SHA_256, state, data,
+			   nblocks * SHA256_BLOCK_SIZE);
+	else
+		sha256_blocks_generic(state, data, nblocks);
+}
+EXPORT_SYMBOL(sha256_blocks_arch);
+
+bool sha256_is_arch_optimized(void)
+{
+	return static_key_enabled(&have_cpacf_sha256);
+}
+EXPORT_SYMBOL(sha256_is_arch_optimized);
+
+static int __init sha256_s390_mod_init(void)
+{
+	if (cpu_have_feature(S390_CPU_FEATURE_MSA) &&
+	    cpacf_query_func(CPACF_KIMD, CPACF_KIMD_SHA_256))
+		static_branch_enable(&have_cpacf_sha256);
+	return 0;
+}
+arch_initcall(sha256_s390_mod_init);
+
+static void __exit sha256_s390_mod_exit(void)
+{
+}
+module_exit(sha256_s390_mod_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SHA-256 using the CP Assist for Cryptographic Functions (CPACF)");
-- 
2.49.0


