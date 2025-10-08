Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEF5CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L46HkLw8a5J3i9kWdBIi5leMJXM6J86JLgXVE8xjgwQ=; b=Qypg+B+xb5IT/0DUjGfpwfbjo7
	EP4WxtYtgccU7YPhjG2hwHu1qlT6z6Mm1q/6okpbkJg7ksg3AGeooagMCEvxM8B+48akatlFpQt1s
	3SlBFzit4LTwQ+kQbV6D0vkQnogrbrrMEPmZl4Hxi8aheeTRr4NVMSvqp1x+fdSQTsCxV42qK/lX+
	+p6e/SHSLmM5ENQ3Wyqn/GPbKgGP1eOJH4KHsARaVuZ/YhmO7wrnnHzF5rDCvWdwvxEY/88ZkPDSB
	vfhjAy1Sd16d1ubK8xSbZZfK33YGIkdknsaA7e0W3/mhFuRk50E5JtpTNbzMQIVwZy8Ui067wCfYK
	uAmFwDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNd-00000004BXD-0eJF;
	Wed, 08 Oct 2025 15:47:05 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNX-00000004BMd-3TSb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:47:01 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e41c32209so69665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938417; x=1760543217; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L46HkLw8a5J3i9kWdBIi5leMJXM6J86JLgXVE8xjgwQ=;
        b=PHTHdU3OU1HxdLqG+mKXcueqSkrPpZQsYdbV9h+epR5JhOleFOo6e1ACiMs5F4+BXS
         zMEMVj1Qiq3xeICCBD1PDvsb6HLCE8ugN/EXzG1aHPguZIaPwXRRKox3sybfaMRSiCQ+
         Sld0RIVv5QBkaaBu49xE1+18Si4/ltaE0OKXPY+dv6MA4GiyTGEZQEgMHzQwB5SDeJBb
         9Mq6QAUpsw7/Ga2jqIeqSDnSQWrwT1nTOrO5vWkTQr2T+C07s4+7CzINpE1x+OKe6+6e
         ZLN+bYprLldzCKWNKN2tT8SsoTv6QSSIyCvxmKKrHPOQ+MGMvNScZWioTe1F8HNaLDQq
         2Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938417; x=1760543217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L46HkLw8a5J3i9kWdBIi5leMJXM6J86JLgXVE8xjgwQ=;
        b=LAyQ+xheoNxlzIybV3VOQvcF4nU5ifvxIO/O1FnVqOF6le8TnAaca8IzXYn60iHo+M
         4JGmQao7RvP/QW/Wvm8jt9dBM1sZ2dsLreLQbAHbbEW1t8sdbqUBUZFYOyL1DUiG6GB0
         p7YgKW1ANFlEnVQWLraxgH2YsQOXxVA4Ftp1dql8dmEFntwHJVKxxIHKlU9PIaQKTOkm
         wHN3SWqJdKK3aNz5xK3Voo9/fzHZ0pKo90pNgiu3kIpl7hmkm2MJkx0ny+LOnwaYp0ow
         2TaHd8UYb91jE5YFjrrt2JDAN/Jxr4mOVw25xMcvqpS27K1UsfGVhyxj5RKRirhs/yiW
         Fypw==
X-Gm-Message-State: AOJu0Yxq4eSVySOGMafp0+d5joNAXcnarr8Dx355ycaXgaK+I5e3Poek
	iZ54L6lKXo7MOTMeQhjf0p9q3Oc1EOY23unRAo2OPgm6KZG5WH5V5q5TlUN9Kh9T8YKhZcDM98t
	yKycwcno1NHXjYP8PCHkAUMLZ58++WrL7TOBHU0/jADbggXtIKK/d8lb/RTLrDws7ejXAfQ1Ea1
	ucUGTVNBN3FAa+Jd+EHDIjgb9R467brAG/n5bX3qMee4bX
X-Google-Smtp-Source: AGHT+IG2yDjvx8M5RHQJcFuja3CFrUxqijB7b3AYImn0xKywLHMP4fir5zv+TsiSTqzGBKF0TNrX6Pht
X-Received: from wmbes23.prod.google.com ([2002:a05:600c:8117:b0:46f:aa50:d70b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5488:b0:46e:45f7:34fc
 with SMTP id 5b1f17b1804b1-46fa9b105ffmr28052175e9.29.1759938417442; Wed, 08
 Oct 2025 08:46:57 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:45 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=20750; i=ardb@kernel.org;
 h=from:subject; bh=hUfqbOTmnijDWPqp3qx6DVKxfJBhdKIamRCPmoGE/Iw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu11J+LVp7s17N7IebdU9kLv6zPrZrfMU3yfZlPWbx
 Advt9DpKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPJ/8HIsOw+59K06G9xh+d0
 z3t/+dkaA72b+8N+rPZzXuC+dpdD6RZGhnuHH3SyJPmv/JS/MnFd3is3mYjQk0lTUhdeEzyi9ep FFyMA
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-34-ardb+git@google.com>
Subject: [PATCH v3 11/21] crypto/arm64: aes-blk - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084700_103720_47300899 
X-CRM114-Status: GOOD (  18.77  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Switch to the more abstract 'scoped_ksimd()' API, which will be modified
in a future patch to transparently allocate a kernel mode FP/SIMD state
buffer on the stack, so that kernel mode FP/SIMD code remains
preemptible in principe, but without the memory overhead that adds 528
bytes to the size of struct task_struct.

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/crypto/aes-ce-glue.c     |  87 ++++++------
 arch/arm64/crypto/aes-glue.c        | 139 ++++++++----------
 arch/arm64/crypto/aes-neonbs-glue.c | 150 ++++++++++----------
 3 files changed, 181 insertions(+), 195 deletions(-)

diff --git a/arch/arm64/crypto/aes-ce-glue.c b/arch/arm64/crypto/aes-ce-glue.c
index 00b8749013c5..a4dad370991d 100644
--- a/arch/arm64/crypto/aes-ce-glue.c
+++ b/arch/arm64/crypto/aes-ce-glue.c
@@ -52,9 +52,8 @@ static void aes_cipher_encrypt(struct crypto_tfm *tfm, u8 dst[], u8 const src[])
 		return;
 	}
 
-	kernel_neon_begin();
-	__aes_ce_encrypt(ctx->key_enc, dst, src, num_rounds(ctx));
-	kernel_neon_end();
+	scoped_ksimd()
+		__aes_ce_encrypt(ctx->key_enc, dst, src, num_rounds(ctx));
 }
 
 static void aes_cipher_decrypt(struct crypto_tfm *tfm, u8 dst[], u8 const src[])
@@ -66,9 +65,8 @@ static void aes_cipher_decrypt(struct crypto_tfm *tfm, u8 dst[], u8 const src[])
 		return;
 	}
 
-	kernel_neon_begin();
-	__aes_ce_decrypt(ctx->key_dec, dst, src, num_rounds(ctx));
-	kernel_neon_end();
+	scoped_ksimd()
+		__aes_ce_decrypt(ctx->key_dec, dst, src, num_rounds(ctx));
 }
 
 int ce_aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
@@ -94,47 +92,48 @@ int ce_aes_expandkey(struct crypto_aes_ctx *ctx, const u8 *in_key,
 	for (i = 0; i < kwords; i++)
 		ctx->key_enc[i] = get_unaligned_le32(in_key + i * sizeof(u32));
 
-	kernel_neon_begin();
-	for (i = 0; i < sizeof(rcon); i++) {
-		u32 *rki = ctx->key_enc + (i * kwords);
-		u32 *rko = rki + kwords;
-
-		rko[0] = ror32(__aes_ce_sub(rki[kwords - 1]), 8) ^ rcon[i] ^ rki[0];
-		rko[1] = rko[0] ^ rki[1];
-		rko[2] = rko[1] ^ rki[2];
-		rko[3] = rko[2] ^ rki[3];
-
-		if (key_len == AES_KEYSIZE_192) {
-			if (i >= 7)
-				break;
-			rko[4] = rko[3] ^ rki[4];
-			rko[5] = rko[4] ^ rki[5];
-		} else if (key_len == AES_KEYSIZE_256) {
-			if (i >= 6)
-				break;
-			rko[4] = __aes_ce_sub(rko[3]) ^ rki[4];
-			rko[5] = rko[4] ^ rki[5];
-			rko[6] = rko[5] ^ rki[6];
-			rko[7] = rko[6] ^ rki[7];
+	scoped_ksimd() {
+		for (i = 0; i < sizeof(rcon); i++) {
+			u32 *rki = ctx->key_enc + (i * kwords);
+			u32 *rko = rki + kwords;
+
+			rko[0] = ror32(__aes_ce_sub(rki[kwords - 1]), 8) ^
+				 rcon[i] ^ rki[0];
+			rko[1] = rko[0] ^ rki[1];
+			rko[2] = rko[1] ^ rki[2];
+			rko[3] = rko[2] ^ rki[3];
+
+			if (key_len == AES_KEYSIZE_192) {
+				if (i >= 7)
+					break;
+				rko[4] = rko[3] ^ rki[4];
+				rko[5] = rko[4] ^ rki[5];
+			} else if (key_len == AES_KEYSIZE_256) {
+				if (i >= 6)
+					break;
+				rko[4] = __aes_ce_sub(rko[3]) ^ rki[4];
+				rko[5] = rko[4] ^ rki[5];
+				rko[6] = rko[5] ^ rki[6];
+				rko[7] = rko[6] ^ rki[7];
+			}
 		}
-	}
 
-	/*
-	 * Generate the decryption keys for the Equivalent Inverse Cipher.
-	 * This involves reversing the order of the round keys, and applying
-	 * the Inverse Mix Columns transformation on all but the first and
-	 * the last one.
-	 */
-	key_enc = (struct aes_block *)ctx->key_enc;
-	key_dec = (struct aes_block *)ctx->key_dec;
-	j = num_rounds(ctx);
-
-	key_dec[0] = key_enc[j];
-	for (i = 1, j--; j > 0; i++, j--)
-		__aes_ce_invert(key_dec + i, key_enc + j);
-	key_dec[i] = key_enc[0];
+		/*
+		 * Generate the decryption keys for the Equivalent Inverse
+		 * Cipher.  This involves reversing the order of the round
+		 * keys, and applying the Inverse Mix Columns transformation on
+		 * all but the first and the last one.
+		 */
+		key_enc = (struct aes_block *)ctx->key_enc;
+		key_dec = (struct aes_block *)ctx->key_dec;
+		j = num_rounds(ctx);
+
+		key_dec[0] = key_enc[j];
+		for (i = 1, j--; j > 0; i++, j--)
+			__aes_ce_invert(key_dec + i, key_enc + j);
+		key_dec[i] = key_enc[0];
+	}
 
-	kernel_neon_end();
 	return 0;
 }
 EXPORT_SYMBOL(ce_aes_expandkey);
diff --git a/arch/arm64/crypto/aes-glue.c b/arch/arm64/crypto/aes-glue.c
index 5e207ff34482..b087b900d279 100644
--- a/arch/arm64/crypto/aes-glue.c
+++ b/arch/arm64/crypto/aes-glue.c
@@ -5,8 +5,6 @@
  * Copyright (C) 2013 - 2017 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
 
-#include <asm/hwcap.h>
-#include <asm/neon.h>
 #include <crypto/aes.h>
 #include <crypto/ctr.h>
 #include <crypto/internal/hash.h>
@@ -20,6 +18,9 @@
 #include <linux/module.h>
 #include <linux/string.h>
 
+#include <asm/hwcap.h>
+#include <asm/simd.h>
+
 #include "aes-ce-setkey.h"
 
 #ifdef USE_V8_CRYPTO_EXTENSIONS
@@ -186,10 +187,9 @@ static int __maybe_unused ecb_encrypt(struct skcipher_request *req)
 	err = skcipher_walk_virt(&walk, req, false);
 
 	while ((blocks = (walk.nbytes / AES_BLOCK_SIZE))) {
-		kernel_neon_begin();
-		aes_ecb_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key_enc, rounds, blocks);
-		kernel_neon_end();
+		scoped_ksimd()
+			aes_ecb_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
+					ctx->key_enc, rounds, blocks);
 		err = skcipher_walk_done(&walk, walk.nbytes % AES_BLOCK_SIZE);
 	}
 	return err;
@@ -206,10 +206,9 @@ static int __maybe_unused ecb_decrypt(struct skcipher_request *req)
 	err = skcipher_walk_virt(&walk, req, false);
 
 	while ((blocks = (walk.nbytes / AES_BLOCK_SIZE))) {
-		kernel_neon_begin();
-		aes_ecb_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key_dec, rounds, blocks);
-		kernel_neon_end();
+		scoped_ksimd()
+			aes_ecb_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
+					ctx->key_dec, rounds, blocks);
 		err = skcipher_walk_done(&walk, walk.nbytes % AES_BLOCK_SIZE);
 	}
 	return err;
@@ -224,10 +223,9 @@ static int cbc_encrypt_walk(struct skcipher_request *req,
 	unsigned int blocks;
 
 	while ((blocks = (walk->nbytes / AES_BLOCK_SIZE))) {
-		kernel_neon_begin();
-		aes_cbc_encrypt(walk->dst.virt.addr, walk->src.virt.addr,
-				ctx->key_enc, rounds, blocks, walk->iv);
-		kernel_neon_end();
+		scoped_ksimd()
+			aes_cbc_encrypt(walk->dst.virt.addr, walk->src.virt.addr,
+					ctx->key_enc, rounds, blocks, walk->iv);
 		err = skcipher_walk_done(walk, walk->nbytes % AES_BLOCK_SIZE);
 	}
 	return err;
@@ -253,10 +251,9 @@ static int cbc_decrypt_walk(struct skcipher_request *req,
 	unsigned int blocks;
 
 	while ((blocks = (walk->nbytes / AES_BLOCK_SIZE))) {
-		kernel_neon_begin();
-		aes_cbc_decrypt(walk->dst.virt.addr, walk->src.virt.addr,
-				ctx->key_dec, rounds, blocks, walk->iv);
-		kernel_neon_end();
+		scoped_ksimd()
+			aes_cbc_decrypt(walk->dst.virt.addr, walk->src.virt.addr,
+					ctx->key_dec, rounds, blocks, walk->iv);
 		err = skcipher_walk_done(walk, walk->nbytes % AES_BLOCK_SIZE);
 	}
 	return err;
@@ -322,10 +319,9 @@ static int cts_cbc_encrypt(struct skcipher_request *req)
 	if (err)
 		return err;
 
-	kernel_neon_begin();
-	aes_cbc_cts_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
-			    ctx->key_enc, rounds, walk.nbytes, walk.iv);
-	kernel_neon_end();
+	scoped_ksimd()
+		aes_cbc_cts_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
+				    ctx->key_enc, rounds, walk.nbytes, walk.iv);
 
 	return skcipher_walk_done(&walk, 0);
 }
@@ -379,10 +375,9 @@ static int cts_cbc_decrypt(struct skcipher_request *req)
 	if (err)
 		return err;
 
-	kernel_neon_begin();
-	aes_cbc_cts_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
-			    ctx->key_dec, rounds, walk.nbytes, walk.iv);
-	kernel_neon_end();
+	scoped_ksimd()
+		aes_cbc_cts_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
+				    ctx->key_dec, rounds, walk.nbytes, walk.iv);
 
 	return skcipher_walk_done(&walk, 0);
 }
@@ -399,11 +394,11 @@ static int __maybe_unused essiv_cbc_encrypt(struct skcipher_request *req)
 
 	blocks = walk.nbytes / AES_BLOCK_SIZE;
 	if (blocks) {
-		kernel_neon_begin();
-		aes_essiv_cbc_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
-				      ctx->key1.key_enc, rounds, blocks,
-				      req->iv, ctx->key2.key_enc);
-		kernel_neon_end();
+		scoped_ksimd()
+			aes_essiv_cbc_encrypt(walk.dst.virt.addr,
+					      walk.src.virt.addr,
+					      ctx->key1.key_enc, rounds, blocks,
+					      req->iv, ctx->key2.key_enc);
 		err = skcipher_walk_done(&walk, walk.nbytes % AES_BLOCK_SIZE);
 	}
 	return err ?: cbc_encrypt_walk(req, &walk);
@@ -421,11 +416,11 @@ static int __maybe_unused essiv_cbc_decrypt(struct skcipher_request *req)
 
 	blocks = walk.nbytes / AES_BLOCK_SIZE;
 	if (blocks) {
-		kernel_neon_begin();
-		aes_essiv_cbc_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
-				      ctx->key1.key_dec, rounds, blocks,
-				      req->iv, ctx->key2.key_enc);
-		kernel_neon_end();
+		scoped_ksimd()
+			aes_essiv_cbc_decrypt(walk.dst.virt.addr,
+					      walk.src.virt.addr,
+					      ctx->key1.key_dec, rounds, blocks,
+					      req->iv, ctx->key2.key_enc);
 		err = skcipher_walk_done(&walk, walk.nbytes % AES_BLOCK_SIZE);
 	}
 	return err ?: cbc_decrypt_walk(req, &walk);
@@ -461,10 +456,9 @@ static int __maybe_unused xctr_encrypt(struct skcipher_request *req)
 		else if (nbytes < walk.total)
 			nbytes &= ~(AES_BLOCK_SIZE - 1);
 
-		kernel_neon_begin();
-		aes_xctr_encrypt(dst, src, ctx->key_enc, rounds, nbytes,
-						 walk.iv, byte_ctr);
-		kernel_neon_end();
+		scoped_ksimd()
+			aes_xctr_encrypt(dst, src, ctx->key_enc, rounds, nbytes,
+							 walk.iv, byte_ctr);
 
 		if (unlikely(nbytes < AES_BLOCK_SIZE))
 			memcpy(walk.dst.virt.addr,
@@ -506,10 +500,9 @@ static int __maybe_unused ctr_encrypt(struct skcipher_request *req)
 		else if (nbytes < walk.total)
 			nbytes &= ~(AES_BLOCK_SIZE - 1);
 
-		kernel_neon_begin();
-		aes_ctr_encrypt(dst, src, ctx->key_enc, rounds, nbytes,
-				walk.iv);
-		kernel_neon_end();
+		scoped_ksimd()
+			aes_ctr_encrypt(dst, src, ctx->key_enc, rounds, nbytes,
+					walk.iv);
 
 		if (unlikely(nbytes < AES_BLOCK_SIZE))
 			memcpy(walk.dst.virt.addr,
@@ -562,11 +555,10 @@ static int __maybe_unused xts_encrypt(struct skcipher_request *req)
 		if (walk.nbytes < walk.total)
 			nbytes &= ~(AES_BLOCK_SIZE - 1);
 
-		kernel_neon_begin();
-		aes_xts_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key1.key_enc, rounds, nbytes,
-				ctx->key2.key_enc, walk.iv, first);
-		kernel_neon_end();
+		scoped_ksimd()
+			aes_xts_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
+					ctx->key1.key_enc, rounds, nbytes,
+					ctx->key2.key_enc, walk.iv, first);
 		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
 	}
 
@@ -584,11 +576,10 @@ static int __maybe_unused xts_encrypt(struct skcipher_request *req)
 	if (err)
 		return err;
 
-	kernel_neon_begin();
-	aes_xts_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
-			ctx->key1.key_enc, rounds, walk.nbytes,
-			ctx->key2.key_enc, walk.iv, first);
-	kernel_neon_end();
+	scoped_ksimd()
+		aes_xts_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
+				ctx->key1.key_enc, rounds, walk.nbytes,
+				ctx->key2.key_enc, walk.iv, first);
 
 	return skcipher_walk_done(&walk, 0);
 }
@@ -634,11 +625,10 @@ static int __maybe_unused xts_decrypt(struct skcipher_request *req)
 		if (walk.nbytes < walk.total)
 			nbytes &= ~(AES_BLOCK_SIZE - 1);
 
-		kernel_neon_begin();
-		aes_xts_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
-				ctx->key1.key_dec, rounds, nbytes,
-				ctx->key2.key_enc, walk.iv, first);
-		kernel_neon_end();
+		scoped_ksimd()
+			aes_xts_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
+					ctx->key1.key_dec, rounds, nbytes,
+					ctx->key2.key_enc, walk.iv, first);
 		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
 	}
 
@@ -657,11 +647,10 @@ static int __maybe_unused xts_decrypt(struct skcipher_request *req)
 		return err;
 
 
-	kernel_neon_begin();
-	aes_xts_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
-			ctx->key1.key_dec, rounds, walk.nbytes,
-			ctx->key2.key_enc, walk.iv, first);
-	kernel_neon_end();
+	scoped_ksimd()
+		aes_xts_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
+				ctx->key1.key_dec, rounds, walk.nbytes,
+				ctx->key2.key_enc, walk.iv, first);
 
 	return skcipher_walk_done(&walk, 0);
 }
@@ -808,10 +797,9 @@ static int cmac_setkey(struct crypto_shash *tfm, const u8 *in_key,
 		return err;
 
 	/* encrypt the zero vector */
-	kernel_neon_begin();
-	aes_ecb_encrypt(ctx->consts, (u8[AES_BLOCK_SIZE]){}, ctx->key.key_enc,
-			rounds, 1);
-	kernel_neon_end();
+	scoped_ksimd()
+		aes_ecb_encrypt(ctx->consts, (u8[AES_BLOCK_SIZE]){},
+				ctx->key.key_enc, rounds, 1);
 
 	cmac_gf128_mul_by_x(consts, consts);
 	cmac_gf128_mul_by_x(consts + 1, consts);
@@ -837,10 +825,10 @@ static int xcbc_setkey(struct crypto_shash *tfm, const u8 *in_key,
 	if (err)
 		return err;
 
-	kernel_neon_begin();
-	aes_ecb_encrypt(key, ks[0], ctx->key.key_enc, rounds, 1);
-	aes_ecb_encrypt(ctx->consts, ks[1], ctx->key.key_enc, rounds, 2);
-	kernel_neon_end();
+	scoped_ksimd() {
+		aes_ecb_encrypt(key, ks[0], ctx->key.key_enc, rounds, 1);
+		aes_ecb_encrypt(ctx->consts, ks[1], ctx->key.key_enc, rounds, 2);
+	}
 
 	return cbcmac_setkey(tfm, key, sizeof(key));
 }
@@ -860,10 +848,9 @@ static void mac_do_update(struct crypto_aes_ctx *ctx, u8 const in[], int blocks,
 	int rem;
 
 	do {
-		kernel_neon_begin();
-		rem = aes_mac_update(in, ctx->key_enc, rounds, blocks,
-				     dg, enc_before, !enc_before);
-		kernel_neon_end();
+		scoped_ksimd()
+			rem = aes_mac_update(in, ctx->key_enc, rounds, blocks,
+					     dg, enc_before, !enc_before);
 		in += (blocks - rem) * AES_BLOCK_SIZE;
 		blocks = rem;
 	} while (blocks);
diff --git a/arch/arm64/crypto/aes-neonbs-glue.c b/arch/arm64/crypto/aes-neonbs-glue.c
index c4a623e86593..d496effb0a5b 100644
--- a/arch/arm64/crypto/aes-neonbs-glue.c
+++ b/arch/arm64/crypto/aes-neonbs-glue.c
@@ -85,9 +85,8 @@ static int aesbs_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 
 	ctx->rounds = 6 + key_len / 4;
 
-	kernel_neon_begin();
-	aesbs_convert_key(ctx->rk, rk.key_enc, ctx->rounds);
-	kernel_neon_end();
+	scoped_ksimd()
+		aesbs_convert_key(ctx->rk, rk.key_enc, ctx->rounds);
 
 	return 0;
 }
@@ -110,10 +109,9 @@ static int __ecb_crypt(struct skcipher_request *req,
 			blocks = round_down(blocks,
 					    walk.stride / AES_BLOCK_SIZE);
 
-		kernel_neon_begin();
-		fn(walk.dst.virt.addr, walk.src.virt.addr, ctx->rk,
-		   ctx->rounds, blocks);
-		kernel_neon_end();
+		scoped_ksimd()
+			fn(walk.dst.virt.addr, walk.src.virt.addr, ctx->rk,
+			   ctx->rounds, blocks);
 		err = skcipher_walk_done(&walk,
 					 walk.nbytes - blocks * AES_BLOCK_SIZE);
 	}
@@ -146,9 +144,8 @@ static int aesbs_cbc_ctr_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 
 	memcpy(ctx->enc, rk.key_enc, sizeof(ctx->enc));
 
-	kernel_neon_begin();
-	aesbs_convert_key(ctx->key.rk, rk.key_enc, ctx->key.rounds);
-	kernel_neon_end();
+	scoped_ksimd()
+		aesbs_convert_key(ctx->key.rk, rk.key_enc, ctx->key.rounds);
 	memzero_explicit(&rk, sizeof(rk));
 
 	return 0;
@@ -167,11 +164,11 @@ static int cbc_encrypt(struct skcipher_request *req)
 		unsigned int blocks = walk.nbytes / AES_BLOCK_SIZE;
 
 		/* fall back to the non-bitsliced NEON implementation */
-		kernel_neon_begin();
-		neon_aes_cbc_encrypt(walk.dst.virt.addr, walk.src.virt.addr,
-				     ctx->enc, ctx->key.rounds, blocks,
-				     walk.iv);
-		kernel_neon_end();
+		scoped_ksimd()
+			neon_aes_cbc_encrypt(walk.dst.virt.addr,
+					     walk.src.virt.addr,
+					     ctx->enc, ctx->key.rounds, blocks,
+					     walk.iv);
 		err = skcipher_walk_done(&walk, walk.nbytes % AES_BLOCK_SIZE);
 	}
 	return err;
@@ -193,11 +190,10 @@ static int cbc_decrypt(struct skcipher_request *req)
 			blocks = round_down(blocks,
 					    walk.stride / AES_BLOCK_SIZE);
 
-		kernel_neon_begin();
-		aesbs_cbc_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
-				  ctx->key.rk, ctx->key.rounds, blocks,
-				  walk.iv);
-		kernel_neon_end();
+		scoped_ksimd()
+			aesbs_cbc_decrypt(walk.dst.virt.addr, walk.src.virt.addr,
+					  ctx->key.rk, ctx->key.rounds, blocks,
+					  walk.iv);
 		err = skcipher_walk_done(&walk,
 					 walk.nbytes - blocks * AES_BLOCK_SIZE);
 	}
@@ -220,30 +216,32 @@ static int ctr_encrypt(struct skcipher_request *req)
 		const u8 *src = walk.src.virt.addr;
 		u8 *dst = walk.dst.virt.addr;
 
-		kernel_neon_begin();
-		if (blocks >= 8) {
-			aesbs_ctr_encrypt(dst, src, ctx->key.rk, ctx->key.rounds,
-					  blocks, walk.iv);
-			dst += blocks * AES_BLOCK_SIZE;
-			src += blocks * AES_BLOCK_SIZE;
-		}
-		if (nbytes && walk.nbytes == walk.total) {
-			u8 buf[AES_BLOCK_SIZE];
-			u8 *d = dst;
-
-			if (unlikely(nbytes < AES_BLOCK_SIZE))
-				src = dst = memcpy(buf + sizeof(buf) - nbytes,
-						   src, nbytes);
-
-			neon_aes_ctr_encrypt(dst, src, ctx->enc, ctx->key.rounds,
-					     nbytes, walk.iv);
+		scoped_ksimd() {
+			if (blocks >= 8) {
+				aesbs_ctr_encrypt(dst, src, ctx->key.rk,
+						  ctx->key.rounds, blocks,
+						  walk.iv);
+				dst += blocks * AES_BLOCK_SIZE;
+				src += blocks * AES_BLOCK_SIZE;
+			}
+			if (nbytes && walk.nbytes == walk.total) {
+				u8 buf[AES_BLOCK_SIZE];
+				u8 *d = dst;
+
+				if (unlikely(nbytes < AES_BLOCK_SIZE))
+					src = dst = memcpy(buf + sizeof(buf) -
+							   nbytes, src, nbytes);
+
+				neon_aes_ctr_encrypt(dst, src, ctx->enc,
+						     ctx->key.rounds, nbytes,
+						     walk.iv);
 
-			if (unlikely(nbytes < AES_BLOCK_SIZE))
-				memcpy(d, dst, nbytes);
+				if (unlikely(nbytes < AES_BLOCK_SIZE))
+					memcpy(d, dst, nbytes);
 
-			nbytes = 0;
+				nbytes = 0;
+			}
 		}
-		kernel_neon_end();
 		err = skcipher_walk_done(&walk, nbytes);
 	}
 	return err;
@@ -320,33 +318,33 @@ static int __xts_crypt(struct skcipher_request *req, bool encrypt,
 		in = walk.src.virt.addr;
 		nbytes = walk.nbytes;
 
-		kernel_neon_begin();
-		if (blocks >= 8) {
-			if (first == 1)
-				neon_aes_ecb_encrypt(walk.iv, walk.iv,
-						     ctx->twkey,
-						     ctx->key.rounds, 1);
-			first = 2;
-
-			fn(out, in, ctx->key.rk, ctx->key.rounds, blocks,
-			   walk.iv);
-
-			out += blocks * AES_BLOCK_SIZE;
-			in += blocks * AES_BLOCK_SIZE;
-			nbytes -= blocks * AES_BLOCK_SIZE;
+		scoped_ksimd() {
+			if (blocks >= 8) {
+				if (first == 1)
+					neon_aes_ecb_encrypt(walk.iv, walk.iv,
+							     ctx->twkey,
+							     ctx->key.rounds, 1);
+				first = 2;
+
+				fn(out, in, ctx->key.rk, ctx->key.rounds, blocks,
+				   walk.iv);
+
+				out += blocks * AES_BLOCK_SIZE;
+				in += blocks * AES_BLOCK_SIZE;
+				nbytes -= blocks * AES_BLOCK_SIZE;
+			}
+			if (walk.nbytes == walk.total && nbytes > 0) {
+				if (encrypt)
+					neon_aes_xts_encrypt(out, in, ctx->cts.key_enc,
+							     ctx->key.rounds, nbytes,
+							     ctx->twkey, walk.iv, first);
+				else
+					neon_aes_xts_decrypt(out, in, ctx->cts.key_dec,
+							     ctx->key.rounds, nbytes,
+							     ctx->twkey, walk.iv, first);
+				nbytes = first = 0;
+			}
 		}
-		if (walk.nbytes == walk.total && nbytes > 0) {
-			if (encrypt)
-				neon_aes_xts_encrypt(out, in, ctx->cts.key_enc,
-						     ctx->key.rounds, nbytes,
-						     ctx->twkey, walk.iv, first);
-			else
-				neon_aes_xts_decrypt(out, in, ctx->cts.key_dec,
-						     ctx->key.rounds, nbytes,
-						     ctx->twkey, walk.iv, first);
-			nbytes = first = 0;
-		}
-		kernel_neon_end();
 		err = skcipher_walk_done(&walk, nbytes);
 	}
 
@@ -369,14 +367,16 @@ static int __xts_crypt(struct skcipher_request *req, bool encrypt,
 	in = walk.src.virt.addr;
 	nbytes = walk.nbytes;
 
-	kernel_neon_begin();
-	if (encrypt)
-		neon_aes_xts_encrypt(out, in, ctx->cts.key_enc, ctx->key.rounds,
-				     nbytes, ctx->twkey, walk.iv, first);
-	else
-		neon_aes_xts_decrypt(out, in, ctx->cts.key_dec, ctx->key.rounds,
-				     nbytes, ctx->twkey, walk.iv, first);
-	kernel_neon_end();
+	scoped_ksimd() {
+		if (encrypt)
+			neon_aes_xts_encrypt(out, in, ctx->cts.key_enc,
+					     ctx->key.rounds, nbytes, ctx->twkey,
+					     walk.iv, first);
+		else
+			neon_aes_xts_decrypt(out, in, ctx->cts.key_dec,
+					     ctx->key.rounds, nbytes, ctx->twkey,
+					     walk.iv, first);
+	}
 
 	return skcipher_walk_done(&walk, 0);
 }
-- 
2.51.0.710.ga91ca5db03-goog


