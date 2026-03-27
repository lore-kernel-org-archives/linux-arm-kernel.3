Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DF010BA44F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjX6qC/6one9c7hc6cxMXHjqw6IYm5QgZfFbw5gzH38=; b=0+DwQ/U+bZGgu+OQARKBsKFrU9
	keikGNLkUwXAxl3zSZ8Mzg7zVNKdzFDcvHmdBzPK2vdgBdyJxw2SwJsVb4KGi/AxVY662HxHJ5LOH
	0HCaAJi4vpTUeeX9+DAKWzxWl7CeUNjfRGkjC5WqPBF7R27rRPRPs8u+UQTCLVKxefxtciMXIBjKC
	5uHi45HX9g65f/jk6sqvbkCA5gxw+xi/Sb2OuozrdSWdFDrNIKEnUZQy8eqn6MzHeJLwg499cHkWE
	K2ADfzo9INcr5NjkYUCc0ImpAJR/s3CRPaDdqJrD9vq2sLW847SjcfuS8cFB+pTypgYKlh+/4Djsw
	gGxsCr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nH-00000006zZc-3pmN;
	Fri, 27 Mar 2026 08:43:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nC-00000006zXg-2uIP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=cjX6qC/6one9c7hc6cxMXHjqw6IYm5QgZfFbw5gzH38=; b=hAVUnJnffUMNOSL6lXEuOQsyny
	xyjUu9sp1ZUA05rdQLn4oAkNzlENeMvZdlver7Yf+uKKUw2p3rlbSQ6SQymz0TvmtuwGW04U+n+HM
	0fKuSi/X4cJHVjv7ZCeLYA8YpoRdYzxSva73ucDCI48R8qfinpZTTchPVEMUwNBMFIChfwPtksOXq
	PPm2RvneIjT57jbdAmL7Vao54Y571lcajwuNPZVrQevEqWYTejtj+40Qg38fGQbOq9dLphtfpirCW
	R3GfYwGI7zpJOjZ5XniIuBcTNagel5mjTYu8kIqZYgsBVGxsuWgr62BNWw/B7Mv8aLvxUTAN8L/NR
	/7fm5fAA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62n9-00000009zmb-2Xri
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cjX6qC/6one9c7hc6cxMXHjqw6IYm5QgZfFbw5gzH38=; b=c9/1SZridf8haawn66ijxK668n
	FWh37XdDZ07R/0fn0CbNC5aoNSzA5bMXnsMPgz8Lh69n5f4pl5avgTR3Dj/k77ytph234Nu4PX9jZ
	YiTEPEs0QSgHVzCZJRvfZrgpy3v3bpHUooxAI6zMFS+NEZX80GAwOhwCpEsXJcEJi3tmhtfJtI0Rj
	P/8koMNEw4YulK8YGgvFhnsmiaLyLEmLv4F59z0Kiz9tAPW97fnm1nBN6YWx753MShQHDYvv5S+ZS
	geH8mh/LuiZGgq0kYtMNCTNiOHrKm3BdzZfHpHn39j3cHfI5q4QAJZcd3z5JOb/iM6sFDaO/quONH
	ZeyECaaA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57566 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62n5-000000005os-1FcS;
	Fri, 27 Mar 2026 08:43:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62n4-0000000E3C3-251S;
	Fri, 27 Mar 2026 08:43:38 +0000
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 03/15] net: stmmac: qcom-ethqos: eliminate
 configure_func
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62n4-0000000E3C3-251S@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:43:38 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084343_995051_E13CCEED 
X-CRM114-Status: GOOD (  15.49  )
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
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 35 ++++++++-----------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index b9cfcf32cebc..f7e3a2b8803f 100644
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
@@ -687,7 +683,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
-		 * ethqos_fix_mac_speed() is invoked.
+		 * ethqos' fix_mac_speed() method is invoked.
 		 */
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
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


