Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46307105F7A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Cgf2gD6rXxXF+px7sqhdXyc7MrIzuGZPZOK4yi5eZA=; b=Ew3fYEV+aexe6HTO54QE/tAh7P
	sRcKrY+53R4nGVCvzqRjV/LjP2PclkDWkiNokS2NVrfb3WmlqiL/2ObNutTfaQ7cpy9sMc+i8/liv
	urmvtLdpfA1uRSh14kxRXVfyxQ677E2xDoPw1phJUAKjyiCiHHfcWjFz7vLkltnuA5RgVSR/s4VRw
	YiLP4GA+2p450wnD/VkaMv/5ztX1k3WRH9+FvIqNv5kLd2NoJCJWILInUG9g61XpvM6Aj+zEn+EXH
	+YOBnVJBLfcHD8V2XSHuStns88AxJEhN7GLCHGRR+2HBwPvgbskxD8wj7umole3uLO2BRTXUuUO1z
	3vWT2IGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11eH-0000000072y-2xT0;
	Fri, 13 Mar 2026 12:29:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11eA-000000006ym-1Td4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 12:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4Cgf2gD6rXxXF+px7sqhdXyc7MrIzuGZPZOK4yi5eZA=; b=TvBLw4XE16NQQCDsrBvbY9jpAt
	e+6WB4aANTbAxFHqN7pkXZ3IPRFZiJb5LY4USRhb/v7Ti+rnhhr/YYrMx3jxjFC1oHQWah4RwFfbL
	LNMv+RFERh6LXbsYRi9ccx86ZK63yE394LHumeWWoVtItsk3QeygG/aRmq3KoFWsluRw9wnLEmrjZ
	n1iz56JR+K8oEGqyl6LhHXcx1Ss6rCEZNdeXZOUs+QUdeLGl3YcCSM0t7jcw5UBh4Txx+AVtOnVNY
	ecw29vc+UahI6pZ/jnOi8U+DvN2Ona+aZUHNWyRhCFAbBVqJObu3eG/YcYvYi/Z7HtnNQA4382jZ2
	MI+0u9rA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47014 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w11e2-000000000we-31cl;
	Fri, 13 Mar 2026 12:29:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w11dz-0000000DEie-3fyA;
	Fri, 13 Mar 2026 12:29:31 +0000
In-Reply-To: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 8/8] net: stmmac: report PCS configuration changes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w11dz-0000000DEie-3fyA@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 12:29:31 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_052947_069952_DA5345EA 
X-CRM114-Status: UNSURE (   9.66  )
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
index b2b12d34b3dd..e1160bc8a63d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -71,6 +71,7 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 				  bool srgmi_ral)
 {
 	u32 value = readl(ioaddr + GMAC_AN_CTRL(reg));
+	u32 old = value, diff;
 
 	/* Enable and restart the Auto-Negotiation */
 	if (ane)
@@ -85,5 +86,19 @@ static inline void dwmac_ctrl_ane(void __iomem *ioaddr, u32 reg, bool ane,
 		value |= GMAC_AN_CTRL_SGMRAL;
 
 	writel(value, ioaddr + GMAC_AN_CTRL(reg));
+
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
 }
 #endif /* __STMMAC_PCS_H__ */
-- 
2.47.3


