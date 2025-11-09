Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD83CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QozL5hxa42fxS4QgLcUfhSwbVAWyaGsZ4O/2FmzNxk=; b=Ta9qNqHBpjqMzemYcc9WWiAw11
	/7/lCkUG4+5V9q8o7OGjDl57y0XtKJ9gCPx6a33J3Mu1I7Cw13AF4ES7WUKTvLF/HCpz9xIkL0yy2
	Bih/oEsv2ED91bgmqLXSo9cwp8yoLPv8hc4NJfjp06/nB4ommEMI9k8mVe4YLh78ZTi40iwKGa8WB
	5ek5FmcCPAdKNvAuSIuvtUMdIMiIHyWbS32x4ZmNnakangOEeSTXUOU9f6ExqKDw4byp5uoRI57AN
	qFVgURuUh5Pi14nDracESpOam8pnffP/Zcr03Vr2mcXVsc14YzPkFPaKZJXSgbSCRfy2Cu4VhzLbh
	yrSZvgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFAY-00000004Vmi-2iii;
	Sun, 09 Nov 2025 23:50:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFAV-00000004VjW-1iPT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8256343D86;
	Sun,  9 Nov 2025 23:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7ABC4CEF7;
	Sun,  9 Nov 2025 23:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762732197;
	bh=Wc6TlqQavzVYtanyrw+qZw+ADFSh9UnmNvIiDQ/B1sA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f9pErZCU3vr/wPmWxMCjMcN5UIoJJKvaV4aok4iQLPiHYK09ywK3sqT/5GlnW6E40
	 zrZ+7Fg5cUYumJ8487nV1zKnE6xRVhI/psbr9H6pjwnLqNBc9noTgL1PkAkpfnHC8Y
	 JuiG7finQtE2EX3QZkvdWZ30PevIqk5tN/qgbF1AZjanbnHkmacbtTq5uL5Mhou3U9
	 8xT1Jqn2ghdqHqjg4f2Ixe0Ulj16OxOBh0duYzhgDN2zjiuqs6ymNDpGQl83BOQ3Zx
	 aOKptcsseS9CGiO2SjCjfniZG29xRshs105B3Wayq2R+J08JXFkvgrtKov19VTKBtu
	 8F/5RXLEuKakA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 1/9] crypto: polyval - Rename conflicting functions
Date: Sun,  9 Nov 2025 15:47:16 -0800
Message-ID: <20251109234726.638437-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109234726.638437-1-ebiggers@kernel.org>
References: <20251109234726.638437-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_154959_492664_84AF67AB 
X-CRM114-Status: GOOD (  12.39  )
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

Rename polyval_init() and polyval_update(), in preparation for adding
library functions with the same name to <crypto/polyval.h>.

Note that polyval-generic.c will be removed later, as it will be
superseded by the library.  This commit just keeps the kernel building
for the initial introduction of the library.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/polyval-generic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/crypto/polyval-generic.c b/crypto/polyval-generic.c
index db8adb56e4ca..fe5b01a4000d 100644
--- a/crypto/polyval-generic.c
+++ b/crypto/polyval-generic.c
@@ -97,21 +97,21 @@ static int polyval_setkey(struct crypto_shash *tfm,
 		return -ENOMEM;
 
 	return 0;
 }
 
-static int polyval_init(struct shash_desc *desc)
+static int polyval_generic_init(struct shash_desc *desc)
 {
 	struct polyval_desc_ctx *dctx = shash_desc_ctx(desc);
 
 	memset(dctx, 0, sizeof(*dctx));
 
 	return 0;
 }
 
-static int polyval_update(struct shash_desc *desc,
-			 const u8 *src, unsigned int srclen)
+static int polyval_generic_update(struct shash_desc *desc,
+				  const u8 *src, unsigned int srclen)
 {
 	struct polyval_desc_ctx *dctx = shash_desc_ctx(desc);
 	const struct polyval_tfm_ctx *ctx = crypto_shash_ctx(desc->tfm);
 	u8 tmp[POLYVAL_BLOCK_SIZE];
 
@@ -133,11 +133,11 @@ static int polyval_finup(struct shash_desc *desc, const u8 *src,
 
 	if (len) {
 		u8 tmp[POLYVAL_BLOCK_SIZE] = {};
 
 		memcpy(tmp, src, len);
-		polyval_update(desc, tmp, POLYVAL_BLOCK_SIZE);
+		polyval_generic_update(desc, tmp, POLYVAL_BLOCK_SIZE);
 	}
 	copy_and_reverse(dst, dctx->buffer);
 	return 0;
 }
 
@@ -164,12 +164,12 @@ static void polyval_exit_tfm(struct crypto_shash *tfm)
 	gf128mul_free_4k(ctx->gf128);
 }
 
 static struct shash_alg polyval_alg = {
 	.digestsize	= POLYVAL_DIGEST_SIZE,
-	.init		= polyval_init,
-	.update		= polyval_update,
+	.init		= polyval_generic_init,
+	.update		= polyval_generic_update,
 	.finup		= polyval_finup,
 	.setkey		= polyval_setkey,
 	.export		= polyval_export,
 	.import		= polyval_import,
 	.exit_tfm	= polyval_exit_tfm,
-- 
2.51.2


