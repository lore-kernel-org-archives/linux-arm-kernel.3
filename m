Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C570CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A497HGKDloVYG5gC7jS2vq7iHIvtKfWK7mIL1C6gMkY=; b=cOxcP0FfztONxe3d6IoE2/iYBW
	2JbcT+dRJDqB4P0+u0KcMgCXIT1ovkdikvWuKJ+Oi1WCyKj/tVOj3Dk1bD1gmgtaw000pmYCrhqv9
	Ndn+Iz6wQYV0f5+lXz4gxdwQKybKO9bV94uBgxVYi1gli6rXEmbJTIwefWlDJ+pNnSVJAmZTgLqCL
	wakQZS/i5S9UCaPn5ihG79Xe7X9Mtw0Gd+d1jGBMdBxQwKJ6yeMTFQJg37tmT+AWWwIZgeSIOR8fI
	f9Ozl7xUhUrzt6KrcVv71lsg2Dezu7ckPA3wNA1W/1/XpJ0z27EjHeLe98Esh3Co7cpj73vgTXhCo
	UufyigdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urKDF-0000000GLhR-110T;
	Wed, 27 Aug 2025 17:45:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHrZ-0000000FsiG-1ddT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:15:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 528DF43722;
	Wed, 27 Aug 2025 15:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55D6C4CEF0;
	Wed, 27 Aug 2025 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756307701;
	bh=x/NuAW84/cQ0t0p3ZfjB/C473ct6iM59qATu6l/hJrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dg+da+KHJqXKeYUE+nRoDEcrPOzL+VJhQ0dFzQJ2Ry8ITujl+oK7WFeRLyqc57b/G
	 YIbwQjCptgz57cVQrciuVhv19wrndQBmUAS/pNgT5Vz4skqNMo3STV7T3QJxR/GjaK
	 X54SecwHkyqiP3507WtRIPDs8OXukZhl/ztOHDIVSZpMsLyXCrcCWW7kKBrJ5kAOX3
	 0U/htlHBHgNnoe2MLCZ4DLptCsRbl1Ttzs3sNT4F90QWwjuIdtBentGz31PIuMZ4wt
	 qgspCCosrv6DKtr27Vigg7ppRZCODR53Gb1WuKnIWAGUjr9ul0ECPgTUtRAxnxv4OL
	 hT+GLbBczKjfw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 10/12] lib/crypto: blake2s: Move generic code into blake2s.c
Date: Wed, 27 Aug 2025 08:11:29 -0700
Message-ID: <20250827151131.27733-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827151131.27733-1-ebiggers@kernel.org>
References: <20250827151131.27733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_081501_500552_3D3F9DAA 
X-CRM114-Status: GOOD (  17.97  )
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

Move blake2s_compress_generic() from blake2s-generic.c to blake2s.c.

For now it's still guarded by CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC, but
this prepares for changing it to a 'static __maybe_unused' function and
just using the compiler to automatically decide its inclusion.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/Makefile          |   1 -
 lib/crypto/blake2s-generic.c | 111 -----------------------------------
 lib/crypto/blake2s.c         |  94 +++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+), 112 deletions(-)
 delete mode 100644 lib/crypto/blake2s-generic.c

diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index eeddb993da033..be45dcfb8969b 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -30,11 +30,10 @@ libarc4-y					:= arc4.o
 obj-$(CONFIG_CRYPTO_LIB_GF128MUL)		+= gf128mul.o
 
 # blake2s is used by the /dev/random driver which is always builtin
 obj-y						+= libblake2s.o
 libblake2s-y					:= blake2s.o
-libblake2s-$(CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC)	+= blake2s-generic.o
 
 ################################################################################
 
 # chacha20_block() is used by the /dev/random driver which is always builtin
 obj-y += chacha-block-generic.o
diff --git a/lib/crypto/blake2s-generic.c b/lib/crypto/blake2s-generic.c
deleted file mode 100644
index 9828176a2efec..0000000000000
--- a/lib/crypto/blake2s-generic.c
+++ /dev/null
@@ -1,111 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR MIT
-/*
- * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
- *
- * This is an implementation of the BLAKE2s hash and PRF functions.
- *
- * Information: https://blake2.net/
- *
- */
-
-#include <crypto/internal/blake2s.h>
-#include <linux/bug.h>
-#include <linux/export.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/unaligned.h>
-
-static const u8 blake2s_sigma[10][16] = {
-	{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
-	{ 14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3 },
-	{ 11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4 },
-	{ 7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8 },
-	{ 9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13 },
-	{ 2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9 },
-	{ 12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11 },
-	{ 13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10 },
-	{ 6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5 },
-	{ 10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0 },
-};
-
-static inline void blake2s_increment_counter(struct blake2s_state *state,
-					     const u32 inc)
-{
-	state->t[0] += inc;
-	state->t[1] += (state->t[0] < inc);
-}
-
-void blake2s_compress(struct blake2s_state *state, const u8 *block,
-		      size_t nblocks, const u32 inc)
-		      __weak __alias(blake2s_compress_generic);
-
-void blake2s_compress_generic(struct blake2s_state *state, const u8 *block,
-			      size_t nblocks, const u32 inc)
-{
-	u32 m[16];
-	u32 v[16];
-	int i;
-
-	WARN_ON(IS_ENABLED(DEBUG) &&
-		(nblocks > 1 && inc != BLAKE2S_BLOCK_SIZE));
-
-	while (nblocks > 0) {
-		blake2s_increment_counter(state, inc);
-		memcpy(m, block, BLAKE2S_BLOCK_SIZE);
-		le32_to_cpu_array(m, ARRAY_SIZE(m));
-		memcpy(v, state->h, 32);
-		v[ 8] = BLAKE2S_IV0;
-		v[ 9] = BLAKE2S_IV1;
-		v[10] = BLAKE2S_IV2;
-		v[11] = BLAKE2S_IV3;
-		v[12] = BLAKE2S_IV4 ^ state->t[0];
-		v[13] = BLAKE2S_IV5 ^ state->t[1];
-		v[14] = BLAKE2S_IV6 ^ state->f[0];
-		v[15] = BLAKE2S_IV7 ^ state->f[1];
-
-#define G(r, i, a, b, c, d) do { \
-	a += b + m[blake2s_sigma[r][2 * i + 0]]; \
-	d = ror32(d ^ a, 16); \
-	c += d; \
-	b = ror32(b ^ c, 12); \
-	a += b + m[blake2s_sigma[r][2 * i + 1]]; \
-	d = ror32(d ^ a, 8); \
-	c += d; \
-	b = ror32(b ^ c, 7); \
-} while (0)
-
-#define ROUND(r) do { \
-	G(r, 0, v[0], v[ 4], v[ 8], v[12]); \
-	G(r, 1, v[1], v[ 5], v[ 9], v[13]); \
-	G(r, 2, v[2], v[ 6], v[10], v[14]); \
-	G(r, 3, v[3], v[ 7], v[11], v[15]); \
-	G(r, 4, v[0], v[ 5], v[10], v[15]); \
-	G(r, 5, v[1], v[ 6], v[11], v[12]); \
-	G(r, 6, v[2], v[ 7], v[ 8], v[13]); \
-	G(r, 7, v[3], v[ 4], v[ 9], v[14]); \
-} while (0)
-		ROUND(0);
-		ROUND(1);
-		ROUND(2);
-		ROUND(3);
-		ROUND(4);
-		ROUND(5);
-		ROUND(6);
-		ROUND(7);
-		ROUND(8);
-		ROUND(9);
-
-#undef G
-#undef ROUND
-
-		for (i = 0; i < 8; ++i)
-			state->h[i] ^= v[i] ^ v[i + 8];
-
-		block += BLAKE2S_BLOCK_SIZE;
-		--nblocks;
-	}
-}
-
-EXPORT_SYMBOL(blake2s_compress_generic);
diff --git a/lib/crypto/blake2s.c b/lib/crypto/blake2s.c
index 51f2dd7a38a4e..b5b75ade46588 100644
--- a/lib/crypto/blake2s.c
+++ b/lib/crypto/blake2s.c
@@ -14,10 +14,104 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
+#ifdef CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC
+static const u8 blake2s_sigma[10][16] = {
+	{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
+	{ 14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3 },
+	{ 11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4 },
+	{ 7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8 },
+	{ 9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13 },
+	{ 2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9 },
+	{ 12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11 },
+	{ 13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10 },
+	{ 6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5 },
+	{ 10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0 },
+};
+
+static inline void blake2s_increment_counter(struct blake2s_state *state,
+					     const u32 inc)
+{
+	state->t[0] += inc;
+	state->t[1] += (state->t[0] < inc);
+}
+
+void blake2s_compress(struct blake2s_state *state, const u8 *block,
+		      size_t nblocks, const u32 inc)
+		      __weak __alias(blake2s_compress_generic);
+
+void blake2s_compress_generic(struct blake2s_state *state, const u8 *block,
+			      size_t nblocks, const u32 inc)
+{
+	u32 m[16];
+	u32 v[16];
+	int i;
+
+	WARN_ON(IS_ENABLED(DEBUG) &&
+		(nblocks > 1 && inc != BLAKE2S_BLOCK_SIZE));
+
+	while (nblocks > 0) {
+		blake2s_increment_counter(state, inc);
+		memcpy(m, block, BLAKE2S_BLOCK_SIZE);
+		le32_to_cpu_array(m, ARRAY_SIZE(m));
+		memcpy(v, state->h, 32);
+		v[ 8] = BLAKE2S_IV0;
+		v[ 9] = BLAKE2S_IV1;
+		v[10] = BLAKE2S_IV2;
+		v[11] = BLAKE2S_IV3;
+		v[12] = BLAKE2S_IV4 ^ state->t[0];
+		v[13] = BLAKE2S_IV5 ^ state->t[1];
+		v[14] = BLAKE2S_IV6 ^ state->f[0];
+		v[15] = BLAKE2S_IV7 ^ state->f[1];
+
+#define G(r, i, a, b, c, d) do { \
+	a += b + m[blake2s_sigma[r][2 * i + 0]]; \
+	d = ror32(d ^ a, 16); \
+	c += d; \
+	b = ror32(b ^ c, 12); \
+	a += b + m[blake2s_sigma[r][2 * i + 1]]; \
+	d = ror32(d ^ a, 8); \
+	c += d; \
+	b = ror32(b ^ c, 7); \
+} while (0)
+
+#define ROUND(r) do { \
+	G(r, 0, v[0], v[ 4], v[ 8], v[12]); \
+	G(r, 1, v[1], v[ 5], v[ 9], v[13]); \
+	G(r, 2, v[2], v[ 6], v[10], v[14]); \
+	G(r, 3, v[3], v[ 7], v[11], v[15]); \
+	G(r, 4, v[0], v[ 5], v[10], v[15]); \
+	G(r, 5, v[1], v[ 6], v[11], v[12]); \
+	G(r, 6, v[2], v[ 7], v[ 8], v[13]); \
+	G(r, 7, v[3], v[ 4], v[ 9], v[14]); \
+} while (0)
+		ROUND(0);
+		ROUND(1);
+		ROUND(2);
+		ROUND(3);
+		ROUND(4);
+		ROUND(5);
+		ROUND(6);
+		ROUND(7);
+		ROUND(8);
+		ROUND(9);
+
+#undef G
+#undef ROUND
+
+		for (i = 0; i < 8; ++i)
+			state->h[i] ^= v[i] ^ v[i + 8];
+
+		block += BLAKE2S_BLOCK_SIZE;
+		--nblocks;
+	}
+}
+EXPORT_SYMBOL(blake2s_compress_generic);
+#endif /* CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC */
+
 static inline void blake2s_set_lastblock(struct blake2s_state *state)
 {
 	state->f[0] = -1;
 }
 
-- 
2.50.1


