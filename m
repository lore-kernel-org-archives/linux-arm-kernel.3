Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F97AD3B98C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdW5Yx0SG3F8/WfyoFPcGHNk+kX/hW5pThNLPaZ3wWw=; b=dTe2D9GlW1m/lx5TwSW6GJ9o/t
	AXL+vr/uBI1jW+QU3uJ4DPRju9fXlfQ0eHOs3VkU076znvMN00L430icLw1v3z4A3KFDL7T74ZLui
	62HcdZo6uJm4nWXxDyNg6BHfFLLbDApCjSq4XuUqGoin8V2sw+M9Pn3WcldJdPbVE5NDg4d7QHRcG
	X93SfyzQNj7RHXSMI7B1R5o2XQLxhH6ilb9JEBqN0nygoT4dmdwrJZUdlQBcs+gJZqBdPIwH+/M15
	UuPYyIu85h0yuzY0oPmx55nW7qsaqRwdZWzQKh/ZDwsJweQFj1wqIN05ItC2lk1DGeMGOGwWlwcgo
	ajKswl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv8U-0000000Ad8i-30Ug;
	Tue, 26 Nov 2024 12:57:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv3T-0000000AbqB-0dOp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LdW5Yx0SG3F8/WfyoFPcGHNk+kX/hW5pThNLPaZ3wWw=; b=wiVdL77/UavYrTh6C+a8AncCcR
	DOgwH9iZjeWOUj/8r9oCIq59JaKtilDrTJxehVLDoETTim5ARKuQSKYZvLEOhMyXl5ntSPeAcG3+f
	UjgjyAGxvaVCv+vF9KBstpBKD0u8QXSuvsW9owh4StGO8VqzlXfnIZh2paYneO2tF3TSYxpkKG+cA
	RR5NilUmrYekuDqcjsNRJLOZF+yElgL68/VKSvxVLi27bcD6t9KPG7qAmXJAWlcUbDWqHl/w+hSxl
	DCgJcE/Y+KqFiumwm5fD0yWUnTAd3EUspAFu7BULQ1n0vjz0OoF0I2PnapksmYDOGUJGOuHPtbejX
	RtdPikIg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48726 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv3L-0006rx-2B;
	Tue, 26 Nov 2024 12:52:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv3K-005yhZ-E8; Tue, 26 Nov 2024 12:52:26 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH RFC net-next 03/23] net: phy: marvell: use
 phydev->eee_cfg.eee_enabled
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv3K-005yhZ-E8@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:52:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045235_187651_DEFCDE9D 
X-CRM114-Status: GOOD (  11.20  )
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

Rather than calling genphy_c45_ethtool_get_eee() to retrieve whether
EEE is enabled, use the value stored in the phy_device eee_cfg
structure.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/marvell.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index cd50cd6a7f75..1d117fa8c564 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1508,7 +1508,6 @@ static int m88e1540_get_fld(struct phy_device *phydev, u8 *msecs)
 
 static int m88e1540_set_fld(struct phy_device *phydev, const u8 *msecs)
 {
-	struct ethtool_keee eee;
 	int val, ret;
 
 	if (*msecs == ETHTOOL_PHY_FAST_LINK_DOWN_OFF)
@@ -1518,8 +1517,7 @@ static int m88e1540_set_fld(struct phy_device *phydev, const u8 *msecs)
 	/* According to the Marvell data sheet EEE must be disabled for
 	 * Fast Link Down detection to work properly
 	 */
-	ret = genphy_c45_ethtool_get_eee(phydev, &eee);
-	if (!ret && eee.eee_enabled) {
+	if (phydev->eee_cfg.eee_enabled) {
 		phydev_warn(phydev, "Fast Link Down detection requires EEE to be disabled!\n");
 		return -EBUSY;
 	}
-- 
2.30.2


