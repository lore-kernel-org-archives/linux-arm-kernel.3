Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78734CF45C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNEHoIHgMkf+Lufych2L6AAIed5xBw81xTcBT/gPE1A=; b=mswvGBr902oLj5TZJNbso1IQpF
	l8bvnE0F5bYIl2RslbcHOC9uDRuq0cJpeTjk40y02GdL2/MaWRDPVuEDS7qLxpKUZ2cndL1xtzA4J
	Av+gOXJSo+ZV1Y5kmnBVJo7EYWE8GDj87G4qGp6JdaNAO5eB+10mDZOTukTMDVhgP8a/RP5FC34KS
	eL8RfugngP55EXdZsddsMQBzvwR0FF3KyG0MYWyU/3FCAE9VNQ8pH7/lOY0olztXqQ24tuzHFfHLV
	Ss0rObv1iISRmk4aL1ciegey9sUWMflvwLb2ScNJtMhjnkGxzBsAXeg6iDFb9Lipuqp4R+3Y7+PNT
	o1TBTt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNXZ-000000061dI-04k0;
	Mon, 12 Jan 2026 19:25:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVk-00000005z98-3Gc8;
	Mon, 12 Jan 2026 19:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 677B943483;
	Mon, 12 Jan 2026 19:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27E5C2BC86;
	Mon, 12 Jan 2026 19:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245812;
	bh=WLZZawaQBX35WPW58Hz//ngE+4DAJvp0HQ0I1HlTY/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1uZHKeto0AfyTDnkpw+maKdeM0KeDm2Q70XvXQU/RpOQN8SKGIlrpmf3qjxTie86
	 HCNSg4+UvVX3xUSdbQVP8xeeOQMJoQg1DuN+j3Q7uMn1pi8833mHKQsAMJKHJ/r0co
	 Cp9t7NfmIB9UcWHN7L1swZLb2Bt1wDVrX1d7fqpuqdvA8b11taUYiaKgJY13HpgOwo
	 UqE27wAEUeCRcKwzQPZMRSqiSF3OIPD11Gu7aUrpUal/Qv2Wf/u6wG8DO8SrVskdHr
	 mp5bV4KfXC90NInEuREpltxcfpeZYFO7VWCjJqaaviHvltHYdOmLgxI6z8RRKbwvRF
	 Fm8EGShrZgCLg==
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
Subject: [PATCH v2 26/35] crypto: ccp - Use new AES library API
Date: Mon, 12 Jan 2026 11:20:24 -0800
Message-ID: <20260112192035.10427-27-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_112332_860301_6B80F838 
X-CRM114-Status: GOOD (  14.43  )
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
 drivers/crypto/ccp/ccp-crypto-aes-cmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/ccp/ccp-crypto-aes-cmac.c b/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
index d8426bdf3190..71480f7e6f6b 100644
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
@@ -282,11 +282,11 @@ static int ccp_aes_cmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 
 	/* Set to zero until complete */
 	ctx->u.aes.key_len = 0;
 
 	/* Set the key for the AES cipher used to generate the keys */
-	ret = aes_expandkey(&aes, key, key_len);
+	ret = aes_prepareenckey(&aes, key, key_len);
 	if (ret)
 		return ret;
 
 	/* Encrypt a block of zeroes - use key area in context */
 	memset(ctx->u.aes.key, 0, sizeof(ctx->u.aes.key));
-- 
2.52.0


