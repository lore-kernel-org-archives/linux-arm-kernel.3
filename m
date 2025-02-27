Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E380C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJw+sH11it4qjPyh+uitamQM/Grd93ImlN3jpHPFR08=; b=J83mBh8qgffs9XGkLcsGw2wSiR
	wolmJ8xH2JA/BDcRnIPJtbI/TVJfXGDLNORUEQ3KBV4i997eJHqobzHcVRH9iJ9Db30YTPOFruECI
	qoDLROo11IwyrCyMlZjXy1GQiEcp/7o/IkGTQOIgWkIXPpP9J7Am4JeFxCzJPQv1qWCMlkWkbFC3a
	vny4p8JDRT5URK1W9qA14bJPQvjtBXKJco/vBjBxkU9vC061G7SvgOC0/oyL1JhecTfCnka+c2AAW
	sixY7F2kaKjc6Z/uVBklYkruHZViNw9sQyvS2GFWZbNhmdv4jlYyM3PEG8T9Kqx3orvPeQAQ+Ggds
	b59plIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndP2-00000007R1B-2UKj;
	Thu, 27 Feb 2025 12:54:12 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncp1-00000007KOp-1026
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740658619; x=1772194619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Exo83tyIGsx8vIazCzq/svZKyosoCsshSHaLf3vfos4=;
  b=FvFp5WlKRsgr68jjUXv34XejZZ4BXUYGSc09InqC6wqrIJbop88qBsif
   IPCQ3ezAk5Pe3wM9N3oVZ5PBtpqhfK6UTEmTW9wSHoC26DLWiWsawoQ0v
   6ldsb6U1icZlckPlcYFx/iVJaKEeD5hBSxqgy5uliUDzaSwN+j9v+LDmK
   xOU8ztV0q4sTuoOw2e1OBQ/wAyR4G3s0ys5SUTIV1XDKIVUyJBIopgWz5
   5fclno/ZWcJ0c7tjP37YTtDf0dtqukLgyrDK3Xf3NXfVixeWNJ9aegWlQ
   q4u5vu/hWaz3uJZvAtTmae56j4RMljDpnBptPu3pbbKsD/6mgPfLPRtSs
   Q==;
X-CSE-ConnectionGUID: 8HWxc2A8SwGuALFKVupAIA==
X-CSE-MsgGUID: lNRpHaIURIiXg7kiNlQjtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41464322"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41464322"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 04:16:58 -0800
X-CSE-ConnectionGUID: cxWTGBpoS1Gdm8QvUjv+8A==
X-CSE-MsgGUID: 2wswAz/qSBSc1y4YX2hdrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117519141"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by orviesa007.jf.intel.com with ESMTP; 27 Feb 2025 04:16:52 -0800
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
Subject: [PATCH net-next v9 2/6] net: pcs: xpcs: re-initiate clause 37 Auto-negotiation
Date: Thu, 27 Feb 2025 20:15:18 +0800
Message-Id: <20250227121522.1802832-3-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_041659_317371_07153A05 
X-CRM114-Status: GOOD (  13.03  )
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
 drivers/net/pcs/pcs-xpcs.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index e32dec4b812e..3d1bd5aac093 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -602,12 +602,33 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 		__set_bit(compat->interface, interfaces);
 }
 
+static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
+				      phy_interface_t interface)
+{
+	int ret = 0;
+
+	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
+		ret = txgbe_xpcs_switch_mode(xpcs, interface);
+	} else if (xpcs->interface != interface) {
+		if (interface == PHY_INTERFACE_MODE_SGMII)
+			xpcs->need_reset = true;
+		xpcs->interface = interface;
+	}
+
+	return ret;
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
 
@@ -799,10 +820,6 @@ static int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
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


