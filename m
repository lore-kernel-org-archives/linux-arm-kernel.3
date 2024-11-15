Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F689D6DDED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOGETXe3oGdIaXj9mwJvO93jH+HHP4thoJfDIdNmgGA=; b=sunsmFe45BZ0XEiG7BdcDnd49H
	lBf3Z/hlw8YkZj92jHZjlar+Fowy6F8wpHVF5PZwPd7Vi5Ja6hLynkovpxU+wu1VUr56GkXcX7p22
	QuJzTWwb/18HCnBiQBj00UfR3/FcZADfS2cAQoDCXWeLgUymkPGDYzIraW4/Xo2Vsd6Op0PKsqeeD
	OYt2hiuUx1aQoVEAi61PA8aaR32/fu5ihCTd6wBznO5erkhYfQZHPWMaYC5SavhghxkQXDXKWHRvH
	bBxGJMZH2Ejom763ANFR0nb00zBwNy473agyS4gNxwVYNplmgM6ynoyJ5BXB0bnsyyweyJYZTxky1
	5DdMtxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuIK-00000002UxE-1uDg;
	Fri, 15 Nov 2024 11:15:20 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuFi-00000002UMn-1vSe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 11:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731669159; x=1763205159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YqpnsuBVVUj80WoJfL9985bvH3cQ9fyiXqy0b0EDE5E=;
  b=KkLoNxkNZfTnmvBvrawyUqTnQdI20aRMN66idkniHst+XhJINIOqhnUt
   gkFa1GSqxadDLKAdkcnrOEW/lQuGOoBqm4xWmnrga6D7sD1T4HMmZXbRl
   BNAA3knSBLAcgZfIsl4FzSbUPMwKRArsUnyukQV5VS+/rD5rLfjoQy0+M
   Q2pToAG830AAJnx2zEgnp8Y1P6pW98sUMJTvZVci72jeG1mj8/gaaw0+Z
   zHKobXHlY9bUQZR22bBmVR/RSJiQT03WgPH4ms/WyUSz6/cVT0uqlYuhW
   6C70Oj8H+KSLGbc9sMOQCzpRaDwbORRTva/mM0Jmm6GDNwb062/MrxLm2
   w==;
X-CSE-ConnectionGUID: zd4BZIzbSUeOLPDECFj/iw==
X-CSE-MsgGUID: howR8FALTMCZxday69gE1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34543492"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="34543492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 03:12:38 -0800
X-CSE-ConnectionGUID: tgyKVCdzSoGlFTnzA7d8+g==
X-CSE-MsgGUID: IsgtgJfuRK+d4o9hIYvaqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="88112384"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com) ([10.88.229.33])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2024 03:12:35 -0800
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
Subject: [PATCH net v2 2/2] net: stmmac: set initial EEE policy configuration
Date: Fri, 15 Nov 2024 19:11:51 +0800
Message-Id: <20241115111151.183108-3-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_031238_514801_1E88F8A2 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

Set the initial eee_cfg values to have 'ethtool --show-eee ' display
the initial EEE configuration.

Fixes: 3eeca4e199ce ("net: phy: do not force EEE support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7bf275f127c9..766213ee82c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1205,6 +1205,9 @@ static int stmmac_init_phy(struct net_device *dev)
 			return -ENODEV;
 		}
 
+		if (priv->dma_cap.eee)
+			phy_support_eee(phydev);
+
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	} else {
 		fwnode_handle_put(phy_fwnode);
-- 
2.34.1


