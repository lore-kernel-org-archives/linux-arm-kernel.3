Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35A1CF45C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEdZ8ipMDP5kbCjgKjvgz5LuDWo/Bg325DpaKMx92Nk=; b=nXF3YHLTAa0U3etza1O/mw/5G5
	xbR3E5yQD67Y4fEMaGphB+5T2YA+w07ez5HuMefW/AnhAragLSbpKbr9Gd3oxDuo7h+1rv+kYE/WZ
	KAx9V9XICSXcdaml8B7HBZWAD+nQvJzArvAQO/KTgqkG6j9i6P82ccdHBMx62U3cGUHIWYe489tu7
	19dYm9PkFopS+U0FWMp6vhrZUUG4u13PM0FH7zPIF1sPxs2PdDbuIlwd8wsoru1RwXW+fVHI5NxO9
	OfnCrtYQbhXHJsqVO8EknPLz0D/Efim7FfTOFMSfRD4VZlVP6wBqD+upsyFxMVTR36XQQFCF/Vnv+
	NyPkRwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMOC-00000005utn-0gST;
	Mon, 12 Jan 2026 18:11:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMO8-00000005usZ-0nZb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 18:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kEdZ8ipMDP5kbCjgKjvgz5LuDWo/Bg325DpaKMx92Nk=; b=I6yAc8rs0wLFYhmxCiiv8ebj15
	XkPe0akP26icvs7tXlPei5/I8SdTjN4ZEJwWYRXnpEzqQlPmTiOojU4KIQ7x3RRJ5QnsJdIn7ZHfD
	Dc3+izULWXwlqoA5SR0nb2DotxtVCiyWRrRA/hoXuyRISUWZbCOTzkr0gjFhirV7VGhOZFTwlrEkC
	ixGnQ61MI8Vls+vU7emdW1hBKTFi95dxWIu1IhnF+wUSYWDff7h+DF/LlbMjtNDLeaR+SkEd49PmS
	oxNDg1vKIS+cfiLdvVo7FEzayPUqttnE0FBtWYQb340u2vPeTFQMBtt72qzyL56C5zJUnQOCwsovg
	dfsgZDzQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58776 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vfMO2-000000006bp-2OWH;
	Mon, 12 Jan 2026 18:11:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vfMO1-00000002kJF-33UK;
	Mon, 12 Jan 2026 18:11:29 +0000
In-Reply-To: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
References: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
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
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 2/2] net: stmmac: qcom-ethqos: convert to
 set_clk_tx_rate() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
Date: Mon, 12 Jan 2026 18:11:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_101136_228962_506CCA10 
X-CRM114-Status: GOOD (  12.55  )
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

Set the RGMII link clock using the set_clk_tx_rate() method rather than
coding it into the .fix_mac_speed() method. This simplifies ethqos's
ethqos_fix_mac_speed().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 869f924f3cde..d6df3ca757be 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -102,7 +102,6 @@ struct qcom_ethqos {
 	void __iomem *rgmii_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	int serdes_speed;
@@ -174,19 +173,18 @@ static void rgmii_dump(void *priv)
 		rgmii_readl(ethqos, EMAC_SYSTEM_LOW_POWER_DEBUG));
 }
 
-static void
-ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
+static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+				  phy_interface_t interface, int speed)
 {
+	struct qcom_ethqos *ethqos = bsp_priv;
 	long rate;
 
-	if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
-		return;
+	if (!phy_interface_mode_is_rgmii(interface))
+		return 0;
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
-
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+		clk_set_rate(ethqos->link_clk, rate * 2);
 }
 
 static void
@@ -645,7 +643,6 @@ static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
 	struct qcom_ethqos *ethqos = priv;
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
-	ethqos_update_link_clk(ethqos, speed);
 	ethqos_configure(ethqos, speed);
 }
 
@@ -797,10 +794,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
-	ethqos_update_link_clk(ethqos, SPEED_1000);
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
+			       SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
+	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
-- 
2.47.3


