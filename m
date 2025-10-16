Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12423CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnT7JfBCNmEWz2g/aWwe7MrIzD7zex1wxEX8kYAK9Sc=; b=tcz40c+saqRnPLGYiaE3H0K5fZ
	EbJDSMwdDHK3/umXgEGhxVaIS6azRHEKh7s6Jmi3SEiF6LDijenQQkTqp/KRKG+iTOj7MEVOaXbKl
	aG5hBzzRDWGU6XRaKioEQgCw1RkNMs3AkCoYFebDcozgYBt+cxc9Hsn7AUWezrw7nnCjqTi8ZrYm0
	ekjMnQmDVdJ/2qrGimgMUN6KFM/BR3MwH806mZRGnKwNDJfOYHimbWt2NxkyRFx6Ut3VzmRSDoS7H
	jzkTy7lUXq5EXnyw7O1kWVyXeXMdFp3aLABKnAQlow92bXMTCcbxdUIjwJZT+j1Qqq7CEBiKwmLHT
	OGfVi+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9P7N-000000051Xz-0Aub;
	Thu, 16 Oct 2025 14:38:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9P7L-000000051WM-0dt6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 14:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LnT7JfBCNmEWz2g/aWwe7MrIzD7zex1wxEX8kYAK9Sc=; b=z8riJzNuyWE9CUM7x2goHSVE0x
	O9p6i28HE1cKlvCUKzFiAa9YV2+4cEXsuTtnWbvH7VmhLA/MJdVzYMlRNkoo5Z5Rsp2KAde573QCm
	vVxZA94FsXur9yzXH+QCc7EKpOScJkUdFn4GdGfc3K5F3RUK2s9KOZ0Tk3ASNBjkY4E60zeC9N6UW
	JrvmH18WIxP2V9IogMnfHTag9ZOdp5tSGfnrJzx6uFen6+iXEMGJZNI8hQPGHId09srliJvkoEFw+
	CijY6+YSU6wqQ/igDzn7RGDMgeMlLSIEJF6Om3ds+NIVQI3a/a6JwMbx+IbsK5ePWE8fosGsJ9+VC
	vjB5DKNQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40658 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v9P6G-000000006Qj-47y7;
	Thu, 16 Oct 2025 15:37:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v9P6D-0000000AolU-2zjv;
	Thu, 16 Oct 2025 15:37:01 +0100
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
Subject: [PATCH net-next v2 04/14] net: stmmac: remove PCS "mode" pause
 handling
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v9P6D-0000000AolU-2zjv@rmk-PC.armlinux.org.uk>
Date: Thu, 16 Oct 2025 15:37:01 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_073811_194823_0E37AFEF 
X-CRM114-Status: GOOD (  11.63  )
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

Remove the "we always autoneg pause" forcing when the stmmac driver
decides that a "PCS" is present, which blocks passing the ethtool
pause calls to phylink when using SGMII mode.

This prevents the pause results being reported when a PHY is attached
using SGMII mode, or the pause settings being changed in SGMII mode.
There is no reason to prevent this.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c    | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index d89662b48087..c60cd948311e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -424,11 +424,7 @@ stmmac_get_pauseparam(struct net_device *netdev,
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
 
-	if (priv->hw->pcs) {
-		pause->autoneg = 1;
-	} else {
-		phylink_ethtool_get_pauseparam(priv->phylink, pause);
-	}
+	phylink_ethtool_get_pauseparam(priv->phylink, pause);
 }
 
 static int
@@ -437,12 +433,7 @@ stmmac_set_pauseparam(struct net_device *netdev,
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
 
-	if (priv->hw->pcs) {
-		pause->autoneg = 1;
-		return 0;
-	} else {
-		return phylink_ethtool_set_pauseparam(priv->phylink, pause);
-	}
+	return phylink_ethtool_set_pauseparam(priv->phylink, pause);
 }
 
 static u64 stmmac_get_rx_normal_irq_n(struct stmmac_priv *priv, int q)
-- 
2.47.3


