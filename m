Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC7CE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 11:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4s396obXaI1f8Yz3z+7hU/+8e3s2TBg9V0/XcDUux8s=; b=FCgpGdMJyiReTzWmvEgNsyfCKZ
	k2p1oJHhPgDq1ShHbBQ/qsji2UqGxUjSgCILPhaQGrMyGXbyLl1oyDvrp+if9E4+Q1Hocpdafi9Ij
	yuowkAphozD1ncMk5esoNxxox1bVKF1rSMfnZoRAnojx3NtLTzGDxWzXzOJ6c821LT5ebKGAhWuku
	vXWMf0TSl69wP+tqk46oIW4ZeLpmUFSR3bUXmKUb3zZQMuEuw27VhXe2F5n8XKuL1y6nfpznkkEax
	j7Gx/7pBPET12lo53VRhSitcz978gnpYgx0331yOBeseBzraTiS32J5e5kkhl1hN/qWiuI9/HQR2S
	c4FcDdRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfmR-0000000CpIp-2I12;
	Fri, 03 Jan 2025 11:23:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTffw-0000000CoAp-1AVX;
	Fri, 03 Jan 2025 11:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4s396obXaI1f8Yz3z+7hU/+8e3s2TBg9V0/XcDUux8s=; b=P7wgdPrI4AcqfEfWWuDx1a/tNT
	0Ax1clrro5GRgNFgLC8VP3GtrZYGo/YJNafuQ01+Lgv6h+TC4LRtbGfBunbBWoEXzV/2KoggfwLiv
	vwD/IHr0bV/PVYwuhdIeTG9jn4q4zxkOemjdPO0SLtPXymx4W8tEc3dBKRPr0XPU4IPRBK+W/LEOf
	tbwCumzIj9YiwFyYiKT8B3f0k/sK9OGW98C+ZCEReksBwvdTd3RoJD9VNpvQLkiFxv/QqAF2wcC7q
	/cLRRUFbHMIbpVPX3o9AiUubFdmaMScAPhUYMH0aAx68R83LfavnW39ixzTxTK0c0/QJdt/iDPcfv
	EDLSZ1iw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38368 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tTffj-00031K-0s;
	Fri, 03 Jan 2025 11:16:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tTfff-007Roc-Ff; Fri, 03 Jan 2025 11:16:51 +0000
In-Reply-To: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
References: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 5/6] net: stmmac: use PCS supported_interfaces
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tTfff-007Roc-Ff@rmk-PC.armlinux.org.uk>
Date: Fri, 03 Jan 2025 11:16:51 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_031708_315844_943C2CF1 
X-CRM114-Status: GOOD (  10.41  )
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

Use the PCS' supported_interfaces member to build the MAC level
supported_interfaces bitmap.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6bc10ffe7a2b..fcb5649fb738 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1203,6 +1203,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	int mode = priv->plat->phy_interface;
 	struct fwnode_handle *fwnode;
+	struct phylink_pcs *pcs;
 	struct phylink *phylink;
 
 	priv->phylink_config.dev = &priv->dev->dev;
@@ -1224,8 +1225,14 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 
 	/* If we have an xpcs, it defines which PHY interfaces are supported. */
 	if (priv->hw->xpcs)
-		xpcs_get_interfaces(priv->hw->xpcs,
-				    priv->phylink_config.supported_interfaces);
+		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
+	else
+		pcs = priv->hw->phylink_pcs;
+
+	if (pcs)
+		phy_interface_or(priv->phylink_config.supported_interfaces,
+				 priv->phylink_config.supported_interfaces,
+				 pcs->supported_interfaces);
 
 	fwnode = priv->plat->port_node;
 	if (!fwnode)
-- 
2.30.2


