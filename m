Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C332E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uu6hwE8YihcKrAP8jShMh8EcDxHRMrRMuOZsYeQIMgU=; b=m2jHc4PSbpIqkhrh6so0bE44Ym
	4Nipmq8XdDd0jbnAYj/Fn2AlDoRyl5zqa3ydq14h/juhDMwuSO63NDBJrGZfkpkDwmNQ3PwmsXyYu
	omsaPD44nYDklzXDZIhEG7/sQhDAG7JGbqGEaWudiNPxekgypCP8VD/fjDDjOn4ZKfERjwbupz5KW
	avthknVmv0Cdb5e/yYs/8qESeVAxqD9xRWK7skxvT2oV0hUhTtKnLl5vdJBZCnwUB02GAtL+Wdf4o
	gpgK1dTTM47bDEDnVwXLn/T7cp15Vzbn/9y5HG28eap6tTVXWoeoyS9aAsALk6GjcvHPbcjLBrt3B
	j28Vsjrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkXa-00000000ffE-08Qm;
	Thu, 12 Dec 2024 14:51:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkSt-00000000evk-2khZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 14:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uu6hwE8YihcKrAP8jShMh8EcDxHRMrRMuOZsYeQIMgU=; b=FNBt73nnZ9LhxgvYD/BrvIIj83
	z3eQdWDEy4hANCj4zimQh+0qqi+sSfmnQiRcF9QP6T9JGNlEQP692WMoCqfxceHtOnGLNzX2DJHT8
	HSsPnD2BrCe3KN9uEORGsQ4wm1gMT0F7L9KbOPTEmGE28EmIyRnvRIQczqOPS9PuZpsI28Zlz5tcO
	c0oToyzdlrjD6xn0Cuvca52DWHXsV/q2N+WAQsHZufaFgIwFIn0k8Hbs55SQAbqmtWjjIzQgNPKu8
	4k/2OFIA2ZtWtKaJ7xZt40kqmEHGuh4Glx2noPp62Y8Lt8I1Iix1Pu73h5gL6d6sWQmfk/m27wOWY
	+9DdzZNA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41428 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tLkSp-0005LT-0k;
	Thu, 12 Dec 2024 14:46:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tLkSn-006qfl-6n; Thu, 12 Dec 2024 14:46:49 +0000
In-Reply-To: <Z1r3MWZOt36SgGxf@shell.armlinux.org.uk>
References: <Z1r3MWZOt36SgGxf@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 5/7] net: stmmac: remove priv->tx_lpi_enabled
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tLkSn-006qfl-6n@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Dec 2024 14:46:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_064655_691240_B1F83B23 
X-CRM114-Status: UNSURE (   8.57  )
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

Through using phylib's EEE state, priv->tx_lpi_enabled has become a
write-only variable. Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 1d86439b8a14..77a7a098ebd1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -310,7 +310,6 @@ struct stmmac_priv {
 	int eee_enabled;
 	int eee_active;
 	int tx_lpi_timer;
-	int tx_lpi_enabled;
 	int eee_tw_timer;
 	bool eee_sw_timer_en;
 	unsigned int mode;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 75f540d7ec7d..3acc6f6e2190 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -978,7 +978,6 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 
 	stmmac_mac_set(priv, priv->ioaddr, false);
 	priv->eee_active = false;
-	priv->tx_lpi_enabled = false;
 	priv->eee_enabled = stmmac_eee_init(priv);
 	stmmac_set_eee_pls(priv, priv->hw, false);
 
@@ -1093,7 +1092,6 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 				STMMAC_FLAG_RX_CLK_RUNS_IN_LPI)) >= 0;
 		priv->eee_enabled = stmmac_eee_init(priv);
 		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
-		priv->tx_lpi_enabled = priv->eee_enabled;
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
 
-- 
2.30.2


