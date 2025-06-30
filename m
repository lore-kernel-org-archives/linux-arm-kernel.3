Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1EFC83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3g/tbVled0mo1ly/nQoklZkTo7safDsou8iFpM2fLY=; b=t6VJFeR1wR0WqGHRHautZoF2Qa
	k8sijj9/xF+P/eLhxDXb7i6yskTYgv4RCD7EK2oYMR81KEoIpkPBKqO3LvY/E1PK94NxbYrMTV78Y
	3WjsJk1EhphpS9hU4MqZSNtDDTPOH243xsjZvHuwVy5TY6bnzsQbClR5Nn/838w8KKlCGwNz2cON8
	5pP0CdDKRFq0g1vYdNRFCuf4KOAm9Yh46Y9fEmFlmuXWZNgtOZQCLp8lBFCaXEHqBOQDqFztvlun3
	ZxjsJ3QdVFO4YflWiQzI213X4qH9hk43/yrPl9iDhxLGjynURmZcNDLJNQkQvACaNQ25c7W4OlD8C
	AV8cR1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHSf-00000002wda-424Y;
	Mon, 30 Jun 2025 16:34:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH0X-00000002okc-1hsA;
	Mon, 30 Jun 2025 16:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D01E56143B;
	Mon, 30 Jun 2025 16:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536DBC4CEF3;
	Mon, 30 Jun 2025 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299524;
	bh=YQHYLY6F1cq4RblU0sL33f+9Pc6WlUUBxaZXFrCosr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mf7RO/Yg88sVHOL8L6t+pEWuB/+/x8zfTDaX8FyJzC4xydr3sH/BRW3DoD+J4hbHX
	 AoDCornq7fnZJ122yoech7YF28ah37XJlQunAm8FbpA0fdTkNA2ZcOugIj8p49SDKy
	 j/I65KSb2/Ynk9wU2P031Xtzt8SxlaUMFoXUpVwuxb1NBJuBxaWRf1RrxfscyOPBSF
	 AloMwdLGt/88dpVK3sPmS3a0rBI+lj53NTYYxdngzGDwVYti2lS/G0SHTwniZqPBov
	 4x1VpeHJ5XXtj0J3Fl7FEx1+A/1+Zj6OGtbNOb5Mqnnfm0ZrGJLe3Ym9F1SK8gL1da
	 w94/olI10A8Vw==
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
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 06/16] crypto: sha512 - Use same state format as legacy drivers
Date: Mon, 30 Jun 2025 09:03:10 -0700
Message-ID: <20250630160320.2888-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160320.2888-1-ebiggers@kernel.org>
References: <20250630160320.2888-1-ebiggers@kernel.org>
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

Make the export and import functions for the sha384, sha512,
hmac(sha384), and hmac(sha512) shash algorithms use the same format as
the padlock-sha and nx-sha512 drivers, as required by Herbert.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/sha512.c | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/crypto/sha512.c b/crypto/sha512.c
index d1e5400fe5906..fb1c520978ef3 100644
--- a/crypto/sha512.c
+++ b/crypto/sha512.c
@@ -10,10 +10,48 @@
 #include <crypto/internal/hash.h>
 #include <crypto/sha2.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+/*
+ * Export and import functions.  crypto_shash wants a particular format that
+ * matches that used by some legacy drivers.  It currently is the same as the
+ * library SHA context, except the value in bytecount_lo must be block-aligned
+ * and the remainder must be stored in an extra u8 appended to the struct.
+ */
+
+#define SHA512_SHASH_STATE_SIZE 209
+static_assert(offsetof(struct __sha512_ctx, state) == 0);
+static_assert(offsetof(struct __sha512_ctx, bytecount_lo) == 64);
+static_assert(offsetof(struct __sha512_ctx, bytecount_hi) == 72);
+static_assert(offsetof(struct __sha512_ctx, buf) == 80);
+static_assert(sizeof(struct __sha512_ctx) + 1 == SHA512_SHASH_STATE_SIZE);
+
+static int __crypto_sha512_export(const struct __sha512_ctx *ctx0, void *out)
+{
+	struct __sha512_ctx ctx = *ctx0;
+	unsigned int partial;
+	u8 *p = out;
+
+	partial = ctx.bytecount_lo % SHA512_BLOCK_SIZE;
+	ctx.bytecount_lo -= partial;
+	memcpy(p, &ctx, sizeof(ctx));
+	p += sizeof(ctx);
+	*p = partial;
+	return 0;
+}
+
+static int __crypto_sha512_import(struct __sha512_ctx *ctx, const void *in)
+{
+	const u8 *p = in;
+
+	memcpy(ctx, p, sizeof(*ctx));
+	p += sizeof(*ctx);
+	ctx->bytecount_lo += *p;
+	return 0;
+}
+
 /* SHA-384 */
 
 const u8 sha384_zero_message_hash[SHA384_DIGEST_SIZE] = {
 	0x38, 0xb0, 0x60, 0xa7, 0x51, 0xac, 0x96, 0x38,
 	0x4c, 0xd9, 0x32, 0x7e, 0xb1, 0xb1, 0xe3, 0x6a,
@@ -50,10 +88,20 @@ static int crypto_sha384_digest(struct shash_desc *desc,
 {
 	sha384(data, len, out);
 	return 0;
 }
 
+static int crypto_sha384_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha512_export(&SHA384_CTX(desc)->ctx, out);
+}
+
+static int crypto_sha384_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha512_import(&SHA384_CTX(desc)->ctx, in);
+}
+
 /* SHA-512 */
 
 const u8 sha512_zero_message_hash[SHA512_DIGEST_SIZE] = {
 	0xcf, 0x83, 0xe1, 0x35, 0x7e, 0xef, 0xb8, 0xbd,
 	0xf1, 0x54, 0x28, 0x50, 0xd6, 0x6d, 0x80, 0x07,
@@ -92,10 +140,20 @@ static int crypto_sha512_digest(struct shash_desc *desc,
 {
 	sha512(data, len, out);
 	return 0;
 }
 
+static int crypto_sha512_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha512_export(&SHA512_CTX(desc)->ctx, out);
+}
+
+static int crypto_sha512_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha512_import(&SHA512_CTX(desc)->ctx, in);
+}
+
 /* HMAC-SHA384 */
 
 #define HMAC_SHA384_KEY(tfm) ((struct hmac_sha384_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA384_CTX(desc) ((struct hmac_sha384_ctx *)shash_desc_ctx(desc))
 
@@ -131,10 +189,23 @@ static int crypto_hmac_sha384_digest(struct shash_desc *desc,
 {
 	hmac_sha384(HMAC_SHA384_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha384_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha512_export(&HMAC_SHA384_CTX(desc)->ctx.sha_ctx, out);
+}
+
+static int crypto_hmac_sha384_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha384_ctx *ctx = HMAC_SHA384_CTX(desc);
+
+	ctx->ctx.ostate = HMAC_SHA384_KEY(desc->tfm)->key.ostate;
+	return __crypto_sha512_import(&ctx->ctx.sha_ctx, in);
+}
+
 /* HMAC-SHA512 */
 
 #define HMAC_SHA512_KEY(tfm) ((struct hmac_sha512_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA512_CTX(desc) ((struct hmac_sha512_ctx *)shash_desc_ctx(desc))
 
@@ -170,10 +241,23 @@ static int crypto_hmac_sha512_digest(struct shash_desc *desc,
 {
 	hmac_sha512(HMAC_SHA512_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha512_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha512_export(&HMAC_SHA512_CTX(desc)->ctx.sha_ctx, out);
+}
+
+static int crypto_hmac_sha512_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha512_ctx *ctx = HMAC_SHA512_CTX(desc);
+
+	ctx->ctx.ostate = HMAC_SHA512_KEY(desc->tfm)->key.ostate;
+	return __crypto_sha512_import(&ctx->ctx.sha_ctx, in);
+}
+
 /* Algorithm definitions */
 
 static struct shash_alg algs[] = {
 	{
 		.base.cra_name		= "sha384",
@@ -184,11 +268,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA384_DIGEST_SIZE,
 		.init			= crypto_sha384_init,
 		.update			= crypto_sha384_update,
 		.final			= crypto_sha384_final,
 		.digest			= crypto_sha384_digest,
+		.export			= crypto_sha384_export,
+		.import			= crypto_sha384_import,
 		.descsize		= sizeof(struct sha384_ctx),
+		.statesize		= SHA512_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "sha512",
 		.base.cra_driver_name	= "sha512-lib",
 		.base.cra_priority	= 300,
@@ -197,11 +284,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA512_DIGEST_SIZE,
 		.init			= crypto_sha512_init,
 		.update			= crypto_sha512_update,
 		.final			= crypto_sha512_final,
 		.digest			= crypto_sha512_digest,
+		.export			= crypto_sha512_export,
+		.import			= crypto_sha512_import,
 		.descsize		= sizeof(struct sha512_ctx),
+		.statesize		= SHA512_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha384)",
 		.base.cra_driver_name	= "hmac-sha384-lib",
 		.base.cra_priority	= 300,
@@ -212,11 +302,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha384_setkey,
 		.init			= crypto_hmac_sha384_init,
 		.update			= crypto_hmac_sha384_update,
 		.final			= crypto_hmac_sha384_final,
 		.digest			= crypto_hmac_sha384_digest,
+		.export			= crypto_hmac_sha384_export,
+		.import			= crypto_hmac_sha384_import,
 		.descsize		= sizeof(struct hmac_sha384_ctx),
+		.statesize		= SHA512_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha512)",
 		.base.cra_driver_name	= "hmac-sha512-lib",
 		.base.cra_priority	= 300,
@@ -227,11 +320,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha512_setkey,
 		.init			= crypto_hmac_sha512_init,
 		.update			= crypto_hmac_sha512_update,
 		.final			= crypto_hmac_sha512_final,
 		.digest			= crypto_hmac_sha512_digest,
+		.export			= crypto_hmac_sha512_export,
+		.import			= crypto_hmac_sha512_import,
 		.descsize		= sizeof(struct hmac_sha512_ctx),
+		.statesize		= SHA512_SHASH_STATE_SIZE,
 	},
 };
 
 static int __init crypto_sha512_mod_init(void)
 {
-- 
2.50.0


