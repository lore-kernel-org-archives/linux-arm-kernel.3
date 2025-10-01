Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34688CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjS59fjLSBp23Zb/zP6WgADegb2YBV3/Wv9KxGpAaxY=; b=rU+oJm1rUfBnvf+tKylqMYkhEN
	Am2W7+DwB0Jn7/Nj7sqJNnilVcW84SMAn1aMlf81cBxloJiv2j9nPT9vJb/GT245Sy19yYcFmFRFL
	lSfzzvcG+wTFCHtwy+ge2IZ4Aa9AnEAfnUIYGa9rhjBMj5jnaPPw8xBR0AvjBOgCRi7TSm61EtFLi
	Ik8XAZy7ZrYwABynLHdKM//NbFVweUuQeIMMaXlB7ur+6vmgrxyO43ZAh27rbeZVpF2DK73um/ay2
	HFBBBPvcOj7f7eDU9JpKPM4KnCrfLtAb0/yPObAqXw9ieQrdTy2I/XnAoS22cLUDEiqCsBSv+82MJ
	YCMLlDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zf-00000008zAN-2S46;
	Wed, 01 Oct 2025 21:04:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zc-00000008z4d-3Qw5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Oct 2025 21:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wjS59fjLSBp23Zb/zP6WgADegb2YBV3/Wv9KxGpAaxY=; b=KySNqaN5oOgXII1CWTAUa5ztYA
	ttrgSiq+QQP5lIztAc8cjWmCKCKfeci+11/NZhhRFGN+K5alcNgTuIQYVHzoiACeohr+VO4hDXDu6
	4ighSRm7M2cNe1svusWT9BLo6zt9WruGZI2bGiWdST9eJnYyd80R18jvYCImNdSAhQyWGg0sfjlFS
	eUw4qyektsIT6Tc3zMLntj7Cp6RawQnsChmfRgBhFCN7pj2ZTpySUnq6tjc8x2fc/4QUbhJCBJ+Ny
	qQY9uiLc6NVZog6pNag1a3Gys4ivbwmMO1UIYU5D7p1OIJrrEgO9yktFUscWt6KvOlE8AYMctlqpE
	BbPKotxg==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zZ-0000000DoPd-1nrb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:04:07 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e3e177893so1536015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352643; x=1759957443; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wjS59fjLSBp23Zb/zP6WgADegb2YBV3/Wv9KxGpAaxY=;
        b=B0SWgwa+qSfswhON3InE/Tulkg3ltGknyBa4XIJBefcrF0jRKkk2n3cr1VWDK35OZs
         I0owtg5Fc42QvAUQUqT3OPBUdOdMGPs0eRFPDLM48qLiIaVHWmOU+TtyTfAb2JqqJjjW
         OmRu8fa4wzdBtpYskgxKzdkXqPb535vG3xfXcz0smgbxnniH61c8qPndVLalUkpW6GhN
         qNM1qR0UyCuILy22CQUDvgEv46HSev1snEv9Bc5EaBCs3kpPBVHz2JC0NbZBT5vOVINo
         2w/r3rv70A7sxiNwQyHS+hHDOklqoBaEkUM4Gd6ZLBDcToVeehJf1dhRbCmlYX7zca8n
         lj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352643; x=1759957443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjS59fjLSBp23Zb/zP6WgADegb2YBV3/Wv9KxGpAaxY=;
        b=tWs3Ubfxle9eO0UUymdwO3cLdpIYWeGVSEQNgk6beHag88eNdpoALgRnA+UPBbGARm
         6B8Jzrl7Qs2FbOvq40BtwRq6l3nSQKQLPAaBH3KiWlBe88V0L3Xj/upx0zs7kFJsaKx+
         YcP//k4+MyPqrKKRRMxAfCUqWRvdxzuvifvoJjzeF3kYVUzZWNAS2PciwdLD10vu6/yi
         j2zyzn5/5HjBJmwXgJp8nXwyiUy76MlfhogREO0O2zsDycn57zgAtigTBMMU7RoVLuUh
         s4WHpBoiV4Nh2bFL82ip3xtWbQb6dZfRve/pk5ywX4qB95mJ9HTFD9VN2Sc/6gk/rIOE
         2VFA==
X-Gm-Message-State: AOJu0YxrDvJdyHcEzTG+0vAZx55FsV7tWcKi19tTGePV70nqbJ5b8ojS
	2kt3zvkjQCkPVm+y6Uwj6ZjbpISl3dAmFRQyMGBqmclbEdayfU6Vgvk2DDZkk5wm58rItFB5vOq
	WQ9iAbRxtUtBIKDvAb0aDb2SRe9Sg20UQ6dSTr8XTo6kHHE9CJC0aA/ccIUfbwSyTDJ2mrfcYlL
	OuW4ydkcb1/HS8KvfK6/XV+aCcC8uiAjvZIiOuzjaFNkym
X-Google-Smtp-Source: AGHT+IEuIn0Xw8cSb0i16YD4euJ4+Kdw5OD8+fY/WVV0z4DuW0G513nRxE00Rg9xEjZ/WTTSw7yU1AAt
X-Received: from wmcu7.prod.google.com ([2002:a7b:c047:0:b0:46e:3190:9ce])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:820c:b0:46e:4882:94c7
 with SMTP id 5b1f17b1804b1-46e612cb269mr38395125e9.28.1759352642677; Wed, 01
 Oct 2025 14:04:02 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:12 +0200
In-Reply-To: <20251001210201.838686-22-ardb+git@google.com>
Mime-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=9679; i=ardb@kernel.org;
 h=from:subject; bh=2x6PFDcDyExpe+QvLhnrBBMaZb8fzyr9//78pWmLSeM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePutC8aWtMOahe/uP15eVdzpfyKr+IGu7exxaxkcM5rX
 +RYwv2qo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEwkcRUjQwdTaMu7taGPZ98u
 lwx8s7Px0My84NWPth/49DM9af5WG6CKr+tNrpyZcUZph+bui8JeH/80b/1yz3l5gtNDxsddDT8 yOAA=
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-32-ardb+git@google.com>
Subject: [PATCH v2 10/20] lib/crypto: Switch ARM and arm64 to 'ksimd' scoped
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
X-CRM114-CacheID: sfid-20251001_220406_124022_264E0A76 
X-CRM114-Status: GOOD (  17.42  )
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
 lib/crypto/arm/chacha-glue.c        |  6 ++----
 lib/crypto/arm/poly1305-glue.c      |  6 ++----
 lib/crypto/arm/sha1.h               | 13 ++++++-------
 lib/crypto/arm/sha256.h             | 14 +++++++-------
 lib/crypto/arm/sha512.h             |  6 +++---
 lib/crypto/arm64/chacha-neon-glue.c | 11 ++++-------
 lib/crypto/arm64/poly1305-glue.c    |  6 ++----
 lib/crypto/arm64/sha1.h             |  7 +++----
 lib/crypto/arm64/sha256.h           | 15 +++++++--------
 lib/crypto/arm64/sha512.h           |  8 ++++----
 10 files changed, 40 insertions(+), 52 deletions(-)

diff --git a/lib/crypto/arm/chacha-glue.c b/lib/crypto/arm/chacha-glue.c
index 88ec96415283..9c2e8d5edf20 100644
--- a/lib/crypto/arm/chacha-glue.c
+++ b/lib/crypto/arm/chacha-glue.c
@@ -14,7 +14,6 @@
 
 #include <asm/cputype.h>
 #include <asm/hwcap.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 asmlinkage void chacha_block_xor_neon(const struct chacha_state *state,
@@ -90,9 +89,8 @@ void chacha_crypt_arch(struct chacha_state *state, u8 *dst, const u8 *src,
 	do {
 		unsigned int todo = min_t(unsigned int, bytes, SZ_4K);
 
-		kernel_neon_begin();
-		chacha_doneon(state, dst, src, todo, nrounds);
-		kernel_neon_end();
+		scoped_ksimd()
+			chacha_doneon(state, dst, src, todo, nrounds);
 
 		bytes -= todo;
 		src += todo;
diff --git a/lib/crypto/arm/poly1305-glue.c b/lib/crypto/arm/poly1305-glue.c
index 2d86c78af883..3e4624477e9f 100644
--- a/lib/crypto/arm/poly1305-glue.c
+++ b/lib/crypto/arm/poly1305-glue.c
@@ -6,7 +6,6 @@
  */
 
 #include <asm/hwcap.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 #include <crypto/internal/poly1305.h>
 #include <linux/cpufeature.h>
@@ -39,9 +38,8 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
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
index fa1e92419000..a4296ffefd05 100644
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
index da75cbdc51d4..df861cc5b9ff 100644
--- a/lib/crypto/arm/sha256.h
+++ b/lib/crypto/arm/sha256.h
@@ -4,7 +4,7 @@
  *
  * Copyright 2025 Google LLC
  */
-#include <asm/neon.h>
+#include <asm/simd.h>
 #include <crypto/internal/simd.h>
 
 asmlinkage void sha256_block_data_order(struct sha256_block_state *state,
@@ -22,12 +22,12 @@ static void sha256_blocks(struct sha256_block_state *state,
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
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
index f147b6490d6c..35b80e7e7db7 100644
--- a/lib/crypto/arm/sha512.h
+++ b/lib/crypto/arm/sha512.h
@@ -6,6 +6,7 @@
  */
 
 #include <asm/neon.h>
+#include <asm/simd.h>
 #include <crypto/internal/simd.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
@@ -20,9 +21,8 @@ static void sha512_blocks(struct sha512_block_state *state,
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_neon) && likely(crypto_simd_usable())) {
-		kernel_neon_begin();
-		sha512_block_data_order_neon(state, data, nblocks);
-		kernel_neon_end();
+		scoped_ksimd()
+			sha512_block_data_order_neon(state, data, nblocks);
 	} else {
 		sha512_block_data_order(state, data, nblocks);
 	}
diff --git a/lib/crypto/arm64/chacha-neon-glue.c b/lib/crypto/arm64/chacha-neon-glue.c
index d0188f974ca5..a3d109f0ce1e 100644
--- a/lib/crypto/arm64/chacha-neon-glue.c
+++ b/lib/crypto/arm64/chacha-neon-glue.c
@@ -25,7 +25,6 @@
 #include <linux/module.h>
 
 #include <asm/hwcap.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 
 asmlinkage void chacha_block_xor_neon(const struct chacha_state *state,
@@ -67,9 +66,8 @@ void hchacha_block_arch(const struct chacha_state *state,
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
 EXPORT_SYMBOL(hchacha_block_arch);
@@ -84,9 +82,8 @@ void chacha_crypt_arch(struct chacha_state *state, u8 *dst, const u8 *src,
 	do {
 		unsigned int todo = min_t(unsigned int, bytes, SZ_4K);
 
-		kernel_neon_begin();
-		chacha_doneon(state, dst, src, todo, nrounds);
-		kernel_neon_end();
+		scoped_ksimd()
+			chacha_doneon(state, dst, src, todo, nrounds);
 
 		bytes -= todo;
 		src += todo;
diff --git a/lib/crypto/arm64/poly1305-glue.c b/lib/crypto/arm64/poly1305-glue.c
index 31aea21ce42f..c83ce7d835d9 100644
--- a/lib/crypto/arm64/poly1305-glue.c
+++ b/lib/crypto/arm64/poly1305-glue.c
@@ -6,7 +6,6 @@
  */
 
 #include <asm/hwcap.h>
-#include <asm/neon.h>
 #include <asm/simd.h>
 #include <crypto/internal/poly1305.h>
 #include <linux/cpufeature.h>
@@ -38,9 +37,8 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
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
index f822563538cc..3d0da0045fed 100644
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
index a211966c124a..0a9f9d70bb43 100644
--- a/lib/crypto/arm64/sha256.h
+++ b/lib/crypto/arm64/sha256.h
@@ -4,7 +4,7 @@
  *
  * Copyright 2025 Google LLC
  */
-#include <asm/neon.h>
+#include <asm/simd.h>
 #include <crypto/internal/simd.h>
 #include <linux/cpufeature.h>
 
@@ -27,17 +27,16 @@ static void sha256_blocks(struct sha256_block_state *state,
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
diff --git a/lib/crypto/arm64/sha512.h b/lib/crypto/arm64/sha512.h
index 6abb40b467f2..1b6c3974d553 100644
--- a/lib/crypto/arm64/sha512.h
+++ b/lib/crypto/arm64/sha512.h
@@ -5,7 +5,7 @@
  * Copyright 2025 Google LLC
  */
 
-#include <asm/neon.h>
+#include <asm/simd.h>
 #include <crypto/internal/simd.h>
 #include <linux/cpufeature.h>
 
@@ -25,9 +25,9 @@ static void sha512_blocks(struct sha512_block_state *state,
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
2.51.0.618.g983fd99d29-goog


