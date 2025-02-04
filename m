Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECE5C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 06:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HprnZz+23vuC9LmGL8XnbIXriJHxrQ66oBlYZJmUzXo=; b=OWHCDXhizwA6jjZ/O8SUc/mqXN
	hS29bYPsT9gjEya0gzJRR451IsDrURaw4k90vH/bVhwcqLi5H7KwODJAcd4LOygp3xJ3tRj0onsee
	cq4DMGJpD2oIqDTOLc1UDB/1oM/0Hs4wOfUXttY8QUAUiTFmc1yjNAeoYrGyxaUPEMZe93nlv1O+n
	h5uLAemhOt5exPdH+sab6S4NCGB3MfeHXRBfb0Wd2w7Jvzq/tElVTFac4OgjDovABF+UenVLYz9Dn
	B5FF17RKlwkbZDinRSbiRj8LS+Ax3we95aq9L2Dla9oF38DEwKKpIr0msd3KsKEe5/Mi31fECQiO6
	NpOnn2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCDO-0000000HLep-12JV;
	Tue, 04 Feb 2025 06:15:18 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfC9g-0000000HKwG-2SRD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 06:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738649488; x=1770185488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5bkc6SzUBfdWPSB7gExlTFthIkT/D4tk+mfb1mANDSw=;
  b=G0Ito6RPH90ms4dFPsadTULSMOKv8kINgo643HYGJP5zWuQECZ+N36PS
   7thi0mqWzXUVhFKao3h15jHhTVcXI2j25lQaN5w3UJ9Gk8CScemUy3X7f
   XDDLt6yK1b0xmO7IFR8hbcZ7Rga1FSSbebbKUFAAqeOErBurft16li8h+
   sWp6pNBBkiCgx9dHYLvDdEyq9A25pMuLC6zpS04yJUj5dYs8HH0tHmsWY
   r/4YhsHk57RApsROPwTN5gAtgOqXXGzoW6hSkgipxAdLK6gyLc14LuQ3z
   vKkpGFqQ+6nMhfae8rzJvfXtdp2fcUcLt16V71qLhBQFYxZhmGaDAD/qn
   g==;
X-CSE-ConnectionGUID: 180aZ8VSTpGs4z3pgoWAnw==
X-CSE-MsgGUID: jSNM8hWLTyextxUWyKyVpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50579620"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50579620"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 22:11:28 -0800
X-CSE-ConnectionGUID: E7pjPBh+SXql8izvLDPYnA==
X-CSE-MsgGUID: W0QC9zuwTHOMThr5y0eVlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="110279173"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 22:11:20 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Simon Horman <horms@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	David E Box <david.e.box@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Serge Semin <fancer.lancer@gmail.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v6 2/7] net: pcs: xpcs: re-initiate clause 37 Auto-negotiation
Date: Tue,  4 Feb 2025 14:10:15 +0800
Message-Id: <20250204061020.1199124-3-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_221128_639110_6A5AE0FA 
X-CRM114-Status: GOOD (  16.79  )
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

The xpcs_switch_interface_mode function was introduced to handle
interface switching.

According to the XPCS datasheet, a soft reset is required to initiate
Clause 37 auto-negotiation when the XPCS switches interface modes.

When the interface mode is set to 2500BASE-X, Clause 37 auto-negotiation
is turned off.

Subsequently, when the interface mode switches from 2500BASE-X to SGMII,
re-initiating Clause 37 auto-negotiation is required for the SGMII
interface mode to function properly.

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/pcs/pcs-xpcs-wx.c |  4 +--
 drivers/net/pcs/pcs-xpcs.c    | 60 ++++++++++++++++++++++++++++++++---
 2 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs-wx.c b/drivers/net/pcs/pcs-xpcs-wx.c
index fc52f7aa5f59..f73ab04d09f0 100644
--- a/drivers/net/pcs/pcs-xpcs-wx.c
+++ b/drivers/net/pcs/pcs-xpcs-wx.c
@@ -172,11 +172,9 @@ int txgbe_xpcs_switch_mode(struct dw_xpcs *xpcs, phy_interface_t interface)
 		return 0;
 	}
 
-	if (xpcs->interface == interface && !txgbe_xpcs_mode_quirk(xpcs))
+	if (!txgbe_xpcs_mode_quirk(xpcs))
 		return 0;
 
-	xpcs->interface = interface;
-
 	ret = txgbe_pcs_poll_power_up(xpcs);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 1faa37f0e7b9..fb3d1548a8e0 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -817,6 +817,58 @@ static int xpcs_config_2500basex(struct dw_xpcs *xpcs)
 			   BMCR_SPEED1000);
 }
 
+static int xpcs_switch_to_aneg_c37_sgmii(const struct dw_xpcs_compat *compat,
+					 struct dw_xpcs *xpcs,
+					 unsigned int neg_mode)
+{
+	bool an_c37_enabled;
+	int ret, mdio_ctrl;
+
+	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
+		mdio_ctrl = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
+		if (mdio_ctrl < 0)
+			return mdio_ctrl;
+
+		an_c37_enabled = mdio_ctrl & BMCR_ANENABLE;
+		if (!an_c37_enabled) {
+			//Perform soft reset to initiate C37 auto-negotiation
+			ret = xpcs_soft_reset(xpcs, compat);
+			if (ret)
+				return ret;
+		}
+	}
+	return 0;
+}
+
+static int xpcs_switch_interface_mode(const struct dw_xpcs_compat *compat,
+				      struct dw_xpcs *xpcs,
+				      phy_interface_t interface,
+				      unsigned int neg_mode)
+{
+	int ret = 0;
+
+	if (xpcs->interface != interface) {
+		if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
+			ret = txgbe_xpcs_switch_mode(xpcs, interface);
+		} else {
+			switch (compat->an_mode) {
+			case DW_AN_C37_SGMII:
+				ret = xpcs_switch_to_aneg_c37_sgmii(compat, xpcs, neg_mode);
+				break;
+			default:
+				break;
+			}
+		}
+
+		if (ret)
+			return ret;
+
+		xpcs->interface = interface;
+	}
+
+	return 0;
+}
+
 static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 			  const unsigned long *advertising,
 			  unsigned int neg_mode)
@@ -828,11 +880,11 @@ static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 	if (!compat)
 		return -ENODEV;
 
-	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
-		ret = txgbe_xpcs_switch_mode(xpcs, interface);
-		if (ret)
-			return ret;
+	ret = xpcs_switch_interface_mode(compat, xpcs, interface, neg_mode);
+	if (ret)
+		return ret;
 
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
 		/* Wangxun devices need backplane CL37 AN enabled for
 		 * SGMII and 1000base-X
 		 */
-- 
2.34.1


