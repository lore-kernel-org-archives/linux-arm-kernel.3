Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CB1E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 16:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mt9PshpQqw68RFtJuRwMKIvYJt4mlpJLQSaP3lR5Qzk=; b=B0o8QSu5/v4itpF9LuKwFN1vcI
	tx1Ec3uIeD+f5benfFu6xr604iG5BqNcmdszVJLJJC0Hh5IFAgvx/MMcAOkf9sipaEcFlo/ninYaX
	M+nUYJTR13q5dDHiGDLzvjMDfpOFswmfvVdH8czUi0jdJmNlUwKWqIEhvBigvmPA8Rn9WgwyfrjuZ
	WUorxF7XxqbBtIRlyiXbpbWcle9Ws+P5Ns8u6fhk0VZzPrHUifm5iGwOTlJ+mBaAWpDwmZliABl0E
	CPqIyXxYeDxpUH4L36B79ZEPMKZNDCopuFLdyJFEhZFYqJe0qcq4qQd8wkQtOi21DOBaoJ8E6uREp
	ZkULK2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCsQ-00000005jRV-3tTz;
	Tue, 07 Jan 2025 16:56:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCSQ-00000005dYk-3Lbe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Mt9PshpQqw68RFtJuRwMKIvYJt4mlpJLQSaP3lR5Qzk=; b=TRs/wFrbefMQBevnRZ11L1ROMJ
	PPEdgGHgV78aTWt7DstbuheA/huYsrue2LTMKnN++rLniEzjyuQ25PAZn2EJr39BeXzkW1cR6hrYB
	gcSf+qxIFKYVWR/SNaeiUrjiDQo2mdnKEwAsWWzvcgflkGlxyh1vM35lIhub0J60NT7SgXk8DuudI
	hG0d7PvN77PnmHDyeaxfSUkR8rZt4O+0EQTuYAzDaU6LMCc/jSsOchRpK97DcTOHHNneFV2+9lk4R
	VkNc+LvjuAgkzF1G3TbLV/dvVCMxAxbTBMJYykgPzznqYKvSvvRKg1/NeUVpKarK9Nn5I8uP4oXmz
	Htqn8dKw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43532 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVCSM-0007nf-1F;
	Tue, 07 Jan 2025 16:29:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVCSJ-007Y3x-C0; Tue, 07 Jan 2025 16:29:23 +0000
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
Subject: [PATCH net-next v3 11/18] net: stmmac: remove priv->eee_tw_timer
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVCSJ-007Y3x-C0@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:29:23 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_082930_839356_0EFEBC1E 
X-CRM114-Status: GOOD (  11.03  )
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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
index adc51087f2ba..94bb6b07f96f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -464,8 +464,6 @@ static void stmmac_eee_ctrl_timer(struct timer_list *t)
  */
 static bool stmmac_eee_init(struct stmmac_priv *priv)
 {
-	int eee_tw_timer = priv->eee_tw_timer;
-
 	/* Check if MAC core supports the EEE feature. */
 	if (!priv->dma_cap.eee)
 		return false;
@@ -478,7 +476,8 @@ static bool stmmac_eee_init(struct stmmac_priv *priv)
 			netdev_dbg(priv->dev, "disable EEE\n");
 			stmmac_lpi_entry_timer_config(priv, 0);
 			del_timer_sync(&priv->eee_ctrl_timer);
-			stmmac_set_eee_timer(priv, priv->hw, 0, eee_tw_timer);
+			stmmac_set_eee_timer(priv, priv->hw, 0,
+					     STMMAC_DEFAULT_TWT_LS);
 			if (priv->hw->xpcs)
 				xpcs_config_eee(priv->hw->xpcs,
 						priv->plat->mult_fact_100ns,
@@ -491,7 +490,7 @@ static bool stmmac_eee_init(struct stmmac_priv *priv)
 	if (priv->eee_active && !priv->eee_enabled) {
 		timer_setup(&priv->eee_ctrl_timer, stmmac_eee_ctrl_timer, 0);
 		stmmac_set_eee_timer(priv, priv->hw, STMMAC_DEFAULT_LIT_LS,
-				     eee_tw_timer);
+				     STMMAC_DEFAULT_TWT_LS);
 		if (priv->hw->xpcs)
 			xpcs_config_eee(priv->hw->xpcs,
 					priv->plat->mult_fact_100ns,
@@ -3446,8 +3445,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 	else if (ptp_register)
 		stmmac_ptp_register(priv);
 
-	priv->eee_tw_timer = STMMAC_DEFAULT_TWT_LS;
-
 	if (priv->use_riwt) {
 		u32 queue;
 
-- 
2.30.2


