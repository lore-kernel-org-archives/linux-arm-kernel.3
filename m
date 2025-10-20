Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1072FCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 00:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pv0+XPvvgOW1CQOW5Enuw9ewbD0FM0vo30X874LNtMk=; b=D1X/Ye4H3qYq3vy4afi0W4xh9M
	M2SUxAGZg9n97nmfSITYPJkIRxd8CB/8zPHhbQ1BVQShkD1ov9VtRNusedWvTE6Y6BmUFf0wY6gNa
	evQBsNHk5oYwM2kr9hc6E5XlbccupTnVAYjg7e+R9v21KwHeHP0IH5D44uPF5MujYwbbheQGDPUFu
	8gdMJ6jNZZECOOvMopHtT0ZEYOpHpPbvd9ceR2qX5lr242ll7gjwwhZDtXAH4D1FmnqnmyQ0HUSah
	FZo04tqhW0ntVPD/R9VselEuVnlO4HtNuc6nzJsZFsXO55TQxlQHyt1QwkyVO0PyPv+5bFJJh/Rnd
	mjF8zfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAeA2-0000000BZjy-0Tp3;
	Mon, 20 Oct 2025 00:54:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9k-0000000BZWg-0Z7T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 00:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 199E560216;
	Mon, 20 Oct 2025 00:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6E1C113D0;
	Mon, 20 Oct 2025 00:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760921612;
	bh=TSUPKbwNLbb7mhNbu9L6HinZjxHA1TP1J2/JSwQ69+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o3rU/5QWIxEz/SJlv0INtTPIO8SahTbcLR5YnA1j8KGobBvcuYKZyMZj/6uFoEhmr
	 dmc/KBdlm1jdOKogUbfx2oCPDiwiMsReEhsEkvMr8nXrNotGlxBVH+PWZNIl6zPHXX
	 UviGV9j0yHXwJOJp8S/VzCqeRTDMqPKUj0AlPMobVLo2TSGjHd9vGJqc+DyVaqxwVa
	 LKRGVl/SV574HPIgAlNslrefv4kKsPXiH+IRGipWIbrMPoQtDVOR/KgZCpNk56+7A5
	 y5UPX61iygmt9y1F5M8ITlF6BwmY9k1bFaJbDxvnG244+mPh6+gztopsvoa/LWZQCR
	 cJ+B1wJmtA2Rw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>
Subject: [PATCH 02/17] arm64/sha3: Rename conflicting functions
Date: Sun, 19 Oct 2025 17:50:23 -0700
Message-ID: <20251020005038.661542-3-ebiggers@kernel.org>
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

From: David Howells <dhowells@redhat.com>

Rename the arm64 sha3_* functions to have an "arm64_" prefix to avoid
conflict with generic code.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Biggers <ebiggers@kernel.org>
cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Catalin Marinas <catalin.marinas@arm.com>
cc: Will Deacon <will@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: Stephan Mueller <smueller@chronox.de>
cc: linux-crypto@vger.kernel.org
cc: linux-arm-kernel@lists.infradead.org
Link: https://lore.kernel.org/r/20251017144311.817771-3-dhowells@redhat.com
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/sha3-ce-glue.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/crypto/sha3-ce-glue.c b/arch/arm64/crypto/sha3-ce-glue.c
index b4f1001046c9a..426d8044535ab 100644
--- a/arch/arm64/crypto/sha3-ce-glue.c
+++ b/arch/arm64/crypto/sha3-ce-glue.c
@@ -29,11 +29,11 @@ MODULE_ALIAS_CRYPTO("sha3-384");
 MODULE_ALIAS_CRYPTO("sha3-512");
 
 asmlinkage int sha3_ce_transform(u64 *st, const u8 *data, int blocks,
 				 int md_len);
 
-static int sha3_update(struct shash_desc *desc, const u8 *data,
+static int arm64_sha3_update(struct shash_desc *desc, const u8 *data,
 		       unsigned int len)
 {
 	struct sha3_state *sctx = shash_desc_ctx(desc);
 	struct crypto_shash *tfm = desc->tfm;
 	unsigned int bs, ds;
@@ -53,12 +53,12 @@ static int sha3_update(struct shash_desc *desc, const u8 *data,
 		blocks = rem;
 	} while (blocks);
 	return len;
 }
 
-static int sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
-		      u8 *out)
+static int arm64_sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
+			    u8 *out)
 {
 	struct sha3_state *sctx = shash_desc_ctx(desc);
 	struct crypto_shash *tfm = desc->tfm;
 	__le64 *digest = (__le64 *)out;
 	u8 block[SHA3_224_BLOCK_SIZE];
@@ -88,48 +88,48 @@ static int sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
 }
 
 static struct shash_alg algs[] = { {
 	.digestsize		= SHA3_224_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
-	.finup			= sha3_finup,
+	.update			= arm64_sha3_update,
+	.finup			= arm64_sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-224",
 	.base.cra_driver_name	= "sha3-224-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
 	.base.cra_blocksize	= SHA3_224_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_priority	= 200,
 }, {
 	.digestsize		= SHA3_256_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
-	.finup			= sha3_finup,
+	.update			= arm64_sha3_update,
+	.finup			= arm64_sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-256",
 	.base.cra_driver_name	= "sha3-256-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
 	.base.cra_blocksize	= SHA3_256_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_priority	= 200,
 }, {
 	.digestsize		= SHA3_384_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
-	.finup			= sha3_finup,
+	.update			= arm64_sha3_update,
+	.finup			= arm64_sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-384",
 	.base.cra_driver_name	= "sha3-384-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
 	.base.cra_blocksize	= SHA3_384_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 	.base.cra_priority	= 200,
 }, {
 	.digestsize		= SHA3_512_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
-	.finup			= sha3_finup,
+	.update			= arm64_sha3_update,
+	.finup			= arm64_sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-512",
 	.base.cra_driver_name	= "sha3-512-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
 	.base.cra_blocksize	= SHA3_512_BLOCK_SIZE,
-- 
2.51.1.dirty


