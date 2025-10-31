Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EE6CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SwJrIr6U1+pVeLDI8b/Z90ePApGArR/MfORdKx+bA8=; b=V6VkALV18vYFG5eGRFkQy0ZH2N
	OkcuxXDJ1Yaubnv5oDlQaf94zmSGEGsUtubiBIDmvLQsqSiN3Sm4F5UCKNsYm2znGFJn8xpXEYt8H
	A0N9oWvQo66T1eR1cn6Jc07CBymwVgLywnFTFH6Plfqqo0mWmVMX+GFkNC9I3PS1/vsKEa0fAWraQ
	dC3u4KYg6tCn+Snr8/BptAIKOuH7q9Zhe6N3XqW5nL58EtePJuSZTrfwNZZwZdJ7J0kNaIQE9fIEk
	mKBjn5cafj6mkv2riuLMYoWtV8C0dB4LStw8p2K/Lx3N57WhwOKN//lNSShJTQa29AsxjbFVojT+y
	jy90rFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmZ4-00000005vpk-3tEf;
	Fri, 31 Oct 2025 10:41:05 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY2-00000005v8n-0qR1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:40:01 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-429b51f3fd8so1002666f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907196; x=1762511996; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SwJrIr6U1+pVeLDI8b/Z90ePApGArR/MfORdKx+bA8=;
        b=In3OcAekjwzWSngnveHOeNAsV5SvPjzFW22eHtaH1VjFPgtn+63eBpcfg7BzpaZAm4
         k6NN5/8U47ubI4KPhmkG6SSi2uDGgkfXzPiJwUWN2JVZPy9nXjCvm+kkVLtDohzAPiaa
         9o8ziL11qm7iq20RSRKsq7nnlnPA+OYRxpVY50ZE+L1kDTskviGO6rb8gSJYONmmlm1M
         hFGI58EJMSFFm/Fz1NxtmlM8ttJUUxNqWA6nbUsgpvBEYIG+bH3InLiVWhN3+aqkY+K/
         Aqn4O6vHbslThuNiHWYMlbYU2GMVZScNg7ZxRj7WK+5Qag9R4x8/if7pp18Sy7Eoq/6n
         qmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907196; x=1762511996;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SwJrIr6U1+pVeLDI8b/Z90ePApGArR/MfORdKx+bA8=;
        b=eQ0rOEjShwshx16l3idFSIsv6/JPeTgOSsNyizBNPxT4XA8lUQ0j7cp0nlmn2F014a
         t7JU2BDfy08jh5WCEZX8mAagXrdb5BlGRkiYzP83zw7GWyfJXjvBQ30OPDwO1w5L+BvW
         vQFzWic3SUp9xRS0DEdLJ2y+SvIUPgzN2xzEAJxtSNjWyZ2uBzN81XKFi3V/fjveYIXl
         hmKwvTHtMmc8WqVccLQaTqok0Ceje3z8Vvgn3y4oVfKpar282enBsDPSLbRlMh8ICOHK
         glkfrvntsT4hB6pEeTcsj4IW1TWcCjZJVLgdFEzzRWsfYnwMy9SOaQuKWrmQfxJl0Nk9
         YgDQ==
X-Gm-Message-State: AOJu0YwmxK2mlFwl2ExFPxy4S1vo3rXED89z1t7gxHsfDhtcjk4Xh8Of
	RIVxfQKTF+P5fK0CkOa76zRALZUQF1P/6Nuc2+jspnzIXRA4BoFh+3RiZeK2MIqoWPJgku5lhEn
	K4eZtr09TACOa6XXnbh8QekvRvhlueLCYEiIaiOY0cWpyePvMdq1ZUtYGCD7WF+hO2sP4NO6KW/
	BEJJelDc/GtkT4hJO6F5FNd7aYytuhS0NQ3FyE3OtsTvEL
X-Google-Smtp-Source: AGHT+IFMY96nZKFh7zEZwtP6yze2D7QGtPE/U4QgTFRH0L770EQGt27hCpp9UjR+jUWQd0JcGD6pkpoY
X-Received: from wrbdz17.prod.google.com ([2002:a05:6000:e91:b0:429:8bd5:a979])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4382:b0:429:bd09:e7b6
 with SMTP id ffacd0b85a97d-429bd67245dmr2637319f8f.10.1761907195978; Fri, 31
 Oct 2025 03:39:55 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:09 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4882; i=ardb@kernel.org;
 h=from:subject; bh=vWH74Y94585NgOqf0h7A64VGzkAz8Q+4d31ezTbmH+c=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4kWG1Tv6ni+dXPjVf5pkyIGK7c4rL1vsmm+dyxXTa
 KDjEHyvo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWwIF6cATOS3MiPDj+roXWqWpraFilwP
 eON+TMnYP1Hi99MlH6tnMi+cf63/McMfjttR+uu+L2tYHTR989KnLsKr6/tUGZ/2V53O3Xvs7cM v3AA=
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-33-ardb+git@google.com>
Subject: [PATCH v4 10/21] crypto/arm64: aes-ccm - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033958_422776_ECB5D612 
X-CRM114-Status: GOOD (  14.76  )
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
2.51.1.930.gacf6e81ea2-goog


