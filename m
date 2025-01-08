Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C59E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZ5T8q7bO1y7ursfh0UIM7D9ZCy/fpzscizel2RCB9k=; b=U0kZtcxgToIhf2BuMkmBhkXvm2
	SNJSxXm1xrVhf/YLiDKfd/iJ699WsCUynIe5FJmPJx8RILrRTZ/xPY+FXpWVv0CHzQGwA48ZESi3t
	6SkEUCwWGsaDCTDq7l1q2608+RyFB1DVCFIHU01wjio7EOYGX9NayN1Dfm1Mi5Vx60p16lxmv3wPU
	bKJpdPRbxxxxrawWgXbUcRu+2IGXttfRSGQbUArqsrtM7iHtofZWdRH/b/tp/0M1cM8uRQGy2hDo8
	0BhOIgQpDsdfGMDHd3rm2O6fa9ICZG/ug6fs7VTuZ7W5SDnDxONZ7a+q6PKkW0FuEcJbbkYRj+OZe
	27d0FhHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZc1-00000009KwF-0ZLj;
	Wed, 08 Jan 2025 17:12:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZEg-00000009Ft2-1VCX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SZ5T8q7bO1y7ursfh0UIM7D9ZCy/fpzscizel2RCB9k=; b=lD7wovUA4SEp8YCycPuID0AEDI
	/JMGR3T9RnM8NRjYfzi54RQ6FC2HLjKh+PdwGd8Uk/D/NFapCd/AXCZbIBqXgQzT/WD3ab9OP3kQz
	8U1mcIfifWx8ou8ZlGQq2FQP+0FqNlQrFhBVena1alFTdB6JHgadJzuhM/Mds3Aqa+86N13gvpgpL
	YLQzEmcRJxn93tFWkW2+vjt5RKx5ULsfoBtdIZN7lmEU6rtJhO0TzkDufrYnoIBJmZB9oT5NxKWvl
	/RF0DN7tpZjAHPBKaQfE7+xELdGmF31esqywIMJaFeC1yQuI/sKAERi1q3X+iS4NrghhI1oqMrrDN
	Stk0zWDQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41958 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVZEZ-0000xA-2l;
	Wed, 08 Jan 2025 16:48:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVZEG-0002Kk-VH; Wed, 08 Jan 2025 16:48:25 +0000
In-Reply-To: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
References: <Z36sHIlnExQBuFJE@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v4 11/18] net: stmmac: remove priv->eee_tw_timer
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVZEG-0002Kk-VH@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Jan 2025 16:48:24 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_084850_402196_86ED49DA 
X-CRM114-Status: GOOD (  11.12  )
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
Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
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
index 04477f1a5504..7bbf7839e69b 100644
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


