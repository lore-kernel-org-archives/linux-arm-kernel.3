Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62B2C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsDpFKFP6yR3OyAu3E5YGdpmZySavU5Hbymk6BRkbVs=; b=rV1jHsvVq723fnX++m1iDyDfyu
	ig52bFahgSdMgo5WAkf9cql0AOmZDvi3pFSXWObEzBkfe6nCg5MAobHSjmkPNvRpSDfUNSsTQVnmc
	EKlrECk3sa5zjq8B+s+K2pxPzTKaWb6b42MR5EcNUAIVibOUTiVXNy4dLKyu5OjRFZXKPujDJ3Fqe
	JAt6g+2eIJvM1s3ydv/ajwgn29sq21UVuTcOPKzD0cfstH/Bw1yM1H4tZxWZ8EzoD8bUAjz6vtycJ
	f4Pt/kZw9bX1ffA3lj0prXHi7ELSDpYJRVBsVDLLap8BeygDRZUnUXbGLAnweHarrLrwmyvrEgSP8
	Hda+pYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKrb-00000007rb1-1JRB;
	Wed, 25 Jun 2025 07:48:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHH-00000007lQq-1Vxh;
	Wed, 25 Jun 2025 07:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lsDpFKFP6yR3OyAu3E5YGdpmZySavU5Hbymk6BRkbVs=; b=POBiJrFfTQMk4zNHwCuXsgDsbr
	aHp3g59+Pu1tMzwitHaSwTM4YmGBq41VvYNlIRpPP9MKrekSK7kFImlV20R+SFWdfYp9jhGsXKM4o
	0Fhu0M/ZU+2FyiVtODJ1aqT53YVo49NuI9KSyLgisss2UiDZpgyLc5Jn4MPJScSY189OpwOTYeqRw
	f23p4mMg4OmjrbJLSxE3RdkZU60iZkHzymZOC7+ZV4qepIIyWEHsCNb9iiH8+4xcbTnomrKNQ938v
	X0Wuj3XGDgtg8PImURIJghBIBwZdq9/NwE5AdMsgiGQAheizfooomIBrs8ssQNS4wayTXp4lhqTbe
	+hH16fbw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHE-00000005def-1PPs;
	Wed, 25 Jun 2025 07:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C638F5C4990;
	Wed, 25 Jun 2025 07:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9681DC4CEF5;
	Wed, 25 Jun 2025 07:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835432;
	bh=HcT0g5xVAWv/N1IR5pEWuUbH8BmCfR6q+xHzYq1G6lk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bGgwTm2qXC8YWw3rGgR+lHbPGOQQ/R4KGHs4yhXIoT3fqyhl19hbTUtM8dvXWJWpd
	 JFMRJljmUlGkBNKGbQwrg2OrYrBbOmmkLbfT89ahvff9JlIDOJ/YdVkFmjjkU/zMRL
	 N6xl6d93c+iiFynuJk60pUF1JidoqO9E+WChoY3Daba0yeF7mIFNFNGLvKocEfQlqh
	 qA/Lv7qPWcCLjw4RnDU3lGzC39o9L6Za9uBu1lYk9hQfwK6Ts6xdFbPF30wSGdQgPR
	 Bj/zByvKdS2wG1OPmCwaDByOfcnT3Hn8nMTz8VxHHnPMSflTbT1NLWINC0jTbgbIaA
	 Q3Z5Jzbp+07Ew==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 12/18] lib/crypto: sha256: Add HMAC-SHA224 and HMAC-SHA256 support
Date: Wed, 25 Jun 2025 00:08:13 -0700
Message-ID: <20250625070819.1496119-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_081036_675393_E5A7EB5D 
X-CRM114-Status: GOOD (  21.43  )
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

Since HMAC support is commonly needed and is fairly simple, include it
as a first-class citizen of the SHA-256 library.

The API supports both incremental and one-shot computation, and either
preparing the key ahead of time or just using a raw key.  The
implementation is much more streamlined than crypto/hmac.c.

I've kept it consistent with the HMAC-SHA384 and HMAC-SHA512 code as
much as possible.

Testing of these functions will be via sha224_kunit and sha256_kunit,
added by a later commit.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 222 ++++++++++++++++++++++++++++++++++++++++++
 lib/crypto/sha256.c   | 145 +++++++++++++++++++++++++--
 2 files changed, 361 insertions(+), 6 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 18e1eec841b71..2e3fc2cf4aa0d 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -129,10 +129,26 @@ struct __sha256_ctx {
 	u64 bytecount;
 	u8 buf[SHA256_BLOCK_SIZE] __aligned(__alignof__(__be64));
 };
 void __sha256_update(struct __sha256_ctx *ctx, const u8 *data, size_t len);
 
+/*
+ * HMAC key and message context structs, shared by HMAC-SHA224 and HMAC-SHA256.
+ * The hmac_sha224_* and hmac_sha256_* structs wrap this one so that the API has
+ * proper typing and doesn't allow mixing the functions arbitrarily.
+ */
+struct __hmac_sha256_key {
+	struct sha256_block_state istate;
+	struct sha256_block_state ostate;
+};
+struct __hmac_sha256_ctx {
+	struct __sha256_ctx sha_ctx;
+	struct sha256_block_state ostate;
+};
+void __hmac_sha256_init(struct __hmac_sha256_ctx *ctx,
+			const struct __hmac_sha256_key *key);
+
 /**
  * struct sha224_ctx - Context for hashing a message with SHA-224
  * @ctx: private
  */
 struct sha224_ctx {
@@ -146,10 +162,113 @@ static inline void sha224_update(struct sha224_ctx *ctx,
 	__sha256_update(&ctx->ctx, data, len);
 }
 void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE]);
 void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE]);
 
+/**
+ * struct hmac_sha224_key - Prepared key for HMAC-SHA224
+ * @key: private
+ */
+struct hmac_sha224_key {
+	struct __hmac_sha256_key key;
+};
+
+/**
+ * struct hmac_sha224_ctx - Context for computing HMAC-SHA224 of a message
+ * @ctx: private
+ */
+struct hmac_sha224_ctx {
+	struct __hmac_sha256_ctx ctx;
+};
+
+/**
+ * hmac_sha224_preparekey() - Prepare a key for HMAC-SHA224
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-SHA224 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_sha224_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_sha224_preparekey(struct hmac_sha224_key *key,
+			    const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha224_init() - Initialize an HMAC-SHA224 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_sha224() instead.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha224_init(struct hmac_sha224_ctx *ctx,
+				    const struct hmac_sha224_key *key)
+{
+	__hmac_sha256_init(&ctx->ctx, &key->key);
+}
+
+/**
+ * hmac_sha224_update() - Update an HMAC-SHA224 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha224_update(struct hmac_sha224_ctx *ctx,
+				      const u8 *data, size_t data_len)
+{
+	__sha256_update(&ctx->ctx.sha_ctx, data, data_len);
+}
+
+/**
+ * hmac_sha224_final() - Finish computing an HMAC-SHA224 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-SHA224 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_sha224_final(struct hmac_sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE]);
+
+/**
+ * hmac_sha224() - Compute HMAC-SHA224 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA224 value
+ *
+ * If you're using the key only once, consider using hmac_sha224_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_sha224(const struct hmac_sha224_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA224_DIGEST_SIZE]);
+
+/**
+ * hmac_sha224_usingrawkey() - Compute HMAC-SHA224 in one shot, using a raw key
+ * @raw_key: the raw HMAC-SHA224 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA224 value
+ *
+ * If you're using the key multiple times, prefer to use
+ * hmac_sha224_preparekey() followed by multiple calls to hmac_sha224() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha224_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA224_DIGEST_SIZE]);
+
 /**
  * struct sha256_ctx - Context for hashing a message with SHA-256
  * @ctx: private
  */
 struct sha256_ctx {
@@ -163,10 +282,113 @@ static inline void sha256_update(struct sha256_ctx *ctx,
 	__sha256_update(&ctx->ctx, data, len);
 }
 void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
+/**
+ * struct hmac_sha256_key - Prepared key for HMAC-SHA256
+ * @key: private
+ */
+struct hmac_sha256_key {
+	struct __hmac_sha256_key key;
+};
+
+/**
+ * struct hmac_sha256_ctx - Context for computing HMAC-SHA256 of a message
+ * @ctx: private
+ */
+struct hmac_sha256_ctx {
+	struct __hmac_sha256_ctx ctx;
+};
+
+/**
+ * hmac_sha256_preparekey() - Prepare a key for HMAC-SHA256
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-SHA256 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_sha256_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_sha256_preparekey(struct hmac_sha256_key *key,
+			    const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha256_init() - Initialize an HMAC-SHA256 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_sha256() instead.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha256_init(struct hmac_sha256_ctx *ctx,
+				    const struct hmac_sha256_key *key)
+{
+	__hmac_sha256_init(&ctx->ctx, &key->key);
+}
+
+/**
+ * hmac_sha256_update() - Update an HMAC-SHA256 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha256_update(struct hmac_sha256_ctx *ctx,
+				      const u8 *data, size_t data_len)
+{
+	__sha256_update(&ctx->ctx.sha_ctx, data, data_len);
+}
+
+/**
+ * hmac_sha256_final() - Finish computing an HMAC-SHA256 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-SHA256 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_sha256_final(struct hmac_sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE]);
+
+/**
+ * hmac_sha256() - Compute HMAC-SHA256 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA256 value
+ *
+ * If you're using the key only once, consider using hmac_sha256_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_sha256(const struct hmac_sha256_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA256_DIGEST_SIZE]);
+
+/**
+ * hmac_sha256_usingrawkey() - Compute HMAC-SHA256 in one shot, using a raw key
+ * @raw_key: the raw HMAC-SHA256 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA256 value
+ *
+ * If you're using the key multiple times, prefer to use
+ * hmac_sha256_preparekey() followed by multiple calls to hmac_sha256() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha256_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA256_DIGEST_SIZE]);
+
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
 	u64 h[8];
 };
 
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 3e7797a4489de..165c894a47aa0 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -1,24 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * SHA-256, as specified in
- * http://csrc.nist.gov/groups/STM/cavp/documents/shs/sha256-384-512.pdf
- *
- * SHA-256 code by Jean-Luc Cooke <jlcooke@certainkey.com>.
+ * SHA-224, SHA-256, HMAC-SHA224, and HMAC-SHA256 library functions
  *
  * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
  * Copyright (c) 2014 Red Hat Inc.
  */
 
+#include <crypto/hmac.h>
 #include <crypto/internal/blockhash.h>
 #include <crypto/internal/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/string.h>
+#include <linux/wordpart.h>
 
 static const struct sha256_block_state sha224_iv = {
 	.h = {
 		SHA224_H0, SHA224_H1, SHA224_H2, SHA224_H3,
 		SHA224_H4, SHA224_H5, SHA224_H6, SHA224_H7,
@@ -134,7 +132,142 @@ void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 	sha256_update(&ctx, data, len);
 	sha256_final(&ctx, out);
 }
 EXPORT_SYMBOL(sha256);
 
-MODULE_DESCRIPTION("SHA-256 Algorithm");
+static void __hmac_sha256_preparekey(struct __hmac_sha256_key *key,
+				     const u8 *raw_key, size_t raw_key_len,
+				     const struct sha256_block_state *iv)
+{
+	union {
+		u8 b[SHA256_BLOCK_SIZE];
+		unsigned long w[SHA256_BLOCK_SIZE / sizeof(unsigned long)];
+	} derived_key = { 0 };
+
+	if (unlikely(raw_key_len > SHA256_BLOCK_SIZE)) {
+		if (iv == &sha224_iv)
+			sha224(raw_key, raw_key_len, derived_key.b);
+		else
+			sha256(raw_key, raw_key_len, derived_key.b);
+	} else {
+		memcpy(derived_key.b, raw_key, raw_key_len);
+	}
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_IPAD_VALUE);
+	key->istate = *iv;
+	sha256_blocks(&key->istate, derived_key.b, 1);
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_OPAD_VALUE ^
+						HMAC_IPAD_VALUE);
+	key->ostate = *iv;
+	sha256_blocks(&key->ostate, derived_key.b, 1);
+
+	memzero_explicit(&derived_key, sizeof(derived_key));
+}
+
+void hmac_sha224_preparekey(struct hmac_sha224_key *key,
+			    const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha256_preparekey(&key->key, raw_key, raw_key_len, &sha224_iv);
+}
+EXPORT_SYMBOL_GPL(hmac_sha224_preparekey);
+
+void hmac_sha256_preparekey(struct hmac_sha256_key *key,
+			    const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha256_preparekey(&key->key, raw_key, raw_key_len, &sha256_iv);
+}
+EXPORT_SYMBOL_GPL(hmac_sha256_preparekey);
+
+void __hmac_sha256_init(struct __hmac_sha256_ctx *ctx,
+			const struct __hmac_sha256_key *key)
+{
+	__sha256_init(&ctx->sha_ctx, &key->istate, SHA256_BLOCK_SIZE);
+	ctx->ostate = key->ostate;
+}
+EXPORT_SYMBOL_GPL(__hmac_sha256_init);
+
+static void __hmac_sha256_final(struct __hmac_sha256_ctx *ctx,
+				u8 *out, size_t digest_size)
+{
+	/* Generate the padded input for the outer hash in ctx->sha_ctx.buf. */
+	__sha256_final(&ctx->sha_ctx, ctx->sha_ctx.buf, digest_size);
+	memset(&ctx->sha_ctx.buf[digest_size], 0,
+	       SHA256_BLOCK_SIZE - digest_size);
+	ctx->sha_ctx.buf[digest_size] = 0x80;
+	*(__be32 *)&ctx->sha_ctx.buf[SHA256_BLOCK_SIZE - 4] =
+		cpu_to_be32(8 * (SHA256_BLOCK_SIZE + digest_size));
+
+	/* Compute the outer hash, which gives the HMAC value. */
+	sha256_blocks(&ctx->ostate, ctx->sha_ctx.buf, 1);
+	for (size_t i = 0; i < digest_size; i += 4)
+		put_unaligned_be32(ctx->ostate.h[i / 4], out + i);
+
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+
+void hmac_sha224_final(struct hmac_sha224_ctx *ctx,
+		       u8 out[SHA224_DIGEST_SIZE])
+{
+	__hmac_sha256_final(&ctx->ctx, out, SHA224_DIGEST_SIZE);
+}
+EXPORT_SYMBOL_GPL(hmac_sha224_final);
+
+void hmac_sha256_final(struct hmac_sha256_ctx *ctx,
+		       u8 out[SHA256_DIGEST_SIZE])
+{
+	__hmac_sha256_final(&ctx->ctx, out, SHA256_DIGEST_SIZE);
+}
+EXPORT_SYMBOL_GPL(hmac_sha256_final);
+
+void hmac_sha224(const struct hmac_sha224_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA224_DIGEST_SIZE])
+{
+	struct hmac_sha224_ctx ctx;
+
+	hmac_sha224_init(&ctx, key);
+	hmac_sha224_update(&ctx, data, data_len);
+	hmac_sha224_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha224);
+
+void hmac_sha256(const struct hmac_sha256_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA256_DIGEST_SIZE])
+{
+	struct hmac_sha256_ctx ctx;
+
+	hmac_sha256_init(&ctx, key);
+	hmac_sha256_update(&ctx, data, data_len);
+	hmac_sha256_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha256);
+
+void hmac_sha224_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA224_DIGEST_SIZE])
+{
+	struct hmac_sha224_key key;
+
+	hmac_sha224_preparekey(&key, raw_key, raw_key_len);
+	hmac_sha224(&key, data, data_len, out);
+
+	memzero_explicit(&key, sizeof(key));
+}
+EXPORT_SYMBOL_GPL(hmac_sha224_usingrawkey);
+
+void hmac_sha256_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA256_DIGEST_SIZE])
+{
+	struct hmac_sha256_key key;
+
+	hmac_sha256_preparekey(&key, raw_key, raw_key_len);
+	hmac_sha256(&key, data, data_len, out);
+
+	memzero_explicit(&key, sizeof(key));
+}
+EXPORT_SYMBOL_GPL(hmac_sha256_usingrawkey);
+
+MODULE_DESCRIPTION("SHA-224, SHA-256, HMAC-SHA224, and HMAC-SHA256 library functions");
 MODULE_LICENSE("GPL");
-- 
2.50.0


