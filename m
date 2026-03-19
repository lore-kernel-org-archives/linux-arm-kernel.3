Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9E5107761F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 06:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65xqjCGf3OBx6qcpsbOtMDFXG6VyarCHXwMAyjo5TAM=; b=GjO/p+EkTZ/fsc+evAJ4HMdxRK
	zWrn92jTnJSAIi7sPHasM/cxKmUfPzxqD7Kwi9cjqvdxPxDYjmCFJPSGoiiJ3Z6uYpuo9258eegmV
	IVV0LoznIgx/LvuQ3podQnVAdavXU4oSbBSCzn/3idrvW9TsxvithT2oiFwgCnXHF6BC5aBMBi97o
	rznF+j4eLSEj55PXI2muDRD+fbDlAh31UQ5qzlOCT2c4kX0Ad5kE2j2gKQWgYDFNihEhF8Z+E2V6Y
	FSAJY9HomFK8d8iV+dM29UJ1lf+/O8yTjNgccp1VI8PbJnac4+fHgx4JYQvPqLQdnSZ3p9ABpXIAo
	K+9Kx3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36j1-00000009zjq-2ePu;
	Thu, 19 Mar 2026 06:19:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36iz-00000009zhV-3pCi;
	Thu, 19 Mar 2026 06:19:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3850A6011F;
	Thu, 19 Mar 2026 06:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40D8C19425;
	Thu, 19 Mar 2026 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773901157;
	bh=kMhXMfUw7a3oxO5oBok+3qNaUgBLXU92TQEyaKkUMGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rlqFKpbdFAY4Pcu1e0H3TJvAM5+Z2cLF5fmtHa514Z/v0t5GLEqlRilbtxuv5DjQ6
	 spY4I+vncBblbT6ugst4CEbOSsJ6dyzLOSKb2bScLfRZx4lkxcgozT4YmL3s7lDrg/
	 ULs0u7RLPlEoSTSxrp8rXth/FYpDFEGkuxsgbGnN/CeixwPe4JqhZOsTTc5eN+wpWe
	 JWB6aD+U4OHZIhDW0o4kbcJ2keEMvmVEuxw1udP92hcWXQvCwiARe91aZlF+EYKm8A
	 eaF4bHuTU+Crd5B3yStX34+sjjm5j/MT4MMaHBVdrAmIfsSfSN4OSt+4vN7GHQZf70
	 R9TZKEXDlwy8g==
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
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 05/19] crypto: arm/ghash - Make the "ghash" crypto_shash NEON-only
Date: Wed, 18 Mar 2026 23:17:06 -0700
Message-ID: <20260319061723.1140720-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319061723.1140720-1-ebiggers@kernel.org>
References: <20260319061723.1140720-1-ebiggers@kernel.org>
MIME-Version: 1.0
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

arch/arm/crypto/ghash-ce-glue.c originally provided only a "ghash"
crypto_shash algorithm using PMULL if available, else NEON.

Significantly later, it was updated to also provide a full AES-GCM
implementation using PMULL.

This made the PMULL support in the "ghash" crypto_shash largely
obsolete.  Indeed, the arm64 equivalent of this file unconditionally
uses only ASIMD in its "ghash" crypto_shash.

Given that inconsistency and the fact that the NEON-only code is more
easily separable into the GHASH library than the PMULL based code is,
let's align with arm64 and just support NEON-only for the pure GHASH.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/ghash-ce-glue.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/arch/arm/crypto/ghash-ce-glue.c b/arch/arm/crypto/ghash-ce-glue.c
index 454adcc62cc6..d7d787de7dd3 100644
--- a/arch/arm/crypto/ghash-ce-glue.c
+++ b/arch/arm/crypto/ghash-ce-glue.c
@@ -34,11 +34,11 @@ MODULE_ALIAS_CRYPTO("rfc4106(gcm(aes))");
 
 #define RFC4106_NONCE_SIZE	4
 
 struct ghash_key {
 	be128	k;
-	u64	h[][2];
+	u64	h[1][2];
 };
 
 struct gcm_key {
 	u64	h[4][2];
 	u32	rk[AES_MAX_KEYLENGTH_U32];
@@ -49,16 +49,14 @@ struct gcm_key {
 struct arm_ghash_desc_ctx {
 	u64 digest[GHASH_DIGEST_SIZE/sizeof(u64)];
 };
 
 asmlinkage void pmull_ghash_update_p64(int blocks, u64 dg[], const char *src,
-				       u64 const h[][2], const char *head);
+				       u64 const h[4][2], const char *head);
 
 asmlinkage void pmull_ghash_update_p8(int blocks, u64 dg[], const char *src,
-				      u64 const h[][2], const char *head);
-
-static __ro_after_init DEFINE_STATIC_KEY_FALSE(use_p64);
+				      u64 const h[1][2], const char *head);
 
 static int ghash_init(struct shash_desc *desc)
 {
 	struct arm_ghash_desc_ctx *ctx = shash_desc_ctx(desc);
 
@@ -68,14 +66,11 @@ static int ghash_init(struct shash_desc *desc)
 
 static void ghash_do_update(int blocks, u64 dg[], const char *src,
 			    struct ghash_key *key, const char *head)
 {
 	kernel_neon_begin();
-	if (static_branch_likely(&use_p64))
-		pmull_ghash_update_p64(blocks, dg, src, key->h, head);
-	else
-		pmull_ghash_update_p8(blocks, dg, src, key->h, head);
+	pmull_ghash_update_p8(blocks, dg, src, key->h, head);
 	kernel_neon_end();
 }
 
 static int ghash_update(struct shash_desc *desc, const u8 *src,
 			unsigned int len)
@@ -145,23 +140,10 @@ static int ghash_setkey(struct crypto_shash *tfm,
 		return -EINVAL;
 
 	/* needed for the fallback */
 	memcpy(&key->k, inkey, GHASH_BLOCK_SIZE);
 	ghash_reflect(key->h[0], &key->k);
-
-	if (static_branch_likely(&use_p64)) {
-		be128 h = key->k;
-
-		gf128mul_lle(&h, &key->k);
-		ghash_reflect(key->h[1], &h);
-
-		gf128mul_lle(&h, &key->k);
-		ghash_reflect(key->h[2], &h);
-
-		gf128mul_lle(&h, &key->k);
-		ghash_reflect(key->h[3], &h);
-	}
 	return 0;
 }
 
 static struct shash_alg ghash_alg = {
 	.digestsize		= GHASH_DIGEST_SIZE,
@@ -173,15 +155,15 @@ static struct shash_alg ghash_alg = {
 	.import			= ghash_import,
 	.descsize		= sizeof(struct arm_ghash_desc_ctx),
 	.statesize		= sizeof(struct ghash_desc_ctx),
 
 	.base.cra_name		= "ghash",
-	.base.cra_driver_name	= "ghash-ce",
+	.base.cra_driver_name	= "ghash-neon",
 	.base.cra_priority	= 300,
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
 	.base.cra_blocksize	= GHASH_BLOCK_SIZE,
-	.base.cra_ctxsize	= sizeof(struct ghash_key) + sizeof(u64[2]),
+	.base.cra_ctxsize	= sizeof(struct ghash_key),
 	.base.cra_module	= THIS_MODULE,
 };
 
 void pmull_gcm_encrypt(int blocks, u64 dg[], const char *src,
 		       struct gcm_key const *k, char *dst,
@@ -569,12 +551,10 @@ static int __init ghash_ce_mod_init(void)
 	if (elf_hwcap2 & HWCAP2_PMULL) {
 		err = crypto_register_aeads(gcm_aes_algs,
 					    ARRAY_SIZE(gcm_aes_algs));
 		if (err)
 			return err;
-		ghash_alg.base.cra_ctxsize += 3 * sizeof(u64[2]);
-		static_branch_enable(&use_p64);
 	}
 
 	err = crypto_register_shash(&ghash_alg);
 	if (err)
 		goto err_aead;
-- 
2.53.0


