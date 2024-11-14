Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE65D65C58
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h2XV304Wzeeoc1hoXD3uWyEampjoyLLsZatB/CccIn0=; b=nQCQ9MH21uJ2rT79j4f23AtWNe
	B2WxyVzW0EvjAyNd78UbIgE5G36Nqdpri7Sz/h616XGDlwcIpqB5XCkTJqiiKvrEPnnb3eC173grx
	5YfmLpVbSv2SiiFYxI6TRmL2xqKVI/Agk2iRb1VQ7zTkL3YKgLDjRQw3YS28U4iAfVqhmNWmLvdIY
	ai0FMasFvEYZ6mzFJG2HG41KQoQxu+11N6yRqaDvwemmWyYeLdsYcCyJWqAASc1kyG08lbVDf2PpV
	7tLCBlBU8xmqjMBrGoy1GOxVmKqtHSChJb9JvFdNE5ElQD0E4iNGRABLtR5OqHuCOR8+eT3+ZNjUC
	Y2BIVlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBV4Z-00000009Bpv-3C8B;
	Thu, 14 Nov 2024 08:19:27 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBV2h-00000009BU8-1dlp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 08:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731572251; x=1763108251;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LzcUFYSQKL3vPxB47TGpPrctgQCVXb4LxxKzcyPBE3c=;
  b=J/p1ksXFoO/piHXs3NxacSBlpAORuD3kIKTS2Krz9PumtCiqOKqzbrDd
   C+jQDYrEiJDNGiZfdxshZig9HPv2S0rdyKKNArxZzVoNXQkSdZMicWQUy
   Gu5pSenoHuXENufc+OJnwZFblG+iyFARUOuYH08YpU3Q8nERZtsRRW3WJ
   qWLTEXxaUDjxYyg5gksCLaddDC78p3//TWO7ufN5yeKQwDj+U9ZNYOgmM
   WSzA/k8100m/1dSNlZzST0bGpCG9MYoCbSLH1NJJER85A6P17pmSZFY/u
   sBma67ccxxXBXthaMmznRpwOtlIGRoiukYppzx8dlpkTCrpTPbM6grJq/
   Q==;
X-CSE-ConnectionGUID: fLx44hQFTQizdkf9Ng5OAA==
X-CSE-MsgGUID: Zh9Eso30QLmwbnEW6SCNZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42921242"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="42921242"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 00:17:28 -0800
X-CSE-ConnectionGUID: Lvz13PUNTQi3AKSD7udmqQ==
X-CSE-MsgGUID: d9mnhq+6T1mq86CnPiONVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="88553858"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com) ([10.88.229.33])
  by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2024 00:17:24 -0800
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
Subject: [PATCH net v1 0/2] Fix 'ethtool --show-eee' during initial stage
Date: Thu, 14 Nov 2024 16:16:51 +0800
Message-Id: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_001731_510515_E9645EA4 
X-CRM114-Status: GOOD (  10.02  )
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

The commit 49168d1980e2 
("net: phy: Add phy_support_eee() indicating MAC support EEE") introduced
phy_support_eee() to set eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled to
true as the default value. However, not all PHYs have EEE enabled by default.
For example, Marvell PHYs are designed to have EEE hardware disabled during
the initial state, and it needs to be configured to turn it on again.

When the MAC boots up with a Marvell PHY and phy_support_eee() is implemented,
the 'ethtool --show-eee' command shows that EEE is enabled, but in actuality,
the driver side is disabled. If we try to enable EEE through
'ethtool --set-eee' for a Marvell PHY, nothing happens because the eee_cfg
matches the setting required to enable EEE in ethnl_set_eee().

This patch series will read the PHY configuration and set it as the initial
value for eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled, allowing
'ethtool --show-eee' to display the correct value during the initial stage.

Choong Yong Liang (2):
  net: phy: set eee_cfg based on PHY configuration
  net: stmmac: set initial EEE policy configuration

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 drivers/net/phy/phy_device.c                      | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.34.1


