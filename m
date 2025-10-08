Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A00DCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZTif7/cIVHMtQ45TCGuP+cAI2k4HcRnORL17PDNXW0=; b=MCt1pgGOzyQwYHuRI02I9Jzy9c
	PW0sMH5FlDCN0gg0vH5tPkJtZMCxNtYvFlfIymk/vEV3JvxP+B42GNZSaN89+EYzx/CkJ7v7dR3hl
	/UtMQvBC2vUSxLU/SsnXo5QGs8KvwbeWlbOLfcnc+x6SXkD0H7NcfJPp4N+L3BVMFfHfQql6MVbVZ
	V20pjU6QnnkLvj/qYejaajgtrA572XdOrSZbKNgkcmuJbe0NFx9f1SfZO3tWl8W3F/QZTOlq50+O3
	V7gxe6JY+XEKdBpIr4ESl5AoP+U38h0s0XSsamLG9aWij8bAIdralgQa4Tp+fjWNIvDaef3F23Ioj
	bmBy5M0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNc-00000004BW0-25Gb;
	Wed, 08 Oct 2025 15:47:04 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNW-00000004BLS-3BkE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:47:00 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ecdc9dbc5fso38515f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938416; x=1760543216; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZTif7/cIVHMtQ45TCGuP+cAI2k4HcRnORL17PDNXW0=;
        b=aN9tDn76UTRWPcn8zoLUkl1C72guzFQRRPEHKTSFokdvsh92mSnHnY1AWfJYu8mhrN
         wNpuyy2S9MLvM54QwJV3vfz4/ROHGeILSU1TuILjZzGWxP/2fDG0r/x3VmKCDt/Q28cA
         pEWV7hLklbN0TEyXytb23q0iCVuZ3eickMYcJO4Hvh5/MCRJvuPGQfaCEhwlm9e7ojEn
         vnl62ItfOrj4mflcaviq/mAOYDQx8PHRmLDQOLrMVTceSFbRj4VvkKgNnXtQ8x75Oxpo
         l4twMQNOdo8yMv23JXabR9tzaUgt+t3zhvSYg9xb3CVa7LDOTzI7Ckwe/30M4fNwyLEG
         MnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938416; x=1760543216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZTif7/cIVHMtQ45TCGuP+cAI2k4HcRnORL17PDNXW0=;
        b=FqvSwtOdbA87lcCismJFPsoG59xSqAlK0E5c0rENzkMv2Elgc7OW6dTVuiBrFg6N3v
         z6YGbGOWrLOWJ9qQqh7wq2SbLkDe1dXFF7Us5IZd/NuDPPkBPe/0LD04Gw0Qv5+VGO8p
         TM61Q8OYvdi+uUHUdOyoPjN0W/ux0KCE/yevpeEesHUd0crgrIaGlv9QaN30gkXy4nzh
         GLFtujv7VLuz3vBflQ23hMUhyqoNiDHQi4GiraehM1nhVTrMMV3UGAaKPu4sujgWQZTD
         sOUR8FBKvC8I0A4VK0hM/NIjol+5X4bDWKHRoLqkuBRJPm0DQwD/XDhwlj2+jWLUOWON
         ouFA==
X-Gm-Message-State: AOJu0Yw9h2fg3TBOAKWY3wReNFiyQ3wg7TQQB41J9NFnUYtNYn54Okic
	3MqJC+0hEY8aGdFZlG6c391ZhmUi1uvhJsULD95kBiGfbbQk1K5utgI7L4F6ewrYDLfXiLHngoO
	bxy8+ZBVzQYH1vE0+fNvMYwazEHyrShS0o9QM1bHP1ptkAqxEWcRPjFYy/jemWBEyuAc6bMaUh/
	H+6JBmUS2wZUd5lbrhuWXQOUeiWxQgfOVUczZ15mkQaYnq
X-Google-Smtp-Source: AGHT+IEyCmYra1GwWRRLmZZtQP0MhI0OXcPDxc0b177KYVx3KWOyy1Y3Egz1AfgFxQB41mo55vgeHUjH
X-Received: from wmju4.prod.google.com ([2002:a7b:cb04:0:b0:46e:6302:1a80])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:290d:b0:405:ed47:b22b
 with SMTP id ffacd0b85a97d-42666abb50fmr2372305f8f.10.1759938416483; Wed, 08
 Oct 2025 08:46:56 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:44 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4882; i=ardb@kernel.org;
 h=from:subject; bh=4UlGg4Ju4YWc+Ic+YbEYvUCY8K/tyCDEsga2nZVeBfU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu80txrdaByc5vmw2PiCQKtyW6Mmrzf6v6zGLx/Pzn
 xq/HH/RUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZik8zwP5VFsj/wi4xbkYbR
 mRViX4tDOiw+xyiw3a0/z/Rsju+bOwz/9F1VbI4HTag/VTjZ88Tt3tTLPgLJSzLmOdWpF71MWxj BAAA=
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-33-ardb+git@google.com>
Subject: [PATCH v3 10/21] crypto/arm64: aes-ccm - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084658_870942_5AA7DCB1 
X-CRM114-Status: GOOD (  15.44  )
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
2.51.0.710.ga91ca5db03-goog


