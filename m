Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19802D3B7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnhyvj3d8XtptBHuFTiG10lDwil4VamFlPvg5Ad2Ku0=; b=rlGUoQXjJtAkI3R7/CPP/w5tFs
	gJ0LLKnmtjDkrcdhAQ8y7l/NvlVTY7Fo0Yh5Am2xnGkFWyBG0LbABINTx6z9RQlCYsfWX9ZIigo7Y
	ZTbJDTgoLjZNBZ8hAV082Bqv6c8+0Op1KNMb1vw9R/s9XJwjQw27POr8XYIvaxxplST9VY3quVSHX
	Dok2+OYfCHCACbsTYiSzhYY+lkz6QydyUM38oIk77x6IHucMsa0vnKUehSYrDIBJaIHmG+845hhau
	+0G/nPXuAXHUba7uKPg1Zp+U9joC9neS/WecvSM69vArJscgpW9MhrW0jufl+UnouyJLB55ZCMbqj
	7gCLfwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrzC-0000000AAsN-44wq;
	Tue, 26 Nov 2024 09:35:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFroo-0000000A8Yg-3DBg;
	Tue, 26 Nov 2024 09:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nnhyvj3d8XtptBHuFTiG10lDwil4VamFlPvg5Ad2Ku0=; b=02NCBbiSkgV8CkMZ9aROGJtACH
	ES5TXDNPszVbNJIfxXaf8CIZxGG37MVXvjVS9Y1kYftelezHuDdLQ2fx02CS2GsxVLhc1PugMI+O1
	O4/+2xDTd97UMNxJMbDaE7T0mt9HQtDNpSuBtaQML1tAcVG/Wpp0x0hVieTuimaA1Q++AVyC9luRc
	D5UQcHR+PVso12jnVPRQQ/Qfr9H2im0MAlUDRzl0+ncZegyLq9BchKsPGd5ZlGYKvQz9WZfU8BCqV
	raofThy4nNyl+vJVf36ekJ02wA9uB1JbNbQsOc5nfDd02Al7+ZtyVVoH2OORPyKIWs9Jq0LHW0o+Q
	1kcG+ZxA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:32898 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFrod-0006UK-03;
	Tue, 26 Nov 2024 09:25:03 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFrob-005xQS-Hz; Tue, 26 Nov 2024 09:25:01 +0000
In-Reply-To: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next 09/16] net: phylink: add pcs_inband_caps() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFrob-005xQS-Hz@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 09:25:01 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_012516_476685_36A1B318 
X-CRM114-Status: GOOD (  20.25  )
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

Add a pcs_inband_caps() method to query the PCS for its inband link
capabilities, and use this to determine whether link modes used with
optical SFPs can be supported.

When a PCS does not provide a method, we allow inband negotiation to
be either on or off, making this a no-op until the pcs_inband_caps()
method is implemented by a PCS driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 60 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   | 17 +++++++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e43a083cec57..ca52cb23187d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -990,6 +990,15 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
 	}
 }
 
+static unsigned int phylink_pcs_inband_caps(struct phylink_pcs *pcs,
+				    phy_interface_t interface)
+{
+	if (pcs && pcs->ops->pcs_inband_caps)
+		return pcs->ops->pcs_inband_caps(pcs, interface);
+
+	return 0;
+}
+
 static void phylink_pcs_pre_config(struct phylink_pcs *pcs,
 				   phy_interface_t interface)
 {
@@ -1043,6 +1052,24 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+/* Query inband for a specific interface mode, asking the MAC for the
+ * PCS which will be used to handle the interface mode.
+ */
+static unsigned int phylink_inband_caps(struct phylink *pl,
+					 phy_interface_t interface)
+{
+	struct phylink_pcs *pcs;
+
+	if (!pl->mac_ops->mac_select_pcs)
+		return 0;
+
+	pcs = pl->mac_ops->mac_select_pcs(pl->config, interface);
+	if (!pcs)
+		return 0;
+
+	return phylink_pcs_inband_caps(pcs, interface);
+}
+
 static void phylink_pcs_poll_stop(struct phylink *pl)
 {
 	if (pl->cfg_link_an_mode == MLO_AN_INBAND)
@@ -2541,6 +2568,26 @@ int phylink_ethtool_ksettings_get(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_ethtool_ksettings_get);
 
+static bool phylink_validate_pcs_inband_autoneg(struct phylink *pl,
+					        phy_interface_t interface,
+						unsigned long *adv)
+{
+	unsigned int inband = phylink_inband_caps(pl, interface);
+	unsigned int mask;
+
+	/* If the PCS doesn't implement inband support, be permissive. */
+	if (!inband)
+		return true;
+
+	if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, adv))
+		mask = LINK_INBAND_ENABLE;
+	else
+		mask = LINK_INBAND_DISABLE;
+
+	/* Check whether the PCS implements the required mode */
+	return !!(inband & mask);
+}
+
 /**
  * phylink_ethtool_ksettings_set() - set the link settings
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2671,6 +2718,13 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 	    phylink_is_empty_linkmode(config.advertising))
 		return -EINVAL;
 
+	/* Validate the autonegotiation state. We don't have a PHY in this
+	 * situation, so the PCS is the media-facing entity.
+	 */
+	if (!phylink_validate_pcs_inband_autoneg(pl, config.interface,
+						 config.advertising))
+		return -EINVAL;
+
 	mutex_lock(&pl->state_mutex);
 	pl->link_config.speed = config.speed;
 	pl->link_config.duplex = config.duplex;
@@ -3350,6 +3404,12 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 	phylink_dbg(pl, "optical SFP: chosen %s interface\n",
 		    phy_modes(interface));
 
+	if (!phylink_validate_pcs_inband_autoneg(pl, interface,
+						 config.advertising)) {
+		phylink_err(pl, "autoneg setting not compatible with PCS");
+		return -EINVAL;
+	}
+
 	config.interface = interface;
 
 	/* Ignore errors if we're expecting a PHY to attach later */
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 595139797acb..ef26111d0040 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -422,6 +422,7 @@ struct phylink_pcs {
 /**
  * struct phylink_pcs_ops - MAC PCS operations structure.
  * @pcs_validate: validate the link configuration.
+ * @pcs_inband_caps: query inband support for interface mode.
  * @pcs_enable: enable the PCS.
  * @pcs_disable: disable the PCS.
  * @pcs_pre_config: pre-mac_config method (for errata)
@@ -437,6 +438,8 @@ struct phylink_pcs {
 struct phylink_pcs_ops {
 	int (*pcs_validate)(struct phylink_pcs *pcs, unsigned long *supported,
 			    const struct phylink_link_state *state);
+	unsigned int (*pcs_inband_caps)(struct phylink_pcs *pcs,
+					phy_interface_t interface);
 	int (*pcs_enable)(struct phylink_pcs *pcs);
 	void (*pcs_disable)(struct phylink_pcs *pcs);
 	void (*pcs_pre_config)(struct phylink_pcs *pcs,
@@ -473,6 +476,20 @@ struct phylink_pcs_ops {
 int pcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
 		 const struct phylink_link_state *state);
 
+/**
+ * pcs_inband_caps - query PCS in-band capabilities for interface mode.
+ * @pcs: a pointer to a &struct phylink_pcs.
+ * @interface: interface mode to be queried
+ *
+ * Returns zero if it is unknown what in-band signalling is supported by the
+ * PHY (e.g. because the PHY driver doesn't implement the method.) Otherwise,
+ * returns a bit mask of the LINK_INBAND_* values from
+ * &enum link_inband_signalling to describe which inband modes are supported
+ * for this interface mode.
+ */
+unsigned int pcs_inband_caps(struct phylink_pcs *pcs,
+			     phy_interface_t interface);
+
 /**
  * pcs_enable() - enable the PCS.
  * @pcs: a pointer to a &struct phylink_pcs.
-- 
2.30.2


