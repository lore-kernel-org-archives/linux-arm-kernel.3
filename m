Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38E8CD5BCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOdKUWpnDqUyqcYNuz75KA693wA1dsJDHqrLKwKny5k=; b=t2IUUXkQLHUsH49xZ7K42/n4oR
	2FmIyJ6PllU4W3FLDoSO1aVcTP5aQ2x5kzyJBH/vHNJzxwUX6FFLOySqX+GFIgZu4BFNKueXMDAjd
	lxyP3g0Zx+GBd50w3CI+ZaKHvWWjYFjh0s02N6Te5PkkEDFP1FzmfS+leeGZRWHsVMZfaPEk3VzNG
	T6svGYrPiipO/m7AmiHDw9E9pPe3yfdlJupuWVClv5JOLG8kFlKVhztPCHBxlCQq7WYSEQCaLYeIm
	P8URBWFmoJ0bezegZLcUsqoKC2NTlWNMBHUfPfxOZqOBjO64Hu0d8BE2yT72zkb6K4FGDRaylz/ea
	x4s9bDLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVUN-0000000AO6l-3noK;
	Thu, 13 Nov 2025 11:27:43 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVUI-0000000AO3O-0L52
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:27:39 +0000
X-CSE-ConnectionGUID: MRHuWa0kTI6Lt2ZP5B982A==
X-CSE-MsgGUID: KyhrcSpkSba0cQfQ1HQTYg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Nov 2025 20:27:37 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.175])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3FC48428B0EC;
	Thu, 13 Nov 2025 20:27:32 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	boon.khai.ng@altera.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] net: stmmac: Disable EEE RX clock stop when VLAN is enabled
Date: Thu, 13 Nov 2025 11:27:21 +0000
Message-ID: <20251113112721.70500-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113112721.70500-1-ovidiu.panait.rb@renesas.com>
References: <20251113112721.70500-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_032738_232995_262BD708 
X-CRM114-Status: GOOD (  15.05  )
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

On the Renesas RZ/V2H EVK platform, where the stmmac MAC is connected to a
Microchip KSZ9131RNXI PHY, creating or deleting VLAN interfaces may fail
with timeouts:

    # ip link add link end1 name end1.5 type vlan id 5
    15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
    RTNETLINK answers: Device or resource busy

Disabling EEE at runtime avoids the problem:

    # ethtool --set-eee end1 eee off
    # ip link add link end1 name end1.5 type vlan id 5
    # ip link del end1.5

The stmmac hardware requires the receive clock to be running when writing
certain registers, such as those used for MAC address configuration or
VLAN filtering. However, by default the driver enables Energy Efficient
Ethernet (EEE) and allows the PHY to stop the receive clock when the link
is idle. As a result, the RX clock might be stopped when attempting to
access these registers, leading to timeouts and other issues.

Commit dd557266cf5fb ("net: stmmac: block PHY RXC clock-stop")
addressed this issue for most register accesses by wrapping them in
phylink_rx_clk_stop_block()/phylink_rx_clk_stop_unblock() calls.
However, VLAN add/delete operations may be invoked with bottom halves
disabled, where sleeping is not allowed, so using these helpers is not
possible.

Therefore, to fix this, disable the RX clock stop feature in the phylink
configuration if VLAN features are set. This ensures the RX clock remains
active and register accesses succeed during VLAN operations.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v2 changes:
- Added comment mentioning that EEE RX clock stop is disabled to allow
  access to VLAN registers.
- Added "Reviewed-by" tag from Russell.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ccf383b355e7..101babc8513e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1245,7 +1245,11 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 	/* Stmmac always requires an RX clock for hardware initialization */
 	config->mac_requires_rxc = true;
 
-	if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI))
+	/* Disable EEE RX clock stop to ensure VLAN register access works
+	 * correctly.
+	 */
+	if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI) &&
+	    !(priv->dev->features & NETIF_F_VLAN_FEATURES))
 		config->eee_rx_clk_stop_enable = true;
 
 	/* Set the default transmit clock stop bit based on the platform glue */
-- 
2.51.0


