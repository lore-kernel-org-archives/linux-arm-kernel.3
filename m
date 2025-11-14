Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CEBCE8D40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFW/LxPmEG2Xn38+3bKdfD6oKQAadYeIexKVs/kjmvQ=; b=vrrLjIc+Vi1iIaqt5CfghqnG+D
	wYFcHxfHAHwKGT+bvxfJmOnnnqyFV5R2ZxTUEbCH5TIAIlgo6L9YKBPpZYJtj7lV7ZYL3Ig28fUh+
	9i8FRP1v2VOg1bLVtNOdbNlWIYKuZhPLGojVz6qnnfzqDnTJN8umpk6r9Eoj6XivK+3bGakGJfM3g
	mcFolkNdY38uHPO+FhnznBF4W3mF9co2C+AvHhnIaiTNr+u5IZmNtZ/2MHx7bNk4zjPrCtFf2WdmW
	3M/+LQYztyuDA0GuTC0h8BR9TvuR+43lf25WmiA3Z9Ksb73WDe8E3gwfWElK2mpt5NYoH+xO5mH/f
	lx2DB1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvjk-0000000CZ4G-1a6f;
	Fri, 14 Nov 2025 15:29:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvji-0000000CZ1L-17Nm
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=SFW/LxPmEG2Xn38+3bKdfD6oKQAadYeIexKVs/kjmvQ=; b=o5EBJ43p4iyuvBujhFCYdknBsb
	J0A6NjEsn5j1NlOIE6DInj365z9qN4m0YQwrSDHXQ8N5Gw1uG1TFsU6gH9dnGsPI1UjXIw3yE5oir
	m9fi4cBijE8/JXoApasUO9S0u/qA+vSB+Tm0SX9xFVIprNMwsf+ih0G8iKKaaUUU0R5fWhUlnUKst
	ZkRWXv+fm9DcPvc8dp+vXcoCWGTHerZPIjweCyaP3aZyNcbBl1fIkkeMtOryk+NwrgjaJRLLZmI3u
	8t5QHe2WEGsxEIpPfuePeF5sjZKMpceoU6g5PgOMb0rWFP0+63ckAUUrZkTBscSAOzyI6CyW00ahI
	u11dFvAg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJus0-00000002pJq-3SZz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SFW/LxPmEG2Xn38+3bKdfD6oKQAadYeIexKVs/kjmvQ=; b=kIAE1ioYjOhffRl7lu/A/BhEZw
	jwOvfQT4kl0fAOfdGjWZ4syRTgpLaCtlTqMOBpvDhWYJxqSZ/yHKwNZzxXONLPGFRlxdRVyg/sUBz
	tU7XXLpYgm/ZrSS+e10YGeHCg9M1waYz6+kAV+w0ysb7OklKpjuQKQ87ZS48+yL19z9HzOwz+boWr
	9ngGskL1uQ8w0bKxrAnkQsvBBlswmYZSkle+RQGa2IFbnzxoDmZnoCUwogMt45gZX4ZMJFuUAryOY
	L2S01CUqyLYOIvhM3nFxVzOOEn3N66jXXK+HhP2odsdXRu50XiRZ1e0LG9FQJ6tEKuRjA5OpkYO44
	VkF4+02Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54276 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vJvjW-0000000078g-1XAT;
	Fri, 14 Nov 2025 15:29:06 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vJvjV-0000000EVkC-0WAV;
	Fri, 14 Nov 2025 15:29:05 +0000
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
Subject: [PATCH net-next 09/11] net: stmmac: remove unnecessary .use_prio
 queue initialisation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vJvjV-0000000EVkC-0WAV@rmk-PC.armlinux.org.uk>
Date: Fri, 14 Nov 2025 15:29:05 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_143349_017314_123A14B1 
X-CRM114-Status: GOOD (  11.90  )
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

Several drivers (see below) explicitly set the queue .use_prio
configuration to false. However, as this structure is allocated using
devm_kzalloc(), all members default to zero unless otherwise explicitly
initialised. .use_prio isn't, so defaults to false. Remove these
unnecessary initialisations, leaving stmmac_platform.c as the only
file that .use_prio is set true.

$ grep 'use_prio =' *.c
dwmac-intel.c: plat->tx_queues_cfg[0].use_prio = false;
dwmac-intel.c: plat->rx_queues_cfg[0].use_prio = false;
dwmac-intel.c: plat->rx_queues_cfg[i].use_prio = false;
dwmac-intel.c: plat->tx_queues_cfg[i].use_prio = false;
dwmac-loongson.c: plat->tx_queues_cfg[0].use_prio = false;
dwmac-loongson.c: plat->rx_queues_cfg[0].use_prio = false;
stmmac_pci.c: plat->tx_queues_cfg[0].use_prio = false;
stmmac_pci.c: plat->rx_queues_cfg[0].use_prio = false;
stmmac_pci.c: plat->tx_queues_cfg[i].use_prio = false;
stmmac_pci.c: plat->rx_queues_cfg[i].use_prio = false;
stmmac_platform.c: plat->rx_queues_cfg[queue].use_prio = false;
stmmac_platform.c: plat->rx_queues_cfg[queue].use_prio = true;
stmmac_platform.c: plat->tx_queues_cfg[queue].use_prio = false;
stmmac_platform.c: plat->tx_queues_cfg[queue].use_prio = true;

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c     | 9 ---------
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c  | 4 ----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c      | 6 ------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 --
 4 files changed, 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 1fd6faa0c70c..72f6acde544f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -570,10 +570,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 
 	plat->mdio_bus_data->needs_reset = true;
 
-	/* Disable Priority config by default */
-	plat->tx_queues_cfg[0].use_prio = false;
-	plat->rx_queues_cfg[0].use_prio = false;
-
 	/* Disable RX queues routing by default */
 	plat->rx_queues_cfg[0].pkt_route = 0x0;
 }
@@ -619,9 +615,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	for (i = 0; i < plat->rx_queues_to_use; i++) {
 		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 
-		/* Disable Priority config by default */
-		plat->rx_queues_cfg[i].use_prio = false;
-
 		/* Disable RX queues routing by default */
 		plat->rx_queues_cfg[i].pkt_route = 0x0;
 	}
@@ -629,8 +622,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	for (i = 0; i < plat->tx_queues_to_use; i++) {
 		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 
-		/* Disable Priority config by default */
-		plat->tx_queues_cfg[i].use_prio = false;
 		/* Default TX Q0 to use TSO and rest TXQ for TBS */
 		if (i > 0)
 			plat->tx_queues_cfg[i].tbs_en = 1;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index ed5e9ca738bf..c64a24bb060f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -98,10 +98,6 @@ static void loongson_default_data(struct pci_dev *pdev,
 	/* Increase the default value for multicast hash bins */
 	plat->multicast_filter_bins = 256;
 
-	/* Disable Priority config by default */
-	plat->tx_queues_cfg[0].use_prio = false;
-	plat->rx_queues_cfg[0].use_prio = false;
-
 	/* Disable RX queues routing by default */
 	plat->rx_queues_cfg[0].pkt_route = 0x0;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index ded44846f74a..2f45b7986903 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -28,10 +28,6 @@ static void common_default_data(struct plat_stmmacenet_data *plat)
 
 	plat->mdio_bus_data->needs_reset = true;
 
-	/* Disable Priority config by default */
-	plat->tx_queues_cfg[0].use_prio = false;
-	plat->rx_queues_cfg[0].use_prio = false;
-
 	/* Disable RX queues routing by default */
 	plat->rx_queues_cfg[0].pkt_route = 0x0;
 }
@@ -74,7 +70,6 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 
 	plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
 	for (i = 0; i < plat->tx_queues_to_use; i++) {
-		plat->tx_queues_cfg[i].use_prio = false;
 		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 		plat->tx_queues_cfg[i].weight = 25;
 		if (i > 0)
@@ -83,7 +78,6 @@ static int snps_gmac5_default_data(struct pci_dev *pdev,
 
 	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
 	for (i = 0; i < plat->rx_queues_to_use; i++) {
-		plat->rx_queues_cfg[i].use_prio = false;
 		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
 		plat->rx_queues_cfg[i].pkt_route = 0x0;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 7eb22511acf5..4750843cf102 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -184,7 +184,6 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 		if (of_property_read_u32(q_node, "snps,priority",
 					&plat->rx_queues_cfg[queue].prio)) {
 			plat->rx_queues_cfg[queue].prio = 0;
-			plat->rx_queues_cfg[queue].use_prio = false;
 		} else {
 			plat->rx_queues_cfg[queue].use_prio = true;
 		}
@@ -261,7 +260,6 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 		if (of_property_read_u32(q_node, "snps,priority",
 					&plat->tx_queues_cfg[queue].prio)) {
 			plat->tx_queues_cfg[queue].prio = 0;
-			plat->tx_queues_cfg[queue].use_prio = false;
 		} else {
 			plat->tx_queues_cfg[queue].use_prio = true;
 		}
-- 
2.47.3


