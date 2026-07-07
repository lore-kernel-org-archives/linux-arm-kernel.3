Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EA0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uqhzatz7NlDzESa9PUCo71vFC+Z9fG5K7FS6DttHiE=; b=KHncW9cALn4KjCFV9Fgy0GZATQ
	/hfpcwTwU0J//hsXX1pjNDjlTtk5s6mI2bDLIYq5Ka0HmmyXfadQBZgVXm9l3mKD2I2yRbHZgoTw4
	ig/gJ3io9UGATNISOsWjyECNblByr12Qf153gJWxzOUnM1nNCBsCZDFiDS87Nq1F4H/22/l9RcNRC
	YKgNX+flaS5yw17YXCdFiC330g0T6GyO6lpQAz/vLcPmw8a8jq0SqltQOGKXmUgNCFgIFjejsrQOX
	ZoyXH706gkbQzO1pvlZaygqpHRbSv1uzrBiF1zg3HKf3dFnFHc3wKGTP/Iv34kRYKv2Ed0NZhHRbf
	hChFzntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9ni-0000000FZcc-3k40;
	Tue, 07 Jul 2026 17:41:42 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9nf-0000000FZb3-0O62
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:41:41 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260707174136euoutp01e489afc0a00d4c0761e7db2ae98329ae~AEsZ7Y4AB0074200742euoutp01p
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 17:41:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260707174136euoutp01e489afc0a00d4c0761e7db2ae98329ae~AEsZ7Y4AB0074200742euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783446096;
	bh=2uqhzatz7NlDzESa9PUCo71vFC+Z9fG5K7FS6DttHiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cFbFWmrZMKBqTlKeU7OTiwH7GnvgN+5xUCa3/BWttM+6oWP9X+WD0ZCCka4eDWnqL
	 rEvD4xrGAcdPF/xByYBb3G6XFUqRxELaJEY9V2vJ1A3niLLvUB8rQoz6thM3iXRHlL
	 zD3vwiKEND2gF03UmNxp14VHlWylEQcwQANpsgXg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260707174135eucas1p1386ed6bc3c44c1a4e927a0a8bae8fd27~AEsZYmV6x1385013850eucas1p1Q;
	Tue,  7 Jul 2026 17:41:35 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260707174134eusmtip1c78c3c4b343d56ce01467ae68af74883~AEsYqzfhO1143211432eusmtip1D;
	Tue,  7 Jul 2026 17:41:34 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: k.tegowski@samsung.com, k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub
	Raczynski <j.raczynski@samsung.com>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>
Subject: [PATCH net v2 1/2] net/stmmac: Set Rx queue page_pool to NULL when
 freeing DMA resources
Date: Tue,  7 Jul 2026 19:41:14 +0200
Message-Id: <20260707174115.1264466-2-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707174115.1264466-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260707174135eucas1p1386ed6bc3c44c1a4e927a0a8bae8fd27
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707174135eucas1p1386ed6bc3c44c1a4e927a0a8bae8fd27
X-EPHeader: CA
X-CMS-RootMailID: 20260707174135eucas1p1386ed6bc3c44c1a4e927a0a8bae8fd27
References: <20260707174115.1264466-1-j.raczynski@samsung.com>
	<CGME20260707174135eucas1p1386ed6bc3c44c1a4e927a0a8bae8fd27@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_104139_595799_381AC523 
X-CRM114-Status: GOOD (  14.86  )
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

When freeing RX descriptor resources, there is standard clearing of
descriptor page_pool via page_pool_destroy() which does destroy
page but does not set its pointer to NULL, which must be done by driver
calling this function.
It is not done in __free_dma_rx_desc_resources() when stopping interface,
which is generally not an issue, because __alloc_dma_rx_desc_resources() does
setup this regardless of previous state.
But above is true assuming reinitialization is successful.

In case of failure of page_pool_create() in __alloc_dma_rx_desc_resources(),
all non-NULL pages will be freed, including those already cleared.
So there is possible kernel panic due to wrong paging request at address.

Fix this by assigning NULL to page_pool pointer on free.
Also remove NULL check as page_pool_destroy() does check for NULL param.

Fixes: da5ec7f22a0f1 ("net: stmmac: refactor stmmac_init_rx_buffers for stmmac_reinit_rx_buffers")
Signed-off-by: Yashwant Varur <yashwant.v@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2a0d7eff88d3..3098971e0b66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2172,8 +2172,8 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
 
 	kfree(rx_q->buf_pool);
-	if (rx_q->page_pool)
-		page_pool_destroy(rx_q->page_pool);
+	page_pool_destroy(rx_q->page_pool);
+	rx_q->page_pool = NULL;
 }
 
 static void free_dma_rx_desc_resources(struct stmmac_priv *priv,
-- 
2.34.1


