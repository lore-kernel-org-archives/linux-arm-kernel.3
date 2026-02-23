Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55622E98E0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xX88IRJ5ZZJcwEtQ+Finc0oqOM/Lw45R/MHMHRGIA+Y=; b=fswITbUCxSuuH4H1MwZzJp3spk
	r1oX16pAUoAOLWKcIXeOyWvEwTJPJbs7+H+kMJ/mfStgdYICWR1RGroZOWf6XK0EAX0R6Nb0tYDTt
	zhLiKdrEOHExLULn0v9K26W3sNJzc9lM0s3Yw4QKfMtUkuc8SzsJlGMJwPoUTbVGWtkaJihyfQyn2
	NP7PCFmJrR5df3lOpQEE6KH3w1oh2yn41LzhPsbu0wDWx8bxENN0nyKObLfPR5YgRH1wJm4lO1m6a
	XPFmq2eRTCkeFmwqR3MxRRaqcCnEwmQM76Xcletv+5Ruxx6a8Fq9LdI9iVJsKeLBXlYF/zZWKvUg0
	+Zeu0K+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSL4-0000000HXua-10aO;
	Mon, 23 Feb 2026 09:34:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSL0-0000000HXs0-3mKb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xX88IRJ5ZZJcwEtQ+Finc0oqOM/Lw45R/MHMHRGIA+Y=; b=iuyCy5/eATQt1ibrp4ccTrE6F9
	o3rfnXojxkLjyo16eXhBZ4Fump3b40lpmRILAolBztxBE6W7NHBXlekinWSKEAW1v4nzO7HPdf9Kq
	gJ9j/nqoL8NDOtVTU6Sj0tevC0TXw7y5uOFfpbH6KJPnFpGfJCmb+6TFBf3cxRKTgTe5Uq7BC2Z5g
	3FjxLu6WO8V46H/E13IZ5GabPQxM2TYLDE85ZiEloI6gKXEhTs1QFGLpwJNeVXKn3r5nbICePtMsv
	p6nnXuNE9gvEROxLOmuMpb6dqtwxhvJQ+WDIs7MOChZElTYEUhj77fZau8aF0ohk0oscB9ebjCSKO
	LjNYUpJQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52934 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuSKo-000000003mv-205i;
	Mon, 23 Feb 2026 09:34:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuSKl-0000000ASc1-18ka;
	Mon, 23 Feb 2026 09:34:31 +0000
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
Subject: [PATCH net-next 04/10] net: stmmac: qcom-ethqos: move
 qcom_ethqos_set_sgmii_loopback() up
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuSKl-0000000ASc1-18ka@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 09:34:31 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_013447_025181_12F0DAD0 
X-CRM114-Status: GOOD (  13.12  )
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

ethqos_set_func_clk_en() configures both SGMII loopback and the RGMII
functional clock setting. qcom_ethqos_set_sgmii_loopback() is only
called from within ethqos_set_func_clk_en(), and checks for
PHY_INTERFACE_MODE_2500BASEX.

Move qcom_ethqos_set_sgmii_loopback() to the callers of
ethqos_set_func_clk_en() except for ethqos_configure_rgmii() where we
know that ethqos->phy_mode will not be PHY_INTERFACE_MODE_2500BASEX.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 168f0fed68c0..964eca46a653 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -204,7 +204,6 @@ qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 
 static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 {
-	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
 
@@ -532,6 +531,7 @@ static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	for (i = 0; i < ethqos->num_rgmii_por; i++)
 		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
 			     ethqos->rgmii_por[i].offset);
+
 	ethqos_set_func_clk_en(ethqos);
 
 	/* Initialize the DLL first */
@@ -701,6 +701,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 * cycled. The actual configuration will be adjusted once
 		 * ethqos_fix_mac_speed() is invoked.
 		 */
+		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
 		clk_disable_unprepare(ethqos->link_clk);
@@ -809,6 +810,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
+
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
-- 
2.47.3


