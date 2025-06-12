Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934BAC71149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQLvAMlBoc+O8/PXh9aQdp3tD2l4mBUqyz4wkh6SGH4=; b=KaPlmiuD11sAzKuJeRdl7HgSob
	yTnN7dxlCEPkvachhmMTZ1EnzfQQBPtP8F4vJzhSca8gmkq0aoDf640dKe/M7UJXLD8mO8odYv3Z5
	fFkjMTT1y4vXidaZnqUbm9H9PTBGpsrNch+gMdPytzMoNtY88nUi3fx5H8BJSttekeFVp3rZc82n/
	WuADBuHW/ZJLz0dDZOICubH1La/0xI2T2axrogxdu7+xttfgHGe9D9LU3rFD7gpKFcyG1Ox4PbL7q
	WW49LVg/owncCWA8gQ2E7W+WKZkzLBYRsjH3vC7K+CHT8BR1oSRX3v0sF4KXxNjya9V+IvpaUPqgt
	iMVPjpUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnrO-0000000EKKs-2Sdg;
	Thu, 12 Jun 2025 19:45:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPk3m-0000000DpD4-1tvf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yQLvAMlBoc+O8/PXh9aQdp3tD2l4mBUqyz4wkh6SGH4=; b=1TG4tLv2IRXe17/uJVDLMvSBbh
	en7Q/M3iwCvQcOF4N7M8DsrK7DfvopZjphMr0jZDMc63c3o2hGpIX/hmcDpB2xRSHsgHGmK6mvZAf
	qHtiCV0XSD8IwE1m1jNMuOZs5h5nF7Nm/ypkxBNY1igcPJNeuaeXb20zQtkLq+KkAaozEwzl08vRk
	DpWHWlxLBl4Tu90/+FuDbjvr7f1hP9CsF+SkQ6ir0hPKaixs0Gekuk+mRz/tbSkiDFW/jYiBpkqaG
	latDpVhE6AY/vDNhbcaBnp4SPZOTZYl5mbQPEzoyDLPf1XN5ZUIj7lRxikR7w443ysaKubpkqB0fw
	n9qcbmOQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58298 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uPk3i-00084L-1K;
	Thu, 12 Jun 2025 16:41:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uPk34-004CFZ-3y; Thu, 12 Jun 2025 16:41:02 +0100
In-Reply-To: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 5/9] net: stmmac: rk: combine clk_mac_speed rate
 setting functions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uPk34-004CFZ-3y@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:41:02 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084146_490556_EC2F08CC 
X-CRM114-Status: GOOD (  12.68  )
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

rk3568_set_gmac_speed() and rv1126_set_clk_mac_speed() are now
identical. Combine these so we have a single copy of this code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 65 +++++++------------
 1 file changed, 23 insertions(+), 42 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index c7b64f0a2931..eeef11b60566 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -153,6 +153,25 @@ static int rk_set_reg_speed_rmii(struct rk_priv_data *bsp_priv,
 				speed);
 }
 
+static void rk_set_clk_mac_speed(struct rk_priv_data *bsp_priv, int speed)
+{
+	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
+	struct device *dev = &bsp_priv->pdev->dev;
+	long rate;
+	int ret;
+
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
+		dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
+		return;
+	}
+
+	ret = clk_set_rate(clk_mac_speed, rate);
+	if (ret)
+		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
+			__func__, rate, ret);
+}
+
 #define HIWORD_UPDATE(val, mask, shift) \
 		((val) << (shift) | (mask) << ((shift) + 16))
 
@@ -1113,30 +1132,11 @@ static void rk3568_set_to_rmii(struct rk_priv_data *bsp_priv)
 	regmap_write(bsp_priv->grf, con1, RK3568_GMAC_PHY_INTF_SEL_RMII);
 }
 
-static void rk3568_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
-{
-	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
-	struct device *dev = &bsp_priv->pdev->dev;
-	long rate;
-	int ret;
-
-	rate = rgmii_clock(speed);
-	if (rate < 0) {
-		dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
-		return;
-	}
-
-	ret = clk_set_rate(clk_mac_speed, rate);
-	if (ret)
-		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
-			__func__, rate, ret);
-}
-
 static const struct rk_gmac_ops rk3568_ops = {
 	.set_to_rgmii = rk3568_set_to_rgmii,
 	.set_to_rmii = rk3568_set_to_rmii,
-	.set_rgmii_speed = rk3568_set_gmac_speed,
-	.set_rmii_speed = rk3568_set_gmac_speed,
+	.set_rgmii_speed = rk_set_clk_mac_speed,
+	.set_rmii_speed = rk_set_clk_mac_speed,
 	.regs_valid = true,
 	.regs = {
 		0xfe2a0000, /* gmac0 */
@@ -1496,30 +1496,11 @@ static void rv1126_set_to_rmii(struct rk_priv_data *bsp_priv)
 		     RV1126_GMAC_PHY_INTF_SEL_RMII);
 }
 
-static void rv1126_set_clk_mac_speed(struct rk_priv_data *bsp_priv, int speed)
-{
-	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
-	struct device *dev = &bsp_priv->pdev->dev;
-	long rate;
-	int ret;
-
-	rate = rgmii_clock(speed);
-	if (rate < 0) {
-		dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
-		return;
-	}
-
-	ret = clk_set_rate(clk_mac_speed, rate);
-	if (ret)
-		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
-			__func__, rate, ret);
-}
-
 static const struct rk_gmac_ops rv1126_ops = {
 	.set_to_rgmii = rv1126_set_to_rgmii,
 	.set_to_rmii = rv1126_set_to_rmii,
-	.set_rgmii_speed = rv1126_set_clk_mac_speed,
-	.set_rmii_speed = rv1126_set_clk_mac_speed,
+	.set_rgmii_speed = rk_set_clk_mac_speed,
+	.set_rmii_speed = rk_set_clk_mac_speed,
 };
 
 static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
-- 
2.30.2


