Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D966C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uuhRjn9bI4eO8GNCLXbC1g5dq9x51D50lLBbwcTs1M=; b=eTnzWeJiGpY2hWuwcvn6RHJUFD
	jhYgaXLIa/776S95nmmDz2gh06XbhDzKcCR1/wqKt01i6HHIcU0KWoRFwMAgBGgtgMowQXb85KxUb
	3+dxl/NDFTDkDvPZKIqjhlkK+eQXQnOeTi3g6pxzPXB7tmljtTQ/lFLAdqUeOl7adXhsED1z8Dkm2
	MT+xYJr6nqp8BbldolbggMR5VWYE/j1637C2tTbDwIFpHeodX/LCYWuMeqhkfDGui1QPZIvuHZP8A
	bp31z5LTLiyLMZz7EX9ZD7GomraTe87f5DtGijNanFftr6kaOHoySsG5P7fkJqFk+PffIqS3h3IQ4
	v9Ml0UKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFMr-000000081aM-33Ph;
	Wed, 12 Feb 2025 16:13:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEyL-00000007v77-23Ya
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:48:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C914A40B56;
	Wed, 12 Feb 2025 15:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6FCC4CEE7;
	Wed, 12 Feb 2025 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739375300;
	bh=E1JSCgjVviBxxpgC3OgCVP2YBiwy9pc5amnOz8Sv1Do=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sn30lqjkFktFPbyPCuerQWmWuxoD2pojMAV7+VlEfStvMVGYKhZg/G+UxeUW9rYsg
	 cIQGwD2znjX103mKqtB3Ed9LeANq7sJYLVu+uhKESktUk/EsRohgycYppx+nJdKfFi
	 1N584SuBXwz7pvwhdHMaAv538h2Yhk3etwrshqHD/T6/dPF6Q9eWuRjt9yPNW1f+p8
	 aS6pjsMoT7zoyiPatpu/NiXCR/Hx2CVgBYAsIQoU4XXmi3p75aq1aC9Afdr/zqkPpO
	 KhUn6dQ0bm7RftAT6/70CC0kASx4R3SzW066atMJ9Xh3rwyPnxMBxKPzP34oqWRvRy
	 5Elz/s8rnmcOw==
From: Eric Biggers <ebiggers@kernel.org>
To: fsverity@lists.linux.dev
Cc: linux-crypto@vger.kernel.org,
	dm-devel@lists.linux.dev,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH v8 2/7] crypto: testmgr - add tests for finup_mb
Date: Wed, 12 Feb 2025 07:47:13 -0800
Message-ID: <20250212154718.44255-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212154718.44255-1-ebiggers@kernel.org>
References: <20250212154718.44255-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_074821_657221_0EEF406D 
X-CRM114-Status: GOOD (  19.92  )
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

Update the shash self-tests to test the new finup_mb method when
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/testmgr.c | 73 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 7 deletions(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index e61490ba40958..6c8b4bd700a8a 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -234,10 +234,11 @@ enum flush_type {
 
 /* finalization function for hash algorithms */
 enum finalization_type {
 	FINALIZATION_TYPE_FINAL,	/* use final() */
 	FINALIZATION_TYPE_FINUP,	/* use finup() */
+	FINALIZATION_TYPE_FINUP_MB,	/* use finup_mb() */
 	FINALIZATION_TYPE_DIGEST,	/* use digest() */
 };
 
 /*
  * Whether the crypto operation will occur in-place, and if so whether the
@@ -297,10 +298,14 @@ struct test_sg_division {
  *				     the @iv_offset
  * @key_offset: misalignment of the key, where 0 is default alignment
  * @key_offset_relative_to_alignmask: if true, add the algorithm's alignmask to
  *				      the @key_offset
  * @finalization_type: what finalization function to use for hashes
+ * @multibuffer_index: random number used to generate the message index to use
+ *		       for finup_mb (when finup_mb is used).
+ * @multibuffer_count: random number used to generate the num_msgs parameter to
+ *		       finup_mb (when finup_mb is used).
  * @nosimd: execute with SIMD disabled?  Requires !CRYPTO_TFM_REQ_MAY_SLEEP.
  *	    This applies to the parts of the operation that aren't controlled
  *	    individually by @nosimd_setkey or @src_divs[].nosimd.
  * @nosimd_setkey: set the key (if applicable) with SIMD disabled?  Requires
  *		   !CRYPTO_TFM_REQ_MAY_SLEEP.
@@ -314,10 +319,12 @@ struct testvec_config {
 	unsigned int iv_offset;
 	unsigned int key_offset;
 	bool iv_offset_relative_to_alignmask;
 	bool key_offset_relative_to_alignmask;
 	enum finalization_type finalization_type;
+	unsigned int multibuffer_index;
+	unsigned int multibuffer_count;
 	bool nosimd;
 	bool nosimd_setkey;
 };
 
 #define TESTVEC_CONFIG_NAMELEN	192
@@ -1129,19 +1136,27 @@ static void generate_random_testvec_config(struct rnd_state *rng,
 	if (prandom_bool(rng)) {
 		cfg->req_flags |= CRYPTO_TFM_REQ_MAY_SLEEP;
 		p += scnprintf(p, end - p, " may_sleep");
 	}
 
-	switch (prandom_u32_below(rng, 4)) {
+	switch (prandom_u32_below(rng, 8)) {
 	case 0:
+	case 1:
 		cfg->finalization_type = FINALIZATION_TYPE_FINAL;
 		p += scnprintf(p, end - p, " use_final");
 		break;
-	case 1:
+	case 2:
 		cfg->finalization_type = FINALIZATION_TYPE_FINUP;
 		p += scnprintf(p, end - p, " use_finup");
 		break;
+	case 3:
+	case 4:
+		cfg->finalization_type = FINALIZATION_TYPE_FINUP_MB;
+		cfg->multibuffer_index = prandom_u32_state(rng);
+		cfg->multibuffer_count = prandom_u32_state(rng);
+		p += scnprintf(p, end - p, " use_finup_mb");
+		break;
 	default:
 		cfg->finalization_type = FINALIZATION_TYPE_DIGEST;
 		p += scnprintf(p, end - p, " use_digest");
 		break;
 	}
@@ -1296,10 +1311,37 @@ static inline int check_shash_op(const char *op, int err,
 		pr_err("alg: shash: %s %s() failed with err %d on test vector %s, cfg=\"%s\"\n",
 		       driver, op, err, vec_name, cfg->name);
 	return err;
 }
 
+static int do_finup_mb(struct shash_desc *desc,
+		       const u8 *data, unsigned int len, u8 *result,
+		       const struct testvec_config *cfg,
+		       const struct test_sglist *tsgl)
+{
+	struct crypto_shash *tfm = desc->tfm;
+	const u8 *unused_data = tsgl->bufs[XBUFSIZE - 1];
+	u8 unused_result[HASH_MAX_DIGESTSIZE];
+	const u8 *datas[HASH_MAX_MB_MSGS];
+	u8 *outs[HASH_MAX_MB_MSGS];
+	unsigned int num_msgs;
+	unsigned int msg_idx;
+	unsigned int i;
+
+	num_msgs = 1 + (cfg->multibuffer_count % crypto_shash_mb_max_msgs(tfm));
+	if (WARN_ON_ONCE(num_msgs > HASH_MAX_MB_MSGS))
+		return -EINVAL;
+	msg_idx = cfg->multibuffer_index % num_msgs;
+	for (i = 0; i < num_msgs; i++) {
+		datas[i] = unused_data;
+		outs[i] = unused_result;
+	}
+	datas[msg_idx] = data;
+	outs[msg_idx] = result;
+	return crypto_shash_finup_mb(desc, datas, len, outs, num_msgs);
+}
+
 /* Test one hash test vector in one configuration, using the shash API */
 static int test_shash_vec_cfg(const struct hash_testvec *vec,
 			      const char *vec_name,
 			      const struct testvec_config *cfg,
 			      struct shash_desc *desc,
@@ -1372,11 +1414,14 @@ static int test_shash_vec_cfg(const struct hash_testvec *vec,
 			return -EINVAL;
 		}
 		goto result_ready;
 	}
 
-	/* Using init(), zero or more update(), then final() or finup() */
+	/*
+	 * Using init(), zero or more update(), then either final(), finup(), or
+	 * finup_mb().
+	 */
 
 	if (cfg->nosimd)
 		crypto_disable_simd_for_test();
 	err = crypto_shash_init(desc);
 	if (cfg->nosimd)
@@ -1384,28 +1429,42 @@ static int test_shash_vec_cfg(const struct hash_testvec *vec,
 	err = check_shash_op("init", err, driver, vec_name, cfg);
 	if (err)
 		return err;
 
 	for (i = 0; i < tsgl->nents; i++) {
+		const u8 *data = sg_virt(&tsgl->sgl[i]);
+		unsigned int len = tsgl->sgl[i].length;
+
 		if (i + 1 == tsgl->nents &&
 		    cfg->finalization_type == FINALIZATION_TYPE_FINUP) {
 			if (divs[i]->nosimd)
 				crypto_disable_simd_for_test();
-			err = crypto_shash_finup(desc, sg_virt(&tsgl->sgl[i]),
-						 tsgl->sgl[i].length, result);
+			err = crypto_shash_finup(desc, data, len, result);
 			if (divs[i]->nosimd)
 				crypto_reenable_simd_for_test();
 			err = check_shash_op("finup", err, driver, vec_name,
 					     cfg);
 			if (err)
 				return err;
 			goto result_ready;
 		}
+		if (i + 1 == tsgl->nents &&
+		    cfg->finalization_type == FINALIZATION_TYPE_FINUP_MB) {
+			if (divs[i]->nosimd)
+				crypto_disable_simd_for_test();
+			err = do_finup_mb(desc, data, len, result, cfg, tsgl);
+			if (divs[i]->nosimd)
+				crypto_reenable_simd_for_test();
+			err = check_shash_op("finup_mb", err, driver, vec_name,
+					     cfg);
+			if (err)
+				return err;
+			goto result_ready;
+		}
 		if (divs[i]->nosimd)
 			crypto_disable_simd_for_test();
-		err = crypto_shash_update(desc, sg_virt(&tsgl->sgl[i]),
-					  tsgl->sgl[i].length);
+		err = crypto_shash_update(desc, data, len);
 		if (divs[i]->nosimd)
 			crypto_reenable_simd_for_test();
 		err = check_shash_op("update", err, driver, vec_name, cfg);
 		if (err)
 			return err;
-- 
2.48.1


