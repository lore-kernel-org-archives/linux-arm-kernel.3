Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5054AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSe0c69jHaZowf9s+caWtXk4sDZG6Bn7YtQiiu7h0+0=; b=ax9QNJk0Bb+EzRNV4Tt/kmvTeU
	IFIghPsxJ0RotjzX/X/z6eAGjZ9HHy/SrlKTTLW6lHaB3q0ebae0yTM4oAJcgt/Fl+4VZjbDAgc31
	vhUKYztHMHFJN3AtbaRVzHj2s1VilEaa2XRxUQBGF4qf8JvLeJ6HXTujPiGBj0oZQRB0fmc5d2Fru
	0yttecziOfJf26oxq5K5w/TrqXcwxvPj+m+SMtXaxpOa/6EsJBHCTId1JBOjq/Xvbv6/V1RbSapjG
	o8ZN0HxM2Ye46HsADhc2m4amRA6u6aWeVicSiP6bbzA2potSzlF8qQNZqg4io99WrbYFJBh3CklVW
	C6h9njMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLhh-00000007wXW-2k3d;
	Tue, 18 Feb 2025 11:23:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLZd-00000007uFu-0bNO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KSe0c69jHaZowf9s+caWtXk4sDZG6Bn7YtQiiu7h0+0=; b=pv4grxLOfAy1HTamSWjhCAJhnd
	vDFC0rhwnWlZcDfja5x8XaQsRi/2wTZYbHddAcMYqYvgT0GTl8g5vdyX3PASsLLan5wpnyrbLJ9Zj
	qtTcQzKGb4+nMCB5j8uC+3V3Jp+8u5bgJ2PvnykzggWLcbnzSX/d2xW3pSQ26APCp+buv83oT2w3g
	ZbZuLTNK0ZyUz4Cm5LLbzCassiQLRKhlmDifBsCyLTxCFd0PNz5F1qDSoFWFVhPgZ3dV83psZFDMm
	ltndkBeMLWG5DqDZpKJE0l59sUtvQjLEAQtJmVPRqCLKkflVWDFqYe/cHSSUIa/h1fnwvTN7hT33O
	O++gP5yg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51256 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tkLZQ-0001jR-2t;
	Tue, 18 Feb 2025 11:15:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tkLZ6-004RZO-0H; Tue, 18 Feb 2025 11:15:00 +0000
In-Reply-To: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH RFC net-next 5/7] net: stmmac: s32: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tkLZ6-004RZO-0H@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Feb 2025 11:15:00 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_031533_182097_CC91A958 
X-CRM114-Status: GOOD (  11.37  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 22 +++----------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 6a498833b8ed..b76bfa41af82 100644
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
+	plat->clk_tx_i = dmac->tx_clk;
+	plat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 
 	plat->bsp_priv = gmac;
 
-- 
2.30.2


