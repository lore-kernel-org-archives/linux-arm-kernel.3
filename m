Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAE0D6DDED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/JzYl/tcilY2xw0JQD4s3XUe9uejuchM9MNrTrV21P8=; b=BNe0WOAaHTq55ToQT2BMDRf/j5
	UBvJnEa4RCBTv+kE971JeapGSOtwidPR6Z8T0aNJpsrKU/5nmaibHZITsmMAoJcurefMwlm+XRtpj
	h3fL8oYt+X+vg77XLOYPta3WW14NCa5q3U5Y/39EEceU1VXysnXChFLFRAneQe27MI/xtgCfVLXAI
	fd3QvkdROJIjX4ZX4fXEI+NhJnvDwsrxarHpI4EDckqROUHTbqz11k6Ide31Tzcp+Q6yRNdfpSPTj
	3LvYnl0xqs4O22KqJnePPGRa8ND/gko4/3rHUxp75zU2/8Wjl1JFp5Z2LxyPuiDr694Sbz82x2ggv
	QkTuBMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuGX-00000002Uae-0D2F;
	Fri, 15 Nov 2024 11:13:29 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBuFb-00000002UMn-0zJy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 11:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731669151; x=1763205151;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vk5UJimJXW3rB4PeKQ8t+GgFEcFaZSXTDspcbtJZfZ4=;
  b=ipduW7wNdXVUV9gm9tLV/qrfCa2WFFJAu7+dF6bek26MXudhcktV6DPS
   v4o6qVfqktyn8f6tOz//9j2acnUkqcN/Vtp5/3nMc1kIX401/gic0x5Vg
   mTF6aoPn1BN9505lr4Hrf8niDdOib/oJAVCXmSLCRMwv3RWKwOq78QcwT
   HAclBfpfwCirGUgewUd244yoEAJ1vE+sZ3FSK96u5Pb3YjBeKv5ID6xpK
   2tUp7RXQXlVWst/BubCSWKIEreUO36rzUYeCwbvXXubJkwrE5tvdV5A36
   7AfbGjgchr29XPUOJ+CYoJlwn4Ya09UC0X9LXJgNcLNjgPecRQoPNFDvk
   g==;
X-CSE-ConnectionGUID: 9yGxBMlQRQmrN8YAY8bzIw==
X-CSE-MsgGUID: xF0w7ixCRbiC5ZjwyCXBhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34543453"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="34543453"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 03:12:28 -0800
X-CSE-ConnectionGUID: zdlu9zFURK207QalAA83XQ==
X-CSE-MsgGUID: Zq/XNiqKSdSLHHWYxgXdbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="88112362"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com) ([10.88.229.33])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2024 03:12:24 -0800
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
Subject: [PATCH net v2 0/2] Fix 'ethtool --show-eee' during initial stage
Date: Fri, 15 Nov 2024 19:11:49 +0800
Message-Id: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_031231_284874_EEEEBF9E 
X-CRM114-Status: GOOD (  10.07  )
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

From: Choong Yong Liang <yong.liang.choong@intel.com>

When the MAC boots up with a Marvell PHY and phy_support_eee() is implemented,
the 'ethtool --show-eee' command shows that EEE is enabled, but in actuality,
the driver side is disabled. If we try to enable EEE through
'ethtool --set-eee' for a Marvell PHY, nothing happens because the eee_cfg
matches the setting required to enable EEE in ethnl_set_eee().

This patch series will remove phydev->eee_enabled and replace it with
eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(), it
will follow the master configuration to have software and hardware in sync,
allowing 'ethtool --show-eee' to display the correct value during the
initial stage.

v2 changes:
 - Implement the prototype suggested by Russell
 - Check EEE before calling phy_support_eee()

Thanks to Russell for the proposed prototype in [1].

Reference:
[1] https://patchwork.kernel.org/comment/26121323/

Choong Yong Liang (2):
  net: phy: replace phydev->eee_enabled with eee_cfg.eee_enabled
  net: stmmac: set initial EEE policy configuration

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 +++
 drivers/net/phy/phy-c45.c                         | 11 +++++------
 drivers/net/phy/phy_device.c                      |  6 +++---
 include/linux/phy.h                               |  5 ++---
 4 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.34.1


