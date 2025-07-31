Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25399C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 22:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EPtMA5qN4jyflyfwgOhCXKe6FnRkG/RjUYcJSXbsCZc=; b=Lgv61MOeNbPa/uCng9rw7QoWXv
	d4BtKB/4CAFbKYP4laBJuQ+tRVLluE+i2mLlJKV8NaRQ189V/7U0UJiV3csdpOVupBZX5Efi+pL7i
	xp4blSNDLk2WhMs3MYS4eQLKHmx3cxiwF5sB28/AaIk4o961vUauO7u5t2FnhuDTwLlxrm0/A7+cQ
	9dlr/osVYH2ow22Q6ia7URkxYwBxfnMAQQsyXifdg3zviyXzkv6EB0qqOr+hx+TSOwHbAylvc7yPg
	rJP+gsUfjY2K7RYAWn/kvlbPbGxb1eg9foyCWkRrXFb3M1Y8v0CASHgGjkR2ColzCwbjVPKOgKee2
	Pnj6YbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbvB-00000004Z2Z-3ALU;
	Thu, 31 Jul 2025 22:38:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhbsc-00000004Ywr-323s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 22:36:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70D1644EEC;
	Thu, 31 Jul 2025 22:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8143C4CEEF;
	Thu, 31 Jul 2025 22:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754001364;
	bh=xwxurTBqcnXKRsLc5f2dN9h8euuvPUjfi5dm2FHbjIk=;
	h=From:To:Cc:Subject:Date:From;
	b=YzQJG5UMfzF+ATMY24BUW6wn3774F3EtmgJQo0rinEbdekwWXdSZGjCqZcqF29W91
	 OxMYNJyKEpzPjX0QPVpA9tIDJyqYwKR8J5LeJM93RlFSopywr9RV0XVsiYGiKjPbV9
	 SibuKh+Z3T6x2BD8mmbmETy5tH/KTqv2PGai5qrx76ZQDdm2P7lfxWKqpVNS8gvkCe
	 LjFKlfeqv6Iz79i79w+6XKBp/pnqX966XiFGgap4okjfOTmwZHsA8foR1NPFhnUzpk
	 1CtJ5Ig13YwfbK4/Dghx80Ye09eA7qhfOVYbfA3oihC6VbKnc+qRrgz72cONQp5qgM
	 rANWQ4PjNe8kA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] lib/crypto: sha256: Use underlying functions instead of crypto_simd_usable()
Date: Thu, 31 Jul 2025 15:35:10 -0700
Message-ID: <20250731223510.136650-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_153606_817088_950DACB8 
X-CRM114-Status: GOOD (  12.88  )
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

Since sha256_kunit tests the fallback code paths without using
crypto_simd_disabled_for_test, make the SHA-256 code just use the
underlying may_use_simd() and irq_fpu_usable() functions directly
instead of crypto_simd_usable().  This eliminates an unnecessary layer.

While doing this, also add likely() annotations, and fix a minor
inconsistency where the static keys in the sha256.h files were in a
different place than in the corresponding sha1.h and sha512.h files.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm/sha256.h   | 10 +++++-----
 lib/crypto/arm64/sha256.h | 10 +++++-----
 lib/crypto/riscv/sha256.h |  8 ++++----
 lib/crypto/x86/sha256.h   |  3 +--
 4 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/lib/crypto/arm/sha256.h b/lib/crypto/arm/sha256.h
index da75cbdc51d41..eab713e650f33 100644
--- a/lib/crypto/arm/sha256.h
+++ b/lib/crypto/arm/sha256.h
@@ -3,27 +3,27 @@
  * SHA-256 optimized for ARM
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/neon.h>
-#include <crypto/internal/simd.h>
+#include <asm/simd.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
 
 asmlinkage void sha256_block_data_order(struct sha256_block_state *state,
 					const u8 *data, size_t nblocks);
 asmlinkage void sha256_block_data_order_neon(struct sha256_block_state *state,
 					     const u8 *data, size_t nblocks);
 asmlinkage void sha256_ce_transform(struct sha256_block_state *state,
 				    const u8 *data, size_t nblocks);
 
-static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
-static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
-
 static void sha256_blocks(struct sha256_block_state *state,
 			  const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
-	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
+	    static_branch_likely(&have_neon) && likely(may_use_simd())) {
 		kernel_neon_begin();
 		if (static_branch_likely(&have_ce))
 			sha256_ce_transform(state, data, nblocks);
 		else
 			sha256_block_data_order_neon(state, data, nblocks);
diff --git a/lib/crypto/arm64/sha256.h b/lib/crypto/arm64/sha256.h
index a211966c124a9..d95f1077c32bd 100644
--- a/lib/crypto/arm64/sha256.h
+++ b/lib/crypto/arm64/sha256.h
@@ -3,28 +3,28 @@
  * SHA-256 optimized for ARM64
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/neon.h>
-#include <crypto/internal/simd.h>
+#include <asm/simd.h>
 #include <linux/cpufeature.h>
 
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
+
 asmlinkage void sha256_block_data_order(struct sha256_block_state *state,
 					const u8 *data, size_t nblocks);
 asmlinkage void sha256_block_neon(struct sha256_block_state *state,
 				  const u8 *data, size_t nblocks);
 asmlinkage size_t __sha256_ce_transform(struct sha256_block_state *state,
 					const u8 *data, size_t nblocks);
 
-static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
-static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
-
 static void sha256_blocks(struct sha256_block_state *state,
 			  const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
-	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
+	    static_branch_likely(&have_neon) && likely(may_use_simd())) {
 		if (static_branch_likely(&have_ce)) {
 			do {
 				size_t rem;
 
 				kernel_neon_begin();
diff --git a/lib/crypto/riscv/sha256.h b/lib/crypto/riscv/sha256.h
index c0f79c18f1199..f36f68d2e88cc 100644
--- a/lib/crypto/riscv/sha256.h
+++ b/lib/crypto/riscv/sha256.h
@@ -7,23 +7,23 @@
  *
  * Copyright (C) 2023 SiFive, Inc.
  * Author: Jerry Shih <jerry.shih@sifive.com>
  */
 
+#include <asm/simd.h>
 #include <asm/vector.h>
-#include <crypto/internal/simd.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_extensions);
 
 asmlinkage void
 sha256_transform_zvknha_or_zvknhb_zvkb(struct sha256_block_state *state,
 				       const u8 *data, size_t nblocks);
 
-static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_extensions);
-
 static void sha256_blocks(struct sha256_block_state *state,
 			  const u8 *data, size_t nblocks)
 {
-	if (static_branch_likely(&have_extensions) && crypto_simd_usable()) {
+	if (static_branch_likely(&have_extensions) && likely(may_use_simd())) {
 		kernel_vector_begin();
 		sha256_transform_zvknha_or_zvknhb_zvkb(state, data, nblocks);
 		kernel_vector_end();
 	} else {
 		sha256_blocks_generic(state, data, nblocks);
diff --git a/lib/crypto/x86/sha256.h b/lib/crypto/x86/sha256.h
index 669bc06538b67..c852396ef3190 100644
--- a/lib/crypto/x86/sha256.h
+++ b/lib/crypto/x86/sha256.h
@@ -3,22 +3,21 @@
  * SHA-256 optimized for x86_64
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/fpu/api.h>
-#include <crypto/internal/simd.h>
 #include <linux/static_call.h>
 
 DEFINE_STATIC_CALL(sha256_blocks_x86, sha256_blocks_generic);
 
 #define DEFINE_X86_SHA256_FN(c_fn, asm_fn)                                 \
 	asmlinkage void asm_fn(struct sha256_block_state *state,           \
 			       const u8 *data, size_t nblocks);            \
 	static void c_fn(struct sha256_block_state *state, const u8 *data, \
 			 size_t nblocks)                                   \
 	{                                                                  \
-		if (likely(crypto_simd_usable())) {                        \
+		if (likely(irq_fpu_usable())) {                            \
 			kernel_fpu_begin();                                \
 			asm_fn(state, data, nblocks);                      \
 			kernel_fpu_end();                                  \
 		} else {                                                   \
 			sha256_blocks_generic(state, data, nblocks);       \

base-commit: d6084bb815c453de27af8071a23163a711586a6c
-- 
2.50.1


