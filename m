Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB95CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zhuLLYlhoehauqY+PeyFZRU+wyZ+pjJLV9U014lhCY=; b=ju6Jg/IasHdSVBFco+dlXbwQJi
	q/o2wwDfKkZdZ3Ck97m41eI0grqMRHle0nBL24XXPP0OnClX635JANa8hXkBKMvdNkq/+1+3UA8Nz
	iKn21gFIl7XJrUnt7wWGP2SCfN/4bAjZf8GBFFx9jzPXwQMy/GtjK5PZMQ+acki5ArnNO2YPQLNts
	+AvhvlDtRFd0qDWrqC4T4qE+KePiaNTijIBVISGtvqlw+EkwcD9YUWWv35qxvDp91wG1eMlAZQZDc
	GILIc5GiYwJ1EkIknJxRInxRLmMcikUZRxo9yLeJVa+qjvnBPm/0Ctgrx5gRqV85OxA8R9Oz9cUVJ
	n/JGY8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY9-00000005vHE-0Kwo;
	Fri, 31 Oct 2025 10:40:05 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmXy-00000005v6f-2lpY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:39:56 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3f384f10762so2242843f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907192; x=1762511992; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1zhuLLYlhoehauqY+PeyFZRU+wyZ+pjJLV9U014lhCY=;
        b=c0OKtM93rrwwAkJVUjnhg8f6BmNqs85htwvY3Q+ObXisEFDSQS2N31RZEG/cdD8hcl
         4XArxl4SuwFM0waQzWoAmQvFjehrc+Rt4F/a8vDoIj/RIJHgvBHuGCiAM16AUr9EcKHn
         GI2W6GbhJEkqMOH6PeUrv7ySrd33qdFZTcN9zqgNKetHwoeCTzUophcBGjGpStr4xUtL
         eEoke2nz8RRLNOUJq3rksd96QR1i+O96+lxrH7J8oLR86pAMhhP27spwpPZgfY1xh0tZ
         GpOP8EwhfIXJIgEHafmoXm3exL8J2n3g4Z255sUgQnHvngn9YLpADVWEVIuf+FODxpN8
         pSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907192; x=1762511992;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zhuLLYlhoehauqY+PeyFZRU+wyZ+pjJLV9U014lhCY=;
        b=BrWaDJym1nz4AtFXlI3B15XOxcQAS14Xb9FmpOzqgm1lI55ThntjohB4vGgyldYcIh
         VaavqMXo/J9Dua7iWQX920Gvxuaci3sygO6ROI+GKEGup4f3x59bUjHElYoVam8YVlZF
         N51TMxyMWd8p1AOjZDSm1o7xfBKHj+OsaIeEmsAqJp7F+nP5VIPQww5lShxHyd4Av8jq
         dFAgZqEWMu9Y1KOFA1zP7L8J7We7pte1X0YUvJNr+Il2cWZTQSm3PZCpF5I1IPr6rNmI
         kmZdun6SpbzsSNk/DtUHgwblvdVtXzZ92pgNNB5zznvqlEjR/r/ccJ5oKwWOiKahM39F
         VFLQ==
X-Gm-Message-State: AOJu0YwAASeFNEwbcKBJtt5DRCO/8WeeRxfC9WcJDtG0F5NAyfoGC5wo
	UwwuNT3JM8vHB4uuaBZicsB5E6mgTaE+dgmbn+cMmmm7L0BQo1wtDJsxMnepXVW4OWrHHAUhK9m
	vW8UZvReCeT3JIIf70VpVbe5yHF9RmWANmf7cfhY+t8p8oFjF8ZVxTGKssD8iTRIRgT+3EMIh3h
	AKwiONLIWylZ7n2ifLaQ6QBnqhJVKP8K33nwVXumPZTlbU
X-Google-Smtp-Source: AGHT+IG6mde3U+6HS4EOdxS/vl1RSdlu3ot1nl7+xIt1bPeQcqvsk9Gp/rEaM6G2Vof1hCgp+HjwgorY
X-Received: from wmwd10.prod.google.com ([2002:a05:600d:62ea:b0:475:df4b:95a9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1aca:b0:428:3c66:a016
 with SMTP id ffacd0b85a97d-429bd6ada02mr2121666f8f.30.1761907191819; Fri, 31
 Oct 2025 03:39:51 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:05 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508; i=ardb@kernel.org;
 h=from:subject; bh=u5CQYJMAl0uvqTErnR5m9YSNYVrAtGuRx032f0bmEYY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4pk+g01R4vvZplxhs3o/+6dfHc/NXfrTjWIU/s+tS
 lKyNlzdUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaioszwP+bq49duhVzc05/o
 6NkGR2xf1dcgcuPS8osTiyUCo/03+zL8M2EzWHp57e95q5cvNfibOWFVobTthIJoz1VHZ+tu87J U4QYA
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-29-ardb+git@google.com>
Subject: [PATCH v4 06/21] crypto: aegis128-neon - Move to more abstract
 'ksimd' guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033954_744710_D7351357 
X-CRM114-Status: GOOD (  11.13  )
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

Move away from calling kernel_neon_begin() and kernel_neon_end()
directly, and instead, use the newly introduced scoped_ksimd() API. This
permits arm64 to modify the kernel mode NEON API without affecting code
that is shared between ARM and arm64.

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 crypto/aegis128-neon.c | 33 +++++++-------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/crypto/aegis128-neon.c b/crypto/aegis128-neon.c
index 9ee50549e823..b41807e63bd3 100644
--- a/crypto/aegis128-neon.c
+++ b/crypto/aegis128-neon.c
@@ -4,7 +4,7 @@
  */
 
 #include <asm/cpufeature.h>
-#include <asm/neon.h>
+#include <asm/simd.h>
 
 #include "aegis.h"
 #include "aegis-neon.h"
@@ -24,32 +24,28 @@ void crypto_aegis128_init_simd(struct aegis_state *state,
 			       const union aegis_block *key,
 			       const u8 *iv)
 {
-	kernel_neon_begin();
-	crypto_aegis128_init_neon(state, key, iv);
-	kernel_neon_end();
+	scoped_ksimd()
+		crypto_aegis128_init_neon(state, key, iv);
 }
 
 void crypto_aegis128_update_simd(struct aegis_state *state, const void *msg)
 {
-	kernel_neon_begin();
-	crypto_aegis128_update_neon(state, msg);
-	kernel_neon_end();
+	scoped_ksimd()
+		crypto_aegis128_update_neon(state, msg);
 }
 
 void crypto_aegis128_encrypt_chunk_simd(struct aegis_state *state, u8 *dst,
 					const u8 *src, unsigned int size)
 {
-	kernel_neon_begin();
-	crypto_aegis128_encrypt_chunk_neon(state, dst, src, size);
-	kernel_neon_end();
+	scoped_ksimd()
+		crypto_aegis128_encrypt_chunk_neon(state, dst, src, size);
 }
 
 void crypto_aegis128_decrypt_chunk_simd(struct aegis_state *state, u8 *dst,
 					const u8 *src, unsigned int size)
 {
-	kernel_neon_begin();
-	crypto_aegis128_decrypt_chunk_neon(state, dst, src, size);
-	kernel_neon_end();
+	scoped_ksimd()
+		crypto_aegis128_decrypt_chunk_neon(state, dst, src, size);
 }
 
 int crypto_aegis128_final_simd(struct aegis_state *state,
@@ -58,12 +54,7 @@ int crypto_aegis128_final_simd(struct aegis_state *state,
 			       unsigned int cryptlen,
 			       unsigned int authsize)
 {
-	int ret;
-
-	kernel_neon_begin();
-	ret = crypto_aegis128_final_neon(state, tag_xor, assoclen, cryptlen,
-					 authsize);
-	kernel_neon_end();
-
-	return ret;
+	scoped_ksimd()
+		return crypto_aegis128_final_neon(state, tag_xor, assoclen,
+						  cryptlen, authsize);
 }
-- 
2.51.1.930.gacf6e81ea2-goog


