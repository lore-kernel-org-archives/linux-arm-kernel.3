Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDC7CA1014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z+56Q9n1lHZQBzzvMxt9+BXV1Zgskh3dlOiezZQ9JP4=; b=LZnNjWPIIu6IsL0AAkr/Z8x1KZ
	F364LXylr0ntREhbC7PuuVd6EOMexxGsPdv+QtpuxxoPjfYavE/c6LsZjgwPaVDozsL49Yth5ByGa
	yI19QgNoCiMS4HQbEBoumTlip/P0eivFCrTAZj26jKFH4BKDZoxP89Bu5jLzK6VVGeAZ9g0PwK8MQ
	RuuenEtL8S94Plbm3mkF0XHEWH684fKLyCRtOmPUt3tPxhYrSP08bXlWcwODyUUmRIIbEVBw3mCxe
	oDngPXGmc1HO4LqpCv6amJqUI2VoG//BmM5ijG5eSbJK4NG2cZyChclgvEnyKbDOMyfl1lCZ1IXbk
	GYNA7Icw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0St-00000008cT6-2UGm;
	Thu, 04 Sep 2025 03:16:47 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Q9-00000008bkZ-1Ecv;
	Thu, 04 Sep 2025 03:13:58 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 32F9D25C7A;
	Thu,  4 Sep 2025 05:13:53 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFJ3nJp-J8Y8; Thu,  4 Sep 2025 05:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756955632; bh=/9+CJqX1fS+UiFee8YHounmOVjuOHZemA2Z3M9XlkQs=;
	h=From:To:Cc:Subject:Date;
	b=IAZv1PYEoOH/IBuhDPdjQ4Yr/XQmioZXmZxqmEvX5yuLh2NdlEYpFZjl3mxfeoNS4
	 6rFOh2EKybtfqR4bpdUwloekmlRk11lxNpgIAW3yppbGdZ7X++wXuXgTo3dNcKbfDq
	 8u/7F3suLrnFoAj7aidkPIkUqvuBFecg0Dqj14398qr5kFjx+0sUCwmxHZkEQV3ePn
	 LE1ogfDoNip3D8BDIdxLxB0ynM+3e0TEupGIBcMFXOsM2WNaaJPFg5EQy6H7AibfQZ
	 BYBWv95rX6375Uk3k4FY38MNvulpBHDtm3uwu6650sI3ZDjZbZeYwxm1dtp1fzAu1S
	 hwUSTZpKZJVvQ==
From: Yao Zi <ziyao@disroot.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonas Karlman <jonas@kwiboo.se>,
	David Wu <david.wu@rock-chips.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH net] net: stmmac: dwmac-rk: Ensure clk_phy doesn't contain invalid address
Date: Thu,  4 Sep 2025 03:12:24 +0000
Message-ID: <20250904031222.40953-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_201357_749334_EE04904E 
X-CRM114-Status: GOOD (  12.72  )
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

We must set the clk_phy pointer to NULL to indicating it isn't available
if the optional phy clock couldn't be obtained. Otherwise the error code
returned by of_clk_get() could be wrongly taken as an address, causing
invalid pointer dereference when later clk_phy is passed to
clk_prepare_enable().

Fixes: da114122b831 ("net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

On next-20250903, the fixed commit causes NULL pointer dereference on
Radxa E20C during probe of dwmac-rk, a typical dmesg looks like

[    0.273324] rk_gmac-dwmac ffbe0000.ethernet: IRQ eth_lpi not found
[    0.273888] rk_gmac-dwmac ffbe0000.ethernet: IRQ sfty not found
[    0.274520] rk_gmac-dwmac ffbe0000.ethernet: PTP uses main clock
[    0.275226] rk_gmac-dwmac ffbe0000.ethernet: clock input or output? (output).
[    0.275867] rk_gmac-dwmac ffbe0000.ethernet: Can not read property: tx_delay.
[    0.276491] rk_gmac-dwmac ffbe0000.ethernet: set tx_delay to 0x30
[    0.277026] rk_gmac-dwmac ffbe0000.ethernet: Can not read property: rx_delay.
[    0.278086] rk_gmac-dwmac ffbe0000.ethernet: set rx_delay to 0x10
[    0.278658] rk_gmac-dwmac ffbe0000.ethernet: integrated PHY? (no).
[    0.279249] Unable to handle kernel paging request at virtual address fffffffffffffffe
[    0.279948] Mem abort info:
[    0.280195]   ESR = 0x000000096000006
[    0.280523]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.280989]   SET = 0, FnV = 0
[    0.281287]   EA = 0, S1PTW = 0
[    0.281574]   FSC = 0x06: level 2 translation fault

where the invalid address is just -ENOENT (-2).

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index cf619a428664..26ec8ae662a6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1414,11 +1414,17 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
 	if (plat->phy_node) {
 		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
 		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
-		/* If it is not integrated_phy, clk_phy is optional */
+		/*
+		 * If it is not integrated_phy, clk_phy is optional. But we must
+		 * set bsp_priv->clk_phy to NULL if clk_phy isn't proivded, or
+		 * the error code could be wrongly taken as an invalid pointer.
+		 */
 		if (bsp_priv->integrated_phy) {
 			if (ret)
 				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
 			clk_set_rate(bsp_priv->clk_phy, 50000000);
+		} else if (ret) {
+			bsp_priv->clk_phy = NULL;
 		}
 	}
 
-- 
2.50.1


