Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD39ECD6FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 00:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUU3G2pIPKImDdviFDBqLROKqQ1tK+TJdl6js+E9CcQ=; b=KbS2rhXeoupPhWUQl4xogHTliv
	ltyUlluXBN7eyVDOTwKiSG9J5z8mA7tQ6e4IQ82Hn/du0I52P1EgoRQrfMaSd8Rctj03LVk4NgU5K
	Du0o8lkV3lDVC6Ap91BBA+Fq0V+0QzzSJ95Rc33IDHx6aSUMoiNaSlE4orAv70zRY7ZsoqcGQ+lod
	ve0px6Qb5ZxoeAP2zKM+hhNUANkAEUy7cFCmlHElfdGp65uXCb/nqP5D1vnhWney7j+uyHN4NCUoN
	qmOqkf7i0SDeBB81+WKbJbl1iwuQknkVrGKtfJiNagDHU+LRDuXeeu+y4y9IT0KMOCNM4KybSCh3P
	z35Z+uKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqKPt-00000001DYX-49xw;
	Thu, 12 Feb 2026 00:18:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqKPq-00000001DUg-2Uop
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 00:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NUU3G2pIPKImDdviFDBqLROKqQ1tK+TJdl6js+E9CcQ=; b=J4acbZB5ZnKs8MjsZlf/bQBibg
	6p4plPz9zs94RfUBSHH/Ijz8bVK54YTqi62xQx2w/vV+JYumtPGNlvwhtKzzH2ZWdAWyci7VJeAcx
	GrJp7DAfOy5DoPjxUh0LoPLmHwJHw1Io9/Aq6y6xj4R8+u6DH9Jqjw9l8M7BHjfKaBYjOQeLsnmdu
	prBf8aP1pnTfjiXuBI1XzM3QI/3JXYzkUhJ3lp+grl9r5edY+XCp/yu807v+lKxLDW19Gw2Rrth1Z
	FSO7Jpmj+5V6cFwKEdQv+zn+YJ/UWdkhyI8ZEl1y178mY0eSd10xI7JyAntfBGXZ+Yio85ai6UsVz
	9Cu8ChWQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51160 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vqKPY-000000003qW-3dB8;
	Thu, 12 Feb 2026 00:18:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vqKPV-000000093mr-3iT0;
	Thu, 12 Feb 2026 00:18:21 +0000
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next 8/9] net: stmmac: qcom-ethqos: use phy interface
 mode for inband
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vqKPV-000000093mr-3iT0@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Feb 2026 00:18:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_161842_633447_4C0363AB 
X-CRM114-Status: UNSURE (   9.65  )
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

qcom-ethqos currently forces inband to be enabled for the Cisco SGMII
speeds (1G, 100M and 10M) but not for 2500BASE-X (2.5G).

Rather than using the speed to determine the forced inband state, use
phylink's PHY interface mode which will switch between SGMII for the
10M, 100M and 1G speeds, and 2500BASE-X for 2.5G.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e2dd334ffd31..cd6d1660bdb2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -615,30 +615,26 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 
 	switch (speed) {
 	case SPEED_2500:
-		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-			      RGMII_IO_MACRO_CONFIG2);
-		ethqos_set_serdes_speed(ethqos, SPEED_2500);
-		ethqos_pcs_set_inband(priv, false);
-		break;
 	case SPEED_1000:
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_100:
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_10:
 		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
 			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
 					 SGMII_10M_RX_CLK_DVDR),
 			      RGMII_IO_MACRO_CONFIG);
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		ethqos_pcs_set_inband(priv, true);
 		break;
 	}
+
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		ethqos_set_serdes_speed(ethqos, SPEED_1000);
+	else
+		ethqos_set_serdes_speed(ethqos, SPEED_2500);
+
+	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
 static void ethqos_configure(struct qcom_ethqos *ethqos,
-- 
2.47.3


