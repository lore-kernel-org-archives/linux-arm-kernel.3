Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ADDCF45C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMYU3wC220z6LEubQrDxOC5v0wDwchogTnHuD2Z5JHg=; b=yU8LFwEVfDE9+XOeBJXwVRvkwl
	9kOq72AidEL0lXEaSlEFHmQNxlW+xgyXS7bTWo5e/pbtOx4fWwpSNeDYnzbQvFG57dAQoEksPhkYI
	/tPsRnPTdcZv9C+8Ukvw6bc4iU0ZDp3AWhszgMLTSAF9cIMaH2qGGobOJ9Q9E/hhUxnjUbLkZ5w5k
	DGFkogke13W3D1J6WPgG9kwf8LvaRPzRnbuC5J47bZ6MhBzCj3I6LXst3CiB5sYG/FtbwM5nN1y1m
	EZ2J2uREMlVZ1cJCrn6UncZqHxtdP5C0Rq6XyH1uQcnT464G2RFbLeUXpRY+un/JWyxBk+xCy7d//
	E+asC1gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVm-00000005zBk-1eUb;
	Mon, 12 Jan 2026 19:23:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVY-00000005yvH-3CB0;
	Mon, 12 Jan 2026 19:23:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B16D44329;
	Mon, 12 Jan 2026 19:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E2AC16AAE;
	Mon, 12 Jan 2026 19:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245799;
	bh=bpasNFXQc6Wz1acJi7F8zoXotEra0E6njU13yRy/Zpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M9YtHnsm+ldZf23bnl1+cxTAchjTl4Cd/yzclRF+f4Oj/et0RausQ5Oadm19mXLwg
	 BLQELCVbt4AztqKG1kIDz6Bho14907cqL2oynonqpIr8CEPzPvUqcoXXNw0tRXK2kZ
	 B11s2jXLqUowVR8nlVw1Gjb1kB+QyAmC//kgi7XVs6qrKBgV5041cobEvPE1Lcno4t
	 jqsMu5edutyGGdux6+UrEsMtxmpdBNCNZrdk8kNkz9CJ0vjJcnow0U8B5LkRpIixkX
	 zzsrod/0VLmFRXTNk183p/Umtn+c743dVF1MZu+ug045MuLxptHuyFrrkrgJo+BS65
	 DXTthzlvmNv/Q==
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
Subject: [PATCH v2 03/35] crypto: arm/aes-neonbs - Use AES library for single blocks
Date: Mon, 12 Jan 2026 11:20:01 -0800
Message-ID: <20260112192035.10427-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_112320_834675_AB19624D 
X-CRM114-Status: GOOD (  16.04  )
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

aes-neonbs-glue.c calls __aes_arm_encrypt() and __aes_arm_decrypt() to
en/decrypt single blocks for CBC encryption, XTS tweak encryption, and
XTS ciphertext stealing.  In preparation for making the AES library use
this same ARM-optimized single-block AES en/decryption code and making
it an internal implementation detail of the AES library, replace the
calls to these functions with calls to the AES library.

Note that this reduces the size of the aesbs_cbc_ctx and aesbs_xts_ctx
structs, since unnecessary decryption round keys are no longer included.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/Kconfig           |  1 -
 arch/arm/crypto/aes-neonbs-glue.c | 29 ++++++++++++++++-------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 3eb5071bea14..167a648a9def 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -42,11 +42,10 @@ config CRYPTO_AES_ARM
 	  such attacks very difficult.
 
 config CRYPTO_AES_ARM_BS
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (bit-sliced NEON)"
 	depends on KERNEL_MODE_NEON
-	select CRYPTO_AES_ARM
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
diff --git a/arch/arm/crypto/aes-neonbs-glue.c b/arch/arm/crypto/aes-neonbs-glue.c
index df5afe601e4a..c49ddafc54f3 100644
--- a/arch/arm/crypto/aes-neonbs-glue.c
+++ b/arch/arm/crypto/aes-neonbs-glue.c
@@ -10,11 +10,10 @@
 #include <crypto/aes.h>
 #include <crypto/internal/skcipher.h>
 #include <crypto/scatterwalk.h>
 #include <crypto/xts.h>
 #include <linux/module.h>
-#include "aes-cipher.h"
 
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_DESCRIPTION("Bit sliced AES using NEON instructions");
 MODULE_LICENSE("GPL v2");
 
@@ -46,17 +45,17 @@ struct aesbs_ctx {
 	u8	rk[13 * (8 * AES_BLOCK_SIZE) + 32] __aligned(AES_BLOCK_SIZE);
 };
 
 struct aesbs_cbc_ctx {
 	struct aesbs_ctx	key;
-	struct crypto_aes_ctx	fallback;
+	struct aes_enckey	fallback;
 };
 
 struct aesbs_xts_ctx {
 	struct aesbs_ctx	key;
-	struct crypto_aes_ctx	fallback;
-	struct crypto_aes_ctx	tweak_key;
+	struct aes_key		fallback;
+	struct aes_enckey	tweak_key;
 };
 
 static int aesbs_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			unsigned int key_len)
 {
@@ -120,18 +119,23 @@ static int aesbs_cbc_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			    unsigned int key_len)
 {
 	struct aesbs_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
 	int err;
 
-	err = aes_expandkey(&ctx->fallback, in_key, key_len);
+	err = aes_prepareenckey(&ctx->fallback, in_key, key_len);
 	if (err)
 		return err;
 
 	ctx->key.rounds = 6 + key_len / 4;
 
+	/*
+	 * Note: this assumes that the arm implementation of the AES library
+	 * stores the standard round keys in k.rndkeys.
+	 */
 	kernel_neon_begin();
-	aesbs_convert_key(ctx->key.rk, ctx->fallback.key_enc, ctx->key.rounds);
+	aesbs_convert_key(ctx->key.rk, ctx->fallback.k.rndkeys,
+			  ctx->key.rounds);
 	kernel_neon_end();
 
 	return 0;
 }
 
@@ -150,12 +154,11 @@ static int cbc_encrypt(struct skcipher_request *req)
 		u8 *dst = walk.dst.virt.addr;
 		u8 *prev = walk.iv;
 
 		do {
 			crypto_xor_cpy(dst, src, prev, AES_BLOCK_SIZE);
-			__aes_arm_encrypt(ctx->fallback.key_enc,
-					  ctx->key.rounds, dst, dst);
+			aes_encrypt(&ctx->fallback, dst, dst);
 			prev = dst;
 			src += AES_BLOCK_SIZE;
 			dst += AES_BLOCK_SIZE;
 			nbytes -= AES_BLOCK_SIZE;
 		} while (nbytes >= AES_BLOCK_SIZE);
@@ -237,14 +240,14 @@ static int aesbs_xts_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 	err = xts_verify_key(tfm, in_key, key_len);
 	if (err)
 		return err;
 
 	key_len /= 2;
-	err = aes_expandkey(&ctx->fallback, in_key, key_len);
+	err = aes_preparekey(&ctx->fallback, in_key, key_len);
 	if (err)
 		return err;
-	err = aes_expandkey(&ctx->tweak_key, in_key + key_len, key_len);
+	err = aes_prepareenckey(&ctx->tweak_key, in_key + key_len, key_len);
 	if (err)
 		return err;
 
 	return aesbs_setkey(tfm, in_key, key_len);
 }
@@ -277,11 +280,11 @@ static int __xts_crypt(struct skcipher_request *req, bool encrypt,
 
 	err = skcipher_walk_virt(&walk, req, true);
 	if (err)
 		return err;
 
-	__aes_arm_encrypt(ctx->tweak_key.key_enc, rounds, walk.iv, walk.iv);
+	aes_encrypt(&ctx->tweak_key, walk.iv, walk.iv);
 
 	while (walk.nbytes >= AES_BLOCK_SIZE) {
 		unsigned int blocks = walk.nbytes / AES_BLOCK_SIZE;
 		int reorder_last_tweak = !encrypt && tail > 0;
 
@@ -309,13 +312,13 @@ static int __xts_crypt(struct skcipher_request *req, bool encrypt,
 	scatterwalk_map_and_copy(buf, req->src, req->cryptlen, tail, 0);
 
 	crypto_xor(buf, req->iv, AES_BLOCK_SIZE);
 
 	if (encrypt)
-		__aes_arm_encrypt(ctx->fallback.key_enc, rounds, buf, buf);
+		aes_encrypt(&ctx->fallback, buf, buf);
 	else
-		__aes_arm_decrypt(ctx->fallback.key_dec, rounds, buf, buf);
+		aes_decrypt(&ctx->fallback, buf, buf);
 
 	crypto_xor(buf, req->iv, AES_BLOCK_SIZE);
 
 	scatterwalk_map_and_copy(buf, req->dst, req->cryptlen - AES_BLOCK_SIZE,
 				 AES_BLOCK_SIZE + tail, 1);
-- 
2.52.0


