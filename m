Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646BCCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 12:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSG2wILOEdWjXH1AF3TaYWkkm1KSCOJcJ002Wp73IQo=; b=Ena5ix7h0JSC5poIcDwf67juo0
	fOu18pnSEcdyx8UzM+azKkU6uPg5dz6+SGacl2j77DbzdKKEVMp4wsL2Xy5hFUY1FcNVToOHaUssB
	c1dwvCholSFwvqboQt0FiTvb02C788wZMgSmm5uIo7VYOrOhmNFSvmlVSexUPsFNVCbAjDbI2UtSw
	fNXU6j2YtnLhhf3PqKY2DSLNr6kJS+8pJWwfANmrkrUDla7UiyvaQambsy8HHKrrm2pS4DE9RplGR
	j0cedrMP4IuAQ0Yuj2/ZYziKpntUpBdKuKwqSKSHpviRI8SLH1/tcxOXbKmTlDabS/pwpHuuzAist
	sp3JqUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCf-00000007l54-19YS;
	Fri, 17 Oct 2025 12:05:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCd-00000007l3y-3vUD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 12:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=sSG2wILOEdWjXH1AF3TaYWkkm1KSCOJcJ002Wp73IQo=; b=V1a35IHdJAv3DSQ0lzeIN2eG7W
	1CK0Q74YvaPXUSvZEemxs13wCJEwkp6kUsHa6nCfIpX/L0Ow4siZL7nlkxwYCxMNas1UdtPGenomC
	FL995u1MgB1feN/xBnDPFZpV3gjtfhiaEXmgjWcAojFvoetRTK/J/HD2pf4308LirsDahqS3tc8XL
	vgBgkzCxa8toKWauahV1wln3I7Q1MKTPkudL2OlMJ56DiDNLyAWftAlor3Kb1arLrVeMSoKmMNdSr
	5Jztl4tu9Y9SOsBqjuNgFga29FXf1LAV3dU0xt02fC/o0eozUJqB/3lp57KnCuNwxlmYc8yb4G+WP
	4qYghdCw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCa-00000007Ydz-3rRM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 12:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sSG2wILOEdWjXH1AF3TaYWkkm1KSCOJcJ002Wp73IQo=; b=dO7BHL4JDrSKbq4ThiP0ywbVcl
	Am4SYnbsQJ9uPZFrjVRJTtW+q8K9onqRCRFYL4MoLLNcMI3m+eARdtc7l41KaOWru4FZuoPwWUt6F
	T4RoXOsrR3Vk9JyoL4Rh8UMyYoUY2SUhwDJ9EiG1zsiLwArg2bb9cQdfJO/C36BRBrEUyqUbCNUjz
	1ba8HZe0HrirjiZTGkojciVygmp0TFpeOEYSIVYpODS0Q7CjaxFG8Yu2j5nUW8NDjp5IaC/rkhwLk
	CiOERs/qqEPrqtM137ZDjuNhKHpt1Du8jb7lB/qtQK6d1QaHzia3PTmY9f9Ve+mAFsGVDySP0hpCI
	6hmybnhA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35840 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v9jCV-000000007q3-2FKP;
	Fri, 17 Oct 2025 13:04:51 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v9jCT-0000000B2Ob-1yo3;
	Fri, 17 Oct 2025 13:04:50 +0100
In-Reply-To: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 3/6] net: phylink: add phylink managed MAC
 Wake-on-Lan support
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v9jCT-0000000B2Ob-1yo3@rmk-PC.armlinux.org.uk>
Date: Fri, 17 Oct 2025 13:04:49 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_130457_275657_A27272FC 
X-CRM114-Status: GOOD (  27.29  )
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

Add core phylink managed Wake-on-Lan support, which is enabled when the
MAC driver fills in the new .mac_wol_set() method that this commit
creates.

When this feature is disabled, phylink acts as it has in the past,
merely passing the ethtool WoL calls to phylib whenever a PHY exists.
No other new functionality provided by this commit is enabled.

When this feature is enabled, a more inteligent approach is used.
Phylink will first pass WoL options to the PHY, read them back, and
attempt to set any options that were not set at the PHY at the MAC.

Since we have PHY drivers that report they support WoL, and accept WoL
configuration even though they aren't wired up to be capable of waking
the system, we need a way to differentiate between PHYs that think
they support WoL and those which actually do. As PHY drivers do not
make use of the driver model's wake-up infrastructure, but could, we
use this to determine whether PHY drivers can participate. This gives
a path forward where, as MAC drivers are converted to this, it
encourages PHY drivers to also be converted.

Phylink will also ignore the mac_wol argument to phylink_suspend() as
it now knows the WoL state at the MAC.

MAC drivers are expected to record/configure the Wake-on-Lan state in
their .mac_set_wol() method, and deal appropriately with it in their
suspend/resume methods. The driver model provides assistance to set the
IRQ wake support which may assist driver authors in achieving the
necessary configuration.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 80 +++++++++++++++++++++++++++++++++++++--
 include/linux/phylink.h   | 26 +++++++++++++
 2 files changed, 102 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 9d7799ea1c17..939438a6d6f5 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -93,6 +93,9 @@ struct phylink {
 	u8 sfp_port;
 
 	struct eee_config eee_cfg;
+
+	u32 wolopts_mac;
+	u8 wol_sopass[SOPASS_MAX];
 };
 
 #define phylink_printk(level, pl, fmt, ...) \
@@ -2562,6 +2565,17 @@ void phylink_rx_clk_stop_unblock(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_rx_clk_stop_unblock);
 
+static bool phylink_mac_supports_wol(struct phylink *pl)
+{
+	return !!pl->mac_ops->mac_wol_set;
+}
+
+static bool phylink_phy_supports_wol(struct phylink *pl,
+				     struct phy_device *phydev)
+{
+	return phydev && (pl->config->wol_phy_legacy || phy_can_wakeup(phydev));
+}
+
 /**
  * phylink_suspend() - handle a network device suspend event
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2575,11 +2589,17 @@ EXPORT_SYMBOL_GPL(phylink_rx_clk_stop_unblock);
  *   can also bring down the link between the MAC and PHY.
  * - If Wake-on-Lan is active, but being handled by the MAC, the MAC
  *   still needs to receive packets, so we can not bring the link down.
+ *
+ * Note: when phylink managed Wake-on-Lan is in use, @mac_wol is ignored.
+ * (struct phylink_mac_ops.mac_set_wol populated.)
  */
 void phylink_suspend(struct phylink *pl, bool mac_wol)
 {
 	ASSERT_RTNL();
 
+	if (phylink_mac_supports_wol(pl))
+		mac_wol = !!pl->wolopts_mac;
+
 	if (mac_wol && (!pl->netdev || pl->netdev->ethtool->wol_enabled)) {
 		/* Wake-on-Lan enabled, MAC handling */
 		mutex_lock(&pl->state_mutex);
@@ -2689,8 +2709,24 @@ void phylink_ethtool_get_wol(struct phylink *pl, struct ethtool_wolinfo *wol)
 	wol->supported = 0;
 	wol->wolopts = 0;
 
-	if (pl->phydev)
-		phy_ethtool_get_wol(pl->phydev, wol);
+	if (phylink_mac_supports_wol(pl)) {
+		if (phylink_phy_supports_wol(pl, pl->phydev))
+			phy_ethtool_get_wol(pl->phydev, wol);
+
+		/* Where the MAC augments the WoL support, merge its support and
+		 * current configuration.
+		 */
+		if (~wol->wolopts & pl->wolopts_mac & WAKE_MAGICSECURE)
+			memcpy(wol->sopass, pl->wol_sopass,
+			       sizeof(wol->sopass));
+
+		wol->supported |= pl->config->wol_mac_support;
+		wol->wolopts |= pl->wolopts_mac;
+	} else {
+		/* Legacy */
+		if (pl->phydev)
+			phy_ethtool_get_wol(pl->phydev, wol);
+	}
 }
 EXPORT_SYMBOL_GPL(phylink_ethtool_get_wol);
 
@@ -2707,12 +2743,48 @@ EXPORT_SYMBOL_GPL(phylink_ethtool_get_wol);
  */
 int phylink_ethtool_set_wol(struct phylink *pl, struct ethtool_wolinfo *wol)
 {
+	struct ethtool_wolinfo w;
 	int ret = -EOPNOTSUPP;
+	bool changed;
+	u32 wolopts;
 
 	ASSERT_RTNL();
 
-	if (pl->phydev)
-		ret = phy_ethtool_set_wol(pl->phydev, wol);
+	if (phylink_mac_supports_wol(pl)) {
+		wolopts = wol->wolopts;
+
+		if (phylink_phy_supports_wol(pl, pl->phydev)) {
+			ret = phy_ethtool_set_wol(pl->phydev, wol);
+			if (ret != 0 && ret != -EOPNOTSUPP)
+				return ret;
+
+			phy_ethtool_get_wol(pl->phydev, &w);
+
+			/* Any Wake-on-Lan modes which the PHY is handling
+			 * should not be passed on to the MAC.
+			 */
+			wolopts &= ~w.wolopts;
+		}
+
+		wolopts &= pl->config->wol_mac_support;
+		changed = pl->wolopts_mac != wolopts;
+		if (wolopts & WAKE_MAGICSECURE)
+			changed |= !!memcmp(wol->sopass, pl->wol_sopass,
+					    sizeof(wol->sopass));
+		memcpy(pl->wol_sopass, wol->sopass, sizeof(pl->wol_sopass));
+
+		if (changed) {
+			ret = pl->mac_ops->mac_wol_set(pl->config, wolopts,
+						       wol->sopass);
+			if (!ret)
+				pl->wolopts_mac = wolopts;
+		} else {
+			ret = 0;
+		}
+	} else {
+		if (pl->phydev)
+			ret = phy_ethtool_set_wol(pl->phydev, wol);
+	}
 
 	return ret;
 }
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 9af0411761d7..59cb58b29d1d 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -156,6 +156,8 @@ enum phylink_op_type {
  * @lpi_capabilities: MAC speeds which can support LPI signalling
  * @lpi_timer_default: Default EEE LPI timer setting.
  * @eee_enabled_default: If set, EEE will be enabled by phylink at creation time
+ * @wol_phy_legacy: Use Wake-on-Lan with PHY even if phy_can_wakeup() is false
+ * @wol_mac_support: Bitmask of MAC supported %WAKE_* options
  */
 struct phylink_config {
 	struct device *dev;
@@ -173,6 +175,10 @@ struct phylink_config {
 	unsigned long lpi_capabilities;
 	u32 lpi_timer_default;
 	bool eee_enabled_default;
+
+	/* Wake-on-Lan support */
+	bool wol_phy_legacy;
+	u32 wol_mac_support;
 };
 
 void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
@@ -188,6 +194,7 @@ void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
  * @mac_link_up: allow the link to come up.
  * @mac_disable_tx_lpi: disable LPI.
  * @mac_enable_tx_lpi: enable and configure LPI.
+ * @mac_wol_set: configure Wake-on-Lan settings at the MAC.
  *
  * The individual methods are described more fully below.
  */
@@ -211,6 +218,9 @@ struct phylink_mac_ops {
 	void (*mac_disable_tx_lpi)(struct phylink_config *config);
 	int (*mac_enable_tx_lpi)(struct phylink_config *config, u32 timer,
 				 bool tx_clk_stop);
+
+	int (*mac_wol_set)(struct phylink_config *config, u32 wolopts,
+			   const u8 *sopass);
 };
 
 #if 0 /* For kernel-doc purposes only. */
@@ -440,6 +450,22 @@ void mac_disable_tx_lpi(struct phylink_config *config);
  */
 int mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 		      bool tx_clk_stop);
+
+/**
+ * mac_wol_set() - configure the Wake-on-Lan parameters
+ * @config: a pointer to a &struct phylink_config.
+ * @wolopts: Bitmask of %WAKE_* flags for enabled Wake-On-Lan modes.
+ * @sopass: SecureOn(tm) password; meaningful only for %WAKE_MAGICSECURE
+ *
+ * Enable the specified Wake-on-Lan options at the MAC. Options that the
+ * PHY can handle will have been removed from @wolopts.
+ *
+ * The presence of this method enables phylink-managed WoL support.
+ *
+ * Returns: 0 on success.
+ */
+int (*mac_wol_set)(struct phylink_config *config, u32 wolopts,
+		   const u8 *sopass);
 #endif
 
 struct phylink_pcs_ops;
-- 
2.47.3


