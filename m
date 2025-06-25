Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA8AC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GI+baXLMItSjgcBMZ7twd6x6pbRFh6QmlEtpG5t/zdQ=; b=m91K0iJmYKl9k6Du6qw1vWY2V0
	E827jmzqd/B3vGT3IFdvMltpFxMxc47wgPTmMQ4GHPxDK6CXgdFbxTbqFzpCqKpQ6DZtEZT8yNSOz
	7spEFCdu9+ZVjkyT1nxfxh+tbBZ1WPSe0e6VpZsC4zHEbBuiTpzWcysPtKQTEKLP/qxufrk6F3C1X
	TbpViixGzfgU1q9ZmGMnbcS/jpOoGN9o0eSl4oSnZxvKXsBn+MVlDVK3arwumOvcL8bz7nIWRgQnv
	zUYWl/qov6PKQu+Lcos1qM2KgwSGCAtejIA6Uk+EjmyAl6j3v4/o0udjgQufdbvPbzqrAAU6DWC5F
	WHK7/YsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMp7-00000008D75-30AT;
	Wed, 25 Jun 2025 09:53:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHH-00000007lQl-09my;
	Wed, 25 Jun 2025 07:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GI+baXLMItSjgcBMZ7twd6x6pbRFh6QmlEtpG5t/zdQ=; b=PaBBGvpmoTyNNgPYeU6GZGaNcG
	lRToE+iN7YA43x4qgNJSwzQjTCWfxN+jo6ZxWaQcYqtYj/J116ieFay6ddpRhLSjdGVsf/Sf3EWms
	mrqyfc+UTxq8KQEjzMXtWV7lvsv/9kDFqAL7G8FnDi6xviOAi0//73WjJMLCLYU7auop6JYvNZG91
	GdukDcuKeHKfnRr12rmq7X2UWnkAzp+zPMMe6P1hQgdXviST6prrHYywnn9OWnWAH4fXR10s3p84/
	9wzPaYWqPQTixLIRuSgKKwS5TP1fixpWtbCWiPDCitN2lFk9aPvwsLzUVsMJUDNN/RibrlwJ1mF4p
	sMMPD8Fg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKHD-00000005deg-2Rnj;
	Wed, 25 Jun 2025 07:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EC944AA30;
	Wed, 25 Jun 2025 07:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9507DC4CEF3;
	Wed, 25 Jun 2025 07:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835433;
	bh=IkX8c809Bkwa5YKNS0n0XaW5ZPy/jAKfSUJXB4aJ5O4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WxdR8L6aeMZxRKJr8FD2AsRFrBKpUzk1K4lUjaxONdjsjrofU9tvADZLCp7CkzrlK
	 m0K7EkyB+j5p5vLFZt6YAEpKOvT0LVBlHYDPmc3fOUaIicfbg2NYypwvKJ45xTvdGK
	 WDLnxSIouflaXT1XNx17bdfFWsUAHXRg2Ak7p6epGMBwfJGCdOvWmgBbH/JLeo/+bd
	 +6uAIVeAU7zJw/K/Pygyx77H3LapMXvu0bWMAOf5L/L0okQKFfIP2Q83geBPW7cVfI
	 CYF0Du6S/hnBtCKQ/96pidTDm63RqkmUO71j3+3VNjhpIYFQkdWzSe4ss0z4MJZf2H
	 pR0iU1NIwFyPA==
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
Subject: [PATCH 14/18] crypto: sha256 - Use same state format as legacy drivers
Date: Wed, 25 Jun 2025 00:08:15 -0700
Message-ID: <20250625070819.1496119-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_081036_512787_921E344A 
X-CRM114-Status: GOOD (  12.64  )
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

Make the export and import functions for the sha224, sha256,
hmac(sha224), and hmac(sha256) shash algorithms use the same format as
the padlock-sha and nx-sha256 drivers, as required by Herbert.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/sha256.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/crypto/sha256.c b/crypto/sha256.c
index d81166cbba953..052806559f06c 100644
--- a/crypto/sha256.c
+++ b/crypto/sha256.c
@@ -11,10 +11,47 @@
 #include <crypto/internal/hash.h>
 #include <crypto/sha2.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+/*
+ * Export and import functions.  crypto_shash wants a particular format that
+ * matches that used by some legacy drivers.  It currently is the same as the
+ * library SHA context, except the value in bytecount must be block-aligned and
+ * the remainder must be stored in an extra u8 appended to the struct.
+ */
+
+#define SHA256_SHASH_STATE_SIZE 105
+static_assert(offsetof(struct __sha256_ctx, state) == 0);
+static_assert(offsetof(struct __sha256_ctx, bytecount) == 32);
+static_assert(offsetof(struct __sha256_ctx, buf) == 40);
+static_assert(sizeof(struct __sha256_ctx) + 1 == SHA256_SHASH_STATE_SIZE);
+
+static int __crypto_sha256_export(const struct __sha256_ctx *ctx0, void *out)
+{
+	struct __sha256_ctx ctx = *ctx0;
+	unsigned int partial;
+	u8 *p = out;
+
+	partial = ctx.bytecount % SHA256_BLOCK_SIZE;
+	ctx.bytecount -= partial;
+	memcpy(p, &ctx, sizeof(ctx));
+	p += sizeof(ctx);
+	*p = partial;
+	return 0;
+}
+
+static int __crypto_sha256_import(struct __sha256_ctx *ctx, const void *in)
+{
+	const u8 *p = in;
+
+	memcpy(ctx, p, sizeof(*ctx));
+	p += sizeof(*ctx);
+	ctx->bytecount += *p;
+	return 0;
+}
+
 /* SHA-224 */
 
 const u8 sha224_zero_message_hash[SHA224_DIGEST_SIZE] = {
 	0xd1, 0x4a, 0x02, 0x8c, 0x2a, 0x3a, 0x2b, 0xc9, 0x47,
 	0x61, 0x02, 0xbb, 0x28, 0x82, 0x34, 0xc4, 0x15, 0xa2,
@@ -49,10 +86,20 @@ static int crypto_sha224_digest(struct shash_desc *desc,
 {
 	sha224(data, len, out);
 	return 0;
 }
 
+static int crypto_sha224_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&SHA224_CTX(desc)->ctx, out);
+}
+
+static int crypto_sha224_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha256_import(&SHA224_CTX(desc)->ctx, in);
+}
+
 /* SHA-256 */
 
 const u8 sha256_zero_message_hash[SHA256_DIGEST_SIZE] = {
 	0xe3, 0xb0, 0xc4, 0x42, 0x98, 0xfc, 0x1c, 0x14,
 	0x9a, 0xfb, 0xf4, 0xc8, 0x99, 0x6f, 0xb9, 0x24,
@@ -87,10 +134,20 @@ static int crypto_sha256_digest(struct shash_desc *desc,
 {
 	sha256(data, len, out);
 	return 0;
 }
 
+static int crypto_sha256_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&SHA256_CTX(desc)->ctx, out);
+}
+
+static int crypto_sha256_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha256_import(&SHA256_CTX(desc)->ctx, in);
+}
+
 /* HMAC-SHA224 */
 
 #define HMAC_SHA224_KEY(tfm) ((struct hmac_sha224_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA224_CTX(desc) ((struct hmac_sha224_ctx *)shash_desc_ctx(desc))
 
@@ -126,10 +183,23 @@ static int crypto_hmac_sha224_digest(struct shash_desc *desc,
 {
 	hmac_sha224(HMAC_SHA224_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha224_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&HMAC_SHA224_CTX(desc)->ctx.sha_ctx, out);
+}
+
+static int crypto_hmac_sha224_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha224_ctx *ctx = HMAC_SHA224_CTX(desc);
+
+	ctx->ctx.ostate = HMAC_SHA224_KEY(desc->tfm)->key.ostate;
+	return __crypto_sha256_import(&ctx->ctx.sha_ctx, in);
+}
+
 /* HMAC-SHA256 */
 
 #define HMAC_SHA256_KEY(tfm) ((struct hmac_sha256_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA256_CTX(desc) ((struct hmac_sha256_ctx *)shash_desc_ctx(desc))
 
@@ -165,10 +235,23 @@ static int crypto_hmac_sha256_digest(struct shash_desc *desc,
 {
 	hmac_sha256(HMAC_SHA256_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha256_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&HMAC_SHA256_CTX(desc)->ctx.sha_ctx, out);
+}
+
+static int crypto_hmac_sha256_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha256_ctx *ctx = HMAC_SHA256_CTX(desc);
+
+	ctx->ctx.ostate = HMAC_SHA256_KEY(desc->tfm)->key.ostate;
+	return __crypto_sha256_import(&ctx->ctx.sha_ctx, in);
+}
+
 /* Algorithm definitions */
 
 static struct shash_alg algs[] = {
 	{
 		.base.cra_name		= "sha224",
@@ -179,11 +262,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA224_DIGEST_SIZE,
 		.init			= crypto_sha224_init,
 		.update			= crypto_sha224_update,
 		.final			= crypto_sha224_final,
 		.digest			= crypto_sha224_digest,
+		.export			= crypto_sha224_export,
+		.import			= crypto_sha224_import,
 		.descsize		= sizeof(struct sha224_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "sha256",
 		.base.cra_driver_name	= "sha256-lib",
 		.base.cra_priority	= 300,
@@ -192,11 +278,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA256_DIGEST_SIZE,
 		.init			= crypto_sha256_init,
 		.update			= crypto_sha256_update,
 		.final			= crypto_sha256_final,
 		.digest			= crypto_sha256_digest,
+		.export			= crypto_sha256_export,
+		.import			= crypto_sha256_import,
 		.descsize		= sizeof(struct sha256_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha224)",
 		.base.cra_driver_name	= "hmac-sha224-lib",
 		.base.cra_priority	= 300,
@@ -207,11 +296,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha224_setkey,
 		.init			= crypto_hmac_sha224_init,
 		.update			= crypto_hmac_sha224_update,
 		.final			= crypto_hmac_sha224_final,
 		.digest			= crypto_hmac_sha224_digest,
+		.export			= crypto_hmac_sha224_export,
+		.import			= crypto_hmac_sha224_import,
 		.descsize		= sizeof(struct hmac_sha224_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha256)",
 		.base.cra_driver_name	= "hmac-sha256-lib",
 		.base.cra_priority	= 300,
@@ -222,11 +314,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha256_setkey,
 		.init			= crypto_hmac_sha256_init,
 		.update			= crypto_hmac_sha256_update,
 		.final			= crypto_hmac_sha256_final,
 		.digest			= crypto_hmac_sha256_digest,
+		.export			= crypto_hmac_sha256_export,
+		.import			= crypto_hmac_sha256_import,
 		.descsize		= sizeof(struct hmac_sha256_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 };
 
 static int __init crypto_sha256_mod_init(void)
 {
-- 
2.50.0


