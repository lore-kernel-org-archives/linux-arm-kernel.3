Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E8AC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 04:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avXFdog4cFEh+Rnasl+vY9pyBIPmiS18mYRn2X5LUsU=; b=W3MrcQVeRVx2FvA1dj+FfgF1LO
	T+xrfQG8e/C0n6HzC64zWPzWwZ++D6TP6H0cWoeuG9ilVk2vybexKMBrNa9or8+rsZiTy1rlROZv7
	/sPjFd6UcXL12GPvjGmjv7MfAcasvAiVNLdmEiI5g9p7W6eN4pBt98Ze1JoxuiUiwAWzla9iNatGH
	whAulsacRsJRszr7WdIn4Yu3psdFbhHRi4+8REAp2FjnIdb0Z588D/JmBS+UPP8rVmfZD7DpYtDLJ
	6A43bmzkuMoK/sa3IUuPh0vyuAxnkeCL6IQ69MPyQvzOSV99NQiVlLeuRS4di0Gj8g9MIWii9rpTt
	JxzkxoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta67n-00000006t7g-04Ux;
	Tue, 21 Jan 2025 04:44:27 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta65A-00000006sjM-1XiD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 04:41:46 +0000
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 21 Jan 2025 13:41:43 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 19AA12006FCC;
	Tue, 21 Jan 2025 13:41:43 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Tue, 21 Jan 2025 13:41:43 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 59F4B66E;
	Tue, 21 Jan 2025 13:41:42 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Furong Xu <0x1207@gmail.com>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Vince Bridgers <vbridger@opensource.altera.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH net v2 1/3] net: stmmac: Limit the number of MTL queues to hardware capability
Date: Tue, 21 Jan 2025 13:41:36 +0900
Message-Id: <20250121044138.2883912-2-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
References: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_204144_507045_A150DC40 
X-CRM114-Status: GOOD (  13.37  )
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

The number of MTL queues to use is specified by the parameter
"snps,{tx,rx}-queues-to-use" from stmmac_platform layer.

However, the maximum numbers of queues are constrained by upper limits
determined by the capability of each hardware feature. It's appropriate
to limit the values not to exceed the upper limit values and display
a warning message.

Fixes: d976a525c371 ("net: stmmac: multiple queues dt configuration")
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7bf275f127c9..251a8c15637f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7232,6 +7232,19 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (priv->dma_cap.tsoen)
 		dev_info(priv->device, "TSO supported\n");
 
+	if (priv->plat->rx_queues_to_use > priv->dma_cap.number_rx_queues) {
+		dev_warn(priv->device,
+			 "Number of Rx queues exceeds dma capability (%d)\n",
+			 priv->plat->rx_queues_to_use);
+		priv->plat->rx_queues_to_use = priv->dma_cap.number_rx_queues;
+	}
+	if (priv->plat->tx_queues_to_use > priv->dma_cap.number_tx_queues) {
+		dev_warn(priv->device,
+			 "Number of Tx queues exceeds dma capability (%d)\n",
+			 priv->plat->tx_queues_to_use);
+		priv->plat->tx_queues_to_use = priv->dma_cap.number_tx_queues;
+	}
+
 	priv->hw->vlan_fail_q_en =
 		(priv->plat->flags & STMMAC_FLAG_VLAN_FAIL_Q_EN);
 	priv->hw->vlan_fail_q = priv->plat->vlan_fail_q;
-- 
2.25.1


