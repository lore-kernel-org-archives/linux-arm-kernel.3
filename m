Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA303CF45C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eotzGZuj6oHcNUoE65S+8YyxwiDDPFCNbNf8w4JzmKg=; b=hRd9Jy3ErgV6Kl/SKPdmXx0sml
	YemxccZ3b/T3uI6ZYKY6EBGNzdjWSiRW6pR5tWCsl3A3M2g49WZ9rAmR+kt1EtyMYNluKjBtIMb3z
	njkZs5MwmYfh2yvj3bnqcaB4nxqw/dvqU1GW9PXntL6A/r6zRyaUaP4a9RUWG3OfWVizEokzI+4YN
	BQXppdnoXeQ9JGbhXGubRoCSpAn8YNOrm5N1pfvSlzx3bbIf9o7eGgTOSUgGBFbT0ny9cb7Kbe4R6
	z7CTXQbWp2FgAn7hAgILaKsjJG45jz6Sl29VjgGmjRitm5zbE4SUrecYrlqq2JEjOlU3J8/35hGs7
	+6eym+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNYU-00000006394-1WEq;
	Mon, 12 Jan 2026 19:26:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVo-00000005zEY-3d4i;
	Mon, 12 Jan 2026 19:23:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DCE344407;
	Mon, 12 Jan 2026 19:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBFBC2BCAF;
	Mon, 12 Jan 2026 19:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245816;
	bh=IaZD3/z0VruOzVsSeL0tDqsMVtMwLaUfDPIoikws89s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q3sNENqrqqcDO42H3lrCThh+O5h92X8jFa5+tyEgHLXYbkUrGuEi+TF4kolK1HG/M
	 qRHleKOVc2gNdaCvzYJzBH4ip58WuHHubI/tDcfQz+bN8BQTD3AuPGgpYpmnkfcCuC
	 9aBq4nnn6tmgXqBvr+y2xAfXBUvB3wbLUai/RlUHDoVCdB3qck4LsjpoWvgk0se1sv
	 MpKfr/zHghjuoNnlDAGcx2GhZ9jiA3JkayZabe8haqjO7Nu5GiqDiJb4KKi3aFOV32
	 CwxqAWZ7bdKY6hmIG8H89AEmcRc6JM5eRVcDODpIIZWUiVvaFNRj1xe1wnIMiIG+7S
	 a9PMzFVoUk01g==
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
Subject: [PATCH v2 33/35] lib/crypto: aesgcm: Use new AES library API
Date: Mon, 12 Jan 2026 11:20:31 -0800
Message-ID: <20260112192035.10427-34-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_112336_992703_8D57789F 
X-CRM114-Status: GOOD (  15.65  )
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

Note that in addition to the change in the key preparation function and
the key struct type itself, the change in the type of the key struct
results in aes_encrypt() (which is temporarily a type-generic macro)
calling the new encryption function rather than the old one.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
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
index ac0b2fcfd606..02f5b5f32c76 100644
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
+	aes_encrypt(key, dst, src);
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


