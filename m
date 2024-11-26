Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFC9D3B98B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIGrobl+zw4EUSXA7yR//sEKBwcDdAfhGwCW2sSjPHY=; b=PkwbuR/21DlupV4hRlyRMbFnq2
	u37J0XT/3D8fGcIlBbttcNgeYHHE5NztdE8KZXq9k4KrkNcWCdljjqskh14IWgzx22oFD0sTU443J
	B68sfGfMpkK+p8ewzjs817Hn4JcN/MQxM9usN/uNbPZ7vleYIIsEgkWdRmPOQ38IbPz1sYjDn9ZbE
	rMjK3tzPfLVg1h0ZJ73/guz6AeJrJ6XFXLlILibZy2WXVnLe/1txMnAusAguFgbYy7R1ym/tW5MFO
	a1kXjtSWJcAFXZQf0upZkd43A3txtF9JFzeqrK4WdYsz9X9JDYUQ5ky3l5l79ERO/Y1cFKIXpdZdx
	ffj8Cm2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvHq-0000000AepY-3Xbe;
	Tue, 26 Nov 2024 13:07:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv4K-0000000AcCT-0mPf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SIGrobl+zw4EUSXA7yR//sEKBwcDdAfhGwCW2sSjPHY=; b=xvmWnGOSqAY/N/M4Tft8V/Weym
	sKUVXARe0oFEF+zoBJoEcwlH/8LlGxHFIqIuBp/DYJ/SwmGnBl4Bt9jfHOdVpdrnz+9OpLK53rBe6
	3eihJO11ESJ2bPiLy9sp80zLOACy8DmEyABWSzV8n8v7sWPNFoEcarJG2RRgPMdOlcij2dyiNRTMk
	3Vdqf4h0Weqyn+NW1uzsDsy2m/hLdQIHATWiWIf8i2JM5ZHTqGJIb5U6LFklUfvbDoGMb5tcDmlqu
	PeSs1MOtwZESXnENdfws9agZDDSlZwL5GX2CFuD5XfN/P3BkVqUoLnXlIt6mg1gwAHWRHMd7TQvQ0
	eb5h3Sug==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47328 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv4B-0006vK-0Y;
	Tue, 26 Nov 2024 12:53:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv49-005yiX-Hw; Tue, 26 Nov 2024 12:53:17 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH RFC net-next 13/23] net: mvneta: only allow EEE to be used in
 "SGMII" modes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv49-005yiX-Hw@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:53:17 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045328_220789_2F7669AE 
X-CRM114-Status: GOOD (  12.22  )
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

The Armada 388 manual states that EEE is only supported in "SGMII"
modes. As mvneta only supports serdes modes and RGMII, we can
satisfy this by excluding it for RGMII.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/marvell/mvneta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 976ce8d6dabf..01bedf0a55f6 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5551,7 +5551,9 @@ static int mvneta_probe(struct platform_device *pdev)
 	pp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_10 |
 		MAC_100 | MAC_1000FD | MAC_2500FD;
 
-	/* Setup EEE.  Choose 250us idle. */
+	/* Setup EEE. Choose 250us idle. Only supported in SGMII modes. */
+	__set_bit(PHY_INTERFACE_MODE_QSGMII, pp->phylink_config.lpi_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, pp->phylink_config.lpi_interfaces);
 	pp->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
 	pp->phylink_config.lpi_timer_limit_us = 255;
 	pp->phylink_config.lpi_timer_default = 250;
-- 
2.30.2


