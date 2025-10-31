Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A19CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jLxU3doQ2B67TmmcpJW69nrs7h/yjzsvfGdFS0dWxA=; b=Mhx7NYGm/hEp3sfh2S+QWGkxSS
	rdXLTpcW3Y79jPF1pdSJ9d593+IIJzP/LpLlyl6X0FVa12isKWTo1Ry5EoiBJ7/IaJHkT73AF0agR
	D3V9MmxMZik4NkK5I4Mfs6uwjYxmYXdGPQbzozq6hHjoT9E0DYUtxhjdUe6BhcDssLuTR7wu1bMoZ
	b45x67Ns5ZMFn8VkZAB8zTVrTklm4GpfYu8gEQdY92X7ZGesh9O9yhbzKHx6IWxkR6sgZMpiUhkkb
	Ppp294jJ9u6f7qYoQJpA4kXh2e5qIWVTk6VIMpxrJdyEPaMI5OtTbRCP2r9Ws0azKgITdfPk+Ippo
	9GnODwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmYD-00000005vMt-49Ic;
	Fri, 31 Oct 2025 10:40:10 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY0-00000005v7s-1Zjr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:39:58 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-475dc22db7eso17427645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907194; x=1762511994; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2jLxU3doQ2B67TmmcpJW69nrs7h/yjzsvfGdFS0dWxA=;
        b=fprGfoDFy56QEAV0GnynSOYV2w9ul0f6PQdGRUT84p1kSNwgKtnfmQY58wkzX5CPG+
         iGygnFhJ5LGW+hr2nDckZCp2k0UfZS1M6HUT6/M2RYbJM+V6L08Rms7vng04VwkZUj5R
         EUORP8s/Hkd/ZQK9hxM+85rsK/+SmPH24RQVuRTYgYscy50UMZsgoSbmlzGfHQ1Y1FtC
         67MjIZE0Qb3J0GThoJSG5Xh0NknzmvHu3Kh/sTDXYwU4FCxQn4iFsLbSYUfoPy4dLKPY
         QJ7R5v3PhAs+Br0S55lKnbzlbIT9jC6H3+f5l05CdYZsrxT5L2SOqFzBqwwWml7py0Av
         x4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907194; x=1762511994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jLxU3doQ2B67TmmcpJW69nrs7h/yjzsvfGdFS0dWxA=;
        b=LqPct3KGu9Mjaf7YpsbjDUxMgGshoQPbLHMRhrxUfs6mLPViOHpZhwBqWFreA2k8nd
         3FUry0LNOvZMawCLKtQxEh3NVFMWmWqhuX3e0LHnRqi7PhZpWAGvcmnYDubhlRxC+h6u
         h4DeNncBmF/4EQ5+Mt2iw2SzbdTmKTB//V/Od3nf3NtrB1+pxc6ZgJzxSjwPsuZTZE5t
         qhylyoq3juTLcc86IJTp+dJLODoDD+o1qM5bx+xUxZtInwuDBh7jaFPgIw0fBCi823Zu
         djrwzVmLwOxpesWg8wQVnc4TK08Q2nlkb8u3sRbY3PS/lD8yJqGbdmJqoYL1ImZ2/dNF
         Wg7Q==
X-Gm-Message-State: AOJu0Yx9iNs8Yr4sNAWl2/lSekKTZ9JVwnBV6biLr3Xh4fU2Vpwec+Fs
	yI7Fftk6KOJeAbcDJelpP9JA7WNBKmYsiEkyTXIyP7DGM3r4usxz+orgKlAwLms6FoltKL/CuHO
	FKtt1NVrKg67HpTzSFanokS90K6F2UR1kj2OdLD9OHH0psvDRyCcJETnFrH0oDr9HuQGdYnNPBl
	CFUKOL6CJ08igL0LxqtWtFFtZn1t8dd9dOETQNcas6ODRn
X-Google-Smtp-Source: AGHT+IHzKlH+Xpl86AaLume6m7PB2ESbuE972ir2JDi9jrl4y4L+sgCVE3nBwQSicAm7jTR3l5P0IM/v
X-Received: from wmga22.prod.google.com ([2002:a05:600c:2d56:b0:477:d9d:9b35])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6692:b0:45d:d1a3:ba6a
 with SMTP id 5b1f17b1804b1-477308a2814mr22900615e9.33.1761907193988; Fri, 31
 Oct 2025 03:39:53 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:07 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5823; i=ardb@kernel.org;
 h=from:subject; bh=Df6A5JOKcxjoUkwm445+Yocxyxyxk/Xv7orllYDUuOg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4rmeezv/vbyRxyjA/UZKZO6jV6a7BH+Ws/Sobk+d9
 lCNIWtNRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIVQGG/74sD1zNeTrnckxU
 1HlRfTPFeOZKtY2yAa+XTo1WfdHNEcbwP/+38E5zsUTHdy63dme/r7BV8et0s3usIb1mut1q5ZB GBgA=
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-31-ardb+git@google.com>
Subject: [PATCH v4 08/21] lib/crc: Switch ARM and arm64 to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033956_522432_5968A4B6 
X-CRM114-Status: GOOD (  12.72  )
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

Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/crc/arm/crc-t10dif.h   | 16 +++++-----------
 lib/crc/arm/crc32.h        | 11 ++++-------
 lib/crc/arm64/crc-t10dif.h | 16 +++++-----------
 lib/crc/arm64/crc32.h      | 16 ++++++----------
 4 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/lib/crc/arm/crc-t10dif.h b/lib/crc/arm/crc-t10dif.h
index 63441de5e3f1..aaeeab0defb5 100644
--- a/lib/crc/arm/crc-t10dif.h
+++ b/lib/crc/arm/crc-t10dif.h
@@ -5,7 +5,6 @@
  * Copyright (C) 2016 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
 
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
@@ -20,21 +19,16 @@ asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
 static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 {
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
-		if (static_branch_likely(&have_pmull)) {
-			if (likely(may_use_simd())) {
-				kernel_neon_begin();
-				crc = crc_t10dif_pmull64(crc, data, length);
-				kernel_neon_end();
-				return crc;
-			}
+		if (static_branch_likely(&have_pmull) && likely(may_use_simd())) {
+			scoped_ksimd()
+				return crc_t10dif_pmull64(crc, data, length);
 		} else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
 			   static_branch_likely(&have_neon) &&
 			   likely(may_use_simd())) {
 			u8 buf[16] __aligned(16);
 
-			kernel_neon_begin();
-			crc_t10dif_pmull8(crc, data, length, buf);
-			kernel_neon_end();
+			scoped_ksimd()
+				crc_t10dif_pmull8(crc, data, length, buf);
 
 			return crc_t10dif_generic(0, buf, sizeof(buf));
 		}
diff --git a/lib/crc/arm/crc32.h b/lib/crc/arm/crc32.h
index 7b76f52f6907..f33de6b22cd4 100644
--- a/lib/crc/arm/crc32.h
+++ b/lib/crc/arm/crc32.h
@@ -8,7 +8,6 @@
 #include <linux/cpufeature.h>
 
 #include <asm/hwcap.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
@@ -42,9 +41,8 @@ static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
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
@@ -71,9 +69,8 @@ static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
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
index f88db2971805..0de03ab1aeab 100644
--- a/lib/crc/arm64/crc-t10dif.h
+++ b/lib/crc/arm64/crc-t10dif.h
@@ -7,7 +7,6 @@
 
 #include <linux/cpufeature.h>
 
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_asimd);
@@ -22,21 +21,16 @@ asmlinkage u16 crc_t10dif_pmull_p64(u16 init_crc, const u8 *buf, size_t len);
 static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
 {
 	if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
-		if (static_branch_likely(&have_pmull)) {
-			if (likely(may_use_simd())) {
-				kernel_neon_begin();
-				crc = crc_t10dif_pmull_p64(crc, data, length);
-				kernel_neon_end();
-				return crc;
-			}
+		if (static_branch_likely(&have_pmull) && likely(may_use_simd())) {
+			scoped_ksimd()
+				return crc_t10dif_pmull_p64(crc, data, length);
 		} else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
 			   static_branch_likely(&have_asimd) &&
 			   likely(may_use_simd())) {
 			u8 buf[16];
 
-			kernel_neon_begin();
-			crc_t10dif_pmull_p8(crc, data, length, buf);
-			kernel_neon_end();
+			scoped_ksimd()
+				crc_t10dif_pmull_p8(crc, data, length, buf);
 
 			return crc_t10dif_generic(0, buf, sizeof(buf));
 		}
diff --git a/lib/crc/arm64/crc32.h b/lib/crc/arm64/crc32.h
index 31e649cd40a2..1939a5dee477 100644
--- a/lib/crc/arm64/crc32.h
+++ b/lib/crc/arm64/crc32.h
@@ -2,7 +2,6 @@
 
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 // The minimum input length to consider the 4-way interleaved code path
@@ -23,9 +22,8 @@ static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) &&
 	    likely(may_use_simd())) {
-		kernel_neon_begin();
-		crc = crc32_le_arm64_4way(crc, p, len);
-		kernel_neon_end();
+		scoped_ksimd()
+			crc = crc32_le_arm64_4way(crc, p, len);
 
 		p += round_down(len, 64);
 		len %= 64;
@@ -44,9 +42,8 @@ static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) &&
 	    likely(may_use_simd())) {
-		kernel_neon_begin();
-		crc = crc32c_le_arm64_4way(crc, p, len);
-		kernel_neon_end();
+		scoped_ksimd()
+			crc = crc32c_le_arm64_4way(crc, p, len);
 
 		p += round_down(len, 64);
 		len %= 64;
@@ -65,9 +62,8 @@ static inline u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) &&
 	    likely(may_use_simd())) {
-		kernel_neon_begin();
-		crc = crc32_be_arm64_4way(crc, p, len);
-		kernel_neon_end();
+		scoped_ksimd()
+			crc = crc32_be_arm64_4way(crc, p, len);
 
 		p += round_down(len, 64);
 		len %= 64;
-- 
2.51.1.930.gacf6e81ea2-goog


