Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B131CC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9xXxUzUX+TUWMXEkJbgV4+Ep7ihUDZRCg/hLrHFB4Ds=; b=y/tya7gl9JB06KlyyOcB/hwgxr
	gTy2H3g5rQL0BFpBlshO2tVEvvZP0dMW36uhTCl0xuRE+9Xf1lrWwVYHN1lsyw9Gpnyw4nYBYsw5h
	S2xutlwbw7JyhSZwXxLmAQsE9vXdSUWdEAADwdGO9TXqQjn+022PDh3tG+045OGDH2XBtBo2lOx30
	k5Y0M5eas1TcxiNYCSs37tAGPW4mX6UECRBVO3gV6mgekIhNaCZG6yAbxicVRsoAwUrwjp/WfyUZU
	OUsp9752E6ZQCIBdCO7g9sxV4ZqzwWzcBMHK7gwkUqcCHCUHaP2F80n1oRsbFmnbZaEXYucGGbDLZ
	1Tuu0s0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLb7-00000000w6T-23zb;
	Tue, 04 Feb 2025 16:16:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLZL-00000000voG-01ue;
	Tue, 04 Feb 2025 16:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C05855C5940;
	Tue,  4 Feb 2025 16:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0B5C4CEDF;
	Tue,  4 Feb 2025 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738685673;
	bh=GBcXB5AV6YtR0BMwlaL9meSZs1urR7n3hkq4NxMztr0=;
	h=From:To:Cc:Subject:Date:From;
	b=opORp5jEQEYA6NkXiV8/hFMEVuSB7q/VlDuVWp8REJ4ZjfSqvZb5l0Upl5IXfCCH7
	 h7Uh5Zz1M0YBxtxPhmYaXKeQQj5+Llifb0K7gMlMG72jyHp8XIvlXiqr4xN2N983Dn
	 DHUwmyW9VzkYX84vEAazeN/kDbkU3wYQ377Q4ezuEXltPpPRbrnIgWG1o5KG0Ipo+d
	 KaqI/DfCDrCYTBVyLFIJqM5Jh3fjME/d78qO5yhohJC9OIdEAfeFafK9jbjxberwTO
	 smfveWlyGMOoZwN9FhcS5j6QO7NePSUHonJk7qx9WRZP31Lb/x1WJ4UDRgRAzBtY4h
	 nx+co3ay1oe0A==
Received: by wens.tw (Postfix, from userid 1000)
	id 1F16D5FB49; Wed,  5 Feb 2025 00:14:29 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Steven Price <steven.price@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH netdev] net: stmmac: dwmac-rk: Provide FIFO sizes for DWMAC 1000
Date: Wed,  5 Feb 2025 00:13:59 +0800
Message-Id: <20250204161359.3335241-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_081435_132830_0B7EDC5D 
X-CRM114-Status: GOOD (  16.84  )
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

From: Chen-Yu Tsai <wens@csie.org>

The DWMAC 1000 DMA capabilities register does not provide actual
FIFO sizes, nor does the driver really care. If they are not
provided via some other means, the driver will work fine, only
disallowing changing the MTU setting.

The recent commit 8865d22656b4 ("net: stmmac: Specify hardware
capability value when FIFO size isn't specified") changed this by
requiring the FIFO sizes to be provided, breaking devices that were
working just fine.

Provide the FIFO sizes through the driver's platform data, to not
only fix the breakage, but also enable MTU changes. The FIFO sizes
are confirmed to be the same across RK3288, RK3328, RK3399 and PX30,
based on their respective manuals. It is likely that Rockchip
synthesized their DWMAC 1000 with the same parameters on all their
chips that have it.

Fixes: eaf4fac47807 ("net: stmmac: Do not accept invalid MTU values")
Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when FIFO size isn't specified")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
The reason for stable inclusion is not to fix the device breakage
(which only broke in v6.14-rc1), but to provide the values so that MTU
changes can work in older kernels.

Since a fix for stmmac in general has already been sent [1] and a revert
was also proposed [2], I'll refrain from sending mine.

[1] https://lore.kernel.org/all/20250203093419.25804-1-steven.price@arm.com/
[2] https://lore.kernel.org/all/Z6Clkh44QgdNJu_O@shell.armlinux.org.uk/

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index a4dc89e23a68..71a4c4967467 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1966,8 +1966,11 @@ static int rk_gmac_probe(struct platform_device *pdev)
 	/* If the stmmac is not already selected as gmac4,
 	 * then make sure we fallback to gmac.
 	 */
-	if (!plat_dat->has_gmac4)
+	if (!plat_dat->has_gmac4) {
 		plat_dat->has_gmac = true;
+		plat_dat->rx_fifo_size = 4096;
+		plat_dat->tx_fifo_size = 2048;
+	}
 	plat_dat->fix_mac_speed = rk_fix_speed;
 
 	plat_dat->bsp_priv = rk_gmac_setup(pdev, plat_dat, data);
-- 
2.39.5


