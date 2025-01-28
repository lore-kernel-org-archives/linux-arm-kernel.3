Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61ACC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 15:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzqEwFhraiQ3i+QhTMew1i129n2QgfNW9SfHL20WQVw=; b=pPbx7pEmRTQlCaBOEiazFcfmPd
	qauegS4omTQZ6qzcxxbHAUGj6icBwNqIc+zxI+aV7+Fue+vkDb6UOjHgpf+OHZ1/rapJNTNiBXvgz
	iRQS1ThVLzCM7Tx6meK748moNoa6nLZb6TM740CSPzbkvdgEHSWcwS6l6vVfsIgvMBbQU1mG3Hved
	XSigcY888Hw8CeGIvON9md60crV1pkNNjscAoiWRz6+q3mTqwRRSAqw6xIR+eQuWsAbYyxF/G7VNg
	2PeCDV6zcOtUrLwBDVofYK/fsm6i4X3FvLItZfO+R/0WS51vBuDu3nGtl7aTa7/kEk9VvS+mTF578
	nx99qEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnx4-00000005EB7-43pz;
	Tue, 28 Jan 2025 15:56:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnoW-00000005C8U-0iJl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FzqEwFhraiQ3i+QhTMew1i129n2QgfNW9SfHL20WQVw=; b=yV54mE8Fn+8MuE63sRKrarSyHV
	ZUkrCUnVb/wnlo+9HqcZ3EjLtmaJMc4NL6jvLCsyxoD0K9JdJRwknwl1Ywt66JgMQcK4MN6cTRQXf
	q4j921CVN1Z06sKeelsSMy1s7JVAJAvhUuOFRWao61fw0hnRrRk9qPOALu4CvbM3/79+V8H97qHnp
	nGt0GqQdoF3/gGiLbXOHfjo/+KMdVm3260YqU8A4nY4iMEUJygU9TUXtvgK1Rl4UCP2H5XaeWmJjM
	LQqGJk3dsZHVXLhTi71DT3FiuR6fObhWYMIDVcT5pnxkcB83XLLZv4yxZPCICZ21UTttv7OvHZd+P
	1CdXXQNQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45792 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnoS-0007UU-01;
	Tue, 28 Jan 2025 15:47:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcno8-0037Gi-Mp; Tue, 28 Jan 2025 15:47:20 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	 Vladimir Oltean <olteanv@gmail.com>,
	 Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH RFC net-next 07/22] net: stmmac: remove unnecessary
 priv->eee_enabled tests
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcno8-0037Gi-Mp@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:47:20 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074744_219984_0C5C2A49 
X-CRM114-Status: GOOD (  12.37  )
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
index f63946eb6747..485b2bfaf811 100644
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


