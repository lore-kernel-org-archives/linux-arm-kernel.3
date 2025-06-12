Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63777C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EYKiBuFao5mfyYNJMFE6ZokBPPPu5Li/J3RPkWqd5aU=; b=BVobRQ2rOaaR3vY8Jl+YyTlQW0
	P8pBQvFuA8j7+ghl6mwjtbrQ2DYOHWbwUNcnZqzZKmJbVTbiWU7yNMgmnTow6aztJtn7DKQX+8K0k
	cLdW/1oTfavm1OGym6QtZ/6mXBhKJ1F+L/BHeatWRfFRXd3eetH3RiU9fkURUdXWpIuzIrUl3zA5Z
	t0210Dioq8VnfULgYSjieAPdWKxhfO16o43LO2Yg7MN4opHMo0KyrGYY3GVzYBjkldumkrn8kc5Jn
	Bi66HFlpCtrfCOwYDm73DBtBMVKTN8baeLnoz+rccJlxn0zG3A7gDlCfdQy5kPZsZomu/BCqW77pD
	tDUjZFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnsU-0000000EMPo-3WJz;
	Thu, 12 Jun 2025 19:46:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkcA-0000000DvRj-2OCL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 16:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EYKiBuFao5mfyYNJMFE6ZokBPPPu5Li/J3RPkWqd5aU=; b=iK7FDVDSQsII92H9niZNTahz5D
	J3sSuDfZ2KBsjWkcZ6QXZOI5vP7qRvkn7mJfYC8lEbAPLBwmwzJ2rHHpDN6P7PFHFurtriSyKq+fS
	vFkm35ZljRyaA8MPULLFxn2X6w/RdxS6dFO919eVisvOiJECFyqPcUC71TLaUpsT3vWeKlsU3cHfn
	UrordgKKumyy2ScUghiiQbKfGMmWUzHjNh8K75BMAjSIwA7bI1RXHlNDv+UoihLh8SmlQfd8whkJx
	u5gxzpU/fMqHnw40iFF5xxzRv7kSt4HYfzgTTz+hfjskPGv7GAcD/PE44U1ngkFUlZn2GgMGNsh/z
	1Vpb4tCg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42838 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uPkc2-00087m-2K;
	Thu, 12 Jun 2025 17:17:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uPkbO-004EyA-EU; Thu, 12 Jun 2025 17:16:30 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next] net: stmmac: qcom-ethqos: add
 ethqos_pcs_set_inband()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 17:16:30 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_091718_608512_F3638712 
X-CRM114-Status: UNSURE (   9.10  )
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

Add ethqos_pcs_set_inband() to improve readability, and to allow future
changes when phylink PCS support is properly merged.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e30bdf72331a..2e398574c7a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -622,6 +622,11 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 	}
 }
 
+static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
+{
+	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
+}
+
 /* On interface toggle MAC registers gets reset.
  * Configure MAC block for SGMII on ethernet phy link up
  */
@@ -640,7 +645,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
 		ethqos_set_serdes_speed(ethqos, SPEED_2500);
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
+		ethqos_pcs_set_inband(priv, false);
 		break;
 	case SPEED_1000:
 		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
@@ -648,12 +653,12 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
+		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_100:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
+		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_10:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL;
@@ -663,7 +668,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 					 SGMII_10M_RX_CLK_DVDR),
 			      RGMII_IO_MACRO_CONFIG);
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
-		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
+		ethqos_pcs_set_inband(priv, true);
 		break;
 	}
 
-- 
2.30.2


