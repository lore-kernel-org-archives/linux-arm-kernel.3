Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C80CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1X7E4uzF8WJQRVH/CVvuyV0+NE8JB74n89rHI5B3Yw=; b=yCBUi3WPQTe/CKpKjnloxtpF3a
	OVe3VLr7YYU6iH40kJAGmqPz8qfloUXAd093UNpv0cn1zC+WFM9JCHnOrj83izZLg8N5v94QWEHHT
	q8M1hudOhYUVrpu/nAB47xawmcjaqP4/K9H78E4O6QQMOh0hez/9DyM7UkqoSKJGVGEVTv9+zDX5Z
	CAgU8budkFVyQgHdV9NBB6JGCBImrYcSb5aF2/Ewp+1Qf7obmqNWQkxqpFIaK5Bi4sx+e/T47eXyW
	qrxYMkPVPgPl62XLHxHJ9NRiZ8fjiqOSEGJDf062LYcl5ZnSUl2Fm01PnjOfho9GFrjbTiml2ytUD
	3aE+2LVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCY-00000007l1E-3tki;
	Fri, 17 Oct 2025 12:04:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCW-00000007kzZ-04YG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 12:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=b1X7E4uzF8WJQRVH/CVvuyV0+NE8JB74n89rHI5B3Yw=; b=eINEka/oodsePRA427mmQK25fp
	4rNHq+3UwzTjJM5+iFy7L9td3HWihgI6nV8KcZDSG1uoabprg14XAIlDu1wpanHWMpC6ZVxrgjbaf
	nK9N0+pL/SSuOLZQ+rRRHK9ZmZYGXuVzZWRrpvzhymRFc55H0xEMt5KWpYe9/HnOW+f2BVxXcjqUh
	OLRRH/P6ZSz/0EUT4JUDVYAel56Oe9Fca901sSfTkzLh+q/Zg2KE4waq6/ioD/otdHscPOarbLFLy
	bm2hkRJZ+ua1r3w2Gjj0+mprSuOXr0M2hottYsuBe0PwmkZ1M1cxjN2N/L/feG6ehLMcnEiLL/E+/
	qhlDljGQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCS-00000007YdU-49zS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 12:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b1X7E4uzF8WJQRVH/CVvuyV0+NE8JB74n89rHI5B3Yw=; b=uBp5Ku7hH/uBSbAGbzpwoD3LFY
	kNcO0ky7T7E8D76LJQFBaIlI9JS3/8rToxx4lBmE2++GkV/fbR3uIkaglYtQZoRW1p72IIRVNY/C8
	HyR6Pk3Dl/O3mroxc+EWPWtsPGuWaXI+bUpF6tIT/os+FGVNdIbeeAKfuYcOssv5U421R+LQnBaR0
	a95Omjt0MjS+6H2URupWpVvHmrsmQDVL7j75t87rAsUQ5mq7BMVwwyNNMKhgCAgNNrAG/lQ/+5b2+
	VLf75irE75p8d48Hq4oNcZgVEJema5W0CWCCYh8pDkKT+ngFwBzxx8Qh3i/EQUDiQRgHW4d/x46Vx
	aeNhT6gw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44998 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v9jCP-000000007pj-0j8p;
	Fri, 17 Oct 2025 13:04:45 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v9jCO-0000000B2O4-1L3V;
	Fri, 17 Oct 2025 13:04:44 +0100
In-Reply-To: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 2/6] net: phy: add phy_may_wakeup()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
Date: Fri, 17 Oct 2025 13:04:44 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_130449_168709_344BA319 
X-CRM114-Status: GOOD (  16.39  )
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
index 7a67c900e79a..b7feaf0cb1df 100644
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
index 3eeeaec52832..801356da1fb2 100644
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


