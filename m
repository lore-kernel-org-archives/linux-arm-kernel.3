Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A935EC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 07:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqEFbAxBG8varMxKoelSFF5RWCnKkI27T7Lf4vbXVX8=; b=VHrTthGR2sd9+3WfL+VaSDQRib
	oZYX/yFhLoLj9tDArggQpBBTUg5yqbzS1gxH+IHqHdp7j+cBOVkbU3zM+PqyBsyoSi7ZdVTdCQz8C
	RB5NENmBiJulnNIWX7vfz+O9NHv4ikqj2JCeT9jBy9xjvIvc3S8y1n1Ckha6Ts380QK5PXO3QqzPu
	lStYj/4b938dxqYdsrX5EeO2LugPLa56XD2FlLulC3bsUajvBfrT84Y1oU5ZDeya3ibpg3gjOOVgx
	HbKNf/xSSymVzUmp1+EfKN3LBdh7GmFoXmYz5h/vUQpD23gXYqTexA6Nffa1/1HJMDCxrLsEmzQ50
	rUVGJ4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCGy-00000002li0-0pW7;
	Wed, 26 Feb 2025 07:56:04 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCBH-00000002jx3-0fHj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 07:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740556211; x=1772092211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u/mi+LCXMe4ShYx5Tg1OkjWGnid4ORB7ALNFCdTPXsg=;
  b=HQzQCR4X2ymW2pR73vqkq02tDtWx2Oy2wvpNVwTxZryX45I0Fv3GIw1t
   GHbGdAMQdS1ncNev7uIms/0hRx0m3EuFmm5ultwFCphDZxJDrF+7wXrPH
   Nh3yDRCHlBdhfuQTj6+nopO2Adsf1c/lKgkmPdxGOnBtugzb2GafrcSRf
   jCVAwQRilwXu9ieVr57t6kB6BgQfXASpk2jw9SPnLFhU2+ZChMCvZUO2G
   +dwrf2EmmvNzgvBT7MwkvlqmHd6BYwK5/rpk5DThieX9gsgwF9wY8TLpG
   nlNN7ipa4zKbdSinbDRC4DKdY5HXshIzOU44m8CAi0v0enVk0MoHa/LUY
   g==;
X-CSE-ConnectionGUID: SqJC9eA+R3i8Zl2eQSWmCw==
X-CSE-MsgGUID: WCZ58e2TQgKXyngvDyBjMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45305072"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="45305072"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:50:11 -0800
X-CSE-ConnectionGUID: i/OO3VdcRvuKu0+EnZjkoQ==
X-CSE-MsgGUID: UDgjKog5QnuTjCxpgoys2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120743002"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2025 23:50:04 -0800
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
Subject: [PATCH net-next v8 2/6] net: pcs: xpcs: re-initiate clause 37 Auto-negotiation
Date: Wed, 26 Feb 2025 15:48:33 +0800
Message-Id: <20250226074837.1679988-3-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_235011_233296_01E2575B 
X-CRM114-Status: GOOD (  14.86  )
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

When the interface mode switches from 2500BASE-X to SGMII,
re-initiating Clause 37 auto-negotiation is required for the SGMII
interface mode to function properly.

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/pcs/pcs-xpcs-wx.c |  4 +---
 drivers/net/pcs/pcs-xpcs.c    | 29 +++++++++++++++++++++++++----
 2 files changed, 26 insertions(+), 7 deletions(-)

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
index e32dec4b812e..c506797f9b63 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -602,12 +602,37 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 		__set_bit(compat->interface, interfaces);
 }
 
+static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
+				      phy_interface_t interface)
+{
+	int ret = 0;
+
+	if (xpcs->interface != interface) {
+		if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
+			ret = txgbe_xpcs_switch_mode(xpcs, interface);
+			if (ret)
+				return ret;
+		} else if (interface == PHY_INTERFACE_MODE_SGMII) {
+			xpcs->need_reset = true;
+		}
+
+		xpcs->interface = interface;
+	}
+
+	return 0;
+}
+
 static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 	const struct dw_xpcs_compat *compat;
 	int ret;
 
+	ret = xpcs_switch_interface_mode(xpcs, interface);
+	if (ret)
+		dev_err(&xpcs->mdiodev->dev, "switch interface failed: %pe\n",
+			ERR_PTR(ret));
+
 	if (!xpcs->need_reset)
 		return;
 
@@ -799,10 +824,6 @@ static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 		return -ENODEV;
 
 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
-		ret = txgbe_xpcs_switch_mode(xpcs, interface);
-		if (ret)
-			return ret;
-
 		/* Wangxun devices need backplane CL37 AN enabled for
 		 * SGMII and 1000base-X
 		 */
-- 
2.34.1


