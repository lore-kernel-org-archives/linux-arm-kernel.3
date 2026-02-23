Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE038E98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1qemJ9T19BWX8RspLLamHrXeBfB/46GJPlusAb73Gw=; b=Hd4UXyQjKXdN1zGQOg18gDm+1q
	qB/LFbIGZP8JCZxqPHVgFNe2IGnTdN7NvvYUiCiTs2ZsO2iLrbAIchLsrqMUG2SbgmuYCOozpIkFq
	+FEzcBKOCIKnCnPuCqS+5KLdeDA9DpMSXVys392dDdXU0ebO4Zyq3jqK8StmmGDfOp8ko7HobeMNW
	VvlOW3cbZAXq8Tlm1fNUQCWoUMGc0MOUfzpFqym2Dr5uLfQ/EQMhr6TxY3e7/gmjJG1a80fEtjM/i
	KyzkFh7bWjOwetGA0iQVW9BBsa3oLRcqDBa71Q9EBSpuqTSwtHXtFZ95RCL3JcmuIn9NmdH1Dj0A1
	8hTDrgyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSZp-0000000HZlx-21mq;
	Mon, 23 Feb 2026 09:50:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSZn-0000000HZl5-2RmM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h1qemJ9T19BWX8RspLLamHrXeBfB/46GJPlusAb73Gw=; b=ddee/CP6H2pArVn5J7X3sQ1ibc
	av2S6hElHtr7a03FoNfuDzly0TTL8FhQCTdg4i9d4ONJ4hd/FcbRA1+IAyFXWnLTd3pp1u9ra0SNi
	LfaZpMD7JE5aqbnf3MWBFfJOXAd59eUlNly8mDt9JiY7seqXeRyBu4p6kLfKg7YCV+w8gEQinWyAM
	J5p+k+1BVe0u6Wk5X8fYSuRvcQEZeKIsa3ZzI7sQcEhNcWGiOAsavHm0jrHsrCXy1v3RE7Ne068gq
	fe4TKnioGvAYyBKjzCwyeLq/PPSXhaItA/RJSFniE2wREn5WUNbT9LLwXJJUDS7L3RGVB7UH05TAI
	uKeLFmUA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47460 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuSLM-000000003oU-2mCW;
	Mon, 23 Feb 2026 09:35:08 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuSLF-0000000ASci-42kh;
	Mon, 23 Feb 2026 09:35:01 +0000
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
Subject: [PATCH net-next 10/10] net: stmmac: qcom-ethqos: convert to
 set_clk_tx_rate() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuSLF-0000000ASci-42kh@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:35:01 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_015003_618572_B8CE0B58 
X-CRM114-Status: GOOD (  13.65  )
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

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 153f6abc77cd..ad5b5d950fff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,7 +103,6 @@ struct qcom_ethqos {
 	void (*configure_func)(struct qcom_ethqos *ethqos,
 			       phy_interface_t interface, int speed);
 
-	unsigned int link_clk_rate;
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	int serdes_speed;
@@ -175,19 +174,20 @@ static void rgmii_dump(void *priv)
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
-	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+	if (rate < 0)
+		return rate;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	return clk_set_rate(ethqos->link_clk, rate * 2);
 }
 
 static void
@@ -643,7 +643,6 @@ static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	ethqos_update_link_clk(ethqos, speed);
 	ethqos_configure(ethqos, interface, speed);
 }
 
@@ -821,12 +820,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
-	ethqos_update_link_clk(ethqos, SPEED_1000);
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
+			       SPEED_1000);
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
+	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
-- 
2.47.3


