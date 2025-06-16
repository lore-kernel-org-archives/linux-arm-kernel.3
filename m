Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11256C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B++LeiBo+t+02hDZvul2fM+JP/E4Jj8nodXIVGUEZRg=; b=wulzncNwNH32TfvZqtVMZzuulk
	8xz0YBsPjznad75CrrPY16Q5eoev6GAqbdoLnD9ye9OgMZua/Cg7ZQdLXcFOveqG1taijAljjzOHw
	p4PyPRZdd93baOniqbaLyMzxvgsgCoj4FsP38V0ecJxVSTpf4lN2xymCvRL7hre9L2w3MkgAD/0g+
	5hxas69du92tvTBXvvAV0fifRXC0z+TOpho9b0saC+0qRozLfr15b3VaPiz3KHkXvZp61QqOgGrkL
	dGniZuj/D2fyeXr1Xk+eMKXiNhivho9QX7iL+yAI71/atUjHFWEzjKjdcHABQD8yd+ayzbW+39GGh
	uz1h+BAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzh1-00000003AM4-1KZT;
	Mon, 16 Jun 2025 02:35:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyrC-000000035a9-449T;
	Mon, 16 Jun 2025 01:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE7104ABFA;
	Mon, 16 Jun 2025 01:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439AFC4CEF3;
	Mon, 16 Jun 2025 01:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750038114;
	bh=XAtsYYtG2KpuY5gFTAsb8Yxcn2gtUX66YPCnWHaoJ98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nx+FYgUEH6E+AYKJ6nBcSYZU+XExN+BDS+ZxwdrrzLoMekdIAsIA4mIP5DZoiMyYY
	 V00K1imPFQVuvB1MoJktdor7omdKe9A2RcN0AwXWzzPOoICpaq+p1r++s9YdpiajAK
	 PoAyN8pARdiYaKODWlUhFc4VeAPX40bfvvGCp0syLZ1d6lJEaFwQqCIpUQyz6Rr6VR
	 txi1JjphzXLegJ9BZZoGNrOiT2daX1I7XqDWQruwx6yFxiTN5qrAkf7UhuXVJHEYF0
	 U/G1il97rusArJutl2PnwX4gPiHselNnMrJL//d+PxIkbc6WpyGUcltOJZNyl06Jzr
	 fuEu28xK0FbdA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 03/17] lib/crypto/sha512: add HMAC-SHA384 and HMAC-SHA512 support
Date: Sun, 15 Jun 2025 18:40:05 -0700
Message-ID: <20250616014019.415791-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616014019.415791-1-ebiggers@kernel.org>
References: <20250616014019.415791-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_184155_059650_6D292669 
X-CRM114-Status: GOOD (  22.74  )
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

From: Eric Biggers <ebiggers@google.com>

Since HMAC support is commonly needed and is fairly simple, include it
as a first-class citizen of the SHA-512 library.

The API supports both incremental and one-shot computation, and either
preparing the key ahead of time or just using a raw key.  The
implementation is much more streamlined than crypto/hmac.c.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/crypto/sha2.h | 222 ++++++++++++++++++++++++++++++++++++++++++
 lib/crypto/Kconfig    |   5 +-
 lib/crypto/sha512.c   | 141 ++++++++++++++++++++++++++-
 3 files changed, 364 insertions(+), 4 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index f2a6e84b28400..36a9dab805be7 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -145,10 +145,26 @@ struct __sha512_ctx {
 	u64 bytecount_hi;
 	u8 buf[SHA512_BLOCK_SIZE] __aligned(__alignof__(__be64));
 };
 void __sha512_update(struct __sha512_ctx *ctx, const u8 *data, size_t len);
 
+/*
+ * HMAC key and message context structs, shared by HMAC-SHA384 and HMAC-SHA512.
+ * The hmac_sha384_* and hmac_sha512_* structs wrap this one so that the API has
+ * proper typing and doesn't allow mixing the functions arbitrarily.
+ */
+struct __hmac_sha512_key {
+	struct sha512_block_state istate;
+	struct sha512_block_state ostate;
+};
+struct __hmac_sha512_ctx {
+	struct __sha512_ctx sha_ctx;
+	struct sha512_block_state ostate;
+};
+void __hmac_sha512_init(struct __hmac_sha512_ctx *ctx,
+			const struct __hmac_sha512_key *key);
+
 /**
  * struct sha384_ctx - Context for hashing a message with SHA-384
  * @ctx: private
  */
 struct sha384_ctx {
@@ -200,10 +216,113 @@ void sha384_final(struct sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE]);
  *
  * Context: Any context.
  */
 void sha384(const u8 *data, size_t len, u8 out[SHA384_DIGEST_SIZE]);
 
+/**
+ * struct hmac_sha384_key - Prepared key for HMAC-SHA384
+ * @key: private
+ */
+struct hmac_sha384_key {
+	struct __hmac_sha512_key key;
+};
+
+/**
+ * struct hmac_sha384_ctx - Context for computing HMAC-SHA384 of a message
+ * @ctx: private
+ */
+struct hmac_sha384_ctx {
+	struct __hmac_sha512_ctx ctx;
+};
+
+/**
+ * hmac_sha384_preparekey() - Prepare a key for HMAC-SHA384
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-SHA384 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_sha384_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_sha384_preparekey(struct hmac_sha384_key *key,
+			    const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha384_init() - Initialize a HMAC-SHA384 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_sha384() instead.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha384_init(struct hmac_sha384_ctx *ctx,
+				    const struct hmac_sha384_key *key)
+{
+	__hmac_sha512_init(&ctx->ctx, &key->key);
+}
+
+/**
+ * hmac_sha384_update() - Update a HMAC-SHA384 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha384_update(struct hmac_sha384_ctx *ctx,
+				      const u8 *data, size_t data_len)
+{
+	__sha512_update(&ctx->ctx.sha_ctx, data, data_len);
+}
+
+/**
+ * hmac_sha384_final() - Finish computing a HMAC-SHA384 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-SHA384 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_sha384_final(struct hmac_sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE]);
+
+/**
+ * hmac_sha384() - Compute HMAC-SHA384 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA384 value
+ *
+ * If you're using the key only once, consider using hmac_sha384_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_sha384(const struct hmac_sha384_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA384_DIGEST_SIZE]);
+
+/**
+ * hmac_sha384_usingrawkey() - Compute HMAC-SHA384 in one shot, using a raw key
+ * @raw_key: the raw HMAC-SHA384 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA384 value
+ *
+ * If you're using the key multiple times, prefer to use
+ * hmac_sha384_preparekey() followed by multiple calls to hmac_sha384() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha384_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA384_DIGEST_SIZE]);
+
 /**
  * struct sha512_ctx - Context for hashing a message with SHA-512
  * @ctx: private
  */
 struct sha512_ctx {
@@ -255,6 +374,109 @@ void sha512_final(struct sha512_ctx *ctx, u8 out[SHA512_DIGEST_SIZE]);
  *
  * Context: Any context.
  */
 void sha512(const u8 *data, size_t len, u8 out[SHA512_DIGEST_SIZE]);
 
+/**
+ * struct hmac_sha512_key - Prepared key for HMAC-SHA512
+ * @key: private
+ */
+struct hmac_sha512_key {
+	struct __hmac_sha512_key key;
+};
+
+/**
+ * struct hmac_sha512_ctx - Context for computing HMAC-SHA512 of a message
+ * @ctx: private
+ */
+struct hmac_sha512_ctx {
+	struct __hmac_sha512_ctx ctx;
+};
+
+/**
+ * hmac_sha512_preparekey() - Prepare a key for HMAC-SHA512
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-SHA512 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_sha512_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_sha512_preparekey(struct hmac_sha512_key *key,
+			    const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha512_init() - Initialize a HMAC-SHA512 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_sha512() instead.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha512_init(struct hmac_sha512_ctx *ctx,
+				    const struct hmac_sha512_key *key)
+{
+	__hmac_sha512_init(&ctx->ctx, &key->key);
+}
+
+/**
+ * hmac_sha512_update() - Update a HMAC-SHA512 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha512_update(struct hmac_sha512_ctx *ctx,
+				      const u8 *data, size_t data_len)
+{
+	__sha512_update(&ctx->ctx.sha_ctx, data, data_len);
+}
+
+/**
+ * hmac_sha512_final() - Finish computing a HMAC-SHA512 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-SHA512 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_sha512_final(struct hmac_sha512_ctx *ctx, u8 out[SHA512_DIGEST_SIZE]);
+
+/**
+ * hmac_sha512() - Compute HMAC-SHA512 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA512 value
+ *
+ * If you're using the key only once, consider using hmac_sha512_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_sha512(const struct hmac_sha512_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA512_DIGEST_SIZE]);
+
+/**
+ * hmac_sha512_usingrawkey() - Compute HMAC-SHA512 in one shot, using a raw key
+ * @raw_key: the raw HMAC-SHA512 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA512 value
+ *
+ * If you're using the key multiple times, prefer to use
+ * hmac_sha512_preparekey() followed by multiple calls to hmac_sha512() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha512_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA512_DIGEST_SIZE]);
+
 #endif /* _CRYPTO_SHA2_H */
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 2d295c0e0f792..d1bee3787eb3c 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -168,12 +168,13 @@ config CRYPTO_LIB_SHA256_GENERIC
 	  enabled, this implementation serves the users of CRYPTO_LIB_SHA256.
 
 config CRYPTO_LIB_SHA512
 	tristate
 	help
-	  The SHA-384 and SHA-512 library functions.  Select this if your module
-	  uses any of these functions from <crypto/sha2.h>.
+	  The SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512 library functions.
+	  Select this if your module uses any of these functions from
+	  <crypto/sha2.h>.
 
 config CRYPTO_LIB_SHA512_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA512 && !UML
 
diff --git a/lib/crypto/sha512.c b/lib/crypto/sha512.c
index ad70444e80a80..596482ac4ac89 100644
--- a/lib/crypto/sha512.c
+++ b/lib/crypto/sha512.c
@@ -1,20 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * SHA-384 and SHA-512 library functions
+ * SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512 library functions
  *
  * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
  * Copyright 2025 Google LLC
  */
 
+#include <crypto/hmac.h>
 #include <crypto/internal/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/wordpart.h>
 
 static const u64 sha512_K[80] = {
 	0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
 	0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
 	0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL, 0xd807aa98a3030242ULL,
@@ -243,10 +245,145 @@ void sha512(const u8 *data, size_t len, u8 out[SHA512_DIGEST_SIZE])
 	sha512_update(&ctx, data, len);
 	sha512_final(&ctx, out);
 }
 EXPORT_SYMBOL_GPL(sha512);
 
+static void __hmac_sha512_preparekey(struct __hmac_sha512_key *key,
+				     const u8 *raw_key, size_t raw_key_len,
+				     const struct sha512_block_state *iv)
+{
+	union {
+		unsigned long w[SHA512_BLOCK_SIZE / sizeof(unsigned long)];
+		u8 b[SHA512_BLOCK_SIZE];
+	} derived_key = { 0 };
+
+	if (unlikely(raw_key_len > SHA512_BLOCK_SIZE)) {
+		if (iv == &sha384_iv)
+			sha384(raw_key, raw_key_len, derived_key.b);
+		else
+			sha512(raw_key, raw_key_len, derived_key.b);
+	} else {
+		memcpy(derived_key.b, raw_key, raw_key_len);
+	}
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_IPAD_VALUE);
+	key->istate = *iv;
+	sha512_blocks(&key->istate, derived_key.b, 1);
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_OPAD_VALUE ^
+						HMAC_IPAD_VALUE);
+	key->ostate = *iv;
+	sha512_blocks(&key->ostate, derived_key.b, 1);
+
+	memzero_explicit(&derived_key, sizeof(derived_key));
+}
+
+void hmac_sha384_preparekey(struct hmac_sha384_key *key,
+			    const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha512_preparekey(&key->key, raw_key, raw_key_len, &sha384_iv);
+}
+EXPORT_SYMBOL_GPL(hmac_sha384_preparekey);
+
+void hmac_sha512_preparekey(struct hmac_sha512_key *key,
+			    const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha512_preparekey(&key->key, raw_key, raw_key_len, &sha512_iv);
+}
+EXPORT_SYMBOL_GPL(hmac_sha512_preparekey);
+
+void __hmac_sha512_init(struct __hmac_sha512_ctx *ctx,
+			const struct __hmac_sha512_key *key)
+{
+	__sha512_init(&ctx->sha_ctx, &key->istate, SHA512_BLOCK_SIZE);
+	ctx->ostate = key->ostate;
+}
+EXPORT_SYMBOL_GPL(__hmac_sha512_init);
+
+static void __hmac_sha512_final(struct __hmac_sha512_ctx *ctx,
+				u8 *out, size_t digest_size)
+{
+	/* Generate the padded input for the outer hash in ctx->sha_ctx.buf. */
+	__sha512_final(&ctx->sha_ctx, ctx->sha_ctx.buf, digest_size);
+	memset(&ctx->sha_ctx.buf[digest_size], 0,
+	       SHA512_BLOCK_SIZE - digest_size);
+	ctx->sha_ctx.buf[digest_size] = 0x80;
+	*(__be32 *)&ctx->sha_ctx.buf[SHA512_BLOCK_SIZE - 4] =
+		cpu_to_be32(8 * (SHA512_BLOCK_SIZE + digest_size));
+
+	/* Compute the outer hash, which gives the HMAC value. */
+	sha512_blocks(&ctx->ostate, ctx->sha_ctx.buf, 1);
+	for (size_t i = 0; i < digest_size; i += 8)
+		put_unaligned_be64(ctx->ostate.h[i / 8], out + i);
+
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+
+void hmac_sha384_final(struct hmac_sha384_ctx *ctx,
+		       u8 out[SHA384_DIGEST_SIZE])
+{
+	__hmac_sha512_final(&ctx->ctx, out, SHA384_DIGEST_SIZE);
+}
+EXPORT_SYMBOL_GPL(hmac_sha384_final);
+
+void hmac_sha512_final(struct hmac_sha512_ctx *ctx,
+		       u8 out[SHA512_DIGEST_SIZE])
+{
+	__hmac_sha512_final(&ctx->ctx, out, SHA512_DIGEST_SIZE);
+}
+EXPORT_SYMBOL_GPL(hmac_sha512_final);
+
+void hmac_sha384(const struct hmac_sha384_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA384_DIGEST_SIZE])
+{
+	struct hmac_sha384_ctx ctx;
+
+	hmac_sha384_init(&ctx, key);
+	hmac_sha384_update(&ctx, data, data_len);
+	hmac_sha384_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha384);
+
+void hmac_sha512(const struct hmac_sha512_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA512_DIGEST_SIZE])
+{
+	struct hmac_sha512_ctx ctx;
+
+	hmac_sha512_init(&ctx, key);
+	hmac_sha512_update(&ctx, data, data_len);
+	hmac_sha512_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha512);
+
+void hmac_sha384_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA384_DIGEST_SIZE])
+{
+	struct hmac_sha384_key key;
+
+	hmac_sha384_preparekey(&key, raw_key, raw_key_len);
+	hmac_sha384(&key, data, data_len, out);
+
+	memzero_explicit(&key, sizeof(key));
+}
+EXPORT_SYMBOL_GPL(hmac_sha384_usingrawkey);
+
+void hmac_sha512_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA512_DIGEST_SIZE])
+{
+	struct hmac_sha512_key key;
+
+	hmac_sha512_preparekey(&key, raw_key, raw_key_len);
+	hmac_sha512(&key, data, data_len, out);
+
+	memzero_explicit(&key, sizeof(key));
+}
+EXPORT_SYMBOL_GPL(hmac_sha512_usingrawkey);
+
 #ifdef sha512_mod_init_arch
 static int __init sha512_mod_init(void)
 {
 	sha512_mod_init_arch();
 	return 0;
@@ -257,7 +394,7 @@ static void __exit sha512_mod_exit(void)
 {
 }
 module_exit(sha512_mod_exit);
 #endif
 
-MODULE_DESCRIPTION("SHA-384 and SHA-512 library functions");
+MODULE_DESCRIPTION("SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512 library functions");
 MODULE_LICENSE("GPL");
-- 
2.49.0


