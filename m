Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC7CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c3e6oZbc6F773Qir26Sc0QNFGUCJZN+wEbH26HH5gZw=; b=OZ/4L1dOmznlnPlQtqt3v+EEWJ
	IVofokKF+7BfbceD0IjwKDEtLEAG9YryLZPZ3HeqiuBxCO9xkT98cq7oXLYusaoi5RIXWFJNNLmC2
	IIkpcW4P1XkHc8VVS1EUnFLpCqQwTrYLNy6dt2hJL+jGIb3bhkRi66A58rxM9gr5UtJFT8LzGADN2
	0Het0I78yUqavuNc9HA6xinsJLPGFvZ2gVR3FkrWC/eDxFk8Ejt1y8l09KH/CjXb9y37PgLPoFUWq
	1Z1nEG/oIBq+VyZZeNUhjX0cPNOm/TGIBK/xEuFYWKqSqNQhnKk2Za2RrzNfdv1NI6rHvoMtgWqmQ
	M3/rxFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5su-00000004MgM-2C4D;
	Fri, 10 Jul 2026 07:42:56 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5sq-00000004Meh-2rqe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:42:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783669367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c3e6oZbc6F773Qir26Sc0QNFGUCJZN+wEbH26HH5gZw=;
	b=Gr7NmQjxqvseruVX3aV9qclTAMbBP4n2z/NSk2XHQZGBb5Ud20Qfj7hXtsYTDys9kspgUM
	AXJzAUVXQ8d0e2XfOpf4aCCS4Z2rR5+LWBYpXGNn2Yhg09B3R4z29UCeooKrLPo+n68NN3
	YziHs9gwWqJ4ejxXKbh8QctRVVNSGCY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Corentin Labbe <clabbe@baylibre.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: sl3516 - drop invalid sg_dma_len checks before DMA mapping
Date: Fri, 10 Jul 2026 09:42:17 +0200
Message-ID: <20260710074216.734849-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485; i=thorsten.blum@linux.dev; h=from:subject; bh=Qih+LP3/egjYrLR7EBVMJajAdXN04WaqHWQ9otOcoB8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkBiyJkW1f1nI9hfXkntCj45V7BbTE/ct01506vOe05+ /lWa8/LHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRFcmMDMu2+/sYnuP9PtXk I/eUsoZ5Ulf69llNOFbQ8WHOi1m7PwkwMrR1snAkGslWvxGeVsP88dahm3+X3llfF7ouR9ph+ps /0xkB
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_004252_873533_CCD2ACC8 
X-CRM114-Status: UNSURE (   7.72  )
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

sg_dma_len() is only valid after mapping the scatterlist with
dma_map_sg(). However, sl3516_ce_need_fallback() checks it before the
source and destination scatterlists are mapped. Thus, a stale DMA length
that is not a multiple of 16 could incorrectly force a software fallback
when CONFIG_NEED_SG_DMA_LENGTH=y.

Remove the invalid checks; the existing scatterlist length checks are
sufficient.

Fixes: 46c5338db7bd ("crypto: sl3516 - Add sl3516 crypto engine")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/gemini/sl3516-ce-cipher.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/crypto/gemini/sl3516-ce-cipher.c b/drivers/crypto/gemini/sl3516-ce-cipher.c
index 583010b2d007..02ec4282333b 100644
--- a/drivers/crypto/gemini/sl3516-ce-cipher.c
+++ b/drivers/crypto/gemini/sl3516-ce-cipher.c
@@ -56,10 +56,6 @@ static bool sl3516_ce_need_fallback(struct skcipher_request *areq)
 			ce->fallback_mod16++;
 			return true;
 		}
-		if ((sg_dma_len(sg) % 16) != 0) {
-			ce->fallback_mod16++;
-			return true;
-		}
 		if (!IS_ALIGNED(sg->offset, 16)) {
 			ce->fallback_align16++;
 			return true;
@@ -72,10 +68,6 @@ static bool sl3516_ce_need_fallback(struct skcipher_request *areq)
 			ce->fallback_mod16++;
 			return true;
 		}
-		if ((sg_dma_len(sg) % 16) != 0) {
-			ce->fallback_mod16++;
-			return true;
-		}
 		if (!IS_ALIGNED(sg->offset, 16)) {
 			ce->fallback_align16++;
 			return true;

