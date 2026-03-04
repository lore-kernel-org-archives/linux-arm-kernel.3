Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C56EFCE37
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 20:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlEUkWWMykBpTUB4HK8A0B5r+NvQPJVWLT4/cgsUDBU=; b=pR+Wq8PZDT1TRaI26NYyG73LdJ
	HEePHSPNVmdQ9pdTKCqU++PzollHSbhMD1QgjQMzb/HmPTraQfeQpvupTNELXEXzFCUtJnE3Wq9TC
	ObfycpEBYCUyr8EsIsI0OO7YUMqpqdjtcg90WprM7rM2bseEzTHdylLPDIV7soDpWrbXeq+qFGDGZ
	3hP3lQ2quzubE5On2GOMEsNeGz6tm0PwuvGndl1Rdzuy6j+EoOoD7yheKtw+cG5ujZJWp9r8mkWwn
	od8dnt0g0VSDQSnG+AJvoXmIVX8CcwtXcIOSG4MehWMM1+vHTnm5X2qej40qkTprjvJu3vUw/Hpgj
	5M2MvVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsh1-00000000S6G-0JQi;
	Wed, 04 Mar 2026 20:19:39 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxsgv-00000000S5v-3Bzr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 20:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772655573; x=1804191573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iikIQE7d5BrMbz5QoKczt9e+EFI540Qu1haop92OMoM=;
  b=ORzk4Lnxxu/1lhQfzlriJETq1dIEcJ0SJRbx0davkU/8XLIobXT+iBZG
   z0uyvVIRy9P6CKJgs7D6fefIfHZQp5RXwo/6KyVsyxg1wGYvsk7KXfK2E
   oOQo+HD/fIJ42Fno03WRhFbrCAyWix9xTPH1m/6rbQPSdAhPtP0ziZg5a
   c65IpyTZgn6Ie2hVunVmvj0doUVnwS0s3VGbp+XW46/AM+fi75bO2jKR0
   NxNeWb/maS6yGKf9/dMn93SYu4xojAqueNCYv6tOBEaLKZEq1nhjcKTpL
   x4bdFOlkFgq0eVMy31g8l2DfwczJ5lXEeXVnOcdAIoJZxm4TQWJ7qFg3z
   w==;
X-CSE-ConnectionGUID: QifuTxXkRaO2qYfsFy8lBg==
X-CSE-MsgGUID: VSW94B62QYG8w+cbzNzWWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84815871"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="84815871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 12:19:32 -0800
X-CSE-ConnectionGUID: Ya7/Uf4pRGabToPTi0eQCw==
X-CSE-MsgGUID: 8GePQ8mUR2+NTCVoDJpoKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="256331372"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Mar 2026 12:19:29 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxsgn-000000004S5-2C0D;
	Wed, 04 Mar 2026 20:19:25 +0000
Date: Thu, 5 Mar 2026 04:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH net-next 8/8] net: stmmac: make pcs_mask and phy_mask u32
Message-ID: <202603050424.TDlVj9FT-lkp@intel.com>
References: <E1vxjNj-0000000Br1c-2Fg7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vxjNj-0000000Br1c-2Fg7@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_121933_872700_7A08845C 
X-CRM114-Status: GOOD (  10.30  )
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
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603050424.TDlVj9FT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050424.TDlVj9FT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050424.TDlVj9FT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:171:35: error: call to undeclared function 'BIT_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     171 |         plat->mdio_bus_data->phy_mask = ~BIT_u32(2);
         |                                          ^
   1 error generated.


vim +/BIT_u32 +171 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c

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

