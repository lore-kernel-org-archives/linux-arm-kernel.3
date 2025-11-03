Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1762CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9+uCkTTPZNitcXoasL3jxbNQG9cxbs2rnefJEzDKW0=; b=pgNz8az/NQ0CAaiL0rvUdkekaQ
	UJ+nVBB0XfvoGVmkDy5OLPacZTwbheWjKP7+3RE+kxrxBfXUuKdZe34u8apEw1XHvxuCMPpU98g9u
	WWKvcA7pI9zagbK6BOqGRvhM8Q9alAtEk6e2DmKoX8aPQsR2Xf6D/geKUoQyIsjCV03XrpvdNoLHy
	HON9UC92jo9XuoD2hGynfHatWFfMYrujhoM9K8fqyGl+pzC17b9jPyxRhUXy7XfD2rdJ7/15Rayyu
	c4fqPGwNU/oFcEQhJUaK0L6r6wDLwwkhbeIYUOOYE0SyiIYgRGNLiPNfSexXGvvRraBmgEOXr0O2B
	GKt239OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt4Z-00000009lxh-3sQf;
	Mon, 03 Nov 2025 11:50:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFt4Y-00000009lwr-05i2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F9+uCkTTPZNitcXoasL3jxbNQG9cxbs2rnefJEzDKW0=; b=oHRCiuX+2gLwNnnKwa0RLYg3gL
	EauuF8Y6wW6QGs+5nA7kr5ZfXqQZ8pU0F6xDX4B9MOpQLAz8PD6gOenUyb7/nzNCmVwwBXDgsr93z
	ut8ZdkehwkWGQiyb+YKRfoYUdcZm942v/wUT/Wx6T2tOo0SETfizaXMXtyqmMY0gVB3KM41bTVJUn
	pN1YbcxDKxb+0A/Bo/duo5PHibovEwr3fA44N8LU4BejXMlcFGPBYunbkBvovgc7N0wOAKHbWYyO9
	99XL8I5iLqdXD+hJJlCxE1643AwbW9vmWHVZGKz00Z5r8BE6EQUeZZ/L7tCr3jviMJ80V3RmF/UyF
	J/mU7P7g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34308 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vFt4O-000000000fE-13d5;
	Mon, 03 Nov 2025 11:49:56 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vFt4N-0000000ChoM-1llp;
	Mon, 03 Nov 2025 11:49:55 +0000
In-Reply-To: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH net-next 01/11] net: stmmac: imx: use phylink's interface mode
 for set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vFt4N-0000000ChoM-1llp@rmk-PC.armlinux.org.uk>
Date: Mon, 03 Nov 2025 11:49:55 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_035006_055511_3F6D3716 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

imx_dwmac_set_clk_tx_rate() is passed the interface mode from phylink
which will be the same as plat_dat->phy_interface. Use the passed-in
interface mode rather than plat_dat->phy_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 4268b9987237..147fa08d5b6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -195,9 +195,6 @@ static void imx_dwmac_exit(struct platform_device *pdev, void *priv)
 static int imx_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 				     phy_interface_t interface, int speed)
 {
-	struct imx_priv_data *dwmac = bsp_priv;
-
-	interface = dwmac->plat_dat->phy_interface;
 	if (interface == PHY_INTERFACE_MODE_RMII ||
 	    interface == PHY_INTERFACE_MODE_MII)
 		return 0;
-- 
2.47.3


