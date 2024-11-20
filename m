Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7FDD6E2DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 08:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1ngJ/FT/8xVm5M91TpwopEKERyIb02wkK6TQ84fY6h4=; b=mD204AAZkZbDYknsYaa33jkoPf
	IXBOXFbEtlOZ/4rrM6qYoXH9c6zS60WUroFJNQOmROV9vOnEAvChfVWqifXuLDNFtWl1tDKuhzjGb
	1kGbeOKPBuM7qw5aEhVcStQN3CKoI4nFpjNIjzIbKrTx9aS8aaLy1VY/baLW6bkm+aHedrJl6hhph
	qE83pTXMgDQGZuNnmE4CJJAYTS8gbo2iXQGBBE0R14aAgQa+x4be1vBzv/MYKuiTPUnXmcVYkv9Oj
	gKzmh4t4R9g6ffNHyt9POYDTW3lmDoGjn7etDMi4kph9cihKfN+k3Yq5ALDhIPFzC6/LttMSUZu+o
	sbtunAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgFm-0000000EmvX-1DWt;
	Wed, 20 Nov 2024 08:40:02 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgEp-0000000EmnV-3L6u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 08:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732091944; x=1763627944;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ju3HdLFruvE1TxsgSL4HDmmuhZmrCfLaoDXxyMk3h08=;
  b=DTUN8G3k0frmxcS8RFv8YasxQ5XFZwrKe4Y3ZOAxn18/ZL4aOFLm8efv
   8MDRye/KjnBVae9+52iZ2C5vYHvMmHqCr3kbGiPd4qfR6O/iRvh/lFox7
   PCnwcHV9XB09Zj82wPGb8jz9phvhHUt5XUImeSutSobZvg6H8yge+llKS
   rgwUmoOIqoDAT6bm/uHwI6KybXmJ30dzo822oHshPD6DzJmK3LYvY4mBr
   rIgwt1RziMjFFEFGbm+oxyl6ixjFjaZEMGf0oWJ9540B6QA8omElMNYAg
   wViHnPtxtEx5EQ8O5xlDrS6dgFl29Cq+FOH+9jGZj+kC+blkIkBF8Pc65
   Q==;
X-CSE-ConnectionGUID: jUy49PwoQq204Yhi8H/dAw==
X-CSE-MsgGUID: 5FJit/5+QqK+p/zzAMr7gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43205716"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="43205716"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 00:39:01 -0800
X-CSE-ConnectionGUID: cauhdcDOSv62S1GL+vEbmw==
X-CSE-MsgGUID: vruHfDFvR26AJFa6jwC9wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="89994218"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com) ([10.88.229.33])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2024 00:38:58 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: [PATCH net 1/1] net: stmmac: set initial EEE policy configuration
Date: Wed, 20 Nov 2024 16:38:18 +0800
Message-Id: <20241120083818.1079456-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_003903_874684_DC915527 
X-CRM114-Status: UNSURE (   8.09  )
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

Fixes: 49168d1980e2 ("net: phy: Add phy_support_eee() indicating MAC support EEE")
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


