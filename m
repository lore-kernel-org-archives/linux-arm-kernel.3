Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277ABC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWnPECP85hSj80bfwjHgzvvanWg0iFIEd3mo6R2Ssbs=; b=kU8151lnlK2aSHxuG2ljxlSMNx
	pZ9jN8h80CuPNMv9a8C+FnLGSdIVcGby47R2ghDP0RDml5kBwdOl39ostj11sEvBAXzx3f+YIMl10
	Cgt9a7wf/amegOMkAKK2jQAXQX2ejvGSOukWnV7u4Bpt8rmStpA3+Pw+4xEkh3j9/gibzWzvmgRnA
	zxMKx8BGnmrHygsnQ+GYop0oPKPjawI8ojvAhTuuE99znnAhHrKB0IZWR7LUkSFvGAvALI7sR3vhT
	80T4qbcfl7UfnsolgI+8Eob1H5e6cHm7JE/8mZco68S52NwDeHwDpEnbhnkdDxBDM89SHeEb9EvCc
	KYZM+1jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaFh-00000006s5C-3Idm;
	Thu, 27 Feb 2025 09:32:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tna1Q-00000006pqG-0dKZ;
	Thu, 27 Feb 2025 09:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iWnPECP85hSj80bfwjHgzvvanWg0iFIEd3mo6R2Ssbs=; b=xikXrqHkwfP9GNCfi+BVPe4Nwb
	et0s7E0VCYJN5fG5eKUAMEBzd8HRWpsJWXrejf7FZcFOlaKtEZLJyOZS+U2/bgVFWk3NAQjm8/MSW
	54rMdQbA2MxWIyuyFfMHqwWwXeUI+l3WblBMxYoSqhkWdQ0DUQIoTzZEX+kxOyGOWVojGo+5cqrrl
	6JixAOyo2xnOSx0GGBCY85hdzpsxDGGXHnjczs5SIbxTLziNXdhmC0smmLucsyqu7dYigWX7FmX/n
	41lEkpEbCTnga4KiuigfVyZ3zs7oH6nX25Dhmvnqhppy/NOZKaKUN16AitEd5o9OmvOYkBts1/cRP
	xSsOsYLQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38326 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tna1J-0006e3-2Q;
	Thu, 27 Feb 2025 09:17:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tna0z-0052tN-O1; Thu, 27 Feb 2025 09:17:09 +0000
In-Reply-To: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 10/11] net: stmmac: meson: switch to use
 set_clk_tx_rate() hook
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:17:09 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_011736_195341_13F59618 
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

Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
manage the transmit clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
index b115b7873cef..07c504d07604 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
@@ -22,9 +22,10 @@ struct meson_dwmac {
 	void __iomem	*reg;
 };
 
-static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
+static int meson6_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+					phy_interface_t interface, int speed)
 {
-	struct meson_dwmac *dwmac = priv;
+	struct meson_dwmac *dwmac = bsp_priv;
 	unsigned int val;
 
 	val = readl(dwmac->reg);
@@ -39,6 +40,8 @@ static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
 	}
 
 	writel(val, dwmac->reg);
+
+	return 0;
 }
 
 static int meson6_dwmac_probe(struct platform_device *pdev)
@@ -65,7 +68,7 @@ static int meson6_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(dwmac->reg);
 
 	plat_dat->bsp_priv = dwmac;
-	plat_dat->fix_mac_speed = meson6_dwmac_fix_mac_speed;
+	plat_dat->set_clk_tx_rate = meson6_dwmac_set_clk_tx_rate;
 
 	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 }
-- 
2.30.2


