Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED134C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaDFuiHoKMcPrOZiBb6rulduVuXzLC4QmK70UITNdZQ=; b=ui0S2hiog3fxpi2jWmxoW5eTtk
	UG7GkqFXXlHbMij+i5EzdKJ2bSiDEVwrqogG0cwTpr5qux1P8WPk3UrU53NrH59ESJ9uNrN5kSQ17
	+vuU5LLg5kzGyV278/7AcN6oMOt6PsPQx7lTdfKulLYAIFHopH43e6u+LypXZ1T3n2Ru9GIy51LvL
	Z+Qo0fwNFufzWfaT62tE5FXHEfMQGoXwQSrkRyPKyoBvw6kbMnn5YqF9MyQ/fhzo0ESNfQA5jS/vh
	KTPbrNzQGmsdVPJFL47mtzqvyCek3s2iL5X+l/rk72LqLNlOOYEEMnuRNcDbw2837YtxaIaiOGqIC
	ZAHFCvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffiw-00000003R24-3oz0;
	Wed, 05 Feb 2025 13:45:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffdk-00000003Q7z-3NHI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 13:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=vaDFuiHoKMcPrOZiBb6rulduVuXzLC4QmK70UITNdZQ=; b=WAZIAnQvwFDC23whLrGs8jLSAg
	d7XVwsPHAcyw5dBNccIMZm2Drk4PRm+422cxwBCkJsu6iWeMM3z0OvnlICb4SsgsFyHmga0yUI5B8
	9uSBk9/s7jeK3bh0OlkR7diXyrafToNEw8FQrxLsvePYNYprpyKPxvv0BM1KCV2Q5pMLnECYuprPN
	q8M3nocSnWTBu96gVeXBmMNfDuQis+pc26InKtXa81/VFRTA7vQUvSccEpSc/DYQoBOgVNKSideVC
	qrzoSX5y14S1FyJBiNe+eFYIOvCea0KuoEfiK9YKWhuCTca23q8EY7ttwu3+i1cMSJ4gkGrNTOhyk
	oI4jLoXA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffdh-0000000GeSO-3rqG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vaDFuiHoKMcPrOZiBb6rulduVuXzLC4QmK70UITNdZQ=; b=hXSDb5RzVOMORA7oA3m7Gk9yoJ
	sdnvxU1ei9G8Rc+Jk3gFM+WeLRJSD3PB2apF5WZNZphSfDoXImvadOtqQXEJxR6apNv4ylcZcgukB
	EcDa06geEagbKtYLCT59qxUu+O7WmsT3Iq6hdY0uMp6usEWS7+Bjhg+C2p0jqSghVFWrhUoujh3ii
	C44eXvFgnrRBycBdFMberHj+sKOntbTL3hqVF04VyGsb02xlmvlKOUo8C+VNoviBIRYHyKbHqXzGh
	DOUmu+6K/ToeVajL3XHAIl8N8DUsrdWsb9xmkGMPfnB8mvbzkF7EvkgYBYt8m8jkAsEzRGxi3bxhs
	MUJ2FmDQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58650 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tffdc-0007Ab-0X;
	Wed, 05 Feb 2025 13:40:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tffdI-003ZHn-Iz; Wed, 05 Feb 2025 13:40:00 +0000
In-Reply-To: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
References: <Z6NqGnM2yL7Ayo-T@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 04/14] net: stmmac: split stmmac_init_eee() and move
 to phylink methods
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tffdI-003ZHn-Iz@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:40:00 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_134026_217548_FD0E2467 
X-CRM114-Status: GOOD (  15.35  )
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

Move the appropriate parts of stmmac_init_eee() into the phylink
mac_enable_tx_lpi() and mac_disable_tx_lpi() methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 133 +++++++++---------
 1 file changed, 63 insertions(+), 70 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c0472738bc76..8f2624de592d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -466,74 +466,6 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
 	stmmac_try_to_start_sw_lpi(priv);
 }
 
-/**
- * stmmac_eee_init - init EEE
- * @priv: driver private structure
- * @active: indicates whether EEE should be enabled.
- * Description:
- *  if the GMAC supports the EEE (from the HW cap reg) and the phy device
- *  can also manage EEE, this function enable the LPI state and start related
- *  timer.
- */
-static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
-{
-	priv->eee_active = active;
-
-	/* Check if MAC core supports the EEE feature. */
-	if (!priv->dma_cap.eee) {
-		priv->eee_enabled = false;
-		return;
-	}
-
-	mutex_lock(&priv->lock);
-
-	/* Check if it needs to be deactivated */
-	if (!priv->eee_active) {
-		if (priv->eee_enabled) {
-			netdev_dbg(priv->dev, "disable EEE\n");
-			priv->eee_sw_timer_en = false;
-			del_timer_sync(&priv->eee_ctrl_timer);
-			stmmac_reset_eee_mode(priv, priv->hw);
-			stmmac_set_eee_timer(priv, priv->hw, 0,
-					     STMMAC_DEFAULT_TWT_LS);
-			if (priv->hw->xpcs)
-				xpcs_config_eee(priv->hw->xpcs,
-						priv->plat->mult_fact_100ns,
-						false);
-		}
-		priv->eee_enabled = false;
-		mutex_unlock(&priv->lock);
-		return;
-	}
-
-	if (priv->eee_active && !priv->eee_enabled) {
-		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
-				     STMMAC_DEFAULT_TWT_LS);
-		if (priv->hw->xpcs)
-			xpcs_config_eee(priv->hw->xpcs,
-					priv->plat->mult_fact_100ns,
-					true);
-	}
-
-	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
-		/* Use hardware LPI mode */
-		del_timer_sync(&priv->eee_ctrl_timer);
-		priv->tx_path_in_lpi_mode = false;
-		priv->eee_sw_timer_en = false;
-		stmmac_enable_hw_lpi_timer(priv);
-	} else {
-		/* Use software LPI mode */
-		priv->eee_sw_timer_en = true;
-		stmmac_disable_hw_lpi_timer(priv);
-		stmmac_restart_sw_lpi_timer(priv);
-	}
-
-	priv->eee_enabled = true;
-
-	mutex_unlock(&priv->lock);
-	netdev_dbg(priv->dev, "Energy-Efficient Ethernet initialized\n");
-}
-
 /* stmmac_get_tx_hwtstamp - get HW TX timestamps
  * @priv: driver private structure
  * @p : descriptor pointer
@@ -1110,7 +1042,33 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 {
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 
-	stmmac_eee_init(priv, false);
+	priv->eee_active = false;
+
+	/* Check if MAC core supports the EEE feature. */
+	if (!priv->dma_cap.eee) {
+		priv->eee_enabled = false;
+		return;
+	}
+
+	mutex_lock(&priv->lock);
+
+	/* Check if it needs to be deactivated */
+	if (!priv->eee_active) {
+		if (priv->eee_enabled) {
+			netdev_dbg(priv->dev, "disable EEE\n");
+			priv->eee_sw_timer_en = false;
+			del_timer_sync(&priv->eee_ctrl_timer);
+			stmmac_reset_eee_mode(priv, priv->hw);
+			stmmac_set_eee_timer(priv, priv->hw, 0,
+					     STMMAC_DEFAULT_TWT_LS);
+			if (priv->hw->xpcs)
+				xpcs_config_eee(priv->hw->xpcs,
+						priv->plat->mult_fact_100ns,
+						false);
+		}
+		priv->eee_enabled = false;
+	}
+	mutex_unlock(&priv->lock);
 }
 
 static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
@@ -1119,7 +1077,42 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 
 	priv->tx_lpi_timer = timer;
-	stmmac_eee_init(priv, true);
+	priv->eee_active = true;
+
+	/* Check if MAC core supports the EEE feature. */
+	if (!priv->dma_cap.eee) {
+		priv->eee_enabled = false;
+		return 0;
+	}
+
+	mutex_lock(&priv->lock);
+
+	if (priv->eee_active && !priv->eee_enabled) {
+		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
+				     STMMAC_DEFAULT_TWT_LS);
+		if (priv->hw->xpcs)
+			xpcs_config_eee(priv->hw->xpcs,
+					priv->plat->mult_fact_100ns,
+					true);
+	}
+
+	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
+		/* Use hardware LPI mode */
+		del_timer_sync(&priv->eee_ctrl_timer);
+		priv->tx_path_in_lpi_mode = false;
+		priv->eee_sw_timer_en = false;
+		stmmac_enable_hw_lpi_timer(priv);
+	} else {
+		/* Use software LPI mode */
+		priv->eee_sw_timer_en = true;
+		stmmac_disable_hw_lpi_timer(priv);
+		stmmac_restart_sw_lpi_timer(priv);
+	}
+
+	priv->eee_enabled = true;
+
+	mutex_unlock(&priv->lock);
+	netdev_dbg(priv->dev, "Energy-Efficient Ethernet initialized\n");
 
 	return 0;
 }
-- 
2.30.2


