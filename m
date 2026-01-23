Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8AED72366
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVE0ichfCCZBPxaV5iFEVGkv6qOUUWRLscyvBIVG1Cw=; b=BfAtLoSnStk++5jta+MhNhtoWV
	mpIwbTmrsr5sJjkqi2ZnjR5COFozkIdgy9F5KstUstrsImvMaJ1kPJ1n2n+iTa1HKYFxvqxsU4nlE
	Bgr4Y6rDRJi0ZeOAISUkO+sLAJySgfJrF4Q6raxerBUoRGIcdEDUoAIY5vyaeivfakjgcBNAoxgU2
	hcNFupg7RbwsX+mVL0lJRJjvvlrloNHlsDXJ2lKJ6sAeTtiGFI+uvXuSf/SwRspw6yXwv77Ac02kN
	FsapRVpa/a3A57MkWFy3HiekMnx1Hf+yBP+YYkNmJD8+sdZ7NjSliaweHq/Of91cqnjesphL7bISP
	nFDMjZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjE20-00000008fnf-47NI;
	Fri, 23 Jan 2026 10:04:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjE1z-00000008fmo-1Ge5;
	Fri, 23 Jan 2026 10:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rVE0ichfCCZBPxaV5iFEVGkv6qOUUWRLscyvBIVG1Cw=; b=Z1JVOAn00vTGXuvxin166bmAPP
	VhbTuYK7MZUg6VrSXzkjPblDIJ6vOcbtI99w87SnocqlXajzIKzcKrAorTpvenXlYaunZeuUXVpaO
	HjvnM4WVHkl2NXN38nYj+cOJo34nCBM3BWXXtiYMz3Z86kheBYwqqhvD+3obNBTf0Sx94+v60DA8c
	RL9EJt9R6vYoSgYBSjSnr3Adqvt8p3fAKVA3WGXJAHQXXekhaoTl3IAwcSbxNiZI6kGGckl0wqQex
	aVpzkAZoFFN38tMg/DvQDtDlVOHXPr84Y+YmPdSJXQS5sa4NnTiHWRK7BezYuK8ZoeF+nw2iljMhx
	DdAJSayg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48080 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjDsC-000000001dV-0nCC;
	Fri, 23 Jan 2026 09:54:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjDs6-00000005fRH-1YFv;
	Fri, 23 Jan 2026 09:54:30 +0000
In-Reply-To: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 14/14] net: stmmac: report PCS configuration
 changes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjDs6-00000005fRH-1YFv@rmk-PC.armlinux.org.uk>
Date: Fri, 23 Jan 2026 09:54:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_020443_343948_94367BA0 
X-CRM114-Status: UNSURE (   8.79  )
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

Report if/when qcom-ethqos changes the PCS configuration. With phylink
now setting the PCS configuration, there should be no need for drivers
to change this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index f9e7a7ed840b..6a1e30b10740 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -71,6 +71,7 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 				  bool srgmi_ral)
 {
 	u32 value = readl(ioaddr + GMAC_AN_CTRL(reg));
+	u32 old = value, diff;
 
 	/* Enable and restart the Auto-Negotiation */
 	if (ane)
@@ -84,6 +85,20 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 	if (srgmi_ral)
 		value |= GMAC_AN_CTRL_SGMRAL;
 
+	diff = old ^ value;
+	if (diff & ~GMAC_AN_CTRL_RAN) {
+		pr_warn("dwmac: PCS configuration changed from phylink by glue, please report: 0x%08x -> 0x%08x\n",
+			old & ~GMAC_AN_CTRL_RAN, value & ~GMAC_AN_CTRL_RAN);
+#define REPORT_BIT(x) \
+		if (diff & GMAC_AN_CTRL_##x) \
+			pr_warn("dwmac: %8s %u -> %u\n", #x, \
+				!!(old & GMAC_AN_CTRL_##x), \
+				!!(value & GMAC_AN_CTRL_##x))
+		REPORT_BIT(ANE);
+		REPORT_BIT(SGMRAL);
+#undef REPORT_BIT
+	}
+
 	writel(value, ioaddr + GMAC_AN_CTRL(reg));
 }
 #endif /* __STMMAC_PCS_H__ */
-- 
2.47.3


