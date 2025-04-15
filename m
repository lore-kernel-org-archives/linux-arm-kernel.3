Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2D5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEfpJshR6Sfriowq4GQ0FM8g/G2gger1/qz9A6JvWeQ=; b=FMUOlnB5rC31VrKQYbOrwyH/Lg
	vjWw2tjg3xnR7hHFmjisYYe06vWhgzj7za/91/wBBPZFhJ9a6I/ycQS94thsQxXvy4FBwsr0psmcF
	paJPlLtu3+NItd2J/QO0bL2ad19b5equGAJ2OZHU8VzOcbscKzjZeXNCloOzX3cbx3+5NtfhRii9X
	qcs4vfZz0gzowDzlqlXeUXWSlp3WykanqZm9+uY5yzhvmwckkTPi95WXtNvu3VWegbBmopQsApupY
	A/Z+ZA+/LewmnkO64AOw5R/4FnUBOBBSZX1hBl4ybpRAHgsm9YnrUuazIHrwsbxfCDG9/SaFM22H+
	kC1xqeMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4g4h-00000005rjx-3vbp;
	Tue, 15 Apr 2025 13:11:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fsC-00000005q15-1S8f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NEfpJshR6Sfriowq4GQ0FM8g/G2gger1/qz9A6JvWeQ=; b=vMSvp3kfcZkZz1BBI1ZLsx2tfT
	7koMQYU6EWjS/2Dmh8m1EgqGu64fQqFBJcNy/6JZGVAjtx7Io4xHV51WYbtrj6JbnBYDHRzH8n7Vh
	F6jouX8VpsmmvUQiRJjwraVipM6+fkU1/UpmS6mLxee9XvGmPWcm2+47B7lpsPoYDQynkf0E81g3K
	0HDbnLm1Q4Hf4LnLygsQrUDRWGFIkqKsu9dL2yGacKvx9yI+jZbzGTGUksdnahEXkairEk3FGHtKc
	k4awzckzgPy2T75Y/B5YcGxhTHnRUEBEaCftXaarDf16IYw0uzfuSyqTQrb2Ef3qyQ7ySRJbFOIh8
	au1KZ/SQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52848 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4fs5-0008Bw-1i;
	Tue, 15 Apr 2025 13:58:37 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4frU-000nMf-6o; Tue, 15 Apr 2025 13:58:00 +0100
In-Reply-To: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
References: <Z_5WT_jOBgubjWQg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH net-next 1/3] net: stmmac: sunxi: convert to set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4frU-000nMf-6o@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 13:58:00 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_055844_399585_CF814190 
X-CRM114-Status: GOOD (  14.12  )
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

Convert sunxi to use the set_clk_tx_rate() callback rather than the
fix_mac_speed() callback.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 42 +++++++++----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
index 9f098ff0ff05..a245c223a18f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
@@ -72,28 +72,28 @@ static void sun7i_gmac_exit(struct platform_device *pdev, void *priv)
 		regulator_disable(gmac->regulator);
 }
 
-static void sun7i_fix_speed(void *priv, int speed, unsigned int mode)
+static int sun7i_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+				 phy_interface_t interface, int speed)
 {
-	struct sunxi_priv_data *gmac = priv;
-
-	/* only GMII mode requires us to reconfigure the clock lines */
-	if (gmac->interface != PHY_INTERFACE_MODE_GMII)
-		return;
-
-	if (gmac->clk_enabled) {
-		clk_disable(gmac->tx_clk);
-		gmac->clk_enabled = 0;
-	}
-	clk_unprepare(gmac->tx_clk);
-
-	if (speed == 1000) {
-		clk_set_rate(gmac->tx_clk, SUN7I_GMAC_GMII_RGMII_RATE);
-		clk_prepare_enable(gmac->tx_clk);
-		gmac->clk_enabled = 1;
-	} else {
-		clk_set_rate(gmac->tx_clk, SUN7I_GMAC_MII_RATE);
-		clk_prepare(gmac->tx_clk);
+	struct sunxi_priv_data *gmac = bsp_priv;
+
+	if (interface == PHY_INTERFACE_MODE_GMII) {
+		if (gmac->clk_enabled) {
+			clk_disable(gmac->tx_clk);
+			gmac->clk_enabled = 0;
+		}
+		clk_unprepare(gmac->tx_clk);
+
+		if (speed == 1000) {
+			clk_set_rate(gmac->tx_clk, SUN7I_GMAC_GMII_RGMII_RATE);
+			clk_prepare_enable(gmac->tx_clk);
+			gmac->clk_enabled = 1;
+		} else {
+			clk_set_rate(gmac->tx_clk, SUN7I_GMAC_MII_RATE);
+			clk_prepare(gmac->tx_clk);
+		}
 	}
+	return 0;
 }
 
 static int sun7i_gmac_probe(struct platform_device *pdev)
@@ -140,7 +140,7 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 	plat_dat->bsp_priv = gmac;
 	plat_dat->init = sun7i_gmac_init;
 	plat_dat->exit = sun7i_gmac_exit;
-	plat_dat->fix_mac_speed = sun7i_fix_speed;
+	plat_dat->set_clk_tx_rate = sun7i_set_clk_tx_rate;
 	plat_dat->tx_fifo_size = 4096;
 	plat_dat->rx_fifo_size = 16384;
 
-- 
2.30.2


