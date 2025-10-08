Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64090CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZX+FOTwqwmP67LIKWGzioSokTb9JzlGhSXeNKUrBT70=; b=GxmqT9tiE3JM49g2knmdFrBKM6
	3YoJt9uk8CveBcVb4PpPdXWQfotMvYHrYdT9fx5UIPWFIlRns1Un5kk/cFMaH6BG4sd2qplyN4nc0
	iytVdcnOgxI25Y5fKz00mvWUBEUBOC47EEMk/r1VuIlh2oWoG1XTP51tQ/c7L7I0FA5GzoAlBC8HX
	6lxQr9i2ZjeHebtgxVtRDEAoms0vDaRBsK/ly2ROHxx07okOZpqcjo0UkBCIYXp+Szqx5ERDuFV7v
	c+FV3N3yFHf/g1KF/a7cC94X5YUftyhVd8JrNZKuNkDswKvD433LuZOlBvOKH49w2b9QbyBUqW0ZI
	hICVjf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNh-00000004BeY-16FC;
	Wed, 08 Oct 2025 15:47:09 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNa-00000004BRq-44ul
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:47:04 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e303235e8so11965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938421; x=1760543221; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX+FOTwqwmP67LIKWGzioSokTb9JzlGhSXeNKUrBT70=;
        b=V3QVvL4dlw8OZrJ+Xa49Ucbs/EZ0qSoZVST21aH48/BsmEiW1bqJPO1Q11rkDXaeve
         CiMQGyn6+gA8yDwxgSDOhDK46WgY6LxNj6Q9DVYUqpSVfPzv98h6S0x2RG2lDFhyw4sI
         cJrgaGl8a/xvaxE07lrbizyi+uFJmcavz2IBWlF8YLwN1ERna5YLGsTUcqQVk46toQ34
         wyrMDPYtFtrY0np4yFnxfCVJcfVsO8r8BgBy+PeKZgysxxU0v3xLsI7GgPLNOqwdgO+0
         aworLGniVRujcTdVRBZiwdwvn7RsZRQOT7RNkZRT15xASY7Kzq2I02+9f8WaLZaQlH87
         9Q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938421; x=1760543221;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX+FOTwqwmP67LIKWGzioSokTb9JzlGhSXeNKUrBT70=;
        b=TN/frfS3601dl6+zS5zN3WO8MSlGqb6aZd67AGYscAkomYiNu1OuXb6O0Ztoa0xKa7
         AYG1WiA6FLQS8l5Cse76bQeNAm0nzHZHB2kG2q2SkURu/D6Dv/Tlb+f1BCWtzwS/YMUr
         8RF7xhPXrJZNB3iBu2Cp9LOQidUhMZUfKSZ1oH2Tj7rGFzVX2rH7Ny1WMAmkx4mgn3oB
         2ZPi6Sd8QqZgHHuPa9rYgpXIVlbGUsc3QCzyAdznTXTFGhzvGrCm0nZ6p38F2b+8QPib
         O1arwJ8XsYplt27idqdJAE/9uKS7d8h0NM5k9DXNwX4L4g1DAIdUsCVtfxN6Vc5FqjYr
         Tlfw==
X-Gm-Message-State: AOJu0YwlDVqUrqKWHfIAyVtoLs5w/swjPBMu4tpGtBwRAaS6CXLGQ1eU
	BGHzfUH9vyQlsQzuvPoNVIwx9xVWtx1PkqT1fFFbz8+Av5iDerTP7Ps0wMhY0M0T9Uvs+YscQeL
	d0OnTAHH6RdattqM/mMF+loaCkWkDn6I4rKx5j0xh7k2j1WeaJVkBWqZgob8lyfQUxMvnTj9Tt4
	mc5exhXoEB3vfLB16dWWSBechmkgRRn9rJDei7caddUdUz
X-Google-Smtp-Source: AGHT+IEjiKxPM3P1jo2NCQMtIkDGka2bla0TgaKSnshbu1vw6e4DEdLUwhej0pREcTGcshyShoBFv3ri
X-Received: from wmbjx19.prod.google.com ([2002:a05:600c:5793:b0:45f:2306:167])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b07:b0:46e:1fb9:5497
 with SMTP id 5b1f17b1804b1-46fa9af84fdmr26813135e9.18.1759938420853; Wed, 08
 Oct 2025 08:47:00 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:48 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693; i=ardb@kernel.org;
 h=from:subject; bh=dcVJ+FEDVLktPv+MhuXF3k3ccZKN6EYdh2F7GcW5Gk4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu9u/hFcu0+49t26d836RcFnpng+zf7O881h/33/d6
 eqyzCUGHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiotMY/qk+2FRhLna5uZcx
 5KXyndDC70EpWYYruRLTvz9gOn1bTZSR4eo0pYydhffVZG+Xdm4++epYQY1OzPEfXx4v1Ezvu1s UzwcA
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-37-ardb+git@google.com>
Subject: [PATCH v3 14/21] crypto/arm64: polyval - Switch to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084703_028280_5BBE6846 
X-CRM114-Status: GOOD (  11.59  )
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
 arch/arm64/crypto/polyval-ce-glue.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/crypto/polyval-ce-glue.c b/arch/arm64/crypto/polyval-ce-glue.c
index c4e653688ea0..51eefbe97885 100644
--- a/arch/arm64/crypto/polyval-ce-glue.c
+++ b/arch/arm64/crypto/polyval-ce-glue.c
@@ -15,7 +15,7 @@
  * ARMv8 Crypto Extensions instructions to implement the finite field operations.
  */
 
-#include <asm/neon.h>
+#include <asm/simd.h>
 #include <crypto/internal/hash.h>
 #include <crypto/polyval.h>
 #include <crypto/utils.h>
@@ -45,16 +45,14 @@ asmlinkage void pmull_polyval_mul(u8 *op1, const u8 *op2);
 static void internal_polyval_update(const struct polyval_tfm_ctx *keys,
 	const u8 *in, size_t nblocks, u8 *accumulator)
 {
-	kernel_neon_begin();
-	pmull_polyval_update(keys, in, nblocks, accumulator);
-	kernel_neon_end();
+	scoped_ksimd()
+		pmull_polyval_update(keys, in, nblocks, accumulator);
 }
 
 static void internal_polyval_mul(u8 *op1, const u8 *op2)
 {
-	kernel_neon_begin();
-	pmull_polyval_mul(op1, op2);
-	kernel_neon_end();
+	scoped_ksimd()
+		pmull_polyval_mul(op1, op2);
 }
 
 static int polyval_arm64_setkey(struct crypto_shash *tfm,
-- 
2.51.0.710.ga91ca5db03-goog


