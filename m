Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8C1E98DFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Do17YiNZlO1FGZYCmIGfMRB4ftX2C7NWXrIlFxQE5s8=; b=dE+wu9kSVuEM23+xbAIX18cZr5
	ZcI3wjGjf7pRQgiYM1Ti/ZZx2WcKjWcqtwBxs6U0t6i094xD6mHz0p7rnIpFtYWKs114TPajA3Bzg
	FbfqS0MSmAKq6Xlx6iaPaeYJRWulSBq4lU6mrKTS+ihhr1x9Jr4IPhcaRYc83EH5W2fl51ttqwZss
	sQDyRvb87xzPY2oRI2Qez8lqMO36zmKqoJ9w1RnNUBF55Po0c0PMTD+oSq4lbRCauwf4kEC4F5vZ5
	Y3ZywLUzeddbHcMNo8eea/M5NGOhK3c7z/T05JZLdAZQR9WBx8inijFEj65T34FP4bz6tmJ8tg68X
	lEIVkcGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSLY-0000000HYDS-1uyB;
	Mon, 23 Feb 2026 09:35:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSLW-0000000HYAQ-0roC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:35:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Do17YiNZlO1FGZYCmIGfMRB4ftX2C7NWXrIlFxQE5s8=; b=QVSPFkTiCI2m+8WibS0TgADta0
	i2Bhf6uFaJn/aTr/c15U1LUqg/9F4qBcXyjWoGepyzvAoW/0QwPIbG09JczkqvbjMYc0WnGjrH5bN
	j+uQtqqTzdgcJrzU8DwoZu2QHFyYZZ/Gcg7QF6Ltpx8r1NmMejZ6Hcvg/qq1p1wpWRwsNAYK2TFlj
	JYAkgEtOjIX+sSG2b0CxDLFijmfwCLZ46Mt4P9HfsF3hnyX3gB8bbOKJ/SwXUssvHOGpCjgPxCAnF
	A3yIgjxMA3GRAsmy+XN5dC620I8csyc6+nbuybood48Zo8EzuzolW333qWzAinU5Xkb64KLgFvfpR
	qhYLpFJw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48924 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuSLB-000000003o3-40kW;
	Mon, 23 Feb 2026 09:34:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuSL5-0000000AScX-2wuM;
	Mon, 23 Feb 2026 09:34:51 +0000
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
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
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 08/10] net: stmmac: qcom-ethqos: use phy interface
 mode for inband
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuSL5-0000000AScX-2wuM@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:51 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_013518_279454_B3F148AE 
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

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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


