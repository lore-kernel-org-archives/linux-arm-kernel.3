Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A86FCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAysdzbuIX1TDGcwfJh6CQYboY2P1WuMxFJMLAt4CBc=; b=ADrms/lEQcOVn/QhPeYaVZjPIR
	/Cx54wh33GDN2wQCmSqkSIgKdPAKYrOoVVdliwnfC8cOxuUqvvqQOE5jygVt/z/ssq3alFDXhFK1t
	ygECy0PPOd7SRlkRY04+ZF/kV15z57vxdx5geHcBhugeEkhBBKmO/K5O6G/OL7fy0j/lsXgFOMJqi
	ZQBPlnUV1vPcvsXqAgWy4b7e2059skjMcO2X0JWya/tigpyEWrLqNqR0kSYql7MXwsSTfo98uC/76
	iuTuId9ajlgfNKL2vuW4KXroPjMC6/8UkW6E8BH5yHFMEOduJRFKCLE4yZCkhcFWNeoL3ZYJmDRja
	2AYuEz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zj-00000008zHA-17dl;
	Wed, 01 Oct 2025 21:04:15 +0000
Received: from mail-wm1-f73.google.com ([209.85.128.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zf-00000008z7h-11k5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:12 +0000
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46e502a37cdso5932935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352649; x=1759957449; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EAysdzbuIX1TDGcwfJh6CQYboY2P1WuMxFJMLAt4CBc=;
        b=eqVSLPSw3kNp4IW+u+VGdfj8tagngiWvgG3N014MmzwZ3zU+1ULtfnLMSzxFf5nozb
         CYJN00PNrXRyN4mRiza4gAwkv68Z3E6EVCD49CsHq3gEnJeN5SfnVQxXCB3UI48CtU+a
         RBWxngqsrzOSFgtijv2mVDZxmTRAM8sQt+AgjRIMGGXLuEV2SdG2JdDb6qon3baELdcp
         RqOWdEmg6XT1r0O0KKKSuKDxm5IHY/Oy1dPH5LHMrbcU5Ki7tKm16S0sIjmJp8goyCrY
         gU5mJ9t7shR9kCBE5qPggen7TmoUdhLBCW/OAnPm0yWTehpbW+kJsrncEfmWqAcl0Hgt
         HyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352649; x=1759957449;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAysdzbuIX1TDGcwfJh6CQYboY2P1WuMxFJMLAt4CBc=;
        b=A6MngJqw66NznYXlueKQdU7A4IkEMstj5R+3v/7piLo/3ieXmENdZERUksbUJIRK8V
         u5IsALuGrW6ciUpOhJxhQuYqs5pOvLcBoThqWzDX2NrMFaBH/J4S/P0X/P1O2sub1QTT
         XT8OqpJ/2UHYjqSzcPe0j+sHWLSEvkKtN7SwNb9x429DBagRM6bF3y4D/M7ckekv+Nl7
         ws8j6caSviBYpbh8/Iqfxhq8V0kaTHD8/DfVvUymSKsQQdpINVlhWNunHrW4YRX1UJ/H
         udHZ1Go3RQQpY+yg8AJREfHTGUXO0ZcSRf9kJ59eolq9VFv4KZ/7DnWYkdBiAqs6KooP
         Ql+A==
X-Gm-Message-State: AOJu0YyGO41rElGoyyxxl8Rg5zLG2P+A2L4NvjRb7DnTta9I27olqCH/
	1Okt5eUtvxYEjFqBsOKocE2y//6xEuFvwun7zuyU08kcFshhhNk8yeUPqOWnVi3NpbXgFlIqyl/
	7YhgLE+xUlFGBgNAHzFw86Eev3LYd4R8Phozw9TKckvDQ3QY754MP58Erc38ZAjg5+Nzy5xYEj+
	7d8tBbii2dRq8uOTCj6XJOqbkM+YZNudospeqcJFmblQ6w
X-Google-Smtp-Source: AGHT+IEjk9J1kTCvnc61ywnt8CFYyxydvdrcsVW9hi2dTiTnWEC79fQZ8w6UNQavQPI1A42BSC/bbmAm
X-Received: from wmbz18.prod.google.com ([2002:a05:600c:c092:b0:45d:cfa4:ce19])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d1a:b0:45d:cfee:7058
 with SMTP id 5b1f17b1804b1-46e612be155mr35926215e9.22.1759352648678; Wed, 01
 Oct 2025 14:04:08 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:17 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=ardb@kernel.org;
 h=from:subject; bh=BbTS+F2Hc8gpl9Sr4HMF4TFtbcI93GDZQRNcqkbkuTA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePudC6Lped/zOCRfMt7unjXmYQ+kcVzAvhS/eemiCUfz
 t6g+T+so5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExk4SGG//GN1sFvpTfVrWH9
 f3uiyOZP6mo2vN0rTN9+FCjYZLt+6SRGhtdlH6cWzU+SZXQ/xhwiOKOJ4/bkx6xftlrdcBX3Pf5 7KwsA
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-37-ardb+git@google.com>
Subject: [PATCH v2 15/20] crypto/arm64: polyval - Switch to 'ksimd' scoped
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
X-CRM114-CacheID: sfid-20251001_140411_317935_10FD771F 
X-CRM114-Status: GOOD (  11.67  )
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
2.51.0.618.g983fd99d29-goog


