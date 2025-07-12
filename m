Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC6CC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 23:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1abNJfl1xsUHUqVZktCpcmgxptnywOe0C82GJUxJZGY=; b=V63CCygTKOlRPq0/MYOiIhXdvj
	9selBqAaa1DlV19rZxG3O96F0Z/W9mV8kn5P9aFXmZgiWzmbcK+Nja3E/jt2nSc2IBKagVO1mqiUL
	EaoR1vV0Ujb2gfHeqf/vvRzwtiDMUbA5eZcntsvsZrGB04aSL4gjjLg6/KleIgrskBWkiyidl3sOB
	n7WRjz9EXjI5kIhZ8vGsDrGAAv7x0ewMT9mqjJDDOyiIiIBQ+85bSqOG4xk6W2bssXC0voGvNCYMZ
	VQpjfMbQ2C8qb+c14ZdW5VJoZgAXBwGTzNcqOBjHjSO6kBmybgI+78QMeOiBMj2MMcFzgdv1ldYmH
	adXJCgfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajqB-0000000HA2w-0F4o;
	Sat, 12 Jul 2025 23:41:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajbr-0000000H7WV-3bKI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 684675C5567;
	Sat, 12 Jul 2025 23:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA18C4CEF5;
	Sat, 12 Jul 2025 23:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362783;
	bh=n359i41djwWU+CGbW44dWKxffZV+egIZKibwbQ46oIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K8YbndeO+dMZGy3v3A29yW4ag3kUQJAE3I0HlAMkkp1SkG9D5Q8ojJFLySi0YHm/Q
	 DRNs3LUUmZe7vOScPcD8GdnNrJN4Iynsvd5PuxN51Ri5Zz/OD9JnoVqZDgBIspgBZJ
	 uLEJF8hZ5RNCal9KNkWNmPI/OT8wlhEAjp4pxLD5WSJQEWvDhJKpiwtoPs7t2CPqZl
	 fxjRCRMHRBzbHPJ4jp1LbQppuQU8wI8Wq3MjL2iMdrvaTQU8yofE9FK0aqLGCan2iw
	 ufT012XOOlulVEJ5QKifmXRld5x5wGSlbRCejtvEMqX6JadX77XNhU3+YbvUfUuJlB
	 CLnVb3YUz8dmA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 06/26] crypto: sha1 - Use same state format as legacy drivers
Date: Sat, 12 Jul 2025 16:22:57 -0700
Message-ID: <20250712232329.818226-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_162624_016293_80288EC5 
X-CRM114-Status: GOOD (  12.65  )
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

Same as sha256 and sha512: Use the state format that the generic partial
block handling code produces, as requested by Herbert, even though this
is applicable only to legacy drivers.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/sha1.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/crypto/sha1.c b/crypto/sha1.c
index 00e273b0401db..ecef4bf2d9c00 100644
--- a/crypto/sha1.c
+++ b/crypto/sha1.c
@@ -10,10 +10,47 @@
 #include <crypto/internal/hash.h>
 #include <crypto/sha1.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+/*
+ * Export and import functions.  crypto_shash wants a particular format that
+ * matches that used by some legacy drivers.  It currently is the same as the
+ * library SHA context, except the value in bytecount must be block-aligned and
+ * the remainder must be stored in an extra u8 appended to the struct.
+ */
+
+#define SHA1_SHASH_STATE_SIZE (sizeof(struct sha1_ctx) + 1)
+static_assert(sizeof(struct sha1_ctx) == sizeof(struct sha1_state));
+static_assert(offsetof(struct sha1_ctx, state) == offsetof(struct sha1_state, state));
+static_assert(offsetof(struct sha1_ctx, bytecount) == offsetof(struct sha1_state, count));
+static_assert(offsetof(struct sha1_ctx, buf) == offsetof(struct sha1_state, buffer));
+
+static int __crypto_sha1_export(const struct sha1_ctx *ctx0, void *out)
+{
+	struct sha1_ctx ctx = *ctx0;
+	unsigned int partial;
+	u8 *p = out;
+
+	partial = ctx.bytecount % SHA1_BLOCK_SIZE;
+	ctx.bytecount -= partial;
+	memcpy(p, &ctx, sizeof(ctx));
+	p += sizeof(ctx);
+	*p = partial;
+	return 0;
+}
+
+static int __crypto_sha1_import(struct sha1_ctx *ctx, const void *in)
+{
+	const u8 *p = in;
+
+	memcpy(ctx, p, sizeof(*ctx));
+	p += sizeof(*ctx);
+	ctx->bytecount += *p;
+	return 0;
+}
+
 const u8 sha1_zero_message_hash[SHA1_DIGEST_SIZE] = {
 	0xda, 0x39, 0xa3, 0xee, 0x5e, 0x6b, 0x4b, 0x0d,
 	0x32, 0x55, 0xbf, 0xef, 0x95, 0x60, 0x18, 0x90,
 	0xaf, 0xd8, 0x07, 0x09
 };
@@ -45,10 +82,20 @@ static int crypto_sha1_digest(struct shash_desc *desc,
 {
 	sha1(data, len, out);
 	return 0;
 }
 
+static int crypto_sha1_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha1_export(SHA1_CTX(desc), out);
+}
+
+static int crypto_sha1_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha1_import(SHA1_CTX(desc), in);
+}
+
 #define HMAC_SHA1_KEY(tfm) ((struct hmac_sha1_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA1_CTX(desc) ((struct hmac_sha1_ctx *)shash_desc_ctx(desc))
 
 static int crypto_hmac_sha1_setkey(struct crypto_shash *tfm,
 				   const u8 *raw_key, unsigned int keylen)
@@ -81,10 +128,23 @@ static int crypto_hmac_sha1_digest(struct shash_desc *desc,
 {
 	hmac_sha1(HMAC_SHA1_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha1_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha1_export(&HMAC_SHA1_CTX(desc)->sha_ctx, out);
+}
+
+static int crypto_hmac_sha1_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha1_ctx *ctx = HMAC_SHA1_CTX(desc);
+
+	ctx->ostate = HMAC_SHA1_KEY(desc->tfm)->ostate;
+	return __crypto_sha1_import(&ctx->sha_ctx, in);
+}
+
 static struct shash_alg algs[] = {
 	{
 		.base.cra_name		= "sha1",
 		.base.cra_driver_name	= "sha1-lib",
 		.base.cra_priority	= 300,
@@ -93,11 +153,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA1_DIGEST_SIZE,
 		.init			= crypto_sha1_init,
 		.update			= crypto_sha1_update,
 		.final			= crypto_sha1_final,
 		.digest			= crypto_sha1_digest,
+		.export			= crypto_sha1_export,
+		.import			= crypto_sha1_import,
 		.descsize		= sizeof(struct sha1_ctx),
+		.statesize		= SHA1_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha1)",
 		.base.cra_driver_name	= "hmac-sha1-lib",
 		.base.cra_priority	= 300,
@@ -108,11 +171,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha1_setkey,
 		.init			= crypto_hmac_sha1_init,
 		.update			= crypto_hmac_sha1_update,
 		.final			= crypto_hmac_sha1_final,
 		.digest			= crypto_hmac_sha1_digest,
+		.export			= crypto_hmac_sha1_export,
+		.import			= crypto_hmac_sha1_import,
 		.descsize		= sizeof(struct hmac_sha1_ctx),
+		.statesize		= SHA1_SHASH_STATE_SIZE,
 	},
 };
 
 static int __init crypto_sha1_mod_init(void)
 {
-- 
2.50.1


