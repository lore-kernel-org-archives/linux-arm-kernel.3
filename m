Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E28CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vW/4HMHRiwaJ6EVSFpt6OOUDjFOC/wmRBK5AoFPty4Y=; b=oEjd6nnuqcGa1Co2IoZ8LITzr2
	STASKyK8V43Gmqu08PTceIjXlMuHdvsyNEZG+TXhhvEmIQMw/VbB5b1FlBRjqxZ4CmZIpuBXiGLD7
	7WEoUE4/n5SwudKwGRE+Yyt7J2K2FzSeypGCCa+TVmZg7O+ZboMkAOj3p0aLxVtkJZju0lQwcWVYh
	1T4ttmaHEUW9Qki+qUxJJQ0ubWD7v2R+rv7fYCJ/cuOAmvyBrk7fG/HbV4GlhRoq4KHvwCdIx1PJS
	lLppYTc5GgNwVty2+n/Wk4DYbdilBCu9ekEysP7PHe084WbYBMxLsMvSVeppqXqZM9XJ9YCO/xWOH
	it44YHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmZ3-00000005vng-1LVT;
	Fri, 31 Oct 2025 10:41:01 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY4-00000005v9o-3KyK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:40:03 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47106a388cfso15759285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907197; x=1762511997; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vW/4HMHRiwaJ6EVSFpt6OOUDjFOC/wmRBK5AoFPty4Y=;
        b=hFDzUZO3jjcJnlKUTsyuCPquYb3yooPEeVT/sCwQ2vX2p3UL5jflIrxo3X5XbX4DNF
         LsQvQZ6O8tJyDP+CwlkBWX9ygWdmybw9YIYDyTVkReE3gjfHp8GQrIHuLmulx+gM45K7
         X6LGOstuc3bcf4u7Jq94folVcCyyuPUTyFwWgNUrM07EgWDYPhNfFX39HhXwsgDvVc12
         zwDA4mUc0K9654NrrUEp4C45x61+IYAa6JzVzINUiB7BBBhaGahXpy8I7k30+b9RWsRk
         l/rHYgldNXvarm0OxqkLI47Y98G01xBBv2F35yBIpKN95rssY7iF/HwfzO/rpuDhdo//
         CxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907197; x=1762511997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vW/4HMHRiwaJ6EVSFpt6OOUDjFOC/wmRBK5AoFPty4Y=;
        b=mE5W9tlZDpKltrQUPu0TpWRQ8xwRKAHMJ3SQkGTb22BG2vINk9igMuy5ui2gmLwZOz
         EU3avxQg/+bcUNIHDWNZ/DIM02HUedygF8Zjd1K2u4ZXbDX/zRaUhwTZ1J1swlz2fBIQ
         8Y9S73hFsItiW7uPPYuEYeNdVIHUBYHvmHF213mMTnw2MUF2JbJXXqIFaoMq7D4ytdL6
         ap4KqooVRhv2vfdBICX420ijz4phqV9clS9VaMgbf5p6aWcuuMUfiiLh49RLnPpwS3SY
         mDLWXq+Py3+ACTizbNzyHAllDfOoA2yH04RExirZiKfnMncxCzGrdkWYreZAW/RECcU9
         iFQQ==
X-Gm-Message-State: AOJu0YyEPMhO7wB/XbhJe0dThhTX8OLG9sH44QFv0xaFf2CcepjH4w/f
	Ie5bQC9hy3MiIHRcMNlPsHsHW2gKdsX3/9yExIb2A7cG8Pn7ovnGzZxrJdc8KGYFuFh7Rc1q0xw
	wX6ccFILSSB68L25/1mO8r3kERneixVRxIs0KQkRu7Ph2k0duWblMrwQIc42saqdRaECtUvMDB+
	M7OEwi9056D03jGLHYc5zpftR6ob8Ti9lDuFg0pZG1nDHt
X-Google-Smtp-Source: AGHT+IGpykGfTzt+UMgehQVa+X/CIbWFhM4CD7YwyHd7ft0MjQCcnZ1F4YBYBw/qaiFCQGs74a7PjyhA
X-Received: from wrsz9.prod.google.com ([2002:a5d:4c89:0:b0:427:53e:a421])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2005:b0:428:4354:aa27
 with SMTP id ffacd0b85a97d-429bd6a8df9mr2532656f8f.46.1761907196795; Fri, 31
 Oct 2025 03:39:56 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:10 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=20750; i=ardb@kernel.org;
 h=from:subject; bh=GyvDP6RYmRurKRktBsz1r+elH0Fzi+2wFgZdad4GjgQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4uVdDmeN3vy/c4SPaV/1nBkhITkMEpqJV3WUHPSyk
 t6aLjzaUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbi58Pwz6xu0qz1tkULOlkS
 H+rOqlcx637eMuuxWAtffMin/XxWGxj+aaj94Qg+e+RdZ2zVId6Ac1uqn3To2M3/02Zvs6dyo+F iRgA=
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-34-ardb+git@google.com>
Subject: [PATCH v4 11/21] crypto/arm64: aes-blk - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034001_124446_B39651DE 
X-CRM114-Status: GOOD (  18.19  )
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
2.51.1.930.gacf6e81ea2-goog


