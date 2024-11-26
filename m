Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A4AD3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+THxpnpB+Pzg6AUVLr1ssu3RzIpCwc8waUglBp2qOw=; b=k/L2/9MGJKzsjeVfTmP9brPIt7
	KJTQj9lcnRY6yYQM2vfhKZgz+VnCniq5rb3rd5iqQ525Cq7TpbboGMYaWsNSyQyWj5kX8miaRhw8y
	BMn7+E+j7dp7TGYpw2co3nwypDFEDVG73wb2HqQ042E9eZIDsKAfPTJMajHm6dslHKg6Afhj5lEm1
	VabFSm7nxo821iAWW15buwNP1sn746hRb5US5QiY5gIhqrzFwdd21oXKljozUfhPFBQHJbC1d/WA6
	8AaAdR9OtSDXPQCWp9Fdt01rzh5louNRyxQkv0CPlLK7EWrGXOEziNvNRxHU85xG8t4k+zy3v2CP/
	Jdtcc8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrwK-0000000AAIN-21Ha;
	Tue, 26 Nov 2024 09:33:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFroZ-0000000A8Th-0Dey;
	Tue, 26 Nov 2024 09:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g+THxpnpB+Pzg6AUVLr1ssu3RzIpCwc8waUglBp2qOw=; b=GRpm2OY0Zw0dJ0N+JCTvCDY78n
	u/QvZL7ScctRtwe7RGBf4kpWi7XVw4YtbaM1qwpYF4J05XPZMdNGPeKc8SpLS26YdEQ8yNKmbd7ie
	kHnui34Z0DMzM+/Hr+YwsbUL0msNZE8MNjBkoB4zbY9p+76eonE4Brx9Zb8jVtsvY07xRu3aouvxz
	SC0ihPwuX1bbU4rf2u0I9vcEguCHgRnF27k/U5XImtUjHTdMiUwV/EGVBOBnDpGIDYofEs2gxrNQI
	51ax/HuGD3AJhMe/JtzhWST+IN4pqaOrPowlRqv1GrYXdDQVw5CRYgu+dgSz/Rx/QCPJ0wOtMKvLh
	8mNWhP4A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46102 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFroN-0006TK-1Q;
	Tue, 26 Nov 2024 09:24:47 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFroM-005xQ8-6e; Tue, 26 Nov 2024 09:24:46 +0000
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
Subject: [PATCH RFC net-next 06/16] net: phy: marvell: implement
 phy_inband_caps() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFroM-005xQ8-6e@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:24:46 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012459_095127_BB909FD9 
X-CRM114-Status: GOOD (  12.28  )
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

Provide an implementation for phy_inband_caps() for Marvell PHYs used
on SFP modules, so that phylink knows the PHYs capabilities.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/marvell.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index cd50cd6a7f75..3075ebc3f964 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -717,6 +717,20 @@ static int marvell_config_aneg_fiber(struct phy_device *phydev)
 	return genphy_check_and_restart_aneg(phydev, changed);
 }
 
+static unsigned int m88e1111_inband_caps(struct phy_device *phydev,
+					 phy_interface_t interface)
+{
+	/* In 1000base-X and SGMII modes, the inband mode can be changed
+	 * through the Fibre page BMCR ANENABLE bit.
+	 */
+	if (interface == PHY_INTERFACE_MODE_1000BASEX ||
+	    interface == PHY_INTERFACE_MODE_SGMII)
+		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE |
+		       LINK_INBAND_BYPASS;
+
+	return 0;
+}
+
 static int m88e1111_config_aneg(struct phy_device *phydev)
 {
 	int extsr = phy_read(phydev, MII_M1111_PHY_EXT_SR);
@@ -3677,6 +3691,7 @@ static struct phy_driver marvell_drivers[] = {
 		.name = "Marvell 88E1112",
 		/* PHY_GBIT_FEATURES */
 		.probe = marvell_probe,
+		.inband_caps = m88e1111_inband_caps,
 		.config_init = m88e1112_config_init,
 		.config_aneg = marvell_config_aneg,
 		.config_intr = marvell_config_intr,
@@ -3698,6 +3713,7 @@ static struct phy_driver marvell_drivers[] = {
 		/* PHY_GBIT_FEATURES */
 		.flags = PHY_POLL_CABLE_TEST,
 		.probe = marvell_probe,
+		.inband_caps = m88e1111_inband_caps,
 		.config_init = m88e1111gbe_config_init,
 		.config_aneg = m88e1111_config_aneg,
 		.read_status = marvell_read_status,
@@ -3721,6 +3737,7 @@ static struct phy_driver marvell_drivers[] = {
 		.name = "Marvell 88E1111 (Finisar)",
 		/* PHY_GBIT_FEATURES */
 		.probe = marvell_probe,
+		.inband_caps = m88e1111_inband_caps,
 		.config_init = m88e1111gbe_config_init,
 		.config_aneg = m88e1111_config_aneg,
 		.read_status = marvell_read_status,
-- 
2.30.2


