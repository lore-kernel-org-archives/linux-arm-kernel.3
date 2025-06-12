Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1564C7114C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wY+eCXCVGTGusBEHAW8kNT7MMSIsV/Ri13PvFprdNrs=; b=qCg541GyHVl51VrJ8ZHX19IUc5
	ypAZYFu75gTKamv3beyx/XRzvN8WZH38zYJm6nBob39UY10gypJ/nMwZQ3GJJVbM17/31g4xSUKay
	fCqaHk3vYUYFK9sjl2Xasn5tdS/GmsSu/d6FPenfh2boGayYufP/59bC1g1TI3I1qBnNFp96Cdb3R
	kQIrebVDp3WLSvffp7MFvP878nsfrsrkjH/vlX1ohL+7e+f+LdXFFen2I5b2mHfUJF9bs9jo/PuO1
	2HpxgSJDEqAzU+LHGFOL1SCIPsW5djYaWmNeUz1ELW66Kt8bDEHe9+n/UR/HZlhNFmj/tNLW51HSF
	ncenQmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7B-0000000EjVG-1sIo;
	Thu, 12 Jun 2025 22:09:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPk41-0000000DpHN-37tU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wY+eCXCVGTGusBEHAW8kNT7MMSIsV/Ri13PvFprdNrs=; b=OV8rgJAQ3GWl2LTl5+MvARs5fR
	BOahYIV+iOvroz3UMVYgttPq3H7tRCaejfazD/tLSZ3LHh8cLDX3G7BZUwYe9lYtpYz0eJj6qc2Qs
	kZpMs3SmnIhAVSvSlhglCmpvZpKnI2nz12fuQjC4JA5npMds7lnQHavJ40t9oGfJXMd6Wayrj2F0J
	DV48SGaSrVeQMxNisJoocWj8csYtvKjWDOj8drh7ogoizfgB7DTVeURL/pFRtDT3kFkm33rQVoDJx
	s/yQoZWExy8KKMkzXCx4aZXIGLlNG2q6xvCxji7vz7GStAS9axu1iuyvsp+IOLPGIJlp42b0iMmhy
	YlSxP0zA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42652 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uPk3x-000858-1w;
	Thu, 12 Jun 2025 16:41:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uPk3J-004CFr-FE; Thu, 12 Jun 2025 16:41:17 +0100
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
Subject: [PATCH net-next 8/9] net: stmmac: rk: convert px30_set_rmii_speed()
 to .set_speed()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uPk3J-004CFr-FE@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Jun 2025 16:41:17 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_084201_780753_ACA5307B 
X-CRM114-Status: GOOD (  11.48  )
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

Convert px30_set_rmii_speed() to use the common .set_speed() method,
which eliminates another user of the older .set_*_speed() methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 72f2b80bf3bb..7cdb09037da0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -246,17 +246,17 @@ static void px30_set_to_rmii(struct rk_priv_data *bsp_priv)
 		     PX30_GMAC_PHY_INTF_SEL_RMII);
 }
 
-static void px30_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
+static int px30_set_speed(struct rk_priv_data *bsp_priv,
+			  phy_interface_t interface, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
 	unsigned int con1;
 	long rate;
-	int ret;
 
 	if (!clk_mac_speed) {
 		dev_err(dev, "%s: Missing clk_mac_speed clock\n", __func__);
-		return;
+		return -EINVAL;
 	}
 
 	if (speed == 10) {
@@ -267,20 +267,17 @@ static void px30_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
 		rate = 25000000;
 	} else {
 		dev_err(dev, "unknown speed value for RMII! speed=%d", speed);
-		return;
+		return -EINVAL;
 	}
 
 	regmap_write(bsp_priv->grf, PX30_GRF_GMAC_CON1, con1);
 
-	ret = clk_set_rate(clk_mac_speed, rate);
-	if (ret)
-		dev_err(dev, "%s: set clk_mac_speed rate %ld failed: %d\n",
-			__func__, rate, ret);
+	return clk_set_rate(clk_mac_speed, rate);
 }
 
 static const struct rk_gmac_ops px30_ops = {
 	.set_to_rmii = px30_set_to_rmii,
-	.set_rmii_speed = px30_set_rmii_speed,
+	.set_speed = px30_set_speed,
 };
 
 #define RK3128_GRF_MAC_CON0	0x0168
-- 
2.30.2


