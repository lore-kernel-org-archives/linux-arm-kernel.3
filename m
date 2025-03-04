Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAE6C282DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXrgPDsYX+qi5PCKnDMpC3DGuTxL3IQ2NcTFG6yM2Jg=; b=mVnDB6ASPkJ3tb2m4dU9jDCUVW
	JP6w6QUfUSvXioxIg+4CuBow2o+Ys7ooT2WBpIIlAsIrXtv75vuwAnUKNdiXk0yOvCUTSeP+q+5Z+
	UJ+8plBNsHUUJ45q5+UFnFSo/9t9/isQmOiJpmZj+GUDPJgepu9frgVvLw/8qETbR2F8wOCPAXm0T
	R2iq0j6l9AuQDaQYYbEtsxi18V3AgSNZHTRcHjuYl8I5gFj1xi9tdVdpfv6SX9fH9dbf1S8Mf9fkg
	QjVoMHMPT0kLn42It7GxNlXQ7J9P6qK+qITVVtiv2fTD5UFbxpaUDNRgmn4xJ3LJGtPCkeLgtsqGt
	3kN1WuSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4p-00000004Wek-39Cb;
	Tue, 04 Mar 2025 12:08:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPuM-00000004HlN-0BAf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BXrgPDsYX+qi5PCKnDMpC3DGuTxL3IQ2NcTFG6yM2Jg=; b=K+ht9TM7v1cHDvM/DqveKBITq5
	iX88tAr8kWKXUcwXJUV2IDI3D1Dh66xz/oeXN4UAuFIzDYdZYSoxB+p791/5mHbJRUFNzYUpOJqEF
	QXBL0CMjq6iNIv9BbHUYxV9bjcV681CbpFI2Fjk9GlrnriOrhbM+HOEtpbnT1t5bFKciWzoo/6PH5
	7JByaOL1P4GiDS6PnAum2n0wLHDp+jeAN30MPSDAj1u4qpoSyWhhN39u+6w9/biPokN/JizVlPWk6
	ljdvVjlAqMXPiFuJIV9PB3ZmdA08dCkof2CyPD4FkWMx2on4USxoxYN5bZIBHMVOmf2vNe+9Dv1cP
	191CsabQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53414 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tpPuE-0002Ux-1M;
	Tue, 04 Mar 2025 10:53:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tpPtu-005Soa-Ac; Tue, 04 Mar 2025 10:53:26 +0000
In-Reply-To: <Z8bbnSG67rqTj0pH@shell.armlinux.org.uk>
References: <Z8bbnSG67rqTj0pH@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>,
	 Thierry Reding <treding@nvidia.com>,
	 "Lad,
	 Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 2/3] net: phylink: add functions to block/unblock
 rx clock stop
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tpPtu-005Soa-Ac@rmk-PC.armlinux.org.uk>
Date: Tue, 04 Mar 2025 10:53:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_025354_081190_364E330E 
X-CRM114-Status: GOOD (  18.05  )
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

Some MACs require the PHY receive clock to be running to complete setup
actions. This may fail if the PHY has negotiated EEE, the MAC supports
receive clock stop, and the link has entered LPI state. Provide a pair
of APIs that MAC drivers can use to temporarily block the PHY disabling
the receive clock.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 62 +++++++++++++++++++++++++++++++--------
 include/linux/phylink.h   |  3 ++
 2 files changed, 53 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0aae0bb2a254..9a62808cf935 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -88,6 +88,7 @@ struct phylink {
 	bool mac_enable_tx_lpi;
 	bool mac_tx_clk_stop;
 	u32 mac_tx_lpi_timer;
+	u8 mac_rx_clk_stop_blocked;
 
 	struct sfp_bus *sfp_bus;
 	bool sfp_may_have_phy;
@@ -2592,6 +2593,55 @@ void phylink_stop(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_stop);
 
+
+void phylink_rx_clk_stop_block(struct phylink *pl)
+{
+	ASSERT_RTNL();
+
+	if (pl->mac_rx_clk_stop_blocked == U8_MAX) {
+		phylink_warn(pl, "%s called too many times - ignoring\n",
+			     __func__);
+		dump_stack();
+		return;
+	}
+
+	/* Disable PHY receive clock stop if this is the first time this
+	 * function has been called and clock-stop was previously enabled.
+	 */
+	if (pl->mac_rx_clk_stop_blocked++ == 0 &&
+	    pl->mac_supports_eee_ops && pl->phydev)
+	    pl->config->eee_rx_clk_stop_enable)
+		phy_eee_rx_clock_stop(pl->phydev, false);
+}
+
+/**
+ * phylink_rx_clk_stop_unblock() - unblock PHY ability to stop receive clock
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * All calls to phylink_rx_clk_stop_block() must be balanced with a
+ * corresponding call to phylink_rx_clk_stop_unblock() to restore the PHYs
+ * clock stop ability.
+ */
+void phylink_rx_clk_stop_unblock(struct phylink *pl)
+{
+	ASSERT_RTNL();
+
+	if (pl->mac_rx_clk_stop_blocked == 0) {
+		phylink_warn(pl, "%s called too many times - ignoring\n",
+			     __func__);
+		dump_stack();
+		return;
+	}
+
+	/* Re-enable PHY receive clock stop if the number of unblocks matches
+	 * the number of calls to the block function above.
+	 */
+	if (--pl->mac_rx_clk_stop_blocked == 0 &&
+	    pl->mac_supports_eee_ops && pl->phydev &&
+	    pl->config->eee_rx_clk_stop_enable)
+		phy_eee_rx_clock_stop(pl->phydev, true);
+}
+
 /**
  * phylink_suspend() - handle a network device suspend event
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2649,18 +2699,6 @@ void phylink_resume(struct phylink *pl)
 
 	ASSERT_RTNL();
 
-	if (pl->mac_supports_eee_ops && pl->phydev) {
-		/* Explicitly configure whether the PHY is allowed to stop its
-		 * receive clock on resume to ensure that it is correctly
-		 * configured.
-		 */
-		ret = phy_eee_rx_clock_stop(pl->phydev,
-					    pl->config->eee_rx_clk_stop_enable);
-		if (ret == -EOPNOTSUPP)
-			phylink_warn(pl, "failed to set rx clock stop: %pe\n",
-				     ERR_PTR(ret));
-	}
-
 	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
 		/* Wake-on-Lan enabled, MAC handling */
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 08df65f6867a..249c437d6b7b 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -698,6 +698,9 @@ int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs);
 void phylink_start(struct phylink *);
 void phylink_stop(struct phylink *);
 
+void phylink_rx_clk_stop_block(struct phylink *);
+void phylink_rx_clk_stop_unblock(struct phylink *);
+
 void phylink_suspend(struct phylink *pl, bool mac_wol);
 void phylink_resume(struct phylink *pl);
 
-- 
2.30.2


