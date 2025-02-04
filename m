Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D44C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 06:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cOuO22YYIaWweJUMXvaEbV2UmeNHYwuM0IA/IwmrdKY=; b=pbbZPYmii0qqx2R84cH9Y2AjcG
	WKzGmiXJXgJddzFTPWwyPpLsiOgsQuopXFnIfyqE2kcJpLVKxilh1mP7Gl+lZEyOsfm7NuO8nPpKi
	gjSEJSiUMgMue6R3QkbCH8dsUuPZe6iSBmCyXDCe75fS+1u4cB7be4Q9Ibl5Yo391Ai/Pqak5GMjk
	wqS/kjcQNa5Wdkb3D/n2ciq8lqpQR2VDJQojHDYyu/TS1HcwC2Y5HlE43J0I7oCaPuYSjvMJSszBO
	Cap7BZqAbysZeU3PV6R5T3pULIi8mKuDDr8eclK5xsXHvSnHmu7Stg+Xamxs+el+eElk+JVCLLti0
	2XM8UuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCAk-0000000HLCY-3vN9;
	Tue, 04 Feb 2025 06:12:34 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfC9P-0000000HKt8-1ofW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 06:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738649471; x=1770185471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wFcpLZeR+9puSZ3enjCz0fy9g9uHT+CQiy08Uu+Q6Ec=;
  b=DuwyASxf1kzPoxNiZ1QVWsrnAgJTbROWXG9KHqES/K5f924br59YnbLb
   Iy/mW3fLuPH81F6Uljo4A2VN7Z3/EKYwi7cXN6Q1u1cl76pYJYpPl1MEU
   MzYTMl11eZv1uyxtVghqsqJVKX420kBiI9//QCQ8g6W+SfZ6NidRm0a0N
   N+vGTudktWjdHOJ3ft4Olc2l8SPOku2gsB/Y/l+9/N7ZgpGsy61BRv4WF
   MA8ERQBTHCxtq3PFd+zSAQRwHUTMOdJqGTaTm618ycwYmpjPiczrdW2pz
   wBPT7rX1t3PD/Tv56aRX0KyoeUrNjAInZUnDWCQkOaBJToIuvLI3jmlMe
   Q==;
X-CSE-ConnectionGUID: z6wVRxxtRyirBBCJ4jPASg==
X-CSE-MsgGUID: ApepJz5+T1KWMHMWfqFJQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50579587"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50579587"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 22:11:10 -0800
X-CSE-ConnectionGUID: 6jwsG0/7QO+8MjZY2BO8oQ==
X-CSE-MsgGUID: qq7r9d+hTXaVNxJRjccM7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="110279139"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 22:11:02 -0800
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
Subject: [PATCH net-next v6 0/7] Enable SGMII and 2500BASEX interface mode switching for Intel platforms
Date: Tue,  4 Feb 2025 14:10:13 +0800
Message-Id: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_221111_517493_C4924583 
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

v1: https://patchwork.kernel.org/project/netdevbpf/cover/20230622041905.629430-1-yong.liang.choong@linux.intel.com/
v2: https://patchwork.kernel.org/project/netdevbpf/cover/20230804084527.2082302-1-yong.liang.choong@linux.intel.com/
v3: https://patchwork.kernel.org/project/netdevbpf/cover/20230921121946.3025771-1-yong.liang.choong@linux.intel.com/
v4: https://patchwork.kernel.org/project/netdevbpf/cover/20240129130253.1400707-1-yong.liang.choong@linux.intel.com/
v5: https://patchwork.kernel.org/project/netdevbpf/cover/20240215030500.3067426-1-yong.liang.choong@linux.intel.com/

Choong Yong Liang (6):
  net: phylink: use act_link_an_mode to determine PHY
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
 arch/x86/platform/intel/pmc_ipc.c             |  75 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   2 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 173 +++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.h |  81 ++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  13 ++
 drivers/net/pcs/pcs-xpcs-wx.c                 |   4 +-
 drivers/net/pcs/pcs-xpcs.c                    |  60 +++++-
 drivers/net/phy/phylink.c                     |  10 +-
 .../linux/platform_data/x86/intel_pmc_ipc.h   |  34 ++++
 include/linux/stmmac.h                        |   3 +
 13 files changed, 450 insertions(+), 17 deletions(-)
 create mode 100644 arch/x86/platform/intel/pmc_ipc.c
 create mode 100644 include/linux/platform_data/x86/intel_pmc_ipc.h

-- 
2.34.1


