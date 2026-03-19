Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CDE103E19D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 06:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVMQEnd4rSZtY5qYPGXz8BjN0xK30lVdVne1L1Zwajs=; b=PuQjezKJsPdVIRUjdf4wORlSoz
	rwul+Cn6eXukRW5qXULx+UOTEyY3CbJOFxHCXFxybviDXIld2516a9c7bHrlaSaIHkBhvl7EdHIL6
	Uo09jOZHaHrySxgsQQDceDKXQVCog37V3fgQgaX7xdD5IgsziX4olsoWd0SEwTRfdMsMAYWWieO7n
	tGxByjNuG1VV09Rq1SqOlk/1VjGLORlQgTm9K3zZwwMfxOhAKQfpMqCTkg8u7upBcu5dDWxYh2TCi
	oOmKhusJPu5Gbzn7/K6bMrHU86lROXOWOWcu5BB370yOUKkxhJ9hoYF6/t1J6qruKexhhy2f1ikGx
	+v8UcEDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36j6-00000009zqL-1GOA;
	Thu, 19 Mar 2026 06:19:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36iy-00000009zgX-3Nal;
	Thu, 19 Mar 2026 06:19:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C729744580;
	Thu, 19 Mar 2026 06:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EB1C2BCB0;
	Thu, 19 Mar 2026 06:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773901155;
	bh=hid0vw0Vx+WzxqZPhBF+Eve7jlNniJ4iCco18/lmzfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LhKkKHYOHF4+WqJuVtNO8WdR+dlrLylzpj92e01/b4ILJZzjpIZxYcIANC6IgLjPt
	 lCnvXj6zL6Yn5v4eRxqPX80CJ9AYnGoHf7poVmkVNFYVYuEGEuqeSPLSLhcTewuF2C
	 MxnlP3+ft3sYyrlPa09r9f6XslFfYIXCfcUULHIBuvjCTCPF3di8IVyzkXoYUuoCgo
	 GGuCitZEMUpyCe0HwaK9tnBvRKbWOSfK/9g6ohLtsKUivvpedQHSGCucZNXlcH0vSl
	 6LMhKrsd47tdNEwKB91CjpgwwNSRZCIErLofSJI3WU/cYfTc5VVb4f73wVz27lcpnG
	 mfOCmTLx1N1wg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 02/19] lib/crypto: gf128hash: Support GF128HASH_ARCH without all POLYVAL functions
Date: Wed, 18 Mar 2026 23:17:03 -0700
Message-ID: <20260319061723.1140720-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319061723.1140720-1-ebiggers@kernel.org>
References: <20260319061723.1140720-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_231916_883982_7D9F23B0 
X-CRM114-Status: GOOD (  18.17  )
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

Currently, some architectures (arm64 and x86) have optimized code for
both GHASH and POLYVAL.  Others (arm, powerpc, riscv, and s390) have
optimized code only for GHASH.  While POLYVAL support could be
implemented on these other architectures, until then we need to support
the case where arch-optimized functions are present only for GHASH.

Therefore, update the support for arch-optimized POLYVAL functions to
allow architectures to opt into supporting these functions individually.

The new meaning of CONFIG_CRYPTO_LIB_GF128HASH_ARCH is that some level
of GHASH and/or POLYVAL acceleration is provided.

Also provide an implementation of polyval_mul() based on
polyval_blocks_arch(), for when polyval_mul_arch() isn't implemented.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/gf128hash.h   | 22 +++-------------------
 lib/crypto/arm64/gf128hash.h |  3 +++
 lib/crypto/gf128hash.c       | 16 ++++++++++++----
 lib/crypto/x86/gf128hash.h   |  3 +++
 4 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/include/crypto/gf128hash.h b/include/crypto/gf128hash.h
index 5ffa86f5c13f..1052041e3499 100644
--- a/include/crypto/gf128hash.h
+++ b/include/crypto/gf128hash.h
@@ -42,24 +42,18 @@ struct polyval_elem {
  *
  * By H^i we mean H^(i-1) * H * x^-128, with base case H^1 = H.  I.e. the
  * exponentiation repeats the POLYVAL dot operation, with its "extra" x^-128.
  */
 struct polyval_key {
-#ifdef CONFIG_CRYPTO_LIB_GF128HASH_ARCH
-#ifdef CONFIG_ARM64
-	/** @h_powers: Powers of the hash key H^8 through H^1 */
-	struct polyval_elem h_powers[8];
-#elif defined(CONFIG_X86)
+#if defined(CONFIG_CRYPTO_LIB_GF128HASH_ARCH) && \
+	(defined(CONFIG_ARM64) || defined(CONFIG_X86))
 	/** @h_powers: Powers of the hash key H^8 through H^1 */
 	struct polyval_elem h_powers[8];
 #else
-#error "Unhandled arch"
-#endif
-#else /* CONFIG_CRYPTO_LIB_GF128HASH_ARCH */
 	/** @h: The hash key H */
 	struct polyval_elem h;
-#endif /* !CONFIG_CRYPTO_LIB_GF128HASH_ARCH */
+#endif
 };
 
 /**
  * struct polyval_ctx - Context for computing a POLYVAL value
  * @key: Pointer to the prepared POLYVAL key.  The user of the API is
@@ -82,23 +76,13 @@ struct polyval_ctx {
  * copy, or it may involve precomputing powers of the key, depending on the
  * platform's POLYVAL implementation.
  *
  * Context: Any context.
  */
-#ifdef CONFIG_CRYPTO_LIB_GF128HASH_ARCH
 void polyval_preparekey(struct polyval_key *key,
 			const u8 raw_key[POLYVAL_BLOCK_SIZE]);
 
-#else
-static inline void polyval_preparekey(struct polyval_key *key,
-				      const u8 raw_key[POLYVAL_BLOCK_SIZE])
-{
-	/* Just a simple copy, so inline it. */
-	memcpy(key->h.bytes, raw_key, POLYVAL_BLOCK_SIZE);
-}
-#endif
-
 /**
  * polyval_init() - Initialize a POLYVAL context for a new message
  * @ctx: The context to initialize
  * @key: The key to use.  Note that a pointer to the key is saved in the
  *	 context, so the key must live at least as long as the context.
diff --git a/lib/crypto/arm64/gf128hash.h b/lib/crypto/arm64/gf128hash.h
index c1012007adcf..796c36804dda 100644
--- a/lib/crypto/arm64/gf128hash.h
+++ b/lib/crypto/arm64/gf128hash.h
@@ -15,10 +15,11 @@ asmlinkage void polyval_mul_pmull(struct polyval_elem *a,
 				  const struct polyval_elem *b);
 asmlinkage void polyval_blocks_pmull(struct polyval_elem *acc,
 				     const struct polyval_key *key,
 				     const u8 *data, size_t nblocks);
 
+#define polyval_preparekey_arch polyval_preparekey_arch
 static void polyval_preparekey_arch(struct polyval_key *key,
 				    const u8 raw_key[POLYVAL_BLOCK_SIZE])
 {
 	static_assert(ARRAY_SIZE(key->h_powers) == NUM_H_POWERS);
 	memcpy(&key->h_powers[NUM_H_POWERS - 1], raw_key, POLYVAL_BLOCK_SIZE);
@@ -38,10 +39,11 @@ static void polyval_preparekey_arch(struct polyval_key *key,
 					    &key->h_powers[NUM_H_POWERS - 1]);
 		}
 	}
 }
 
+#define polyval_mul_arch polyval_mul_arch
 static void polyval_mul_arch(struct polyval_elem *acc,
 			     const struct polyval_key *key)
 {
 	if (static_branch_likely(&have_pmull) && may_use_simd()) {
 		scoped_ksimd()
@@ -49,10 +51,11 @@ static void polyval_mul_arch(struct polyval_elem *acc,
 	} else {
 		polyval_mul_generic(acc, &key->h_powers[NUM_H_POWERS - 1]);
 	}
 }
 
+#define polyval_blocks_arch polyval_blocks_arch
 static void polyval_blocks_arch(struct polyval_elem *acc,
 				const struct polyval_key *key,
 				const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_pmull) && may_use_simd()) {
diff --git a/lib/crypto/gf128hash.c b/lib/crypto/gf128hash.c
index 8bb848bf26b7..05f44a9193f7 100644
--- a/lib/crypto/gf128hash.c
+++ b/lib/crypto/gf128hash.c
@@ -215,20 +215,24 @@ polyval_blocks_generic(struct polyval_elem *acc, const struct polyval_elem *key,
 		polyval_mul_generic(acc, key);
 		data += POLYVAL_BLOCK_SIZE;
 	} while (--nblocks);
 }
 
-/* Include the arch-optimized implementation of POLYVAL, if one is available. */
 #ifdef CONFIG_CRYPTO_LIB_GF128HASH_ARCH
 #include "gf128hash.h" /* $(SRCARCH)/gf128hash.h */
+#endif
+
 void polyval_preparekey(struct polyval_key *key,
 			const u8 raw_key[POLYVAL_BLOCK_SIZE])
 {
+#ifdef polyval_preparekey_arch
 	polyval_preparekey_arch(key, raw_key);
+#else
+	memcpy(key->h.bytes, raw_key, POLYVAL_BLOCK_SIZE);
+#endif
 }
 EXPORT_SYMBOL_GPL(polyval_preparekey);
-#endif /* Else, polyval_preparekey() is an inline function. */
 
 /*
  * polyval_mul_generic() and polyval_blocks_generic() take the key as a
  * polyval_elem rather than a polyval_key, so that arch-optimized
  * implementations with a different key format can use it as a fallback (if they
@@ -236,21 +240,25 @@ EXPORT_SYMBOL_GPL(polyval_preparekey);
  * code is needed to pass the appropriate key argument.
  */
 
 static void polyval_mul(struct polyval_ctx *ctx)
 {
-#ifdef CONFIG_CRYPTO_LIB_GF128HASH_ARCH
+#ifdef polyval_mul_arch
 	polyval_mul_arch(&ctx->acc, ctx->key);
+#elif defined(polyval_blocks_arch)
+	static const u8 zeroes[POLYVAL_BLOCK_SIZE];
+
+	polyval_blocks_arch(&ctx->acc, ctx->key, zeroes, 1);
 #else
 	polyval_mul_generic(&ctx->acc, &ctx->key->h);
 #endif
 }
 
 static void polyval_blocks(struct polyval_ctx *ctx,
 			   const u8 *data, size_t nblocks)
 {
-#ifdef CONFIG_CRYPTO_LIB_GF128HASH_ARCH
+#ifdef polyval_blocks_arch
 	polyval_blocks_arch(&ctx->acc, ctx->key, data, nblocks);
 #else
 	polyval_blocks_generic(&ctx->acc, &ctx->key->h, data, nblocks);
 #endif
 }
diff --git a/lib/crypto/x86/gf128hash.h b/lib/crypto/x86/gf128hash.h
index fe506cf6431b..adf6147ea677 100644
--- a/lib/crypto/x86/gf128hash.h
+++ b/lib/crypto/x86/gf128hash.h
@@ -15,10 +15,11 @@ asmlinkage void polyval_mul_pclmul_avx(struct polyval_elem *a,
 				       const struct polyval_elem *b);
 asmlinkage void polyval_blocks_pclmul_avx(struct polyval_elem *acc,
 					  const struct polyval_key *key,
 					  const u8 *data, size_t nblocks);
 
+#define polyval_preparekey_arch polyval_preparekey_arch
 static void polyval_preparekey_arch(struct polyval_key *key,
 				    const u8 raw_key[POLYVAL_BLOCK_SIZE])
 {
 	static_assert(ARRAY_SIZE(key->h_powers) == NUM_H_POWERS);
 	memcpy(&key->h_powers[NUM_H_POWERS - 1], raw_key, POLYVAL_BLOCK_SIZE);
@@ -38,10 +39,11 @@ static void polyval_preparekey_arch(struct polyval_key *key,
 					    &key->h_powers[NUM_H_POWERS - 1]);
 		}
 	}
 }
 
+#define polyval_mul_arch polyval_mul_arch
 static void polyval_mul_arch(struct polyval_elem *acc,
 			     const struct polyval_key *key)
 {
 	if (static_branch_likely(&have_pclmul_avx) && irq_fpu_usable()) {
 		kernel_fpu_begin();
@@ -50,10 +52,11 @@ static void polyval_mul_arch(struct polyval_elem *acc,
 	} else {
 		polyval_mul_generic(acc, &key->h_powers[NUM_H_POWERS - 1]);
 	}
 }
 
+#define polyval_blocks_arch polyval_blocks_arch
 static void polyval_blocks_arch(struct polyval_elem *acc,
 				const struct polyval_key *key,
 				const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_pclmul_avx) && irq_fpu_usable()) {
-- 
2.53.0


