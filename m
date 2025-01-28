Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAA0C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdaJHDcetawhw7n/tKdXgSJrOfxgqAK1m9UgeH2faDY=; b=u7SknTD9vjgsiIT3H8hDx+WcNf
	uesdDqNvp4I/7UTGEq5A0w9WA/KpCEffvRwYPNY1+t2O7P9uhVzt2PZgoTcWbA+D3MNLkntJEImVI
	7EkZHZwcRTtOBz9mGhl+5TYV6Hre6e6pkU2LqN4D3rLB2bB4BiSJsnnZHJddYmWpe3VoxVG2Jaezb
	rwDFvPbKLxC+72B3Y+YTDRBwRTo4S1VdMYYzy6jws6O5UGbejg7yhzm02ycX58LbgPbBpgSsxk93h
	/e1gGCQAc5vEIPeALDjg9sSsG8mUnT6xhmaUWDcDThuD0Kh7FnXzcjC+8Jia6DhDrKDKeiP9V4E60
	KMaesR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnvl-00000005DsC-18va;
	Tue, 28 Jan 2025 15:55:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnoR-00000005C6U-04QB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RdaJHDcetawhw7n/tKdXgSJrOfxgqAK1m9UgeH2faDY=; b=DUoJvcMNtYWYHhnUOG2+m3iGt+
	mh0kg9EQjZsMkN0tcXxx5jOE+j6mkcveB1SZXSIf6JsPVg10V5bNRMxXGwhqQZbsCqH+Gg70y9D55
	ogY9tG1X7hK5MJEq4qn1jyUb5P8EfJVreJugMzX2i2389hJaksgvxcmdy+VgpR8s/iTUEhWi24YYl
	ZGlp2FBeC9ByMclEpVkel4GTKeK34cYFSPiP8CmMpMssP92iAx/68KS1EDDhLZVYVConBlRoHv2UN
	VfpRqXRrwicQlrf7zFUEUMwIM5shpWuOV9BRfptBzfuxMKHJHFoTJUOC4PlzCvPv6+uQ/5e7B8MkX
	rxQg27dQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45790 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnoM-0007UD-35;
	Tue, 28 Jan 2025 15:47:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcno3-0037Gc-Is; Tue, 28 Jan 2025 15:47:15 +0000
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
Subject: [PATCH RFC net-next 06/22] net: stmmac: remove unnecessary
 priv->eee_active tests
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcno3-0037Gc-Is@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:47:15 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074739_052241_5C0D1C80 
X-CRM114-Status: GOOD (  10.74  )
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

Since priv->eee_active is assigned with a constant value in each of
these methods, there is no need to test its value later. Remove these
unnecessary tests.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 29 ++++++++-----------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c2cc75624a8c..f63946eb6747 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1047,21 +1047,17 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 	mutex_lock(&priv->lock);
 
 	/* Check if it needs to be deactivated */
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
+	if (priv->eee_enabled) {
+		netdev_dbg(priv->dev, "disable EEE\n");
+		priv->eee_sw_timer_en = false;
+		del_timer_sync(&priv->eee_ctrl_timer);
+		stmmac_reset_eee_mode(priv, priv->hw);
+		stmmac_set_eee_timer(priv, priv->hw, 0, STMMAC_DEFAULT_TWT_LS);
+		if (priv->hw->xpcs)
+			xpcs_config_eee(priv->hw->xpcs,
+					priv->plat->mult_fact_100ns, false);
 	}
+	priv->eee_enabled = false;
 	mutex_unlock(&priv->lock);
 }
 
@@ -1075,13 +1071,12 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
 	mutex_lock(&priv->lock);
 
-	if (priv->eee_active && !priv->eee_enabled) {
+	if (!priv->eee_enabled) {
 		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
 				     STMMAC_DEFAULT_TWT_LS);
 		if (priv->hw->xpcs)
 			xpcs_config_eee(priv->hw->xpcs,
-					priv->plat->mult_fact_100ns,
-					true);
+					priv->plat->mult_fact_100ns, true);
 	}
 
 	if (priv->plat->has_gmac4 && priv->tx_lpi_timer <= STMMAC_ET_MAX) {
-- 
2.30.2


