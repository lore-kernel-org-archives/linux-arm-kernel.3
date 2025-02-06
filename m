Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3114FC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HprnZz+23vuC9LmGL8XnbIXriJHxrQ66oBlYZJmUzXo=; b=en3L7+Po6E2DHdbQbJ1aRzFV6m
	gjFOeEXhcN499FfbP2gU1nlrLkurjEJVQ3pN/UnRbPUjR9L8hdSTDQzoPhu9mE/i+5BDkgk0gA72x
	xonOGO3jcAQZlkWwKnozyluHgC+nY6pHU9HSzAFHKdfrzrq2Fo4AEeIO4Yo1MLKBEAl8zcWTw2RhN
	qz34Esu1/6IZV/79Q8SNLPO5+DuysCOEcNNexGH/GryMcNUYtf0p2EqNSxNE8dViMJIrR8sNPHtli
	Tcs8keY++j/eUNzAS45sYj1kzo0HeGneX+vGWCX9BqVwOmLJhPI7EDa7qJ21B0gM7IMRcwFOkUrOW
	zxNxguEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2uW-00000006ahM-1gtZ;
	Thu, 06 Feb 2025 14:31:20 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1o3-00000006OfZ-14kl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738848035; x=1770384035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5bkc6SzUBfdWPSB7gExlTFthIkT/D4tk+mfb1mANDSw=;
  b=PkIj0Ov8cJRzehG27lNCJLiDEuMuOcLruay8ynQdeOmUQBreM+iUtlRd
   4RxB1cyAD34GlzAk2ngHEDVvksNXlGvBp341auQBu+XSjGsimZ9g+5wZ2
   qF+o741cYsd4gQbugxIGsAYTdqATqoAsYXLHQY+2UDnXrNe9y8BD5N7mV
   BWHNOpULanqeVkTn0vtYESpJSVRCmxxjiRnlPIwoV1TSVi2cF3O8i9AMM
   zU8tA1PqJQ+EeG7nrxQ/Hu/wRkgF6ecOOEUKbjnzmVW1u1jkkT6g0WltK
   HEkZZp5/FUAglKnLBbxPNZCQqBUd+mKx2GWDiUNc9Jg0hr4ePRXKu6UGw
   g==;
X-CSE-ConnectionGUID: f6hAi9AaQmOI/VSiaAwCzg==
X-CSE-MsgGUID: Z+055qWNS1i8ZI8jRHF4vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43203702"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43203702"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 05:20:11 -0800
X-CSE-ConnectionGUID: b5zDbrMATBqn4J0F6EZCLw==
X-CSE-MsgGUID: qsNBivt5QuaTxQqftJkw4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116397257"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 05:20:04 -0800
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
	Serge Semin <fancer.lancer@gmail.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v7 2/7] net: pcs: xpcs: re-initiate clause 37 Auto-negotiation
Date: Thu,  6 Feb 2025 21:18:54 +0800
Message-Id: <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_052035_355577_A63776E0 
X-CRM114-Status: GOOD (  16.82  )
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


