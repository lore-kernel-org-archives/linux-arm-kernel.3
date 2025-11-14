Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4465BCE8D44
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmAr7y1MZIR7+UMwfpzen+bn9PyappMKRUAOO+ujmB0=; b=ykPMUS7ksd9RMUw8A/A/WvwlV9
	GkvJGp4ussH1g0njIGj739h6L2FzKHEsqtFtvwixen9RL0Le1e0CLm+V0t2V5EQ8FGagvzntILkP+
	VoOMirOU6+z5ZOeiAf45hb8ngOI9yr9iFvHfqqA4ibDeWcQrPnWZziS2JZOxxgaED/evKBlw1j+uA
	+JzXp0qrb0ZO3mO9o9jhjsRnEB6+zq/KejJXjCqwLFutG17IamHZrL3et8ABtJCqJe/lpymw7NI6i
	HGuSHZFVvZTnSP4bAsWKRrYvML0ua7BLtWfBFO4Zyn7uP8wsv/2nxy34Bspkw0AXs8N8/2V9IFUxp
	BtdvgHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjv-0000000CZDe-0L4j;
	Fri, 14 Nov 2025 15:29:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvju-0000000CZCc-1xFW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=qmAr7y1MZIR7+UMwfpzen+bn9PyappMKRUAOO+ujmB0=; b=qdSz61kQ9xz7VZW03JXG5z8zmG
	+p4lW/S0zN1rK+9UQa2/gxJogqO1WBUYIdQpZd3q0dLzfZ5JXmJ4JJrHFyqxrfpACVOK1gOo06zl1
	R2uj1kzc8H7Mk7Ny6bb2GJbkEBvVrBtIkRATXr+ffLdSI8w2g/dXxfLiIYOtzc7yGgNNTERDQ/zx/
	xABoZRU4yJr4x8enQPjvOkttlNoBJdnrTpLrze3IuDe8OkIq4MRId0N+MHqeHLVrD+ZnruuDJwzRX
	NtWSpzey2h2cLOqvfZLP0gy64HGVw2VHN79P1CVDU1ck28Z+Jx39hmhVFkdylIYCYu+tOIOhgnA9Q
	RLA3Eudw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJusA-00000002pMq-4AZz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qmAr7y1MZIR7+UMwfpzen+bn9PyappMKRUAOO+ujmB0=; b=MLVrMTf4O/qqzJTMxOQnuOj8K0
	cmyBJ65/oaZbjSaRY+CfruCbgSfG9Dze66kdVsNBnMrfsmtHlfmZLv5hUxJQRnPoKpuT1wEfLybk7
	mK7mcfC9K9pJXie7IOkXZL2wLZb/SuE2JigLEVDfF4ByYjg/gb4D5Gr1fZlutfa/cQIlq4bSwPNQF
	RrTCfbZEhJnw/rK+PQOKJfveRVD2Lp2aUMthPwnnMbKCfeDHiWzG/OTGTUqGmTn7F55H7fFYuEOkp
	5b3+A4rATAPtjujPtlb6Qxml3R5BwfGxEVCnhD5EahynJvS8ylhaAHKeWIRSVaQ3gKKRaRcEEl+K+
	SiQNTjBw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58390 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vJvjh-0000000079N-1Iao;
	Fri, 14 Nov 2025 15:29:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vJvjf-0000000EVkO-1ZaO;
	Fri, 14 Nov 2025 15:29:15 +0000
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen Wang <unicorn_wang@outlook.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	sophgo@lists.linux.dev
Subject: [PATCH net-next 11/11] net: stmmac: remove unnecessary .pkt_route
 queue initialisation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vJvjf-0000000EVkO-1ZaO@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:29:15 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_143400_231773_18568307 
X-CRM114-Status: GOOD (  12.22  )
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

PCI drivers explicitly set .pkt_route to zero. However, as the struct
is allocated using devm_kzalloc(), all members default to zero unless
explicitly initialised. Thus, explicitly setting these to zero is
unnecessary. Remove these. This leaves only stmmac_platform.c where
this is explicitly initialised depending on DT properties.

$ grep '\.pkt_route =' *.c
dwmac-intel.c: plat->rx_queues_cfg[0].pkt_route = 0x0;
dwmac-intel.c: plat->rx_queues_cfg[i].pkt_route = 0x0;
dwmac-loongson.c: plat->rx_queues_cfg[0].pkt_route = 0x0;
stmmac_main.c: if (priv->plat->rx_queues_cfg[queue].pkt_route == 0x0)
stmmac_pci.c: plat->rx_queues_cfg[0].pkt_route = 0x0;
stmmac_pci.c: plat->rx_queues_cfg[i].pkt_route = 0x0;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = PACKET_AVCPQ;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = PACKET_PTPQ;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = PACKET_DCBCPQ;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = PACKET_UPQ;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = PACKET_MCBCQ;
stmmac_platform.c: plat->rx_queues_cfg[queue].pkt_route = 0x0;

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 9 +--------
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  | 3 ---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c      | 7 +------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 --
 4 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 72f6acde544f..8938e7a59925 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -569,9 +569,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	plat->force_sf_dma_mode = 1;
 
 	plat->mdio_bus_data->needs_reset = true;
-
-	/* Disable RX queues routing by default */
-	plat->rx_queues_cfg[0].pkt_route = 0x0;
 }
 
 static struct phylink_pcs *intel_mgbe_select_pcs(struct stmmac_priv *priv,
@@ -612,13 +609,9 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
 
-	for (i = 0; i < plat->rx_queues_to_use; i++) {
+	for (i = 0; i < plat->rx_queues_to_use; i++)
 		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 
-		/* Disable RX queues routing by default */
-		plat->rx_queues_cfg[i].pkt_route = 0x0;
-	}
-
 	for (i = 0; i < plat->tx_queues_to_use; i++) {
 		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index c64a24bb060f..5f9472f47e35 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -98,9 +98,6 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* Increase the default value for multicast hash bins */
 	plat->multicast_filter_bins = 256;
 
-	/* Disable RX queues routing by default */
-	plat->rx_queues_cfg[0].pkt_route = 0x0;
-
 	plat->clk_ref_rate = 125000000;
 	plat->clk_ptp_rate = 125000000;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 2f45b7986903..2fd4660838bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -27,9 +27,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 	plat->force_sf_dma_mode = 1;
 
 	plat->mdio_bus_data->needs_reset = true;
-
-	/* Disable RX queues routing by default */
-	plat->rx_queues_cfg[0].pkt_route = 0x0;
 }
 
 static int stmmac_default_data(struct pci_dev *pdev,
@@ -77,10 +74,8 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 	}
 
 	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
-	for (i = 0; i < plat->rx_queues_to_use; i++) {
+	for (i = 0; i < plat->rx_queues_to_use; i++)
 		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
-		plat->rx_queues_cfg[i].pkt_route = 0x0;
-	}
 
 	plat->bus_id = 1;
 	plat->phy_interface = PHY_INTERFACE_MODE_GMII;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index e769638586fe..1fefa6c55db1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -196,8 +196,6 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 			plat->rx_queues_cfg[queue].pkt_route = PACKET_UPQ;
 		else if (of_property_read_bool(q_node, "snps,route-multi-broad"))
 			plat->rx_queues_cfg[queue].pkt_route = PACKET_MCBCQ;
-		else
-			plat->rx_queues_cfg[queue].pkt_route = 0x0;
 
 		queue++;
 	}
-- 
2.47.3


