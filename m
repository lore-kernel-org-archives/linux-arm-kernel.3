Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ACAE77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4h4DvLs6eIAMMB+SiDt1jAxdP1YqbY0pFewk/QkNZQ=; b=uC04zSUaOx0e7HVyTOxBD67NQv
	bxy83hW3lxgxIh6CRSen6pYIG+p7FMzdo/62v8uZCPTlEUuAqqpYXyoxYm0+QKd4EKB3d6vxvSCf6
	aWGWfmiFzkMKVhlYhpx/thcfdIklf9bWG0AJxJiMun3QgwUVLmLjIeg27LXzul0knP5Qm4CDrdqz9
	7hp6O8XX/YwQicHdZ5aKLkHVnVji+7EkmOcVkB0eoBanCK7MMC+XFWu0dF+O/9D5E3SoGgiIJW8kx
	BQHsyKMijRv157ecNOe8+XRtTvcJlR6MHANkiWK65J3pSMQxpmvbDyZyEgbvW2bGNIq/TM5PpZ0FY
	SEtrkUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD0m-00000005kyw-2Ccj;
	Tue, 07 Jan 2025 17:05:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCT2-00000005dou-1G74
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k4h4DvLs6eIAMMB+SiDt1jAxdP1YqbY0pFewk/QkNZQ=; b=KWm+xDqUuNYy43JeQyW+mp8Lhd
	AGblvifSnlJllc1Awi+zNSYef4lfrfaOat9RjHoyoJHs/pSaL+dVB0PfAu4HXuzCuorYorOoUaMI6
	Tb5sBGwfKk0wM10xecW7rYGrlQCR/+wsl9xxjUQyVxu7CpklL2DTKZ/kZMiCxg32uz+j6nLV2EkgU
	Q9dO+yiwiOI9tm0jZBLwoGBDjPL8Ru0wn6EER36W88l8zLtkt0UWeHdElnygY0pEiLrovqyUKzLoL
	OxXXDWBz/w2UYAg0yUdbEPkAiZoZBDAQz0dprPHaMKPKbtJtfxIisKtwvo8VKHbCbwbzj4QjhnpHT
	+K8P5/rA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50608 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVCSw-0007pe-1G;
	Tue, 07 Jan 2025 16:30:02 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVCSt-007Y4d-5y; Tue, 07 Jan 2025 16:29:59 +0000
In-Reply-To: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v3 18/18] net: stmmac: remove
 stmmac_lpi_entry_timer_config()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVCSt-007Y4d-5y@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:29:59 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_083008_335717_A035AC86 
X-CRM114-Status: UNSURE (   9.55  )
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

Remove stmmac_lpi_entry_timer_config(), setting priv->eee_sw_timer_en
at the original call sites, and calling the appropriate
stmmac_xxx_hw_lpi_timer() function. No functional change.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5b2ce5305b4b..250e1e7df050 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -400,16 +400,6 @@ static void stmmac_enable_hw_lpi_timer(struct stmmac_priv *priv)
 	stmmac_set_eee_lpi_timer(priv, priv->hw, priv->tx_lpi_timer);
 }
 
-static void stmmac_lpi_entry_timer_config(struct stmmac_priv *priv, bool en)
-{
-	/* Clear/set the SW EEE timer flag based on LPI ET enablement */
-	priv->eee_sw_timer_en = en ? 0 : 1;
-	if (en)
-		stmmac_enable_hw_lpi_timer(priv);
-	else
-		stmmac_disable_hw_lpi_timer(priv);
-}
-
 /**
  * stmmac_enable_eee_mode - check and enter in LPI mode
  * @priv: driver private structure
@@ -489,7 +479,8 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 	if (!priv->eee_active) {
 		if (priv->eee_enabled) {
 			netdev_dbg(priv->dev, "disable EEE\n");
-			stmmac_lpi_entry_timer_config(priv, 0);
+			priv->eee_sw_timer_en = true;
+			stmmac_disable_hw_lpi_timer(priv);
 			del_timer_sync(&priv->eee_ctrl_timer);
 			stmmac_set_eee_timer(priv, priv->hw, 0,
 					     STMMAC_DEFAULT_TWT_LS);
@@ -513,11 +504,15 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 	}
 
 	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
+		/* Use hardware LPI mode */
 		del_timer_sync(&priv->eee_ctrl_timer);
 		priv->tx_path_in_lpi_mode = false;
-		stmmac_lpi_entry_timer_config(priv, 1);
+		priv->eee_sw_timer_en = false;
+		stmmac_enable_hw_lpi_timer(priv);
 	} else {
-		stmmac_lpi_entry_timer_config(priv, 0);
+		/* Use software LPI mode */
+		priv->eee_sw_timer_en = true;
+		stmmac_disable_hw_lpi_timer(priv);
 		mod_timer(&priv->eee_ctrl_timer,
 			  STMMAC_LPI_T(priv->tx_lpi_timer));
 	}
-- 
2.30.2


