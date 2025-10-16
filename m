Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C09CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKZGKGy/Hhc0gUrzCRXsRGfkbT59NKMuOwnA6gRxZjc=; b=UBOEa01Q9zJFv90HkAe6sjeqaV
	dknaO5ozP9S5tCuPvL5abvjCmPS3pVyD6C35CKPpYGljT/j/mATDid0kqHWViYCFnfruYTsmlLIhz
	fqgpMk/s04i59Moi5WqdJO/rQUWsMPaPRejDNVm0PEjnX5c3hnbGGJM4haQ+769zh7vYsgvdD+0Co
	4ZlENFxd9nxgLMSp2hz9YocpN6cXYhv5P3UIk3yHTZxq4oroS6KpFhevtA+nIMAAPjcvHwEY+vXMf
	049+sb9cJU1UFzV6DvlBmBqB9iwBRsjK9hfcai2PsLmbGgeOSib26wiItz/1xEvudKneZ8hMIc29N
	ZGHPtncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9P7k-000000051lm-1M0Z;
	Thu, 16 Oct 2025 14:38:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9P7f-000000051gp-01cB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 14:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zKZGKGy/Hhc0gUrzCRXsRGfkbT59NKMuOwnA6gRxZjc=; b=CjXOylw28mx9iSDQpfU74yDKsJ
	XWP3yFEZ+aev9rG07hI86dRj71356k7+B8UGfdKSXHiD6P5ni3RPxUpWe9Mtnc8Jcw3lAu+eFBKQL
	c8qNNH6QnftrxCDEiemSWfM8taGRu0y0ec/dmmWORLdsOoVApJIF3bjt8tnL6RgQk5fRlRQjXA0x5
	UUakKRuesSOR6kHUD1Aq74UHjyvs5zcvk2hmiT5Imw2zcWQ10thpDf8Aer8jCK0RbyMV9nnri7CWG
	k7y67VyswX9RSrQLkhVPo2IeHSIb38MFr0/MBHlqgmetkhjG3nerqY4UwUpT7iO3hgFlgiRL7zN+R
	jN/8I+Mw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53902 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v9P6e-000000006Rb-47Xm;
	Thu, 16 Oct 2025 15:37:29 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v9P6Y-0000000Aolr-0vLH;
	Thu, 16 Oct 2025 15:37:22 +0100
In-Reply-To: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
References: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>,
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
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
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
Subject: [PATCH net-next v2 08/14] net: stmmac: move reverse-"pcs" mode setup
 to stmmac_check_pcs_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v9P6Y-0000000Aolr-0vLH@rmk-PC.armlinux.org.uk>
Date: Thu, 16 Oct 2025 15:37:22 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_073831_176885_6CC64935 
X-CRM114-Status: GOOD (  14.95  )
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

The broken reverse-mode, selected by snps,ps-speed, is configured when
the platform provides a valid port speed and a PCS is being used.

Both these remain constant after the driver has probed, so the software
state doesn't need to be re-initialised each time stmmac_hw_setup() is
called (which is called at open and resume time.)

Move the software setup of reverse-mode to stmmac_check_pcs_mode()
which is called from the driver probe function.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d440b1c2b7ff..013a2f3684c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1091,6 +1091,19 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
 		priv->hw->pcs = STMMAC_PCS_SGMII;
 	}
+
+	/* PS and related bits will be programmed according to the speed */
+	if (priv->hw->pcs) {
+		int speed = priv->plat->mac_port_sel_speed;
+
+		if ((speed == SPEED_10) || (speed == SPEED_100) ||
+		    (speed == SPEED_1000)) {
+			priv->hw->ps = speed;
+		} else {
+			dev_warn(priv->device, "invalid port speed\n");
+			priv->hw->ps = 0;
+		}
+	}
 }
 
 /**
@@ -3435,19 +3448,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 	stmmac_set_umac_addr(priv, priv->hw, dev->dev_addr, 0);
 	phylink_rx_clk_stop_unblock(priv->phylink);
 
-	/* PS and related bits will be programmed according to the speed */
-	if (priv->hw->pcs) {
-		int speed = priv->plat->mac_port_sel_speed;
-
-		if ((speed == SPEED_10) || (speed == SPEED_100) ||
-		    (speed == SPEED_1000)) {
-			priv->hw->ps = speed;
-		} else {
-			dev_warn(priv->device, "invalid port speed\n");
-			priv->hw->ps = 0;
-		}
-	}
-
 	/* Initialize the MAC Core */
 	stmmac_core_init(priv, priv->hw, dev);
 
-- 
2.47.3


