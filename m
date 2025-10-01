Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C87CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcvrL2whjEnKHntdPNXOlg2YOLj5Bio52ZSIjpgqpWY=; b=stUMJKLuDMQIGT769Ao549/5a/
	bkmHV8QcXvjruAloUga1ccTKwXsiB/+d1vJQtXGScGroRr8Od2MCMnvEFS4L76/1LkmCB8oL+HL7V
	2CX5H95ZmBZu+pYbXTqMWalN6r41VZ7o97KEC/NvQqHHpeb4DI27Xen/7Up3Zojs5DA1Z29xZoCZh
	WQy3gKYEbjdVYcL1v0fXQm2q/Pnzrpk7rOUxZWi0xlH499Yh4+NphON3pnr6KuF3Gw96n3IfRLVYJ
	pXtRjt/Eb+ROAuOUrv7DYM/0W61T/VTwZW9d8tpbA4Ex84ryuSsNicakKm67HWexs/U8BTCEEn45/
	QS3L8LGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zc-00000008z5q-3DVl;
	Wed, 01 Oct 2025 21:04:08 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43za-00000008yzL-2I0g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:07 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3f7b5c27d41so101026f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352644; x=1759957444; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcvrL2whjEnKHntdPNXOlg2YOLj5Bio52ZSIjpgqpWY=;
        b=fSsNu1erxpCId9rfUvB+f4jD1SafPqlPr5TFM3bZEmi8MVJUvqHPdFppOZguUTKAkL
         AzYcoRxVaEw9Yn8UUhZQ997gKJKthygz9U+RX9TKnbl3SF7KBQiSBHldRfFbHMeEuNpv
         AIpyc/H141uYd5c0YwQKxQ9gX9lH0PLGcjti0QdOGSOLedLqmRkb2t0j9sW8S5zh1Jjb
         YmOzocqKm54e1RRS8QuYlfbweZdMvw5JsEsRCIXpfSkTCb+550Mit0RI//ipYno7pkS/
         WwDE/SQXxFvzCF3krLbSXUMslcqcGt0BnOs6SphSpo+ZPl4/po5S47seldrEoUKrxqB8
         S4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352644; x=1759957444;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcvrL2whjEnKHntdPNXOlg2YOLj5Bio52ZSIjpgqpWY=;
        b=qhtg42gmOy9+QSSW2faNlDxbwWohSr37w/q68A80YWsLOs176yNTJ2+Fb45PcP0jE5
         JgnIEKw2uybnuYtOJjF5yX2hiT6kbfrEX8omW4L/nOyHrO9HqUqaufnoXEKZsYUFfcR6
         DOuqDh/WYI20E2J8RFH2p/NFEnISOZzAlEQniQWFcroF2ANt2IAXgHWeMCiazYKVQ+ek
         SPYNBuLMyF5eUORS2aJOVa2lrC5DaXgAICTfP6kdpxGfQOLKWRyutqpLNIeR8C305EuN
         fgV26+4UsqdA1iANz/wdNPgEoEnnzry6RD1x4Yk7A8vzrOMy0nllX7GzjtXmDFLuNyHc
         nAmA==
X-Gm-Message-State: AOJu0YyHlQH+MXOxlyYB6fFKNfWoBMOvllIoyrWS/AuGk9G2N/LXUSSb
	Vw21Azss+L0ohof05EvckyTPiqBpWocwYPNHtvxActb8eqrtQmXE2be8kTqGbrFkNLYLiaSy+GX
	didNwgiIMZ2Fuo5ayw0IXpMjDYFU7m5wVH/egrD4ykUu03yU8jbM2dbu5c4tY6cQI0o4bc0TCs1
	TK8UEMElVn4GEeMY37Y3/EJcBycxIX5y4U6BrPW1I6na2j
X-Google-Smtp-Source: AGHT+IFgnronrhyrUGQbEd1tw99/RmLAuopJxtgZuzG70+rn7tFXZp9Z4jQhbFBg2A3csmpX/luoY+KJ
X-Received: from wmep20.prod.google.com ([2002:a05:600c:4314:b0:46e:3212:7c8f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:584a:0:b0:425:58d0:483a
 with SMTP id ffacd0b85a97d-4255d294cb7mr680156f8f.3.1759352643936; Wed, 01
 Oct 2025 14:04:03 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:13 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4507; i=ardb@kernel.org;
 h=from:subject; bh=ZZLbTVVt22jlbrdSe9T5dbgBqhdIsvid01EOnLK51YY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePutB+MjZ87zJ8nF8qUiPf+vhsS3eN260KLvOGy28p7j
 a8kHH/eUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbCVMfwP1b11I7kc0k/2j7z
 3BdgviGzfdeviMjbLzzm+r6qz/+9zJ+RYb7Fzy6L4LN3/7zofmkyK15hq9g6/nWafRsuVhbyX/9 7kQEA
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-33-ardb+git@google.com>
Subject: [PATCH v2 11/20] crypto/arm64: aes-ccm - Switch to 'ksimd' scoped
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
X-CRM114-CacheID: sfid-20251001_140406_648508_46BDEA82 
X-CRM114-Status: GOOD (  15.52  )
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
 arch/arm64/crypto/aes-ce-ccm-glue.c | 135 ++++++++++----------
 1 file changed, 66 insertions(+), 69 deletions(-)

diff --git a/arch/arm64/crypto/aes-ce-ccm-glue.c b/arch/arm64/crypto/aes-ce-ccm-glue.c
index 2eb4e76cabc3..c4fd648471f1 100644
--- a/arch/arm64/crypto/aes-ce-ccm-glue.c
+++ b/arch/arm64/crypto/aes-ce-ccm-glue.c
@@ -8,7 +8,6 @@
  * Author: Ard Biesheuvel <ardb@kernel.org>
  */
 
-#include <asm/neon.h>
 #include <linux/unaligned.h>
 #include <crypto/aes.h>
 #include <crypto/scatterwalk.h>
@@ -16,6 +15,8 @@
 #include <crypto/internal/skcipher.h>
 #include <linux/module.h>
 
+#include <asm/simd.h>
+
 #include "aes-ce-setkey.h"
 
 MODULE_IMPORT_NS("CRYPTO_INTERNAL");
@@ -184,40 +185,38 @@ static int ccm_encrypt(struct aead_request *req)
 	if (unlikely(err))
 		return err;
 
-	kernel_neon_begin();
-
-	if (req->assoclen)
-		ccm_calculate_auth_mac(req, mac);
-
-	do {
-		u32 tail = walk.nbytes % AES_BLOCK_SIZE;
-		const u8 *src = walk.src.virt.addr;
-		u8 *dst = walk.dst.virt.addr;
-		u8 buf[AES_BLOCK_SIZE];
-		u8 *final_iv = NULL;
-
-		if (walk.nbytes == walk.total) {
-			tail = 0;
-			final_iv = orig_iv;
-		}
-
-		if (unlikely(walk.nbytes < AES_BLOCK_SIZE))
-			src = dst = memcpy(&buf[sizeof(buf) - walk.nbytes],
-					   src, walk.nbytes);
-
-		ce_aes_ccm_encrypt(dst, src, walk.nbytes - tail,
-				   ctx->key_enc, num_rounds(ctx),
-				   mac, walk.iv, final_iv);
-
-		if (unlikely(walk.nbytes < AES_BLOCK_SIZE))
-			memcpy(walk.dst.virt.addr, dst, walk.nbytes);
-
-		if (walk.nbytes) {
-			err = skcipher_walk_done(&walk, tail);
-		}
-	} while (walk.nbytes);
-
-	kernel_neon_end();
+	scoped_ksimd() {
+		if (req->assoclen)
+			ccm_calculate_auth_mac(req, mac);
+
+		do {
+			u32 tail = walk.nbytes % AES_BLOCK_SIZE;
+			const u8 *src = walk.src.virt.addr;
+			u8 *dst = walk.dst.virt.addr;
+			u8 buf[AES_BLOCK_SIZE];
+			u8 *final_iv = NULL;
+
+			if (walk.nbytes == walk.total) {
+				tail = 0;
+				final_iv = orig_iv;
+			}
+
+			if (unlikely(walk.nbytes < AES_BLOCK_SIZE))
+				src = dst = memcpy(&buf[sizeof(buf) - walk.nbytes],
+						   src, walk.nbytes);
+
+			ce_aes_ccm_encrypt(dst, src, walk.nbytes - tail,
+					   ctx->key_enc, num_rounds(ctx),
+					   mac, walk.iv, final_iv);
+
+			if (unlikely(walk.nbytes < AES_BLOCK_SIZE))
+				memcpy(walk.dst.virt.addr, dst, walk.nbytes);
+
+			if (walk.nbytes) {
+				err = skcipher_walk_done(&walk, tail);
+			}
+		} while (walk.nbytes);
+	}
 
 	if (unlikely(err))
 		return err;
@@ -251,40 +250,38 @@ static int ccm_decrypt(struct aead_request *req)
 	if (unlikely(err))
 		return err;
 
-	kernel_neon_begin();
-
-	if (req->assoclen)
-		ccm_calculate_auth_mac(req, mac);
-
-	do {
-		u32 tail = walk.nbytes % AES_BLOCK_SIZE;
-		const u8 *src = walk.src.virt.addr;
-		u8 *dst = walk.dst.virt.addr;
-		u8 buf[AES_BLOCK_SIZE];
-		u8 *final_iv = NULL;
-
-		if (walk.nbytes == walk.total) {
-			tail = 0;
-			final_iv = orig_iv;
-		}
-
-		if (unlikely(walk.nbytes < AES_BLOCK_SIZE))
-			src = dst = memcpy(&buf[sizeof(buf) - walk.nbytes],
-					   src, walk.nbytes);
-
-		ce_aes_ccm_decrypt(dst, src, walk.nbytes - tail,
-				   ctx->key_enc, num_rounds(ctx),
-				   mac, walk.iv, final_iv);
-
-		if (unlikely(walk.nbytes < AES_BLOCK_SIZE))
-			memcpy(walk.dst.virt.addr, dst, walk.nbytes);
-
-		if (walk.nbytes) {
-			err = skcipher_walk_done(&walk, tail);
-		}
-	} while (walk.nbytes);
-
-	kernel_neon_end();
+	scoped_ksimd() {
+		if (req->assoclen)
+			ccm_calculate_auth_mac(req, mac);
+
+		do {
+			u32 tail = walk.nbytes % AES_BLOCK_SIZE;
+			const u8 *src = walk.src.virt.addr;
+			u8 *dst = walk.dst.virt.addr;
+			u8 buf[AES_BLOCK_SIZE];
+			u8 *final_iv = NULL;
+
+			if (walk.nbytes == walk.total) {
+				tail = 0;
+				final_iv = orig_iv;
+			}
+
+			if (unlikely(walk.nbytes < AES_BLOCK_SIZE))
+				src = dst = memcpy(&buf[sizeof(buf) - walk.nbytes],
+						   src, walk.nbytes);
+
+			ce_aes_ccm_decrypt(dst, src, walk.nbytes - tail,
+					   ctx->key_enc, num_rounds(ctx),
+					   mac, walk.iv, final_iv);
+
+			if (unlikely(walk.nbytes < AES_BLOCK_SIZE))
+				memcpy(walk.dst.virt.addr, dst, walk.nbytes);
+
+			if (walk.nbytes) {
+				err = skcipher_walk_done(&walk, tail);
+			}
+		} while (walk.nbytes);
+	}
 
 	if (unlikely(err))
 		return err;
-- 
2.51.0.618.g983fd99d29-goog


