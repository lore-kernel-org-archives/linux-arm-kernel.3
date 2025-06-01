Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5647C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Jun 2025 23:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0Y8menV7yjk2FqCvshFVcPkgIOzs0nXGE7PFZIIXUs=; b=dV7N/6ShMBif+JBGAyeoY5wa7J
	+guZ8NL/cbU8w9DPMhXDZhZfEDFheSLnS47aK7Rphe99XyDTYSdzM2VrpU4Y62jqy9ILpK8YYWgET
	ERYfcODyEntGiwdXItF14UIQmJEooZgq17pnRiMwzTj2TW2LynnSaJdvYWnCgZfaJ21NAIG1efkl+
	FO44EeJAtJXGytKu/BrsrkfAmjm/7C9zXbhLMClm4dqgVitX5c+SHd/Di0Vf+L1rKetqTB/aqoDKT
	R6OCLufGfdvIhRCY8sl4RJwzx7vuH5g9tU7KyYoTTagTI4REZE+hbJ2vwDjS1iyu1a5znM5arehEo
	XUgrHCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrjB-000000063MD-27At;
	Sun, 01 Jun 2025 23:04:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLrRE-000000060wj-17Ew;
	Sun, 01 Jun 2025 22:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 259304A838;
	Sun,  1 Jun 2025 22:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E5FC4AF09;
	Sun,  1 Jun 2025 22:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748817954;
	bh=DuymbRdfQNASqdv95GmKI7xo6X3aqFKpkNJXYJg46+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s5KZx5zFP0pmjW+yPAWdh9HSDJ2eN9w2ECvi4PqHcvu7LAXDpxsbC+W620rIBoLrE
	 DznkxM4gfP4EgC5XNbW/1IZSwXBfLwYb/IAzXBTSTWzJC4xcVQe3Kc8S5SaI7DgHDo
	 zB1yc7zunGBGTw5P/TzAbj5R/07z6Jz4uDjDkknV7a/3ATwioeZfpMpSDAJIGlwvmZ
	 lDcK7YxikgkmIs33oVtz5QhNny84wp9XVplAzVmdhy00Q1kCZDwflOiPDRUlhAlYk2
	 Eg0xXw+k7lVB/hD59SGVjKJq3uODrL4J9EKIvDT8fqH39+CwyxjA3VwspzvlJX9AJO
	 fhH3nLtfKMqaw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 02/13] crypto/crc32c: register only one shash_alg
Date: Sun,  1 Jun 2025 15:44:30 -0700
Message-ID: <20250601224441.778374-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601224441.778374-1-ebiggers@kernel.org>
References: <20250601224441.778374-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_154556_346038_BA6523A7 
X-CRM114-Status: GOOD (  13.79  )
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

Stop unnecessarily registering a "crc32c-generic" shash_alg when a
"crc32c-$(ARCH)" shash_alg is registered too.

While every algorithm does need to have a generic implementation to
ensure uniformity of support across platforms, that doesn't mean that we
need to make the generic implementation available through crypto_shash
when an optimized implementation is also available.

Registering the generic shash_alg did allow users of the crypto_shash or
crypto_ahash APIs to request the generic implementation specifically,
instead of an optimized one.  However, the only known use case for that
was the differential fuzz tests in crypto/testmgr.c.  Equivalent test
coverage is now provided by crc_kunit.

Besides simplifying crypto/crc32c.c, this change eliminates the need for
the library to provide crc32c_base() as part of its interface.  Later
patches will make crc32c_base() be internal to the library.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/crc32c.c | 70 +++++++------------------------------------------
 1 file changed, 10 insertions(+), 60 deletions(-)

diff --git a/crypto/crc32c.c b/crypto/crc32c.c
index e5377898414a2..e160695682f16 100644
--- a/crypto/crc32c.c
+++ b/crypto/crc32c.c
@@ -83,19 +83,10 @@ static int chksum_setkey(struct crypto_shash *tfm, const u8 *key,
 static int chksum_update(struct shash_desc *desc, const u8 *data,
 			 unsigned int length)
 {
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
-	ctx->crc = crc32c_base(ctx->crc, data, length);
-	return 0;
-}
-
-static int chksum_update_arch(struct shash_desc *desc, const u8 *data,
-			      unsigned int length)
-{
-	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
-
 	ctx->crc = crc32c(ctx->crc, data, length);
 	return 0;
 }
 
 static int chksum_final(struct shash_desc *desc, u8 *out)
@@ -105,17 +96,10 @@ static int chksum_final(struct shash_desc *desc, u8 *out)
 	put_unaligned_le32(~ctx->crc, out);
 	return 0;
 }
 
 static int __chksum_finup(u32 *crcp, const u8 *data, unsigned int len, u8 *out)
-{
-	put_unaligned_le32(~crc32c_base(*crcp, data, len), out);
-	return 0;
-}
-
-static int __chksum_finup_arch(u32 *crcp, const u8 *data, unsigned int len,
-			       u8 *out)
 {
 	put_unaligned_le32(~crc32c(*crcp, data, len), out);
 	return 0;
 }
 
@@ -125,98 +109,64 @@ static int chksum_finup(struct shash_desc *desc, const u8 *data,
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
 	return __chksum_finup(&ctx->crc, data, len, out);
 }
 
-static int chksum_finup_arch(struct shash_desc *desc, const u8 *data,
-			     unsigned int len, u8 *out)
-{
-	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	return __chksum_finup_arch(&ctx->crc, data, len, out);
-}
-
 static int chksum_digest(struct shash_desc *desc, const u8 *data,
 			 unsigned int length, u8 *out)
 {
 	struct chksum_ctx *mctx = crypto_shash_ctx(desc->tfm);
 
 	return __chksum_finup(&mctx->key, data, length, out);
 }
 
-static int chksum_digest_arch(struct shash_desc *desc, const u8 *data,
-			      unsigned int length, u8 *out)
-{
-	struct chksum_ctx *mctx = crypto_shash_ctx(desc->tfm);
-
-	return __chksum_finup_arch(&mctx->key, data, length, out);
-}
-
 static int crc32c_cra_init(struct crypto_tfm *tfm)
 {
 	struct chksum_ctx *mctx = crypto_tfm_ctx(tfm);
 
 	mctx->key = ~0;
 	return 0;
 }
 
-static struct shash_alg algs[] = {{
+static struct shash_alg alg = {
 	.digestsize		= CHKSUM_DIGEST_SIZE,
 	.setkey			= chksum_setkey,
 	.init			= chksum_init,
 	.update			= chksum_update,
 	.final			= chksum_final,
 	.finup			= chksum_finup,
 	.digest			= chksum_digest,
 	.descsize		= sizeof(struct chksum_desc_ctx),
 
 	.base.cra_name		= "crc32c",
-	.base.cra_driver_name	= "crc32c-generic",
 	.base.cra_priority	= 100,
 	.base.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
 	.base.cra_blocksize	= CHKSUM_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct chksum_ctx),
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_init		= crc32c_cra_init,
-}, {
-	.digestsize		= CHKSUM_DIGEST_SIZE,
-	.setkey			= chksum_setkey,
-	.init			= chksum_init,
-	.update			= chksum_update_arch,
-	.final			= chksum_final,
-	.finup			= chksum_finup_arch,
-	.digest			= chksum_digest_arch,
-	.descsize		= sizeof(struct chksum_desc_ctx),
-
-	.base.cra_name		= "crc32c",
-	.base.cra_driver_name	= "crc32c-" __stringify(ARCH),
-	.base.cra_priority	= 150,
-	.base.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
-	.base.cra_blocksize	= CHKSUM_BLOCK_SIZE,
-	.base.cra_ctxsize	= sizeof(struct chksum_ctx),
-	.base.cra_module	= THIS_MODULE,
-	.base.cra_init		= crc32c_cra_init,
-}};
-
-static int num_algs;
+};
 
 static int __init crc32c_mod_init(void)
 {
-	/* register the arch flavor only if it differs from the generic one */
-	num_algs = 1 + ((crc32_optimizations() & CRC32C_OPTIMIZATION) != 0);
+	const char *driver_name =
+		(crc32_optimizations() & CRC32C_OPTIMIZATION) ?
+			"crc32c-" __stringify(ARCH) :
+			"crc32c-generic";
+
+	strscpy(alg.base.cra_driver_name, driver_name, CRYPTO_MAX_ALG_NAME);
 
-	return crypto_register_shashes(algs, num_algs);
+	return crypto_register_shash(&alg);
 }
 
 static void __exit crc32c_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, num_algs);
+	crypto_unregister_shash(&alg);
 }
 
 module_init(crc32c_mod_init);
 module_exit(crc32c_mod_fini);
 
 MODULE_AUTHOR("Clay Haapala <chaapala@cisco.com>");
 MODULE_DESCRIPTION("CRC32c (Castagnoli) calculations wrapper for lib/crc32c");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_CRYPTO("crc32c");
-MODULE_ALIAS_CRYPTO("crc32c-generic");
-- 
2.49.0


