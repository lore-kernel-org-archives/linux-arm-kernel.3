Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD6BE95375
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cmBXQFWwMJpNA6HYvHV+pn0Z7Isl9C8hhe8elfOnPD4=; b=EQ2leWEpedEYeoEO+y3M1UZ6yp
	ARSKoij6LN99b0RpCMQN3qLtvG+6UvZVDhibcijJbFyGN0cGCWxsC7kBrXxAQhG6NV1tGH1OHOV4u
	8OJJZsHY0y4geVRmQAxCetxg/RiIlF/vNxNakc8h8ZEPQV2Z0TwM51L9IA6KjlbVH0yt7Zq7yw28K
	Gku9YIMjGtUDj6O9FX4HVd7gkq/Nilm9VxGcFnwwW8HMTaPudV/p4ZTV7OkpZxaha+0qqP4/+m84D
	gCh02yr6HyTYGgvm97jcwsvmJMsAjWsZlQkpR1v8e4iCYLX/0qeh+g5bFaaBtXT7gO5rxPKAHShuf
	Avfu59sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaGx-00000008IN1-1cbu;
	Wed, 04 Feb 2026 10:38:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaGt-00000008IMc-3KKb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 10:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cmBXQFWwMJpNA6HYvHV+pn0Z7Isl9C8hhe8elfOnPD4=; b=hfQ2YHQGZIQm0RQasJiJholAJ4
	W8EaKCsaNrbAclFFje09t0ZJg3V9Fysk4jo/8059NJOFCFZgN/uWmgEX9nf9F51qmlixOhJoIZcXS
	zRvFZQUduZdslxT/ACRO61vDTzJXkSkV2TMbzk1elI+uJMF90wlldW4LupYMH1q3o5AuFSP3X6+Uu
	tMms6oQxwtYvFBotgzcJrjThgJPJRxAsb7B5FfliZBocxzscxeM1A2FssY7mqQoTe4Q7TJ/jaYv0W
	P8QVYnPm25HlblUSdiFXh71VdJFlp+zxJ2XxTyFo/jjzy7k4Wf+3dXsT02dIA3tacRcz8tOS0MXkc
	b4/hjrgw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53300 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vnaGl-000000006DG-3gVg;
	Wed, 04 Feb 2026 10:37:59 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vnaGl-00000007i9f-0ZMw;
	Wed, 04 Feb 2026 10:37:59 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next] net: stmmac: imx: fix iMX93 register definitions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vnaGl-00000007i9f-0ZMw@rmk-PC.armlinux.org.uk>
Date: Wed, 04 Feb 2026 10:37:59 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_023808_125948_C6507E80 
X-CRM114-Status: GOOD (  14.30  )
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

When looking at the iMX93 documentation, the definitions in the driver
do not correspond with the documentation, which makes the driver
confusing.

The driver, for example, re-uses a definition for bit 0 for two
different registers, where this bit have completely different purposes.

Fix this by renaming the second register, and adding a definition that
reflects the true purpose of bit 0 in the first register (EQOS enable.)

Replace MX93_GPR_ENET_QOS_INTF_MODE_MASK with MX93_GPR_ENET_QOS_ENABLE
and MX93_GPR_ENET_QOS_INTF_SEL_MASK as MX93_GPR_ENET_QOS_INTF_MODE_MASK
is not a register field.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 25 +++++++++++--------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index ecc0c3483423..c4e85197629d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -28,11 +28,11 @@
 #define GPR_ENET_QOS_CLK_TX_CLK_SEL	(0x1 << 20)
 #define GPR_ENET_QOS_RGMII_EN		(0x1 << 21)
 
-#define MX93_GPR_ENET_QOS_INTF_MODE_MASK	GENMASK(3, 0)
 #define MX93_GPR_ENET_QOS_INTF_SEL_MASK		GENMASK(3, 1)
-#define MX93_GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 0)
-#define MX93_GPR_ENET_QOS_CLK_SEL_MASK		BIT_MASK(0)
-#define MX93_GPR_CLK_SEL_OFFSET			(4)
+#define MX93_GPR_ENET_QOS_ENABLE		BIT(0)
+
+#define MX93_ENET_CLK_SEL_OFFSET		(4)
+#define MX93_ENET_QOS_CLK_TX_SEL_MASK		BIT_MASK(0)
 
 #define DMA_BUS_MODE			0x00001000
 #define DMA_BUS_MODE_SFT_RESET		(0x1 << 0)
@@ -95,17 +95,18 @@ static int imx93_set_intf_mode(struct imx_priv_data *dwmac, u8 phy_intf_sel)
 	if (phy_intf_sel == PHY_INTF_SEL_RMII && dwmac->rmii_refclk_ext) {
 		ret = regmap_clear_bits(dwmac->intf_regmap,
 					dwmac->intf_reg_off +
-					MX93_GPR_CLK_SEL_OFFSET,
-					MX93_GPR_ENET_QOS_CLK_SEL_MASK);
+					MX93_ENET_CLK_SEL_OFFSET,
+					MX93_ENET_QOS_CLK_TX_SEL_MASK);
 		if (ret)
 			return ret;
 	}
 
 	val = FIELD_PREP(MX93_GPR_ENET_QOS_INTF_SEL_MASK, phy_intf_sel) |
-	      MX93_GPR_ENET_QOS_CLK_GEN_EN;
+	      MX93_GPR_ENET_QOS_ENABLE;
 
 	return regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
-				  MX93_GPR_ENET_QOS_INTF_MODE_MASK, val);
+				  MX93_GPR_ENET_QOS_INTF_SEL_MASK |
+				  MX93_GPR_ENET_QOS_ENABLE, val);
 };
 
 static int imx_dwmac_clks_config(void *priv, bool enabled)
@@ -205,7 +206,8 @@ static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 	old_ctrl = readl(dwmac->base_addr + MAC_CTRL_REG);
 	ctrl = old_ctrl & ~CTRL_SPEED_MASK;
 	regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
-			   MX93_GPR_ENET_QOS_INTF_MODE_MASK, 0);
+			   MX93_GPR_ENET_QOS_INTF_SEL_MASK |
+			   MX93_GPR_ENET_QOS_ENABLE, 0);
 	writel(ctrl, dwmac->base_addr + MAC_CTRL_REG);
 
 	 /* Ensure the settings for CTRL are applied. */
@@ -213,9 +215,10 @@ static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 
 	usleep_range(10, 20);
 	iface &= MX93_GPR_ENET_QOS_INTF_SEL_MASK;
-	iface |= MX93_GPR_ENET_QOS_CLK_GEN_EN;
+	iface |= MX93_GPR_ENET_QOS_ENABLE;
 	regmap_update_bits(dwmac->intf_regmap, dwmac->intf_reg_off,
-			   MX93_GPR_ENET_QOS_INTF_MODE_MASK, iface);
+			   MX93_GPR_ENET_QOS_INTF_SEL_MASK |
+			   MX93_GPR_ENET_QOS_ENABLE, iface);
 
 	writel(old_ctrl, dwmac->base_addr + MAC_CTRL_REG);
 }
-- 
2.47.3


