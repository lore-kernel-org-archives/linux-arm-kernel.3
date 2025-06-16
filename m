Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA025C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpJ8ObVv/RACQZyToryrE4J8IiEvS1R3HdcT2AEL8uE=; b=xQw+xEfH8P2JnSpQZMBp/1Ku2q
	J/2OXEM3N+G9nrs7klX/hfY6xnGRbyRnB6qcwFSvD6J6DQx2+CLXyd7bCUiYzM6QAtC7eDehe3SD+
	ZnVI711SlluAlk9aAvbFZHF4fHqPf7jH/GBNWI6oW1Ds7UT0SJoFjJk8Ysnfs4LmI0ZJKl+crnv96
	JqOVD1DPcaMG1i3igtWno4z+Mu2nh1qgwPxaiwSi4zx135soWFUxn7hdLycu+q/7PQJYUiyq34er/
	9k6y4xZdugUh7XL2XHkpClLL1pB5TkF3IxsMKOkXUVF7qbijFCLYfiZJ5csZ9kB6gWYvLB9RYS+lq
	KkdUy5vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7uh-00000004BTB-3fGo;
	Mon, 16 Jun 2025 11:22:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6tO-0000000431l-22m5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MpJ8ObVv/RACQZyToryrE4J8IiEvS1R3HdcT2AEL8uE=; b=fllwzxba+JH15SSlAVUaCvg/CT
	kATe/ukLMkMJAgEy7tcakxpuS7/03SM6ZLAmOeoCq+Fbbp9shFxhRnHYpYtI7wOF3dlgbZ+wpgXZr
	cn47N43pHszFFl6d+eqDQyOCgpPf+8m0JIldFsWQ/474NjQ2dmytrvqsmWBOj6TjHkMNXwjrYvmw9
	KiivsZvmhuhSu21BABxoERi3Oe6ttgAiHBJDdyIvzzR/VVQXJwdJbehGm/rV5dmdKWh4q+ad+BG33
	okm1mqmOngsZNZjkfiM1n4OSTtlKdrWnvCChJFZZQ/c1Nk+ffJZ1+BjP1s35Iq3GqP+T8pgXWWXtp
	EBoZfIIA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52686 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uR6tI-0003ah-2w;
	Mon, 16 Jun 2025 11:16:36 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uR6se-004Ktz-Dx; Mon, 16 Jun 2025 11:15:56 +0100
In-Reply-To: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
References: <aE_u8mCkUXEWTzJe@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 2/3] net: stmmac: rk: use device rather than platform
 device in rk_priv_data
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uR6se-004Ktz-Dx@rmk-PC.armlinux.org.uk>
Date: Mon, 16 Jun 2025 11:15:56 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_031642_530935_DE65861F 
X-CRM114-Status: GOOD (  13.69  )
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

All the code in dwmac-rk uses &bsp_priv->pdev->dev, nothing uses
bsp_priv->pdev directly. Store the struct device rather than the
struct platform_device in struct rk_priv_data, and simplifying the
code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 5865a17d5fe8..7ee101a6cfcf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -67,7 +67,7 @@ enum rk_clocks_index {
 };
 
 struct rk_priv_data {
-	struct platform_device *pdev;
+	struct device *dev;
 	phy_interface_t phy_iface;
 	int id;
 	struct regulator *regulator;
@@ -248,7 +248,7 @@ static int px30_set_speed(struct rk_priv_data *bsp_priv,
 			  phy_interface_t interface, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
-	struct device *dev = &bsp_priv->pdev->dev;
+	struct device *dev = bsp_priv->dev;
 	unsigned int con1;
 	long rate;
 
@@ -1380,8 +1380,8 @@ static const struct rk_gmac_ops rv1126_ops = {
 static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 {
 	struct rk_priv_data *bsp_priv = plat->bsp_priv;
-	struct device *dev = &bsp_priv->pdev->dev;
 	int phy_iface = bsp_priv->phy_iface;
+	struct device *dev = bsp_priv->dev;
 	int i, j, ret;
 
 	bsp_priv->clk_enabled = false;
@@ -1473,8 +1473,8 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
 {
 	struct regulator *ldo = bsp_priv->regulator;
+	struct device *dev = bsp_priv->dev;
 	int ret;
-	struct device *dev = &bsp_priv->pdev->dev;
 
 	if (enable) {
 		ret = regulator_enable(ldo);
@@ -1598,7 +1598,7 @@ static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
 	dev_info(dev, "integrated PHY? (%s).\n",
 		 bsp_priv->integrated_phy ? "yes" : "no");
 
-	bsp_priv->pdev = pdev;
+	bsp_priv->dev = dev;
 
 	return bsp_priv;
 }
@@ -1618,7 +1618,7 @@ static int rk_gmac_check_ops(struct rk_priv_data *bsp_priv)
 			return -EINVAL;
 		break;
 	default:
-		dev_err(&bsp_priv->pdev->dev,
+		dev_err(bsp_priv->dev,
 			"unsupported interface %d", bsp_priv->phy_iface);
 	}
 	return 0;
@@ -1626,8 +1626,8 @@ static int rk_gmac_check_ops(struct rk_priv_data *bsp_priv)
 
 static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
 {
+	struct device *dev = bsp_priv->dev;
 	int ret;
-	struct device *dev = &bsp_priv->pdev->dev;
 
 	ret = rk_gmac_check_ops(bsp_priv);
 	if (ret)
@@ -1683,7 +1683,7 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 	if (gmac->integrated_phy && gmac->ops->integrated_phy_powerdown)
 		gmac->ops->integrated_phy_powerdown(gmac);
 
-	pm_runtime_put_sync(&gmac->pdev->dev);
+	pm_runtime_put_sync(gmac->dev);
 
 	phy_power_on(gmac, false);
 	gmac_clk_enable(gmac, false);
-- 
2.30.2


