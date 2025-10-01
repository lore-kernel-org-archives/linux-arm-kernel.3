Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79F2CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhER74UBpIhoIb7wn4zkF28t+zv1ftYCaNbghO5GaF0=; b=I1iGe5bORkpvNPaVaG4qsXOU8r
	y3H6ClTBlQJKyZVA5PBeOiEKxjMC6+VXwyBQh/BcgSbyBmg5gvpzea3/40cG4D0v3XN0vbGqRqQHo
	XzjSv0th85z3YfjsBy3p+JntCMzbsL9TXwV7Rua00qfEgmirp1GVIwIz/VLOlFxLMGrgpjCa1O1cX
	ZV+vAFuvnBau0SWBptPiCMoytU+uB1XLQnPNmyv5RvqRtgCumZgjQtDBMYsip8BiRCruzMLl0Y/E+
	dEQbPZoqq5gQ9HkhoVrEElEtOoV8C6uNClydoASwHNCtOmP5aCi1bfxqUcIo/PcdfopfxY3jDqqRc
	yw5Vl1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zs-00000008zXC-1vOS;
	Wed, 01 Oct 2025 21:04:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zq-00000008zTH-2lLA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Oct 2025 21:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NhER74UBpIhoIb7wn4zkF28t+zv1ftYCaNbghO5GaF0=; b=VR/L7NaKfZuMhtalTn1Skez85H
	sbpq5SQhaqAdFr/H7Yw72EbjCK99ROaXyqHfV2EQA1ozo5zrzibzIwdqkJv1g90qqu0ZgZQ1jNxri
	Ci4FnzQ41SmniDaCFTI2CLLHDRLzA+b6hXpPH1xV+NQJDjAvLO/IRXlMfHOGkty9cHlmlPEA9u/O9
	4kpMt8IbCEc/KECia/ggBzC71loNFp3YxNdXOEU/mS2tM9TzhytBTX/3Qbw1uQj8erNQOMU0Mapkb
	YW82Rg72Jpe0gXW4jvuFAPusa914d2/8rQrga/UVJv6pqEKA4x/KZ2kujUY1tOTkGwXSwpJYu59k0
	8OlekV2w==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zh-0000000DoRU-0jfp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:18 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e3a049abaso1239975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352651; x=1759957451; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhER74UBpIhoIb7wn4zkF28t+zv1ftYCaNbghO5GaF0=;
        b=Ps832ysFNMGg6Xlqka5RaUHDXFqmhMJT9IFFEeD/R4rg9f5JfZpzWHLOtUm7YCb3eZ
         N3uLc7wXG0pDDVn3MIRldFrtokXNbNGl3MV/AeW8stnDmm/yd0bAUp5aHrSqFgTYHLAA
         Gu7KKKLCQua5gmFeP8W6RB3Uz2/QIsmZt4X6h412cIhBnGZb8+laVuHWo8PAMFPNU2J9
         w6InbiWA+pjJr5Ko1+LA2wolMf6KD9sxoXodz4nBpQgM0MkGcCRHIkhn6W9lIpRzb8oJ
         ptpwCwRzT2Mt9UASXi8/cK13UpdwDlec188wEbVKvQqEAI7DLXDebwdUwsxjBQK55+HV
         ck8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352651; x=1759957451;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhER74UBpIhoIb7wn4zkF28t+zv1ftYCaNbghO5GaF0=;
        b=QgrliN7FBP9p76RgZMqDRJcoImNi7EYSfPWa7/t9Dvps6esGfOhYYSUoG/tlA2SnjC
         lt78Qw/8fSnELHxdr/BQHwqOMxyT+KPQRRkDBv98MCzFuwTJvquUzO/g8EfSa8uKk9FE
         y+0XN32+PjVt+JnrYRjzcvvIOP7IqnaS61NNSZrTZ9YUhgoYeTJ2GHvrLiNTjV/jdrV9
         ZYoM3GxcGS+5FgpMWpMRyyQ77nkWE8GoZABaYX0vzwRBZm8G0szB5u+DunGkDnPGMRL1
         335OAuG2fJPMYKDlukQDlO5GxcEsOCMIzFKJn1sfsjdNrO5ApoIUE4Q27NWsrSXtL6hz
         qErQ==
X-Gm-Message-State: AOJu0YyFVAid3PAuoq9r+yv5x2aYw7VkemfbGTwE4bZxnAoSVbT1hx1N
	MbMlq5pb/vOscpiO63CbWZGNgUT55I2dl4k8w4tC444V/Xiw00cwZcygqtcuLHToucj350dHGKo
	tUiqywhaQnE2ODExaSYvjsP4IuGozLix5iA0vaB5mdvsyyk6Bv8TQLa9gg4tFH3oEHlqSWncRbI
	GGnArlGDdRuWR9GgNfCRuC7nGLADdd7LAkVGg3TiYNMuj2
X-Google-Smtp-Source: AGHT+IHOlHJXU9hXA0ZmAXl6mlRNCJKkb1Gcp+5ssLGIRuoPhjvb1Emmd8X4cPDWubbLQ9YjO7PB9gsQ
X-Received: from wmcq27.prod.google.com ([2002:a05:600c:c11b:b0:46e:1f26:9212])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6692:b0:46e:502c:8d6a
 with SMTP id 5b1f17b1804b1-46e64641e65mr29454385e9.25.1759352651235; Wed, 01
 Oct 2025 14:04:11 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:19 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2860; i=ardb@kernel.org;
 h=from:subject; bh=nxbcY1qMUcCM5Jp3a99oXHHwAeI3LF7dd8KEKxZdHZ4=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePudKH2XdeuGB133c2V2KjV5uU9u09ni9zLgvJw7qCF0
 9Z8LXjSUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaS0M7I8OxoakasXPVCVm6x
 mvWzfBYxuO7SO7rQoEMsbF7GoxkqCxj+cNsr7Pt+bLaWpqps/7OPbIU9G7oT7rhfTTy33L9yhcN 5XgA=
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-39-ardb+git@google.com>
Subject: [PATCH v2 17/20] crypto/arm64: sm3 - Switch to 'ksimd' scoped guard API
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
X-CRM114-CacheID: sfid-20251001_220414_445943_D6A0EDA1 
X-CRM114-Status: GOOD (  13.08  )
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
 arch/arm64/crypto/sm3-ce-glue.c   | 15 ++++++++-------
 arch/arm64/crypto/sm3-neon-glue.c | 16 ++++++----------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/crypto/sm3-ce-glue.c b/arch/arm64/crypto/sm3-ce-glue.c
index eac6f5fa0abe..24c1fcfae072 100644
--- a/arch/arm64/crypto/sm3-ce-glue.c
+++ b/arch/arm64/crypto/sm3-ce-glue.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
 
-#include <asm/neon.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sm3.h>
 #include <crypto/sm3_base.h>
@@ -13,6 +12,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+#include <asm/simd.h>
+
 MODULE_DESCRIPTION("SM3 secure hash using ARMv8 Crypto Extensions");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
@@ -25,18 +26,18 @@ static int sm3_ce_update(struct shash_desc *desc, const u8 *data,
 {
 	int remain;
 
-	kernel_neon_begin();
-	remain = sm3_base_do_update_blocks(desc, data, len, sm3_ce_transform);
-	kernel_neon_end();
+	scoped_ksimd() {
+		remain = sm3_base_do_update_blocks(desc, data, len, sm3_ce_transform);
+	}
 	return remain;
 }
 
 static int sm3_ce_finup(struct shash_desc *desc, const u8 *data,
 			unsigned int len, u8 *out)
 {
-	kernel_neon_begin();
-	sm3_base_do_finup(desc, data, len, sm3_ce_transform);
-	kernel_neon_end();
+	scoped_ksimd() {
+		sm3_base_do_finup(desc, data, len, sm3_ce_transform);
+	}
 	return sm3_base_finish(desc, out);
 }
 
diff --git a/arch/arm64/crypto/sm3-neon-glue.c b/arch/arm64/crypto/sm3-neon-glue.c
index 6c4611a503a3..15f30cc24f32 100644
--- a/arch/arm64/crypto/sm3-neon-glue.c
+++ b/arch/arm64/crypto/sm3-neon-glue.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2022 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  */
 
-#include <asm/neon.h>
+#include <asm/simd.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sm3.h>
 #include <crypto/sm3_base.h>
@@ -20,20 +20,16 @@ asmlinkage void sm3_neon_transform(struct sm3_state *sst, u8 const *src,
 static int sm3_neon_update(struct shash_desc *desc, const u8 *data,
 			   unsigned int len)
 {
-	int remain;
-
-	kernel_neon_begin();
-	remain = sm3_base_do_update_blocks(desc, data, len, sm3_neon_transform);
-	kernel_neon_end();
-	return remain;
+	scoped_ksimd()
+		return sm3_base_do_update_blocks(desc, data, len,
+						 sm3_neon_transform);
 }
 
 static int sm3_neon_finup(struct shash_desc *desc, const u8 *data,
 			  unsigned int len, u8 *out)
 {
-	kernel_neon_begin();
-	sm3_base_do_finup(desc, data, len, sm3_neon_transform);
-	kernel_neon_end();
+	scoped_ksimd()
+		sm3_base_do_finup(desc, data, len, sm3_neon_transform);
 	return sm3_base_finish(desc, out);
 }
 
-- 
2.51.0.618.g983fd99d29-goog


