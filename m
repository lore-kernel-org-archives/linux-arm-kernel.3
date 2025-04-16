Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F51C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qiJY99ai7mGDr2FC9ZGU82aOrwFyMKWX9y0r6QczlqM=; b=v1CfPTbVKWiQXTnmIPAoAWcVMq
	eOesf8Ea6E/bsQ++Qafvj8hGccmbUeELUUhGUA5xBK0tgKUOv0rOGSFS1t3bqOZBoGozydqt+/2g4
	+tlKj+M9Os2j6f6Bndqoshurteq9B+L10MTx/3SoaCeGy5R/dk/yAHEEpGo5k/Ac8f4FYbd+Jp50e
	SCWyax2+I2Lj0/50/yXJCgaEuIFZl6Fzhal26Qyr9ZlJau4aCCTrdR56vnvy+HhLwV3guczKIv5wl
	AMIsY4c3ZVrzQw2m1CxhBv/4Qk1z5HTNdk0V7q7YddUDfmV/ty8D5IiiHc0WLEqF+Uz3H87RfYjZZ
	myu43XHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u505I-00000009CqO-0Yxu;
	Wed, 16 Apr 2025 10:33:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4zim-000000095VU-3Qy6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 10:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qiJY99ai7mGDr2FC9ZGU82aOrwFyMKWX9y0r6QczlqM=; b=ev55wIti9sjkf3oCexLnb5YgA9
	R5WFBviTDjeT1r6A31bJxkwq2J1FXwdT8bKtrzAfM4VxqH5iklJwHzIr9gDt72WD8RECSkQYy1dwb
	OnHHcSXJ6qjXAOjIYix1PyTsgxLw0eXKiKRtSyDy/jPcIcKFtEFPHJqqeAFpsc3EyULQxhek18hIK
	Nr8Yijxe1F+TxA3GO5kOFBNH3SKhpelPQPQmCs4RFzPdhzgbt8GJRIVrZYfEV6cvg9Yh0+ZqhHCjk
	tpz6i4XvzAoJOT/VrmWWJ5SpFFiTq+MSfw5RGcFaONxXrsgCMIANsSve0Os43g0YmH68rbZSHtTQx
	8pwGmbfw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33274 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u4zic-00011J-2A;
	Wed, 16 Apr 2025 11:10:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u4zi1-000xHh-57; Wed, 16 Apr 2025 11:09:33 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next] net: stmmac: dwc-qos: use PHY clock-stop capability
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u4zi1-000xHh-57@rmk-PC.armlinux.org.uk>
Date: Wed, 16 Apr 2025 11:09:33 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_031020_863086_FC7B9F36 
X-CRM114-Status: UNSURE (   9.55  )
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

Use the PHY clock-stop capability when programming the MAC LPI mode,
which allows the transmit clock to the PHY to be gated. Tested on the
Jetson Xavier NX platform.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 583b5c071cd1..fa900b4991d0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -252,7 +252,8 @@ static int tegra_eqos_probe(struct platform_device *pdev,
 	plat_dat->fix_mac_speed = tegra_eqos_fix_speed;
 	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 	plat_dat->bsp_priv = eqos;
-	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE |
+			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
 
 	return 0;
 
-- 
2.30.2


