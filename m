Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D24D68BFA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 00:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mB6BH20WVM9iWaGKcD3eSgNmpgMrkxwjBpbXNo9CyTQ=; b=eutTY+5gYfmEYxpHCL9GW8rhqE
	TDwgYSJyagmj4GM1hJ4L/Z6FM6OYKupaApve1NJ4M0xH+aQDRiAg12mJSzSc91u5M/XgMo41EeVki
	K+ImAaleRSYM7oYPaCsO+3zCrsQfUDHyucM0cYeD17iV633V4/NnJ9GIYVydC9SpyF+/5kxTsw+b1
	AKs8phXcoyk4BdA56GmvO0QotG/mzdqyZ550adpx+iZlia+a2kpVc8W7xq+gwaziaV7e7+4kXy762
	XXtISr6KggA/MU+8EKPyovpWZkI+fhJZgo+ZpAZc0pia2KN+G3Xga2HavQHf6mztwBXf95oUJlVq0
	qAq5xnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCT8h-00000006b5H-24jm;
	Sun, 17 Nov 2024 00:27:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCT52-00000006Zr8-0Qcz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 00:23:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C6A5A40BEA;
	Sun, 17 Nov 2024 00:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DC5C4CED6;
	Sun, 17 Nov 2024 00:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731803034;
	bh=fz4SkCeYBuj7fsA/U1fUHvVppsJG5UVFRFRoPgOF4lQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nHGBbzqpxxXr7z9JTDGZvIsMrkHcSwzjkEx2FI60yxgCeuqd7tlL2odGxTgZf534f
	 giTrqvVfr65GbOH5Ng0xGyxC2lsMyOPC3zCe135DvXeMC2LgYcXdoFARkKEazMxP2S
	 FehNuJ8ZDFj942jvr3zEQ8IxBZP48bBUFQJQsp4a7tds04ZqPcw53S9svvFYaLhlv6
	 zaBgI3R3pSUtCc6ETR0AkkpCWdxmToc1xGnMpbR5cl23tXHtgXwV47kVcMaSMUROFD
	 +x7tSIlYPh2purRhNnEq5ELrIHjTitDF4gVgTH8zfln7JvJ1qUexkZCOf0heRM+0/7
	 cAEO7vRyLTMtQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 03/11] crypto: crct10dif - expose arch-optimized lib function
Date: Sat, 16 Nov 2024 16:22:36 -0800
Message-ID: <20241117002244.105200-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241117002244.105200-1-ebiggers@kernel.org>
References: <20241117002244.105200-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_162356_275727_8480466B 
X-CRM114-Status: GOOD (  12.37  )
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

Now that crc_t10dif_update() may be directly optimized for each
architecture, make the shash driver for crct10dif register a
crct10dif-$arch algorithm that uses it, instead of only
crct10dif-generic which uses crc_t10dif_generic().

The result is that architecture-optimized crct10dif will remain
available through the shash API once the architectures implement
crc_t10dif_arch() instead of the shash API.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/Makefile            |  1 +
 crypto/crct10dif_generic.c | 82 +++++++++++++++++++++++++++++---------
 2 files changed, 65 insertions(+), 18 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index e948a883f151..8361fdb1a27d 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -153,10 +153,11 @@ obj-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
 obj-$(CONFIG_CRYPTO_CRC32C) += crc32c_generic.o
 obj-$(CONFIG_CRYPTO_CRC32) += crc32_generic.o
 CFLAGS_crc32c_generic.o += -DARCH=$(ARCH)
 CFLAGS_crc32_generic.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_CRCT10DIF) += crct10dif_generic.o
+CFLAGS_crct10dif_generic.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_CRC64_ROCKSOFT) += crc64_rocksoft_generic.o
 obj-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
 obj-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
 obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
diff --git a/crypto/crct10dif_generic.c b/crypto/crct10dif_generic.c
index e843982073bb..259cb01932cb 100644
--- a/crypto/crct10dif_generic.c
+++ b/crypto/crct10dif_generic.c
@@ -55,10 +55,19 @@ static int chksum_update(struct shash_desc *desc, const u8 *data,
 
 	ctx->crc = crc_t10dif_generic(ctx->crc, data, length);
 	return 0;
 }
 
+static int chksum_update_arch(struct shash_desc *desc, const u8 *data,
+			      unsigned int length)
+{
+	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
+
+	ctx->crc = crc_t10dif_update(ctx->crc, data, length);
+	return 0;
+}
+
 static int chksum_final(struct shash_desc *desc, u8 *out)
 {
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
 	*(__u16 *)out = ctx->crc;
@@ -69,49 +78,86 @@ static int __chksum_finup(__u16 crc, const u8 *data, unsigned int len, u8 *out)
 {
 	*(__u16 *)out = crc_t10dif_generic(crc, data, len);
 	return 0;
 }
 
+static int __chksum_finup_arch(__u16 crc, const u8 *data, unsigned int len,
+			       u8 *out)
+{
+	*(__u16 *)out = crc_t10dif_update(crc, data, len);
+	return 0;
+}
+
 static int chksum_finup(struct shash_desc *desc, const u8 *data,
 			unsigned int len, u8 *out)
 {
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
 	return __chksum_finup(ctx->crc, data, len, out);
 }
 
+static int chksum_finup_arch(struct shash_desc *desc, const u8 *data,
+			     unsigned int len, u8 *out)
+{
+	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
+
+	return __chksum_finup_arch(ctx->crc, data, len, out);
+}
+
 static int chksum_digest(struct shash_desc *desc, const u8 *data,
 			 unsigned int length, u8 *out)
 {
 	return __chksum_finup(0, data, length, out);
 }
 
-static struct shash_alg alg = {
-	.digestsize		=	CRC_T10DIF_DIGEST_SIZE,
-	.init		=	chksum_init,
-	.update		=	chksum_update,
-	.final		=	chksum_final,
-	.finup		=	chksum_finup,
-	.digest		=	chksum_digest,
-	.descsize		=	sizeof(struct chksum_desc_ctx),
-	.base			=	{
-		.cra_name		=	"crct10dif",
-		.cra_driver_name	=	"crct10dif-generic",
-		.cra_priority		=	100,
-		.cra_blocksize		=	CRC_T10DIF_BLOCK_SIZE,
-		.cra_module		=	THIS_MODULE,
-	}
-};
+static int chksum_digest_arch(struct shash_desc *desc, const u8 *data,
+			      unsigned int length, u8 *out)
+{
+	return __chksum_finup_arch(0, data, length, out);
+}
+
+static struct shash_alg algs[] = {{
+	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
+	.init			= chksum_init,
+	.update			= chksum_update,
+	.final			= chksum_final,
+	.finup			= chksum_finup,
+	.digest			= chksum_digest,
+	.descsize		= sizeof(struct chksum_desc_ctx),
+	.base.cra_name		= "crct10dif",
+	.base.cra_driver_name	= "crct10dif-generic",
+	.base.cra_priority	= 100,
+	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
+}, {
+	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
+	.init			= chksum_init,
+	.update			= chksum_update_arch,
+	.final			= chksum_final,
+	.finup			= chksum_finup_arch,
+	.digest			= chksum_digest_arch,
+	.descsize		= sizeof(struct chksum_desc_ctx),
+	.base.cra_name		= "crct10dif",
+	.base.cra_driver_name	= "crct10dif-" __stringify(ARCH),
+	.base.cra_priority	= 150,
+	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
+}};
+
+static int num_algs;
 
 static int __init crct10dif_mod_init(void)
 {
-	return crypto_register_shash(&alg);
+	/* register the arch flavor only if it differs from the generic one */
+	num_algs = 1 + crc_t10dif_is_optimized();
+
+	return crypto_register_shashes(algs, num_algs);
 }
 
 static void __exit crct10dif_mod_fini(void)
 {
-	crypto_unregister_shash(&alg);
+	crypto_unregister_shashes(algs, num_algs);
 }
 
 subsys_initcall(crct10dif_mod_init);
 module_exit(crct10dif_mod_fini);
 
-- 
2.47.0


