Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450FEC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeZ1m49Z36U8swL5YkPZQbEeg6t0N557LXSMpmqL3Hw=; b=ea+t1WcpfHKkHaOdfmR0ZVXaCL
	iyM2gckUziCxCKY452lBBBRxR59YWdl0GnwbKMPDj5b5SKIzfdkC93vjmM5PW75+956xwQnL5cGA+
	B53j2IGRmGIBrTBw+lo4Z1OyZhs6PSSxYAn8EaMTqq1ghtR1PJ8Wwm/pFVqffy8nP2jccRnQeZBIU
	NgNTIzBN5BGQ49IBMqQ96nLsX9HvpHYjkmr4jz7psceDU8oimIBTD7/gFFzSf4OBwGti+70xGXIRD
	9QEXdpfuFW33Q9iYdLRAkTm7sSxzwA7NjRovq6VNe0QysUr4rbVfJqSO/3Vd4OQs1zp+lgZS69NCy
	trrxMIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGlN-0000000ERf5-47Er;
	Fri, 24 Jan 2025 10:18:09 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbGhV-0000000ERDj-48Em
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 10:14:11 +0000
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 24 Jan 2025 19:14:05 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 9A9332006FDC;
	Fri, 24 Jan 2025 19:14:05 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Fri, 24 Jan 2025 19:14:05 +0900
Received: from plum.e01.socionext.com (unknown [10.212.245.39])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 0BD71373C;
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
Subject: [PATCH net v3 2/3] net: stmmac: Limit FIFO size by hardware capability
Date: Fri, 24 Jan 2025 19:13:58 +0900
Message-Id: <20250124101359.2926906-3-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250124101359.2926906-1-hayashi.kunihiko@socionext.com>
References: <20250124101359.2926906-1-hayashi.kunihiko@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_021410_134651_E9BAA5B5 
X-CRM114-Status: GOOD (  13.07  )
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

Tx/Rx FIFO size is specified by the parameter "{tx,rx}-fifo-depth" from
stmmac_platform layer.

However, these values are constrained by upper limits determined by the
capabilities of each hardware feature. There is a risk that the upper
bits will be truncated due to the calculation, so it's appropriate to
limit them to the upper limit values and display a warning message.

This only works if the hardware capability has the upper limit values.

Fixes: e7877f52fd4a ("stmmac: Read tx-fifo-depth and rx-fifo-depth from the devicetree")
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index be1e6fa6d557..251a812e4e77 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7247,6 +7247,21 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 		priv->plat->tx_queues_to_use = priv->dma_cap.number_tx_queues;
 	}
 
+	if (priv->dma_cap.rx_fifo_size &&
+	    priv->dma_cap.rx_fifo_size < priv->plat->rx_fifo_size) {
+		dev_warn(priv->device,
+			 "Rx FIFO size (%u) exceeds dma capability\n",
+			 priv->plat->rx_fifo_size);
+		priv->plat->rx_fifo_size = priv->dma_cap.rx_fifo_size;
+	}
+	if (priv->dma_cap.tx_fifo_size &&
+	    priv->dma_cap.tx_fifo_size < priv->plat->tx_fifo_size) {
+		dev_warn(priv->device,
+			 "Tx FIFO size (%u) exceeds dma capability\n",
+			 priv->plat->tx_fifo_size);
+		priv->plat->tx_fifo_size = priv->dma_cap.tx_fifo_size;
+	}
+
 	priv->hw->vlan_fail_q_en =
 		(priv->plat->flags & STMMAC_FLAG_VLAN_FAIL_Q_EN);
 	priv->hw->vlan_fail_q = priv->plat->vlan_fail_q;
-- 
2.25.1


