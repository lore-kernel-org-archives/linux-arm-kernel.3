Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9457AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZsO/hEei+5L5Y+22LpoO6v7DoCgNeecYJmxyXCryiU=; b=3f8CPjcyBSOvETOEBcE1cu1r/u
	Ex8HcUwsvN5pU04Vpj+WCTadWQB0M5SYbfK7FZcOtht8bnBhA+Nc4UabRTQ5KW/3Ecoj3ViaSFAmb
	sTLS1Y4lcsa1LqzrlK1MBqs/CN9y2iNEe5OpfdTAzzBurTEN8/DKjrl5C3uzMqtEMPQaDCAM9r6a/
	zS6vw2MKCTl6aPOXJQAlSpsQXdRNUsB4P8IlkVMo41CLVkL7KVYvGTtK3Vsv2SxNcqawrBQVfAOOD
	kysYPlOWSS6sEXLsd7AvbOhwZwxpAN+8KA34GUB/zAnHWopvfcAOldSjA1J5J7qrB335XyRFC7y+C
	TC7sIGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujwN3-000000002Qx-2P5s;
	Thu, 07 Aug 2025 08:53:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujwJU-00000000251-48Bg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 08:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yZsO/hEei+5L5Y+22LpoO6v7DoCgNeecYJmxyXCryiU=; b=gxgJ0PBlkRYoBwzq7HESSC5t0P
	8hK1G1SuXO/Bjya1bRhG3ZiOeeOgaRAgGVrl00t/vF2Zdo0V7ooG4msE13G89x2lLWjeZ1pg6QCOD
	lSEo6hGp+dRJPdx8cwYYx7vlgWRtoVIQVq4JOnY+2wpp+2hn3ax8XOHKEZeMOcLTJzOVn9km+e6zf
	flbC2/VmXBd2iph2EptG08xJ10A6u0Ic1rrrxd2ieInK9eo30d6TwAaYv5CoTsc2d5+YMo7A8ei9J
	/fLUjgLiXTQWIf8FJc6wguGJMieIXwno6QULcfSxRQuTtnuIMBz9CwsoJx6+yrwgSJlpN8ESjaQ+Q
	moA5ZVvw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44352 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ujwJG-0005oy-2T;
	Thu, 07 Aug 2025 09:49:14 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ujwIY-007qKa-Ka; Thu, 07 Aug 2025 09:48:30 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	David Wu <david.wu@rock-chips.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Wu <david.wu@rock-chips.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net] net: stmmac: rk: put the PHY clock on remove
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
Date: Thu, 07 Aug 2025 09:48:30 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_014929_025553_BAC7D6C6 
X-CRM114-Status: GOOD (  10.24  )
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

The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
doesn't take part in the devm release. Therefore, when a device is
unbound, this clock needs to be explicitly put. Fix this.

Fixes: fecd4d7eef8b ("net: stmmac: dwmac-rk: Add integrated PHY support")
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Spotted this resource leak while making other changes to dwmac-rk.
Would be great if the dwmac-rk maintainers can test it.

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 79b92130a03f..4a315c87c4d0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1770,6 +1770,9 @@ static void rk_gmac_remove(struct platform_device *pdev)
 	stmmac_dvr_remove(&pdev->dev);
 
 	rk_gmac_powerdown(bsp_priv);
+
+	if (plat->phy_node && bsp_priv->integrated_phy)
+		clk_put(bsp_priv->clk_phy);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.30.2


