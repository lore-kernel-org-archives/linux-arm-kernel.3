Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27757CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vE8eXwwbGKy5p5WbHU/i1dMObS51JLHu730fwFC+Odw=; b=XzcWG0P+O3P1CCXXh9xZ/0swkT
	2jO7VGDIc4o4UuveHxfd9Hio3IShcnYpsUxFp7Uz5XCaBAEduHFhG/rTNXXUOB04VUnWSm4YKqAzq
	Brj9OlW32q/zOAKIYya7I50d0HcMM8D30e8TqkpgWqL9Pe2/P++czx7oMcukJdDoPCEPgqDGbouHV
	qYTKdxtRKJMGbXZZpIpP2dxoSruhzNRvT4hXpMDDcAATAKLemc1KSN2IhW2IMO771uq4lUOPMv25l
	QM0yVtOAPSL5hPdInls9mJXobWLxGB1yiAtO6r7ovXVFkKJ7ksRu+jovG4uHz38Yacb4+LLjLyn5R
	OBJjOrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zZ-00000008z19-33l8;
	Wed, 01 Oct 2025 21:04:05 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zX-00000008yws-24Mq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:04 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46e41c32209so937575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352641; x=1759957441; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vE8eXwwbGKy5p5WbHU/i1dMObS51JLHu730fwFC+Odw=;
        b=OgXWqVo9Mp84ULV3ThY0nvNRIu8rjv5bV2jNpny0ttVuwwI1raOW0DidbSrP5u3aj4
         99thfPkbktMzOLekPCOM+GsXOONgGXvyjX4A17L67fVSEQMJ2F/UdTPaXtl4oIg8EQox
         VH9XFVHH1jkVOsU0+QwBrif33WbRl/0RRiftoKQoi/0qQzyq6A8ltbBz+HPZK/+BeC/j
         TpAikT56z2c7YPqoycGYgsMBkdSKq7DEVNUPLxxdAQ2DdH+2SqLOQR8rXfAsm0QNrLie
         HvFGdo94kYPHNyboVXmlLn1RSDRfdDAyD3E3SqdMY9FPozjdf/9KlPUfHjr93Zw6O2RT
         Hc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352641; x=1759957441;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vE8eXwwbGKy5p5WbHU/i1dMObS51JLHu730fwFC+Odw=;
        b=s11khP0Q3uIUIl3Ws5XhiZ4mcxj0bEfAiBDTun9rvyvkK7/SsGn6JzLrNWGLffxDu6
         tzjQSsntfXpq5NmqxoiW1xvi8WpIEmC5iCJbLXOYJkAdjmn9Y+acY/68Lum5Yfz16ccM
         iZ0tRjdqcSb0Bj1daweyRcAEFm+syIMKtoanJGSUcTd9SdrNz/lF14FCrHY6mXrxj4tB
         df5TAoNGcwoMSP4D1v66wzhz8WdU9zFXvyxEI2LNGkSPuo1QfxVNp+qX0BCWA6IC7HsD
         AFK98MrTJfE9CLRN8TFEOM2QQ5O9l3TxZMbTch4M8hJZTBfhTmmD4AMF3ingfn6n4HHg
         l8kQ==
X-Gm-Message-State: AOJu0YxAiQEQ7cpCdzIh8Ec11g2AYNr6wy8LcIW38/AYV3IQXagmT38g
	pUKC18Ki5ZixB4fMtvh0UWSHwY1bL7TiPW81fbc5U58fCmfkpBgkd1B6ikuLVHu4Lt19DjksRug
	ZjcVXHWOcP1nYlsosRIv0bkGWzFjTJfwF1zDH3GmeNy5e3Yh0JCFL5SiO8DcHQwdHpOeGmeCbjT
	OaM6cX6rZFmhhIYq00oWBKKd4PNwoLtWrOi8vSat0V2vVA
X-Google-Smtp-Source: AGHT+IH7ZtZzU237M2m1tNwTXmJBPEEEg2ifHIsvYzIIZQnXlN2lH+rAVb8JyGkAh+fVohPUM/1C32AM
X-Received: from wmlv6.prod.google.com ([2002:a05:600c:2146:b0:46e:19f9:cfe9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8414:b0:46e:206a:78cc
 with SMTP id 5b1f17b1804b1-46e612c9042mr40692505e9.28.1759352641678; Wed, 01
 Oct 2025 14:04:01 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:11 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5792; i=ardb@kernel.org;
 h=from:subject; bh=u6utO88LPPilhPgrmOnUNkYpCEnFY27X7HNtZdaOtj0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePutA9cXKLzKkytjZfvzuMw27rm9IWJmorzmss7FggGd
 Tm/kFjfUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaiYsLwv25T0T8WyXkR2rOy
 xBgyucWuPZu+c35P51XpqCxjrQq1xQz/3Zkj9jtHHaqsdJ52+exfZmlp3ycpykUPWr0XWZw6cje DHwA=
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-31-ardb+git@google.com>
Subject: [PATCH v2 09/20] lib/crc: Switch ARM and arm64 to 'ksimd' scoped
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
X-CRM114-CacheID: sfid-20251001_140403_569376_F5EF18B9 
X-CRM114-Status: GOOD (  14.64  )
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

Before modifying the prototypes of kernel_neon_begin() and
kernel_neon_end() to accommodate kernel mode FP/SIMD state buffers
allocated on the stack, move arm64 to the new 'ksimd' scoped guard API,
which encapsulates the calls to those functions.

For symmetry, do the same for 32-bit ARM too.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/crc/arm/crc-t10dif.h   | 16 +++++-----------
 lib/crc/arm/crc32.h        | 11 ++++-------
 lib/crc/arm64/crc-t10dif.h | 16 +++++-----------
 lib/crc/arm64/crc32.h      | 16 ++++++----------
 4 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/lib/crc/arm/crc-t10dif.h b/lib/crc/arm/crc-t10dif.h
index 2edf7e9681d0..133a773b8248 100644
--- a/lib/crc/arm/crc-t10dif.h
+++ b/lib/crc/arm/crc-t10dif.h
@@ -7,7 +7,6 @@
 
 #include <crypto/internal/simd.h>
 
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
@@ -22,21 +21,16 @@ asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
 static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 {
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
-		if (static_branch_likely(&have_pmull)) {
-			if (crypto_simd_usable()) {
-				kernel_neon_begin();
-				crc = crc_t10dif_pmull64(crc, data, length);
-				kernel_neon_end();
-				return crc;
-			}
+		if (static_branch_likely(&have_pmull) && crypto_simd_usable()) {
+			scoped_ksimd()
+				return crc_t10dif_pmull64(crc, data, length);
 		} else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
 			   static_branch_likely(&have_neon) &&
 			   crypto_simd_usable()) {
 			u8 buf[16] __aligned(16);
 
-			kernel_neon_begin();
-			crc_t10dif_pmull8(crc, data, length, buf);
-			kernel_neon_end();
+			scoped_ksimd()
+				crc_t10dif_pmull8(crc, data, length, buf);
 
 			return crc_t10dif_generic(0, buf, sizeof(buf));
 		}
diff --git a/lib/crc/arm/crc32.h b/lib/crc/arm/crc32.h
index 018007e162a2..32ad299319cd 100644
--- a/lib/crc/arm/crc32.h
+++ b/lib/crc/arm/crc32.h
@@ -10,7 +10,6 @@
 #include <crypto/internal/simd.h>
 
 #include <asm/hwcap.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
@@ -44,9 +43,8 @@ static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 			len -= n;
 		}
 		n = round_down(len, 16);
-		kernel_neon_begin();
-		crc = crc32_pmull_le(p, n, crc);
-		kernel_neon_end();
+		scoped_ksimd()
+			crc = crc32_pmull_le(p, n, crc);
 		p += n;
 		len -= n;
 	}
@@ -73,9 +71,8 @@ static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 			len -= n;
 		}
 		n = round_down(len, 16);
-		kernel_neon_begin();
-		crc = crc32c_pmull_le(p, n, crc);
-		kernel_neon_end();
+		scoped_ksimd()
+			crc = crc32c_pmull_le(p, n, crc);
 		p += n;
 		len -= n;
 	}
diff --git a/lib/crc/arm64/crc-t10dif.h b/lib/crc/arm64/crc-t10dif.h
index c4521a7f1ee9..dcbee08801d6 100644
--- a/lib/crc/arm64/crc-t10dif.h
+++ b/lib/crc/arm64/crc-t10dif.h
@@ -9,7 +9,6 @@
 
 #include <crypto/internal/simd.h>
 
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_asimd);
@@ -24,21 +23,16 @@ asmlinkage u16 crc_t10dif_pmull_p64(u16 init_crc, const u8 *buf, size_t len);
 static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 {
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
-		if (static_branch_likely(&have_pmull)) {
-			if (crypto_simd_usable()) {
-				kernel_neon_begin();
-				crc = crc_t10dif_pmull_p64(crc, data, length);
-				kernel_neon_end();
-				return crc;
-			}
+		if (static_branch_likely(&have_pmull) && crypto_simd_usable()) {
+			scoped_ksimd()
+				return crc_t10dif_pmull_p64(crc, data, length);
 		} else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
 			   static_branch_likely(&have_asimd) &&
 			   crypto_simd_usable()) {
 			u8 buf[16];
 
-			kernel_neon_begin();
-			crc_t10dif_pmull_p8(crc, data, length, buf);
-			kernel_neon_end();
+			scoped_ksimd()
+				crc_t10dif_pmull_p8(crc, data, length, buf);
 
 			return crc_t10dif_generic(0, buf, sizeof(buf));
 		}
diff --git a/lib/crc/arm64/crc32.h b/lib/crc/arm64/crc32.h
index 6e5dec45f05d..2b5cbb686a13 100644
--- a/lib/crc/arm64/crc32.h
+++ b/lib/crc/arm64/crc32.h
@@ -2,7 +2,6 @@
 
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 #include <crypto/internal/simd.h>
@@ -24,9 +23,8 @@ static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 		return crc32_le_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
-		kernel_neon_begin();
-		crc = crc32_le_arm64_4way(crc, p, len);
-		kernel_neon_end();
+		scoped_ksimd()
+			crc = crc32_le_arm64_4way(crc, p, len);
 
 		p += round_down(len, 64);
 		len %= 64;
@@ -44,9 +42,8 @@ static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 		return crc32c_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
-		kernel_neon_begin();
-		crc = crc32c_le_arm64_4way(crc, p, len);
-		kernel_neon_end();
+		scoped_ksimd()
+			crc = crc32c_le_arm64_4way(crc, p, len);
 
 		p += round_down(len, 64);
 		len %= 64;
@@ -64,9 +61,8 @@ static inline u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
 		return crc32_be_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
-		kernel_neon_begin();
-		crc = crc32_be_arm64_4way(crc, p, len);
-		kernel_neon_end();
+		scoped_ksimd()
+			crc = crc32_be_arm64_4way(crc, p, len);
 
 		p += round_down(len, 64);
 		len %= 64;
-- 
2.51.0.618.g983fd99d29-goog


