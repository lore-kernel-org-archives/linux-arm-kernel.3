Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D2BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vidd5Mwuud0O74OKZ9sShwKBhSuUdh8tZ63bfpDXEkw=; b=V21BBS4zyChh/jF/hjqBL9ImQe
	b+hHDIW5DTpzw6VdftgsR9BE1TN+mjbSedjVXx3RoD207efaXKoKeidiuHjXXEXiKlc4Q7odi78Ol
	nMwxycRo79KIN0Ca/gS04Jt7MoIlrkqhzsnpvhByNoIdFfRJXJz60520SunQka5oKbYz3i8KoNeVZ
	Y78A8oI7mVV1Pcptb2Qzkx+ofL4d8FamSSliVZwmAE5Z35LpXBD0t9z1txgj07MANJGlDE8pBMFuP
	/GuSe1aX88X1ufsmmui0r+k9VYNNvX2X9iF0Pv3bz+6DbhqPXKtGnmWl3MVZ1pG7qfBxBZMLBhvBQ
	zKG2uRCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjU1-00000006kgw-1jrW;
	Tue, 11 Nov 2025 08:12:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjTz-00000006kf3-0cBc;
	Tue, 11 Nov 2025 08:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vidd5Mwuud0O74OKZ9sShwKBhSuUdh8tZ63bfpDXEkw=; b=Nhv1qS7iyrCJh4QAbtgUFQ+jMt
	+OtyvyZDuNkK9jULhYYhPxsG88mAcsl8xBkJCWMBkVQFAgHjNPHWi3yzKkBdNYb8pQAD2zPuU6fXs
	WhQuIRmGnj0uLEie84/VoIZYQ7lt6kP+cee8mTVAuRBZ64RgiqAlPLP9HGZ2ORjHeTk4/qHw4eSI+
	nagqoLhCZvR/hom91aVbfoCju2MP2gWA8jwh7IvCDlLmyE8rErsDKnmFRdwmW009KuJQGuy85eWmb
	+kFIaVl85LqXvmB0KM5gsGzo9xWL6RT9PNWRyFAuv1o8hMT7z/y+KWIjQ+ysdmbIPzq+4FRtIlI33
	c1gc94Yg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56912 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjTq-0000000029x-3ADd;
	Tue, 11 Nov 2025 08:11:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjTp-0000000DqtC-2DmI;
	Tue, 11 Nov 2025 08:11:57 +0000
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 03/13] net: stmmac: loongson1: use
 stmmac_get_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjTp-0000000DqtC-2DmI@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:11:57 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_001207_186551_3365C96F 
X-CRM114-Status: GOOD (  11.70  )
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

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value, validate the result and use that to set the
control register to select the operating mode for the DWMAC core.

Note that this will allow GMII as well as MII as the phy_intf_sel
value is the same for both.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 5f9f66fbc191..894ee66f5c9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -140,14 +140,9 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 	struct regmap *regmap = dwmac->regmap;
 	int phy_intf_sel;
 
-	switch (plat->phy_interface) {
-	case PHY_INTERFACE_MODE_MII:
-		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
-		break;
-	case PHY_INTERFACE_MODE_RMII:
-		phy_intf_sel = PHY_INTF_SEL_RMII;
-		break;
-	default:
+	phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_interface);
+	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII) {
 		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
 			plat->phy_interface);
 		return -EOPNOTSUPP;
-- 
2.47.3


