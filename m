Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB537106B504
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 21:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=736NYNKr6ApRpQd5RQEvsnEbmkHaESeFFIpzci+utDo=; b=UBHHnBtYroMusESMuINJXNWh1s
	+YB0SVKGxmbPwFKcR9j8SpTi/jL239Go6HBs52BZuu8W0q3tdbXlNAmad8SfEP25fKL/3MWxHd9Np
	lzG9T0KvBNm4cXxhwyTO5fZrv1U+hppPtiDNMbLqOPbVCblzyY6zIH5JrksZFfJ5X1MGoYWhmB1nH
	GFnbUtYEouThs7wvmWQ58STWjFO/jAY4rIC6J0fDv68v9iZ++/+kLn7mcCwL7FE6bfMwddvZU5YjT
	aFhozQH246VcemQcd1LFxHWusuE+FIGbqIZSCeOkvIL6vZuaaakXBlXezoFm5JsFYViQL2fCEN2UN
	jFQnX3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5VKq-00000004F8I-0FJ0;
	Wed, 25 Mar 2026 21:00:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5VKi-00000004F66-3chu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 21:00:10 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 753B110BE;
	Wed, 25 Mar 2026 21:58:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774472328;
	bh=uhvdnmchC4jixzW3Wk39sk79fdXsxC4p3IBrIJP41Ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XR/tiFx7dgzNGoU7/rcVmYQbWiWv2B5vGVQcBO9MM+76rTCVeS69iBfAW3WH/3+Y7
	 AKpRdiVOAoBOHYm+lBIq+NyzsPGj/S8qJLTQnwWfcW9liYzWLXbXs8YYbipNwcLG96
	 vLaiAaf04Kr9HdozRfwDTWN9fSD7nw9asTvpk3aY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: netdev@vger.kernel.org,
	imx@lists.linux.dev
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Joy Zou <joy.zou@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v4 1/2] net: stmmac: provide flag to disable EEE
Date: Wed, 25 Mar 2026 23:00:02 +0200
Message-ID: <20260325210003.2752013-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325210003.2752013-1-laurent.pinchart@ideasonboard.com>
References: <20260325210003.2752013-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_140009_045520_C1085976 
X-CRM114-Status: GOOD (  19.00  )
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

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Some platforms have problems when EEE is enabled, and thus need a way
to disable stmmac EEE support. Add a flag before the other LPI related
flags which tells stmmac to avoid populating the phylink LPI
capabilities, which causes phylink to call phy_disable_eee() for any
PHY that is attached to the affected phylink instance.

iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
along with the main dwmac interrupts. Since lpi_intr_o is synchronous
to the receive clock domain, and takes four clock cycles to clear, this
leads to interrupt storms as the interrupt remains asserted for some
time after the LPI control and status register is read.

This problem becomes worse when the receive clock from the PHY stops
when the receive path enters LPI state - which means that lpi_intr_o
can not deassert until the clock restarts. Since the LPI state of the
receive path depends on the link partner, this is out of our control.
We could disable RX clock stop at the PHY, but that doesn't get around
the slow-to-deassert lpi_intr_o mentioned in the above paragraph.

Previously, iMX8MP worked around this by disabling gigabit EEE, but
this is insufficient - the problem is also visible at 100M speeds,
where the receive clock is slower.

There is extensive discussion and investigation in the thread linked
below, the result of which is summarised in this commit message.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Closes: https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart@ideasonboard.com
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Tested-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 ++++++-
 include/linux/stmmac.h                            | 13 +++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9b6b49331639..ce51b9c22129 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1438,7 +1438,12 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 				 config->supported_interfaces,
 				 pcs->supported_interfaces);
 
-	if (priv->dma_cap.eee) {
+	/* Some platforms, e.g. iMX8MP, wire lpi_intr_o to the same interrupt
+	 * used for stmmac's main interrupts, which leads to interrupt storms.
+	 * STMMAC_FLAG_EEE_DISABLE allows EEE to be disabled on such platforms.
+	 */
+	if (priv->dma_cap.eee &&
+	    !(priv->plat->flags & STMMAC_FLAG_EEE_DISABLE)) {
 		/* The GMAC 3.74a databook states that EEE is only supported
 		 * in MII, GMII, and RGMII interfaces.
 		 */
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 5b2bece81448..e62d21afd56d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -207,12 +207,13 @@ enum dwmac_core_type {
 #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
 #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
 #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
-#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
-#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
-#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
-#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
-#define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)
-#define STMMAC_FLAG_SERDES_SUPPORTS_2500M	BIT(15)
+#define STMMAC_FLAG_EEE_DISABLE			BIT(10)
+#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(11)
+#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(12)
+#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(13)
+#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(14)
+#define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(15)
+#define STMMAC_FLAG_SERDES_SUPPORTS_2500M	BIT(16)
 
 struct mac_device_info;
 
-- 
Regards,

Laurent Pinchart


