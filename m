Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A34CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 05:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UI1v5+6XAJDbBSTgYf0LEYwQk7cMQSMOUCuSTeEhgiw=; b=eP8OPeJLWmWi1BWDjopFLMbIFU
	WTZTBdU/1xfdL2ouhTB2glZRp+ja7A4HDGF2zllFCGMAZEFVttKpFpWhuhkWLdF2W93QR6cXvT20S
	KMCZkg1eWttFTph+sGeILHdaWkMqKEukPI8TBl8oPd7HNATDsyw+gJhp7qy3NrEwkJcrAlE6Oyv38
	tIRrS2qtAzaMiWB/VU/Du9Gs0skq7oFa7xuG9TDcJ3Jl3RX4qnj6HFfFswMf1/fxigwo4Sv3DmcNW
	F8Mfhd4/thOSy9ZuYj7zxGeSNwE1qQZBaRemd1LL44ZTwono4dajQj9ZOh11rxh3m16S1sllLS60G
	VVG127tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgm-0000000C2ov-0akl;
	Sun, 26 Oct 2025 05:53:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgg-0000000C2je-2CfF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 05:53:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21A544497E;
	Sun, 26 Oct 2025 05:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C2FC113D0;
	Sun, 26 Oct 2025 05:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761457984;
	bh=CPnbj7IYQFMudI6yBXTtVoWUb+m8d0YI96zTtdLwMdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mz4zHVc/OV+KduHUq6phOIHpr5Ks3IDeZpDxzUgbKqWaT6IbOQqKvj/PwBIZNUlFY
	 1NuJ71P3h+jIUNmrloAZU2n2Y7kcHbTX0m2c7tCalhzxKJFn+lswqvjkk/qEKZSDXr
	 H5WxnbORcGnUf/3ovcdCS4HwPfVM3ZO6E3tuu5/A4ax5PzYH5KqtD+UMHW4ACTjC0n
	 SKhi3bvDhWgdST782tg9/djTpUgH661wuSiU2xQ1pX934M98G+tMl9DZiyf0bpA/fF
	 goFJWa6WN7ElyZehVWZHh9Tgi7BwtiuD04mAmwv0NDmYVrTxflwnnskT2zVzzszuDL
	 WeVHD+Kd9BP7Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/15] crypto: arm64/sha3 - Rename conflicting function
Date: Sat, 25 Oct 2025 22:50:19 -0700
Message-ID: <20251026055032.1413733-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251026055032.1413733-1-ebiggers@kernel.org>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_225306_610358_F40DDC88 
X-CRM114-Status: GOOD (  13.31  )
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

From: David Howells <dhowells@redhat.com>

Rename the arm64 sha3_update() function to have an "arm64_" prefix to
avoid a name conflict with the upcoming SHA-3 library.

Note: this code will be superseded later.  This commit simply keeps the
kernel building for the initial introduction of the library.

Signed-off-by: David Howells <dhowells@redhat.com>
[EB: dropped unnecessary rename of sha3_finup(), and improved commit
     message]
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/sha3-ce-glue.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/crypto/sha3-ce-glue.c b/arch/arm64/crypto/sha3-ce-glue.c
index b4f1001046c9a..f5c8302349337 100644
--- a/arch/arm64/crypto/sha3-ce-glue.c
+++ b/arch/arm64/crypto/sha3-ce-glue.c
@@ -29,12 +29,12 @@ MODULE_ALIAS_CRYPTO("sha3-384");
 MODULE_ALIAS_CRYPTO("sha3-512");
 
 asmlinkage int sha3_ce_transform(u64 *st, const u8 *data, int blocks,
 				 int md_len);
 
-static int sha3_update(struct shash_desc *desc, const u8 *data,
-		       unsigned int len)
+static int arm64_sha3_update(struct shash_desc *desc, const u8 *data,
+			     unsigned int len)
 {
 	struct sha3_state *sctx = shash_desc_ctx(desc);
 	struct crypto_shash *tfm = desc->tfm;
 	unsigned int bs, ds;
 	int blocks;
@@ -88,11 +88,11 @@ static int sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
 }
 
 static struct shash_alg algs[] = { {
 	.digestsize		= SHA3_224_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
+	.update			= arm64_sha3_update,
 	.finup			= sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-224",
 	.base.cra_driver_name	= "sha3-224-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
@@ -100,11 +100,11 @@ static struct shash_alg algs[] = { {
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_priority	= 200,
 }, {
 	.digestsize		= SHA3_256_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
+	.update			= arm64_sha3_update,
 	.finup			= sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-256",
 	.base.cra_driver_name	= "sha3-256-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
@@ -112,11 +112,11 @@ static struct shash_alg algs[] = { {
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_priority	= 200,
 }, {
 	.digestsize		= SHA3_384_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
+	.update			= arm64_sha3_update,
 	.finup			= sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-384",
 	.base.cra_driver_name	= "sha3-384-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
@@ -124,11 +124,11 @@ static struct shash_alg algs[] = { {
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_priority	= 200,
 }, {
 	.digestsize		= SHA3_512_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
+	.update			= arm64_sha3_update,
 	.finup			= sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-512",
 	.base.cra_driver_name	= "sha3-512-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
-- 
2.51.1.dirty


