Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6371DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 18:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sQ+p3+QrymWT8nnLjQCGwjWQ/0HSVRiTj7uvtZXqco=; b=ehpjKLCrsyxgWRjPrS1J2+2GZ/
	CJsc5hw/sr3LCw6pQH8qUjl2N+x4Cspfai/xQXl0DMG8U1V5l5nTAEYxst51sA5pqT23PK9xdW+Kq
	TGS/5xc9HmxCzwHJBagMzdj0h4NNj6xF/PMOMH9xOE2W2W66drODjAvjGFjdlwrvL0qbQYfcJBULT
	d2Q2r7MvLGMVOxwSA13ZDrQhnO5zWJD48sHVje2YEAZoi2vEC6zLVEwDfBIsAkEHQ18vTKtDzJSfC
	Z/4CrbEItb0SmJ1VXFDrdiR6aUPRhq1pOJ8zyZ7nd5Pexz6y+YAU79APJJ2ns9HsfZKipZKtPDY64
	JK5AGNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9TG0-00000007EfC-11WK;
	Mon, 28 Apr 2025 18:31:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rrw-0000000710E-3iCa;
	Mon, 28 Apr 2025 17:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2sQ+p3+QrymWT8nnLjQCGwjWQ/0HSVRiTj7uvtZXqco=; b=k+9JAtw+9KEcJiq8HAGgAEtKuD
	/MphoXju0wKQXBaT/pN5oTM5688faySj0e+bOkT8xTf6gGfzeoohUXcRVRpqv6LzQzJhiitGFHU2Q
	DQsLOcuMyfBQLwfTZDljgzWIux8tZ6GI1U3wC3wMjV+XauJCsVVFCO+SmHNPM2iyLfr6pAmdybxXx
	+3ilNJ0+GfC3vNPnPlAKW7ayLGXBc+5d/TGqeTeh35iZS0ZC+yfMkEEDl6AOInilYKkn+G2X8+yeE
	ENf0x8vNzRn7WIordr831cR/K4kUsMH8SbC7iFHPUEoBBShxr8ZVsyKv8Fst8Ehd1svEOHxFNic+C
	KNNQOqBA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Rrr-0000000Ctlh-3Tsx;
	Mon, 28 Apr 2025 17:02:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA02E5C5C9E;
	Mon, 28 Apr 2025 16:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1CAC4CEF1;
	Mon, 28 Apr 2025 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859724;
	bh=EyLlHErF32h0yhzCTHHerfcTZv7f2HWfwZtPUgAb89A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nWs3ffHSwLFiJ+nJXf3tiPeNBseY3x1B+ENVAeoD3EdVbkOt6GHfVwDET7Nims8/3
	 LRO/AnB8eumBIYl1IrG/isEe8YzvvIuuZlDBaFtm9TZl2IxtKWh1EI8vmuUlKRjM2l
	 8ZxLBvupIrvKm0qqI1HQStsBzJw0hQ7TAaj3tOH5WniveJt2Na6wiXuDwvlJeCwfSi
	 OyDuS/19REKeKjFBsAv6Y0pLf6V5kHC7DubjM4pd7VvW2uzEcwbG/vnmCcmtLox90K
	 4OxyWmlbzmDjS8gS6kcq/SKtHVnoETrb2NJ19qgsrbu+LMQAw9dfhPQeA0JPVwiiv+
	 MD6xxLga7JX6Q==
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
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v4 10/13] crypto: sparc/sha256 - implement library instead of shash
Date: Mon, 28 Apr 2025 10:00:35 -0700
Message-ID: <20250428170040.423825-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428170040.423825-1-ebiggers@kernel.org>
References: <20250428170040.423825-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_180208_226342_7212A75C 
X-CRM114-Status: GOOD (  21.57  )
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
 arch/sparc/crypto/Kconfig                |  10 --
 arch/sparc/crypto/Makefile               |   2 -
 arch/sparc/crypto/sha256_glue.c          | 128 -----------------------
 arch/sparc/lib/Makefile                  |   1 +
 arch/sparc/lib/crypto/Kconfig            |   8 ++
 arch/sparc/lib/crypto/Makefile           |   4 +
 arch/sparc/lib/crypto/sha256.c           |  64 ++++++++++++
 arch/sparc/{ => lib}/crypto/sha256_asm.S |   2 +-
 lib/crypto/Kconfig                       |   3 +
 9 files changed, 81 insertions(+), 141 deletions(-)
 delete mode 100644 arch/sparc/crypto/sha256_glue.c
 create mode 100644 arch/sparc/lib/crypto/Kconfig
 create mode 100644 arch/sparc/lib/crypto/Makefile
 create mode 100644 arch/sparc/lib/crypto/sha256.c
 rename arch/sparc/{ => lib}/crypto/sha256_asm.S (96%)

diff --git a/arch/sparc/crypto/Kconfig b/arch/sparc/crypto/Kconfig
index e858597de89db..a6ba319c42dce 100644
--- a/arch/sparc/crypto/Kconfig
+++ b/arch/sparc/crypto/Kconfig
@@ -34,20 +34,10 @@ config CRYPTO_SHA1_SPARC64
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: sparc64
 
-config CRYPTO_SHA256_SPARC64
-	tristate "Hash functions: SHA-224 and SHA-256"
-	depends on SPARC64
-	select CRYPTO_SHA256
-	select CRYPTO_HASH
-	help
-	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
-
-	  Architecture: sparc64 using crypto instructions, when available
-
 config CRYPTO_SHA512_SPARC64
 	tristate "Hash functions: SHA-384 and SHA-512"
 	depends on SPARC64
 	select CRYPTO_SHA512
 	select CRYPTO_HASH
diff --git a/arch/sparc/crypto/Makefile b/arch/sparc/crypto/Makefile
index a2d7fca40cb4b..701c39edb0d73 100644
--- a/arch/sparc/crypto/Makefile
+++ b/arch/sparc/crypto/Makefile
@@ -2,20 +2,18 @@
 #
 # Arch-specific CryptoAPI modules.
 #
 
 obj-$(CONFIG_CRYPTO_SHA1_SPARC64) += sha1-sparc64.o
-obj-$(CONFIG_CRYPTO_SHA256_SPARC64) += sha256-sparc64.o
 obj-$(CONFIG_CRYPTO_SHA512_SPARC64) += sha512-sparc64.o
 obj-$(CONFIG_CRYPTO_MD5_SPARC64) += md5-sparc64.o
 
 obj-$(CONFIG_CRYPTO_AES_SPARC64) += aes-sparc64.o
 obj-$(CONFIG_CRYPTO_DES_SPARC64) += des-sparc64.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_SPARC64) += camellia-sparc64.o
 
 sha1-sparc64-y := sha1_asm.o sha1_glue.o
-sha256-sparc64-y := sha256_asm.o sha256_glue.o
 sha512-sparc64-y := sha512_asm.o sha512_glue.o
 md5-sparc64-y := md5_asm.o md5_glue.o
 
 aes-sparc64-y := aes_asm.o aes_glue.o
 des-sparc64-y := des_asm.o des_glue.o
diff --git a/arch/sparc/crypto/sha256_glue.c b/arch/sparc/crypto/sha256_glue.c
deleted file mode 100644
index 25008603a9868..0000000000000
--- a/arch/sparc/crypto/sha256_glue.c
+++ /dev/null
@@ -1,128 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Glue code for SHA256 hashing optimized for sparc64 crypto opcodes.
- *
- * This is based largely upon crypto/sha256_generic.c
- *
- * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
- * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
- */
-
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
-#include <asm/elf.h>
-#include <asm/opcodes.h>
-#include <asm/pstate.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha256_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-asmlinkage void sha256_sparc64_transform(u32 *digest, const char *data,
-					 unsigned int rounds);
-
-static void sha256_block(struct crypto_sha256_state *sctx, const u8 *src,
-			 int blocks)
-{
-	sha256_sparc64_transform(sctx->state, src, blocks);
-}
-
-static int sha256_sparc64_update(struct shash_desc *desc, const u8 *data,
-				 unsigned int len)
-{
-	return sha256_base_do_update_blocks(desc, data, len, sha256_block);
-}
-
-static int sha256_sparc64_finup(struct shash_desc *desc, const u8 *src,
-				unsigned int len, u8 *out)
-{
-	sha256_base_do_finup(desc, src, len, sha256_block);
-	return sha256_base_finish(desc, out);
-}
-
-static struct shash_alg sha256_alg = {
-	.digestsize	=	SHA256_DIGEST_SIZE,
-	.init		=	sha256_base_init,
-	.update		=	sha256_sparc64_update,
-	.finup		=	sha256_sparc64_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha256",
-		.cra_driver_name=	"sha256-sparc64",
-		.cra_priority	=	SPARC_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA256_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static struct shash_alg sha224_alg = {
-	.digestsize	=	SHA224_DIGEST_SIZE,
-	.init		=	sha224_base_init,
-	.update		=	sha256_sparc64_update,
-	.finup		=	sha256_sparc64_finup,
-	.descsize	=	sizeof(struct crypto_sha256_state),
-	.base		=	{
-		.cra_name	=	"sha224",
-		.cra_driver_name=	"sha224-sparc64",
-		.cra_priority	=	SPARC_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA224_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static bool __init sparc64_has_sha256_opcode(void)
-{
-	unsigned long cfr;
-
-	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
-		return false;
-
-	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
-	if (!(cfr & CFR_SHA256))
-		return false;
-
-	return true;
-}
-
-static int __init sha256_sparc64_mod_init(void)
-{
-	if (sparc64_has_sha256_opcode()) {
-		int ret = crypto_register_shash(&sha224_alg);
-		if (ret < 0)
-			return ret;
-
-		ret = crypto_register_shash(&sha256_alg);
-		if (ret < 0) {
-			crypto_unregister_shash(&sha224_alg);
-			return ret;
-		}
-
-		pr_info("Using sparc64 sha256 opcode optimized SHA-256/SHA-224 implementation\n");
-		return 0;
-	}
-	pr_info("sparc64 sha256 opcode not available.\n");
-	return -ENODEV;
-}
-
-static void __exit sha256_sparc64_mod_fini(void)
-{
-	crypto_unregister_shash(&sha224_alg);
-	crypto_unregister_shash(&sha256_alg);
-}
-
-module_init(sha256_sparc64_mod_init);
-module_exit(sha256_sparc64_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-224 and SHA-256 Secure Hash Algorithm, sparc64 sha256 opcode accelerated");
-
-MODULE_ALIAS_CRYPTO("sha224");
-MODULE_ALIAS_CRYPTO("sha256");
-
-#include "crop_devid.c"
diff --git a/arch/sparc/lib/Makefile b/arch/sparc/lib/Makefile
index 5724d0f356eb5..98887dc295a1e 100644
--- a/arch/sparc/lib/Makefile
+++ b/arch/sparc/lib/Makefile
@@ -2,10 +2,11 @@
 # Makefile for Sparc library files..
 #
 
 asflags-y := -ansi -DST_DIV0=0x02
 
+obj-y                 += crypto/
 lib-$(CONFIG_SPARC32) += ashrdi3.o
 lib-$(CONFIG_SPARC32) += memcpy.o memset.o
 lib-y                 += strlen.o
 lib-y                 += checksum_$(BITS).o
 lib-$(CONFIG_SPARC32) += blockops.o
diff --git a/arch/sparc/lib/crypto/Kconfig b/arch/sparc/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..e5c3e4d3dba62
--- /dev/null
+++ b/arch/sparc/lib/crypto/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_SHA256_SPARC64
+	tristate
+	depends on SPARC64
+	default CRYPTO_LIB_SHA256
+	select CRYPTO_ARCH_HAVE_LIB_SHA256
+	select CRYPTO_LIB_SHA256_GENERIC
diff --git a/arch/sparc/lib/crypto/Makefile b/arch/sparc/lib/crypto/Makefile
new file mode 100644
index 0000000000000..75ee244ad6f79
--- /dev/null
+++ b/arch/sparc/lib/crypto/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_SHA256_SPARC64) += sha256-sparc64.o
+sha256-sparc64-y := sha256.o sha256_asm.o
diff --git a/arch/sparc/lib/crypto/sha256.c b/arch/sparc/lib/crypto/sha256.c
new file mode 100644
index 0000000000000..6f118a23d210a
--- /dev/null
+++ b/arch/sparc/lib/crypto/sha256.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SHA-256 accelerated using the sparc64 sha256 opcodes
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
+ * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <asm/elf.h>
+#include <asm/opcodes.h>
+#include <asm/pstate.h>
+#include <crypto/internal/sha2.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha256_opcodes);
+
+asmlinkage void sha256_sparc64_transform(u32 state[SHA256_STATE_WORDS],
+					 const u8 *data, size_t nblocks);
+
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+			const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_sha256_opcodes))
+		sha256_sparc64_transform(state, data, nblocks);
+	else
+		sha256_blocks_generic(state, data, nblocks);
+}
+EXPORT_SYMBOL(sha256_blocks_arch);
+
+bool sha256_is_arch_optimized(void)
+{
+	return static_key_enabled(&have_sha256_opcodes);
+}
+EXPORT_SYMBOL(sha256_is_arch_optimized);
+
+static int __init sha256_sparc64_mod_init(void)
+{
+	unsigned long cfr;
+
+	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
+		return 0;
+
+	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
+	if (!(cfr & CFR_SHA256))
+		return 0;
+
+	static_branch_enable(&have_sha256_opcodes);
+	pr_info("Using sparc64 sha256 opcode optimized SHA-256/SHA-224 implementation\n");
+	return 0;
+}
+arch_initcall(sha256_sparc64_mod_init);
+
+static void __exit sha256_sparc64_mod_exit(void)
+{
+}
+module_exit(sha256_sparc64_mod_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SHA-256 accelerated using the sparc64 sha256 opcodes");
diff --git a/arch/sparc/crypto/sha256_asm.S b/arch/sparc/lib/crypto/sha256_asm.S
similarity index 96%
rename from arch/sparc/crypto/sha256_asm.S
rename to arch/sparc/lib/crypto/sha256_asm.S
index 8ce88611e98ad..ddcdd3daf31e3 100644
--- a/arch/sparc/crypto/sha256_asm.S
+++ b/arch/sparc/lib/crypto/sha256_asm.S
@@ -2,11 +2,11 @@
 #include <linux/linkage.h>
 #include <asm/opcodes.h>
 #include <asm/visasm.h>
 
 ENTRY(sha256_sparc64_transform)
-	/* %o0 = digest, %o1 = data, %o2 = rounds */
+	/* %o0 = state, %o1 = data, %o2 = nblocks */
 	VISEntryHalf
 	ld	[%o0 + 0x00], %f0
 	ld	[%o0 + 0x04], %f1
 	ld	[%o0 + 0x08], %f2
 	ld	[%o0 + 0x0c], %f3
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 7fe678047939b..6319358b38c20 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -179,10 +179,13 @@ if RISCV
 source "arch/riscv/lib/crypto/Kconfig"
 endif
 if S390
 source "arch/s390/lib/crypto/Kconfig"
 endif
+if SPARC
+source "arch/sparc/lib/crypto/Kconfig"
+endif
 if X86
 source "arch/x86/lib/crypto/Kconfig"
 endif
 endif
 
-- 
2.49.0


