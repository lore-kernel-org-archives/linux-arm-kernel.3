Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA04CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nU1RZQP3gz6BlF36zUXcqwdullSwX6wrYvV0mrqTuc0=; b=TXxFXRPUMz2EyK/kO9bpSGOK6o
	RNf0BoA0UnUdWlT1Rrl5lY2b2UXrOqpulGrDtaYs6yApC6SD4AyG8sUr273qg4gmX9bX5JaxgcT0H
	Kqi7DAWKICplOlX6JJLoIGD8F7U2VFBg1dIpflu95rd+IYDn+hyEU7FVsJ2aIJHBlHeqLVn8fdg2H
	sSJDSlZFIc3gwfYmmHqstkithnZnGHr5YcU02EFW9qLLCczTIY02zxI5ih+UWVdVeFSmW0S+vjT5c
	+QvdA1Z7zlXwLdhLdE87d/TST0oJWWA5X/XoBA2oznKNGXv/J4JBj3CahiqNHcvwHJdyH6fUacld0
	bBtZzHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4g6V-00000005s75-2XQY;
	Tue, 15 Apr 2025 13:13:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fsG-00000005q3a-0JZ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nU1RZQP3gz6BlF36zUXcqwdullSwX6wrYvV0mrqTuc0=; b=fKQ78xpxpsbtfLUAyH0907v9/W
	SjC6gfxtB7ABm1y8VhvvfOKLHzDG0adiq4IiUXgFQVf6xiGAi7bxEOi/jQmakocEL6Kfex0myvUeG
	IbbmuuashVUfdjwRu2Y1hpwifWt+eHTf6XWJnDviVSrUVxsLvqlioSArtpcK0kv9XEi28EvzIbcP6
	6166vYLtwm3tb8AYH98sj4vlNS4d2c9bOeyB+szlt2uFKad2xMmdP6erGyqdOin3V6jTUeYQI0HCy
	R508EWlyF6IsxnRTvoeJCPArg9kTxpvDmYA3e7xqKpGXiUiQkTXyAG0EVslSPA7wlV0VolbdRLpph
	lAo3DzMw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55886 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4fsA-0008C8-2P;
	Tue, 15 Apr 2025 13:58:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4frZ-000nMl-BB; Tue, 15 Apr 2025 13:58:05 +0100
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
Subject: [PATCH net-next 2/3] net: stmmac: sunxi: use stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4frZ-000nMl-BB@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 13:58:05 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_055848_114543_89E4A756 
X-CRM114-Status: GOOD (  11.14  )
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

Rather than open-coding the calls to sun7i_gmac_init() and
sun7i_gmac_exit() in the probe function, use stmmac_pltfr_probe()
which will automatically call the plat_dat->init() and plat_dat->exit()
methods appropriately. This simplifies the code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
index a245c223a18f..665eab1d3409 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
@@ -144,20 +144,7 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 	plat_dat->tx_fifo_size = 4096;
 	plat_dat->rx_fifo_size = 16384;
 
-	ret = sun7i_gmac_init(pdev, plat_dat->bsp_priv);
-	if (ret)
-		return ret;
-
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		goto err_gmac_exit;
-
-	return 0;
-
-err_gmac_exit:
-	sun7i_gmac_exit(pdev, plat_dat->bsp_priv);
-
-	return ret;
+	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id sun7i_dwmac_match[] = {
-- 
2.30.2


