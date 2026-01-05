Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F76C2A075
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FnNbpGrvlniCMOLch6NApfeJnytZoAyLzv1qsCY88o=; b=yHEJd7V881tOrGtQC1fMUWiIl+
	rlkAEblh3f2vLWJq1uq4+QHg8NaJmJABER/vDqs5Xl/E+toqq09CiU2vp3vQnx6+MllVeof1wP5J8
	TEHMjh1e7Z7fZfKt7U+O4pR9lmX8hBsWallcyGdQWrI8iTy0aDeh2ux2HV+nGKJXGHtw/mU5zRROz
	kkkN9UYNUNmoTMFlQkg+nlVZsrch6peOz57k44dpuqyiF7NtNhg5CzGKuSfOZLW8n39IAOecDKa3L
	r4QbZU3+tOmWSNqOD6kNJ3VCrPy7A18zgR7rBl9a4SfJMu7r068s7Uvf4WjwC9zp3jZ/RMtwea0+I
	sY/U71jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccyZ-0000000AnEH-02KI;
	Mon, 05 Jan 2026 05:17:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvw-0000000Aj3N-3qHj;
	Mon, 05 Jan 2026 05:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 876B344315;
	Mon,  5 Jan 2026 05:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC91C2BCB0;
	Mon,  5 Jan 2026 05:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590112;
	bh=6GiGUP+X4gmyZFn4wILAzmE5Daf6tx/zz/5Ty9L/V2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hn+T5ja72OrFlu0ck1rY36j7hbDeSAIJtr1r2XfD5CZBBnXK82U0S2S5vVueu6vnL
	 Ghn7LwihQM4Z1AZgO8m2aTE58Q+/Bjc/ZK+eWiEUcVhHFW0NBhChppDwY4rzIw+g+C
	 9p8jFujFM0C3hdvjFzSGjopv0y2xHajarIJvzOiV6qYl0h0iSEtW22Hz9i75CDqSyT
	 1QIjgA+t/pE1tWp7u+IpsDLawczDOM+9cHXE3mm2OstI914Q9UN3LNYriQKKxBDTTM
	 ALoc6OJvSK74qp7/vu/2Sm30b3bE6cpISIQX3QSUh3SiADUd6TRP9CGyKcBloveSWy
	 OJK/pBYjbcdtw==
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
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 33/36] lib/crypto: aesgcm: Use new AES library API
Date: Sun,  4 Jan 2026 21:13:06 -0800
Message-ID: <20260105051311.1607207-34-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_211513_207057_48F977AC 
X-CRM114-Status: GOOD (  14.05  )
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note: aes_encrypt_new() will be renamed to aes_encrypt() once all
callers of the old aes_encrypt() have been updated.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/gcm.h |  2 +-
 lib/crypto/aesgcm.c  | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/crypto/gcm.h b/include/crypto/gcm.h
index fd9df607a836..b524e47bd4d0 100644
--- a/include/crypto/gcm.h
+++ b/include/crypto/gcm.h
@@ -64,11 +64,11 @@ static inline int crypto_ipsec_check_assoclen(unsigned int assoclen)
 	return 0;
 }
 
 struct aesgcm_ctx {
 	be128			ghash_key;
-	struct crypto_aes_ctx	aes_ctx;
+	struct aes_enckey	aes_key;
 	unsigned int		authsize;
 };
 
 int aesgcm_expandkey(struct aesgcm_ctx *ctx, const u8 *key,
 		     unsigned int keysize, unsigned int authsize);
diff --git a/lib/crypto/aesgcm.c b/lib/crypto/aesgcm.c
index ac0b2fcfd606..19106fe008fd 100644
--- a/lib/crypto/aesgcm.c
+++ b/lib/crypto/aesgcm.c
@@ -10,11 +10,11 @@
 #include <crypto/ghash.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <asm/irqflags.h>
 
-static void aesgcm_encrypt_block(const struct crypto_aes_ctx *ctx, void *dst,
+static void aesgcm_encrypt_block(const struct aes_enckey *key, void *dst,
 				 const void *src)
 {
 	unsigned long flags;
 
 	/*
@@ -24,11 +24,11 @@ static void aesgcm_encrypt_block(const struct crypto_aes_ctx *ctx, void *dst,
 	 * mitigates this risk to some extent by pulling the entire S-box into
 	 * the caches before doing any substitutions, but this strategy is more
 	 * effective when running with interrupts disabled.
 	 */
 	local_irq_save(flags);
-	aes_encrypt(ctx, dst, src);
+	aes_encrypt_new(key, dst, src);
 	local_irq_restore(flags);
 }
 
 /**
  * aesgcm_expandkey - Expands the AES and GHASH keys for the AES-GCM key
@@ -47,16 +47,16 @@ int aesgcm_expandkey(struct aesgcm_ctx *ctx, const u8 *key,
 {
 	u8 kin[AES_BLOCK_SIZE] = {};
 	int ret;
 
 	ret = crypto_gcm_check_authsize(authsize) ?:
-	      aes_expandkey(&ctx->aes_ctx, key, keysize);
+	      aes_prepareenckey(&ctx->aes_key, key, keysize);
 	if (ret)
 		return ret;
 
 	ctx->authsize = authsize;
-	aesgcm_encrypt_block(&ctx->aes_ctx, &ctx->ghash_key, kin);
+	aesgcm_encrypt_block(&ctx->aes_key, &ctx->ghash_key, kin);
 
 	return 0;
 }
 EXPORT_SYMBOL(aesgcm_expandkey);
 
@@ -95,11 +95,11 @@ static void aesgcm_mac(const struct aesgcm_ctx *ctx, const u8 *src, int src_len,
 	aesgcm_ghash(&ghash, &ctx->ghash_key, assoc, assoc_len);
 	aesgcm_ghash(&ghash, &ctx->ghash_key, src, src_len);
 	aesgcm_ghash(&ghash, &ctx->ghash_key, &tail, sizeof(tail));
 
 	ctr[3] = cpu_to_be32(1);
-	aesgcm_encrypt_block(&ctx->aes_ctx, buf, ctr);
+	aesgcm_encrypt_block(&ctx->aes_key, buf, ctr);
 	crypto_xor_cpy(authtag, buf, (u8 *)&ghash, ctx->authsize);
 
 	memzero_explicit(&ghash, sizeof(ghash));
 	memzero_explicit(buf, sizeof(buf));
 }
@@ -117,11 +117,11 @@ static void aesgcm_crypt(const struct aesgcm_ctx *ctx, u8 *dst, const u8 *src,
 		 * inadvertent IV reuse, which must be avoided at all cost for
 		 * stream ciphers such as AES-CTR. Given the range of 'int
 		 * len', this cannot happen, so no explicit test is necessary.
 		 */
 		ctr[3] = cpu_to_be32(n++);
-		aesgcm_encrypt_block(&ctx->aes_ctx, buf, ctr);
+		aesgcm_encrypt_block(&ctx->aes_key, buf, ctr);
 		crypto_xor_cpy(dst, src, buf, min(len, AES_BLOCK_SIZE));
 
 		dst += AES_BLOCK_SIZE;
 		src += AES_BLOCK_SIZE;
 		len -= AES_BLOCK_SIZE;
-- 
2.52.0


