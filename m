Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FEACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeDKPAQMPbh0EqMW8jQOA9NzBOuPEFyE2AHCW54BErk=; b=kOh9EEx4/enqpR10lfl6PIaXHx
	BFfWTYvyxXCCmQYMGEvKVZmHjw1RlWPh9WiGL1cBUuZnX1L1VaH9Qgu9C7Y3dssUBjd7ZvsRlJgUI
	v3hTOyR4O8F2zb84ireCnb2HBozCWSTmbdAMtusRbrjjUsYMD8iO+BscTI27kwPjD9sbuWwsnrz+j
	cI1MMaxz3fJ06qDLy7qsyuKN5H3rCBZYkoc+jgwhgLq7LjipbV7egbArt6pedi6xG46SdZPqq+yia
	Vjr3fXkjNagHDW55arS5esDnbWTr9QGZkNHyExgbsIcOvDn4MmAoGNpHZ8pUPSGYJdk6buQDTDYNk
	ZyIm7JVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zf-00000008z9V-0j2I;
	Wed, 01 Oct 2025 21:04:11 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zb-00000008z2z-3wA0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:09 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ecdc9dbc5fso83127f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352646; x=1759957446; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CeDKPAQMPbh0EqMW8jQOA9NzBOuPEFyE2AHCW54BErk=;
        b=aDXD2k/iihq+gMBZ0H8LvUMHTeKz+4H4qhN7r22wkBGFbfntzFQyqQS8B/T+mSB5GQ
         IzURtbLcOm4u3pOU4FWn9a3Z0D4aUnIkNYO+XrngDdaTiVzPaPl2GbK3t0kjf1N93EaK
         37CoUL7HE3oOg2bJCfaCiUq1gE8aYcqG3xs//hFaHFY7UrHoY89sd/yRfGzOyWST/24I
         8SKPTuC9SNb7HiIsomsfgD5yYkg3tii4xVvlLe3TyPcDpbdxwxg0tgMKYgICjLj+Cv1F
         vwcAycxrN5b2Oa6U0FsldUrJp7uNrZ19YIv2v++6qrAqfaDSGmxt6uGAxJvclZGEjsx/
         TCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352646; x=1759957446;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CeDKPAQMPbh0EqMW8jQOA9NzBOuPEFyE2AHCW54BErk=;
        b=nrOedtQiwjLkniw1y/HH9HGSxrFEiBuPwmdk1UlcO3iiQPRUG0iXLwUD7upa3wS5fu
         SvHrn6+79dMJv5Jx8QhELyDt9joHIyzoVqhpuOTPzq32vZCva0dtMsHtrEm6jfQUDITi
         ms7vitWaRwFigQDm7SdqvYJBQtQXb8AdsZOAcKVr1XP9LKCtpAbSniJE4kR+1FhbRtT1
         ISX1osa66mGMGKIFyCPLaZwzeA/kdF6Fe6NjmriEQdYiohE14TIjIn2JzDLICTqKiSUN
         JX9S/nM4Qm+1NEkl2m7FJWI8oB46TvTddEYGNY1sDRr30lEg6EGJVnSRQ2ebVXHw6uY7
         l7XQ==
X-Gm-Message-State: AOJu0YyyimhqC/ude8SpCLnCEVya7DFeLjVA2YfmGMcr9GlE+jzrmzl+
	UmUKCi//Ece4CUjjma2kugu7RGi0D8NOiCnNgJ018W5yF67UTIvKrs5gU1xgsAIzD6z5xggYcfK
	MMWzkvWJDlUeHTIM+8WPNzoeyzBephuZwwva8fuqNGu4zGPdogAnvA851nou3psVIhwznBS/LZ2
	hHQTIWUbuWuGb/tAVqmyMrS4qi2j78+tAY6rWKDXzmp5fO
X-Google-Smtp-Source: AGHT+IFzputzbAebEFyEfc/jsFLhZ5Ij21AZlBRWh2WXnyRCr1Ir7HRHLQr/BaUei+1rcPYe79TOPRsG
X-Received: from wmbh26.prod.google.com ([2002:a05:600c:a11a:b0:45d:cfa4:ce0d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2408:b0:3f0:2ab8:710f
 with SMTP id ffacd0b85a97d-425577ed732mr2808941f8f.8.1759352646016; Wed, 01
 Oct 2025 14:04:06 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:15 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2238; i=ardb@kernel.org;
 h=from:subject; bh=6vnaDpO87kSFyERwmfNjHVSsNUwe+WjtwCLCIOuhD2k=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePudMabfzoiq30TZq93WPL622O99VO1Yg0XZ+6/KH3hp
 c5lmzjbjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARP1+G/wWmxxe9Ef5yUDnC
 4UG55DG/L0npufYTWHPy3JZ7+Hvvf8TwT62otuLghCfsBRG+pqa91dvetu9/w7vik47Kx3/8xvz pjAA=
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-35-ardb+git@google.com>
Subject: [PATCH v2 13/20] crypto/arm64: aes-gcm - Switch to 'ksimd' scoped
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
X-CRM114-CacheID: sfid-20251001_140408_003932_013FDFF7 
X-CRM114-Status: GOOD (  12.81  )
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
 arch/arm64/crypto/ghash-ce-glue.c | 27 ++++++++++----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-ce-glue.c
index 4995b6e22335..7951557a285a 100644
--- a/arch/arm64/crypto/ghash-ce-glue.c
+++ b/arch/arm64/crypto/ghash-ce-glue.c
@@ -5,7 +5,6 @@
  * Copyright (C) 2014 - 2018 Linaro Ltd. <ard.biesheuvel@linaro.org>
  */
 
-#include <asm/neon.h>
 #include <crypto/aes.h>
 #include <crypto/b128ops.h>
 #include <crypto/gcm.h>
@@ -22,6 +21,8 @@
 #include <linux/string.h>
 #include <linux/unaligned.h>
 
+#include <asm/simd.h>
+
 MODULE_DESCRIPTION("GHASH and AES-GCM using ARMv8 Crypto Extensions");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
@@ -74,9 +75,8 @@ void ghash_do_simd_update(int blocks, u64 dg[], const char *src,
 					      u64 const h[][2],
 					      const char *head))
 {
-	kernel_neon_begin();
-	simd_update(blocks, dg, src, key->h, head);
-	kernel_neon_end();
+	scoped_ksimd()
+		simd_update(blocks, dg, src, key->h, head);
 }
 
 /* avoid hogging the CPU for too long */
@@ -329,11 +329,10 @@ static int gcm_encrypt(struct aead_request *req, char *iv, int assoclen)
 			tag = NULL;
 		}
 
-		kernel_neon_begin();
-		pmull_gcm_encrypt(nbytes, dst, src, ctx->ghash_key.h,
-				  dg, iv, ctx->aes_key.key_enc, nrounds,
-				  tag);
-		kernel_neon_end();
+		scoped_ksimd()
+			pmull_gcm_encrypt(nbytes, dst, src, ctx->ghash_key.h,
+					  dg, iv, ctx->aes_key.key_enc, nrounds,
+					  tag);
 
 		if (unlikely(!nbytes))
 			break;
@@ -399,11 +398,11 @@ static int gcm_decrypt(struct aead_request *req, char *iv, int assoclen)
 			tag = NULL;
 		}
 
-		kernel_neon_begin();
-		ret = pmull_gcm_decrypt(nbytes, dst, src, ctx->ghash_key.h,
-					dg, iv, ctx->aes_key.key_enc,
-					nrounds, tag, otag, authsize);
-		kernel_neon_end();
+		scoped_ksimd()
+			ret = pmull_gcm_decrypt(nbytes, dst, src,
+						ctx->ghash_key.h,
+						dg, iv, ctx->aes_key.key_enc,
+						nrounds, tag, otag, authsize);
 
 		if (unlikely(!nbytes))
 			break;
-- 
2.51.0.618.g983fd99d29-goog


