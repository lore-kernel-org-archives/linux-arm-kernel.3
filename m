Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD686C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wzqVEG4YmhcZfFsDxnn0J/g7QtnEP23oOLAdp01iVs=; b=XHq501vicH+gh/cQzbcGppX+c9
	yvP1Gh8NUQTX+gv2vIrEb2wfcBlxUZUhuGFh7gfX5nuriyll6wchguWQ7+7SFuYy1JSBZKFKgVkE1
	zB+VLcsPFObPf2pXnEalIztN98cF0BsvKFnUIq6A69ObDwvTetBuV8vSvG3ZR5WhBIyG+fWyzA1W9
	yZN1+l4Ynm22NBnugU0g028g+f02tH4IZEQfcwFlINJdeVENbQYacAM21RmRnnixsaPigwcReDE3t
	+ElCfn7BNwKC3FxTEBnox65a4+1/fX3MeSRXsHRylIkr0ZpDWTs3aTV2YzSMjfiwEVLDuvAA4S/6g
	lyhRehJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffmx-00000003Rbn-1LQw;
	Wed, 05 Feb 2025 13:49:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffdz-00000003Q9L-3qMC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 13:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=7wzqVEG4YmhcZfFsDxnn0J/g7QtnEP23oOLAdp01iVs=; b=Opa6iwsJSec/zrV2L9/09PGebA
	LqeuLK9Qo7OCpjFr2CPxUf6V89UwNFxTEhe0gtXPHwRSVSuJ08pOH5jSikUZ7mJPsC4jclXUrM5iA
	obAR8UqGlKDhKS3Bexx+mWuDpwJph8sDQA3n0nZZoB7GnqnKYQOX+fUC9wHaY6YC8PGT1AP+7895K
	e5lrT1/oG7u9984QQ+IxloJJnK4K0A5/sbGWj7QoQr2KIozihqqFGPlZs8KJJSsbok5l6C25KTW7u
	DVVuaIdfe3BT1niBo2Fvh65PT9ZlUaXiR6mwlGhUCXGbyhJD2BLPHk28LaRTUIaQTd2jpY08GVoCg
	EHaWoa3Q==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffdx-0000000GeUl-0cUj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7wzqVEG4YmhcZfFsDxnn0J/g7QtnEP23oOLAdp01iVs=; b=oR0F+Qr/FX41EyBCkqh5BDGZQH
	pgJPnC55/0iaRAD0jkEnCBcQH8roQU7OmkVUXRRIQGiN5m6TuzIg86w1iFj9k2wqneP2AY2yMmSLQ
	G2imYbim+1lHJ0lmBB68B/jzPhEsGaYoBnwMiHRL5uXizfbTEjHDarK9jV4mFnNTEOpcZkBlm1Y/U
	7ITYstp/6X8YU+d3c42Hg4iW/GBmAIf1mX7eBI7SDfK0/JjaKAKxmmvJ/OQspITZWcui4hFtVT0Ro
	9gXihcjSnteIp7thSZnH4S7rvIcp6zZOWOJp9vgzlBe7KYMsuZ1rm8tCnm1jAfpbBNqqWd2ftRMDk
	ZNnMFhpg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60762 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tffdr-0007BR-1W;
	Wed, 05 Feb 2025 13:40:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tffdX-003ZI5-UV; Wed, 05 Feb 2025 13:40:15 +0000
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
Subject: [PATCH net-next 07/14] net: stmmac: remove unnecessary
 priv->eee_enabled tests
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tffdX-003ZI5-UV@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Feb 2025 13:40:15 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_134041_267044_503749BC 
X-CRM114-Status: GOOD (  12.55  )
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

Phylink will not call the mac_disable_tx_lpi() and mac_enable_tx_lpi()
methods randomly - the first method to be called will be the enable
method, and then after, the disable method will be called once between
subsequent enable calls. Thus there is a guaranteed ordering.

Therefore, we know the previous state of priv->eee_enabled, and can
remove it from both methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 37 +++++++++----------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6c8685c30022..695e75de41b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1046,18 +1046,17 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 
 	mutex_lock(&priv->lock);
 
-	/* Check if it needs to be deactivated */
-	if (priv->eee_enabled) {
-		netdev_dbg(priv->dev, "disable EEE\n");
-		priv->eee_sw_timer_en = false;
-		del_timer_sync(&priv->eee_ctrl_timer);
-		stmmac_reset_eee_mode(priv, priv->hw);
-		stmmac_set_eee_timer(priv, priv->hw, 0, STMMAC_DEFAULT_TWT_LS);
-		if (priv->hw->xpcs)
-			xpcs_config_eee(priv->hw->xpcs,
-					priv->plat->mult_fact_100ns, false);
-	}
 	priv->eee_enabled = false;
+
+	netdev_dbg(priv->dev, "disable EEE\n");
+	priv->eee_sw_timer_en = false;
+	del_timer_sync(&priv->eee_ctrl_timer);
+	stmmac_reset_eee_mode(priv, priv->hw);
+	stmmac_set_eee_timer(priv, priv->hw, 0, STMMAC_DEFAULT_TWT_LS);
+	if (priv->hw->xpcs)
+		xpcs_config_eee(priv->hw->xpcs, priv->plat->mult_fact_100ns,
+				false);
+
 	mutex_unlock(&priv->lock);
 }
 
@@ -1071,13 +1070,13 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
 	mutex_lock(&priv->lock);
 
-	if (!priv->eee_enabled) {
-		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
-				     STMMAC_DEFAULT_TWT_LS);
-		if (priv->hw->xpcs)
-			xpcs_config_eee(priv->hw->xpcs,
-					priv->plat->mult_fact_100ns, true);
-	}
+	priv->eee_enabled = true;
+
+	stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
+			     STMMAC_DEFAULT_TWT_LS);
+	if (priv->hw->xpcs)
+		xpcs_config_eee(priv->hw->xpcs, priv->plat->mult_fact_100ns,
+				true);
 
 	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
 		/* Use hardware LPI mode */
@@ -1092,8 +1091,6 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 		stmmac_restart_sw_lpi_timer(priv);
 	}
 
-	priv->eee_enabled = true;
-
 	mutex_unlock(&priv->lock);
 	netdev_dbg(priv->dev, "Energy-Efficient Ethernet initialized\n");
 
-- 
2.30.2


