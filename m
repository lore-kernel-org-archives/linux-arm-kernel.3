Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936FEC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 22:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bfGdbagUSXiDJ4j5ku1iV4ePDBUGUuTXHdhuPlK/iPo=; b=j1GeF6Kjd1kzFOP/JqhmWUECnP
	V5S92WKqmk7Nr77KfGVYvCoGltSGW691pM+3iRMJwYUDf3AFEG2jU34C/H3osr2RDggsmtxCFPPcb
	a4JYFVzEUgWYw/hY5JEUmiyE0WUns55guv+oaZvtvfdeRUzU+hYc7OicN54AzADR0h3EV82Mq406F
	V78J8BaZXbphbWtq4I9LKHTxgx2uI+UwgiUQG5gPfXCHUxx+S1SwH33qPuiROyIhmSFxubQryT1PE
	1o1B7ABIGiBc1hC3FyqVWdvUsl5gujVchCT8AveGvXj05OtReR3qnXo4WNbx6pm6YCmgh94b7CkV5
	T3ViwS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbxk-00000004ZCw-2YH2;
	Thu, 31 Jul 2025 22:41:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbtt-00000004Yzi-3wgM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 22:37:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61E185C46EC;
	Thu, 31 Jul 2025 22:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD620C4CEEF;
	Thu, 31 Jul 2025 22:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754001445;
	bh=CauOauOILBwmnNP8cXVBP+lwt1iK/V6xZqh8kjU0UhY=;
	h=From:To:Cc:Subject:Date:From;
	b=K7+tEwTjZMEZG8u1bUe43JKuXAPk8C7uvzSGis06SCONoivnAX+iU9vBG9VWKA6yo
	 76s7ibUlhEJf8FPGHfIYf3huexhfVdib84EEVgA9zW7/TtQ2Z6HPJIbES4n0GgHroW
	 8gduKeDV+TDV+2KgSbcA1IHCmJvOGhhEpankhj6//vxgD447Yq2pq0fggZd9z1L/ze
	 LNaQdiQQ/oo5xUy0bQDpNBsSSt1IxTltpspkzNi012n9NGvB4bNiCHXvelKTfcoU4r
	 HQVRt1o0Dy6cvTWhx8T5Kyi5qe9sDmFqfaZp9S0Mv+4MHEQpz3fnV7OiOmowZn2fBw
	 FUmtF3Mghm9qQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] lib/crypto: sha512: Use underlying functions instead of crypto_simd_usable()
Date: Thu, 31 Jul 2025 15:36:51 -0700
Message-ID: <20250731223651.136939-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_153726_048597_4FE41344 
X-CRM114-Status: GOOD (  11.78  )
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

Since sha512_kunit tests the fallback code paths without using
crypto_simd_disabled_for_test, make the SHA-512 code just use the
underlying may_use_simd() and irq_fpu_usable() functions directly
instead of crypto_simd_usable().  This eliminates an unnecessary layer.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm/sha512.h   | 5 ++---
 lib/crypto/arm64/sha512.h | 5 ++---
 lib/crypto/riscv/sha512.h | 4 +---
 lib/crypto/x86/sha512.h   | 4 +---
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/lib/crypto/arm/sha512.h b/lib/crypto/arm/sha512.h
index f147b6490d6cd..cc2447acd5621 100644
--- a/lib/crypto/arm/sha512.h
+++ b/lib/crypto/arm/sha512.h
@@ -2,13 +2,12 @@
 /*
  * arm32-optimized SHA-512 block function
  *
  * Copyright 2025 Google LLC
  */
-
 #include <asm/neon.h>
-#include <crypto/internal/simd.h>
+#include <asm/simd.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
 asmlinkage void sha512_block_data_order(struct sha512_block_state *state,
 					const u8 *data, size_t nblocks);
@@ -17,11 +16,11 @@ asmlinkage void sha512_block_data_order_neon(struct sha512_block_state *state,
 
 static void sha512_blocks(struct sha512_block_state *state,
 			  const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
-	    static_branch_likely(&have_neon) && likely(crypto_simd_usable())) {
+	    static_branch_likely(&have_neon) && likely(may_use_simd())) {
 		kernel_neon_begin();
 		sha512_block_data_order_neon(state, data, nblocks);
 		kernel_neon_end();
 	} else {
 		sha512_block_data_order(state, data, nblocks);
diff --git a/lib/crypto/arm64/sha512.h b/lib/crypto/arm64/sha512.h
index 6abb40b467f2e..7539ea3fef10d 100644
--- a/lib/crypto/arm64/sha512.h
+++ b/lib/crypto/arm64/sha512.h
@@ -2,13 +2,12 @@
 /*
  * arm64-optimized SHA-512 block function
  *
  * Copyright 2025 Google LLC
  */
-
 #include <asm/neon.h>
-#include <crypto/internal/simd.h>
+#include <asm/simd.h>
 #include <linux/cpufeature.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha512_insns);
 
 asmlinkage void sha512_block_data_order(struct sha512_block_state *state,
@@ -19,11 +18,11 @@ asmlinkage size_t __sha512_ce_transform(struct sha512_block_state *state,
 static void sha512_blocks(struct sha512_block_state *state,
 			  const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_sha512_insns) &&
-	    likely(crypto_simd_usable())) {
+	    likely(may_use_simd())) {
 		do {
 			size_t rem;
 
 			kernel_neon_begin();
 			rem = __sha512_ce_transform(state, data, nblocks);
diff --git a/lib/crypto/riscv/sha512.h b/lib/crypto/riscv/sha512.h
index 9d0abede322f7..59dc0294a9a7e 100644
--- a/lib/crypto/riscv/sha512.h
+++ b/lib/crypto/riscv/sha512.h
@@ -9,22 +9,20 @@
  * Author: Jerry Shih <jerry.shih@sifive.com>
  */
 
 #include <asm/simd.h>
 #include <asm/vector.h>
-#include <crypto/internal/simd.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_extensions);
 
 asmlinkage void sha512_transform_zvknhb_zvkb(struct sha512_block_state *state,
 					     const u8 *data, size_t nblocks);
 
 static void sha512_blocks(struct sha512_block_state *state,
 			  const u8 *data, size_t nblocks)
 {
-	if (static_branch_likely(&have_extensions) &&
-	    likely(crypto_simd_usable())) {
+	if (static_branch_likely(&have_extensions) && likely(may_use_simd())) {
 		kernel_vector_begin();
 		sha512_transform_zvknhb_zvkb(state, data, nblocks);
 		kernel_vector_end();
 	} else {
 		sha512_blocks_generic(state, data, nblocks);
diff --git a/lib/crypto/x86/sha512.h b/lib/crypto/x86/sha512.h
index c13503d9d57d9..be2c8fc122469 100644
--- a/lib/crypto/x86/sha512.h
+++ b/lib/crypto/x86/sha512.h
@@ -2,24 +2,22 @@
 /*
  * x86-optimized SHA-512 block function
  *
  * Copyright 2025 Google LLC
  */
-
 #include <asm/fpu/api.h>
-#include <crypto/internal/simd.h>
 #include <linux/static_call.h>
 
 DEFINE_STATIC_CALL(sha512_blocks_x86, sha512_blocks_generic);
 
 #define DEFINE_X86_SHA512_FN(c_fn, asm_fn)                                 \
 	asmlinkage void asm_fn(struct sha512_block_state *state,           \
 			       const u8 *data, size_t nblocks);            \
 	static void c_fn(struct sha512_block_state *state, const u8 *data, \
 			 size_t nblocks)                                   \
 	{                                                                  \
-		if (likely(crypto_simd_usable())) {                        \
+		if (likely(irq_fpu_usable())) {                            \
 			kernel_fpu_begin();                                \
 			asm_fn(state, data, nblocks);                      \
 			kernel_fpu_end();                                  \
 		} else {                                                   \
 			sha512_blocks_generic(state, data, nblocks);       \

base-commit: d6084bb815c453de27af8071a23163a711586a6c
-- 
2.50.1


