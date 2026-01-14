Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC67AD38FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MarsTdgtHs8teQdoPboCZ01yZL+brlqUeB6u3oqnnnU=; b=M0SEnUv7hBLK3EdwOmlDDd4rjX
	GBCdyw5wL4fqi1wIclQzg4yhYbO0u+LsszisCQl2nQrqAW2ztATnmhGCFQTZa6k99PITgOym2TR5T
	8UnI/F3rp6JyDHpKn15cO0CKXmLzZLhm+lLEOcuZUAlXRgioSHqlhcavZT3xd5vZttCAe9iNdXUuv
	GLiWKYJ3bPEPdGHE30wBRd0BZNGRr2bqsm7Ul/f5y2C6SzD4qqCYC7FW9zHI5xLHcvlLmAkEgryPr
	VlvTFDJkqYKwYnX1qGjkKqX6cHOVUmKmCXFs8HBU80HudeQ+NvTedUmMSMU77Zf6sj/8h9opUmz+T
	rRBOM1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4wU-0000000ABWO-1KAr;
	Wed, 14 Jan 2026 17:46:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4wP-0000000ABOz-1F15;
	Wed, 14 Jan 2026 17:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MarsTdgtHs8teQdoPboCZ01yZL+brlqUeB6u3oqnnnU=; b=Ls/DvdJONU9WbjF10boC8I5ZeB
	R1FQjCz8+2ErEKzTNfBc7arrA4/TPxNTZiuekkgCTwuunC/70eXZdAkkXn3iQ/kRN+GnXwZy3USRx
	k9SUB/SFJ1tQs/fzJ+JcQ/G+7+oYSNignwvv13F8SjWyALLbTz0PB+NsKfjHGmMIjsJLeuquk1LfQ
	1JEITX6ZZ5bb3lMgvEf8ihaVeZcP/2FEpFPIdWyJQVO/IYmY6vhNVepIeiZylCpPxAmCmrTj5DdFO
	kTYnq/oTmG3qpxzFRy9YFJrvfgNbg4OMkI7gAkCztLLvc6GiEP3sZJABh/QzXfJLBOcLxBQDGgXl5
	BBQ46DFQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42456 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vg4wA-000000000UU-1kVu;
	Wed, 14 Jan 2026 17:45:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vg4w7-00000003SGB-2foG;
	Wed, 14 Jan 2026 17:45:39 +0000
In-Reply-To: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 06/14] net: stmmac: qcom-ethqos: convert to dwmac
 generic SerDes support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vg4w7-00000003SGB-2foG@rmk-PC.armlinux.org.uk>
Date: Wed, 14 Jan 2026 17:45:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_094557_362830_CD8B6DCB 
X-CRM114-Status: GOOD (  13.93  )
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

Convert qcom-ethqos to use the dwmac core's generic SerDes support,
which will handle SerDes initialisation, powering, and mode setting.

Note that generic support requires the SerDes to support phy_validate()
in order to probe which PHY interface modes are supported, and
phy_set_mode_ext() to configure the appropriate PHY interface mode
(and thus the speed.)

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 50 ++-----------------
 1 file changed, 3 insertions(+), 47 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 80ea69fc8ee5..a0b893d3fbd4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,8 +103,6 @@ struct qcom_ethqos {
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
 	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *por;
@@ -584,14 +582,6 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
-static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
-{
-	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
-		ethqos->serdes_speed = speed;
-	}
-}
-
 static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 {
 	stmmac_pcs_ctrl_ane(priv, enable, 0);
@@ -609,17 +599,14 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 	case SPEED_2500:
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		ethqos_set_serdes_speed(ethqos, SPEED_2500);
 		ethqos_pcs_set_inband(priv, false);
 		break;
 	case SPEED_1000:
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_100:
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_10:
@@ -627,7 +614,6 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
 					 SGMII_10M_RX_CLK_DVDR),
 			      RGMII_IO_MACRO_CONFIG);
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	}
@@ -648,30 +634,6 @@ static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
 	ethqos_configure(ethqos, speed);
 }
 
-static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
-{
-	struct qcom_ethqos *ethqos = priv;
-	int ret;
-
-	ret = phy_init(ethqos->serdes_phy);
-	if (ret)
-		return ret;
-
-	ret = phy_power_on(ethqos->serdes_phy);
-	if (ret)
-		return ret;
-
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
-}
-
-static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
-{
-	struct qcom_ethqos *ethqos = priv;
-
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
-}
-
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -790,12 +752,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	plat_dat->serdes = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(plat_dat->serdes))
+		return dev_err_probe(dev, PTR_ERR(plat_dat->serdes),
 				     "Failed to get serdes phy\n");
 
-	ethqos->serdes_speed = SPEED_1000;
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
 			       SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
@@ -816,11 +777,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
-		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
-		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
-	}
-
 	/* Enable TSO on queue0 and enable TBS on rest of the queues */
 	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
-- 
2.47.3


