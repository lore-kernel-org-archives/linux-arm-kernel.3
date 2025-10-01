Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E927CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tGgNTZuDE42TuUV9n3Q45jrq8v49nbNgvB3NUvZDpE=; b=T3A4st1mlZsLqqwuNDT+uEkAQ2
	CQhoVHYKHdLZffYSQLs3foYesGj6Izc8wLLlt8cHYSKA0IAWnqFI1JPwWeRQGV3ZIooC9/ssREMzG
	1/JLO1kGwkiDU4xLMc0ACMZtyHwDzpXDgiAuobSNdOYJTmveMbRbvEWOblngA3qngRv6STnhgoxQ7
	RumvmEo4XEcHSN5ysM99rMC79ZW7lUKLUsZWNDTdProf50CQnvOKrfgdEwOhiTTKpRGIthQStF7dw
	ahACFXkD1yZnDPs8v8r14BYJmiFNtswKkkhFjVgWiHmQR4wKO8z7iaNXQbNChx+Yq/EL8pmhxAX37
	Si8jN37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zh-00000008zDf-1LcJ;
	Wed, 01 Oct 2025 21:04:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zd-00000008z6M-3vQw
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Oct 2025 21:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2tGgNTZuDE42TuUV9n3Q45jrq8v49nbNgvB3NUvZDpE=; b=kLxgfx5/iIqO4LdJ8ulPm8FAGs
	Vo1a1Kk2+PpL6XgB+X7mwCS2VAEBj00tAmSgPWVp7vaiOFRtFGavc5ILnLjiox4bHUcPGunQEVusn
	dcOdjSwXrdOFQpI2cFzqW6CKy8SFv2gaHdtkYUVcZghrHkxrVrJc5K269VhjITn3AvY9fFd4j+RsS
	2B2zdSHDsb8vVlNkKyaQpJVoz28Wz0L64bXcI4gycoouGdckPTsjjohU43x48xw7+0+ASk/2y6Ybn
	CxmHUuzecMo3HtE4u0aNapb33ShhwKLHyqJ3VUEDHltlWBQff/2n7Q8yk9Gy40fmO98EPZ5sA0fqo
	j6JdL3yA==;
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43za-0000000DoPh-1giB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:08 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b3cbee9769fso45937766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352645; x=1759957445; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2tGgNTZuDE42TuUV9n3Q45jrq8v49nbNgvB3NUvZDpE=;
        b=DYjAI1N1cS42n1C1+GEbc19Q+C/1cH+p3p9h+5hBHVWsJHf59jPIQQzsXBkG3OCwYP
         MlTMRdRp2wIkPjErjGFHPcuHUM1V+oiH5TZDlP8MgZkEX3YMx78pGlxtebYm0aXJWvWo
         d34ReTmSY8/jCKv4z7vQlic9H4lA+aBQZCZ475KLu0VreOHLL9QpMBPSmySO5dQ+VWDn
         94vUewt7uHBNV1gxLlNa/pqVjJkFTTtIDP2mX3tc7xiSu2+xg4XqPeZ1yl5vZONfRm4t
         unogfcRRQJT8I9TkjNkrXRgb4dVfiEcRuxaTYH0LCqCRzIW47aaf3wTN5nNSLen9JOL9
         0FEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352645; x=1759957445;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tGgNTZuDE42TuUV9n3Q45jrq8v49nbNgvB3NUvZDpE=;
        b=hZtLZ33GUaEeFX1cRl0aTe6+37PqYCOA6x+cM2N7QL8osfw7LqsNFEraY4LLSjCYiI
         Eo1OVP5TQCoOCqNa+Ci9WQyN+PYNYjbJkGaJZixL6x7GW6ph4m471PrGtNgMf8Q4in0X
         D1QWE0nQ6LcgPA+eXBjCcVZNqPkg72mPhV+TJgRwnLhVyCGdmaWhp1E+kW8ZHEH14STr
         XhzRH3Zjz3FA7XE7TGVjbCbR+x1ZjRqiT0q4ASoqOTleflRxcRTrvXUQZf6C5b/Wmefn
         YaZVB3hhQoT0uhd7pVvOzxLg2hNgEwfJK9K6HqwBjLJ8Wagokn+JI5SHQMh6I7QnRAN9
         X9Vw==
X-Gm-Message-State: AOJu0YyP1+gzLkwpm22++o9zZJbZZet0vJBlNhAPCbzA4BO8XxHTwPzU
	ISpxiilosI7vSuZ0oOuEG9Uh9ly5cHDBPpyEjXrBLsMjxXdfx++iS4XSbx8oCT9SmZIFmGI0cz4
	9PUXlLU5QZkQdd6iFM4t3hKQIiXdP+U3bNWIpWdBJQ8U4h7gjrDDi0W8ESeHjOKIabdZX5iBHH3
	r2nOZgDQZO5VeOu7fiCHL4kjSOG3DvjRGTZuuMJ4fSEzib
X-Google-Smtp-Source: AGHT+IGRMPSEJRGhX6bzJNMLIpuTgPU8l+6UbKzu27Pb1Dg+NmBxLA1o3IMc5SIrwprjppFeYEZeOCGP
X-Received: from edvd18.prod.google.com ([2002:aa7:ce12:0:b0:633:c29c:e02b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:1c91:b0:b45:b1f2:fab4
 with SMTP id a640c23a62f3a-b46e4d7bd97mr600170166b.12.1759352644910; Wed, 01
 Oct 2025 14:04:04 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:14 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=20375; i=ardb@kernel.org;
 h=from:subject; bh=SDCOXpC6hIQ3gVfCMmGTmKQTQWVfl68LHJ4l6pbLEnM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePutL8d7XOnC9eGvfaNMHSbsXBGcCnntPo0b63wLwlpc
 3qCixs6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETC1jAyTPwwP7vSzti9yfX9
 Wf2bOtVNSdKrvtx8fV3Y+Jee5Ona+4wMx/oL2dSL8jZpOfsv57HlZ/N50jJtZ/XSnvK5sTf8bc1 5AA==
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-34-ardb+git@google.com>
Subject: [PATCH v2 12/20] crypto/arm64: aes-blk - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_220406_838977_7D33B629 
X-CRM114-Status: GOOD (  18.90  )
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
index 81560f722b9d..4b76d8dfa2c5 100644
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
@@ -187,10 +188,9 @@ static int __maybe_unused ecb_encrypt(struct skcipher_request *req)
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
@@ -207,10 +207,9 @@ static int __maybe_unused ecb_decrypt(struct skcipher_request *req)
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
@@ -225,10 +224,9 @@ static int cbc_encrypt_walk(struct skcipher_request *req,
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
@@ -254,10 +252,9 @@ static int cbc_decrypt_walk(struct skcipher_request *req,
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
@@ -323,10 +320,9 @@ static int cts_cbc_encrypt(struct skcipher_request *req)
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
@@ -380,10 +376,9 @@ static int cts_cbc_decrypt(struct skcipher_request *req)
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
@@ -416,11 +411,11 @@ static int __maybe_unused essiv_cbc_encrypt(struct skcipher_request *req)
 
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
@@ -438,11 +433,11 @@ static int __maybe_unused essiv_cbc_decrypt(struct skcipher_request *req)
 
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
@@ -478,10 +473,9 @@ static int __maybe_unused xctr_encrypt(struct skcipher_request *req)
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
@@ -523,10 +517,9 @@ static int __maybe_unused ctr_encrypt(struct skcipher_request *req)
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
@@ -579,11 +572,10 @@ static int __maybe_unused xts_encrypt(struct skcipher_request *req)
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
 
@@ -601,11 +593,10 @@ static int __maybe_unused xts_encrypt(struct skcipher_request *req)
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
@@ -651,11 +642,10 @@ static int __maybe_unused xts_decrypt(struct skcipher_request *req)
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
 
@@ -674,11 +664,10 @@ static int __maybe_unused xts_decrypt(struct skcipher_request *req)
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
@@ -827,10 +816,9 @@ static int cmac_setkey(struct crypto_shash *tfm, const u8 *in_key,
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
@@ -856,10 +844,10 @@ static int xcbc_setkey(struct crypto_shash *tfm, const u8 *in_key,
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
@@ -879,10 +867,9 @@ static void mac_do_update(struct crypto_aes_ctx *ctx, u8 const in[], int blocks,
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
2.51.0.618.g983fd99d29-goog


