Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F830E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtobVMnr8E5gzN8ZgvrreHjtEy+CmRHbLYgzCHnDnG4=; b=R++xRx+J0tR2HNR0To+HVPnDJm
	kzTTClmVAutfrtzea1NaPVMsNkCotzvo9U4cl4yxX4ABgF7Uzel+vufZuTi9qpQOM/YmvLls43UqQ
	Voo/s+4Wvyyjq2kcSHG4WHTuQEeeDeafkg0vIFvdTib+ZRARBQM0X9cuiTK7mB320toAt6T+nLEeG
	dghDC5KdGC2OiI+HG0Ydqr33KBguXLl1wbOApERCeLpEsjGhbF1QhFD3WB1RiV0gp09o9g/m77sev
	nR2qzfCk+rli1brBNndoPrZSo4AVGr0Kd1lqNYLaJ0clCaFJSQbgrIAKAygrAE3k96bbJGYlYYSbT
	mjIHDvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCtc-00000005je6-2Hrp;
	Tue, 07 Jan 2025 16:57:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCSV-00000005db8-44gb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AtobVMnr8E5gzN8ZgvrreHjtEy+CmRHbLYgzCHnDnG4=; b=acBQQ+NyHAqjSuSoJzPyYnAk3v
	4n+lmW/UgxASD7sLSNkoXl5EANM5UHgfIZ/2530W9UaVyNDKtpYYbDCkxV2OVfGEeWVSe9r0l8mbn
	5ZVzo81Fpfevfrf0VG4JbcCmBWhk/YkVAURV0xkGoptuC+98Q109QMk8r45FwwjMqsmmxhGFvUuz8
	gbNErKg2ETG1MohLqC8fz768v1Z0iVblTlZTB9qdOiPsq1x+8IPPGVHOjM6/igTRZ8F28hdbLDWnb
	O/KsaNI9PGcG54RwEjKOpNZ7drgrjzvuY4Pe86QZiQLUk7yHj+Y8kKc5XL9D7e8M9d/x6zreSBCIF
	U3+faP8w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59402 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVCSR-0007nz-1X;
	Tue, 07 Jan 2025 16:29:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVCSO-007Y43-Fa; Tue, 07 Jan 2025 16:29:28 +0000
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
Subject: [PATCH net-next v3 12/18] net: stmmac: move priv->eee_enabled into
 stmmac_eee_init()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVCSO-007Y43-Fa@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:29:28 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082936_009717_AB69E429 
X-CRM114-Status: GOOD (  12.13  )
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

All call sites for stmmac_eee_init() assign the return code to
priv->eee_enabled. Rather than having this coded at each call site,
move the assignment inside stmmac_eee_init().

Since stmmac_init_eee() takes priv->lock before checking the state of
priv->eee_enabled, move the assignment within the locked region. Also,
stmmac_suspend() checks the state of this member under the lock. While
two concurrent calls to stmmac_init_eee() aren't possible, there is
a possibility that stmmac_suspend() may run concurrently with a change
of priv->eee_enabled unless we modify it under the lock.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 94bb6b07f96f..b7e0026c271b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -462,11 +462,13 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
  *  can also manage EEE, this function enable the LPI state and start related
  *  timer.
  */
-static bool stmmac_eee_init(struct stmmac_priv *priv)
+static void stmmac_eee_init(struct stmmac_priv *priv)
 {
 	/* Check if MAC core supports the EEE feature. */
-	if (!priv->dma_cap.eee)
-		return false;
+	if (!priv->dma_cap.eee) {
+		priv->eee_enabled = false;
+		return;
+	}
 
 	mutex_lock(&priv->lock);
 
@@ -483,8 +485,9 @@ static bool stmmac_eee_init(struct stmmac_priv *priv)
 						priv->plat->mult_fact_100ns,
 						false);
 		}
+		priv->eee_enabled = false;
 		mutex_unlock(&priv->lock);
-		return false;
+		return;
 	}
 
 	if (priv->eee_active && !priv->eee_enabled) {
@@ -507,9 +510,10 @@ static bool stmmac_eee_init(struct stmmac_priv *priv)
 			  STMMAC_LPI_T(priv->tx_lpi_timer));
 	}
 
+	priv->eee_enabled = true;
+
 	mutex_unlock(&priv->lock);
 	netdev_dbg(priv->dev, "Energy-Efficient Ethernet initialized\n");
-	return true;
 }
 
 /* stmmac_get_tx_hwtstamp - get HW TX timestamps
@@ -967,7 +971,7 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 
 	stmmac_mac_set(priv, priv->ioaddr, false);
 	priv->eee_active = false;
-	priv->eee_enabled = stmmac_eee_init(priv);
+	stmmac_eee_init(priv);
 	stmmac_set_eee_pls(priv, priv->hw, false);
 
 	if (stmmac_fpe_supported(priv))
@@ -1080,7 +1084,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 					     STMMAC_FLAG_RX_CLK_RUNS_IN_LPI));
 		priv->tx_lpi_timer = phy->eee_cfg.tx_lpi_timer;
 		priv->eee_active = phy->enable_tx_lpi;
-		priv->eee_enabled = stmmac_eee_init(priv);
+		stmmac_eee_init(priv);
 		stmmac_set_eee_pls(priv, priv->hw, true);
 	}
 
-- 
2.30.2


