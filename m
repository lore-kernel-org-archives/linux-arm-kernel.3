Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38BED6DDF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 11:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uc6ROTUECZwywj8qXvZL6AkE+BOxzXvxe5Eco/kltio=; b=x832S3Ve1JzkfjZNwARO64ioBT
	MKcngb32f9bejjXsen55wTc40ZBmA024l5pV3/RgcLuQs/aJ95T67NOPHOHJBGTk7Zo20lSbjm950
	MkuhTkFLZ4k9RFjXvYKfWPLnL1sibu4qXagqjNHeXWPOokR3aDsKD3TOR83WgwPkQ9L8TK2CjBm+/
	IGYFm4Vdmg4vRsAMyFtTPT0zzxEGwKyWSX3EBhqm+OAgpro4jZ7Wxw/PVGYVxLe+FnzT6dxCUIVRA
	x6LWgkcpqWX3LpOImpT/4JyMZQ8Kducxh0wgd79se8O2ydgouRw89b/a9fQut32ss3I+XKdPZLXms
	ng5x+wgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuHQ-00000002UpR-2nyj;
	Fri, 15 Nov 2024 11:14:24 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuFd-00000002UMn-0yvy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 11:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731669153; x=1763205153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B5LeEIlYNpdmfHj8eX/PzUHRSW/wGsPyx6FjWG0dlLA=;
  b=hSuz5EBZ7TeRfmKgj08pdlluR3odOo6UTtnhhrtN7KS40tLL4uuRZMkv
   S5CsO7hRFFySdA85lp6cMwok7dUBJ/WDnpPia2raYrTCujxIFCQHO/5jV
   J9TUb76YdkBAAgLEOXVusJrfZVJZDYsopRE6lmEyHKTzRQd1u0FmYUDfD
   1+3hUDvT4MnQLRmPzDNBONULpwECZ6waUplvQ7V3B4PhKXI2nDpIhDTWl
   WZJnr6lpidXXNT26MXpAhakS1jgpx7RRWnkDSqi93cgg/4z/8fKpZMWL0
   3AgxfmYQCc+vM0yHazhqzM9ArZIv53+30OqHUI3KC8DjR1WEHE0JrSLN3
   Q==;
X-CSE-ConnectionGUID: sVXRT2JNR7ij9aU4gEoYHg==
X-CSE-MsgGUID: N5Ge2wX9RBaETDrXiFu0cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34543471"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="34543471"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 03:12:33 -0800
X-CSE-ConnectionGUID: UCFsvvZmToeJ5JHd+tMD9g==
X-CSE-MsgGUID: 6N7EzlmcSfO4vtFCaDZ+Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="88112372"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com) ([10.88.229.33])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2024 03:12:29 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net v2 1/2] net: phy: replace phydev->eee_enabled with eee_cfg.eee_enabled
Date: Fri, 15 Nov 2024 19:11:50 +0800
Message-Id: <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_031233_281935_7E76BD1E 
X-CRM114-Status: GOOD (  19.47  )
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

Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
designed to have EEE hardware disabled during the initial state.

In the initial stage, phy_probe() sets phydev->eee_enabled to be disabled.
Then, the MAC calls phy_support_eee() to set eee_cfg.eee_enabled to be
enabled. However, when phy_start_aneg() is called,
genphy_c45_an_config_eee_aneg() still refers to phydev->eee_enabled.
This causes the 'ethtool --show-eee' command to show that EEE is enabled,
but in actuality, the driver side is disabled.

This patch will remove phydev->eee_enabled and replace it with
eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(),
it will follow the master configuration to have software and hardware
in sync.

Fixes: 3eeca4e199ce ("net: phy: do not force EEE support")
Cc: stable@vger.kernel.org
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Suggested-by: Russell King <linux@armlinux.org.uk>
---
 drivers/net/phy/phy-c45.c    | 11 +++++------
 drivers/net/phy/phy_device.c |  6 +++---
 include/linux/phy.h          |  5 ++---
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
index 5695935fdce9..fa42158eff83 100644
--- a/drivers/net/phy/phy-c45.c
+++ b/drivers/net/phy/phy-c45.c
@@ -272,7 +272,7 @@ int genphy_c45_an_config_aneg(struct phy_device *phydev)
 	linkmode_and(phydev->advertising, phydev->advertising,
 		     phydev->supported);
 
-	ret = genphy_c45_an_config_eee_aneg(phydev);
+	ret = genphy_c45_an_config_eee_aneg(phydev, phydev->eee_cfg.eee_enabled);
 	if (ret < 0)
 		return ret;
 	else if (ret)
@@ -940,9 +940,10 @@ EXPORT_SYMBOL_GPL(genphy_c45_read_eee_abilities);
  * genphy_c45_an_config_eee_aneg - configure EEE advertisement
  * @phydev: target phy_device struct
  */
-int genphy_c45_an_config_eee_aneg(struct phy_device *phydev)
+int genphy_c45_an_config_eee_aneg(struct phy_device *phydev,
+				  bool is_eee_enabled)
 {
-	if (!phydev->eee_enabled) {
+	if (!is_eee_enabled) {
 		__ETHTOOL_DECLARE_LINK_MODE_MASK(adv) = {};
 
 		return genphy_c45_write_eee_adv(phydev, adv);
@@ -1575,9 +1576,7 @@ int genphy_c45_ethtool_set_eee(struct phy_device *phydev,
 		linkmode_copy(phydev->advertising_eee, adv);
 	}
 
-	phydev->eee_enabled = data->eee_enabled;
-
-	ret = genphy_c45_an_config_eee_aneg(phydev);
+	ret = genphy_c45_an_config_eee_aneg(phydev, data->eee_enabled);
 	if (ret > 0) {
 		ret = phy_restart_aneg(phydev);
 		if (ret < 0)
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 499797646580..97e835ad4544 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -2421,7 +2421,7 @@ int __genphy_config_aneg(struct phy_device *phydev, bool changed)
 	unsigned long *advert;
 	int err;
 
-	err = genphy_c45_an_config_eee_aneg(phydev);
+	err = genphy_c45_an_config_eee_aneg(phydev, phydev->eee_cfg.eee_enabled);
 	if (err < 0)
 		return err;
 	else if (err)
@@ -3595,12 +3595,12 @@ static int phy_probe(struct device *dev)
 	/* There is no "enabled" flag. If PHY is advertising, assume it is
 	 * kind of enabled.
 	 */
-	phydev->eee_enabled = !linkmode_empty(phydev->advertising_eee);
+	phydev->eee_cfg.eee_enabled = !linkmode_empty(phydev->advertising_eee);
 
 	/* Some PHYs may advertise, by default, not support EEE modes. So,
 	 * we need to clean them.
 	 */
-	if (phydev->eee_enabled)
+	if (phydev->eee_cfg.eee_enabled)
 		linkmode_and(phydev->advertising_eee, phydev->supported_eee,
 			     phydev->advertising_eee);
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a98bc91a0cde..fde9f1f868bb 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -601,7 +601,6 @@ struct macsec_ops;
  * @adv_old: Saved advertised while power saving for WoL
  * @supported_eee: supported PHY EEE linkmodes
  * @advertising_eee: Currently advertised EEE linkmodes
- * @eee_enabled: Flag indicating whether the EEE feature is enabled
  * @enable_tx_lpi: When True, MAC should transmit LPI to PHY
  * @eee_cfg: User configuration of EEE
  * @lp_advertising: Current link partner advertised linkmodes
@@ -721,7 +720,6 @@ struct phy_device {
 	/* used for eee validation and configuration*/
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_eee);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising_eee);
-	bool eee_enabled;
 
 	/* Host supported PHY interface types. Should be ignored if empty. */
 	DECLARE_PHY_INTERFACE_MASK(host_interfaces);
@@ -1952,7 +1950,8 @@ int genphy_c45_ethtool_get_eee(struct phy_device *phydev,
 int genphy_c45_ethtool_set_eee(struct phy_device *phydev,
 			       struct ethtool_keee *data);
 int genphy_c45_write_eee_adv(struct phy_device *phydev, unsigned long *adv);
-int genphy_c45_an_config_eee_aneg(struct phy_device *phydev);
+int genphy_c45_an_config_eee_aneg(struct phy_device *phydev,
+				  bool is_eee_enabled);
 int genphy_c45_read_eee_adv(struct phy_device *phydev, unsigned long *adv);
 
 /* Generic C45 PHY driver */
-- 
2.34.1


