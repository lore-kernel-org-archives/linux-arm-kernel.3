Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8450C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxAB7albovvdU7t1RPIPm3VmdTI5HDwMqnGEsvlp3/M=; b=y1Nf76/elwMSb/4GZ8HxD9eX9w
	Tmm2Ly0DpiYrYeuSyPc/qpuSFnzbK1z6YcQ6cBxtoKvfAgj80I4ZzF4OP19XdykL3QAFKAQfGUg+Q
	cScz3WV50ralHqhj0zn03qQhY3mThlhOLDtjGhykZ/SkIqPz/hnnTiikEg59T7Mp09Z685/iaVILd
	0jOuMUh8qoXq2MeGZU7oCWaCiVOD/kkoZGAq6mZyf5ttCwqZhh9qTZZvfyhxcAZZJ3uNmKcMmKpL/
	nyqCMM1o0sxlvxwoNvkQAt44cWy5Ek3T+jFwbXShxmVyuxgfFxmWdOjn/i7SF4smpV5zK5vmwbkC7
	y0SB83Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGmj-0000000ERls-17e3;
	Fri, 24 Jan 2025 10:19:33 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGhW-0000000EREU-1NRi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 10:14:11 +0000
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 24 Jan 2025 19:14:06 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 19A3A208E6F3;
	Fri, 24 Jan 2025 19:14:06 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Fri, 24 Jan 2025 19:14:06 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id A102C373C;
	Fri, 24 Jan 2025 19:14:05 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Yanteng Si <si.yanteng@linux.dev>,
	Furong Xu <0x1207@gmail.com>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net v3 3/3] net: stmmac: Specify hardware capability value when FIFO size isn't specified
Date: Fri, 24 Jan 2025 19:13:59 +0900
Message-Id: <20250124101359.2926906-4-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250124101359.2926906-1-hayashi.kunihiko@socionext.com>
References: <20250124101359.2926906-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_021410_475609_6D93267B 
X-CRM114-Status: GOOD (  17.04  )
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

When Tx/Rx FIFO size is not specified in advance, the driver checks if
the value is zero and sets the hardware capability value in functions
where that value is used.

Consolidate the check and settings into function stmmac_hw_init() and
remove redundant other statements.

If FIFO size is zero and the hardware capability also doesn't have upper
limit values, return with an error message.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 35 ++++++++++---------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 251a812e4e77..efeefb9eff8b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2375,11 +2375,6 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
 	u32 chan = 0;
 	u8 qmode = 0;
 
-	if (rxfifosz == 0)
-		rxfifosz = priv->dma_cap.rx_fifo_size;
-	if (txfifosz == 0)
-		txfifosz = priv->dma_cap.tx_fifo_size;
-
 	/* Split up the shared Tx/Rx FIFO memory on DW QoS Eth and DW XGMAC */
 	if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
 		rxfifosz /= rx_channels_count;
@@ -2851,11 +2846,6 @@ static void stmmac_set_dma_operation_mode(struct stmmac_priv *priv, u32 txmode,
 	int rxfifosz = priv->plat->rx_fifo_size;
 	int txfifosz = priv->plat->tx_fifo_size;
 
-	if (rxfifosz == 0)
-		rxfifosz = priv->dma_cap.rx_fifo_size;
-	if (txfifosz == 0)
-		txfifosz = priv->dma_cap.tx_fifo_size;
-
 	/* Adjust for real per queue fifo size */
 	rxfifosz /= rx_channels_count;
 	txfifosz /= tx_channels_count;
@@ -5856,9 +5846,6 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	const int mtu = new_mtu;
 	int ret;
 
-	if (txfifosz == 0)
-		txfifosz = priv->dma_cap.tx_fifo_size;
-
 	txfifosz /= priv->plat->tx_queues_to_use;
 
 	if (stmmac_xdp_is_enabled(priv) && new_mtu > ETH_DATA_LEN) {
@@ -7247,15 +7234,29 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 		priv->plat->tx_queues_to_use = priv->dma_cap.number_tx_queues;
 	}
 
-	if (priv->dma_cap.rx_fifo_size &&
-	    priv->dma_cap.rx_fifo_size < priv->plat->rx_fifo_size) {
+	if (!priv->plat->rx_fifo_size) {
+		if (priv->dma_cap.rx_fifo_size) {
+			priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
+		} else {
+			dev_err(priv->device, "Can't specify Rx FIFO size\n");
+			return -ENODEV;
+		}
+	} else if (priv->dma_cap.rx_fifo_size &&
+		   priv->dma_cap.rx_fifo_size < priv->plat->rx_fifo_size) {
 		dev_warn(priv->device,
 			 "Rx FIFO size (%u) exceeds dma capability\n",
 			 priv->plat->rx_fifo_size);
 		priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
 	}
-	if (priv->dma_cap.tx_fifo_size &&
-	    priv->dma_cap.tx_fifo_size < priv->plat->tx_fifo_size) {
+	if (!priv->plat->tx_fifo_size) {
+		if (priv->dma_cap.tx_fifo_size) {
+			priv->plat->tx_fifo_size = priv->dma_cap.tx_fifo_size;
+		} else {
+			dev_err(priv->device, "Can't specify Tx FIFO size\n");
+			return -ENODEV;
+		}
+	} else if (priv->dma_cap.tx_fifo_size &&
+		   priv->dma_cap.tx_fifo_size < priv->plat->tx_fifo_size) {
 		dev_warn(priv->device,
 			 "Tx FIFO size (%u) exceeds dma capability\n",
 			 priv->plat->tx_fifo_size);
-- 
2.25.1


