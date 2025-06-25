Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2136C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 07:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk0sE/BCMGvaA7bCbAXV+RAu7t0GwWYb3WWV/cO67KU=; b=TVXwLQC9lkZR5svu9NfIv1qCrW
	P8xgLcuCou+4iW76uPte23PoO8dt8bc7M6jzR9zAfUNk/H+J7BC5YD0aHcJDOQaRz/lTWkAwS/SYk
	HFCYVT1+xulzZZR8MKs6ER4YdLIWS7JoK8COcVRb8eCT5vk3/RTsB33nPvv1N5giVdFaaBzmgvznT
	b/DLsnLuMSxdoOb/lWAjINhm6/iQGrt7UY69LuaOFnZyhEBF7JlTBM1XZsSPkGvQ1J01ub4JYHLkx
	DLngaQS1O0QwWaI7V5hcQwlDXA3493+knnQJSf/1Q0klsz2KYpLxrEjiMv8dyaHWHkPBJPZGVhg2u
	s5EB1ezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKSY-00000007njx-1SgP;
	Wed, 25 Jun 2025 07:22:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKH8-00000007lKX-3ptb;
	Wed, 25 Jun 2025 07:10:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A13BC4AFFB;
	Wed, 25 Jun 2025 07:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9AEC4CEF5;
	Wed, 25 Jun 2025 07:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835430;
	bh=5WUT3FVFtGYY38nGQk9FGEw/eHR0uyP40u2JgCeMrws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Quc/P6eu5iIScTCwgcuUNaTCGoZUIh6fp/hl7LHmviUQEmRe+t4LKdFCBH7navrfo
	 GICzrHziIKzqzyFPphpHP3vo3HEX/7j5OI/vmmZ+XLVowZee9Wyi8jJQ5wlh2uunHE
	 h3rFtEujKoiwh+eJKW6dE8GGHzKaTRDnO/rC1+Mcjz1eQ1WFW6US8zZ3MJsqT4zaqV
	 iK7S6x93chir8amN7aJinaXtXZEHsjWX0ZQ82+Yq2sYG/Uz8xB5Bh26wshdB7cCu1j
	 MWbfnItzcqqAhjD1xmylW17qmZH9qmFLwgW6njpigcrHg1Ehhg3WocNaQuohNf4WMK
	 H645fNotiWbsg==
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
Subject: [PATCH 07/18] lib/crypto: sha256: Reorder some code
Date: Wed, 25 Jun 2025 00:08:08 -0700
Message-ID: <20250625070819.1496119-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_001030_999310_96385653 
X-CRM114-Status: GOOD (  12.13  )
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

First, move the declarations of sha224_init/update/final to be just
above the corresponding SHA-256 code, matching the order that I used for
SHA-384 and SHA-512.  In sha2.h, the end result is that SHA-224,
SHA-256, SHA-384, and SHA-512 are all in the logical order.

Second, move sha224_block_init() and sha256_block_init() to be just
below crypto_sha256_state.  In later changes, these functions as well as
struct crypto_sha256_state will no longer be used by the library
functions.  They'll remain just for some legacy offload drivers.  This
gets them into a logical place in the file for that.

No code changes other than reordering.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 60 +++++++++++++++++++++----------------------
 lib/crypto/sha256.c   | 12 ++++-----
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 296ce9d468bfc..bb181b7996cdc 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -69,10 +69,36 @@ extern const u8 sha512_zero_message_hash[SHA512_DIGEST_SIZE];
 struct crypto_sha256_state {
 	u32 state[SHA256_STATE_WORDS];
 	u64 count;
 };
 
+static inline void sha224_block_init(struct crypto_sha256_state *sctx)
+{
+	sctx->state[0] = SHA224_H0;
+	sctx->state[1] = SHA224_H1;
+	sctx->state[2] = SHA224_H2;
+	sctx->state[3] = SHA224_H3;
+	sctx->state[4] = SHA224_H4;
+	sctx->state[5] = SHA224_H5;
+	sctx->state[6] = SHA224_H6;
+	sctx->state[7] = SHA224_H7;
+	sctx->count = 0;
+}
+
+static inline void sha256_block_init(struct crypto_sha256_state *sctx)
+{
+	sctx->state[0] = SHA256_H0;
+	sctx->state[1] = SHA256_H1;
+	sctx->state[2] = SHA256_H2;
+	sctx->state[3] = SHA256_H3;
+	sctx->state[4] = SHA256_H4;
+	sctx->state[5] = SHA256_H5;
+	sctx->state[6] = SHA256_H6;
+	sctx->state[7] = SHA256_H7;
+	sctx->count = 0;
+}
+
 struct sha256_state {
 	union {
 		struct crypto_sha256_state ctx;
 		struct {
 			u32 state[SHA256_STATE_WORDS];
@@ -86,51 +112,25 @@ struct sha512_state {
 	u64 state[SHA512_DIGEST_SIZE / 8];
 	u64 count[2];
 	u8 buf[SHA512_BLOCK_SIZE];
 };
 
-static inline void sha256_block_init(struct crypto_sha256_state *sctx)
+static inline void sha224_init(struct sha256_state *sctx)
 {
-	sctx->state[0] = SHA256_H0;
-	sctx->state[1] = SHA256_H1;
-	sctx->state[2] = SHA256_H2;
-	sctx->state[3] = SHA256_H3;
-	sctx->state[4] = SHA256_H4;
-	sctx->state[5] = SHA256_H5;
-	sctx->state[6] = SHA256_H6;
-	sctx->state[7] = SHA256_H7;
-	sctx->count = 0;
+	sha224_block_init(&sctx->ctx);
 }
+/* Simply use sha256_update as it is equivalent to sha224_update. */
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
 
 static inline void sha256_init(struct sha256_state *sctx)
 {
 	sha256_block_init(&sctx->ctx);
 }
 void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
 void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
-static inline void sha224_block_init(struct crypto_sha256_state *sctx)
-{
-	sctx->state[0] = SHA224_H0;
-	sctx->state[1] = SHA224_H1;
-	sctx->state[2] = SHA224_H2;
-	sctx->state[3] = SHA224_H3;
-	sctx->state[4] = SHA224_H4;
-	sctx->state[5] = SHA224_H5;
-	sctx->state[6] = SHA224_H6;
-	sctx->state[7] = SHA224_H7;
-	sctx->count = 0;
-}
-
-static inline void sha224_init(struct sha256_state *sctx)
-{
-	sha224_block_init(&sctx->ctx);
-}
-/* Simply use sha256_update as it is equivalent to sha224_update. */
-void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
-
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
 	u64 h[8];
 };
 
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 6bfa4ae8dfb59..573ccecbf48bf 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -56,22 +56,22 @@ static inline void __sha256_final(struct sha256_state *sctx, u8 *out,
 	sha256_finup(&sctx->ctx, sctx->buf, partial, out, digest_size,
 		     sha256_purgatory(), false);
 	memzero_explicit(sctx, sizeof(*sctx));
 }
 
-void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
-{
-	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
-}
-EXPORT_SYMBOL(sha256_final);
-
 void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA224_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha224_final);
 
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
+{
+	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
+}
+EXPORT_SYMBOL(sha256_final);
+
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
 	sha256_init(&sctx);
-- 
2.50.0


