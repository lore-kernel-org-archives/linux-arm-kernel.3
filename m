Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511C4108B8FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 04:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKxwN3zhKC7ajufN3nmpvIe3O/1I9L+3wbA4QQFN5J4=; b=ilME7/94QUpXkjX9qBGNdfVnA4
	Fu504S5l2m33tC0BlSjGCyPfUou22cukh4I5+3mhjzopgBPajn79RKa0QdOrYf71OgaOi5o5nXy2q
	vmfr/V/u4NeO8mIez4FvYdMmvF46RoJH0IYSU7Q1r9fu1c/ip+1WQLiZBsREEvvJ2A6nvwmfQAPKz
	GlASWTASuswGplO1sbij6poPzMcwdOKCh0jJy2ExVo2lYqkd47Ag43sUYhWJNsGWg8KEunM4yheDX
	POZKR5jbTpiShZq8UoWjRFWgL22CIybqWAv1gqVCi5dge/wJ0OhlvjUVVAsvpTkyI0Ebrq6Ugk9nW
	BNroQjgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3nh9-0000000DzWv-3EP4;
	Sat, 21 Mar 2026 04:12:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ngv-0000000DzOU-0A0M;
	Sat, 21 Mar 2026 04:12:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C7D3437FD;
	Sat, 21 Mar 2026 04:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16162C19425;
	Sat, 21 Mar 2026 04:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774066318;
	bh=y/3un15qteBURfKcq9gIDYwg3DO/kIiH8GH2drBtg8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lsLA5d17opcaIkl94J2l95BEsSIVek2NJMQtNN7rxEInVMyW0bbawElreA1i4iQs6
	 g+B54mANxslsTKe5cyTc+36PdFlRKrWF2WUi0o31a2KZRjaUefll7XuP0n769C0OV8
	 yqvMZ/k0L2XibEFWudtKFq4FfWHluPhF3ur2Z65nuD5gfAFPiq5RmCGZsulPH9ZVQ+
	 MLO0QaViqPGjUyQZO9hOhvS/cMKlXtc+HElCLn2fD0Sd5wzVgKBOx9WSSP3ROj0sfP
	 JSkMixtBFOXKNZjpQuiZepSNAS3IAWpW6/3fESFjPoSu1TOo2/uJ46voavWCP4PItF
	 5nRo/4WpNCnZg==
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
Subject: [PATCH 01/12] crypto: sm3 - Fold sm3_init() into its caller
Date: Fri, 20 Mar 2026 21:09:24 -0700
Message-ID: <20260321040935.410034-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321040935.410034-1-ebiggers@kernel.org>
References: <20260321040935.410034-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211201_102290_85A17B0B 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Fold sm3_init() into its caller to free up the name for use in a library
API mirroring the other hash function APIs.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sm3.h      | 13 -------------
 include/crypto/sm3_base.h | 12 +++++++++++-
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/include/crypto/sm3.h b/include/crypto/sm3.h
index c8d02c86c298..c09f6bf4c0bf 100644
--- a/include/crypto/sm3.h
+++ b/include/crypto/sm3.h
@@ -44,21 +44,8 @@ struct sm3_state {
  * amounts of data as those APIs may be hw-accelerated.
  *
  * For details see lib/crypto/sm3.c
  */
 
-static inline void sm3_init(struct sm3_state *sctx)
-{
-	sctx->state[0] = SM3_IVA;
-	sctx->state[1] = SM3_IVB;
-	sctx->state[2] = SM3_IVC;
-	sctx->state[3] = SM3_IVD;
-	sctx->state[4] = SM3_IVE;
-	sctx->state[5] = SM3_IVF;
-	sctx->state[6] = SM3_IVG;
-	sctx->state[7] = SM3_IVH;
-	sctx->count = 0;
-}
-
 void sm3_block_generic(struct sm3_state *sctx, u8 const *data, int blocks);
 
 #endif
diff --git a/include/crypto/sm3_base.h b/include/crypto/sm3_base.h
index 7c53570bc05e..9fa995617495 100644
--- a/include/crypto/sm3_base.h
+++ b/include/crypto/sm3_base.h
@@ -19,11 +19,21 @@
 
 typedef void (sm3_block_fn)(struct sm3_state *sst, u8 const *src, int blocks);
 
 static inline int sm3_base_init(struct shash_desc *desc)
 {
-	sm3_init(shash_desc_ctx(desc));
+	struct sm3_state *sctx = shash_desc_ctx(desc);
+
+	sctx->state[0] = SM3_IVA;
+	sctx->state[1] = SM3_IVB;
+	sctx->state[2] = SM3_IVC;
+	sctx->state[3] = SM3_IVD;
+	sctx->state[4] = SM3_IVE;
+	sctx->state[5] = SM3_IVF;
+	sctx->state[6] = SM3_IVG;
+	sctx->state[7] = SM3_IVH;
+	sctx->count = 0;
 	return 0;
 }
 
 static inline int sm3_base_do_update_blocks(struct shash_desc *desc,
 					    const u8 *data, unsigned int len,
-- 
2.53.0


