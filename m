Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAC2F588C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7i4MOjjjJrGvGQdMbRRql7PuBiTh8DQvmm4WTjzPf8=; b=nvh0CvkhtbFn0w8sSk3O2Z6T1U
	yG/CbuL1indbeHtg/dSFecTBvRO8LYGSu7hUYHfH5Rr28AMwrcFQPDWkZtTJpOAFT3GYGv9xJk9n0
	D9hmT2HrVJWk2qO564O6QaFQYXb0P6KvpKlAC26RZ6T3SjI7gveGv3DT4VegFTWHOFNIM7DYxGtaH
	lIFOgtu/wc5nCnP3JdxGnRfJ6G5pG/LfVMldwRneUZQJpLAUMAuFJKCgjq+wDZW1cUeceO7JZMwgA
	18dqQkZvEqCF+MnBTCOb7leYTnA6YPeqkufIouyU6hA7aOADaGWov2GrrQCDzVSPVXWC4WAHmTiih
	eG9eJtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEolB-000000073cq-43mV;
	Mon, 20 Apr 2026 13:33:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEol9-000000073be-2HfQ;
	Mon, 20 Apr 2026 13:33:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B87043562;
	Mon, 20 Apr 2026 13:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8263C2BCB6;
	Mon, 20 Apr 2026 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776692035;
	bh=i3rhWaKMYSrIbCXhEhMYTiNtIcwSGsFJBwm31q++mJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SO8niLhRl4/p2u024WoM113oBgra7Xun4h8QLhr0rqQ9bh34YcGR611Pu01jqRNBN
	 XVBRQMdV7Xd7LBmlfWhGqPP7Y32KH8joxiGxMqVZCdTTi9+a1Ume7Ou9osBK89ZoEc
	 FcJHNyx8DlR8lH83SHwU11WSDS3ECH1sLIqLL6Z9wzPokibUO0MTHuaZAGwKfrrDr0
	 kCBB3S3XBR/X7iKYcx5E4UCIustFJYzTtTwxyB8gNLe1y8AYgVTywOpk7iphb5Pcyc
	 K3NqBtECZfRGdvgvTDLZ9V+Ap3UPMzRzDDwZ2OBNBAyLJqs85hPkZafHq55pFXHXCL
	 X+7FQgoN384XA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] net: airoha: Fix memory leak in airoha_qdma_rx_process()
Date: Mon, 20 Apr 2026 09:22:10 -0400
Message-ID: <20260420132314.1023554-336-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.23
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_063355_602294_3FA87FA2 
X-CRM114-Status: GOOD (  13.02  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit 285fa6b1e03cff78ead0383e1b259c44b95faf90 ]

If an error occurs on the subsequents buffers belonging to the
non-linear part of the skb (e.g. due to an error in the payload length
reported by the NIC or if we consumed all the available fragments for
the skb), the page_pool fragment will not be linked to the skb so it will
not return to the pool in the airoha_qdma_rx_process() error path. Fix the
memory leak partially reverting commit 'd6d2b0e1538d ("net: airoha: Fix
page recycling in airoha_qdma_rx_process()")' and always running
page_pool_put_full_page routine in the airoha_qdma_rx_process() error
path.

Fixes: d6d2b0e1538d ("net: airoha: Fix page recycling in airoha_qdma_rx_process()")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Reviewed-by: Simon Horman <horms@kernel.org>
Link: https://patch.msgid.link/20260402-airoha_qdma_rx_process-mem-leak-fix-v1-1-b5706f402d3c@kernel.org
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Error: Failed to generate final synthesis

 drivers/net/ethernet/airoha/airoha_eth.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 4fc6bd282b465..bdf600fea9508 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -709,9 +709,8 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 		if (q->skb) {
 			dev_kfree_skb(q->skb);
 			q->skb = NULL;
-		} else {
-			page_pool_put_full_page(q->page_pool, page, true);
 		}
+		page_pool_put_full_page(q->page_pool, page, true);
 	}
 	airoha_qdma_fill_rx_queue(q);
 
-- 
2.53.0


