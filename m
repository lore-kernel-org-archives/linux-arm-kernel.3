Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90001C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uqhzatz7NlDzESa9PUCo71vFC+Z9fG5K7FS6DttHiE=; b=SJ2cQjugtzQce4AUB1BYrcpSlA
	QDlarhyMwZatHjjxRT/jieSEz0lOXwdTHyF/CaLXdAuf6zXVvTC6Z2z4JNKAkhyLfvC+UuuEgjGOY
	zM5I9JDM0DQomtfjoRJHThLiQJvXQz8uJHOvTMTko0Vpaa7R30OwwadokP8y62Btl5375SksOvSES
	6ycs02WjMZB5c1exPw5KISSaY3V7IWTh6ukN7OJn9lguXQc1Vc4FmRo8LtZE1K2oG3gDBKVlk5dZT
	v2KDD6WKh3kiOR3gdfoobP+TqvsqbOYZwNTYEjyH+RdVJ//rFQX2e/RHD/r2nc3+OvfJDum0uwk2J
	gKyMs4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyqd-0000000Eoqk-0f5i;
	Wed, 15 Jul 2026 12:36:23 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyqZ-0000000Eonz-0lQj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:36:22 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260715123610euoutp017f61549fae34d61c7406fb5e42414ed5~CdsBPZhw71661016610euoutp01A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:36:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260715123610euoutp017f61549fae34d61c7406fb5e42414ed5~CdsBPZhw71661016610euoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784118970;
	bh=2uqhzatz7NlDzESa9PUCo71vFC+Z9fG5K7FS6DttHiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y4ARRXf+GJzKGZmQz/G4oNqh5JkkL7uNFvoP1xvXPakuG7t4JlO9N7i28B/CBApxa
	 T3Pi87yI62z7VgVz3nhjeP6v2RCcSHYqgAnHCrNdmGirXS+pLbMzELO5hztd9w0scK
	 yAqWDfpmk0OfP5Htde2dMJvlwdtpPSXXRmYwFuZ0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260715123610eucas1p100ea97629de7a87fa67016275cfb38f4~CdsAwxlzu0260302603eucas1p1Y;
	Wed, 15 Jul 2026 12:36:10 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260715123609eusmtip2ed2c8310254681e147758f83b064e203~CdsARqFta0361003610eusmtip2C;
	Wed, 15 Jul 2026 12:36:09 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jakub
	Raczynski <j.raczynski@samsung.com>
Subject: [PATCH net v3 1/2] net/stmmac: Set Rx queue page_pool to NULL when
 freeing DMA resources
Date: Wed, 15 Jul 2026 14:36:01 +0200
Message-Id: <20260715123602.51950-2-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715123602.51950-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260715123610eucas1p100ea97629de7a87fa67016275cfb38f4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260715123610eucas1p100ea97629de7a87fa67016275cfb38f4
X-EPHeader: CA
X-CMS-RootMailID: 20260715123610eucas1p100ea97629de7a87fa67016275cfb38f4
References: <20260715123602.51950-1-j.raczynski@samsung.com>
	<CGME20260715123610eucas1p100ea97629de7a87fa67016275cfb38f4@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053619_685096_B9F7DD5E 
X-CRM114-Status: GOOD (  15.00  )
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


