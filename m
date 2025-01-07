Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F01E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4M3GO1u5UO9gUdI/y1VtJSws8EiP+NlPYd8R2GK9U4M=; b=QOyQtP11IOCn2g88wYjZh4UO0/
	i2VQ84vAjyrHKo6YQGfj3J70ihbZWd0RxAK4kEnKp2tpCeA+mHIG9UvIu7SgoPfBuiCuWmCT9zaI2
	QxPKJgqDpwCv2UyqlQK7eY+C5ZxfmaE2EjEG5IECaiUUuyhBmMVe1V+5Wsn41z73fO1CXeMzC/Sag
	g1uyuEzUF0f12VZYMq7DBFbBiCIvFjYDWXYd9w48DpeEcfDafTRbAMe1YZfRDO/23INhDXauQ10N+
	bBiEX7kcU5H1QQX9wcDHPVYkahKdFyPZsUilmbeYsd72l5xWcNYDpIt2GgPioZNDXgE7r0qIacX7S
	HokD5s4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCxC-00000005kNA-2GzY;
	Tue, 07 Jan 2025 17:01:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCSk-00000005di5-3p3C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4M3GO1u5UO9gUdI/y1VtJSws8EiP+NlPYd8R2GK9U4M=; b=nsRAKSRgFV/Rlj2frgJxeu6KwT
	JwDa8bCCsHm2IM4BTEzxxrX8YavfoFcimxYvb07Q1IRLxJuoQAaZGWAarzBfnO15nyJs094iOXTxo
	Hlwks6/oh66B8AEzWkeA3YJWqDiVRh7VIDBEGdBEa1dShKxRKi1dbAjFnNtbRWLnyOtIUm8zn+It5
	r+NLblaL+M//ZqY3wpb1MOvnsfC7j1lmskrLZSp8jTjYg8S+6t2knoUS9so4yt0VB2kgakUFbskvq
	RGb81qR+j5p6mwLahIqjY1SW/0Smz1SZWw1fX+TMB1AKx3ASxOi8Mr81c4J7OhZMOzYHDA45Zl+6q
	ozvIDauw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42184 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVCSg-0007op-2g;
	Tue, 07 Jan 2025 16:29:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVCSd-007Y4L-QX; Tue, 07 Jan 2025 16:29:43 +0000
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
Subject: [PATCH net-next v3 15/18] net: stmmac: move setup of eee_ctrl_timer
 to stmmac_dvr_probe()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVCSd-007Y4L-QX@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:29:43 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082950_949625_A405D67C 
X-CRM114-Status: GOOD (  10.18  )
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

Move the initialisation of the EEE software timer to the probe function
as it is unnecessary to do this each time we enable software LPI.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7c1dbc5fa84b..b003f462006d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -494,7 +494,6 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 	}
 
 	if (priv->eee_active && !priv->eee_enabled) {
-		timer_setup(&priv->eee_ctrl_timer, stmmac_eee_ctrl_timer, 0);
 		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
 				     STMMAC_DEFAULT_TWT_LS);
 		if (priv->hw->xpcs)
@@ -7405,6 +7404,8 @@ int stmmac_dvr_probe(struct device *device,
 
 	INIT_WORK(&priv->service_task, stmmac_service_task);
 
+	timer_setup(&priv->eee_ctrl_timer, stmmac_eee_ctrl_timer, 0);
+
 	/* Override with kernel parameters if supplied XXX CRS XXX
 	 * this needs to have multiple instances
 	 */
-- 
2.30.2


