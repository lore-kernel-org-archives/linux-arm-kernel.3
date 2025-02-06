Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1075C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+XaHzih/9pWkAQ60gOOBrBJdR3eFr+S+59SnQzSxw/E=; b=TUIOzLDamf6C1sXM89R2ePshrD
	bEfMPmT6m7Uwvuw8SY4gwlnkXDriAYZJhWL5cqTSm53BhVev4j2J0vbRnzO2pBYgMNWNfHipsk1bc
	nO+BTYbYqXmUUEOLh83Q08uiNFZ0BcX6/Mv4/e1TDw+KNGZeFONOrG3O+p+PfpSXwGS0T9sWs1XzP
	yzaKduJiJaI2pD/NnROW0/VCeziPQOz56V96HYWcbktnqpzKE9z27kGYl7ZlgvdIxw74Tsz0O4C9P
	UCEhZXDNe9e8JbECqm6TSSKm9kLGan91ZP5v+5+jwUT5RQ3QpunzUaQjzVEsI7A8gJJIXCHE52F5K
	WRvmhvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1qG-00000006PRM-3Nw3;
	Thu, 06 Feb 2025 13:22:52 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1nP-00000006OTI-2Wvl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738847995; x=1770383995;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=shnhlrUK1odJl+k6Ii4KIGtll6EUltidXXffesyEza4=;
  b=OOL37uxLjyJQs+DTvMKvgbP+K6isalTnag1BDFIyKy/2zn+I6Oq8lLOy
   zR+teGcjIgh45p2c7ddaxaqu8sjiUx8hVWetqP1sQ/C9GICP1ColszNMK
   gsc58w9eXEbu4ixd9Mg6LXlkZpIF/IvAs2uEE8KamWCy6LS3d8ZyjFCRr
   AAbw/2fnaWOOJ1rjfZ3Jc9bWNG6tzGSQU6eWtiJTM/dgfgQEgpYz3d/06
   mv/ojL4O8laXZEKi/q3mN7hv7uoWjR/685Lkx03XGm8J2wYTbAcoYuLuA
   rSSoeCCSjRk9swH1xD1TQjCRd3ql2M/P6rzekIyscr30zvM5Ue9gQC7D8
   g==;
X-CSE-ConnectionGUID: rkmD2jmKTiSHJq4WxC4fMg==
X-CSE-MsgGUID: gi3JFdmTQV+UUS/NhGKt4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43203639"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43203639"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 05:19:52 -0800
X-CSE-ConnectionGUID: PU01XutaRW6RN9WV2U5Wag==
X-CSE-MsgGUID: dFoelsKdToe2qwOEatvXGQ==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116397172"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 05:19:45 -0800
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
Subject: [PATCH net-next v7 0/7] Enable SGMII and 2500BASEX interface mode switching for Intel platforms
Date: Thu,  6 Feb 2025 21:18:52 +0800
Message-Id: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_051955_683076_B2A38931 
X-CRM114-Status: GOOD (  16.55  )
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

During the interface mode change, the 'phylink_major_config' function will
be triggered in phylink. The modification of the following functions will
support the switching between SGMII and 2500BASE-X interface modes for
the Intel platform:

- xpcs_switch_interface_mode: Re-initiates clause 37 auto-negotiation for
  the SGMII interface mode to perform auto-negotiation.
- mac_finish: Configures the SerDes according to the interface mode.

With the above changes, the code will work as follows during the interface
mode change. The PCS will reconfigure according to the pcs_neg_mode and the
selected interface mode. Then, the MAC driver will perform SerDes
configuration in 'mac_finish' based on the selected interface mode. During
the SerDes configuration, the selected interface mode will identify TSN
lane registers from FIA and then send IPC commands to the Power Management
Controller (PMC) through the PMC driver/API. The PMC will act as a proxy to
program the PLL registers.

Change log:
v1 -> v2: 
 - Add static to pmc_lpm_modes declaration
 - Add cur_link_an_mode to the kernel doc
 - Combine 2 commits i.e. "stmmac: intel: Separate driver_data of ADL-N
 from TGL" and "net: stmmac: Add 1G/2.5G auto-negotiation
 support for ADL-N" into 1 commit.

v2 -> v3:
 - Create `pmc_ipc.c` file for `intel_pmc_ipc()` function and 
 allocate the file in `arch/x86/platform/intel/` directory.
 - Update phylink's AN mode during phy interface change and 
 not exposing phylink's AN mode into phylib.
 
 v3 -> v4:
 - Introduce `allow_switch_interface` flag to have all ethtool 
 link modes that are supported and advertised will be published.
 - Introduce `mac_get_pcs_neg_mode` function that selects the PCS 
 negotiation mode according to the interface mode.
 - Remove pcs-xpcs.c changes and handle pcs during `mac_select_pcs`
 function
 - Configure SerDes base on the interface on `mac_finish` function.
 
 v4 -> v5:
 - remove 'allow_switch_interface' related patches.
 - remove 'mac_select_pcs' related patches.
 - add a soft reset according to XPCS datasheet for re-initiate Clause 37
 auto-negotiation when switching to SGMII interface mode.

v5 -> v6:
- Remove 'mac_get_pcs_neg_mode' related patches. 
  The pcs_neg_mode is properly handled by the
  'net: add negotiation of in-band capabilities' patch series:
  https://patchwork.kernel.org/project/netdevbpf/cover/Z08kCwxdkU4n2V6x@shell.armlinux.org.uk/
- Using act_link_an_mode to determine PHY, as cfg_link_an_mode was not
  updated for the 2500BASE-X interface mode, caused a failure to link up.
- Clean up and standardize the interface mode switch for xpcs.

v6 -> v7:
- Remove the "net: phylink: use act_link_an_mode to determine PHY" patch.
- Use pl->link_interface in phylink_expects_phy().
- Remove priv->plat->serdes_powerup in intel_tsn_lane_is_available() as it is
  always true.
- Refactor the code in intel_config_serdes().
- Rename intel_config_serdes() to intel_mac_finish() with an AN mode parameter.
- Define the magic number as "max_fia_regs".
- Store the pointer and the number of elements in the platform info structure.
- Move the arrays to the C file.

v1: https://patchwork.kernel.org/project/netdevbpf/cover/20230622041905.629430-1-yong.liang.choong@linux.intel.com/
v2: https://patchwork.kernel.org/project/netdevbpf/cover/20230804084527.2082302-1-yong.liang.choong@linux.intel.com/
v3: https://patchwork.kernel.org/project/netdevbpf/cover/20230921121946.3025771-1-yong.liang.choong@linux.intel.com/
v4: https://patchwork.kernel.org/project/netdevbpf/cover/20240129130253.1400707-1-yong.liang.choong@linux.intel.com/
v5: https://patchwork.kernel.org/project/netdevbpf/cover/20240215030500.3067426-1-yong.liang.choong@linux.intel.com/
v6: https://patchwork.kernel.org/project/netdevbpf/cover/20250204061020.1199124-1-yong.liang.choong@linux.intel.com/

Choong Yong Liang (6):
  net: phylink: use pl->link_interface in phylink_expects_phy()
  net: pcs: xpcs: re-initiate clause 37 Auto-negotiation
  stmmac: intel: configure SerDes according to the interface mode
  net: stmmac: configure SerDes on mac_finish
  stmmac: intel: interface switching support for EHL platform
  stmmac: intel: interface switching support for ADL-N platform

David E. Box (1):
  arch: x86: add IPC mailbox accessor function and add SoC register
    access

 MAINTAINERS                                   |   2 +
 arch/x86/Kconfig                              |   9 +
 arch/x86/platform/intel/Makefile              |   1 +
 arch/x86/platform/intel/pmc_ipc.c             |  75 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   2 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 229 +++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.h |  29 +++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  13 +
 drivers/net/pcs/pcs-xpcs-wx.c                 |   4 +-
 drivers/net/pcs/pcs-xpcs.c                    |  60 ++++-
 drivers/net/phy/phylink.c                     |   2 +-
 .../linux/platform_data/x86/intel_pmc_ipc.h   |  34 +++
 include/linux/stmmac.h                        |   4 +
 13 files changed, 452 insertions(+), 12 deletions(-)
 create mode 100644 arch/x86/platform/intel/pmc_ipc.c
 create mode 100644 include/linux/platform_data/x86/intel_pmc_ipc.h

-- 
2.34.1


