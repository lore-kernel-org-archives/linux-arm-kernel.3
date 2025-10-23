Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD533CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61fUCnPjR/ABE1wFOydhMi2E+9470AJphBO8jqHbD04=; b=0mCRrp+c5X6EjNVuGnSldWc9Tx
	bNgAdGTwPbaaad/Yrc8CYozj4JQZI/tiTnrGoW+ZgtH1iiII+Ti4fhbE/EeRFB2JIvrC5CReAFRyq
	+uEEGDLq++xRGWkr0+8aXZPtoZbXoIYKsNHBH2MVzX9Y4Z78Sgyb8J56OtXoU3IUWJxA69p7y/6VK
	xssiTSRDOMQjTAiN7gA+J7XDLPUP3p9yLAaNGMlQL3cAArTND+DiU3rJs2pygmEtCHWX7MJ3t3Rcq
	u1XOqHUn29jXDlYyR24PoI0hOEOTWabE2cyiRfhOPcEWnQtYUqEgom+8P8r6jeOYlnsEkQcEqqdCN
	lftGIDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrRO-00000005fcC-1p5Q;
	Thu, 23 Oct 2025 09:17:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrRM-00000005fZF-1Du2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 09:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=61fUCnPjR/ABE1wFOydhMi2E+9470AJphBO8jqHbD04=; b=hZY4b8+sxU9NLCanLbj6aaP1le
	ibQZFjSMwCgiuQ94RFk+4Bz9O0cyvDArev0xsxdBCRWc66rGeY5EgxCZb+SyomB2FJhIcIkB5lCV6
	gaS7CbGfaufP8WvIhBxzLfGO/oAD/PiQQMNOYnN2WlMTZLysZcRMiY/VH8NG8a5jnA+2bsmdvOlbD
	k8mOg12WsF5I4rVDjbKP1cN/o4ZpzCN5XDbiy38erLRVsyDt1chblS8PSZ1FcC6Sj5U2wpd9x8fAx
	0RomoOz86S50uP3Nvvw1O/y0twHO0u+OBSDDKIxSXH/LGxenN3KFqWbc8aQYwftcu8Dkr4EQvyB65
	PndrYpPQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38306 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vBrR8-0000000061Y-2am2;
	Thu, 23 Oct 2025 10:16:46 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vBrR7-0000000BLza-2PjK;
	Thu, 23 Oct 2025 10:16:45 +0100
In-Reply-To: <aPnyW54J80h9DmhB@shell.armlinux.org.uk>
References: <aPnyW54J80h9DmhB@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>
Subject: [PATCH net-next v2 4/6] net: phylink: add phylink managed wake-on-lan
 PHY speed control
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vBrR7-0000000BLza-2PjK@rmk-PC.armlinux.org.uk>
Date: Thu, 23 Oct 2025 10:16:45 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_021700_336435_6DB9F954 
X-CRM114-Status: GOOD (  13.99  )
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

Some drivers, e.g. stmmac, use the speed_up()/speed_down() APIs to
gain additional power saving during Wake-on-LAN where the PHY is
managing the state.

Add support to phylink for this, which can be enabled by the MAC
driver. Only change the PHY speed if the PHY is configured for
wake-up, but without any wake-up on the MAC side, as MAC side
means changing the configuration once the negotiation has
completed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v2: use phylink_speed_up/down()
---
 drivers/net/phy/phylink.c | 12 ++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index bec44ebdf80b..6e1243bf68aa 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2576,6 +2576,12 @@ static bool phylink_phy_supports_wol(struct phylink *pl,
 	return phydev && (pl->config->wol_phy_legacy || phy_can_wakeup(phydev));
 }
 
+static bool phylink_phy_pm_speed_ctrl(struct phylink *pl)
+{
+	return pl->config->wol_phy_speed_ctrl && !pl->wolopts_mac &&
+	       pl->phydev && phy_may_wakeup(pl->phydev);
+}
+
 /**
  * phylink_suspend() - handle a network device suspend event
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2625,6 +2631,9 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 	} else {
 		phylink_stop(pl);
 	}
+
+	if (phylink_phy_pm_speed_ctrl(pl))
+		phylink_speed_down(pl, false);
 }
 EXPORT_SYMBOL_GPL(phylink_suspend);
 
@@ -2664,6 +2673,9 @@ void phylink_resume(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
+	if (phylink_phy_pm_speed_ctrl(pl))
+		phylink_speed_up(pl);
+
 	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
 		/* Wake-on-Lan enabled, MAC handling */
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 59cb58b29d1d..38363e566ac3 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -157,6 +157,7 @@ enum phylink_op_type {
  * @lpi_timer_default: Default EEE LPI timer setting.
  * @eee_enabled_default: If set, EEE will be enabled by phylink at creation time
  * @wol_phy_legacy: Use Wake-on-Lan with PHY even if phy_can_wakeup() is false
+ * @wol_phy_speed_ctrl: Use phy speed control on suspend/resume
  * @wol_mac_support: Bitmask of MAC supported %WAKE_* options
  */
 struct phylink_config {
@@ -178,6 +179,7 @@ struct phylink_config {
 
 	/* Wake-on-Lan support */
 	bool wol_phy_legacy;
+	bool wol_phy_speed_ctrl;
 	u32 wol_mac_support;
 };
 
-- 
2.47.3


