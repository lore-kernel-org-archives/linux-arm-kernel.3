Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50878CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 08:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRHUASpZNpL3VRyQX74pzizWthRGiNuqvRODSjFvKBc=; b=j5NhEIMPKo0fIJa0yQws6LyQZn
	3F9FCm7+Ye9gbmwWDhs+Z1gD5bbb9+HTN1YPuX9qfFXg2/jsZmUC8RAzfARwT0r1fiy8eRhsg8Dq3
	M+ilUsaRBepTCww5jqcsP9e6tLdF0A7Xz+BDUTu3Vps1tWDSjMfS82NHRhBvosIoJKDucKugRlbQb
	+N3d3n/Xd69sJj03Jwbte15y7S/B1RglomWegJzJUBTFV+40MnbzoeOBU0eK8NY5wG23E7gUB1YNG
	cFZ8E7u4r1iL3TVnN7t3SZXK48gOf2+XySQrLFVsrqSukrM36VjYRZ/1ayZEPejjiWDTAKbDz1KqM
	WGjWt1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nFW-0000000EUfY-19n2;
	Sun, 28 Sep 2025 08:59:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2nFT-0000000EUaP-2lVC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 08:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dRHUASpZNpL3VRyQX74pzizWthRGiNuqvRODSjFvKBc=; b=FJSx76mj23T79CLUxd3KbBKvJL
	rnM5mlqwn4ussFrt7nROV+s/Aim8RZblq2mqVDi1UlaQTZjYGycszBu0LdXKJdtARbKg7eMZsqTrs
	78iUYJ9rMzgkcAkzIYk7mvbBxTfBnLirjERnvtpN2t1nc2oADPylLIXoEf7JzNGAuLLEaxNiSPrnc
	5HgFlScs7M6ljpdVDEDRnHedDLeKFZL+yrD2dbU8l/GfPSwLlQidYkX1wuJFaFEpUXPj25ERXUiJ3
	gfn9JXFIJE9uORGTpJaQvNEzGTsSuHZSdSJxBRbRfTmAPybyLLuPKsuofUP4ZUJOayDzuuhOVw6zq
	fuOzqM5Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36008 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v2nFE-000000005Ak-27a8;
	Sun, 28 Sep 2025 09:59:00 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v2nFD-00000007jXP-0fX2;
	Sun, 28 Sep 2025 09:58:59 +0100
In-Reply-To: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
References: <aNj4HY_mk4JDsD_D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	 Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>
Subject: [PATCH RFC net-next 2/6] net: phy: add phy_may_wakeup()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v2nFD-00000007jXP-0fX2@rmk-PC.armlinux.org.uk>
Date: Sun, 28 Sep 2025 09:58:59 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_015915_704557_1E0C7217 
X-CRM114-Status: GOOD (  17.36  )
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

Add phy_may_wakeup() which uses the driver model's device_may_wakeup()
when the PHY driver has marked the device as wakeup capable in the
driver model, otherwise use phy_drv_wol_enabled().

Replace the sites that used to call phy_drv_wol_enabled() with this
as checking the driver model will be more efficient than checking the
WoL state.

Export phy_may_wakeup() so that phylink can use it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phy_device.c | 14 ++++++++++++--
 include/linux/phy.h          |  9 +++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 01269b865f5e..4c8df9f02eb3 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -251,6 +251,16 @@ static bool phy_drv_wol_enabled(struct phy_device *phydev)
 	return wol.wolopts != 0;
 }
 
+bool phy_may_wakeup(struct phy_device *phydev)
+{
+	/* If the PHY is using driver-model based wakeup, use that state. */
+	if (phy_can_wakeup(phydev))
+		return device_may_wakeup(&phydev->mdio.dev);
+
+	return phy_drv_wol_enabled(phydev);
+}
+EXPORT_SYMBOL_GPL(phy_may_wakeup);
+
 static void phy_link_change(struct phy_device *phydev, bool up)
 {
 	struct net_device *netdev = phydev->attached_dev;
@@ -302,7 +312,7 @@ static bool mdio_bus_phy_may_suspend(struct phy_device *phydev)
 	/* If the PHY on the mido bus is not attached but has WOL enabled
 	 * we cannot suspend the PHY.
 	 */
-	if (!netdev && phy_drv_wol_enabled(phydev))
+	if (!netdev && phy_may_wakeup(phydev))
 		return false;
 
 	/* PHY not attached? May suspend if the PHY has not already been
@@ -1909,7 +1919,7 @@ int phy_suspend(struct phy_device *phydev)
 	if (phydev->suspended || !phydrv)
 		return 0;
 
-	phydev->wol_enabled = phy_drv_wol_enabled(phydev) ||
+	phydev->wol_enabled = phy_may_wakeup(phydev) ||
 			      (netdev && netdev->ethtool->wol_enabled);
 	/* If the device has WOL enabled, we cannot suspend the PHY */
 	if (phydev->wol_enabled && !(phydrv->flags & PHY_ALWAYS_CALL_SUSPEND))
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 7f6758198948..2292ee9a93c0 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1391,6 +1391,15 @@ static inline bool phy_can_wakeup(struct phy_device *phydev)
 	return device_can_wakeup(&phydev->mdio.dev);
 }
 
+/**
+ * phy_may_wakeup() - indicate whether PHY has driver model wakeup is enabled
+ * @phydev: The phy_device struct
+ *
+ * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
+ * setting.
+ */
+bool phy_may_wakeup(struct phy_device *phydev);
+
 void phy_resolve_aneg_pause(struct phy_device *phydev);
 void phy_resolve_aneg_linkmode(struct phy_device *phydev);
 
-- 
2.47.3


