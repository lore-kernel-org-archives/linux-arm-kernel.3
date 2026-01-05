Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6EDC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jku3CL07+U1b76FjLnYHoEBywtmNzCcg1Uj5VCGEfso=; b=z1P3bsnRnzVUPwQJD1DCPcJ3v6
	ecGUV/9XCpPkIJ9+P8yv0fwuC2XE/D7vt0BbKLbgT8PKB0/PyaiQ4zVUPYzVD002Yg5OqHwg/cvvC
	v04dUoi8ir4UIqeQdkfOIPA6qoevsvxBK7ccraA+Ss1UpawgULRxdCC464HOT39G7O8/nhWUi8sdF
	Fks+siy18pPVitRS9aQv2DIBJP4Mmcdb/RhoIZJqkNl6uT1mamzFyZoDrh/ibKWBaGpIw3taH2nxO
	tbgwP53s5KFuoHKUKPH6+RgrGlhQ2F8YjT4g7PYMe7VRW/5XraKeE419K3cTPe4akLqVz4y9eUSLG
	1ElSD1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccxM-0000000AlSN-1CmN;
	Mon, 05 Jan 2026 05:16:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvq-0000000Aj2d-1rCp;
	Mon, 05 Jan 2026 05:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39D274434D;
	Mon,  5 Jan 2026 05:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5352C19425;
	Mon,  5 Jan 2026 05:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590106;
	bh=32kb2l0NMdpg22PqusIRxtEfgY/UOrZtqLBmf/rQszE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qcVBpCYWjV2xse6dJQSomMH+1tsEuVvo82gcrovtJCAgJJDeXu5vrEAro7enrzEhB
	 DaxHZ0LdmShaUjawHJZMDqG1bXV0tmx4L5DZkVyFwzPAg0m+bv5fKBQKvlHMl88xDs
	 X0bHKanr2bLut60x824nG+hHVBE/pMXERweo8wrFEZNRR7eW0jpLtumEYksHpL/wBs
	 /5m5BvyGThfyHEVhFdRbdn8+vdrhOWgKyvSzJuMUCnFPE9oJooOmrKheKw40lTqJIp
	 0KFxGE6yoUtIrHoPV9/b1L6A8yT8uANGcjgZNyzRziawi+WbznGyyN50gHxJio+67d
	 zWINIa5JFDduQ==
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
Subject: [PATCH 23/36] crypto: arm/ghash - Use new AES library API
Date: Sun,  4 Jan 2026 21:12:56 -0800
Message-ID: <20260105051311.1607207-24-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_211506_638480_3E124A80 
X-CRM114-Status: GOOD (  10.62  )
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
 arch/arm/crypto/ghash-ce-glue.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/crypto/ghash-ce-glue.c b/arch/arm/crypto/ghash-ce-glue.c
index a52dcc8c1e33..9ab03bce352d 100644
--- a/arch/arm/crypto/ghash-ce-glue.c
+++ b/arch/arm/crypto/ghash-ce-glue.c
@@ -202,24 +202,28 @@ int pmull_gcm_dec_final(int bytes, u64 dg[], char *tag,
 
 static int gcm_aes_setkey(struct crypto_aead *tfm, const u8 *inkey,
 			  unsigned int keylen)
 {
 	struct gcm_key *ctx = crypto_aead_ctx(tfm);
-	struct crypto_aes_ctx aes_ctx;
+	struct aes_enckey aes_key;
 	be128 h, k;
 	int ret;
 
-	ret = aes_expandkey(&aes_ctx, inkey, keylen);
+	ret = aes_prepareenckey(&aes_key, inkey, keylen);
 	if (ret)
 		return -EINVAL;
 
-	aes_encrypt(&aes_ctx, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});
+	aes_encrypt_new(&aes_key, (u8 *)&k, (u8[AES_BLOCK_SIZE]){});
 
-	memcpy(ctx->rk, aes_ctx.key_enc, sizeof(ctx->rk));
+	/*
+	 * Note: this assumes that the arm implementation of the AES library
+	 * stores the standard round keys in k.rndkeys.
+	 */
+	memcpy(ctx->rk, aes_key.k.rndkeys, sizeof(ctx->rk));
 	ctx->rounds = 6 + keylen / 4;
 
-	memzero_explicit(&aes_ctx, sizeof(aes_ctx));
+	memzero_explicit(&aes_key, sizeof(aes_key));
 
 	ghash_reflect(ctx->h[0], &k);
 
 	h = k;
 	gf128mul_lle(&h, &k);
-- 
2.52.0


