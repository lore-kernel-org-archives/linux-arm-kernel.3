Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E241107BCF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSfNrtwIA1VaENvujV5TSp8vdQ3v1myOgrpZxvYr8gU=; b=R1PwmaI9vWssioxd9yeL/7IUbf
	hkh1tBN2QXpBzkFOL6UC8irFO7keTYxb+WqAzcDN2mdZbx6FvhDgUrIuZGLuFsVyYPeK9KcW+lvMa
	vmexaZ30HMwNR7O9pIfMkR5Am82JZo46/oA5lRfuPetoJ2s4isPpqiXa3dEkKr6pF/YBMGN86g6Xo
	0g2Pt4qchF9NdXzi79Ymb5Jk7j5uU/x7ILjGlHVCJ6bK34Hvw8eZ+79RJCo6kfo3gZeEoXHbnHs0U
	G8dOZA5IPpJQVgRB7C1byQwYGwIIUkRBxrewfHVLg+xTp/PHdxyujgDIicjSweWtICS7YF220JyeF
	vSWUoGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tPZ-00000008szi-3JX7;
	Wed, 18 Mar 2026 16:06:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tPX-00000008sxy-2488
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cSfNrtwIA1VaENvujV5TSp8vdQ3v1myOgrpZxvYr8gU=; b=IdhPMrk5INj5SfpEsApUO305rb
	cbsAKeqUQ2vTpO6TekMeKYpavN4u7dJF6HZq8wImgtL0lN32U2sungw+EQq+Dg8wU8KBMMxLzJ+0g
	jwl2JRVstQdXs1IiI0D1+DzXbDeUZ+Am0+NNqCtEkSRv2vr3y1Y9sd8IqxBzt3iU8Q8mM3YkRCI8Y
	7Jz18Z+wfc7KYQKYS9JvZL45BHtaEetoLvrCvLl1uQ0eqttFOZwmr5SqsH9z19+dkNX4bbM4pAgB+
	fo7wrDDqqV44E7FS43MAVG/hdJebRTg6Z6xTGk0reA9yF5TjI24ieIXQrwn2deY4gYrZrhzVi8cd3
	NHzQVuMg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47258 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w2tPP-000000003eJ-3WVx;
	Wed, 18 Mar 2026 16:06:11 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w2tPP-0000000DYAX-0TKw;
	Wed, 18 Mar 2026 16:06:11 +0000
In-Reply-To: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
References: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 maybe? 1/5] net: stmmac: move default_an_inband to
 plat_stmmacenet_data
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w2tPP-0000000DYAX-0TKw@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Mar 2026 16:06:11 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_090619_533756_1595E9FD 
X-CRM114-Status: GOOD (  13.36  )
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

Move the default_an_inband flag from struct mdio_bus_data to struct
plat_stmmacenet_data. This is to allow platforms that do not use the
integrated MDIO bus to enable inband mode.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +----
 include/linux/stmmac.h                            | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index f621077c30a4..7898b5075a8b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -298,7 +298,7 @@ static void tgl_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
 
 	if (FIELD_GET(SERDES_LINK_MODE_MASK, data) == SERDES_LINK_MODE_2G5) {
 		dev_info(priv->device, "Link Speed Mode: 2.5Gbps\n");
-		priv->plat->mdio_bus_data->default_an_inband = false;
+		priv->plat->default_an_inband = false;
 		interface = PHY_INTERFACE_MODE_2500BASEX;
 	} else {
 		interface = PHY_INTERFACE_MODE_SGMII;
@@ -700,7 +700,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
 		plat->mdio_bus_data->pcs_mask = BIT_U32(INTEL_MGBE_XPCS_ADDR);
-		plat->mdio_bus_data->default_an_inband = true;
+		plat->default_an_inband = true;
 		plat->select_pcs = intel_mgbe_select_pcs;
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0a933aac3f03..90af7212b8d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1390,7 +1390,6 @@ static int stmmac_init_phy(struct net_device *dev)
 
 static int stmmac_phylink_setup(struct stmmac_priv *priv)
 {
-	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
 	struct phylink *phylink;
@@ -1415,9 +1414,7 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 	priv->tx_lpi_clk_stop = priv->plat->flags &
 				STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
 
-	mdio_bus_data = priv->plat->mdio_bus_data;
-	if (mdio_bus_data)
-		config->default_an_inband = mdio_bus_data->default_an_inband;
+	config->default_an_inband = priv->plat->default_an_inband;
 
 	/* Get the PHY interface modes (at the PHY end of the link) that
 	 * are supported by the platform.
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 72febd246bdb..565bb394b194 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -89,7 +89,6 @@ struct stmmac_mdio_bus_data {
 	int *irqs;
 	int probed_phy_irq;
 	bool needs_reset;
-	bool default_an_inband;
 };
 
 struct stmmac_dma_cfg {
@@ -250,6 +249,7 @@ struct plat_stmmacenet_data {
 	struct stmmac_dma_cfg *dma_cfg;
 	struct stmmac_safety_feature_cfg *safety_feat_cfg;
 	int clk_csr;
+	bool default_an_inband;
 	bool enh_desc;
 	bool tx_coe;
 	bool bugged_jumbo;
-- 
2.47.3


