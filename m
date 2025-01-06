Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57885E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gI78ITBgr5u8YVqy0tbvTfgVY6l4zQzaJ81AYLIoMY=; b=WhTYEF9BF+U3tkQOqxwtYsNdpS
	LDzXx8A1ALAR6EbZfSbfcZyjzMh9XUqhYSuFj7ntTuScpoTbdK3w4PK8tcqOYPhXgJdTCyyvKA+7u
	Yo2dq7L8788rqLUgrMTkohJkXSEdX9yh33soAxlkAo5psAkEXv3KBDegX5W2tTtpfvFDJg1DwVxB3
	rdbqU0EY+T8t5rm27FL90OAarBROaPmoercoejOvd6mlORbL8vCdVVX93oiFb98HBR6saw8ie4noo
	NjY4fl0etpTsAQqSM0IoxjgQNtjliIK/WNQMWZxkUNmXQu/MP6hrW+yZpMciawR/5ba4jhzNneUwq
	m9L787Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmQ1-00000001FzJ-3drm;
	Mon, 06 Jan 2025 12:41:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmAw-00000001DCg-0gZS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6gI78ITBgr5u8YVqy0tbvTfgVY6l4zQzaJ81AYLIoMY=; b=V/ZmxwXDi1xF14+Akhuih89uOh
	RZzuGN5+3ocWSNv0k2fqzUB3F/x1SjCXKTt9sNKw1s6E1g5h18geA3i8BqO3MyL7DjM5UXIyWmnXu
	010n0hTB2hVJlUxN7ZKRPD7wji3qFGUkdmk75C0tj7fSXfKbZfbDIh3VOlgO5Vlp7kOdxH/erMCcN
	cOzEtDTB4R0XgPfsI7zk7m0o5glCnzhyAB0Zajx/RpbryqKr7eZ/Xdsq/VUmWG1ot0PfwvXcVDLGp
	HXox0RWGJubC9hmvplSrqNbm/NFOKkpUIBK3t5IfEUuBXLpJzYb3gY9jxFFEy8I48wL8ORMn6AQgi
	N4BExLfA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42818 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUmAr-0005sl-2W;
	Mon, 06 Jan 2025 12:25:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUmAo-007VXb-Pg; Mon, 06 Jan 2025 12:25:34 +0000
In-Reply-To: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 10/17] net: stmmac: remove priv->eee_tw_timer
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUmAo-007VXb-Pg@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 12:25:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_042542_207881_FA23FCD2 
X-CRM114-Status: GOOD (  11.30  )
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

priv->eee_tw_timer is only assigned during initialisation to a
constant value (STMMAC_DEFAULT_TWT_LS) and then never changed.

Remove priv->eee_tw_timer, and instead use STMMAC_DEFAULT_TWT_LS
for both uses in stmmac_eee_init().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 507b6ac14289..1556804cca38 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -308,7 +308,6 @@ struct stmmac_priv {
 	int eee_enabled;
 	int eee_active;
 	u32 tx_lpi_timer;
-	int eee_tw_timer;
 	bool eee_sw_timer_en;
 	unsigned int mode;
 	unsigned int chain_mode;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6b66a25716b0..7cce2eb3d82e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -466,8 +466,6 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
  */
 static bool stmmac_eee_init(struct stmmac_priv *priv)
 {
-	int eee_tw_timer = priv->eee_tw_timer;
-
 	/* Check if MAC core supports the EEE feature. */
 	if (!priv->dma_cap.eee)
 		return false;
@@ -480,7 +478,8 @@ static bool stmmac_eee_init(struct stmmac_priv *priv)
 			netdev_dbg(priv->dev, "disable EEE\n");
 			stmmac_lpi_entry_timer_config(priv, 0);
 			del_timer_sync(&priv->eee_ctrl_timer);
-			stmmac_set_eee_timer(priv, priv->hw, 0, eee_tw_timer);
+			stmmac_set_eee_timer(priv, priv->hw, 0,
+					     STMMAC_DEFAULT_TWT_LS);
 			if (priv->hw->xpcs)
 				xpcs_config_eee(priv->hw->xpcs,
 						priv->plat->mult_fact_100ns,
@@ -493,7 +492,7 @@ static bool stmmac_eee_init(struct stmmac_priv *priv)
 	if (priv->eee_active && !priv->eee_enabled) {
 		timer_setup(&priv->eee_ctrl_timer, stmmac_eee_ctrl_timer, 0);
 		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
-				     eee_tw_timer);
+				     STMMAC_DEFAULT_TWT_LS);
 		if (priv->hw->xpcs)
 			xpcs_config_eee(priv->hw->xpcs,
 					priv->plat->mult_fact_100ns,
@@ -3441,8 +3440,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 	else if (ptp_register)
 		stmmac_ptp_register(priv);
 
-	priv->eee_tw_timer = STMMAC_DEFAULT_TWT_LS;
-
 	if (priv->use_riwt) {
 		u32 queue;
 
-- 
2.30.2


