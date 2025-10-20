Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E279CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7uoU2Q8w1ehUXPejnhXKQt4c8Oe2nucecR/ksW0I/w=; b=wbbQWKmfTUS2nBCrOcC6NrqgNs
	hjfC9cA26/A+S+15bQ7Ngx3nMTx3rynK71pqeHt9GLX5Nt8rhpYbbbOdtA6WmakiqOG0aO3AyjSoR
	8JVkcNk4Oa7M6ySOUDAAEVeECe06n7eI9hQA/Z9jugasnUvf42Ceg0JeuPEXWsRki7eFPab5GYzUP
	nvZEov+6BL4LcoYpg6DL8QC9lTUFdKTnOMPAhI50NGkMaFrNbfWyw0cnekXvL/QWVRybeVYjZPr2+
	WPHWaPSJ2o5Vmt/uGamEz+nQTDx/d1jlm86Z1UvR9YbXbM2GnJJY+Pu8PqG8ArIOpq1jn9HHTcbZv
	tdcJ13Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAeA3-0000000BZmp-3Hoc;
	Mon, 20 Oct 2025 00:54:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9k-0000000BZXi-27hT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 00:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D93C61294;
	Mon, 20 Oct 2025 00:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928DAC116C6;
	Mon, 20 Oct 2025 00:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760921616;
	bh=cOfo+vQJHwt2jR/1l9Mz7dS2z0ta/WcLrt8/j3uJDXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HOhzAKtFKZVFysTC8yxErFpISUC2VMzxJyDD4hdrcz3uTIj089WiV2ODOJ9CcZikf
	 Wnrdg6pzK3qd37l9VMFqSh+HhqYmIraNWDgxnLHKmXDbxW4QOAo9e3aqgzI681X7F8
	 2T/xNT/n69e2pc5tgrP9nGk7sY5Gnj/HKo8uIcEmP5fh7e45rxM6BKOVYluW8bvVQx
	 HTDb0ijna/p2XtzNmpeqGJC6af59j1w9wiqAKySaKq8+wgm9Glj3HxO4bH5IIJrckn
	 zIPtzRoCL+L4Aa5u6mwEvZBRdFjBdfyqPlBGW73nCvNYIBFc6kyZa+4+tpZouJTEg/
	 PhF3qfNlsLBOQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 12/17] lib/crypto: sha3: Document one-shot functions in header and improve docs
Date: Sun, 19 Oct 2025 17:50:33 -0700
Message-ID: <20251020005038.661542-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020005038.661542-1-ebiggers@kernel.org>
References: <20251020005038.661542-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Move kerneldoc for the one-shot functions to the header for the
following reasons:

- This style is already used in sha1.h, sha2.h, and crypto_shash.
  And all the inline functions in sha3.h already.

- The header is where people who want to call the code usually look.

- This way the documentation won't have to be moved each time a function
  is changed to or from an inline function.

Also revise this documentation to fix some errors, be more user focused
(rather than focusing on implementation details like whether a context
is allocated and zeroized), and be a bit more consistent with sha2.h.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha3.h | 75 +++++++++++++++++++++++++++++++++++++++++++
 lib/crypto/sha3.c     | 70 ----------------------------------------
 2 files changed, 75 insertions(+), 70 deletions(-)

diff --git a/include/crypto/sha3.h b/include/crypto/sha3.h
index 58d2b3e0663e8..80acdb266b8e3 100644
--- a/include/crypto/sha3.h
+++ b/include/crypto/sha3.h
@@ -259,13 +259,88 @@ static inline void shake_squeeze(struct shake_ctx *ctx,
 				 u8 *out, size_t out_len)
 {
 	return __sha3_squeeze(&ctx->ctx, out, out_len);
 }
 
+/**
+ * sha3_224() - Compute SHA3-224 digest in one shot
+ * @in: The input data to be digested
+ * @in_len: Length of the input data in bytes
+ * @out: The buffer into which the digest will be stored
+ *
+ * Convenience function that computes a SHA3-224 digest.  Use this instead of
+ * the incremental API if you're able to provide all the input at once.
+ *
+ * Context: Any context.
+ */
 void sha3_224(const u8 *in, size_t in_len, u8 out[SHA3_224_DIGEST_SIZE]);
+
+/**
+ * sha3_256() - Compute SHA3-256 digest in one shot
+ * @in: The input data to be digested
+ * @in_len: Length of the input data in bytes
+ * @out: The buffer into which the digest will be stored
+ *
+ * Convenience function that computes a SHA3-256 digest.  Use this instead of
+ * the incremental API if you're able to provide all the input at once.
+ *
+ * Context: Any context.
+ */
 void sha3_256(const u8 *in, size_t in_len, u8 out[SHA3_256_DIGEST_SIZE]);
+
+/**
+ * sha3_384() - Compute SHA3-384 digest in one shot
+ * @in: The input data to be digested
+ * @in_len: Length of the input data in bytes
+ * @out: The buffer into which the digest will be stored
+ *
+ * Convenience function that computes a SHA3-384 digest.  Use this instead of
+ * the incremental API if you're able to provide all the input at once.
+ *
+ * Context: Any context.
+ */
 void sha3_384(const u8 *in, size_t in_len, u8 out[SHA3_384_DIGEST_SIZE]);
+
+/**
+ * sha3_512() - Compute SHA3-512 digest in one shot
+ * @in: The input data to be digested
+ * @in_len: Length of the input data in bytes
+ * @out: The buffer into which the digest will be stored
+ *
+ * Convenience function that computes a SHA3-512 digest.  Use this instead of
+ * the incremental API if you're able to provide all the input at once.
+ *
+ * Context: Any context.
+ */
 void sha3_512(const u8 *in, size_t in_len, u8 out[SHA3_512_DIGEST_SIZE]);
+
+/**
+ * shake128() - Compute SHAKE128 in one shot
+ * @in: The input data to be used
+ * @in_len: Length of the input data in bytes
+ * @out: The buffer into which the output will be stored
+ * @out_len: Length of the output to produce in bytes
+ *
+ * Convenience function that computes SHAKE128 in one shot.  Use this instead of
+ * the incremental API if you're able to provide all the input at once as well
+ * as receive all the output at once.  All output lengths are supported.
+ *
+ * Context: Any context.
+ */
 void shake128(const u8 *in, size_t in_len, u8 *out, size_t out_len);
+
+/**
+ * shake256() - Compute SHAKE256 in one shot
+ * @in: The input data to be used
+ * @in_len: Length of the input data in bytes
+ * @out: The buffer into which the output will be stored
+ * @out_len: Length of the output to produce in bytes
+ *
+ * Convenience function that computes SHAKE256 in one shot.  Use this instead of
+ * the incremental API if you're able to provide all the input at once as well
+ * as receive all the output at once.  All output lengths are supported.
+ *
+ * Context: Any context.
+ */
 void shake256(const u8 *in, size_t in_len, u8 *out, size_t out_len);
 
 #endif /* __CRYPTO_SHA3_H__ */
diff --git a/lib/crypto/sha3.c b/lib/crypto/sha3.c
index 6c13a43b0f868..6705c1b48da48 100644
--- a/lib/crypto/sha3.c
+++ b/lib/crypto/sha3.c
@@ -284,107 +284,50 @@ void __sha3_squeeze(struct __sha3_ctx *ctx, u8 *out, size_t out_len)
 
 	ctx->squeeze_offset = squeeze_offset;
 }
 EXPORT_SYMBOL_GPL(__sha3_squeeze);
 
-/**
- * sha3_224() - Convenience wrapper to digest a simple buffer as SHA3-224
- * @in: The data to be digested
- * @in_len: The amount of data to be digested in bytes
- * @out: The buffer into which the digest will be stored (size not checked)
- *
- * Convenience wrapper to initialise a SHA3 context for SHA-224, add the input
- * data to it, finalise it, extract 28 bytes of digest and clear the context.
- *
- * Context: May use the FPU/Vector unit registers.
- */
 void sha3_224(const u8 *in, size_t in_len, u8 out[SHA3_224_DIGEST_SIZE])
 {
 	struct sha3_ctx ctx;
 
 	sha3_224_init(&ctx);
 	sha3_update(&ctx, in, in_len);
 	sha3_final(&ctx, out);
 }
 EXPORT_SYMBOL_GPL(sha3_224);
 
-/**
- * sha3_256() - Convenience wrapper to digest a simple buffer as SHA3-256
- * @in: The data to be digested
- * @in_len: The amount of data to be digested in bytes
- * @out: The buffer into which the digest will be stored (size not checked)
- *
- * Convenience wrapper to initialise a SHA3 context for SHA-256, add the input
- * data to it, finalise it, extract 32 bytes of digest and clear the context.
- *
- * Context: May use the FPU/Vector unit registers.
- */
 void sha3_256(const u8 *in, size_t in_len, u8 out[SHA3_256_DIGEST_SIZE])
 {
 	struct sha3_ctx ctx;
 
 	sha3_256_init(&ctx);
 	sha3_update(&ctx, in, in_len);
 	sha3_final(&ctx, out);
 }
 EXPORT_SYMBOL_GPL(sha3_256);
 
-/**
- * sha3_384() - Convenience wrapper to digest a simple buffer as SHA3-384
- * @in: The data to be digested
- * @in_len: The amount of data to be digested in bytes
- * @out: The buffer into which the digest will be stored (size not checked)
- *
- * Convenience wrapper to initialise a SHA3 context for SHA-384, add the input
- * data to it, finalise it, extract 48 bytes of digest and clear the context.
- *
- * Context: May use the FPU/Vector unit registers.
- */
 void sha3_384(const u8 *in, size_t in_len, u8 out[SHA3_384_DIGEST_SIZE])
 {
 	struct sha3_ctx ctx;
 
 	sha3_384_init(&ctx);
 	sha3_update(&ctx, in, in_len);
 	sha3_final(&ctx, out);
 }
 EXPORT_SYMBOL_GPL(sha3_384);
 
-/**
- * sha3_512() - Convenience wrapper to digest a simple buffer as SHA3-512
- * @in: The data to be digested in bytes
- * @in_len: The amount of data to be digested in bytes
- * @out: The buffer into which the digest will be stored (size not checked)
- *
- * Convenience wrapper to initialise a SHA3 context for SHA-512, add the input
- * data to it, finalise it, extract 64 bytes of digest and clear the context.
- *
- * Context: May use the FPU/Vector unit registers.
- */
 void sha3_512(const u8 *in, size_t in_len, u8 out[SHA3_512_DIGEST_SIZE])
 {
 	struct sha3_ctx ctx;
 
 	sha3_512_init(&ctx);
 	sha3_update(&ctx, in, in_len);
 	sha3_final(&ctx, out);
 }
 EXPORT_SYMBOL_GPL(sha3_512);
 
-/**
- * shake128() - Convenience wrapper to apply SHAKE128 to a simple buffer
- * @in: The input data to be used
- * @in_len: The amount of input data in bytes
- * @out: The buffer in which to store the output
- * @out_len: The amount of output to store in bytes (variable length)
- *
- * Convenience wrapper to initialise a SHA3 context for SHAKE128, add the input
- * data to it, finalise it, extract the requested amount of output and clear
- * the context.
- *
- * Context: May use the FPU/Vector unit registers.
- */
 void shake128(const u8 *in, size_t in_len, u8 *out, size_t out_len)
 {
 	struct shake_ctx ctx;
 
 	shake128_init(&ctx);
@@ -392,23 +335,10 @@ void shake128(const u8 *in, size_t in_len, u8 *out, size_t out_len)
 	shake_squeeze(&ctx, out, out_len);
 	shake_zeroize_ctx(&ctx);
 }
 EXPORT_SYMBOL_GPL(shake128);
 
-/**
- * shake256() - Convenience wrapper to apply SHAKE256 to a simple buffer
- * @in: The input data to be used
- * @in_len: The amount of input data in bytes
- * @out: The buffer in which to store the output
- * @out_len: The amount of output to store in bytes (variable length)
- *
- * Convenience wrapper to initialise a SHA3 context for SHAKE128, add the input
- * data to it, finalise it, extract the requested amount of output and clear
- * the context.
- *
- * Context: May use the FPU/Vector unit registers.
- */
 void shake256(const u8 *in, size_t in_len, u8 *out, size_t out_len)
 {
 	struct shake_ctx ctx;
 
 	shake256_init(&ctx);
-- 
2.51.1.dirty


