Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4524CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzAz2OSqG2eLqXJWaxdsurWbDprdWOWwtQP4/q9dLmg=; b=bc9klvkr7rklRhWXDFmBDMzU3b
	6LKSvc9blq2/Z+PGrt0Yl3hT56Oey8rp2VkCmyW9T3AQFKynVQvABKYZWKwcXYni4KDExYZvIfvRp
	X9hluWWzHrx+kRvdFQLEqTYC5V8kMfVFosrka78aEH+lLVpyLf3EpvhDL3jc/BDi60CDlavrEodO9
	kSMns1GjhJLtI4yv6MZFp7GHreiFqYuHopsnID3FsRbY3bLQFjb8dGSMdqLp497SZrWc0a03QonOS
	rR6doDJR7uiE20dsaYunQo3np1iHB26wkaF/VeLJCn/QJbMYLZY+KLZkyxgy+bMxktxwMH51kRZw7
	6oYgQLlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNRr-0000000HTp7-3jkI;
	Fri, 07 Nov 2025 14:28:19 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNRp-0000000HTm3-3cLb;
	Fri, 07 Nov 2025 14:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bzAz2OSqG2eLqXJWaxdsurWbDprdWOWwtQP4/q9dLmg=; b=bbtIfqncB6v4yv+kZZ3WAE3NNM
	dmGVwl2QOAEYbA7duVnU4ykCpRBqRWhFDVsRJ2py5yA6hD+x/Wo4xu5wbls23NKQ19dRB+f1VVPr+
	EiITc7Hu5BzM0AUdziWI2X0pQwEXSMgFMayYCsa7IUaDDVlad1kI43QYJxWGIYyJWwiaDAIdQp+kh
	+3sWI54VdfIncpKwrgKtbABt8KC3d0DoXEXvWRS7fA7PGt5ER6MJAHN0vjjk5Qjsr820G2Cj+Ymzl
	/vHA1x963+3uoEg3zYHFH2LqX6qvnyqbqrZthQs8s/QNirKiQjjx8qY7WhTsxbwGtoeSpsdWWYYNO
	AAfFKv0g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42702 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNRi-000000006ev-0Mjd;
	Fri, 07 Nov 2025 14:28:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNRh-0000000DkS1-0fl2;
	Fri, 07 Nov 2025 14:28:09 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
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
	Jerome Brunet <jbrunet@baylibre.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 02/16] net: stmmac: loongson1: use PHY_INTF_SEL_x
 directly
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHNRh-0000000DkS1-0fl2@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:09 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_062817_910988_76188025 
X-CRM114-Status: GOOD (  10.11  )
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

Use the PHY_INTF_SEL_xx values directly in ls1c_dwmac_syscon_init(),
converting them to the PHY_INTF_SELI bitfield when calling
regmap_update_bits().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 09e2af1d778a..5f9f66fbc191 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -38,8 +38,6 @@
 #define GMAC_SHUT		BIT(6)
 
 #define PHY_INTF_SELI		GENMASK(30, 28)
-#define PHY_INTF_MII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_GMII_MII)
-#define PHY_INTF_RMII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_RMII)
 
 struct ls1x_dwmac {
 	struct plat_stmmacenet_data *plat_dat;
@@ -140,15 +138,14 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 	struct ls1x_dwmac *dwmac = priv;
 	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
 	struct regmap *regmap = dwmac->regmap;
+	int phy_intf_sel;
 
 	switch (plat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
-				   PHY_INTF_MII);
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
-				   PHY_INTF_RMII);
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		break;
 	default:
 		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
@@ -156,6 +153,8 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 		return -EOPNOTSUPP;
 	}
 
+	regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
+			   FIELD_PREP(PHY_INTF_SELI, phy_intf_sel));
 	regmap_update_bits(regmap, LS1X_SYSCON0, GMAC0_SHUT, 0);
 
 	return 0;
-- 
2.47.3


