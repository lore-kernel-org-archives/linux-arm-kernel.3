Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3A5D3B7C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7vDHQj8gjKPY/OyXucbwCCZPbu1weEAVbULrbU1toE=; b=lfx7usjh/qb9tupVrf75RL4mpY
	M9S9vnXUPTohwWaW+TGUw4b6koOTWgklQQPt92DzqedlQ7IghnuNihgB/vX9eX6FJ50vq+JGwfw+b
	fH69AdfHJeC/kyjb13u+/Qq17dy9v7FmWpRSUpI01juLlkV6eagyM22g5JZOMxuMy9FLC9WPgLwuR
	YeZh4r+18ZJR1iNveRGmKlkBd3kpBcft3l5TxBrL/ZR71UcyYJNz8RthaKk5gAw9dBpTZC7nbAuwS
	WhIcQTOSviWmGgtEvC06sI738hpGTb2m2kXUt37315j6cy/7avIZpcaotSzBmIxlz0pdcXL1W+NI0
	+h8P6c9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFryD-0000000AAgP-00EN;
	Tue, 26 Nov 2024 09:34:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFroj-0000000A8Xb-1Vul;
	Tue, 26 Nov 2024 09:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b7vDHQj8gjKPY/OyXucbwCCZPbu1weEAVbULrbU1toE=; b=fXVGaR7VyNcLKRYUi6uqPSBeDM
	gL4BL0GswdwPbKqmbLzZTD8hJ5QvPZwLaCKOWEhV1Q3xEbYDsNH/5ejhoY/RYdMdgAr/R/yXuZe6/
	1184mUyrpKLgXz3jDZ82/wY784QdpvCZA59mrQj54Y4CfUXq4Dw1DjsR6zqIqc+8DWg0fRIy3jf+m
	Qrj7VqJMKv/3nYL9B+C34tWyWuEuBWE/ZftUzPRuhuwKrQo75Cv0/7Adtl7GZgNoig5zv0Ld4gbRR
	hda4zRuVfCyilJRoEuNPy4POkJCavzOnIL4k2LCup3Zef1gMfHE65h5Bk2c1lM/qH+cmmqSKXbzC3
	HQYCJf2g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:32892 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFroX-0006Tz-21;
	Tue, 26 Nov 2024 09:24:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFroW-005xQK-Ee; Tue, 26 Nov 2024 09:24:56 +0000
In-Reply-To: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 08/16] net: phy: marvell: implement
 config_inband() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFroW-005xQK-Ee@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:24:56 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012509_396182_12E3B9DE 
X-CRM114-Status: GOOD (  11.96  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/marvell.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 3075ebc3f964..b885bc0fe6e0 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -731,6 +731,34 @@ static unsigned int m88e1111_inband_caps(struct phy_device *phydev,
 	return 0;
 }
 
+static int m88e1111_config_inband(struct phy_device *phydev, unsigned int modes)
+{
+	u16 extsr, bmcr;
+	int err;
+
+	if (phydev->interface != PHY_INTERFACE_MODE_1000BASEX &&
+	    phydev->interface != PHY_INTERFACE_MODE_SGMII)
+		return -EINVAL;
+
+	if (modes == LINK_INBAND_BYPASS)
+		extsr = MII_M1111_HWCFG_SERIAL_AN_BYPASS;
+	else
+		extsr = 0;
+
+	if (modes == LINK_INBAND_DISABLE)
+		bmcr = 0;
+	else
+		bmcr = BMCR_ANENABLE;
+
+	err = phy_modify(phydev, MII_M1111_PHY_EXT_SR,
+			 MII_M1111_HWCFG_SERIAL_AN_BYPASS, extsr);
+	if (err < 0)
+		return extsr;
+
+	return phy_modify_paged(phydev, MII_MARVELL_FIBER_PAGE, MII_BMCR,
+				BMCR_ANENABLE, bmcr);
+}
+
 static int m88e1111_config_aneg(struct phy_device *phydev)
 {
 	int extsr = phy_read(phydev, MII_M1111_PHY_EXT_SR);
@@ -3692,6 +3720,7 @@ static struct phy_driver marvell_drivers[] = {
 		/* PHY_GBIT_FEATURES */
 		.probe = marvell_probe,
 		.inband_caps = m88e1111_inband_caps,
+		.config_inband = m88e1111_config_inband,
 		.config_init = m88e1112_config_init,
 		.config_aneg = marvell_config_aneg,
 		.config_intr = marvell_config_intr,
@@ -3714,6 +3743,7 @@ static struct phy_driver marvell_drivers[] = {
 		.flags = PHY_POLL_CABLE_TEST,
 		.probe = marvell_probe,
 		.inband_caps = m88e1111_inband_caps,
+		.config_inband = m88e1111_config_inband,
 		.config_init = m88e1111gbe_config_init,
 		.config_aneg = m88e1111_config_aneg,
 		.read_status = marvell_read_status,
@@ -3738,6 +3768,7 @@ static struct phy_driver marvell_drivers[] = {
 		/* PHY_GBIT_FEATURES */
 		.probe = marvell_probe,
 		.inband_caps = m88e1111_inband_caps,
+		.config_inband = m88e1111_config_inband,
 		.config_init = m88e1111gbe_config_init,
 		.config_aneg = m88e1111_config_aneg,
 		.read_status = marvell_read_status,
-- 
2.30.2


