Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F04D41D5F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 07:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1rao2HEFDBeDjZ5OS1CebS9dznYplTNG2gw21dGBs9s=; b=dbJX6wR9GlxQFC7VIXBzNWF1Bm
	8y6+lOAK5J8eUr3gvz1E8+IRP88PcZTZVsVlohhq7jw5zFDYQ2Qa265KYwRZd6aPtz44A/B/xTnSN
	dV6PWokAmuiyc8sm+tDHU8ZhfkrR33H19CIFRI4eWrdhf/AwX6P6TmsY4WRd6JQPl2bXLNswRjVuF
	3uefCbEjFFvJckk1DM4mJB0CZTsXuDX8CJ3qGu0/BdoKMDaKI6PA4gLxpyfDmFaEa4Xa2p2rbcfG2
	yXDh7haUtHshJDI0hcnr85g2sxQ79mf4q+qnRV8hZr2z2G/IFxrqWaw2tHhimfDOFG525GJ91Ek2s
	HfyRA5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlIy-00000002T2g-2zmE;
	Tue, 12 Nov 2024 07:27:16 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlH8-00000002SfH-2eq7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 07:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731396322; x=1762932322;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xyopsM7BqzZrYVf2ZRi9qIaLHUvjs5NWZpYOarQWMGs=;
  b=ijm9TBy/yr4fd8+1gwnl4WHgHd9mJSNY9qSHQN2HwpjQhvfTs8gomIM3
   RlWguJDAdgt3hPD4jwRD61SukId0KKLD6qHx4ReYhw06MatWvqS1DrRB+
   d2WLNfvELSuZsY4kZ1rSSbz1t9MYrUyt1lUIIXE7LKbHIliFFq5/jD0GR
   6edhTXfXOCf3lUMwBZ2RvyHcCz09sPe++DWKBSO1Wbc4fFAe37j/Ci26E
   yBZnWTrk99eFjEa6ZTfbdp8u8Hm/FamWyI1Y8W9ofuCSdpdwnHVDoJvvK
   MfBpU0+TTf87jK8Lg0tPv6f0wxWsemAfHR6LkIZJF+U7KQT6cLUYicNK0
   g==;
X-CSE-ConnectionGUID: EqJZGpzkSbGNmB7wAe23CA==
X-CSE-MsgGUID: 3KAuvIXaR36rYjYV95DqLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31387780"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31387780"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 23:25:19 -0800
X-CSE-ConnectionGUID: 5Sp2DgRqThWVvMbHZi+REA==
X-CSE-MsgGUID: RnwHsSYBQVqVEP1H2VdsXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87074230"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com) ([10.88.229.33])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2024 23:25:16 -0800
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net v1 0/2] Fix ethtool --show-eee for stmmac
Date: Tue, 12 Nov 2024 15:24:45 +0800
Message-Id: <20241112072447.3238892-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_232522_765006_51F0BF65 
X-CRM114-Status: UNSURE (   5.46  )
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

This fix ensures that 'ethtool --show-eee' displays the correct
status for stmmac.

Choong Yong Liang (2):
  net: phy: Introduce phy_update_eee() to update eee_cfg values
  net: stmmac: update eee_cfg after mac link up/down

 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ++++
 drivers/net/phy/phy_device.c                  | 24 +++++++++++++++++++
 include/linux/phy.h                           |  2 ++
 3 files changed, 30 insertions(+)

-- 
2.34.1


