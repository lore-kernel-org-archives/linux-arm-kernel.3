Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F234C105F78C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRn1H2bcEQZCC/0NKqsdFFm8gqOiKPTT8gIJOFUCakM=; b=M5JILiupCwcjLYTkKLkM9P7H/r
	tgd9CEbfS30pVCaQ5buwZ4rS+8rUxnlkdOVzEzunvyqpG+sKwIviuU8FSV+5Kp3BTig9sowYp+AuO
	DiSxCxcqebgqEoJuGjTFAej1K/bayPCmfsO5sx1Torm5GGNYN+2IWrYdY8X4fL1Rcupq+pfrMsNbO
	D+AJDNUsGFpJHAy+Ffzop7f0itGFdO4y9sB77TqlmsiyvuKsOS2hTjadH2TSv3yftG4jmB2Jhc2L2
	zoThjOUFwv69fz5npTzGBXTZZFi1rE8ztIYBcY4CC0H22Dn/bEvUSnSPC1JxYmA8i/fNw1NMuQv++
	QO0fL0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11dY-000000006fg-0umQ;
	Fri, 13 Mar 2026 12:29:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11dV-000000006ep-2h6Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 12:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nRn1H2bcEQZCC/0NKqsdFFm8gqOiKPTT8gIJOFUCakM=; b=Fc08BaxxqBlKE8lYHbS1ajtH+e
	ugFQ7M8dWAQhWenqvTEABGre+eZ1gbYKdGkDPpDKFZcYnu+8M06ZgeoBHOcXIaR/oPO71wKBx0rXC
	Na4jK9ToyyuGFPJWDX++qa3/VyyhEPJc+y+kaiPq4Y8Q7wdN05dyjZxqxiMbU/4kcnI4hR90ZiAa6
	L2pwMbw3J74A9HyE4za4Y1SqYqBblbhO+isH2ZsF3yDM5HCpsiwiJfQZ1K4p7581b5h5miVrwu8WK
	HhO53OpdrU/CovOCoGHEo25HXzIH4xnPObNfYoEuo06IcI1ygQWx36wihdZyBu0t9V+bbFpkznAhj
	Zq8PolWg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44338 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w11dQ-000000000uY-3gZM;
	Fri, 13 Mar 2026 12:28:56 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w11dQ-0000000DEhx-0JcL;
	Fri, 13 Mar 2026 12:28:56 +0000
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
Subject: [PATCH net-next 1/8] net: stmmac: add struct stmmac_pcs_info
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w11dQ-0000000DEhx-0JcL@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 12:28:56 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_052901_684064_8F54F59C 
X-CRM114-Status: GOOD (  13.35  )
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

We need to describe one more register (offset and field bitmask) to
the PCS code. Move the existing PCS offset and interrupt enable bits
to a new struct and pass that in to stmmac_integrated_pcs_init().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 9 ++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c    | 8 ++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c     | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h     | 9 +++++++--
 4 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 01f8353eb6ef..c851e3b88ce5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -22,14 +22,17 @@
 #include "stmmac_ptp.h"
 #include "dwmac1000.h"
 
+static const struct stmmac_pcs_info dwmac1000_pcs_info = {
+	.pcs_offset = GMAC_PCS_BASE,
+	.int_mask = GMAC_INT_DISABLE_PCSLINK | GMAC_INT_DISABLE_PCSAN,
+};
+
 static int dwmac1000_pcs_init(struct stmmac_priv *priv)
 {
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
-					  GMAC_INT_DISABLE_PCSLINK |
-					  GMAC_INT_DISABLE_PCSAN);
+	return stmmac_integrated_pcs_init(priv, &dwmac1000_pcs_info);
 }
 
 static void dwmac1000_core_init(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 4c6fed3ecbcf..ba5393beb7bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -22,13 +22,17 @@
 #include "dwmac4.h"
 #include "dwmac5.h"
 
+static const struct stmmac_pcs_info dwmac4_pcs_info = {
+	.pcs_offset = GMAC_PCS_BASE,
+	.int_mask = GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
+};
+
 static int dwmac4_pcs_init(struct stmmac_priv *priv)
 {
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
-					  GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE);
+	return stmmac_integrated_pcs_init(priv, &dwmac4_pcs_info);
 }
 
 static void dwmac4_core_init(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 88fa359ea716..2695e0b9ed03 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -90,8 +90,8 @@ int stmmac_integrated_pcs_get_phy_intf_sel(struct phylink_pcs *pcs,
 	return -EINVAL;
 }
 
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
-			       u32 int_mask)
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
+			       const struct stmmac_pcs_info *pcs_info)
 {
 	struct stmmac_pcs *spcs;
 
@@ -100,8 +100,8 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 		return -ENOMEM;
 
 	spcs->priv = priv;
-	spcs->base = priv->ioaddr + offset;
-	spcs->int_mask = int_mask;
+	spcs->base = priv->ioaddr + pcs_info->pcs_offset;
+	spcs->int_mask = pcs_info->int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 23bbd4f10bf8..f1ee473d8e3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -27,6 +27,11 @@
 
 struct stmmac_priv;
 
+struct stmmac_pcs_info {
+	unsigned int pcs_offset;
+	u32 int_mask;
+};
+
 struct stmmac_pcs {
 	struct stmmac_priv *priv;
 	void __iomem *base;
@@ -44,8 +49,8 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 			       struct stmmac_extra_stats *x);
 int stmmac_integrated_pcs_get_phy_intf_sel(struct phylink_pcs *pcs,
 					   phy_interface_t interface);
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
-			       u32 int_mask);
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
+			       const struct stmmac_pcs_info *pcs_info);
 
 /**
  * dwmac_ctrl_ane - To program the AN Control Register.
-- 
2.47.3


