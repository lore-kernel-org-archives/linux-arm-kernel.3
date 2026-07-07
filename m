Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCBCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmE2NCWEGqRcLM+LMVgE5fFK2Ck+Oh+zbVbQcB5UN8M=; b=CJm/PaegZX1RnMeBKi+u5m+Lhu
	WCv+K8UOgnX7HkmVs0sQ15b8tSDxh4psiEyrAhRT0aZjszMJbi1YA128idMklq8JzcyEuUmuQpZBO
	k10+LZ9cPDzr+jGOIV/egRCgbQMGhUPAUWfex5WLV2bWUJr7WMOWnSUnxctD/ODfFBKzm91vGRig0
	CL/BA9BreQHu/C2fMMRUIqThskXEgrYvsRindVfKknDC8/BDwxl40rsqTTvM2RB1LLYlaCmt8oKdX
	E0Bg8O+niKhqv4Eugjy+sX1OaNo/303DJma+VS8GenA0jDeZs9dJFpoHTifFtsetoNsZYjjaQofii
	9V9BahuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9ni-0000000FZcY-3GmR;
	Tue, 07 Jul 2026 17:41:42 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9nf-0000000FZb9-0OIH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:41:41 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260707174136euoutp025217063005afab165062a3b7d9cd76cd~AEsahQ2Ly1975119751euoutp02d
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 17:41:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260707174136euoutp025217063005afab165062a3b7d9cd76cd~AEsahQ2Ly1975119751euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783446096;
	bh=AmE2NCWEGqRcLM+LMVgE5fFK2Ck+Oh+zbVbQcB5UN8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A1ckOZHHAaOQlEwizaRUBWQZ826ol2vwIi84r6ZunIlV4aRe/cMpMQ0vow1S+e0iw
	 ZTM21HTC6blwxIbR/2+4lkkB5N50yOzQt9VJNtSG9j/6Pn8PTCDcTHxrTw7K0rgutG
	 TcWlf9j9wWHFad7Ycjl72JVo6ar4bds5fLlg6FZ0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276~AEsaLXv5H2373123731eucas1p2o;
	Tue,  7 Jul 2026 17:41:36 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260707174135eusmtip1b520284028cd3af631ae6a0f945dd8d2~AEsZeKA-V1541815418eusmtip1M;
	Tue,  7 Jul 2026 17:41:35 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: k.tegowski@samsung.com, k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub
	Raczynski <j.raczynski@samsung.com>, Sashiko AI <sashiko-bot@kernel.org>
Subject: [PATCH net 2/2] net/stmmac: Prevent dma queue NULL free on
 allocation failure
Date: Tue,  7 Jul 2026 19:41:15 +0200
Message-Id: <20260707174115.1264466-3-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707174115.1264466-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276
X-EPHeader: CA
X-CMS-RootMailID: 20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276
References: <20260707174115.1264466-1-j.raczynski@samsung.com>
	<CGME20260707174136eucas1p2dca8fd11dc7642c913eb03bcdf5aa276@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_104139_594102_1E26C1A6 
X-CRM114-Status: GOOD (  13.68  )
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

Theoretically code should also set address of pointed memory to zero when
freeing, but currently the only path of invalid address is non intialized zero,
and there is no case possible of double-free of same memory.

Fixes: e73b19baa3b1c ("net: stmmac: simplify DMA descriptor allocation/init/freeing")
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3098971e0b66..187d9bbc61d9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2146,7 +2146,6 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 					 u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
-	size_t size;
 	void *addr;
 
 	/* Release the DMA RX socket buffers */
@@ -2164,9 +2163,12 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	else
 		addr = rx_q->dma_rx;
 
-	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
+	if (!IS_ERR_OR_NULL(addr)) {
+		size_t size;
+		size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
-	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+		dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	}
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
@@ -2198,7 +2200,6 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 					 u32 queue)
 {
 	struct stmmac_tx_queue *tx_q = &dma_conf->tx_queue[queue];
-	size_t size;
 	void *addr;
 
 	/* Release the DMA TX socket buffers */
@@ -2212,9 +2213,12 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 		addr = tx_q->dma_tx;
 	}
 
-	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
+	if (!IS_ERR_OR_NULL(addr)) {
+		size_t size;
+		size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
-	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+		dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+	}
 
 	kfree(tx_q->tx_skbuff_dma);
 	kfree(tx_q->tx_skbuff);
-- 
2.34.1


