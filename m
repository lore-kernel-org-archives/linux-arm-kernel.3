Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1635C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYXwSHpZ3TuaE7A9e8MbciUM1fFJKwM34sCdJxW+BnI=; b=uizL/gGCy9YV4T0k9rb1APfzCi
	RdfyN2BYwCTKny1Tn732HFalZpGnui2mrVoNc/9J2JkSo+r5p5nFuvFj0rXsibxHzenTmwY/sW8Wx
	bzaTJFOBEiRMUlBnGC8O2SvgpVUGmOGWgD/4D6grlrE6jP9/WIJ+iOrCkuGFE1Cj7IK3NHhF7NfrP
	YQimqW4Vee3LitGjPjv5en+k3GtXqWEhPhuK3q6lDlxXm09qt2Eu2WX8MLOnBL3aTyURQKfcNqREr
	+pQXmpuJgpwW7IZbMkSQZEDaly6IGsCeUQcHTM/UJrZ3VaWNG2Fd/HMIql/XyYhkYGG/SLr5LYLW7
	DBshVvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCC4-0000000HLTu-2WTH;
	Tue, 04 Feb 2025 06:13:56 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfC9X-0000000HKtz-2zLQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 06:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738649479; x=1770185479;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7n0vam23Uf784ublbhVBP5AsWpQxp+3QLHvPVC2Ki4w=;
  b=BH7epmbTo7RmNh4YAZm/h6S5iGKifNkE0q9B1cjUJrPvZ7X4CGYoqrlE
   ZywdmXMFNbKfy1BCNiT4cVJ+gxZ6p9Ia0w+MBTBscdfNvMw6ph6k9YgR5
   OkyZxgUNwR5J8nL1W5tjMMDXFrs3VLz+FiG/cjjerSm+CPO+n1X5xkYUt
   xm9K1IY72X0ON89zdl9zIYiD2+nGarcikPSdEeeAyLEdTdv69Bwhaa9SF
   Y4DPGyAeFFNLpi9Ek30uDxYoik0vwRsWXzfYfWzb0sP4EyoHR8uvs3iLR
   sC+QCRV6iYf++QfP5QnDxEvTPyG+5ye9ytka6CcGCJnXv40aTL20tlloS
   g==;
X-CSE-ConnectionGUID: WXj3VAByQem0L/wKRSgF7g==
X-CSE-MsgGUID: NA+pjCLESXiovESdmAb3RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50579596"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50579596"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 22:11:19 -0800
X-CSE-ConnectionGUID: YinZviaxTTyrV7MlNpzCpw==
X-CSE-MsgGUID: sbOtTjAqTG2arJW7fGx7uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="110279153"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 22:11:12 -0800
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
Subject: [PATCH net-next v6 1/7] net: phylink: use act_link_an_mode to determine PHY
Date: Tue,  4 Feb 2025 14:10:14 +0800
Message-Id: <20250204061020.1199124-2-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_221119_762171_B97A93F0 
X-CRM114-Status: GOOD (  15.05  )
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

When the interface mode is SGMII and act_link_an_mode is MLO_AN_INBAND,
switching to the 2500BASE-X interface mode will trigger
phylink_major_config, and act_link_an_mode will be updated to MLO_AN_PHY
in phylink_pcs_neg_mode when the PCS does not support in-band mode.
The MAC and PCS will configure according to the interface mode
and act_link_an_mode.

However, when the interface goes link down and then link up again, the MAC
will attempt to attach the PHY. The interface mode remains as 2500BASE-X,
but cfg_link_an_mode still holds MLO_AN_INBAND. This causes a failure to
attach the PHY.

This patch uses act_link_an_mode to determine if there is a PHY to attach.

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/phylink.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 214b62fba991..b0f9725e0494 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1903,6 +1903,7 @@ int phylink_set_fixed_link(struct phylink *pl,
 
 	pl->cfg_link_an_mode = MLO_AN_FIXED;
 	pl->req_link_an_mode = pl->cfg_link_an_mode;
+	pl->act_link_an_mode = pl->cfg_link_an_mode;
 
 	return 0;
 }
@@ -2002,6 +2003,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	}
 
 	pl->req_link_an_mode = pl->cfg_link_an_mode;
+	pl->act_link_an_mode = pl->cfg_link_an_mode;
 
 	ret = phylink_register_sfp(pl, fwnode);
 	if (ret < 0) {
@@ -2044,8 +2046,8 @@ EXPORT_SYMBOL_GPL(phylink_destroy);
  */
 bool phylink_expects_phy(struct phylink *pl)
 {
-	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
-	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
+	if (pl->act_link_an_mode == MLO_AN_FIXED ||
+	    (pl->act_link_an_mode == MLO_AN_INBAND &&
 	     phy_interface_mode_is_8023z(pl->link_config.interface)))
 		return false;
 	return true;
@@ -2280,8 +2282,8 @@ static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 {
 	u32 flags = 0;
 
-	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
-		    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
+	if (WARN_ON(pl->act_link_an_mode == MLO_AN_FIXED ||
+		    (pl->act_link_an_mode == MLO_AN_INBAND &&
 		     phy_interface_mode_is_8023z(interface) && !pl->sfp_bus)))
 		return -EINVAL;
 
-- 
2.34.1


