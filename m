Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DC2D3B98C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewcWKta31lG91xcQq92+On16j0uc/YUYtkOz+clhhTE=; b=3F06Im6BJ7nqry73pkMSNV4Yq9
	j+empj0GRk8F7bGncMc8lDC/vKbOFhgGJWoNfaDjkGwGqwlrLWx6Uqm0zW6yME1fRiDEM2SRFKmgu
	6lCa/HAd5nD+wEV1+KjYW2Mv6d5JBdpsQLsIKhSp6P3ZTluGsYy2BFrBcXhOZdPxS34xQwiaN0Ty/
	ASLzZwdmTFKL6eK8m+KeykCA2O+1JJtSfTyPX1bRcLk/uUUIlMW+EBJFCfFC5B9lUqDtLS6kVJPSU
	azTNvzC3q5YOjcxa0RBuU1uB/KvE+YZpteuafRaKgb2k+cE9nKx0BGa7+Sg1jWnWl4MZVeP/e1Igk
	U1n/fjkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv6c-0000000AcoJ-20Hn;
	Tue, 26 Nov 2024 12:55:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv3J-0000000AbnA-06fg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ewcWKta31lG91xcQq92+On16j0uc/YUYtkOz+clhhTE=; b=S9l0HvcPZsCZSMq22SpifS8Mxr
	17I28VWmom3IYJatWLuJ65X1MVb6WxfJfy05hbEmXqYndZQ+ws6gsrVROz8Uif0AHfWSeqsXK3YLN
	VEzSzikqAMSJNLPNaEYUdQLACj1Hq9xLue5oVKEeGxk+l00rlMBYSesYELZTtf4fuF57Mp1nG9cB6
	Ams7aBScke1GucZr32o+lDys5SkTSopP4atJM7HmXNlNaTa+Zif5yfWAvhGC4OhWIZNGhdiJLqtV5
	13OxxQWe9IlYn5Qkn/K6MuE/3OuiUWkFyaRzIrUJw1FiJJciPrP2Zz1XqtdtuB79/5AmlLNqMQP9A
	RWC0PAbA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34402 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv3B-0006rS-0F;
	Tue, 26 Nov 2024 12:52:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv3A-005yhN-6R; Tue, 26 Nov 2024 12:52:16 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
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
Subject: [PATCH RFC net-next 01/23] net: phy: ensure that
 genphy_c45_an_config_eee_aneg() sees new value of phydev->eee_cfg.eee_enabled
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv3A-005yhN-6R@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:52:16 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045225_061696_B694082F 
X-CRM114-Status: GOOD (  14.66  )
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

From: Heiner Kallweit <hkallweit1@gmail.com>

This is a follow-up to 41ffcd95015f ("net: phy: fix phylib's dual
eee_enabled") and resolves an issue with genphy_c45_an_config_eee_aneg()
(called from genphy_c45_ethtool_set_eee) not seeing the new value of
phydev->eee_cfg.eee_enabled.

Fixes: 49168d1980e2 ("net: phy: Add phy_support_eee() indicating MAC support EEE")
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reported-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phy.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 4f3e742907cb..a660a80f34b7 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1672,7 +1672,7 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
  * phy_ethtool_set_eee_noneg - Adjusts MAC LPI configuration without PHY
  *			       renegotiation
  * @phydev: pointer to the target PHY device structure
- * @data: pointer to the ethtool_keee structure containing the new EEE settings
+ * @old_cfg: pointer to the eee_config structure containing the old EEE settings
  *
  * This function updates the Energy Efficient Ethernet (EEE) configuration
  * for cases where only the MAC's Low Power Idle (LPI) configuration changes,
@@ -1683,11 +1683,10 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
  * configuration.
  */
 static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
-				      struct ethtool_keee *data)
+				      const struct eee_config *old_cfg)
 {
-	if (phydev->eee_cfg.tx_lpi_enabled != data->tx_lpi_enabled ||
-	    phydev->eee_cfg.tx_lpi_timer != data->tx_lpi_timer) {
-		eee_to_eeecfg(&phydev->eee_cfg, data);
+	if (phydev->eee_cfg.tx_lpi_enabled != old_cfg->tx_lpi_enabled ||
+	    phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer) {
 		phydev->enable_tx_lpi = eeecfg_mac_can_tx_lpi(&phydev->eee_cfg);
 		if (phydev->link) {
 			phydev->link = false;
@@ -1707,18 +1706,23 @@ static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
  */
 int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data)
 {
+	struct eee_config old_cfg;
 	int ret;
 
 	if (!phydev->drv)
 		return -EIO;
 
 	mutex_lock(&phydev->lock);
+
+	old_cfg = phydev->eee_cfg;
+	eee_to_eeecfg(&phydev->eee_cfg, data);
+
 	ret = genphy_c45_ethtool_set_eee(phydev, data);
-	if (ret >= 0) {
-		if (ret == 0)
-			phy_ethtool_set_eee_noneg(phydev, data);
-		eee_to_eeecfg(&phydev->eee_cfg, data);
-	}
+	if (ret == 0)
+		phy_ethtool_set_eee_noneg(phydev, &old_cfg);
+	else if (ret < 0)
+		phydev->eee_cfg = old_cfg;
+
 	mutex_unlock(&phydev->lock);
 
 	return ret < 0 ? ret : 0;
-- 
2.30.2


