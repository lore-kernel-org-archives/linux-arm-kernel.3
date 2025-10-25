Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05109CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 20:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsa26LUtnB+yfGPkqGfu37+Ohz48A6hBpNafuHU0e9c=; b=KWMXPLPu+LVp4JLfrxUda1+dJx
	O6fvAM1Fhwr3PGdMHW8B5ugEhlXePgtQ5LT07njlZ1FW4+XlDeID0aoU93GOAuwiCKPbIYzxJg3Is
	rTxRvAMTHRjaAy1itwFIotDD2/4BS31q7hEBHgo8le8hVvQi4IHHrxB8JyQEldAXRMphZGGFodGcB
	8hLoswq1SNKkZftE77nzrq/dqXZm3FibiCvmYxMjmWVmd8RR7aQxTdu6lxNwOBeGl4csl9kwl0rc9
	sNPapgoyNs4pYQad3mSpX8YifN+H0/nwpDDj0O6KkDALx0+2AuZHaAxF6osw5rF5kg/kjo2s67AsR
	cUyZvQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClCI-0000000BjvE-3yLv;
	Sat, 25 Oct 2025 20:49:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClCG-0000000Bjtt-2jnM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 20:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tsa26LUtnB+yfGPkqGfu37+Ohz48A6hBpNafuHU0e9c=; b=veMqvYHad03NP3Dqj+M2Hv/Stb
	sUo32dJSq4xNEpP3YM9TGRHlEOIHIVyZEjBjrXe1eO2T3DexrkpUNXOPI7Ta9YEwjs1tfmHx73j5I
	L3DkXYJq6vsLMlJepWVo2nLd6Q9/4hLzElYUUlaL/YYYBw7y0cWHqoI+zRqZLjuNwn1euO90UvSVv
	IpHaQbQIMcPbYV9stiXyiwqRVlMWGXZqXMsg2vRdp6g8NmtSS4eCgezSr2wf3ud/a2yUfLV5VX/GU
	ShvmvwomOea46erNRMb9iPK4hnD0S6rztUWf1o6K/I1qAi6zAlI1aQIaPIeLc+g8+ZGHNUCJjvEtS
	+9CpcL3Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41848 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vClC6-000000000QG-23At;
	Sat, 25 Oct 2025 21:48:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vClC5-0000000Bcbb-1WUk;
	Sat, 25 Oct 2025 21:48:57 +0100
In-Reply-To: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Alexis Lothor__" <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Furong Xu <0x1207@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH net-next 3/3] net: stmmac: add support specifying PCS
 supported interfaces
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vClC5-0000000Bcbb-1WUk@rmk-PC.armlinux.org.uk>
Date: Sat, 25 Oct 2025 21:48:57 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_134908_692877_73A8AEBE 
X-CRM114-Status: GOOD (  12.27  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 7 ++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c    | 7 ++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c     | 6 ++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h     | 3 ++-
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index a2ae136d2c0e..0d85902bafd0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -24,12 +24,17 @@
 
 static int dwmac1000_pcs_init(struct stmmac_priv *priv)
 {
+	phy_interface_t mode;
+
 	if (!priv->dma_cap.pcs)
 		return 0;
 
+	mode = PHY_INTERFACE_MODE_SGMII;
+
 	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
 					  GMAC_INT_DISABLE_PCSLINK |
-					  GMAC_INT_DISABLE_PCSAN);
+					  GMAC_INT_DISABLE_PCSAN,
+					  &mode, 1);
 }
 
 static void dwmac1000_core_init(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index a4282fd7c3c7..af9a336a32e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -24,11 +24,16 @@
 
 static int dwmac4_pcs_init(struct stmmac_priv *priv)
 {
+	phy_interface_t mode;
+
 	if (!priv->dma_cap.pcs)
 		return 0;
 
+	mode = PHY_INTERFACE_MODE_SGMII;
+
 	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
-					  GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE);
+					  GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
+					  &mode, 1);
 }
 
 static void dwmac4_core_init(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 77d38936d898..5293c52cf7af 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -65,7 +65,8 @@ static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
 };
 
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
-			       u32 int_mask)
+			       u32 int_mask, const phy_interface_t *modes,
+			       int num)
 {
 	struct stmmac_pcs *spcs;
 
@@ -78,7 +79,8 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 	spcs->int_mask = int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
-	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
+	while (num--)
+		__set_bit(*modes++, spcs->pcs.supported_interfaces);
 
 	priv->integrated_pcs = spcs;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index e42a98162c2b..36da4dab4f8f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -63,7 +63,8 @@ phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
 }
 
 int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
-			       u32 int_mask);
+			       u32 int_mask, const phy_interface_t *modes,
+			       int num);
 
 /**
  * dwmac_pcs_isr - TBI, RTBI, or SGMII PHY ISR
-- 
2.47.3


