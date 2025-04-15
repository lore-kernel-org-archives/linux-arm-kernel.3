Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A0CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GSBt2MJMjAhzFPApeUUI2g2BMUd4P0q8zYxmPlvwJ4o=; b=Bqz7TNlvbV1eCq6cgz2GMCAccr
	h2k1U69g1jAfYBuKsaIFNKf5Ntw8gTmVAk1rn2qMZ/rr6DSbcWbQJGZL5bfiU15Bfaj2cNHYdbJxT
	xa1p/Gyu6Cz3x86XbimYFdKU2L/uPLAMt9gGfjH+/IO+iMYTfXY+7xn+L8OioiCWjuSaScznLiYGc
	MJK9toQRAN2eMKXohXoC+wGWU6dfgfsPJeIyFb2YIq9p9L958Hrpjfb0CVKdjaqFBKBDSzMtyhe6h
	yZX05NYx8lzDShY6HNh27qV4xXCaF1xBG0cWbUSdEtvunUv+eDBtVVtRFg14jbxC9SIn0Gorgs2T2
	BojQLt+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dRU-00000005Jdz-32B2;
	Tue, 15 Apr 2025 10:23:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dLK-00000005IFh-1R64
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GSBt2MJMjAhzFPApeUUI2g2BMUd4P0q8zYxmPlvwJ4o=; b=pBFYel6ZhGCVZlhKkN/xfHKsko
	tfy1jP7AXZCpn+Fv0iO3J+QH9y+fdv9ae4eyH3wZvouaDR0Q4rjtII3jx8b677GlXq0aQNvGe211F
	jVo/Nxzpjkrj2sKzknLp358emVznhbUzkGmsG31BW7nQsrPEp3idj2VJtAt1YDKhRbLKu4Pu72WtC
	o9aoZ9MOLjriuUdcfKgr39maOzwwWmvg4Q4GII5/ZpZ55MQ/nTOxe/WpgZ/CCmArF90EzKkqoua+k
	stER9Yr1gqsBEbI4ujJWByZxkFbeTVelpbwTYNbCcFzXD+ObzhCSigsKRjCVi+UwMlHgJ+X9IoVsX
	aGcvGTqw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36516 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4dLC-0007w1-1L;
	Tue, 15 Apr 2025 11:16:30 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4dKb-000dV7-3B; Tue, 15 Apr 2025 11:15:53 +0100
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
Subject: [PATCH net-next] net: stmmac: sun8i: use stmmac_pltfr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4dKb-000dV7-3B@rmk-PC.armlinux.org.uk>
Date: Tue, 15 Apr 2025 11:15:53 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_031638_385002_B3E2A3C0 
X-CRM114-Status: GOOD (  10.64  )
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

Using stmmac_pltfr_probe() simplifies the probe function. This will not
only call plat_dat->init (sun8i_dwmac_init), but also plat_dat->exit
(sun8i_dwmac_exit) appropriately if stmmac_dvr_probe() fails. This
results in an overall simplification of the glue driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 85723a78793a..fd6518e252e3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1239,14 +1239,10 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = sun8i_dwmac_init(pdev, plat_dat->bsp_priv);
+	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 	if (ret)
 		goto dwmac_syscon;
 
-	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (ret)
-		goto dwmac_exit;
-
 	ndev = dev_get_drvdata(&pdev->dev);
 	priv = netdev_priv(ndev);
 
@@ -1283,9 +1279,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	clk_put(gmac->ephy_clk);
 dwmac_remove:
 	pm_runtime_put_noidle(&pdev->dev);
-	stmmac_dvr_remove(&pdev->dev);
-dwmac_exit:
-	sun8i_dwmac_exit(pdev, gmac);
+	stmmac_pltfr_remove(pdev);
 dwmac_syscon:
 	sun8i_dwmac_unset_syscon(gmac);
 
-- 
2.30.2


