Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3087BC2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IoOcmuEUFdalI+Xu091qv4e2opViqdVh32nVwOB630=; b=buhzmu8lhzPb+pUWq5s4w+8wd2
	NLq0Fc2mdYwT2j5OLSQFL+gDwqwkHvIqojuuadjHiKtRq/+qlrNxjq35cxKd/QUeC7b+B3UT/uPRm
	qX3sMn/nq1xNf/5KiJp2b2GwQgLVLJflMeTI++34gTbthsqadxwcpHHIywUpxtgs4G8UdYf23DqAQ
	L5ItgLD80vIqHDFmIkU0kvQUu11Wut5v71Q8fXbpQWEgLV8HU2jGQYitAO4qSumRsBcBdAdStYI9F
	eGc2J/VRkTS+owW/Z4URHQ2agrvf5sIVNig3QG+29oB/yesiKw+aV0q2u2xIKtiw7K+tm7j5XANBM
	4hlPNhjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccxj-0000000Am2D-2v2p;
	Mon, 05 Jan 2026 05:17:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvs-0000000Aj2d-27BA;
	Mon, 05 Jan 2026 05:15:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3926B44357;
	Mon,  5 Jan 2026 05:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7216BC2BCB1;
	Mon,  5 Jan 2026 05:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590108;
	bh=CEvjFtjQNPUEArHuTq+3s4Z3LAXNjA8ATEyzFR/Xb40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TH4w7+H/0TkVDsJHMpEQqO72NXoaXdINRgTgmORdg/nBswVAhCJciDqyoaLoEsk0x
	 KAoH6UDXekrcipmj9EdyeltYyimR8UnDLawkjI+6YrgvtaV4XC6uy9bBcAwrCNOrqo
	 uvxWBU0GvZbjMMUxcxvyJ9+SSzcidEvS5+fb80pKeNVuf8mx93IcjqYPmo34LlotI8
	 R5iQTDSnm88aKbHIRjqpZ2geZ/An+n4r2q/siZIBEGFNZM6W0LiU9yHjVWFX3eojlW
	 chB+ghWLPeuD4EP0rNVXAzy1XU8rRggwi7ZW+xfi4AwjnXFQEHyAbPfYYJvt0v3Ijb
	 l3FWDTk6gFuFQ==
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
Subject: [PATCH 26/36] crypto: ccp - Use new AES library API
Date: Sun,  4 Jan 2026 21:12:59 -0800
Message-ID: <20260105051311.1607207-27-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_211508_622195_BD1E9D96 
X-CRM114-Status: GOOD (  12.35  )
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
 drivers/crypto/ccp/ccp-crypto-aes-cmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/ccp/ccp-crypto-aes-cmac.c b/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
index d8426bdf3190..ed5b0f8609f1 100644
--- a/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
+++ b/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
@@ -259,11 +259,11 @@ static int ccp_aes_cmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 	struct ccp_ctx *ctx = crypto_ahash_ctx_dma(tfm);
 	struct ccp_crypto_ahash_alg *alg =
 		ccp_crypto_ahash_alg(crypto_ahash_tfm(tfm));
 	u64 k0_hi, k0_lo, k1_hi, k1_lo, k2_hi, k2_lo;
 	u64 rb_hi = 0x00, rb_lo = 0x87;
-	struct crypto_aes_ctx aes;
+	struct aes_enckey aes;
 	__be64 *gk;
 	int ret;
 
 	switch (key_len) {
 	case AES_KEYSIZE_128:
@@ -282,17 +282,17 @@ static int ccp_aes_cmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 
 	/* Set to zero until complete */
 	ctx->u.aes.key_len = 0;
 
 	/* Set the key for the AES cipher used to generate the keys */
-	ret = aes_expandkey(&aes, key, key_len);
+	ret = aes_prepareenckey(&aes, key, key_len);
 	if (ret)
 		return ret;
 
 	/* Encrypt a block of zeroes - use key area in context */
 	memset(ctx->u.aes.key, 0, sizeof(ctx->u.aes.key));
-	aes_encrypt(&aes, ctx->u.aes.key, ctx->u.aes.key);
+	aes_encrypt_new(&aes, ctx->u.aes.key, ctx->u.aes.key);
 	memzero_explicit(&aes, sizeof(aes));
 
 	/* Generate K1 and K2 */
 	k0_hi = be64_to_cpu(*((__be64 *)ctx->u.aes.key));
 	k0_lo = be64_to_cpu(*((__be64 *)ctx->u.aes.key + 1));
-- 
2.52.0


