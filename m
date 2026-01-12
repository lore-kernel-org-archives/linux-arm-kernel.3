Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E2CCF45C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7vkOKnDugdkCKq4wtl6aVNFQgURrQRIOwd5WtyOcis=; b=ZebpbsJX4gcHybL2xy6ts9ij/u
	cAOew2iwM0ygfL7N1j66jKfvs8rrVMxmvfRZUWkLmI0y9p2P1MT4pyrq0/K91ti+9QbgiXi2DPg4/
	QVbAvC870Ufb7Gdi5Z0Zs+QyOdgepRSajTbIJ0w/9npIn3/HjSdHa3KSq4s4AhLm0aKCz8Or9AE5S
	euh9lxH3DJqnXWxyt+FdyqZ85og4qJLnl0aS0qnHFffq6flbtFROeDhLuCeMZPQJ6jX/eDbK4k1Zj
	o/cuer9xOEoj631JRwNFfmDwk+e4PmTWW7Q+44paZKr3Nd8a5/LelFNxkF1PDnz49Lv8hbTTlOM+y
	UauRByVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNWg-000000060Nv-20qm;
	Mon, 12 Jan 2026 19:24:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVe-00000005z39-2xXa;
	Mon, 12 Jan 2026 19:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B77344382;
	Mon, 12 Jan 2026 19:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC557C2BC9E;
	Mon, 12 Jan 2026 19:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245806;
	bh=KZ6YNHHvsdIxal21I4zQ8OcS7arQu3vmqdqR8uLdXXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tRrT//dJTBOCkmjfH56jwPUVRsaIHuRNm2ahbv5PVt9YrWAROEBi8+/6zhymwFE+Z
	 J4UgGBMK8cMfSYPN8krzg+rCencfxT8BM/QW2slVnkR5p428tkRskFhl5yoTsHJ4s6
	 sgmxjp7wFQoOZLmnecSjDJzZ2V9CQpkwYTagF/i2Odd+sYrYyGD4d4ofEi0YqhosbQ
	 Y1D5Nzrnm993ukQA+aF52HYb9vQxcxt3fWSpD93G+S5yc+B9pWeKCNO4Sw/AdVm92c
	 380dtcKmprMIpFdd25S5qpuWgZjN/XDVb9OjUQ8bZIshn/q/QhUX4VANuNidkngMhC
	 Jknd0YEZiuA2g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 15/35] lib/crypto: s390/aes: Migrate optimized code into library
Date: Mon, 12 Jan 2026 11:20:13 -0800
Message-ID: <20260112192035.10427-16-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_112326_821215_CB2B7376 
X-CRM114-Status: GOOD (  25.47  )
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

Implement aes_preparekey_arch(), aes_encrypt_arch(), and
aes_decrypt_arch() using the CPACF AES instructions.

Then, remove the superseded "aes-s390" crypto_cipher.

The result is that both the AES library and crypto_cipher APIs use the
CPACF AES instructions, whereas previously only crypto_cipher did (and
it wasn't enabled by default, which this commit fixes as well).

Note that this preserves the optimization where the AES key is stored in
raw form rather than expanded form.  CPACF just takes the raw key.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/s390/crypto/Kconfig    |   2 -
 arch/s390/crypto/aes_s390.c | 113 ------------------------------------
 include/crypto/aes.h        |   3 +
 lib/crypto/Kconfig          |   1 +
 lib/crypto/s390/aes.h       | 106 +++++++++++++++++++++++++++++++++
 5 files changed, 110 insertions(+), 115 deletions(-)
 create mode 100644 lib/crypto/s390/aes.h

diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index f838ca055f6d..79a2d0034258 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -12,14 +12,12 @@ config CRYPTO_GHASH_S390
 
 	  It is available as of z196.
 
 config CRYPTO_AES_S390
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR, XTS, GCM"
-	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	help
-	  Block cipher: AES cipher algorithms (FIPS 197)
 	  AEAD cipher: AES with GCM
 	  Length-preserving ciphers: AES with ECB, CBC, XTS, and CTR modes
 
 	  Architecture: s390
 
diff --git a/arch/s390/crypto/aes_s390.c b/arch/s390/crypto/aes_s390.c
index d0a295435680..62edc66d5478 100644
--- a/arch/s390/crypto/aes_s390.c
+++ b/arch/s390/crypto/aes_s390.c
@@ -18,11 +18,10 @@
 
 #include <crypto/aes.h>
 #include <crypto/algapi.h>
 #include <crypto/ghash.h>
 #include <crypto/internal/aead.h>
-#include <crypto/internal/cipher.h>
 #include <crypto/internal/skcipher.h>
 #include <crypto/scatterwalk.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/cpufeature.h>
@@ -43,11 +42,10 @@ struct s390_aes_ctx {
 	u8 key[AES_MAX_KEY_SIZE];
 	int key_len;
 	unsigned long fc;
 	union {
 		struct crypto_skcipher *skcipher;
-		struct crypto_cipher *cip;
 	} fallback;
 };
 
 struct s390_xts_ctx {
 	union {
@@ -70,113 +68,10 @@ struct gcm_sg_walk {
 	unsigned int buf_bytes;
 	u8 *ptr;
 	unsigned int nbytes;
 };
 
-static int setkey_fallback_cip(struct crypto_tfm *tfm, const u8 *in_key,
-		unsigned int key_len)
-{
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-
-	sctx->fallback.cip->base.crt_flags &= ~CRYPTO_TFM_REQ_MASK;
-	sctx->fallback.cip->base.crt_flags |= (tfm->crt_flags &
-			CRYPTO_TFM_REQ_MASK);
-
-	return crypto_cipher_setkey(sctx->fallback.cip, in_key, key_len);
-}
-
-static int aes_set_key(struct crypto_tfm *tfm, const u8 *in_key,
-		       unsigned int key_len)
-{
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-	unsigned long fc;
-
-	/* Pick the correct function code based on the key length */
-	fc = (key_len == 16) ? CPACF_KM_AES_128 :
-	     (key_len == 24) ? CPACF_KM_AES_192 :
-	     (key_len == 32) ? CPACF_KM_AES_256 : 0;
-
-	/* Check if the function code is available */
-	sctx->fc = (fc && cpacf_test_func(&km_functions, fc)) ? fc : 0;
-	if (!sctx->fc)
-		return setkey_fallback_cip(tfm, in_key, key_len);
-
-	sctx->key_len = key_len;
-	memcpy(sctx->key, in_key, key_len);
-	return 0;
-}
-
-static void crypto_aes_encrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-
-	if (unlikely(!sctx->fc)) {
-		crypto_cipher_encrypt_one(sctx->fallback.cip, out, in);
-		return;
-	}
-	cpacf_km(sctx->fc, &sctx->key, out, in, AES_BLOCK_SIZE);
-}
-
-static void crypto_aes_decrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
-{
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-
-	if (unlikely(!sctx->fc)) {
-		crypto_cipher_decrypt_one(sctx->fallback.cip, out, in);
-		return;
-	}
-	cpacf_km(sctx->fc | CPACF_DECRYPT,
-		 &sctx->key, out, in, AES_BLOCK_SIZE);
-}
-
-static int fallback_init_cip(struct crypto_tfm *tfm)
-{
-	const char *name = tfm->__crt_alg->cra_name;
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-
-	sctx->fallback.cip = crypto_alloc_cipher(name, 0,
-						 CRYPTO_ALG_NEED_FALLBACK);
-
-	if (IS_ERR(sctx->fallback.cip)) {
-		pr_err("Allocating AES fallback algorithm %s failed\n",
-		       name);
-		return PTR_ERR(sctx->fallback.cip);
-	}
-
-	return 0;
-}
-
-static void fallback_exit_cip(struct crypto_tfm *tfm)
-{
-	struct s390_aes_ctx *sctx = crypto_tfm_ctx(tfm);
-
-	crypto_free_cipher(sctx->fallback.cip);
-	sctx->fallback.cip = NULL;
-}
-
-static struct crypto_alg aes_alg = {
-	.cra_name		=	"aes",
-	.cra_driver_name	=	"aes-s390",
-	.cra_priority		=	300,
-	.cra_flags		=	CRYPTO_ALG_TYPE_CIPHER |
-					CRYPTO_ALG_NEED_FALLBACK,
-	.cra_blocksize		=	AES_BLOCK_SIZE,
-	.cra_ctxsize		=	sizeof(struct s390_aes_ctx),
-	.cra_module		=	THIS_MODULE,
-	.cra_init               =       fallback_init_cip,
-	.cra_exit               =       fallback_exit_cip,
-	.cra_u			=	{
-		.cipher = {
-			.cia_min_keysize	=	AES_MIN_KEY_SIZE,
-			.cia_max_keysize	=	AES_MAX_KEY_SIZE,
-			.cia_setkey		=	aes_set_key,
-			.cia_encrypt		=	crypto_aes_encrypt,
-			.cia_decrypt		=	crypto_aes_decrypt,
-		}
-	}
-};
-
 static int setkey_fallback_skcipher(struct crypto_skcipher *tfm, const u8 *key,
 				    unsigned int len)
 {
 	struct s390_aes_ctx *sctx = crypto_skcipher_ctx(tfm);
 
@@ -1047,11 +942,10 @@ static struct aead_alg gcm_aes_aead = {
 		.cra_driver_name	= "gcm-aes-s390",
 		.cra_module		= THIS_MODULE,
 	},
 };
 
-static struct crypto_alg *aes_s390_alg;
 static struct skcipher_alg *aes_s390_skcipher_algs[5];
 static int aes_s390_skciphers_num;
 static struct aead_alg *aes_s390_aead_alg;
 
 static int aes_s390_register_skcipher(struct skcipher_alg *alg)
@@ -1064,12 +958,10 @@ static int aes_s390_register_skcipher(struct skcipher_alg *alg)
 	return ret;
 }
 
 static void aes_s390_fini(void)
 {
-	if (aes_s390_alg)
-		crypto_unregister_alg(aes_s390_alg);
 	while (aes_s390_skciphers_num--)
 		crypto_unregister_skcipher(aes_s390_skcipher_algs[aes_s390_skciphers_num]);
 	if (ctrblk)
 		free_page((unsigned long) ctrblk);
 
@@ -1088,14 +980,10 @@ static int __init aes_s390_init(void)
 	cpacf_query(CPACF_KMA, &kma_functions);
 
 	if (cpacf_test_func(&km_functions, CPACF_KM_AES_128) ||
 	    cpacf_test_func(&km_functions, CPACF_KM_AES_192) ||
 	    cpacf_test_func(&km_functions, CPACF_KM_AES_256)) {
-		ret = crypto_register_alg(&aes_alg);
-		if (ret)
-			goto out_err;
-		aes_s390_alg = &aes_alg;
 		ret = aes_s390_register_skcipher(&ecb_aes_alg);
 		if (ret)
 			goto out_err;
 	}
 
@@ -1154,6 +1042,5 @@ module_exit(aes_s390_fini);
 
 MODULE_ALIAS_CRYPTO("aes-all");
 
 MODULE_DESCRIPTION("Rijndael (AES) Cipher Algorithm");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index bff71cfaedeb..19fd99f383fb 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -44,10 +44,13 @@ union aes_enckey_arch {
 	 * when that code is usable at key preparation time.  Otherwise they
 	 * fall back to rndkeys.  In the latter case, p8.nrounds (which doesn't
 	 * overlap rndkeys) is set to 0 to differentiate the two formats.
 	 */
 	struct p8_aes_key p8;
+#elif defined(CONFIG_S390)
+	/* Used when the CPU supports CPACF AES for this key's length */
+	u8 raw_key[AES_MAX_KEY_SIZE];
 #endif
 #endif /* CONFIG_CRYPTO_LIB_AES_ARCH */
 };
 
 union aes_invkey_arch {
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 2690b5ffc5ca..56a9b4f53b0e 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -17,10 +17,11 @@ config CRYPTO_LIB_AES_ARCH
 	default y if ARM
 	default y if ARM64
 	default y if PPC && (SPE || (PPC64 && VSX))
 	default y if RISCV && 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
 		     RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
+	default y if S390
 
 config CRYPTO_LIB_AESCFB
 	tristate
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_UTILS
diff --git a/lib/crypto/s390/aes.h b/lib/crypto/s390/aes.h
new file mode 100644
index 000000000000..5466f6ecbce7
--- /dev/null
+++ b/lib/crypto/s390/aes.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AES optimized using the CP Assist for Cryptographic Functions (CPACF)
+ *
+ * Copyright 2026 Google LLC
+ */
+#include <asm/cpacf.h>
+#include <linux/cpufeature.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_cpacf_aes128);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_cpacf_aes192);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_cpacf_aes256);
+
+/*
+ * When the CPU supports CPACF AES for the requested key length, we need only
+ * save a copy of the raw AES key, as that's what the CPACF instructions need.
+ *
+ * When unsupported, fall back to the generic key expansion and en/decryption.
+ */
+static void aes_preparekey_arch(union aes_enckey_arch *k,
+				union aes_invkey_arch *inv_k,
+				const u8 *in_key, int key_len, int nrounds)
+{
+	if (key_len == AES_KEYSIZE_128) {
+		if (static_branch_likely(&have_cpacf_aes128)) {
+			memcpy(k->raw_key, in_key, AES_KEYSIZE_128);
+			return;
+		}
+	} else if (key_len == AES_KEYSIZE_192) {
+		if (static_branch_likely(&have_cpacf_aes192)) {
+			memcpy(k->raw_key, in_key, AES_KEYSIZE_192);
+			return;
+		}
+	} else {
+		if (static_branch_likely(&have_cpacf_aes256)) {
+			memcpy(k->raw_key, in_key, AES_KEYSIZE_256);
+			return;
+		}
+	}
+	aes_expandkey_generic(k->rndkeys, inv_k ? inv_k->inv_rndkeys : NULL,
+			      in_key, key_len);
+}
+
+static inline bool aes_crypt_s390(const struct aes_enckey *key,
+				  u8 out[AES_BLOCK_SIZE],
+				  const u8 in[AES_BLOCK_SIZE], int decrypt)
+{
+	if (key->len == AES_KEYSIZE_128) {
+		if (static_branch_likely(&have_cpacf_aes128)) {
+			cpacf_km(CPACF_KM_AES_128 | decrypt,
+				 (void *)key->k.raw_key, out, in,
+				 AES_BLOCK_SIZE);
+			return true;
+		}
+	} else if (key->len == AES_KEYSIZE_192) {
+		if (static_branch_likely(&have_cpacf_aes192)) {
+			cpacf_km(CPACF_KM_AES_192 | decrypt,
+				 (void *)key->k.raw_key, out, in,
+				 AES_BLOCK_SIZE);
+			return true;
+		}
+	} else {
+		if (static_branch_likely(&have_cpacf_aes256)) {
+			cpacf_km(CPACF_KM_AES_256 | decrypt,
+				 (void *)key->k.raw_key, out, in,
+				 AES_BLOCK_SIZE);
+			return true;
+		}
+	}
+	return false;
+}
+
+static void aes_encrypt_arch(const struct aes_enckey *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (likely(aes_crypt_s390(key, out, in, 0)))
+		return;
+	aes_encrypt_generic(key->k.rndkeys, key->nrounds, out, in);
+}
+
+static void aes_decrypt_arch(const struct aes_key *key,
+			     u8 out[AES_BLOCK_SIZE],
+			     const u8 in[AES_BLOCK_SIZE])
+{
+	if (likely(aes_crypt_s390((const struct aes_enckey *)key, out, in,
+				  CPACF_DECRYPT)))
+		return;
+	aes_decrypt_generic(key->inv_k.inv_rndkeys, key->nrounds, out, in);
+}
+
+#define aes_mod_init_arch aes_mod_init_arch
+static void aes_mod_init_arch(void)
+{
+	if (cpu_have_feature(S390_CPU_FEATURE_MSA)) {
+		cpacf_mask_t km_functions;
+
+		cpacf_query(CPACF_KM, &km_functions);
+		if (cpacf_test_func(&km_functions, CPACF_KM_AES_128))
+			static_branch_enable(&have_cpacf_aes128);
+		if (cpacf_test_func(&km_functions, CPACF_KM_AES_192))
+			static_branch_enable(&have_cpacf_aes192);
+		if (cpacf_test_func(&km_functions, CPACF_KM_AES_256))
+			static_branch_enable(&have_cpacf_aes256);
+	}
+}
-- 
2.52.0


