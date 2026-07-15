Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC97AC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6XmGwoyQK4IATTx7Sicb5Md/GOMK8vp+z2XevcvSds=; b=FbOuBKIZ2pxriZ0whDrrq24cAY
	CfH7mwBB+dwGetekuygRqHscakP0NEIEAfhiFA2edR9jcEAZM+ENfuH2r/FR6Lx/0CgQuNRtEuHGq
	pN6nmRTNG8I68ktC+ykw3HhlYT3QXcpfNK/Un9XCNSeEgxtjeA8+Hg4DsCj00ZlrjIHGfVTj8SRLO
	WEGbxlgQqG/QYdAYJz8jcUyLZIP+jPswCby5xkkgyzKWzjaWnXpc5LmzLiqg57phfoDVjN7tSq1e1
	lhEQ66TSony5gw9uLMobSkMCIGglFEM6kSUZAnq2L8XhJ9L/k+o8Xeag9pw8Fm0fp446RoXxPID+f
	kh25yoiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyqh-0000000Eosr-1yZv;
	Wed, 15 Jul 2026 12:36:27 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyqZ-0000000Eoo3-0ln7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:36:23 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260715123611euoutp01a8bb664911b5274d2ffed13d038d31a9~CdsBu9G4U1658816588euoutp019
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:36:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260715123611euoutp01a8bb664911b5274d2ffed13d038d31a9~CdsBu9G4U1658816588euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784118971;
	bh=A6XmGwoyQK4IATTx7Sicb5Md/GOMK8vp+z2XevcvSds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j0mzjQl0/5yjujQR70Pvx+WWmS6qaZixVmpjPwtxf/vZGoJg6HodJZ05ghl9WYH0F
	 zoGpXDV7KFyAsIltKelmMsnQRIkvdGPTQ/JgvFVfHsebEK+47ehj37Lu2w4Fs0snkI
	 cDi6DuhQo/ZGaFg2wXCLSCHwaGjaAvSNzg10gv9k=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260715123610eucas1p1487b60d74fe9741507fe744fe8e3132c~CdsBfDezb0259902599eucas1p1Y;
	Wed, 15 Jul 2026 12:36:10 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260715123610eusmtip2250609b51eddc41b7670006498b06290~CdsA2NKFQ0123201232eusmtip2v;
	Wed, 15 Jul 2026 12:36:10 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jakub
	Raczynski <j.raczynski@samsung.com>
Subject: [PATCH net v3 2/2] net/stmmac: Prevent dma queue NULL free on
 allocation failure
Date: Wed, 15 Jul 2026 14:36:02 +0200
Message-Id: <20260715123602.51950-3-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715123602.51950-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260715123610eucas1p1487b60d74fe9741507fe744fe8e3132c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260715123610eucas1p1487b60d74fe9741507fe744fe8e3132c
X-EPHeader: CA
X-CMS-RootMailID: 20260715123610eucas1p1487b60d74fe9741507fe744fe8e3132c
References: <20260715123602.51950-1-j.raczynski@samsung.com>
	<CGME20260715123610eucas1p1487b60d74fe9741507fe744fe8e3132c@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053619_684991_6249E1F8 
X-CRM114-Status: GOOD (  15.26  )
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

During allocation of RX/TX descriptor resources and its DMA,
there is verification of failed dma_alloc_coherent() due to lack of memory.
In case of that failure, all allocated resources are freed instantly after,
but there are no checks for dma_free_coherent() whether previous step has
failed.
This will generally result in panic due to freeing NULL address.

Fix it by adding NULL verification of memory that is to be freed.
Also assign NULL to page pointers to avoid double free scenario.

Fixes: e73b19baa3b1c ("net: stmmac: simplify DMA descriptor allocation/init/freeing")
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3098971e0b66..77604d6ab466 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2146,7 +2146,6 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 					 u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
-	size_t size;
 	void *addr;
 
 	/* Release the DMA RX socket buffers */
@@ -2158,15 +2157,21 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	rx_q->buf_alloc_num = 0;
 	rx_q->xsk_pool = NULL;
 
-	/* Free DMA regions of consistent memory previously allocated */
-	if (priv->extend_desc)
+	if (priv->extend_desc) {
 		addr = rx_q->dma_erx;
-	else
+		rx_q->dma_erx = NULL;
+	} else {
 		addr = rx_q->dma_rx;
+		rx_q->dma_rx = NULL;
+	}
 
-	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
+	/* Free DMA regions of consistent memory if previously allocated */
+	if (addr) {
+		size_t size;
+		size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
-	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+		dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	}
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
@@ -2198,7 +2203,6 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 					 u32 queue)
 {
 	struct stmmac_tx_queue *tx_q = &dma_conf->tx_queue[queue];
-	size_t size;
 	void *addr;
 
 	/* Release the DMA TX socket buffers */
@@ -2206,15 +2210,21 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 
 	if (priv->extend_desc) {
 		addr = tx_q->dma_etx;
+		tx_q->dma_etx = NULL;
 	} else if (tx_q->tbs & STMMAC_TBS_AVAIL) {
 		addr = tx_q->dma_entx;
+		tx_q->dma_entx = NULL;
 	} else {
 		addr = tx_q->dma_tx;
+		tx_q->dma_tx = NULL;
 	}
 
-	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
+	if (addr) {
+		size_t size;
+		size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
-	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+		dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+	}
 
 	kfree(tx_q->tx_skbuff_dma);
 	kfree(tx_q->tx_skbuff);
-- 
2.34.1


