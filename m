Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55E3D39000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7XQtD4ZZy1AlRgnY2NBvRIuYo7CfUamYWsRaP8PSM0=; b=bvzEHR/otqgxbDzjtRx+Yoyfho
	xM1jmVFGhJhRRPq3gRvCppWiCyysiI8qWyrXCcxe8etlcaS6p31bQxLA8iIYhdP2vB6wvEkhSh1c7
	e0B0Te8Ecp4k+KljuV4qYt3SvL+R1Nfy+aRiFHPg2Aww2gbWYDTnmBw3X8ctOar/R4u6maQxqI60/
	ZgDb1CmbVRizIruNQMSRAKxdlO+2HOt0P1sww1ZvfUw6gT6BaIyn4/AawFFhQmyKMFeD4T7BvOHlV
	5NJ4EF1Xhklw6pTXg+9usvTiqyF2Erm8SMdqXxGozIj+8Tlk3OG8RZiJJTPeV9eLzPmgHHKtyaw/p
	Drdb7BTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg591-0000000AF3a-034j;
	Wed, 14 Jan 2026 17:58:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg58y-0000000AF2R-0rfo;
	Wed, 14 Jan 2026 17:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=L7XQtD4ZZy1AlRgnY2NBvRIuYo7CfUamYWsRaP8PSM0=; b=RGK7qFANrgIYOOtabUsKBkbzoi
	JRPNjii3f7uK+17HFmd1Zfs/8I8Cgtwje4MPJRek/My6kqwA5iz5Mz28aRTYkeGixR9xOSFoZO0Z2
	QHyeVxK1shBeeurpBVf1bSbQTbqWqMEUiZuuwpmwj0vVOMoq6hV9doFKOrniwdkDvVGYX2/ZQF6KI
	HpL1CGkXOD11c/j0dNRtOHgvmJ3RXOIdN2Nj8or80RMj+Tct4QnYFx/H1mndKGVNJWLzkQjP6iS6w
	i3StK4grFedWmh1f16MaXBAwbl3BYAlAOxXyMrjDRixgNaANozvYEoigrhegsJC0k8Ki4eJKFZwYc
	b+jg/l5Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41094 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vg4wj-000000000W2-2QJH;
	Wed, 14 Jan 2026 17:46:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vg4wc-00000003SGl-1dZi;
	Wed, 14 Jan 2026 17:46:10 +0000
In-Reply-To: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 12/14] net: stmmac: add support for reading inband
 SGMII status
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vg4wc-00000003SGl-1dZi@rmk-PC.armlinux.org.uk>
Date: Wed, 14 Jan 2026 17:46:10 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_095856_244881_12C125C1 
X-CRM114-Status: GOOD (  13.44  )
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

Report the link, speed and duplex for SGMII links, read from the
SGMII, RGMII and SMII status and control register.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 44 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |  4 ++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 73fc56ce5e55..12fc5038d913 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -17,6 +17,16 @@
 #define GMAC_ANE_LPA	0x0c	/* ANE link partener ability */
 #define GMAC_TBI	0x14	/* TBI extend status */
 
+/*
+ * RGSMII status bitfield definitions.
+ */
+#define GMAC_RGSMIII_LNKMOD		BIT(0)
+#define GMAC_RGSMIII_SPEED_MASK		GENMASK(2, 1)
+#define GMAC_RGSMIII_SPEED_125		2
+#define GMAC_RGSMIII_SPEED_25		1
+#define GMAC_RGSMIII_SPEED_2_5		0
+#define GMAC_RGSMIII_LNKSTS		BIT(3)
+
 static enum ethtool_link_mode_bit_indices dwmac_hd_mode_bits[] = {
 	ETHTOOL_LINK_MODE_10baseT_Half_BIT,
 	ETHTOOL_LINK_MODE_100baseT_Half_BIT,
@@ -97,7 +107,7 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 					   struct phylink_link_state *state)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
-	u32 status, lpa;
+	u32 status, lpa, rgsmii;
 
 	status = readl(spcs->base + GMAC_AN_STATUS);
 
@@ -111,7 +121,35 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
 
 		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
 	} else {
-		state->link = false;
+		rgsmii = field_get(spcs->rgsmii_status_mask,
+				   readl(spcs->rgsmii));
+		state->link = !!(status & GMAC_RGSMIII_LNKSTS);
+
+		if (state->link && neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
+			/* FIXME: fill in speed and duplex. This requires the
+			 * contents of the dwmac1000 GMAC_RGSMIIIS or dwmac4
+			 * GMAC_PHYIF_CONTROL_STATUS register.
+			 */
+			state->duplex = rgsmii & GMAC_RGSMIII_LNKMOD ?
+					DUPLEX_FULL : DUPLEX_HALF;
+			switch (FIELD_GET(GMAC_RGSMIII_SPEED_MASK, rgsmii)) {
+			case GMAC_RGSMIII_SPEED_2_5:
+				state->speed = SPEED_10;
+				break;
+
+			case GMAC_RGSMIII_SPEED_25:
+				state->speed = SPEED_100;
+				break;
+
+			case GMAC_RGSMIII_SPEED_125:
+				state->speed = SPEED_1000;
+				break;
+
+			default:
+				state->link = false;
+				break;
+			}
+		}
 	}
 }
 
@@ -205,6 +243,8 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
 
 	spcs->priv = priv;
 	spcs->base = priv->ioaddr + pcs_info->pcs_offset;
+	spcs->rgsmii = priv->ioaddr + pcs_info->rgsmii_offset;
+	spcs->rgsmii_status_mask = pcs_info->rgsmii_status_mask;
 	spcs->int_mask = pcs_info->int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index a7c71f40f952..f9e7a7ed840b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -29,12 +29,16 @@ struct stmmac_priv;
 
 struct stmmac_pcs_info {
 	unsigned int pcs_offset;
+	unsigned int rgsmii_offset;
+	u32 rgsmii_status_mask;
 	u32 int_mask;
 };
 
 struct stmmac_pcs {
 	struct stmmac_priv *priv;
 	void __iomem *base;
+	void __iomem *rgsmii;
+	u32 rgsmii_status_mask;
 	u32 int_mask;
 	phy_interface_t interface;
 	struct phylink_pcs pcs;
-- 
2.47.3


