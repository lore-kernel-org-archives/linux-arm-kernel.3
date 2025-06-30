Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E5EC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgNrCjq6lsOkp6g05Z5E9V8l08rRXcQ6exdzrdyOjWk=; b=UKZj/b/9wjBV9Nwpw8N5XFPgVF
	+zltMD5JoeSJOcm0CZTAB9bvPeRWHM5a637SuN7/MBc2vZ0bRFcAKeamIG8tPLbl9oZq1PARBxzuq
	i9bgoxEHmXU5f2R86TTNwZu7DiQLHzkOb7qTbUgccRXG9sbDyk05FFQnjgVuJMt29c2pUOtu2E5Qo
	mfUO8VNRe4GVNRaZS7SEX73Zsl798Wiey7fs+fxxSm7bJtYLboF6mB32BdvC69anYYdhdoYf9iHr/
	IZ3bAkytEiaz16FCh5oniFjW7kqZ3LlZJog2ldqapxufJYiwfzEf/lQfuytxVtAJx0CYdsRx/alrD
	MY9qkN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIT5-000000035lp-1SVR;
	Mon, 30 Jun 2025 17:38:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH4S-00000002pqL-3J1e;
	Mon, 30 Jun 2025 16:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19317A53519;
	Mon, 30 Jun 2025 16:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC2DC4CEF3;
	Mon, 30 Jun 2025 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299767;
	bh=pkoFPfsdz5mUfc5I4FK+MnyFLsCjGsnnD9jc5ME9fN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jnBxR32keuveFDD/erORneyVQFZMExFVwQ2m1PRHBM8e09zhVEcpdxXezXwhIRIep
	 1b/hAsrsEPE4GO34uoemDkgD6DfhLn2c+0We3yqTqkDW1Zdqk+usXyKw0ahpO/QyDk
	 kq8OJiVNVNYv+79sZjwcLRLPE8u+AXxrFrb5rUo1EG4MgLQWKf4VRjl6PqF6ZW6RvL
	 tO/4ewF4TqSoMw0NJ2cWpzPbScaI6j0B3laWfK7QYlGoz9vuy6ps6Y8wwL6bttBzRT
	 i6YDWFUv5OhMZDpFhfE2wkKZC04+niDSZ+wBsXg2HLi3z3ji0M2HuML4L/kX6ufOLl
	 sxIXnWBzurdOw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 14/14] lib/crypto: sha256: Document the SHA-224 and SHA-256 API
Date: Mon, 30 Jun 2025 09:06:45 -0700
Message-ID: <20250630160645.3198-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_090928_982353_0277D6DA 
X-CRM114-Status: GOOD (  10.50  )
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

Add kerneldoc comments, consistent with the kerneldoc comments of the
SHA-384 and SHA-512 API.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 76 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 2e3fc2cf4aa0d..e0a08f6addd00 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -153,17 +153,55 @@ void __hmac_sha256_init(struct __hmac_sha256_ctx *ctx,
  */
 struct sha224_ctx {
 	struct __sha256_ctx ctx;
 };
 
+/**
+ * sha224_init() - Initialize a SHA-224 context for a new message
+ * @ctx: the context to initialize
+ *
+ * If you don't need incremental computation, consider sha224() instead.
+ *
+ * Context: Any context.
+ */
 void sha224_init(struct sha224_ctx *ctx);
+
+/**
+ * sha224_update() - Update a SHA-224 context with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
 static inline void sha224_update(struct sha224_ctx *ctx,
 				 const u8 *data, size_t len)
 {
 	__sha256_update(&ctx->ctx, data, len);
 }
+
+/**
+ * sha224_final() - Finish computing a SHA-224 message digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: (output) the resulting SHA-224 message digest
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
 void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE]);
+
+/**
+ * sha224() - Compute SHA-224 message digest in one shot
+ * @data: the message data
+ * @len: the data length in bytes
+ * @out: (output) the resulting SHA-224 message digest
+ *
+ * Context: Any context.
+ */
 void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE]);
 
 /**
  * struct hmac_sha224_key - Prepared key for HMAC-SHA224
  * @key: private
@@ -273,17 +311,55 @@ void hmac_sha224_usingrawkey(const u8 *raw_key, size_t raw_key_len,
  */
 struct sha256_ctx {
 	struct __sha256_ctx ctx;
 };
 
+/**
+ * sha256_init() - Initialize a SHA-256 context for a new message
+ * @ctx: the context to initialize
+ *
+ * If you don't need incremental computation, consider sha256() instead.
+ *
+ * Context: Any context.
+ */
 void sha256_init(struct sha256_ctx *ctx);
+
+/**
+ * sha256_update() - Update a SHA-256 context with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
 static inline void sha256_update(struct sha256_ctx *ctx,
 				 const u8 *data, size_t len)
 {
 	__sha256_update(&ctx->ctx, data, len);
 }
+
+/**
+ * sha256_final() - Finish computing a SHA-256 message digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: (output) the resulting SHA-256 message digest
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
 void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE]);
+
+/**
+ * sha256() - Compute SHA-256 message digest in one shot
+ * @data: the message data
+ * @len: the data length in bytes
+ * @out: (output) the resulting SHA-256 message digest
+ *
+ * Context: Any context.
+ */
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 /**
  * struct hmac_sha256_key - Prepared key for HMAC-SHA256
  * @key: private
-- 
2.50.0


