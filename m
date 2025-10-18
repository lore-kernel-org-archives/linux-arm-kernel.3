Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CDACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 04:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqznLgj0CWxT3M2wmR2878K6EqIticxlP1/no/tFgPY=; b=H8jtjwqRpkDKKy9paflyEdbmA0
	QhcLUjUbWRU3L1usJBrVDvFv6TDncZH6A25uOC4zzFMUfSjRQnA7Q389/tYZOXl/H+27KVw4cCkEF
	ceEydVnjYTkjsBhk1nDCa4QQd1IPoTnPCakAZ3dXvZFqeansSxs38pEyKMP78zR6gd/BGZd/5Zidn
	KFx6xzW8Pj2XXQJC5Rx+VvFHmFi/j1RhhVqE3zs0mHTHL3ZNfcKFVRhDdVTz7T0fllNCTKQm+g8Tv
	9jqoQhis1YFmwgT9xjZQ5AhWH6FnvpIEqcz8pPQhffaV8sLrkcIGj4ye6aQBQSfM4cakhXHmjQOPu
	SZxRbZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yg9-00000009VLk-0ig3;
	Sat, 18 Oct 2025 04:36:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yg3-00000009VFX-2O0h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 04:36:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2C5A4B700;
	Sat, 18 Oct 2025 04:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A83C4CEFB;
	Sat, 18 Oct 2025 04:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760762182;
	bh=H2r2uS0vfeLAotRiFDRZo0+NWMO7YTMGMpSXPOAEWyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=huiEMKilQMldYlADDkZxoXV24XTDU4pFEWY7vkIk8tv1ID+lL8Va0h6CAFQ0bhJDp
	 vPmQcSrRTRkOJqvxyWVLapd/CtIuJZ49Pf0C4YJ9k+qmh4KYVnLNy2f6tO5tKZ01Fv
	 YY83DUY+1cTGCJhijsXuVi16IKHXDW8k+5A+jYUgqRb63+LH8wdgBtBAKFvVpaOAMz
	 LCnDl7/9m8Vg1W7LsrJEfZS0z4AuWgS8mDCu/uO+fqXVu8xzD0VBRPbCPtgtHX+QBo
	 70YKPK2YtwEbNAcFct+ri6HQZD8m1tIdYk9rBEVcbxi5wx6Q3hYrDwE6nbhfABBTAo
	 kfQPZpTbI6qKQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 04/10] lib/crypto: blake2s: Document the BLAKE2s library API
Date: Fri, 17 Oct 2025 21:31:00 -0700
Message-ID: <20251018043106.375964-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251018043106.375964-1-ebiggers@kernel.org>
References: <20251018043106.375964-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_213623_667604_7B071B37 
X-CRM114-Status: GOOD (  13.72  )
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

Add kerneldoc for the BLAKE2s library API.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/blake2s.h | 58 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/crypto/blake2s.h b/include/crypto/blake2s.h
index 33893057eb414..648cb78243588 100644
--- a/include/crypto/blake2s.h
+++ b/include/crypto/blake2s.h
@@ -20,10 +20,19 @@ enum blake2s_lengths {
 	BLAKE2S_160_HASH_SIZE = 20,
 	BLAKE2S_224_HASH_SIZE = 28,
 	BLAKE2S_256_HASH_SIZE = 32,
 };
 
+/**
+ * struct blake2s_ctx - Context for hashing a message with BLAKE2s
+ * @h: compression function state
+ * @t: block counter
+ * @f: finalization indicator
+ * @buf: partial block buffer; 'buflen' bytes are valid
+ * @buflen: number of bytes buffered in @buf
+ * @outlen: length of output hash value in bytes, at most BLAKE2S_HASH_SIZE
+ */
 struct blake2s_ctx {
 	/* 'h', 't', and 'f' are used in assembly code, so keep them as-is. */
 	u32 h[8];
 	u32 t[2];
 	u32 f[2];
@@ -65,27 +74,76 @@ static inline void __blake2s_init(struct blake2s_ctx *ctx, size_t outlen,
 		memset(&ctx->buf[keylen], 0, BLAKE2S_BLOCK_SIZE - keylen);
 		ctx->buflen = BLAKE2S_BLOCK_SIZE;
 	}
 }
 
+/**
+ * blake2s_init() - Initialize a BLAKE2s context for a new message (unkeyed)
+ * @ctx: the context to initialize
+ * @outlen: length of output hash value in bytes, at most BLAKE2S_HASH_SIZE
+ *
+ * Context: Any context.
+ */
 static inline void blake2s_init(struct blake2s_ctx *ctx, size_t outlen)
 {
 	__blake2s_init(ctx, outlen, NULL, 0);
 }
 
+/**
+ * blake2s_init_key() - Initialize a BLAKE2s context for a new message (keyed)
+ * @ctx: the context to initialize
+ * @outlen: length of output hash value in bytes, at most BLAKE2S_HASH_SIZE
+ * @key: the key
+ * @keylen: the key length in bytes, at most BLAKE2S_KEY_SIZE
+ *
+ * Context: Any context.
+ */
 static inline void blake2s_init_key(struct blake2s_ctx *ctx, size_t outlen,
 				    const void *key, size_t keylen)
 {
 	WARN_ON(IS_ENABLED(DEBUG) && (!outlen || outlen > BLAKE2S_HASH_SIZE ||
 		!key || !keylen || keylen > BLAKE2S_KEY_SIZE));
 
 	__blake2s_init(ctx, outlen, key, keylen);
 }
 
+/**
+ * blake2s_update() - Update a BLAKE2s context with message data
+ * @ctx: the context to update; must have been initialized
+ * @in: the message data
+ * @inlen: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
 void blake2s_update(struct blake2s_ctx *ctx, const u8 *in, size_t inlen);
+
+/**
+ * blake2s_final() - Finish computing a BLAKE2s hash
+ * @ctx: the context to finalize; must have been initialized
+ * @out: (output) the resulting BLAKE2s hash.  Its length will be equal to the
+ *	 @outlen that was passed to blake2s_init() or blake2s_init_key().
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
 void blake2s_final(struct blake2s_ctx *ctx, u8 *out);
 
+/**
+ * blake2s() - Compute BLAKE2s hash in one shot
+ * @key: the key, or NULL for an unkeyed hash
+ * @keylen: the key length in bytes (at most BLAKE2S_KEY_SIZE), or 0 for an
+ *	    unkeyed hash
+ * @in: the message data
+ * @inlen: the data length in bytes
+ * @out: (output) the resulting BLAKE2s hash, with length @outlen
+ * @outlen: length of output hash value in bytes, at most BLAKE2S_HASH_SIZE
+ *
+ * Context: Any context.
+ */
 static inline void blake2s(const u8 *key, size_t keylen,
 			   const u8 *in, size_t inlen,
 			   u8 *out, size_t outlen)
 {
 	struct blake2s_ctx ctx;
-- 
2.51.1.dirty


