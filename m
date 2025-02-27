Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD38CC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+KYa1nF9rgBj7OxCXuLmQ8i8cj5XlLy3OJR2RsYgpw=; b=ZNH574lsTIVdUHqScIsA6P7lji
	GbxeTiJoOo4BXDX90WCpH66V/yVxeo6w8zmv1OsyWDVW9NfTMkGd9WWhq+ULiKwe72GvdXr6QlZPn
	LkW8IwE8XSlO9fBIzG7IkbwPutCs0OvzP8Oe9yutZ62K2p9nutLN4LAnsB5r0G94dpLQLdIIqa+GE
	3e4ilwbw/NmgdaB0isOkiLLzmqJNI8KBOhYAw5H7cjs/T25qrbZvdGE5/uFKObVmUPkAOg2G6+lxO
	V3LvbF/F03gMyxkRwHLr2vbSI5D9GN2BOYNVJoW6F9MLWuldOehEaHuWUKEFMtTYOC7dRgQk+Y6Qh
	+0L/TJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tna89-00000006qpV-3jxd;
	Thu, 27 Feb 2025 09:24:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tna10-00000006piW-2GqA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E+KYa1nF9rgBj7OxCXuLmQ8i8cj5XlLy3OJR2RsYgpw=; b=um/O8MtApsb4so1YWD2aOsqzOQ
	j8P9erdSesn82Q+HftJ0wMCZOClnoMS+zN9v6XG7rWqg8kQ3G95rfu5/gh0MK5Xhfn1UPA1CYq/IR
	NAFP/0VvhWibbzWea0IJEWEFCT2LRU/LCw/dnzq2a1KaCTEsqoNTNS0EgcLdxwxdDXmrfPrquhvmb
	GW+uiy+69Ez88x/zUJ/5TkIsj0F0bIWXnkv5MlH4l3wqlDrgTTO4gVSsgf+I2FgaRh1Y2rSPkAd0E
	wFnAAgtX5IzE5IEzAMOgU6qnisrnjRmCEQmazCzeWa9kGYpJ1xNjzrqUMlQ6DxGCnrygpbKwqYTzl
	/RBm/bsw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45364 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tna0u-0006cX-2y;
	Thu, 27 Feb 2025 09:17:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tna0a-0052sq-59; Thu, 27 Feb 2025 09:16:44 +0000
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
	Jan Petrous <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 05/11] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tna0a-0052sq-59@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 09:16:44 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_011710_576538_A9B0600D 
X-CRM114-Status: GOOD (  11.05  )
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

Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
clock.

Reviewed-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 22 +++----------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 6a498833b8ed..221539d760bc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -100,24 +100,6 @@ static void s32_gmac_exit(struct platform_device *pdev, void *priv)
 	clk_disable_unprepare(gmac->rx_clk);
 }
 
-static void s32_fix_mac_speed(void *priv, int speed, unsigned int mode)
-{
-	struct s32_priv_data *gmac = priv;
-	long tx_clk_rate;
-	int ret;
-
-	tx_clk_rate = rgmii_clock(speed);
-	if (tx_clk_rate < 0) {
-		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
-		return;
-	}
-
-	dev_dbg(gmac->dev, "Set tx clock to %ld Hz\n", tx_clk_rate);
-	ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
-	if (ret)
-		dev_err(gmac->dev, "Can't set tx clock\n");
-}
-
 static int s32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat;
@@ -172,7 +154,9 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 
 	plat->init = s32_gmac_init;
 	plat->exit = s32_gmac_exit;
-	plat->fix_mac_speed = s32_fix_mac_speed;
+
+	plat->clk_tx_i = gmac->tx_clk;
+	plat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 
 	plat->bsp_priv = gmac;
 
-- 
2.30.2


