Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6001CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaUd4tWFZNUKcPxnE7KNdvYW06fqH0+s6HREJdLSzmQ=; b=FvvR6Bdf6h3upX5mgy7LC1Z8Ni
	hKffgfGkBBRN21VV/eQDXU421AtwwP+O+L8YD1qLzqbk0tpN9FuvKUa/LE5gVzGk0Hd5ChcKBVHiP
	8BezCJZlggW0FdsVXeh92crm7YwH4N8xkWS44/1saf1xJpOmb2zOVfzKKmZdxPjA46lS8xxAyvsmA
	MCcuo8EwErWzTPbbeuy7P5k7AGtY9OHuD9s/UCNt3VoqyUVn+WCTXIXBLRKjUT2Vq5zBYKUiuRKMc
	idSlEfhCCF/K5X8iuPYsDAhK4H9E4KWvwSI3ogpdG/8zCDXgZO0xvYkEJ9dJ5NBh2jPx9gF0wRGa+
	oNFFGA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92Ut-00000001sbm-2Q9l;
	Wed, 15 Oct 2025 14:28:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92Uq-00000001sZH-2ukm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aaUd4tWFZNUKcPxnE7KNdvYW06fqH0+s6HREJdLSzmQ=; b=VXEYYjC9FYzhm8DfEcHVVCdcvC
	DTBEQrBNMkmHoLbTuNdF9ytUM83G0bfKuyXJctRaxJHhY9xjuEJ3YcgaqZubRsJXZTqewOtyC3pBO
	xVDhK8u0El36GrgatZLs9b7JLcc69MYjCZONELmE+J45cInBU8RPzmYJDcrfU2/0QTCAbzGv6bx64
	ZOt0Aw6cwwSDwwU07u9pMhVK1hAdqqjVa+Vw6DwIF7ZjB8M9epfY06LKI2lUuYeI8+a7n9TtafOll
	YUeXivdsF2WoG1qBuDVhCYhQPaLiGS05R0Wm0n0U3c8ZgAnvbZx5DhqOnCjN4YOnLEnlCH5GD6y5Q
	2SejqPkA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46036 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v92N7-000000004gb-2Of4;
	Wed, 15 Oct 2025 15:20:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v92Mt-0000000AmHF-3AQR;
	Wed, 15 Oct 2025 15:20:43 +0100
In-Reply-To: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
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
Subject: [PATCH net-next 09/14] net: stmmac: simplify stmmac_check_pcs_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v92Mt-0000000AmHF-3AQR@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 15:20:43 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_072856_764617_DEA024CD 
X-CRM114-Status: GOOD (  12.50  )
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

Now that we only support one mode, simplify stmmac_check_pcs_mode().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 013a2f3684c7..611197cfa34f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1086,22 +1086,23 @@ static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 {
 	int interface = priv->plat->phy_interface;
+	int speed = priv->plat->mac_port_sel_speed;
 
 	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII) {
 		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
 		priv->hw->pcs = STMMAC_PCS_SGMII;
-	}
-
-	/* PS and related bits will be programmed according to the speed */
-	if (priv->hw->pcs) {
-		int speed = priv->plat->mac_port_sel_speed;
 
-		if ((speed == SPEED_10) || (speed == SPEED_100) ||
-		    (speed == SPEED_1000)) {
+		switch (speed) {
+		case SPEED_10:
+		case SPEED_100:
+		case SPEED_1000:
 			priv->hw->ps = speed;
-		} else {
+			break;
+
+		default:
 			dev_warn(priv->device, "invalid port speed\n");
 			priv->hw->ps = 0;
+			break;
 		}
 	}
 }
-- 
2.47.3


