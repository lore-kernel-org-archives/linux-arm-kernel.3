Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA259CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 18:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sn1ZFDSzFJkLngEARJHuY22uH7yWKmAMVE2CXHexSEU=; b=spQF7mFyhb+4e753AXp7Vhsc1r
	Juhe1jB3++m8HKW2fGhU3D18NTqPWUdc9t8S/X01xW/spVIUP8nOGn8cug2eLsQuiqtdQGsakRYZt
	/EDq5DRaMahruw3A2HNIh5utX8imf511S9VGQfaUHB4AeUh6SzwxA/VJk1E09wh7cUwoTaGO20IKI
	GBBcdh32oKB9wHGkcrbu3lNGZrhursGXl8S0dNuQYvjYXzGHOoJ4rjpqgcW5XGDnVMKhhcX/aDTbi
	O0ibVA7vmOyUhVuVfkLI4/VKN4kW+2AACWi9ofweULytipwSwboaALHY2USd5h+E+q78QK/ZrgKMN
	6fXQJ6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1UBV-00000002bVS-2pVH;
	Wed, 24 Sep 2025 18:25:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1UBT-00000002bUe-1UIt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 18:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sn1ZFDSzFJkLngEARJHuY22uH7yWKmAMVE2CXHexSEU=; b=BtRj6eF+6JrnR1YG/J8gq97YlH
	VCNiGny7IrJF4Q2gjOWggpL8oHKIFK29idUmAx2uuwxkvySflCSWoYDLfhiDHVTGiKULrgjsuMwbb
	xjzXg83E9c36erK/rbEtw2y63PVGyYwzJrJXYnfC9lHSKSiYzk8whC7IlnfGhKenYOxtWc//yriem
	YWLIbQsDsZic2xc8Xif4z+tg5yUTybUNhAJufQaDMc07qJhMpMGwyQTgInmJxkkbtc+UfuA39I5yV
	mKn4+bBhQtSj5V1W6EuPny87rE0DWkO8V35QjnjynyuDIQLaplzyRwaUg1cr7gHA771xbGha60qwo
	DUoDClbQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55598 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v1U6N-0000000013B-49A0;
	Wed, 24 Sep 2025 19:20:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v1U6E-00000007HwL-0Z32;
	Wed, 24 Sep 2025 19:20:18 +0100
In-Reply-To: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	"Alexis Lothor__" <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH RFC net-next 8/9] net: stmmac: only call stmmac_pcs_ctrl_ane()
 for integrated SGMII PCS
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v1U6E-00000007HwL-0Z32@rmk-PC.armlinux.org.uk>
Date: Wed, 24 Sep 2025 19:20:18 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_112543_392378_C7B31115 
X-CRM114-Status: GOOD (  13.40  )
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

The internal PCS registers only exist if the core is synthesized with
SGMII, TBI or RTBI support. They have no relevance for RGMII.

However, priv->hw->pcs contains a STMMAC_PCS_RGMII flag, which is set
if a PCS has been synthesized but we are operating in RGMII mode. As
the register has no effect for RGMII, there is no point calling
stmmac_pcs_ctrl_ane() in this case. Add a comment describing this
and make it conditional on STMMAC_PCS_SGMII.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index dff3bba83969..fb5a51d16897 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3519,7 +3519,11 @@ static int stmmac_hw_setup(struct net_device *dev)
 		}
 	}
 
-	if (priv->hw->pcs)
+	/* The PCS control register is only relevant for SGMII, TBI and RTBI
+	 * modes. We no longer support TBI or RTBI, so only configure this
+	 * register when operating in SGMII mode with the integrated PCS.
+	 */
+	if (priv->hw->pcs & STMMAC_PCS_SGMII)
 		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->reverse_sgmii_enable);
 
 	/* set TX and RX rings length */
-- 
2.47.3


