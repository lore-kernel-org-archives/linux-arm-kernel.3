Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D126FA1FD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38FJmf1CbLYI1AGt06YyNFECBDz7thiyI1GjGiYf7zE=; b=GhgYHTC1VX6qGbq0R7sWHQNsCB
	febFMa79vqA9Sd+tkdP6B2V2i2d05WHWPxEbI6TYMh3fOag3XHkPD30h/dPKBetEkyMuBaNZYpjm3
	l1iQQNJm9GvVGX0TayWM5Q4D/jYuooWH0dsWOfOYTf9KGaqQefNbw7Bnzp9vtl0yHrhjLlCFoOnIq
	56vWtf6dM/ElCxPyO/OAcHtoXak4da7llY/v9IG9QDy/7WNC9AlZuwhzeQ0vO4WwcCI+mllnIyqr1
	viZbX0xxaGKphnqIdyVjEGrQrTIXmGjLB2ZY0eOydv8S3ugKAVHxBK+PyiSL3vn1Q/v9HRGiSKF7/
	WS6MMEQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCp-0000000AYiM-0ouc;
	Wed, 22 Apr 2026 17:17:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCW-0000000AYUu-0uCs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:17:26 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488cc31ea57so45161805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 10:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776878242; x=1777483042; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=38FJmf1CbLYI1AGt06YyNFECBDz7thiyI1GjGiYf7zE=;
        b=jTF5N76Kc1Qnv1v0iTOmA1rjlzp82hs+maQ7gN4aS0ILKZLUHx6pIt5x9Bwzb430Mu
         hSBWr3TP+6B3FkcXWerwjJOIrXhY02sdVZpG6KAjRyUYcUbsU1lhWDOXb7VXqv4zNBhN
         dflMCYRAzMi0aV10u/UbENNTFp61DoW3vc2xgHuF0IA7+cSNCOaEQrYgWDhpUjRcg7AG
         rNRdI6tyr5NNQ15wFDRRlx1UeQooTALh3srAsYQVyynxXwA9PCSSW4+c3Tne279x2zDS
         O6FPDtfTsIbVXbSctq3xsD+cBlzs6+QQfLGQZ6kNnAOWiWGz/1q8Fjj0nb/MjO5oQwrr
         nK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776878242; x=1777483042;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=38FJmf1CbLYI1AGt06YyNFECBDz7thiyI1GjGiYf7zE=;
        b=qZpXLckI3CAwxVRbrETn/pFBYRObUqcuHtg3FcDaC51ZRa/qVknghAWYCITOwUokb3
         IqbxVuquoQLOro8H/1o6G39fpXwSB7Ahmw1UZMKRW0uhdAwotNd8Iwy1DZiX/XSSIwjt
         z8siCfY8apuLBLU3kXyeX0nYpCxgQ+utDT9axFPFU3MJB5DZ3D6F4QHopdDD5PNLWoSk
         75647TfYpVrB0QcNHqjsbmG1Gpa8vqnEFKaInQjNdsLH+5Oyjhg0FGUytb4zbkn650vT
         HmB0qzqHHeEe1LsJGQ4zmtT82imJy/SGOjtX9aHzF1bGpP8T3fhx9qKzLv/hx6FF1R+f
         ZnPg==
X-Gm-Message-State: AOJu0YzV8iYSlLx5lF9nkrsgpamUqxpY7i7CXHZF/I7ldPNo8L7e7NQl
	WiF+gzaDTNx1OlJSiLPl7GE+1zDrq+w5NVojtBpSr0P0ewIa9b2gQ9qy9x6oZmDfKDQq/YG6wAP
	ZpqgONjDRJWAyGaw0Z/FW3au0+Y3doWjH0iNOz+L4iLNrMFgRibwBxH+Pw2KH6osF1OC6l0HCDX
	h37K0/Sr2KBBMU18U4Sggjx68BEIUlYhSRfK+ZQALhn+oy
X-Received: from wmtf4.prod.google.com ([2002:a05:600c:8b44:b0:489:1b01:386f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e4f:b0:488:d6eb:e63c
 with SMTP id 5b1f17b1804b1-488fb778703mr339429635e9.15.1776878242278; Wed, 22
 Apr 2026 10:17:22 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:17:02 +0200
In-Reply-To: <20260422171655.3437334-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20260422171655.3437334-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2567; i=ardb@kernel.org;
 h=from:subject; bh=GF0mnodrUh6rjEZUVMaX/cFwNwIG3vT9XIt19bfi9Io=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfMl08Sa4CSz5Jv/mx/0/gpfqP9q6tPUq9HJIn7vsjVO3
 VUwqfDsKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPJaGT4Zx9xW+Vp/vMfuczL
 uusVThx9c/M7i7bmo+TM24XM08yK7jAyrF/ysc5vmkD96tril/ei7p7TFhMwfMptsfJnxvHau9u MWQA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260422171655.3437334-16-ardb+git@google.com>
Subject: [PATCH 6/8] crypto: aegis128 - Use neon-intrinsics.h on ARM too
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_101724_307839_09D408F2 
X-CRM114-Status: GOOD (  12.28  )
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

Use the asm/neon-intrinsics.h header on ARM as well as arm64, so that
the calling code does not have to know the difference.

Clean up the Makefile a bit while at it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 crypto/Makefile              | 10 ++++------
 crypto/aegis128-neon-inner.c |  4 +---
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 162242593c7c..69d1a18e8519 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -103,13 +103,14 @@ obj-$(CONFIG_CRYPTO_CHACHA20POLY1305) += chacha20poly1305.o
 obj-$(CONFIG_CRYPTO_AEGIS128) += aegis128.o
 aegis128-y := aegis128-core.o
 
+CFLAGS_aegis128-neon-inner.o += $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_aegis128-neon-inner.o += $(CC_FLAGS_NO_FPU)
 ifeq ($(ARCH),arm)
-CFLAGS_aegis128-neon-inner.o += -ffreestanding -march=armv8-a -mfloat-abi=softfp
-CFLAGS_aegis128-neon-inner.o += -mfpu=crypto-neon-fp-armv8
+CFLAGS_aegis128-neon-inner.o += -march=armv8-a -mfpu=crypto-neon-fp-armv8
 aegis128-$(CONFIG_CRYPTO_AEGIS128_SIMD) += aegis128-neon.o aegis128-neon-inner.o
 endif
 ifeq ($(ARCH),arm64)
-aegis128-cflags-y := -ffreestanding -mcpu=generic+crypto
+aegis128-cflags-y := -mcpu=generic+crypto
 aegis128-cflags-$(CONFIG_CC_IS_GCC) += -ffixed-q16 -ffixed-q17 -ffixed-q18 \
 				       -ffixed-q19 -ffixed-q20 -ffixed-q21 \
 				       -ffixed-q22 -ffixed-q23 -ffixed-q24 \
@@ -117,11 +118,8 @@ aegis128-cflags-$(CONFIG_CC_IS_GCC) += -ffixed-q16 -ffixed-q17 -ffixed-q18 \
 				       -ffixed-q28 -ffixed-q29 -ffixed-q30 \
 				       -ffixed-q31
 CFLAGS_aegis128-neon-inner.o += $(aegis128-cflags-y)
-CFLAGS_REMOVE_aegis128-neon-inner.o += -mgeneral-regs-only
 aegis128-$(CONFIG_CRYPTO_AEGIS128_SIMD) += aegis128-neon.o aegis128-neon-inner.o
 endif
-# Enable <arm_neon.h>
-CFLAGS_aegis128-neon-inner.o += -isystem $(shell $(CC) -print-file-name=include)
 
 obj-$(CONFIG_CRYPTO_PCRYPT) += pcrypt.o
 obj-$(CONFIG_CRYPTO_CRYPTD) += cryptd.o
diff --git a/crypto/aegis128-neon-inner.c b/crypto/aegis128-neon-inner.c
index b6a52a386b22..56b534eeb680 100644
--- a/crypto/aegis128-neon-inner.c
+++ b/crypto/aegis128-neon-inner.c
@@ -3,13 +3,11 @@
  * Copyright (C) 2019 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  */
 
-#ifdef CONFIG_ARM64
 #include <asm/neon-intrinsics.h>
 
+#ifdef CONFIG_ARM64
 #define AES_ROUND	"aese %0.16b, %1.16b \n\t aesmc %0.16b, %0.16b"
 #else
-#include <arm_neon.h>
-
 #define AES_ROUND	"aese.8 %q0, %q1 \n\t aesmc.8 %q0, %q0"
 #endif
 
-- 
2.54.0.rc1.555.g9c883467ad-goog


