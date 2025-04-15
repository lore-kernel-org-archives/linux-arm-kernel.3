Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B298C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DE0kZ2PlT28YVD5BgsTUQV/7iIYJrvjrqwOjFbEQYUY=; b=BPvzBhDzQqnt5oy2Tb88gxMWV6
	a2tFYQT3scHcAVpdyfyJMK6vGpAAWPQxl5wMvgIw+Zp0c1+Egwi5QUMwF+ETf1EpzGsqD/KazmhVg
	+TdgHy4Kb5mC6TikwHJ0jdeXm/d4GIP7xCHNxTbjSiKnS+AlacMv6T+Yys9yk0AsBqFKVjl6LYwRD
	4OUULnTAsHvx2K5gZVj6H9kvKdPt1X7BMotExI4roZnMJYLJJpeXypfEs0OUWaZVHlaTb/6prJg6Y
	YJsKQDknig6/gadDDZA1unP5aRqPZAtFVOlCd8WKylWmGSmmmKoTLJc2u8VV1ykFa+ICDLnJcgoEg
	7+wXCq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dPh-00000005JPF-073N;
	Tue, 15 Apr 2025 10:21:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dJQ-00000005I2a-40tk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DE0kZ2PlT28YVD5BgsTUQV/7iIYJrvjrqwOjFbEQYUY=; b=mYr8sPWdJ38nHrmU3YJI+k3oso
	toLNm2Tm0fHLBOdogwSzcQq9iFiqobLSu/QZ/AdQ9z6+i97dYRJ0ifE4AYmTyCnUkO2ZWwv1TPDcU
	qB88XoFDKEzdL3refZKO1en4zT0EcDcfo7NfGl4OfaK7sIt3T8I8D+nFqVqC8rZATQsQIF6L5Iv5I
	8VYI80C4+DifX/r564Wje2PjPA7lkSJ4Rfb2JOhJ09NaiQ2F7GK7suL0OwLntZgJ3M9EVC/sTv9uY
	AkXr7Se+mwr8uh1V9HP+fZ9mDLbAnpR5qZub43beHXL7s+3yD+gSidl3fuSnfERrmsQDjM3uYAYRT
	gujkv0FA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36202 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4dJI-0007vd-2x;
	Tue, 15 Apr 2025 11:14:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4dIh-000dT5-Kt; Tue, 15 Apr 2025 11:13:55 +0100
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
Subject: [PATCH net-next] net: stmmac: intel: remove unnecessary setting
 max_speed
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4dIh-000dT5-Kt@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 11:13:55 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_031440_997472_9AD30800 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

Phylink will already limit the MAC speed according to the interface,
so if 2500BASE-X is selected, the maximum speed will be 2.5G.
Similarly, if SGMII is selected, the maximum speed will be 1G.
It is, therefore, not necessary to set a speed limit. Remove setting
plat_dat->max_speed from this glue driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 54db5b778304..96c893dd262f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -300,11 +300,8 @@ static void intel_speed_mode_2500(struct net_device *ndev, void *intel_data)
 	if (((data & SERDES_LINK_MODE_MASK) >> SERDES_LINK_MODE_SHIFT) ==
 	    SERDES_LINK_MODE_2G5) {
 		dev_info(priv->device, "Link Speed Mode: 2.5Gbps\n");
-		priv->plat->max_speed = 2500;
 		priv->plat->phy_interface = PHY_INTERFACE_MODE_2500BASEX;
 		priv->plat->mdio_bus_data->default_an_inband = false;
-	} else {
-		priv->plat->max_speed = 1000;
 	}
 }
 
-- 
2.30.2


