Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1974C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdA8agaxPzxQIQQWrn0uJEVFsTc/quCaDXwb7JdYp+k=; b=nDNzqsFV7dUmbvYpmfjWLEQJah
	X/5liLii/Fl+I77kBtgA+hIj4F4wmS3wZmWy+oLIlXFWbV/uOR5EU/XOa6xuU4HrtapHPRHwuS79m
	VDLNxOmJmtPiHmG0jb82ETERSlg/CxigVK0gYyihJyB0nbxBAM3v1Wtfp0cC9IBg3ovCqMO2It5Jr
	xqNE62zwNz1EREbJI4XwuYzXjhPoreHv0RrgmL/9XUMeykpqxYr+QGjJnDAvlaFFW3/kijYbnrhBt
	2Md1vrysSB96XrEbcKvz4DvTJmWRriNoPW7N7isY5kcTfVAJvkGDknCnf5BSUI4liYUsOzpc8hDQs
	0mn9BIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASoA-0000000FTpt-3fQk;
	Thu, 01 May 2025 12:14:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASMb-0000000FJPy-2ML4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OdA8agaxPzxQIQQWrn0uJEVFsTc/quCaDXwb7JdYp+k=; b=GhZhaaV9+W8BpvPOukv6nuhPQ2
	R1EdMDq+xyWD6dnRoviKN/PtC7Q8Jap0ahR/qhJ7jNbYTooTuk05IeKxFb4ntHf6/fVSddInWyCbr
	XCIKgJ3yUvMk0x0usONd+pxQuCx1o2Qklcva7kNXOBwlQvo9Bp6yp/RRplBEKKLGXCzWLeOosO8oJ
	2b4h8KX5iCJH9hpYKTlLCXXVHbYj3xUIBVugFifx3UiQ2zi+FlUpzsVPlrCoCYawJ1W6o0efCEzH9
	0USk2ThGk/a4VgZ69qw92D+xe6+PwXN8OW0HGvyqNDdJS87ji/P1Erh1KenXoW2KeMy+JwslKJiwE
	xIwDLumQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59062 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uASMV-00005H-0T;
	Thu, 01 May 2025 12:45:55 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uASLs-0021Qk-Qt; Thu, 01 May 2025 12:45:16 +0100
In-Reply-To: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 4/6] net: stmmac: intel: move phy_interface init to
 tgl_common_data()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uASLs-0021Qk-Qt@rmk-PC.armlinux.org.uk>
Date: Thu, 01 May 2025 12:45:16 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_044601_603013_E5BBDA8A 
X-CRM114-Status: GOOD (  10.13  )
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

Move the initialisation of plat->phy_interface to tgl_common_data()
as all callers set this same interface mode. This moves it to a
single location to make the change to get_interfaces() more obvious.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 96c893dd262f..4b263a3c65a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -929,6 +929,7 @@ static int tgl_common_data(struct pci_dev *pdev,
 	plat->rx_queues_to_use = 6;
 	plat->tx_queues_to_use = 4;
 	plat->clk_ptp_rate = 204800000;
+	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
 	plat->speed_mode_2500 = intel_speed_mode_2500;
 
 	plat->safety_feat_cfg->tsoee = 1;
@@ -948,7 +949,6 @@ static int tgl_sgmii_phy0_data(struct pci_dev *pdev,
 			       struct plat_stmmacenet_data *plat)
 {
 	plat->bus_id = 1;
-	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
 	return tgl_common_data(pdev, plat);
@@ -962,7 +962,6 @@ static int tgl_sgmii_phy1_data(struct pci_dev *pdev,
 			       struct plat_stmmacenet_data *plat)
 {
 	plat->bus_id = 2;
-	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
 	plat->serdes_powerup = intel_serdes_powerup;
 	plat->serdes_powerdown = intel_serdes_powerdown;
 	return tgl_common_data(pdev, plat);
@@ -976,7 +975,6 @@ static int adls_sgmii_phy0_data(struct pci_dev *pdev,
 				struct plat_stmmacenet_data *plat)
 {
 	plat->bus_id = 1;
-	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
 
 	/* SerDes power up and power down are done in BIOS for ADL */
 
@@ -991,7 +989,6 @@ static int adls_sgmii_phy1_data(struct pci_dev *pdev,
 				struct plat_stmmacenet_data *plat)
 {
 	plat->bus_id = 2;
-	plat->phy_interface = PHY_INTERFACE_MODE_SGMII;
 
 	/* SerDes power up and power down are done in BIOS for ADL */
 
-- 
2.30.2


