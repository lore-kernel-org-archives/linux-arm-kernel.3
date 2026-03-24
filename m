Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDF4F54AAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8kr4pctSw0pO/Mbf8GhPGw5pUepq7emeumsMapqBGk=; b=rMmRFYpatSZpFhXSLJPQhnWKwb
	vbdc7wkI59HzYNAB4D+B/moapqhLB+NDaINBy7HO5p7RUm4spYrVx+AYAoDUlSBLOeAOQwAO44B74
	LlT3YeFp3jnKDsvwxoW+7jCXW6V0qgJ4Ej4GQiJiTMSZLATcwX9B42w/4knkMSJCW8Gd/kKbZofcS
	hqSPRXssrILZpZ4gOAfZ7NOCS/1NBvG6zDXfQKd4dwqyUnQwowAz084N5G8Y686PTSmAod9nLhzl7
	6ALCtRZM1kGXgWDEJxZ5UfSZ+7FWImHadiIkLzi1ypwhruSb+vsFYvUFZ/SgtZsYXuapfzMFrtQJr
	2WXTEjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Y5-00000001V4w-0gI1;
	Tue, 24 Mar 2026 13:11:57 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Y2-00000001V33-2GCs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/8kr4pctSw0pO/Mbf8GhPGw5pUepq7emeumsMapqBGk=; b=MHFuDJU3V1dKjT3u3Etg0HAUqr
	/FLqaA35G9zo57HqK7FDaH5tdN3/Otofp9qdRhnnjlCpJeR+S79QL99VB4Nd7XG+HAcX5O44UokJw
	rAaW1KZCOA+1G8oiWVVD3AzpFb888Vg4FiK4GG7MteFF8Dw2UKGfkiDuaPjd2ZqJ5HmF2yBo0mLJl
	BBPKatIjlegCKYLu9dcOPRChEqUGJwysdPjzuCpH7zTP09EjVKwJ6EGJh4SaFdxNq5llV/uDKPKiN
	qu3uuCk5UsNfECoywwZu/C7p04jHu77nvkGDAv49bnrQmyyrmWkPObh1E5dcv05ZVB2XtN0esWldM
	Ns7w1eKQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47346 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Xt-00000000230-2NHV;
	Tue, 24 Mar 2026 13:11:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51Xs-0000000DwVV-2bnh;
	Tue, 24 Mar 2026 13:11:44 +0000
In-Reply-To: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 03/15] net: stmmac: qcom-ethqos: eliminate
 configure_func
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51Xs-0000000DwVV-2bnh@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:11:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_061154_577444_043E3132 
X-CRM114-Status: GOOD (  14.33  )
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

Since ethqos_fix_mac_speed() is called via a function pointer, and only
indirects via the configure_func function pointer, eliminate this
unnecessary indirection.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 33 ++++++++-----------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index b9cfcf32cebc..84f713ec8c28 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,9 +100,6 @@ struct ethqos_emac_driver_data {
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
-	void (*configure_func)(struct qcom_ethqos *ethqos,
-			       phy_interface_t interface, int speed);
-
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
@@ -521,13 +518,17 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
-static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos,
-				   phy_interface_t interface, int speed)
+static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
+				       phy_interface_t interface, int speed,
+				       unsigned int mode)
 {
-	struct device *dev = &ethqos->pdev->dev;
+	struct qcom_ethqos *ethqos = bsp_priv;
+	struct device *dev;
 	unsigned int i;
 	u32 val;
 
+	dev = &ethqos->pdev->dev;
+
 	/* Reset to POR values and enable clk */
 	for (i = 0; i < ethqos->num_rgmii_por; i++)
 		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
@@ -601,9 +602,12 @@ static void ethqos_pcs_set_inband(struct qcom_ethqos *ethqos, bool enable)
 /* On interface toggle MAC registers gets reset.
  * Configure MAC block for SGMII on ethernet phy link up
  */
-static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
-				   phy_interface_t interface, int speed)
+static void ethqos_fix_mac_speed_sgmii(void *bsp_priv,
+				       phy_interface_t interface, int speed,
+				       unsigned int mode)
 {
+	struct qcom_ethqos *ethqos = bsp_priv;
+
 	switch (speed) {
 	case SPEED_2500:
 	case SPEED_1000:
@@ -623,14 +627,6 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
-static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
-				 int speed, unsigned int mode)
-{
-	struct qcom_ethqos *ethqos = priv;
-
-	ethqos->configure_func(ethqos, interface, speed);
-}
-
 static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -753,11 +749,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		ethqos->configure_func = ethqos_configure_rgmii;
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
 	case PHY_INTERFACE_MODE_SGMII:
-		ethqos->configure_func = ethqos_configure_sgmii;
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
 		plat_dat->mac_finish = ethqos_mac_finish_serdes;
 		break;
 	default:
@@ -805,7 +801,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
-	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-- 
2.47.3


