Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6D1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CptdhOmIiK74/cqNoKvXZqIc7PMk6vFgV5u4seREFCg=; b=va2+lZep5hMQKeKRf13Ady1Ysy
	9YmhsLQPf3D0pfhnjqSRni3U1ru8eubrI88+SRUFTX0EeCo5KPUUcfpdbL/GLjXpzZMLuZzgIDinw
	txi7fPHq09r3BS5mGaCbcrNTbZdbGk9ktKgW1NrQkiPjlpFmwlHzblYNgzi9ZBScADDrPc75Fu/fK
	9ejJDDVI9yG7oz2m4/SYT04GuA00KbUBoQQylNT1TENE4IInsUocLmLMjDaceTOrPmBRzumKwiqHa
	S+auj7/kjY/vU7iaa3DrWmnQgh1h1j1ScOvs9P5+xUoS4PcTTpFBuSpJ+/9nrSyG5hExVUp8F6Mq7
	Jo55KbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEKh-00000001aoc-0ZtC;
	Mon, 14 Jul 2025 08:14:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubE6u-00000001YCI-3rmk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 08:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E89E61136;
	Mon, 14 Jul 2025 08:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F04E2C4CEF6;
	Mon, 14 Jul 2025 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752480028;
	bh=Yq9Ky8VsS9kS5h5dcxlefIW7mRIPAU0Vre1zK1k0Ea4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qGCb2CXkje7zXwMgiKGRFwYLDG3zmn/ZpoZeYWwh1HUsfwd6S8Vw3Ej8UiaZYfLDG
	 VF8xEAEKbOvJWsPjyVvnFvKuttOqIKEkgH7le3gn4yrjcLDtwyObny2NGDp+zmmP9T
	 d7eVQOSaTXGAvAt0EenJ5ANVc/raFw3lpl15R+rDGnLPmBqvs1XU48i4K1pwCoZHkg
	 yZ0sd2iK3r1Qqv3zXbGw6/mlitOU3i+eBknBvY86FDqRHuOcdAG37Zs+GSmKsOuPE3
	 7nzZfLwgl1QS+nyzPZJ+yH1UyZ+6P9B1gqKe96VsG5QKoVODEJqnthacAmLkDKT8Xx
	 0+BBn5tlxhcnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BFBC83F17;
	Mon, 14 Jul 2025 08:00:27 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Mon, 14 Jul 2025 15:59:18 +0800
Subject: [PATCH net-next 2/3] net: stmmac: xgmac: Correct supported speed
 modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
In-Reply-To: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Serge Semin <fancer.lancer@gmail.com>, 
 Romain Gantois <romain.gantois@bootlin.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752480026; l=3261;
 i=rohan.g.thomas@altera.com; s=20250415; h=from:subject:message-id;
 bh=VG2Dfp/g/YHOIG/+Mje0Iha3SvShc7S+fE/4uX6Rxa8=;
 b=29subWKkHTxTo19LkKQVvEstduVel5NjOed85DdVpVPrwfoUX/brn1WLcLhYZQ6vSGC/oJi4Z
 gyR00E9wtRHB/2xExpa7WovLQbH+oFfvQeuK18Mpca1mKfEL9fNfuOx
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=TLFM1xzY5sPOABaIaXHDNxCAiDwRegVWoy1tP842z5E=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250415
 with auth_id=460
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Correct supported speed modes as per the XGMAC databook.
Commit 9cb54af214a7 ("net: stmmac: Fix IP-cores specific
MAC capabilities") removes support for 10M, 100M and
1000HD. 1000HD is not supported by XGMAC IP, but it does
support 10M and 100M FD mode, and it also supports 10M and
100M HD mode if the HDSEL bit is set in the MAC_HW_FEATURE0
reg. This commit adds support for 10M and 100M speed modes
for XGMAC IP.

Fixes: 9cb54af214a7 ("net: stmmac: Fix IP-cores specific MAC capabilities")
Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 14 ++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c  |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 6cadf8de4fdfdb18af1a112b883b3d33a53da638..3cef8ba5a7f6c1b02881b8a4ac1eadb18ecfece4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -49,6 +49,15 @@ static void dwxgmac2_core_init(struct mac_device_info *hw,
 	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
 }
 
+static void dwxgmac2_update_caps(struct stmmac_priv *priv)
+{
+	/* If HDSEL bit is set in MAC_HW_Feature0 register then XGMAC supports
+	 * half duplex mode but only for 10Mbps and 100Mbps speed modes.
+	 */
+	if (priv->dma_cap.half_duplex)
+		priv->hw->link.caps |= (MAC_10HD | MAC_100HD);
+}
+
 static void dwxgmac2_set_mac(void __iomem *ioaddr, bool enable)
 {
 	u32 tx = readl(ioaddr + XGMAC_TX_CONFIG);
@@ -1424,6 +1433,7 @@ static void dwxgmac2_set_arp_offload(struct mac_device_info *hw, bool en,
 
 const struct stmmac_ops dwxgmac210_ops = {
 	.core_init = dwxgmac2_core_init,
+	.update_caps = dwxgmac2_update_caps,
 	.set_mac = dwxgmac2_set_mac,
 	.rx_ipc = dwxgmac2_rx_ipc,
 	.rx_queue_enable = dwxgmac2_rx_queue_enable,
@@ -1532,8 +1542,8 @@ int dwxgmac2_setup(struct stmmac_priv *priv)
 		mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
 
 	mac->link.caps = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
-			 MAC_1000FD | MAC_2500FD | MAC_5000FD |
-			 MAC_10000FD;
+			 MAC_10FD | MAC_100FD | MAC_1000FD |
+			 MAC_2500FD | MAC_5000FD | MAC_10000FD;
 	mac->link.duplex = 0;
 	mac->link.speed10 = XGMAC_CONFIG_SS_10_MII;
 	mac->link.speed100 = XGMAC_CONFIG_SS_100_MII;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 7201a38842651a865493fce0cefe757d6ae9bafa..76a98d28f9de693ef6cb4c115e38f69c9a965b54 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -405,6 +405,7 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->sma_mdio = (hw_cap & XGMAC_HWFEAT_SMASEL) >> 5;
 	dma_cap->vlhash = (hw_cap & XGMAC_HWFEAT_VLHASH) >> 4;
 	dma_cap->half_duplex = (hw_cap & XGMAC_HWFEAT_HDSEL) >> 3;
+	dma_cap->mbps_10_100 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;
 	dma_cap->mbps_1000 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;
 
 	/* MAC HW feature 1 */

-- 
2.25.1



