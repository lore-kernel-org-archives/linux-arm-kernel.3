Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627C8CCF2EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4mH3g/zSTI5za2Co5TGmPZaih2+LgJ1+of5pexeceY=; b=2a0xrFzuwQnUaUjz5lGu8Agz6z
	GtUsG+7CSEdXebp+8fhxlypw2BlBKm0pB7d4UU/JiNxoSihZ8ywoH3ra0KrdRYO1eJlEls0Nks9Lo
	t+ajDAF7tNzSgW3knMICqv4n9rpCAXRdDcsTd3IPiuvXCJjS464k707jWRbuN0w7YUcPI9BJmv/l6
	J2e09+mOYHT0b/8KJZpUfz6G1eKfJYWn4CKy5EqSMDmoDtSBKCvEmqGsjECJHtmSiK8nfDupT+H8K
	jchRRkQKoFfRrkKG3/NYcfMqr7HN4+OncctKOnZwzriqKjC0AkgzLXKGJM4Ko9TtnikPbB480gjE7
	/uHu1o4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoSr-0000000218C-01AH;
	Mon, 19 Jan 2026 12:34:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoSi-000000020yu-1A1K;
	Mon, 19 Jan 2026 12:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T4mH3g/zSTI5za2Co5TGmPZaih2+LgJ1+of5pexeceY=; b=RQiL2xUykqaKrU1gYh2Pobg/hb
	agu6bWAmAKPA+4g7EWe/vvP+fyubs/Y04+Tn7l/bHnzKePnLWkpBDlF3C9SIqa6iHnEP5flM10KAk
	O7xTxKPll/d71KnpQ7VY7i1+9Q6fLnPGF4z8Wfhwja6fp8FppdAp8EKJkz9HwjoAbg9fnAs90qMer
	IH+hBz6jFOAM6RYpGGCY2CAfNepZCRHC3iPpQA1k9rXzHNdjuOCMkZxAXDCNgFRKFVLFeqznW++a4
	jy/luY51WXcSwTbmxZc0pCdpmWcCfQI136re/y/4EDqLE3Y6+ukn1nX8jpdgxISRcufBEoKCzDJsk
	/d4PC4lg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46520 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vhoSU-0000000053H-3P3y;
	Mon, 19 Jan 2026 12:34:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vhoSR-00000005H1q-3Ufj;
	Mon, 19 Jan 2026 12:34:11 +0000
In-Reply-To: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 07/14] net: stmmac: move most PCS register
 definitions to stmmac_pcs.c
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vhoSR-00000005H1q-3Ufj@rmk-PC.armlinux.org.uk>
Date: Mon, 19 Jan 2026 12:34:11 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_043428_413020_7A3FB7CB 
X-CRM114-Status: GOOD (  13.58  )
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

Move most of the PCS register offset definitions to stmmac_pcs.c.
Since stmmac_pcs.c only ever passes zero into the register offset
macros, remove that ability, making them simple constant integer
definitions.

Add appropriate descriptions of the registers, pointing out their
similarity with their IEEE 802.3 counterparts. Make use of the
BMSR definitions for the GMAC_AN_STATUS register and remove the
driver private versions.

Note that BMSR_LSTATUS is non-low-latching, unlike it's 802.3z
counterpart.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 22 +++++++++++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 22 -------------------
 2 files changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 4d1902f3a58f..718e5360fca3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -3,6 +3,20 @@
 #include "stmmac_pcs.h"
 #include "stmmac_serdes.h"
 
+/*
+ * GMAC_AN_STATUS is equivalent to MII_BMSR
+ * GMAC_ANE_ADV is equivalent to 802.3z MII_ADVERTISE
+ * GMAC_ANE_LPA is equivalent to 802.3z MII_LPA
+ * GMAC_ANE_EXP is equivalent to MII_EXPANSION
+ * GMAC_TBI is equivalent to MII_ESTATUS
+ *
+ * ADV, LPA and EXP are only available for the TBI and RTBI modes.
+ */
+#define GMAC_AN_STATUS	0x04	/* AN status */
+#define GMAC_ANE_ADV	0x08	/* ANE Advertisement */
+#define GMAC_ANE_LPA	0x0c	/* ANE link partener ability */
+#define GMAC_TBI	0x14	/* TBI extend status */
+
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
@@ -74,11 +88,11 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 			       struct stmmac_extra_stats *x)
 {
 	struct stmmac_pcs *spcs = priv->integrated_pcs;
-	u32 val = readl(spcs->base + GMAC_AN_STATUS(0));
+	u32 val = readl(spcs->base + GMAC_AN_STATUS);
 
 	if (status & PCS_ANE_IRQ) {
 		x->irq_pcs_ane_n++;
-		if (val & GMAC_AN_STATUS_ANC)
+		if (val & BMSR_ANEGCOMPLETE)
 			dev_info(priv->device,
 				 "PCS ANE process completed\n");
 	}
@@ -86,9 +100,9 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 	if (status & PCS_LINK_IRQ) {
 		x->irq_pcs_link_n++;
 		dev_info(priv->device, "PCS Link %s\n",
-			 val & GMAC_AN_STATUS_LS ? "Up" : "Down");
+			 val & BMSR_LSTATUS ? "Up" : "Down");
 
-		phylink_pcs_change(&spcs->pcs, val & GMAC_AN_STATUS_LS);
+		phylink_pcs_change(&spcs->pcs, val & BMSR_LSTATUS);
 	}
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 36bf75fdf478..887c4ff302aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -16,13 +16,6 @@
 
 /* PCS registers (AN/TBI/SGMII/RGMII) offsets */
 #define GMAC_AN_CTRL(x)		(x)		/* AN control */
-#define GMAC_AN_STATUS(x)	(x + 0x4)	/* AN status */
-
-/* ADV, LPA and EXP are only available for the TBI and RTBI interfaces */
-#define GMAC_ANE_ADV(x)		(x + 0x8)	/* ANE Advertisement */
-#define GMAC_ANE_LPA(x)		(x + 0xc)	/* ANE link partener ability */
-#define GMAC_ANE_EXP(x)		(x + 0x10)	/* ANE expansion */
-#define GMAC_TBI(x)		(x + 0x14)	/* TBI extend status */
 
 /* AN Configuration defines */
 #define GMAC_AN_CTRL_RAN	BIT_U32(9)	/* Restart Auto-Negotiation */
@@ -32,21 +25,6 @@
 #define GMAC_AN_CTRL_LR		BIT_U32(17)	/* Lock to Reference */
 #define GMAC_AN_CTRL_SGMRAL	BIT_U32(18)	/* SGMII RAL Control */
 
-/* AN Status defines */
-#define GMAC_AN_STATUS_LS	BIT_U32(2)	/* Link Status 0:down 1:up */
-#define GMAC_AN_STATUS_ANA	BIT_U32(3)	/* Auto-Negotiation Ability */
-#define GMAC_AN_STATUS_ANC	BIT_U32(5)	/* Auto-Negotiation Complete */
-#define GMAC_AN_STATUS_ES	BIT_U32(8)	/* Extended Status */
-
-/* ADV and LPA defines */
-#define GMAC_ANE_FD		BIT_U32(5)
-#define GMAC_ANE_HD		BIT_U32(6)
-#define GMAC_ANE_PSE		GENMASK_U32(8, 7)
-#define GMAC_ANE_PSE_SHIFT	7
-#define GMAC_ANE_RFE		GENMASK_U32(13, 12)
-#define GMAC_ANE_RFE_SHIFT	12
-#define GMAC_ANE_ACK		BIT_U32(14)
-
 struct stmmac_priv;
 
 struct stmmac_pcs {
-- 
2.47.3


