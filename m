Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7039AF3092A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+uU8Ete3jLODjZm/eSd2z0Hl7GhhT8W+8QoodsNuz0=; b=z855q6tpaTw7VNmjU0lxdNWpnQ
	I2wWUQHXiqdhwOaBxbWlP8FCQ5WL1Yw3lbyiXPbrEkXIgJAf+9OV3z9pwvhof8jhgDNBqaiKTCcfG
	roLM/m0eCWjv1OUn4zpsfv7wh/8VdN0KbG1/lL69uYl3eC4gKFKVCdRYQEfufMASbC9A2j3oazHxh
	Z1/JOsGFxyxB2+FLHrs8aJIWkH8MAQKq2562fhqP6CPQf4nLWlGqVGTluQUMyOY2B22RoAqPmQLb6
	gR+xx0gqy81l2NnxGYwOFHtWgDP3iArz9sdMBUKBjXyAcLPpBbYzRGmAfz8ZjEUeJCZjNxpldO5WL
	h5GNS8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6Am-00000001bkC-45VE;
	Thu, 05 Mar 2026 10:43:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6Al-00000001bgi-01fB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M+uU8Ete3jLODjZm/eSd2z0Hl7GhhT8W+8QoodsNuz0=; b=rQoMEqtHblG8oB1GYZD2LZWH13
	HwHk4cqCYHU4f18hRy6xXkW3uq1OobYqWvHt9AWy585hhGqnvenh13+iiXiZ5NuNWGYFxMA9RTazP
	2hsftJXDUJFqOoO61UxNk/iCKL1S2LdzDsQoqtZA/7ScQZLprDfyfoXLThUmqgu5ZGDbQHs9WNvP9
	D1KW1GsUPFEflRsxmmez1q3iUlmzVmVJCoPhjk0K8d/0aoElM4rjYCLgY6eTCqbmXwizeFYqEgK32
	gTfwxAlkvnQ2IR7vYC6EeV7zEkfn6PjP1D+NfztaBFEbUHqiSQquFGkSFD+TqY9/L3DY43oSh/IKo
	TFSdTW4w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50178 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vy6Ac-000000007oy-0p0n;
	Thu, 05 Mar 2026 10:43:06 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vy6AY-0000000BtxJ-3smT;
	Thu, 05 Mar 2026 10:43:02 +0000
In-Reply-To: <aald--qJquWGIvmO@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next v2 8/8] net: stmmac: make pcs_mask and phy_mask u32
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vy6AY-0000000BtxJ-3smT@rmk-PC.armlinux.org.uk>
Date: Thu, 05 Mar 2026 10:43:02 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_024315_046247_A468D3F7 
X-CRM114-Status: GOOD (  12.58  )
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

The PCS and PHY masks are passed to the mdio bus layer as phy_mask
to prevent bus addresses between 0 and 31 inclusive being scanned,
and this is declared as u32. Also declare these as u32 in stmmac
for type consistency.

Since this is a u32, use BIT_U32() rather than BIT() to generate
values for these fields.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c    | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 2 +-
 include/linux/stmmac.h                               | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index ece2a0c38562..fc13bfb47783 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -699,7 +699,7 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	/* Intel mgbe SGMII interface uses pcs-xcps */
 	if (plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
 	    plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) {
-		plat->mdio_bus_data->pcs_mask = BIT(INTEL_MGBE_XPCS_ADDR);
+		plat->mdio_bus_data->pcs_mask = BIT_U32(INTEL_MGBE_XPCS_ADDR);
 		plat->mdio_bus_data->default_an_inband = true;
 		plat->select_pcs = intel_mgbe_select_pcs;
 	}
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index b913fe5af488..ada6c6ef1f5c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -168,7 +168,7 @@ static int loongson_gnet_data(struct pci_dev *pdev,
 	loongson_default_data(pdev, plat);
 
 	plat->phy_interface = PHY_INTERFACE_MODE_GMII;
-	plat->mdio_bus_data->phy_mask = ~(u32)BIT(2);
+	plat->mdio_bus_data->phy_mask = ~BIT_U32(2);
 	plat->fix_mac_speed = loongson_gnet_fix_speed;
 
 	return 0;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 678d03d6d3bd..965ada809fdf 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -84,8 +84,8 @@ struct stmmac_priv;
 /* Platfrom data for platform device structure's platform_data field */
 
 struct stmmac_mdio_bus_data {
-	unsigned int phy_mask;
-	unsigned int pcs_mask;
+	u32 phy_mask;
+	u32 pcs_mask;
 	int *irqs;
 	int probed_phy_irq;
 	bool needs_reset;
-- 
2.47.3


