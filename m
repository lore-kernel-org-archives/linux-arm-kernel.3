Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A01C2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hd3XBg5FT5ThbzYc/S/Y43XcCmv4iVi72TJsXVdDz+8=; b=cP8eDUkYq3IeVl7wzKG8OP72C1
	YFzdxRDbma6RtqsB0SEWYNtKDcCb5CoYL5RQg1CMYIrR3V+rlYeQ6v28M8GkQt1bEFM4akFy5NxMG
	FLg1JVvl6GnH+1RxXJs91jiHkkDGQAvtYZVJAS+Gh4CC4bHI9Cs2hwfjE7vfO34BHvkXhRVn/uraD
	4jEEhN79BjF8xluL+PN/iQTUghIhT9liscjO2lpeyodcJOk8vP2ho3xKyVbcDpPP2n8zuza0Ig7dV
	VvzbS6LFpePjrXS8D9nST7pLBOLu6LCCCHrvMbH5WKRbAOH/9I0KiYFuvldEfmf3LEAM+jbnppLZ7
	QSzpdM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccyT-0000000An6g-491h;
	Mon, 05 Jan 2026 05:17:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvy-0000000AjSz-0gzu;
	Mon, 05 Jan 2026 05:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5711560126;
	Mon,  5 Jan 2026 05:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B139C2BC86;
	Mon,  5 Jan 2026 05:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590113;
	bh=ZEZ/lY7ZIO891sPEBRd1dtmoAwyoQ6T6NHQ246zb3/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=apeAvzoFhCmf28cauH2AK1P6lYgUC26vcBsw43BItwp24FqiMj05XhvRtwpsz/QN/
	 b72Lju9LymvdFnhX7WykF3DvmMLydGXaxY5YTX7FLVoSaGvrAxQyEIC9p9lETETlnY
	 X0AeM7Qtv39qrQzjYAqmt2szo0QoZ4zymLYQje68HgXloV75XsfDnZiC7lRzOwjSST
	 xBRMsKgeTX5BzVfUKnd+8/Ec3jZ0RXnX8Khcbm4RlYYAFkf0qhnv81sZbfsuLGS2rh
	 dmb1lXlxyH1lWkoX5IitelaskMSoZm1RIUAWSg+A2NUS2uDzFqL4Cv00hUQm9s7rAl
	 FjMPUvYxijPzA==
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
Subject: [PATCH 34/36] lib/crypto: aes: Remove old AES en/decryption functions
Date: Sun,  4 Jan 2026 21:13:07 -0800
Message-ID: <20260105051311.1607207-35-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
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

Now that no callers of the original aes_encrypt() and aes_decrypt()
remain, remove them.  This frees up their names for aes_encrypt_new()
and aes_decrypt_new() to be renamed to.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/aes.h |  16 ------
 lib/crypto/aes.c     | 118 -------------------------------------------
 2 files changed, 134 deletions(-)

diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 18a5f518e914..4ce710209da8 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -293,26 +293,10 @@ int aes_preparekey(struct aes_key *key, const u8 *in_key, size_t key_len);
  * Context: Any context.
  */
 int aes_prepareenckey(struct aes_enckey *enc_key,
 		      const u8 *in_key, size_t key_len);
 
-/**
- * aes_encrypt - Encrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the ciphertext
- * @in:		Buffer containing the plaintext
- */
-void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
-
-/**
- * aes_decrypt - Decrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the plaintext
- * @in:		Buffer containing the ciphertext
- */
-void aes_decrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
-
 typedef union {
 	const struct aes_enckey *enc_key;
 	const struct aes_key *full_key;
 } aes_encrypt_arg __attribute__ ((__transparent_union__));
 
diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index 57b6d68fd378..f8c67206b850 100644
--- a/lib/crypto/aes.c
+++ b/lib/crypto/aes.c
@@ -249,26 +249,10 @@ static u32 inv_mix_columns(u32 x)
 	u32 y = mul_by_x2(x);
 
 	return mix_columns(x ^ y ^ ror32(y, 16));
 }
 
-static __always_inline u32 subshift(u32 in[], int pos)
-{
-	return (aes_sbox[in[pos] & 0xff]) ^
-	       (aes_sbox[(in[(pos + 1) % 4] >>  8) & 0xff] <<  8) ^
-	       (aes_sbox[(in[(pos + 2) % 4] >> 16) & 0xff] << 16) ^
-	       (aes_sbox[(in[(pos + 3) % 4] >> 24) & 0xff] << 24);
-}
-
-static __always_inline u32 inv_subshift(u32 in[], int pos)
-{
-	return (aes_inv_sbox[in[pos] & 0xff]) ^
-	       (aes_inv_sbox[(in[(pos + 3) % 4] >>  8) & 0xff] <<  8) ^
-	       (aes_inv_sbox[(in[(pos + 2) % 4] >> 16) & 0xff] << 16) ^
-	       (aes_inv_sbox[(in[(pos + 1) % 4] >> 24) & 0xff] << 24);
-}
-
 static u32 subw(u32 in)
 {
 	return (aes_sbox[in & 0xff]) ^
 	       (aes_sbox[(in >>  8) & 0xff] <<  8) ^
 	       (aes_sbox[(in >> 16) & 0xff] << 16) ^
@@ -343,61 +327,10 @@ int aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
 	aes_expandkey_generic(ctx->key_enc, ctx->key_dec, in_key, key_len);
 	return 0;
 }
 EXPORT_SYMBOL(aes_expandkey);
 
-/**
- * aes_encrypt - Encrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the ciphertext
- * @in:		Buffer containing the plaintext
- */
-void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in)
-{
-	const u32 *rkp = ctx->key_enc + 4;
-	int rounds = 6 + ctx->key_length / 4;
-	u32 st0[4], st1[4];
-	int round;
-
-	st0[0] = ctx->key_enc[0] ^ get_unaligned_le32(in);
-	st0[1] = ctx->key_enc[1] ^ get_unaligned_le32(in + 4);
-	st0[2] = ctx->key_enc[2] ^ get_unaligned_le32(in + 8);
-	st0[3] = ctx->key_enc[3] ^ get_unaligned_le32(in + 12);
-
-	/*
-	 * Force the compiler to emit data independent Sbox references,
-	 * by xoring the input with Sbox values that are known to add up
-	 * to zero. This pulls the entire Sbox into the D-cache before any
-	 * data dependent lookups are done.
-	 */
-	st0[0] ^= aes_sbox[ 0] ^ aes_sbox[ 64] ^ aes_sbox[134] ^ aes_sbox[195];
-	st0[1] ^= aes_sbox[16] ^ aes_sbox[ 82] ^ aes_sbox[158] ^ aes_sbox[221];
-	st0[2] ^= aes_sbox[32] ^ aes_sbox[ 96] ^ aes_sbox[160] ^ aes_sbox[234];
-	st0[3] ^= aes_sbox[48] ^ aes_sbox[112] ^ aes_sbox[186] ^ aes_sbox[241];
-
-	for (round = 0;; round += 2, rkp += 8) {
-		st1[0] = mix_columns(subshift(st0, 0)) ^ rkp[0];
-		st1[1] = mix_columns(subshift(st0, 1)) ^ rkp[1];
-		st1[2] = mix_columns(subshift(st0, 2)) ^ rkp[2];
-		st1[3] = mix_columns(subshift(st0, 3)) ^ rkp[3];
-
-		if (round == rounds - 2)
-			break;
-
-		st0[0] = mix_columns(subshift(st1, 0)) ^ rkp[4];
-		st0[1] = mix_columns(subshift(st1, 1)) ^ rkp[5];
-		st0[2] = mix_columns(subshift(st1, 2)) ^ rkp[6];
-		st0[3] = mix_columns(subshift(st1, 3)) ^ rkp[7];
-	}
-
-	put_unaligned_le32(subshift(st1, 0) ^ rkp[4], out);
-	put_unaligned_le32(subshift(st1, 1) ^ rkp[5], out + 4);
-	put_unaligned_le32(subshift(st1, 2) ^ rkp[6], out + 8);
-	put_unaligned_le32(subshift(st1, 3) ^ rkp[7], out + 12);
-}
-EXPORT_SYMBOL(aes_encrypt);
-
 static __always_inline u32 enc_quarterround(const u32 w[4], int i, u32 rk)
 {
 	return rk ^ aes_enc_tab[(u8)w[i]] ^
 	       rol32(aes_enc_tab[(u8)(w[(i + 1) % 4] >> 8)], 8) ^
 	       rol32(aes_enc_tab[(u8)(w[(i + 2) % 4] >> 16)], 16) ^
@@ -502,61 +435,10 @@ static void __maybe_unused aes_decrypt_generic(const u32 inv_rndkeys[],
 	put_unaligned_le32(declast_quarterround(w, 1, *rkp++), &out[4]);
 	put_unaligned_le32(declast_quarterround(w, 2, *rkp++), &out[8]);
 	put_unaligned_le32(declast_quarterround(w, 3, *rkp++), &out[12]);
 }
 
-/**
- * aes_decrypt - Decrypt a single AES block
- * @ctx:	Context struct containing the key schedule
- * @out:	Buffer to store the plaintext
- * @in:		Buffer containing the ciphertext
- */
-void aes_decrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in)
-{
-	const u32 *rkp = ctx->key_dec + 4;
-	int rounds = 6 + ctx->key_length / 4;
-	u32 st0[4], st1[4];
-	int round;
-
-	st0[0] = ctx->key_dec[0] ^ get_unaligned_le32(in);
-	st0[1] = ctx->key_dec[1] ^ get_unaligned_le32(in + 4);
-	st0[2] = ctx->key_dec[2] ^ get_unaligned_le32(in + 8);
-	st0[3] = ctx->key_dec[3] ^ get_unaligned_le32(in + 12);
-
-	/*
-	 * Force the compiler to emit data independent Sbox references,
-	 * by xoring the input with Sbox values that are known to add up
-	 * to zero. This pulls the entire Sbox into the D-cache before any
-	 * data dependent lookups are done.
-	 */
-	st0[0] ^= aes_inv_sbox[ 0] ^ aes_inv_sbox[ 64] ^ aes_inv_sbox[129] ^ aes_inv_sbox[200];
-	st0[1] ^= aes_inv_sbox[16] ^ aes_inv_sbox[ 83] ^ aes_inv_sbox[150] ^ aes_inv_sbox[212];
-	st0[2] ^= aes_inv_sbox[32] ^ aes_inv_sbox[ 96] ^ aes_inv_sbox[160] ^ aes_inv_sbox[236];
-	st0[3] ^= aes_inv_sbox[48] ^ aes_inv_sbox[112] ^ aes_inv_sbox[187] ^ aes_inv_sbox[247];
-
-	for (round = 0;; round += 2, rkp += 8) {
-		st1[0] = inv_mix_columns(inv_subshift(st0, 0)) ^ rkp[0];
-		st1[1] = inv_mix_columns(inv_subshift(st0, 1)) ^ rkp[1];
-		st1[2] = inv_mix_columns(inv_subshift(st0, 2)) ^ rkp[2];
-		st1[3] = inv_mix_columns(inv_subshift(st0, 3)) ^ rkp[3];
-
-		if (round == rounds - 2)
-			break;
-
-		st0[0] = inv_mix_columns(inv_subshift(st1, 0)) ^ rkp[4];
-		st0[1] = inv_mix_columns(inv_subshift(st1, 1)) ^ rkp[5];
-		st0[2] = inv_mix_columns(inv_subshift(st1, 2)) ^ rkp[6];
-		st0[3] = inv_mix_columns(inv_subshift(st1, 3)) ^ rkp[7];
-	}
-
-	put_unaligned_le32(inv_subshift(st1, 0) ^ rkp[4], out);
-	put_unaligned_le32(inv_subshift(st1, 1) ^ rkp[5], out + 4);
-	put_unaligned_le32(inv_subshift(st1, 2) ^ rkp[6], out + 8);
-	put_unaligned_le32(inv_subshift(st1, 3) ^ rkp[7], out + 12);
-}
-EXPORT_SYMBOL(aes_decrypt);
-
 /*
  * Note: the aes_prepare*key_* names reflect the fact that the implementation
  * might not actually expand the key.  (The s390 code for example doesn't.)
  * Where the key is expanded we use the more specific names aes_expandkey_*.
  *
-- 
2.52.0


