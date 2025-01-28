Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EF8C02190
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=palMyM3mPY1asetOxby02+XjoraJnT8MIMUwZ6ft2jE=; b=zQ6LF9s6utDuXNMdXDOhpslcsU
	unkV59fDRtEZoLOxm073u42+XxvFSloM9Vv9xnQmqV4SGgA3f8SnUuC4PFBBlA8pN8+QFb13tr7TO
	2a5pVPGuhDXnpoUnekP+UsmQi2XwkO18LLQhpOmAPzuEmy5WHI3p3ZyZG8FAKezynsxG7kXgPjels
	quHSJYIcemMw46A43u0xz4c2MwWOj2RHGL1ioDSkRucBN0ZT8SKijIwjpjqBBI5nU1qPShSyfOHUf
	45A7XfASyzaJ0e3QK6WFVCBAtVFpKA3inQUQKMqehcnUO6aO14JntHNUjNoBBWdgpAgAhcDakoNsX
	VmgHLWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoCq-00000005He0-2bLB;
	Tue, 28 Jan 2025 16:12:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnpW-00000005CSp-1qLU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=palMyM3mPY1asetOxby02+XjoraJnT8MIMUwZ6ft2jE=; b=G1Sp+FFrkgvasjMfr9sgaWfSSp
	UftYD+hqZqyy+fWOJndCV6ytedOzRdRVqyezZMgW2V8ugR5pErOD0K5nuQArQAixYIVZuCUVATuNs
	m2VW6c/OLmtZXMCqazy+Hjol3GK/vugbq3AGJ9d7dMuPjfhI3mr7dnp0p9qex/rvzuljppiKK1iwb
	FdHhRO+m5KfxbyfPZ3SYmmb0X5rYpN0oB5x66jmPhHIr/PcZuHtT99SPcMmdMwdFyQaytQafhyKkL
	J0Q9+zTGC3TFyoq9TC/9zijZ5bWTLvk5fQz1hrEg3FXc42AygCUj0l+RGxIiIe1PJDPIIFQ40gA+v
	Nm3UyJpQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50678 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnpR-0007Xw-1f;
	Tue, 28 Jan 2025 15:48:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnp8-0037Hu-4Y; Tue, 28 Jan 2025 15:48:22 +0000
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
Subject: [PATCH RFC net-next 19/22] net: stmmac: remove calls to
 xpcs_config_eee()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnp8-0037Hu-4Y@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:48:22 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074846_508238_126667FF 
X-CRM114-Status: UNSURE (   8.30  )
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

Remove the explicit calls to xpcs_config_eee() from the stmmac driver,
preferring instead for phylink to manage the EEE configuration at the
PCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 5b47b2ad6b49..03d3042c12a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1046,10 +1046,6 @@ static void stmmac_mac_disable_tx_lpi(struct phylink_config *config)
 	priv->tx_path_in_lpi_mode = false;
 
 	stmmac_set_eee_timer(priv, priv->hw, 0, STMMAC_DEFAULT_TWT_LS);
-	if (priv->hw->xpcs)
-		xpcs_config_eee(priv->hw->xpcs, priv->plat->mult_fact_100ns,
-				false);
-
 	mutex_unlock(&priv->lock);
 }
 
@@ -1068,9 +1064,6 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 
 	stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
 			     STMMAC_DEFAULT_TWT_LS);
-	if (priv->hw->xpcs)
-		xpcs_config_eee(priv->hw->xpcs, priv->plat->mult_fact_100ns,
-				true);
 
 	/* Try to cnfigure the hardware timer. */
 	ret = stmmac_set_lpi_mode(priv, priv->hw, STMMAC_LPI_TIMER,
-- 
2.30.2


