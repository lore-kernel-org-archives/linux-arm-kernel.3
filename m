Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40364C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 02:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SWBGgsmMNgd4muU+e9dhLcPu+0FeMGBtMVkV1938yY=; b=LuhnjOulx8+ZPQnPFae2BilhgX
	IzG0/id99kv1dczAarAjpKMbnGn/HTgFp6pe0A6X8n0lPU35k3G9S9jlVUN+UjkqLYLH6DiIXP5IY
	iCILlHGs9iljLE98uy1L68cwLrIMlx8UIYxdGloat4VpfryAhxWevXM4aKXzvcgZviXr8m6jlpZQf
	dQ3moxCKGClCxApNTZFgwe4qNZep0VoRFq9N/YnNTFYBdYzCkzWtB2BikqxhFBSGSJi3o7jHIOC0b
	mr32UHygnmmR9BHsxwcF6uwwvCZ3eCeNG3WjHjFBf19uT9Y2fuI4xmRiMRt7dOMdfo16PuwyERfPC
	4Trge5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBKy-00000008fbP-0qLA;
	Wed, 11 Jun 2025 02:37:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAxX-00000008cRY-3dei;
	Wed, 11 Jun 2025 02:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E3ACA51291;
	Wed, 11 Jun 2025 02:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818E2C4CEF5;
	Wed, 11 Jun 2025 02:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607978;
	bh=LymbL3HQOHfT/jDvUslu3WG9DHYX8sFXPLEZDKGLIl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BInTO5VYEIg6ikYMucIEzcf6zyBwRdamla0H1Jog5AEi7WG9AnYgCrl/Bm/0CIBYM
	 bUUvMH6uHSurGHGM0Tj6u8+eYLXIU9qzIKzlSebuPIKnXuox/g2JVmMG+jMLfGalEj
	 EWMNCB4977XqRRtwwZltuUSbpVoQwBGl4CLAXqaJA79Rnr2RZpnnqlBn/qumER6oHd
	 JSuOU0PvpS4JB1RdZWdxRIN30cQJf1sVFJVMElRBMeTO/jYzEf52vveaD33VvbCmTO
	 WiN9rc1QKHtrgc9BXBXa9jtp9CNyHJQ/0avsULhfeVFjXjUVwVTSTSwVctBNmu7Obm
	 VFxDXlz5N8TvQ==
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
Subject: [PATCH 14/16] lib/crypto/sha512: migrate sparc-optimized SHA-512 code to library
Date: Tue, 10 Jun 2025 19:09:21 -0700
Message-ID: <20250611020923.1482701-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611020923.1482701-1-ebiggers@kernel.org>
References: <20250611020923.1482701-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_191300_048551_C30050E1 
X-CRM114-Status: GOOD (  20.42  )
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

Instead of exposing the sparc-optimized SHA-512 code via sparc-specific
crypto_shash algorithms, instead just implement the sha512_blocks()
library function.  This is much simpler, it makes the SHA-512 (and
SHA-384) library functions be sparc-optimized, and it fixes the
longstanding issue where the sparc-optimized SHA-512 code was disabled
by default.  SHA-512 still remains available through crypto_shash, but
individual architectures no longer need to handle it.

To match sha512_blocks(), change the type of the nblocks parameter of
the assembly function from int to size_t.  The assembly function
actually already treated it as size_t.

Note: to see the diff from arch/sparc/crypto/sha512_glue.c to
lib/crypto/sparc/sha512.h, view this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/sparc/crypto/Kconfig                     |  10 --
 arch/sparc/crypto/Makefile                    |   2 -
 arch/sparc/crypto/sha512_glue.c               | 122 ------------------
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   1 +
 lib/crypto/sparc/sha512.h                     |  42 ++++++
 .../crypto => lib/crypto/sparc}/sha512_asm.S  |   0
 7 files changed, 44 insertions(+), 134 deletions(-)
 delete mode 100644 arch/sparc/crypto/sha512_glue.c
 create mode 100644 lib/crypto/sparc/sha512.h
 rename {arch/sparc/crypto => lib/crypto/sparc}/sha512_asm.S (100%)

diff --git a/arch/sparc/crypto/Kconfig b/arch/sparc/crypto/Kconfig
index a6ba319c42dce..9d8da9aef3a41 100644
--- a/arch/sparc/crypto/Kconfig
+++ b/arch/sparc/crypto/Kconfig
@@ -34,20 +34,10 @@ config CRYPTO_SHA1_SPARC64
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: sparc64
 
-config CRYPTO_SHA512_SPARC64
-	tristate "Hash functions: SHA-384 and SHA-512"
-	depends on SPARC64
-	select CRYPTO_SHA512
-	select CRYPTO_HASH
-	help
-	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
-
-	  Architecture: sparc64 using crypto instructions, when available
-
 config CRYPTO_AES_SPARC64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR"
 	depends on SPARC64
 	select CRYPTO_SKCIPHER
 	help
diff --git a/arch/sparc/crypto/Makefile b/arch/sparc/crypto/Makefile
index 701c39edb0d73..99a7e8fd13bc9 100644
--- a/arch/sparc/crypto/Makefile
+++ b/arch/sparc/crypto/Makefile
@@ -2,19 +2,17 @@
 #
 # Arch-specific CryptoAPI modules.
 #
 
 obj-$(CONFIG_CRYPTO_SHA1_SPARC64) += sha1-sparc64.o
-obj-$(CONFIG_CRYPTO_SHA512_SPARC64) += sha512-sparc64.o
 obj-$(CONFIG_CRYPTO_MD5_SPARC64) += md5-sparc64.o
 
 obj-$(CONFIG_CRYPTO_AES_SPARC64) += aes-sparc64.o
 obj-$(CONFIG_CRYPTO_DES_SPARC64) += des-sparc64.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_SPARC64) += camellia-sparc64.o
 
 sha1-sparc64-y := sha1_asm.o sha1_glue.o
-sha512-sparc64-y := sha512_asm.o sha512_glue.o
 md5-sparc64-y := md5_asm.o md5_glue.o
 
 aes-sparc64-y := aes_asm.o aes_glue.o
 des-sparc64-y := des_asm.o des_glue.o
 camellia-sparc64-y := camellia_asm.o camellia_glue.o
diff --git a/arch/sparc/crypto/sha512_glue.c b/arch/sparc/crypto/sha512_glue.c
deleted file mode 100644
index fb81c3290c8c0..0000000000000
--- a/arch/sparc/crypto/sha512_glue.c
+++ /dev/null
@@ -1,122 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Glue code for SHA512 hashing optimized for sparc64 crypto opcodes.
- *
- * This is based largely upon crypto/sha512_generic.c
- *
- * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
- */
-
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
-#include <asm/elf.h>
-#include <asm/opcodes.h>
-#include <asm/pstate.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha512_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-asmlinkage void sha512_sparc64_transform(u64 *digest, const char *data,
-					 unsigned int rounds);
-
-static void sha512_block(struct sha512_state *sctx, const u8 *src, int blocks)
-{
-	sha512_sparc64_transform(sctx->state, src, blocks);
-}
-
-static int sha512_sparc64_update(struct shash_desc *desc, const u8 *data,
-				 unsigned int len)
-{
-	return sha512_base_do_update_blocks(desc, data, len, sha512_block);
-}
-
-static int sha512_sparc64_finup(struct shash_desc *desc, const u8 *src,
-				unsigned int len, u8 *out)
-{
-	sha512_base_do_finup(desc, src, len, sha512_block);
-	return sha512_base_finish(desc, out);
-}
-
-static struct shash_alg sha512_alg = {
-	.digestsize	=	SHA512_DIGEST_SIZE,
-	.init		=	sha512_base_init,
-	.update		=	sha512_sparc64_update,
-	.finup		=	sha512_sparc64_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha512",
-		.cra_driver_name=	"sha512-sparc64",
-		.cra_priority	=	SPARC_CR_OPCODE_PRIORITY,
-		.cra_blocksize	=	SHA512_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static struct shash_alg sha384_alg = {
-	.digestsize	=	SHA384_DIGEST_SIZE,
-	.init		=	sha384_base_init,
-	.update		=	sha512_sparc64_update,
-	.finup		=	sha512_sparc64_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha384",
-		.cra_driver_name=	"sha384-sparc64",
-		.cra_priority	=	SPARC_CR_OPCODE_PRIORITY,
-		.cra_blocksize	=	SHA384_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static bool __init sparc64_has_sha512_opcode(void)
-{
-	unsigned long cfr;
-
-	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
-		return false;
-
-	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
-	if (!(cfr & CFR_SHA512))
-		return false;
-
-	return true;
-}
-
-static int __init sha512_sparc64_mod_init(void)
-{
-	if (sparc64_has_sha512_opcode()) {
-		int ret = crypto_register_shash(&sha384_alg);
-		if (ret < 0)
-			return ret;
-
-		ret = crypto_register_shash(&sha512_alg);
-		if (ret < 0) {
-			crypto_unregister_shash(&sha384_alg);
-			return ret;
-		}
-
-		pr_info("Using sparc64 sha512 opcode optimized SHA-512/SHA-384 implementation\n");
-		return 0;
-	}
-	pr_info("sparc64 sha512 opcode not available.\n");
-	return -ENODEV;
-}
-
-static void __exit sha512_sparc64_mod_fini(void)
-{
-	crypto_unregister_shash(&sha384_alg);
-	crypto_unregister_shash(&sha512_alg);
-}
-
-module_init(sha512_sparc64_mod_init);
-module_exit(sha512_sparc64_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-384 and SHA-512 Secure Hash Algorithm, sparc64 sha512 opcode accelerated");
-
-MODULE_ALIAS_CRYPTO("sha384");
-MODULE_ALIAS_CRYPTO("sha512");
-
-#include "crop_devid.c"
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 4bdb4118a789f..0d6522b92ef57 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -182,10 +182,11 @@ config CRYPTO_LIB_SHA512_ARCH
 	default y if ARM && !CPU_V7M
 	default y if ARM64
 	default y if MIPS && CPU_CAVIUM_OCTEON
 	default y if RISCV && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	default y if S390
+	default y if SPARC64
 
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index bfa35cc235cea..3c651927f5ba5 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -90,10 +90,11 @@ $(obj)/arm64/sha512-core.S: $(src)/../../arch/arm64/lib/crypto/sha2-armv8.pl
 clean-files += arm64/sha512-core.S
 libsha512-$(CONFIG_KERNEL_MODE_NEON) += arm64/sha512-ce-core.o
 endif
 
 libsha512-$(CONFIG_RISCV) += riscv/sha512-riscv64-zvknhb-zvkb.o
+libsha512-$(CONFIG_SPARC) += sparc/sha512_asm.o
 endif # CONFIG_CRYPTO_LIB_SHA512_ARCH
 
 obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
diff --git a/lib/crypto/sparc/sha512.h b/lib/crypto/sparc/sha512.h
new file mode 100644
index 0000000000000..55303ab6b15f7
--- /dev/null
+++ b/lib/crypto/sparc/sha512.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SHA-512 accelerated using the sparc64 sha512 opcodes
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
+ */
+
+#include <asm/elf.h>
+#include <asm/opcodes.h>
+#include <asm/pstate.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha512_opcodes);
+
+asmlinkage void sha512_sparc64_transform(struct sha512_block_state *state,
+					 const u8 *data, size_t nblocks);
+
+static void sha512_blocks(struct sha512_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_sha512_opcodes))
+		sha512_sparc64_transform(state, data, nblocks);
+	else
+		sha512_blocks_generic(state, data, nblocks);
+}
+
+#define sha512_mod_init_arch sha512_mod_init_arch
+static inline void sha512_mod_init_arch(void)
+{
+	unsigned long cfr;
+
+	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
+		return;
+
+	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
+	if (!(cfr & CFR_SHA512))
+		return;
+
+	static_branch_enable(&have_sha512_opcodes);
+	pr_info("Using sparc64 sha512 opcode optimized SHA-512/SHA-384 implementation\n");
+}
diff --git a/arch/sparc/crypto/sha512_asm.S b/lib/crypto/sparc/sha512_asm.S
similarity index 100%
rename from arch/sparc/crypto/sha512_asm.S
rename to lib/crypto/sparc/sha512_asm.S
-- 
2.49.0


