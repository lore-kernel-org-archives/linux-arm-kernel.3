Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847B8CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Om8QogJvG48OeHmfYzHSM2+A2/jNKspDMEUl+aS+ED4=; b=WnBQvH/lcOW4Jq5bTGFMA0A/mR
	Vcz1x34QuTQBaGchd1GG1L56oZ/C0pxOuV60NjN6CXfob2peXD6AxQJjvr2OHDdtD6LQ9tY5dCcAP
	4evTj6ZWXkPg8INHtDx303UkSnwvjhFFt2BZUa5BQOGG79hXq2gqC7rcGp52bkbIdsfN6E8Y9rzFK
	2tRWy5dvOj6nBvkActcJhLG/4xZgnRSw79Uz2ch7TNCP1qUXwbAJd2SyOHKTCWAk/fA+dUU6nyeYL
	5Z9BmFxHfxpD9G/TpaPFvhmQpTRNkGl6ApKZ/HiRTY6mFETIcaJV5iXWBJFsu0/xRiSvRJNx3h5ip
	IS9yxNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPlq-00000003xkM-0SUI;
	Thu, 30 Oct 2025 10:20:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPln-00000003xjm-2z78
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Om8QogJvG48OeHmfYzHSM2+A2/jNKspDMEUl+aS+ED4=; b=HUYE+L+lroDttVxCJDA1cv5R9Z
	hBxZq/tXa2zO7c0xlkBkj7hu9fAtMC8+pnobfxc/qw+F0eax+pdXGDWZ3amnLHWZrHOJW9CSKEwjP
	baSkOW8c2QcDJYA6ejxNPHebRAnH074DnOi0YQjAsyTMEVu6FHwl/hHMP63Bv6+5MGs2Mjktu4jL1
	l+Js+F96qZKqTYbZo0frPvDWuO7Fj6R8dsGOLcKP+yuntpffsYjJANa6R2Qc1t0ejQ+qkxih5HXNv
	fXgfgdwbbwqkdQqbVheyKS6vEICr+bHRLVPl6YaopllL/tdBiJpXISqtZbZF/AcUY5xg9yHDMW1++
	nEN+OHfA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33222 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vEPlh-000000005Vd-14RR;
	Thu, 30 Oct 2025 10:20:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vEPlg-0000000CFHY-282A;
	Thu, 30 Oct 2025 10:20:32 +0000
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
Subject: [PATCH net-next v2] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vEPlg-0000000CFHY-282A@rmk-PC.armlinux.org.uk>
Date: Thu, 30 Oct 2025 10:20:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032039_763449_6B4F3699 
X-CRM114-Status: GOOD (  13.37  )
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

When operating in "SGMII" mode (Cisco SGMII or 2500BASE-X), qcom-ethqos
modifies the MAC control register in its ethqos_configure_sgmii()
function, which is only called from one path:

stmmac_mac_link_up()
+- reads MAC_CTRL_REG
+- masks out priv->hw->link.speed_mask
+- sets bits according to speed (2500, 1000, 100, 10) from priv->hw.link.speed*
+- ethqos_fix_mac_speed()
|  +- qcom_ethqos_set_sgmii_loopback(false)
|  +- ethqos_update_link_clk(speed)
|  `- ethqos_configure(speed)
|     `- ethqos_configure_sgmii(speed)
|        +- reads MAC_CTRL_REG,
|        +- configures PS/FES bits according to speed
|        `- writes MAC_CTRL_REG as the last operation
+- sets duplex bit(s)
+- stmmac_mac_flow_ctrl()
+- writes MAC_CTRL_REG if changed from original read
...

As can be seen, the modification of the control register that
stmmac_mac_link_up() overwrites the changes that ethqos_fix_mac_speed()
does to the register. This makes ethqos_configure_sgmii()'s
modification questionable at best.

Analysing the values written, GMAC4 sets the speed bits as:
speed_mask = GMAC_CONFIG_FES | GMAC_CONFIG_PS
speed2500 = GMAC_CONFIG_FES                     B14=1 B15=0
speed1000 = 0                                   B14=0 B15=0
speed100 = GMAC_CONFIG_FES | GMAC_CONFIG_PS     B14=1 B15=1
speed10 = GMAC_CONFIG_PS                        B14=0 B15=1

Whereas ethqos_configure_sgmii():
2500: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
1000: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
100: sets ETHQOS_MAC_CTRL_PORT_SEL |            B14=1 B15=1
          ETHQOS_MAC_CTRL_SPEED_MODE
10: sets ETHQOS_MAC_CTRL_PORT_SEL               B14=0 B15=1
    clears ETHQOS_MAC_CTRL_SPEED_MODE

Thus, they appear to be doing very similar, with the exception of the
FES bit (bit 14) for 1G and 2.5G speeds.

Given that stmmac_mac_link_up() will write the MAC_CTRL_REG after
ethqos_configure_sgmii(), remove the unnecessary update in the
glue driver's ethqos_configure_sgmii() method, simplifying the code.

Konrad states:

Without any additional knowledge, the register description says:

2500: B14=1 B15=0
1000: B14=0 B15=0
 100: B14=1 B15=1
  10: B14=0 B15=1

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v2: added tested-by/reviewed-by, added additional comments from Konrad
w.r.t. the register description to commit description (which is the
reason for resending.)

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d1e48b524d7a..1a616a71c36a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -76,10 +76,6 @@
 #define RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL	BIT(6)
 #define RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN	BIT(5)
 
-/* MAC_CTRL_REG bits */
-#define ETHQOS_MAC_CTRL_SPEED_MODE		BIT(14)
-#define ETHQOS_MAC_CTRL_PORT_SEL		BIT(15)
-
 /* EMAC_WRAPPER_SGMII_PHY_CNTRL1 bits */
 #define SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN	BIT(3)
 
@@ -632,13 +628,9 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 {
 	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int val;
-
-	val = readl(ethqos->mac_base + MAC_CTRL_REG);
 
 	switch (speed) {
 	case SPEED_2500:
-		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
@@ -646,7 +638,6 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 		ethqos_pcs_set_inband(priv, false);
 		break;
 	case SPEED_1000:
-		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
@@ -654,13 +645,10 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_100:
-		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_10:
-		val |= ETHQOS_MAC_CTRL_PORT_SEL;
-		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
 		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
 			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
 					 SGMII_10M_RX_CLK_DVDR),
@@ -670,9 +658,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 		break;
 	}
 
-	writel(val, ethqos->mac_base + MAC_CTRL_REG);
-
-	return val;
+	return 0;
 }
 
 static int ethqos_configure(struct qcom_ethqos *ethqos, int speed)
-- 
2.47.3


