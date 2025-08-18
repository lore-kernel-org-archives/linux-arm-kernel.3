Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC06DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 22:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KpMKojLGL8NxU4sjh9jl7jLtbFKWAVQTCcOkTRTPAsY=; b=DQWYQlkCPkBjmdItHp9LNf/EVn
	/ejwEEGAGzchCutfUANxwbL1jKcZnpugjWVKRcOcah/9lQILpx0/qZorJG8XQ9xHz9jLGtMLe5FL+
	lQVRhGV83eVfmiu7Ju+kCnVSQqzTeImXA+uIn6N14nHLJAd4jp7laS8//buD0dqHhzYs0aQzIF6Z+
	+x4vqi38mj+7LntN2o6NXW739lmcVLidmm0WqfSjeHdfnpndNEsO4Tj0jmvYJyqXKI1nvEEUpPmGD
	ESJSUbQ0+S7/fYP1pFrbUnX3Wi4n0JA5BDgYFJTt4dZlDk5LvZlK1bIrnAZO+L6PFZsnJuj4ZHTeC
	C9V9332Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8mv-00000008s7E-2sU6;
	Mon, 18 Aug 2025 22:57:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8hW-00000008rZn-2eCo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 22:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 996D55C6209
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 22:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A268C4CEEB;
	Mon, 18 Aug 2025 22:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755557496;
	bh=2w26WXZcX+WzHaGO9KCdtfoKGa0Vl7NF2YKuWgbitUQ=;
	h=From:To:Cc:Subject:Date:From;
	b=a/qFzAaLGA4buMMVNyDbxG/IK1vMAmoj+cSFh9clUknW66c0VGbThNdc5RYUwUVGL
	 MXFPFhb+FO8VHUKNfdaZwEuN+krMjXQAOIq9srTk6onSiMe3RW205LvE/jlYhAjMGO
	 fWmK0ebWzv3gupmQ+FieujXoLrepHOBUYNktsgCLumAKxXpD/6g7+k6IFMJ2x2+0I+
	 kc9SqpJ4VO+o2D3J9Vyhl6FWf1fGMG/p2ewjmVEsEbhn1ran+7mM3s9Yy+xwESL1rO
	 l7k9h2LdSGtaWcCyenW/OQlOcbn28hwWglMjAStj2YXlOgsTuU5/G73+cwnQMF5KXt
	 NxjKDuuNcTM0w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] crypto: arm64/aes - use SHA-256 library instead of crypto_shash
Date: Mon, 18 Aug 2025 15:47:40 -0700
Message-ID: <20250818224740.103925-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_155138_748195_B8E7EED8 
X-CRM114-Status: GOOD (  13.13  )
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

In essiv_cbc_set_key(), just use the SHA-256 library instead of
crypto_shash.  This is simpler and also slightly faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/Kconfig    |  1 +
 arch/arm64/crypto/aes-glue.c | 21 +--------------------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 3bb5b513d5ae2..91f3093eee6ab 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -69,10 +69,11 @@ config CRYPTO_POLYVAL_ARM64_CE
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_AES_ARM64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR, CTS, XCTR, XTS"
 	select CRYPTO_AES
+	select CRYPTO_LIB_SHA256
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preserving ciphers: AES with ECB, CBC, CTR, CTS,
 	    XCTR, and XTS modes
 	  AEAD cipher: AES with CBC, ESSIV, and SHA-256
diff --git a/arch/arm64/crypto/aes-glue.c b/arch/arm64/crypto/aes-glue.c
index 81560f722b9de..5e207ff34482f 100644
--- a/arch/arm64/crypto/aes-glue.c
+++ b/arch/arm64/crypto/aes-glue.c
@@ -120,11 +120,10 @@ struct crypto_aes_xts_ctx {
 };
 
 struct crypto_aes_essiv_cbc_ctx {
 	struct crypto_aes_ctx key1;
 	struct crypto_aes_ctx __aligned(8) key2;
-	struct crypto_shash *hash;
 };
 
 struct mac_tfm_ctx {
 	struct crypto_aes_ctx key;
 	u8 __aligned(8) consts[];
@@ -169,11 +168,11 @@ static int __maybe_unused essiv_cbc_set_key(struct crypto_skcipher *tfm,
 
 	ret = aes_expandkey(&ctx->key1, in_key, key_len);
 	if (ret)
 		return ret;
 
-	crypto_shash_tfm_digest(ctx->hash, in_key, key_len, digest);
+	sha256(in_key, key_len, digest);
 
 	return aes_expandkey(&ctx->key2, digest, sizeof(digest));
 }
 
 static int __maybe_unused ecb_encrypt(struct skcipher_request *req)
@@ -386,26 +385,10 @@ static int cts_cbc_decrypt(struct skcipher_request *req)
 	kernel_neon_end();
 
 	return skcipher_walk_done(&walk, 0);
 }
 
-static int __maybe_unused essiv_cbc_init_tfm(struct crypto_skcipher *tfm)
-{
-	struct crypto_aes_essiv_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	ctx->hash = crypto_alloc_shash("sha256", 0, 0);
-
-	return PTR_ERR_OR_ZERO(ctx->hash);
-}
-
-static void __maybe_unused essiv_cbc_exit_tfm(struct crypto_skcipher *tfm)
-{
-	struct crypto_aes_essiv_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	crypto_free_shash(ctx->hash);
-}
-
 static int __maybe_unused essiv_cbc_encrypt(struct skcipher_request *req)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	struct crypto_aes_essiv_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
 	int err, rounds = 6 + ctx->key1.key_length / 4;
@@ -791,12 +774,10 @@ static struct skcipher_alg aes_algs[] = { {
 	.max_keysize	= AES_MAX_KEY_SIZE,
 	.ivsize		= AES_BLOCK_SIZE,
 	.setkey		= essiv_cbc_set_key,
 	.encrypt	= essiv_cbc_encrypt,
 	.decrypt	= essiv_cbc_decrypt,
-	.init		= essiv_cbc_init_tfm,
-	.exit		= essiv_cbc_exit_tfm,
 } };
 
 static int cbcmac_setkey(struct crypto_shash *tfm, const u8 *in_key,
 			 unsigned int key_len)
 {

base-commit: 34c065fe1d0dbb08073d83559d3173bb4f17dcc5
-- 
2.50.1


