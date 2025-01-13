Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB5E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+VsXR88odtwMSlVe7f6Y99n5yB+/8EudxncAOgJLec=; b=H20RZYGCZRkVFhFqqyGjkHBKWw
	vDIYftQVH8A/P3Kcq9Tnjc9IpndnicrStdje9vf7nd8SL8BqB0RLkn5n+39WdubLyTJRf05cBxb8y
	q1gAfB/kv2J/LWtbMx3x85N0Ojoqpz7WYCn988gDvuXYqwaAusRMFTh/O6+BhRnBhv826G/3ZliIR
	fSuvL1wc4EIttYDB1pwa4zLTlZmkXj26m1MP6Aii5q4+yJ/v3AfcxDA9cARducNnTV56bdjTbJwyh
	9T2UkVoU5ObnhLCGTQkDDVkV8+GnIVSN8kQw2OF07q2ZAVMPtdOkslV+GcEX+t+mIESeMqZJ+yAR8
	6PkA/A8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJ21-000000050Qv-1oIh;
	Mon, 13 Jan 2025 11:54:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXItr-00000004yk0-1Rrj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g+VsXR88odtwMSlVe7f6Y99n5yB+/8EudxncAOgJLec=; b=uaDiXOvuAhAd7fvqgtJPK3Pzym
	JAW2BZnk22M1VKV7SwEZ6cxmi5u/3PMN2R2W0KjhbZ/ljPtCkf4HgyVg0xpM1l+P+yNl4EwrW4xky
	+ttjAuCONpJey143HFrHBiazoXZAEWkELODOTbYoszY298Bw3vm5fb45teYwa+p7IavOGYgIH4Wja
	U87ONwH7CH8l7hYIlTPG3zK7hCCYt7fLfBRJbPG2qq6eCBZDu5/U61bE76wBxkHk2PHupTRtVnKjO
	CLz+BWNNrJjf/pQs0XfdkBs2toSBItyL3bI8xTuF+hiMTT6Gf+MKKRZiwKDe2KtQWz1wV2wXTUoEo
	MIfy/HJw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45898 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXItk-0006WI-1l;
	Mon, 13 Jan 2025 11:46:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXItR-000MBO-GF; Mon, 13 Jan 2025 11:46:05 +0000
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 6/9] net: stmmac: provide stmmac_eee_tx_busy()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXItR-000MBO-GF@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:46:05 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034631_386591_F0BC4D85 
X-CRM114-Status: GOOD (  12.40  )
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

Extract the code which checks whether there's still work to do on any
of the stmmac transmit queues. This will allow us to combine
stmmac_enable_eee_mode() with stmmac_try_to_start_sw_lpi() in the
next patch.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2bb61757e320..ddbcbe3886c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -400,13 +400,7 @@ static void stmmac_enable_hw_lpi_timer(struct stmmac_priv *priv)
 	stmmac_set_eee_lpi_timer(priv, priv->hw, priv->tx_lpi_timer);
 }
 
-/**
- * stmmac_enable_eee_mode - check and enter in LPI mode
- * @priv: driver private structure
- * Description: this function is to verify and enter in LPI mode in case of
- * EEE.
- */
-static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
+static bool stmmac_eee_tx_busy(struct stmmac_priv *priv)
 {
 	u32 tx_cnt = priv->plat->tx_queues_to_use;
 	u32 queue;
@@ -416,9 +410,23 @@ static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
 		struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 
 		if (tx_q->dirty_tx != tx_q->cur_tx)
-			return -EBUSY; /* still unfinished work */
+			return true; /* still unfinished work */
 	}
 
+	return false;
+}
+
+/**
+ * stmmac_enable_eee_mode - check and enter in LPI mode
+ * @priv: driver private structure
+ * Description: this function is to verify and enter in LPI mode in case of
+ * EEE.
+ */
+static int stmmac_enable_eee_mode(struct stmmac_priv *priv)
+{
+	if (stmmac_eee_tx_busy(priv))
+		return -EBUSY; /* still unfinished work */
+
 	/* Check and enter in LPI mode */
 	if (!priv->tx_path_in_lpi_mode)
 		stmmac_set_eee_mode(priv, priv->hw,
-- 
2.30.2


