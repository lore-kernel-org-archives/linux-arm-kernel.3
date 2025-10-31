Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C30CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlol8jlCrwU+dDQLpe8bM4Z+Y39WEsP00gTragHj4Rc=; b=cRQkAfoo5UZM6NCLi2rr3C8jDF
	m6OwhhbiO8xcNRT0i3YBGKlHNHuv6wxFyAjrrbdGnMAqoqdBYXs476Wk8zM1Jgh4I9dHR7GfPKH/7
	AoKdCUEQWxLIr9C2Lilvex1gFcxlsrS5rmu9ZXzOmst19ks0A//mrSq2/ICSDLp5iTaoibqA0ERMQ
	HKr9kg59P4BIkyh0UL4/lOCKILye+qggbZkipRsrnghpyXf5eM6GnXBF2yNMsGBO73wUVpRZsc4uN
	8i8pliUHrBOGp16uV2V/CS1NprWaYgrvbjhs3RHh//hTY0PSFposihUrd6pEoES4mC0V2gCG9F4Bn
	NEl16npQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmYE-00000005vOH-3n3Z;
	Fri, 31 Oct 2025 10:40:10 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmY1-00000005v8V-0EVM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:40:00 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-429bc93d3edso836451f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907195; x=1762511995; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nlol8jlCrwU+dDQLpe8bM4Z+Y39WEsP00gTragHj4Rc=;
        b=woorUm9ngI1q7XXbcyF/BFaC6degEB4CA/sev3MvrWUKzah049HVakTv4fMCYBDOU4
         ZxQMmvgHT2M01CvwPkHUtwit623Dfn/FWQ+eqql8F7eNV3Fx6NV9cr+NMBfZcc3qdf8h
         DqcsY887W367vGqWFM9MrvY8ImhhxEyotppD63HhMTELPAgfxIlZVxyG+uFm/LUDH8od
         uhyHsD34Bh40y08tEpWdQtMrZk5D3uD5cnaTYGKOqwRlVrssTSVtXQ7kvnYHX7Cj7od5
         vRZ7fNqN3CaCWwZ5g5uo0BjPK9QbsnUvqg3Azpycg73kp439qhVzpJJAK4tOCOvDu5xr
         Z7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907195; x=1762511995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlol8jlCrwU+dDQLpe8bM4Z+Y39WEsP00gTragHj4Rc=;
        b=LWjyfL35hLVFbV9xd5WrbuPbpC5+2ePz3Q7Rv4zjZNCxStCL/KzrPMm6ffBaAHiUeG
         kzzpjPvPnJmajTbo0EP7u4/4LTNLo8NVQ7ZGbBfo0fNN67fl3CfBrzfAKoaJuQE+QibD
         8vmmjg6MsHfCUjZRPPorKFHfSFEOCK9Bg6oLidr6cDwgNiwGS2njcBrH2ITYSRWWfijr
         FGqDsr0pi5rAmRSqYvEypZPfG2zWKWkWFp1Hi3tsUH4CV/6NNXNpeKm1CiVafpwDW6ld
         j2tmzpf5SYs5i0xnnYF6Gdd2ir+Z7hPc+/cX44uMq4wOOH3GMpGPRI7bN1LiTgH0P9Xy
         9bgQ==
X-Gm-Message-State: AOJu0YyR17LTY1PIzk3szebrw1pbjOZZv5K2W9V8X6KX+90AkeBtndFz
	MJ1lWToQqnWdeVAyRUXHbMju34h1U+ni5JaO3eQpTiannpDu1iTMYg8ptXMJTY2gIuzY3wiXqZk
	1dRZaMNpiZJvECq950JztJFZtr29jTdrdfXsTZ6PfKhjyQUC0gABHKU0rann9xIvXSTaMbKh1Q2
	4EzBNxvGpW2CcWN1SJEJbGj3jfKAz1BT7qvj8qXyvV6oAX
X-Google-Smtp-Source: AGHT+IEQo+IgSEHdcMiYz77LsIcY8TwOhGlEenTve1eoVqnDIxVO+kbrC2+61YhJ3qT6ML4IQGiBjP00
X-Received: from wrme11.prod.google.com ([2002:adf:e38b:0:b0:3ec:e23c:988f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:25c2:b0:429:b718:167c
 with SMTP id ffacd0b85a97d-429bd68847fmr2351214f8f.28.1761907194945; Fri, 31
 Oct 2025 03:39:54 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:39:08 +0100
In-Reply-To: <20251031103858.529530-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=9584; i=ardb@kernel.org;
 h=from:subject; bh=NAEDE4qtKhFGVJRETAhS4vJcuLrplU7qZJjmEUjIxNE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4oWTawUlGKbMPhxh+IFJa77kWuVTa6o+rtAO+rtTs
 e7AEoeGjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARPgmGf8YNBi18M3KZX10O
 8i6cNtHgu9LSmtjyWB2/fdrqabI7TjD8lRJafc5n8ebYDs9JK0/mRgqtEGQ5c+DF2eU5fHfnNOw 3ZgYA
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-32-ardb+git@google.com>
Subject: [PATCH v4 09/21] lib/crypto: Switch ARM and arm64 to 'ksimd' scoped
 guard API
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033957_152549_FC24E0B3 
X-CRM114-Status: GOOD (  15.89  )
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
 lib/crypto/arm/chacha.h     |  6 ++----
 lib/crypto/arm/poly1305.h   |  6 ++----
 lib/crypto/arm/sha1.h       | 13 ++++++-------
 lib/crypto/arm/sha256.h     | 12 ++++++------
 lib/crypto/arm/sha512.h     |  5 ++---
 lib/crypto/arm64/chacha.h   | 11 ++++-------
 lib/crypto/arm64/poly1305.h |  6 ++----
 lib/crypto/arm64/sha1.h     |  7 +++----
 lib/crypto/arm64/sha256.h   | 19 ++++++++-----------
 lib/crypto/arm64/sha512.h   |  8 ++++----
 10 files changed, 39 insertions(+), 54 deletions(-)

diff --git a/lib/crypto/arm/chacha.h b/lib/crypto/arm/chacha.h
index 0cae30f8ee5d..b27ba00b3b23 100644
--- a/lib/crypto/arm/chacha.h
+++ b/lib/crypto/arm/chacha.h
@@ -12,7 +12,6 @@
 
 #include <asm/cputype.h>
 #include <asm/hwcap.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 asmlinkage void chacha_block_xor_neon(const struct chacha_state *state,
@@ -87,9 +86,8 @@ static void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
 	do {
 		unsigned int todo = min_t(unsigned int, bytes, SZ_4K);
 
-		kernel_neon_begin();
-		chacha_doneon(state, dst, src, todo, nrounds);
-		kernel_neon_end();
+		scoped_ksimd()
+			chacha_doneon(state, dst, src, todo, nrounds);
 
 		bytes -= todo;
 		src += todo;
diff --git a/lib/crypto/arm/poly1305.h b/lib/crypto/arm/poly1305.h
index 0021cf368307..0fe903d8de55 100644
--- a/lib/crypto/arm/poly1305.h
+++ b/lib/crypto/arm/poly1305.h
@@ -6,7 +6,6 @@
  */
 
 #include <asm/hwcap.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 #include <linux/cpufeature.h>
 #include <linux/jump_label.h>
@@ -32,9 +31,8 @@ static void poly1305_blocks(struct poly1305_block_state *state, const u8 *src,
 		do {
 			unsigned int todo = min_t(unsigned int, len, SZ_4K);
 
-			kernel_neon_begin();
-			poly1305_blocks_neon(state, src, todo, padbit);
-			kernel_neon_end();
+			scoped_ksimd()
+				poly1305_blocks_neon(state, src, todo, padbit);
 
 			len -= todo;
 			src += todo;
diff --git a/lib/crypto/arm/sha1.h b/lib/crypto/arm/sha1.h
index 29f8bcad0447..3e2d8c7cab9f 100644
--- a/lib/crypto/arm/sha1.h
+++ b/lib/crypto/arm/sha1.h
@@ -4,7 +4,6 @@
  *
  * Copyright 2025 Google LLC
  */
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
@@ -22,12 +21,12 @@ static void sha1_blocks(struct sha1_block_state *state,
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_neon) && likely(may_use_simd())) {
-		kernel_neon_begin();
-		if (static_branch_likely(&have_ce))
-			sha1_ce_transform(state, data, nblocks);
-		else
-			sha1_transform_neon(state, data, nblocks);
-		kernel_neon_end();
+		scoped_ksimd() {
+			if (static_branch_likely(&have_ce))
+				sha1_ce_transform(state, data, nblocks);
+			else
+				sha1_transform_neon(state, data, nblocks);
+		}
 	} else {
 		sha1_block_data_order(state, data, nblocks);
 	}
diff --git a/lib/crypto/arm/sha256.h b/lib/crypto/arm/sha256.h
index 7556457b3094..ae7e52dd6e3b 100644
--- a/lib/crypto/arm/sha256.h
+++ b/lib/crypto/arm/sha256.h
@@ -22,12 +22,12 @@ static void sha256_blocks(struct sha256_block_state *state,
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_neon) && likely(may_use_simd())) {
-		kernel_neon_begin();
-		if (static_branch_likely(&have_ce))
-			sha256_ce_transform(state, data, nblocks);
-		else
-			sha256_block_data_order_neon(state, data, nblocks);
-		kernel_neon_end();
+		scoped_ksimd() {
+			if (static_branch_likely(&have_ce))
+				sha256_ce_transform(state, data, nblocks);
+			else
+				sha256_block_data_order_neon(state, data, nblocks);
+		}
 	} else {
 		sha256_block_data_order(state, data, nblocks);
 	}
diff --git a/lib/crypto/arm/sha512.h b/lib/crypto/arm/sha512.h
index d1b485dd275d..ed9bd81d6d78 100644
--- a/lib/crypto/arm/sha512.h
+++ b/lib/crypto/arm/sha512.h
@@ -19,9 +19,8 @@ static void sha512_blocks(struct sha512_block_state *state,
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_neon) && likely(may_use_simd())) {
-		kernel_neon_begin();
-		sha512_block_data_order_neon(state, data, nblocks);
-		kernel_neon_end();
+		scoped_ksimd()
+			sha512_block_data_order_neon(state, data, nblocks);
 	} else {
 		sha512_block_data_order(state, data, nblocks);
 	}
diff --git a/lib/crypto/arm64/chacha.h b/lib/crypto/arm64/chacha.h
index ba6c22d46086..ca8c6a8b0578 100644
--- a/lib/crypto/arm64/chacha.h
+++ b/lib/crypto/arm64/chacha.h
@@ -23,7 +23,6 @@
 #include <linux/kernel.h>
 
 #include <asm/hwcap.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 asmlinkage void chacha_block_xor_neon(const struct chacha_state *state,
@@ -65,9 +64,8 @@ static void hchacha_block_arch(const struct chacha_state *state,
 	if (!static_branch_likely(&have_neon) || !crypto_simd_usable()) {
 		hchacha_block_generic(state, out, nrounds);
 	} else {
-		kernel_neon_begin();
-		hchacha_block_neon(state, out, nrounds);
-		kernel_neon_end();
+		scoped_ksimd()
+			hchacha_block_neon(state, out, nrounds);
 	}
 }
 
@@ -81,9 +79,8 @@ static void chacha_crypt_arch(struct chacha_state *state, u8 *dst,
 	do {
 		unsigned int todo = min_t(unsigned int, bytes, SZ_4K);
 
-		kernel_neon_begin();
-		chacha_doneon(state, dst, src, todo, nrounds);
-		kernel_neon_end();
+		scoped_ksimd()
+			chacha_doneon(state, dst, src, todo, nrounds);
 
 		bytes -= todo;
 		src += todo;
diff --git a/lib/crypto/arm64/poly1305.h b/lib/crypto/arm64/poly1305.h
index aed5921ccd9a..b77669767cd6 100644
--- a/lib/crypto/arm64/poly1305.h
+++ b/lib/crypto/arm64/poly1305.h
@@ -6,7 +6,6 @@
  */
 
 #include <asm/hwcap.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 #include <linux/cpufeature.h>
 #include <linux/jump_label.h>
@@ -31,9 +30,8 @@ static void poly1305_blocks(struct poly1305_block_state *state, const u8 *src,
 		do {
 			unsigned int todo = min_t(unsigned int, len, SZ_4K);
 
-			kernel_neon_begin();
-			poly1305_blocks_neon(state, src, todo, padbit);
-			kernel_neon_end();
+			scoped_ksimd()
+				poly1305_blocks_neon(state, src, todo, padbit);
 
 			len -= todo;
 			src += todo;
diff --git a/lib/crypto/arm64/sha1.h b/lib/crypto/arm64/sha1.h
index aaef4ebfc5e3..bc7071f1be09 100644
--- a/lib/crypto/arm64/sha1.h
+++ b/lib/crypto/arm64/sha1.h
@@ -4,7 +4,6 @@
  *
  * Copyright 2025 Google LLC
  */
-#include <asm/neon.h>
 #include <asm/simd.h>
 #include <linux/cpufeature.h>
 
@@ -20,9 +19,9 @@ static void sha1_blocks(struct sha1_block_state *state,
 		do {
 			size_t rem;
 
-			kernel_neon_begin();
-			rem = __sha1_ce_transform(state, data, nblocks);
-			kernel_neon_end();
+			scoped_ksimd()
+				rem = __sha1_ce_transform(state, data, nblocks);
+
 			data += (nblocks - rem) * SHA1_BLOCK_SIZE;
 			nblocks = rem;
 		} while (nblocks);
diff --git a/lib/crypto/arm64/sha256.h b/lib/crypto/arm64/sha256.h
index 80d06df27d3a..568dff0f276a 100644
--- a/lib/crypto/arm64/sha256.h
+++ b/lib/crypto/arm64/sha256.h
@@ -4,7 +4,6 @@
  *
  * Copyright 2025 Google LLC
  */
-#include <asm/neon.h>
 #include <asm/simd.h>
 #include <linux/cpufeature.h>
 
@@ -27,17 +26,16 @@ static void sha256_blocks(struct sha256_block_state *state,
 			do {
 				size_t rem;
 
-				kernel_neon_begin();
-				rem = __sha256_ce_transform(state,
-							    data, nblocks);
-				kernel_neon_end();
+				scoped_ksimd()
+					rem = __sha256_ce_transform(state, data,
+								    nblocks);
+
 				data += (nblocks - rem) * SHA256_BLOCK_SIZE;
 				nblocks = rem;
 			} while (nblocks);
 		} else {
-			kernel_neon_begin();
-			sha256_block_neon(state, data, nblocks);
-			kernel_neon_end();
+			scoped_ksimd()
+				sha256_block_neon(state, data, nblocks);
 		}
 	} else {
 		sha256_block_data_order(state, data, nblocks);
@@ -66,9 +64,8 @@ static bool sha256_finup_2x_arch(const struct __sha256_ctx *ctx,
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_ce) && len >= SHA256_BLOCK_SIZE &&
 	    len <= 65536 && likely(may_use_simd())) {
-		kernel_neon_begin();
-		sha256_ce_finup2x(ctx, data1, data2, len, out1, out2);
-		kernel_neon_end();
+		scoped_ksimd()
+			sha256_ce_finup2x(ctx, data1, data2, len, out1, out2);
 		kmsan_unpoison_memory(out1, SHA256_DIGEST_SIZE);
 		kmsan_unpoison_memory(out2, SHA256_DIGEST_SIZE);
 		return true;
diff --git a/lib/crypto/arm64/sha512.h b/lib/crypto/arm64/sha512.h
index ddb0d256f73a..7eb7ef04d268 100644
--- a/lib/crypto/arm64/sha512.h
+++ b/lib/crypto/arm64/sha512.h
@@ -4,7 +4,7 @@
  *
  * Copyright 2025 Google LLC
  */
-#include <asm/neon.h>
+
 #include <asm/simd.h>
 #include <linux/cpufeature.h>
 
@@ -24,9 +24,9 @@ static void sha512_blocks(struct sha512_block_state *state,
 		do {
 			size_t rem;
 
-			kernel_neon_begin();
-			rem = __sha512_ce_transform(state, data, nblocks);
-			kernel_neon_end();
+			scoped_ksimd()
+				rem = __sha512_ce_transform(state, data, nblocks);
+
 			data += (nblocks - rem) * SHA512_BLOCK_SIZE;
 			nblocks = rem;
 		} while (nblocks);
-- 
2.51.1.930.gacf6e81ea2-goog


