Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D24D65C57
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBTxkIkcJIVF2jwH04sauDhEhHoYYiAVyr/BsRZxqOM=; b=s8WEjK1eIluKJBF4kJQh+y6bqj
	Y0AfMJ44orcmUx98ESWMAfSGS+/uxnagBKzr/GBRc4J524XNN39yDk49ISNIG49emwfmk3kFU+LTb
	uo7O04G472YOBTHEAAgt5t1a5cY6MH+5c32DGqqxpTj1kMYLu0wVp4S8of3UlmqNysLcirPY1zBl3
	y9VoX0IEbROxrllEEh0b7sTH+MSj410jIksxKt15Me4w/+wq79piSyZWFVD5JWjPUN0JhCcg6vUco
	u04CyRpurMJK/n1UY/7qYKTMhEymrgQONLx253E+PQJsffbgEseeFCJiqg3fRp4n6tcUk3MVk5i3C
	2uFG1hTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBV6N-00000009C5J-3WD8;
	Thu, 14 Nov 2024 08:21:19 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBV2j-00000009BU8-0C4O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 08:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731572253; x=1763108253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ocQgpKPOx0XcLpqISFGSjESyE6sRma++231CI0veC/0=;
  b=hfgN+nDl07zccguuw8LjFfd7wxMBH1VexQBS393Vd64slqX9DuVqT+Tk
   WBIjBdnkzhgyf4xaESgGL6rl3c3OsQAg66k3inyZ2uRbp4FrE2+wJcVRN
   EKvIuH9PMu06YmLezl9Uq6UhWF6OX28Cdxk+sIVhXk1jDyyU89yW9u9Ho
   5fbdP1hXpNB/Hso9lMe9pdRaV9efZZYPAWCPzv2XLpil2RLPGlPacgYFy
   TclG/NjXTZ+eoofnR73sf4f51Y0f31XMrX4ECt1TPabj1A7ECo8ke86Pk
   IJxWD+Zf8/6IVR/MUC4C3AikJXqjmiq3plkUXMofxFdEq178lzluwX8x4
   w==;
X-CSE-ConnectionGUID: aYgW5X5OQSG+EN0P/GxVVg==
X-CSE-MsgGUID: dCj3F2VhQKegA24+Cktwiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42921264"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="42921264"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 00:17:33 -0800
X-CSE-ConnectionGUID: jJowESe6TKC+BYh6mIOHXA==
X-CSE-MsgGUID: gp9mz9c4SoifszaSS/wpSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="88553860"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com) ([10.88.229.33])
  by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2024 00:17:29 -0800
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
Subject: [PATCH net v1 1/2] net: phy: set eee_cfg based on PHY configuration
Date: Thu, 14 Nov 2024 16:16:52 +0800
Message-Id: <20241114081653.3939346-2-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_001733_163784_AA6422E1 
X-CRM114-Status: GOOD (  11.12  )
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
designed to have EEE hardware disabled during the initial state, and it
needs to be configured to turn it on again.

This patch reads the PHY configuration and sets it as the initial value for
eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled instead of having them set to
true by default.

Fixes: 49168d1980e2 ("net: phy: Add phy_support_eee() indicating MAC support EEE")
Cc: <stable@vger.kernel.org>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/phy_device.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 499797646580..b4fa40c2371a 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3010,9 +3010,12 @@ EXPORT_SYMBOL_GPL(phy_advertise_eee_all);
  */
 void phy_support_eee(struct phy_device *phydev)
 {
+	bool is_enabled = true;
+
+	genphy_c45_eee_is_active(phydev, NULL, NULL, &is_enabled);
 	linkmode_copy(phydev->advertising_eee, phydev->supported_eee);
-	phydev->eee_cfg.tx_lpi_enabled = true;
-	phydev->eee_cfg.eee_enabled = true;
+	phydev->eee_cfg.tx_lpi_enabled = is_enabled;
+	phydev->eee_cfg.eee_enabled = is_enabled;
 }
 EXPORT_SYMBOL(phy_support_eee);
 
-- 
2.34.1


