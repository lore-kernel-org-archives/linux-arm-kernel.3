Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5F7EFCE39
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 19:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NFd5DGRL/IrW1hDf8AS6DtJEUGcFyzalFepeI1tRIs=; b=sU/BnntTS57Hvd+htkidQKtanU
	K2i+jqUdG++mXu9VGicr90/bVPNfc4Pu6/1fXtk+MtkqT+R8W/jOnZchp+gC+sTdrURfuN3I/XcyV
	hGnKT+LImmYaDZLf2gBXGcgB5cZblT7DYVmbyQB5DXNeMAduHXZUW0M4OVxX0YM/jy1nR+nLNCJzD
	98RKNzmNz5zwBOMQRVP9wSFstVxxQovtIuHD0uekFh7mFGJ7VshHPwsWxR5uLoFPWJceCoHvRY1lS
	Lp873wnPZBVygB90YBmvE5/Pa1U+RFiHHCcj0IiP/wQntxmzEcPFJKJLYQ5QgF65+ggeXZ6FcN4hY
	SzltzwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrqh-00000000Oo3-0vuk;
	Wed, 04 Mar 2026 19:25:35 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrqb-00000000OmK-3fT7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 19:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772652329; x=1804188329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=93zi98/SCHi0Xdt2/6okf2xCqWA0WfMJZVk3NLVoY/Y=;
  b=T4WD+aYveAhErF7JnCyEBp6zXXL8xXA1YQGsnQU4bvVaJ61i+FHeThmD
   jloUxqHScirmS7EwD95IwI8ex/Kb+X5D8hpADjUQOOSLTU2Di9b6eiIFX
   RCQvkQlPwZoFSotQRug4nZ/sOYu/Cvw7EiuUwz0598dKeilfXdXYDksTf
   TTW2yHG22C/sFLZIvOnwGq2XBTkQyeRWM36VIaL/Tg08TVBJh1uKEWOe1
   w7bqH9JVEL9drw+ekgxslskxw1aA6T9XViXlDWu9+EjM5WFlbdvrHdpVH
   DtP9hEDAsOeEC8GsBWrsIzL3A+cNWEwHIALTgCIic4YWaOSrgfjK929K6
   g==;
X-CSE-ConnectionGUID: k8q12WgDRey1JUGybn/9eg==
X-CSE-MsgGUID: t1ma2sRQRrSbSg4PjX0tYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72753239"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72753239"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 11:25:28 -0800
X-CSE-ConnectionGUID: dct93SjiSJaEO42FIENObw==
X-CSE-MsgGUID: ajr2Y/TORySK9X58Glk5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="218378608"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2026 11:25:26 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxrqU-000000004O5-0gkS;
	Wed, 04 Mar 2026 19:25:22 +0000
Date: Thu, 5 Mar 2026 03:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH net-next 8/8] net: stmmac: make pcs_mask and phy_mask u32
Message-ID: <202603050340.7qkvXUGq-lkp@intel.com>
References: <E1vxjNj-0000000Br1c-2Fg7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vxjNj-0000000Br1c-2Fg7@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_112530_374875_1F6B05D5 
X-CRM114-Status: GOOD (  10.25  )
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

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-mdio-use-same-test-for-MDC-clock-divisor-lookups/20260304-183416
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vxjNj-0000000Br1c-2Fg7%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 8/8] net: stmmac: make pcs_mask and phy_mask u32
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603050340.7qkvXUGq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050340.7qkvXUGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050340.7qkvXUGq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c: In function 'loongson_gnet_data':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:171:42: error: implicit declaration of function 'BIT_u32'; did you mean 'BIT_U32'? [-Wimplicit-function-declaration]
     171 |         plat->mdio_bus_data->phy_mask = ~BIT_u32(2);
         |                                          ^~~~~~~
         |                                          BIT_U32


vim +171 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c

   164	
   165	static int loongson_gnet_data(struct pci_dev *pdev,
   166				      struct plat_stmmacenet_data *plat)
   167	{
   168		loongson_default_data(pdev, plat);
   169	
   170		plat->phy_interface = PHY_INTERFACE_MODE_GMII;
 > 171		plat->mdio_bus_data->phy_mask = ~BIT_u32(2);
   172		plat->fix_mac_speed = loongson_gnet_fix_speed;
   173	
   174		return 0;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

