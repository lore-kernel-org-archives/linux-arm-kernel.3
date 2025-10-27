Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B740BCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObvvfYM44FTbwUJpbdSEvWMrXCyw//C3N19B6DVqQac=; b=fcfpMhjgfzZ6xNF5IU/4tozBiw
	zgDuRV50KkoA+7DuTV/Za3Cy5WxgbKd7gBn4v8bsnmkaGEaiuBcWNkE6F7rZ/MJ9BzAZ1cyYcYQ+n
	MmkjaJCtN0/YiOM7hwxzPo1UYhOy+Xai2H8tjOAHyR4gypslJPjPf7KHHapBBiLqWKffhnxBXwBdy
	u9LrpojrglqS6ArpHzxv8jf/rnIg8n5w2Ev0Ud+gjE1pRBRDhxwhjndbTVAEIOx1g/G1rkRCh2UVs
	S4O+oFCbIdsiHSb9LLmrDjQi6lWl40OCI/xHBbLui1UHVXjsHXNflbTYDHmTnNqXfhLmqgxxA3Z9P
	/hzb+MUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOv0-0000000ECUO-2tV6;
	Mon, 27 Oct 2025 15:13:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOuy-0000000ECTP-1Hrn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ObvvfYM44FTbwUJpbdSEvWMrXCyw//C3N19B6DVqQac=; b=BsQ6jui8m6ldUL4e9YJPTB7YFt
	qm8iwtSzX2G3fQ9WTrJGQYHLQ8LJI7R2rCKSOGMzdrhv1e8YGU4tnCc+o450aNval+U2ItnBhiv0m
	a3gBtV/6I0pcreEIBU+voykE//AsQv/ws6EUrGySPVTrZwt2LeUi67ALyLNoBngIaRUmNasUwdqSJ
	mpWXP77JvZkdyMH0Yj5gF5n34u54hA8+664sCHsuJ2mDhueqcUroUAfYm5LyKblqvsde1un1IG7Nz
	UYz+Ym/PO2LGxM/f5+Z8luAE5R7Uc8/6+K0KCLsNcR/TH4QnrSzC/k0SKvhjXbSjonrkl1s6Lq/4u
	XmrFyQxw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48518)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDOuu-0000000020b-2qfk;
	Mon, 27 Oct 2025 15:13:52 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDOut-000000005hO-1KtM;
	Mon, 27 Oct 2025 15:13:51 +0000
Date: Mon, 27 Oct 2025 15:13:51 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aP-ML-A_h13pXY2d@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_081356_345024_794E1AD7 
X-CRM114-Status: GOOD (  18.39  )
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

On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
> Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> devices produces an interrupts storm. Disable EEE support to fix it.

We've finally got to the bottom of what's going on here. Please try
this patch (it's building locally, but will take some time because
I'd wound the tree back to 6.13 and 6.14, so it's going to be a full
rebuild.) Thus, there may be compile bugs remaining.

This uncovered a latent bug in Emanuele's case - the TI PHY drivers
report EEE capabilities despite not being capable which also needs
fixing. The patch below will stop stmmac enabling EEE by default on
PHYs described in firmware, which is the behaviour the driver used
to have.

If we decide that EEE should be enabled by default, then we'll need
to revert this change. However, given Oleksij's recent input, I'm
wondering whether EEE should default to disabled given the issues
with Tq. The suggestion there is that many PHYs get it wrong and thus
are incompatible with each other when EEE is enabled.

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fd5106880192..c18690a6804f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1208,6 +1208,24 @@ static int stmmac_init_phy(struct net_device *dev)
 	return 0;
 }
 
+static bool stmmac_has_fw_phy(struct stmmac_priv *priv)
+{
+	struct fwnode_handle *fwnode;
+
+	fwnode = priv->plat->port_node;
+	if (!fwnode)
+		fwnode = dev_fwnode(priv->device);
+
+	if (!fwnode)
+		return false;
+
+	fwnode = fwnode_get_phy_node(fwnode);
+	if (fwnode)
+		fwnode_handle_put(fwnode);
+
+	return !!fwnode;
+}
+
 static int stmmac_phylink_setup(struct stmmac_priv *priv)
 {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
@@ -1270,7 +1288,7 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 		/* All full duplex speeds above 100Mbps are supported */
 		config->lpi_capabilities = ~(MAC_1000FD - 1) | MAC_100FD;
 		config->lpi_timer_default = eee_timer * 1000;
-		config->eee_enabled_default = true;
+		config->eee_enabled_default = !stmmac_has_fw_phy(priv);
 	}
 
 	config->wol_phy_speed_ctrl = true;

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

