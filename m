Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954E0108B8FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 04:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IfWV9A0LxjIbFIc8d612BLY7VM8xu0UNoj5Cp/gH/I=; b=F46Kk9Ji4XNRykIUnH0nC341XC
	VJradwNllWbUxv1tYKvDePLObOXN7MMRSWPp7l921DB3G1Sp6lPXCs+SrVxdxq0wsBRSr/rvkiPsW
	HiiAqLBmd112MnneTX6LozHz0x97XWOpfPMlxAQ2wHM6nWiZAAvZNBGQ9HPlXwt7AfYs6aec20o7y
	NxjhX0hJR8b1VDWErIEL4XNe51t9I8+yOdB0hl7OfsogAi1D9Jm+2gkwP8F2vprYJJV9sSGrtPCX5
	f2wGPqKlCBlDFxXgjyApLZH1zQDoabic5aGkEMYy3BxJOgxlL+x69/7aV0O3Ng8GjN5tKpbjcQNzM
	RA3/pY4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3nhm-0000000E0B5-3pEj;
	Sat, 21 Mar 2026 04:12:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ngx-0000000DzRX-3L3E;
	Sat, 21 Mar 2026 04:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 710BB437FD;
	Sat, 21 Mar 2026 04:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1DBC2BCB0;
	Sat, 21 Mar 2026 04:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774066323;
	bh=lXet9mn/RNAHfsi2ltnD8G94KFEGqvjdvngfRQ0H8xE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=so3kgmeOeNqPqhjFKKKrVJiXY3XDI150LSByS/ickjQ8CnQMe+SSUL5qSwkyVMzRU
	 PJUEXz2dRmuc760kR7ocy/pQ6EFKC0THsdgeyzyS3IkmkPo6PL9rPwA4Fkm6vC/CK2
	 Bz/1K1w8CD7XaK1WfzyxHxwy3TaLUt8nrFCaPwvqk9XJ/FG8TdnTjZtiL+Oip8o01X
	 7pHs90GBou3BCXaX5p2FeXnitMTKQYcnotFrVQfoz1qHruvXKrIQAiE2434944WG+u
	 5QwhP+6EtJY3s/d9lMRhkmYUlRtivs2HNyBCMoTFGSHbrNg/It4DtYRyCIhXOBDPc2
	 z5zrOZ5jm5yBQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 12/12] crypto: sm3 - Remove 'struct sm3_state'
Date: Fri, 20 Mar 2026 21:09:35 -0700
Message-ID: <20260321040935.410034-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321040935.410034-1-ebiggers@kernel.org>
References: <20260321040935.410034-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211204_861532_95A10C98 
X-CRM114-Status: GOOD (  10.12  )
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

Update one driver that used sizeof(struct sm3_state) to use
sizeof(struct sm3_ctx) instead.  Then, remove struct sm3_state and
SM3_STATE_SIZE.

This completes the replacement of struct sm3_state with struct sm3_ctx.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/starfive/jh7110-hash.c | 4 ++--
 include/crypto/sm3.h                  | 7 -------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/starfive/jh7110-hash.c b/drivers/crypto/starfive/jh7110-hash.c
index 742038a5201a..008a47baa165 100644
--- a/drivers/crypto/starfive/jh7110-hash.c
+++ b/drivers/crypto/starfive/jh7110-hash.c
@@ -793,11 +793,11 @@ static struct ahash_engine_alg algs_sha2_sm3[] = {
 	.base.import   = starfive_hash_import,
 	.base.init_tfm = starfive_sm3_init_tfm,
 	.base.exit_tfm = starfive_hash_exit_tfm,
 	.base.halg = {
 		.digestsize = SM3_DIGEST_SIZE,
-		.statesize  = sizeof(struct sm3_state),
+		.statesize  = sizeof(struct sm3_ctx),
 		.base = {
 			.cra_name		= "sm3",
 			.cra_driver_name	= "sm3-starfive",
 			.cra_priority		= 200,
 			.cra_flags		= CRYPTO_ALG_ASYNC |
@@ -822,11 +822,11 @@ static struct ahash_engine_alg algs_sha2_sm3[] = {
 	.base.init_tfm = starfive_hmac_sm3_init_tfm,
 	.base.exit_tfm = starfive_hash_exit_tfm,
 	.base.setkey	  = starfive_hash_setkey,
 	.base.halg = {
 		.digestsize = SM3_DIGEST_SIZE,
-		.statesize  = sizeof(struct sm3_state),
+		.statesize  = sizeof(struct sm3_ctx),
 		.base = {
 			.cra_name		= "hmac(sm3)",
 			.cra_driver_name	= "sm3-hmac-starfive",
 			.cra_priority		= 200,
 			.cra_flags		= CRYPTO_ALG_ASYNC |
diff --git a/include/crypto/sm3.h b/include/crypto/sm3.h
index 34d7eb32b7db..371e8a661705 100644
--- a/include/crypto/sm3.h
+++ b/include/crypto/sm3.h
@@ -12,27 +12,20 @@
 
 #include <linux/types.h>
 
 #define SM3_DIGEST_SIZE	32
 #define SM3_BLOCK_SIZE	64
-#define SM3_STATE_SIZE	40
 
 #define SM3_IVA		0x7380166f
 #define SM3_IVB		0x4914b2b9
 #define SM3_IVC		0x172442d7
 #define SM3_IVD		0xda8a0600
 #define SM3_IVE		0xa96f30bc
 #define SM3_IVF		0x163138aa
 #define SM3_IVG		0xe38dee4d
 #define SM3_IVH		0xb0fb0e4e
 
-struct sm3_state {
-	u32 state[SM3_DIGEST_SIZE / 4];
-	u64 count;
-	u8 buffer[SM3_BLOCK_SIZE];
-};
-
 /* State for the SM3 compression function */
 struct sm3_block_state {
 	u32 h[SM3_DIGEST_SIZE / 4];
 };
 
-- 
2.53.0


