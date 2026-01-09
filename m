Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AABD1A638
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jPCJvVh7QKX2iSMtWwv7GRsl36Brtuua2rgRr5lzIng=; b=FWwmzEiyGfpLSQxS/Njxn6xWDn
	qv9wdVqwBxYp6MNw0FTk7EN0GZwoUx/WwLQslcOa5UkeSZu5f26gO9e2VY2SGKRvEABgHe7Ws1hOQ
	ow+k2kp9S8J1cJc2m1sPBguxg6r17JgaIgvoXXg1w6WyRA6/lNg1YPxkVnn/7k+89CLqBSlZAGAT1
	D17Td8zJhdj9A3yOrIwCTw0LnyC/HactqdccVQVzZgWd5jJ63cGe1tynldT2ZyNFierPAEyJlRHIv
	iiH1RsZ+djLeiKqkJ+ZiWToYZFW2OcrWDZsMNSNzl8DaZ5QO95+4bw6Mc/VJ4EkmJRWGtSCcxXrYx
	sTXonPpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDQG-00000002PNf-3m1E;
	Fri, 09 Jan 2026 14:25:04 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDQD-00000002PEQ-3BVi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:25:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767968573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jPCJvVh7QKX2iSMtWwv7GRsl36Brtuua2rgRr5lzIng=;
	b=SvjBQCu6HinEYypeIlRCycdHJPXWxUEM9YhGoWwPsDqgIQIyPIOkVozJQWtRaDb7pJ2IyQ
	Z+F3Xr7/AuwBsEjdt7I6UhgkYoj+f7MW5/kxaS7GFypiyqbDYvNvBmtK6fTCCH0u37c8rc
	FVISSmfcWOZE21+gm6wl1tNTf5zaRBo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: stm32 - Remove unnecessary checks before calling memcpy
Date: Fri,  9 Jan 2026 15:20:36 +0100
Message-ID: <20260109142039.220729-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_062502_106011_FA921FE1 
X-CRM114-Status: UNSURE (   8.78  )
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

memcpy() can be safely called with size 0, which is a no-op. Remove the
unnecessary checks before calling memcpy().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/stm32/stm32-hash.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index a4436728b0db..d60147a7594e 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -1115,8 +1115,7 @@ static int stm32_hash_copy_sgs(struct stm32_hash_request_ctx *rctx,
 		return -ENOMEM;
 	}
 
-	if (state->bufcnt)
-		memcpy(buf, rctx->hdev->xmit_buf, state->bufcnt);
+	memcpy(buf, rctx->hdev->xmit_buf, state->bufcnt);
 
 	scatterwalk_map_and_copy(buf + state->bufcnt, sg, rctx->offset,
 				 min(new_len, rctx->total) - state->bufcnt, 0);
@@ -1300,8 +1299,7 @@ static int stm32_hash_prepare_request(struct ahash_request *req)
 	}
 
 	/* copy buffer in a temporary one that is used for sg alignment */
-	if (state->bufcnt)
-		memcpy(hdev->xmit_buf, state->buffer, state->bufcnt);
+	memcpy(hdev->xmit_buf, state->buffer, state->bufcnt);
 
 	ret = stm32_hash_align_sgs(req->src, nbytes, bs, init, final, rctx);
 	if (ret)
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


