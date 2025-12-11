Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB85D3E785
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 01:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCwNyJweE7ZsaG1dfdjgECLKGjjDX3fASpgMJjyEeKY=; b=G6aqyOqTp5zDpHOQ+keyGhrNgu
	F+ihtoAzvhk7fLoBnmbyZqqZOU6b5z6ja+SQ2FqGw1PevcCCTn+Y8F53kZt4AUBwYkNL3D8jA5roy
	3EbmsdGMhyQuJejNUX9iqGAL3EI5w+zi06FlRbGpwOKSC39NOWNLYcyZyAxqfh8hdIDLOq5JaXNun
	Tvp7Sa7zb21w45w0AF2T8tc4UK2MkkddjUjcI8mMZdbDQEygzGvd28ww0FDDHTtaTjx6TcLjuINmw
	w1zv4UT68GHqiDxRYmlgvFcI8oRLoZPn1htdLGupFrE/5l1sZyG+d7eVRlmTAP2sP3aLRs1w6tcpt
	DjHNwpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMY-0000000G3gM-1Pzu;
	Thu, 11 Dec 2025 01:20:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMU-0000000G3cq-4380
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 01:20:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 589386019F;
	Thu, 11 Dec 2025 01:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0469C19422;
	Thu, 11 Dec 2025 01:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765416054;
	bh=rFGsGEKONQ1i79E/OFO4NhtGkj4q9sAEbmjDHzHgb5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MN7aq9QsZOh+siGeAZxuvovZOHx6wrLQIDHeU7svXalJ9rpRsxYkezJvRC4AdMrZ9
	 UySMYOVyh/RkwNWN8gqgsXIbppPrIbO50CJhcUMl6ecpbd2tW64oeRaTfvYZtprhFz
	 JdWgVQ0+u4KR9KUk1PV0hD9peiEPxr7U4Q7M3bjJc5Ce/UYwrArX0VKYU9W+m6Kelm
	 AXP/ekj19hqsHuJL53AKqODDNYW/PQVUmi5Ofb0hpqU8pkYllg3bczsgBvIh3nhZKe
	 gKl6AE4IkEPyGz9j2tg7ROtsBJjFzXsSsox8DzT4wcSMJSUwn1pH3JlnfAVccAClPM
	 aesBc2THsBMpA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 05/12] lib/crypto: x86/nh: Migrate optimized code into library
Date: Wed, 10 Dec 2025 17:18:37 -0800
Message-ID: <20251211011846.8179-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211011846.8179-1-ebiggers@kernel.org>
References: <20251211011846.8179-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Migrate the x86_64 implementations of NH into lib/crypto/.  This makes
the nh() function be optimized on x86_64 kernels.

Note: this temporarily makes the adiantum template not utilize the
x86_64 optimized NH code.  This is resolved in a later commit that
converts the adiantum template to use nh() instead of "nhpoly1305".

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/crypto/Kconfig                       | 20 -----
 arch/x86/crypto/Makefile                      |  5 --
 arch/x86/crypto/nhpoly1305-avx2-glue.c        | 81 -------------------
 arch/x86/crypto/nhpoly1305-sse2-glue.c        | 80 ------------------
 lib/crypto/Kconfig                            |  1 +
 lib/crypto/Makefile                           |  1 +
 .../crypto/x86/nh-avx2.S                      |  3 +-
 .../crypto/x86/nh-sse2.S                      |  3 +-
 lib/crypto/x86/nh.h                           | 45 +++++++++++
 9 files changed, 49 insertions(+), 190 deletions(-)
 delete mode 100644 arch/x86/crypto/nhpoly1305-avx2-glue.c
 delete mode 100644 arch/x86/crypto/nhpoly1305-sse2-glue.c
 rename arch/x86/crypto/nh-avx2-x86_64.S => lib/crypto/x86/nh-avx2.S (98%)
 rename arch/x86/crypto/nh-sse2-x86_64.S => lib/crypto/x86/nh-sse2.S (97%)
 create mode 100644 lib/crypto/x86/nh.h

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 3fd2423d3cf8..ebb0838eaf30 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -331,30 +331,10 @@ config CRYPTO_AEGIS128_AESNI_SSE2
 
 	  Architecture: x86_64 using:
 	  - AES-NI (AES New Instructions)
 	  - SSE4.1 (Streaming SIMD Extensions 4.1)
 
-config CRYPTO_NHPOLY1305_SSE2
-	tristate "Hash functions: NHPoly1305 (SSE2)"
-	depends on 64BIT
-	select CRYPTO_NHPOLY1305
-	help
-	  NHPoly1305 hash function for Adiantum
-
-	  Architecture: x86_64 using:
-	  - SSE2 (Streaming SIMD Extensions 2)
-
-config CRYPTO_NHPOLY1305_AVX2
-	tristate "Hash functions: NHPoly1305 (AVX2)"
-	depends on 64BIT
-	select CRYPTO_NHPOLY1305
-	help
-	  NHPoly1305 hash function for Adiantum
-
-	  Architecture: x86_64 using:
-	  - AVX2 (Advanced Vector Extensions 2)
-
 config CRYPTO_SM3_AVX_X86_64
 	tristate "Hash functions: SM3 (AVX)"
 	depends on 64BIT
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 5f2fb4f148fe..b21ad0978c52 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -51,15 +51,10 @@ aesni-intel-$(CONFIG_64BIT) += aes-ctr-avx-x86_64.o \
 			       aes-xts-avx-x86_64.o
 
 obj-$(CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL) += ghash-clmulni-intel.o
 ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
 
-obj-$(CONFIG_CRYPTO_NHPOLY1305_SSE2) += nhpoly1305-sse2.o
-nhpoly1305-sse2-y := nh-sse2-x86_64.o nhpoly1305-sse2-glue.o
-obj-$(CONFIG_CRYPTO_NHPOLY1305_AVX2) += nhpoly1305-avx2.o
-nhpoly1305-avx2-y := nh-avx2-x86_64.o nhpoly1305-avx2-glue.o
-
 obj-$(CONFIG_CRYPTO_SM3_AVX_X86_64) += sm3-avx-x86_64.o
 sm3-avx-x86_64-y := sm3-avx-asm_64.o sm3_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
 sm4-aesni-avx-x86_64-y := sm4-aesni-avx-asm_64.o sm4_aesni_avx_glue.o
diff --git a/arch/x86/crypto/nhpoly1305-avx2-glue.c b/arch/x86/crypto/nhpoly1305-avx2-glue.c
deleted file mode 100644
index c3a872f4d6a7..000000000000
--- a/arch/x86/crypto/nhpoly1305-avx2-glue.c
+++ /dev/null
@@ -1,81 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * NHPoly1305 - ε-almost-∆-universal hash function for Adiantum
- * (AVX2 accelerated version)
- *
- * Copyright 2018 Google LLC
- */
-
-#include <crypto/internal/hash.h>
-#include <crypto/internal/simd.h>
-#include <crypto/nhpoly1305.h>
-#include <linux/module.h>
-#include <linux/sizes.h>
-#include <asm/simd.h>
-
-asmlinkage void nh_avx2(const u32 *key, const u8 *message, size_t message_len,
-			__le64 hash[NH_NUM_PASSES]);
-
-static int nhpoly1305_avx2_update(struct shash_desc *desc,
-				  const u8 *src, unsigned int srclen)
-{
-	if (srclen < 64 || !crypto_simd_usable())
-		return crypto_nhpoly1305_update(desc, src, srclen);
-
-	do {
-		unsigned int n = min_t(unsigned int, srclen, SZ_4K);
-
-		kernel_fpu_begin();
-		crypto_nhpoly1305_update_helper(desc, src, n, nh_avx2);
-		kernel_fpu_end();
-		src += n;
-		srclen -= n;
-	} while (srclen);
-	return 0;
-}
-
-static int nhpoly1305_avx2_digest(struct shash_desc *desc,
-				  const u8 *src, unsigned int srclen, u8 *out)
-{
-	return crypto_nhpoly1305_init(desc) ?:
-	       nhpoly1305_avx2_update(desc, src, srclen) ?:
-	       crypto_nhpoly1305_final(desc, out);
-}
-
-static struct shash_alg nhpoly1305_alg = {
-	.base.cra_name		= "nhpoly1305",
-	.base.cra_driver_name	= "nhpoly1305-avx2",
-	.base.cra_priority	= 300,
-	.base.cra_ctxsize	= sizeof(struct nhpoly1305_key),
-	.base.cra_module	= THIS_MODULE,
-	.digestsize		= POLY1305_DIGEST_SIZE,
-	.init			= crypto_nhpoly1305_init,
-	.update			= nhpoly1305_avx2_update,
-	.final			= crypto_nhpoly1305_final,
-	.digest			= nhpoly1305_avx2_digest,
-	.setkey			= crypto_nhpoly1305_setkey,
-	.descsize		= sizeof(struct nhpoly1305_state),
-};
-
-static int __init nhpoly1305_mod_init(void)
-{
-	if (!boot_cpu_has(X86_FEATURE_AVX2) ||
-	    !boot_cpu_has(X86_FEATURE_OSXSAVE))
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
-MODULE_DESCRIPTION("NHPoly1305 ε-almost-∆-universal hash function (AVX2-accelerated)");
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Eric Biggers <ebiggers@google.com>");
-MODULE_ALIAS_CRYPTO("nhpoly1305");
-MODULE_ALIAS_CRYPTO("nhpoly1305-avx2");
diff --git a/arch/x86/crypto/nhpoly1305-sse2-glue.c b/arch/x86/crypto/nhpoly1305-sse2-glue.c
deleted file mode 100644
index a268a8439a5c..000000000000
--- a/arch/x86/crypto/nhpoly1305-sse2-glue.c
+++ /dev/null
@@ -1,80 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * NHPoly1305 - ε-almost-∆-universal hash function for Adiantum
- * (SSE2 accelerated version)
- *
- * Copyright 2018 Google LLC
- */
-
-#include <crypto/internal/hash.h>
-#include <crypto/internal/simd.h>
-#include <crypto/nhpoly1305.h>
-#include <linux/module.h>
-#include <linux/sizes.h>
-#include <asm/simd.h>
-
-asmlinkage void nh_sse2(const u32 *key, const u8 *message, size_t message_len,
-			__le64 hash[NH_NUM_PASSES]);
-
-static int nhpoly1305_sse2_update(struct shash_desc *desc,
-				  const u8 *src, unsigned int srclen)
-{
-	if (srclen < 64 || !crypto_simd_usable())
-		return crypto_nhpoly1305_update(desc, src, srclen);
-
-	do {
-		unsigned int n = min_t(unsigned int, srclen, SZ_4K);
-
-		kernel_fpu_begin();
-		crypto_nhpoly1305_update_helper(desc, src, n, nh_sse2);
-		kernel_fpu_end();
-		src += n;
-		srclen -= n;
-	} while (srclen);
-	return 0;
-}
-
-static int nhpoly1305_sse2_digest(struct shash_desc *desc,
-				  const u8 *src, unsigned int srclen, u8 *out)
-{
-	return crypto_nhpoly1305_init(desc) ?:
-	       nhpoly1305_sse2_update(desc, src, srclen) ?:
-	       crypto_nhpoly1305_final(desc, out);
-}
-
-static struct shash_alg nhpoly1305_alg = {
-	.base.cra_name		= "nhpoly1305",
-	.base.cra_driver_name	= "nhpoly1305-sse2",
-	.base.cra_priority	= 200,
-	.base.cra_ctxsize	= sizeof(struct nhpoly1305_key),
-	.base.cra_module	= THIS_MODULE,
-	.digestsize		= POLY1305_DIGEST_SIZE,
-	.init			= crypto_nhpoly1305_init,
-	.update			= nhpoly1305_sse2_update,
-	.final			= crypto_nhpoly1305_final,
-	.digest			= nhpoly1305_sse2_digest,
-	.setkey			= crypto_nhpoly1305_setkey,
-	.descsize		= sizeof(struct nhpoly1305_state),
-};
-
-static int __init nhpoly1305_mod_init(void)
-{
-	if (!boot_cpu_has(X86_FEATURE_XMM2))
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
-MODULE_DESCRIPTION("NHPoly1305 ε-almost-∆-universal hash function (SSE2-accelerated)");
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Eric Biggers <ebiggers@google.com>");
-MODULE_ALIAS_CRYPTO("nhpoly1305");
-MODULE_ALIAS_CRYPTO("nhpoly1305-sse2");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index aa3f850ece24..33cf46bbadc8 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -117,10 +117,11 @@ config CRYPTO_LIB_NH
 config CRYPTO_LIB_NH_ARCH
 	bool
 	depends on CRYPTO_LIB_NH && !UML
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64 && KERNEL_MODE_NEON
+	default y if X86_64
 
 config CRYPTO_LIB_POLY1305
 	tristate
 	help
 	  The Poly1305 library functions.  Select this if your module uses any
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index e3a13952bc2a..45128eccedef 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -135,10 +135,11 @@ obj-$(CONFIG_CRYPTO_LIB_NH) += libnh.o
 libnh-y := nh.o
 ifeq ($(CONFIG_CRYPTO_LIB_NH_ARCH),y)
 CFLAGS_nh.o += -I$(src)/$(SRCARCH)
 libnh-$(CONFIG_ARM) += arm/nh-neon-core.o
 libnh-$(CONFIG_ARM64) += arm64/nh-neon-core.o
+libnh-$(CONFIG_X86) += x86/nh-sse2.o x86/nh-avx2.o
 endif
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_POLY1305) += libpoly1305.o
diff --git a/arch/x86/crypto/nh-avx2-x86_64.S b/lib/crypto/x86/nh-avx2.S
similarity index 98%
rename from arch/x86/crypto/nh-avx2-x86_64.S
rename to lib/crypto/x86/nh-avx2.S
index 791386d9a83a..9c085a31b137 100644
--- a/arch/x86/crypto/nh-avx2-x86_64.S
+++ b/lib/crypto/x86/nh-avx2.S
@@ -6,11 +6,10 @@
  *
  * Author: Eric Biggers <ebiggers@google.com>
  */
 
 #include <linux/linkage.h>
-#include <linux/cfi_types.h>
 
 #define		PASS0_SUMS	%ymm0
 #define		PASS1_SUMS	%ymm1
 #define		PASS2_SUMS	%ymm2
 #define		PASS3_SUMS	%ymm3
@@ -68,11 +67,11 @@
  * void nh_avx2(const u32 *key, const u8 *message, size_t message_len,
  *		__le64 hash[NH_NUM_PASSES])
  *
  * It's guaranteed that message_len % 16 == 0.
  */
-SYM_TYPED_FUNC_START(nh_avx2)
+SYM_FUNC_START(nh_avx2)
 
 	vmovdqu		0x00(KEY), K0
 	vmovdqu		0x10(KEY), K1
 	add		$0x20, KEY
 	vpxor		PASS0_SUMS, PASS0_SUMS, PASS0_SUMS
diff --git a/arch/x86/crypto/nh-sse2-x86_64.S b/lib/crypto/x86/nh-sse2.S
similarity index 97%
rename from arch/x86/crypto/nh-sse2-x86_64.S
rename to lib/crypto/x86/nh-sse2.S
index 75fb994b6d17..d36c0e6d5556 100644
--- a/arch/x86/crypto/nh-sse2-x86_64.S
+++ b/lib/crypto/x86/nh-sse2.S
@@ -6,11 +6,10 @@
  *
  * Author: Eric Biggers <ebiggers@google.com>
  */
 
 #include <linux/linkage.h>
-#include <linux/cfi_types.h>
 
 #define		PASS0_SUMS	%xmm0
 #define		PASS1_SUMS	%xmm1
 #define		PASS2_SUMS	%xmm2
 #define		PASS3_SUMS	%xmm3
@@ -70,11 +69,11 @@
  * void nh_sse2(const u32 *key, const u8 *message, size_t message_len,
  *		__le64 hash[NH_NUM_PASSES])
  *
  * It's guaranteed that message_len % 16 == 0.
  */
-SYM_TYPED_FUNC_START(nh_sse2)
+SYM_FUNC_START(nh_sse2)
 
 	movdqu		0x00(KEY), K0
 	movdqu		0x10(KEY), K1
 	movdqu		0x20(KEY), K2
 	add		$0x30, KEY
diff --git a/lib/crypto/x86/nh.h b/lib/crypto/x86/nh.h
new file mode 100644
index 000000000000..83361c2e9783
--- /dev/null
+++ b/lib/crypto/x86/nh.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * x86_64 accelerated implementation of NH
+ *
+ * Copyright 2018 Google LLC
+ */
+
+#include <asm/fpu/api.h>
+#include <linux/static_call.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sse2);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_avx2);
+
+asmlinkage void nh_sse2(const u32 *key, const u8 *message, size_t message_len,
+			__le64 hash[NH_NUM_PASSES]);
+asmlinkage void nh_avx2(const u32 *key, const u8 *message, size_t message_len,
+			__le64 hash[NH_NUM_PASSES]);
+
+static bool nh_arch(const u32 *key, const u8 *message, size_t message_len,
+		    __le64 hash[NH_NUM_PASSES])
+{
+	if (message_len >= 64 && static_branch_likely(&have_sse2) &&
+	    irq_fpu_usable()) {
+		kernel_fpu_begin();
+		if (static_branch_likely(&have_avx2))
+			nh_avx2(key, message, message_len, hash);
+		else
+			nh_sse2(key, message, message_len, hash);
+		kernel_fpu_end();
+		return true;
+	}
+	return false;
+}
+
+#define nh_mod_init_arch nh_mod_init_arch
+static void nh_mod_init_arch(void)
+{
+	if (boot_cpu_has(X86_FEATURE_XMM2)) {
+		static_branch_enable(&have_sse2);
+		if (boot_cpu_has(X86_FEATURE_AVX2) &&
+		    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
+				      NULL))
+			static_branch_enable(&have_avx2);
+	}
+}
-- 
2.52.0


