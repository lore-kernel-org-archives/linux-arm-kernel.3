Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B74C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wdMdZT+pCp4KkelnHGr3LtNc52lAFT/knG6SFw82yE=; b=ZUlNly+umefov5KLWEX2idulSt
	KXtNyKmBuAP72tXpOWSjcbRwOkF/UDfX3dnK6mI4/ey4SbwL3qc9ybwzTy5tjklr5ffwIsH5x5MOu
	p1xEkNKPiE6a7xudjj3Pr4pxCLkSgKqoTWTS3DmWLQ9F1Li0/mrZge9jSXJlUAi1VOkhb1ltY6CL6
	qlinT1RGYUzxZaXJzg+vZLJjBMjI8Ws0oSSfc0C+cUyVTeszEzqYijr1C/3ihYBINnn7EcaW/kbCk
	Vz2euWE2r372KOPyW2euErMLg4Q1CB7flQDV4tem+yv1j8NhZmGew5Y2z9cU2crlS9UqaSaDiGWQi
	mDCm4cvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScOO-0000000FoW3-10dS;
	Fri, 20 Jun 2025 14:06:56 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScLC-0000000Fo84-1lXQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 14:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750428218; x=1781964218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p9nC1h8R9HgKVWcy4BLKg7nHMZViNKOTBn/WYNwJk18=;
  b=AO3JtqI6U7B8VnLSN/xrF5WawEy8uI0hBx0mp3GbH+LnINY4D+05b2ic
   rxfCw0tX+9WZx8Mhu4Ud2oz5i1Vn7K0OdDUNW2cPxZL1idzeyfKRdFep8
   avGlvVvVLxyfRqulmIEet9Xsf4gFT3mSx/JSIbAKLSWQrgyNF5rSpEj48
   BoY7AKP1K8yEUp2Cl2OVZHl3c/7G6KSEd/XolCydB7V4YV6X1/VZZxDDJ
   EJWSUgzWya/uC8zrpVdmyo7hZuldT34/wViqKQ+XCWKmZT/isDvk9iGXW
   FT2I/Rz5jtHIGLm/wvuNvWw512Tr3InQSDSSIArDL4oMNzlyLyFqEGlgH
   w==;
X-CSE-ConnectionGUID: m3bG2cpRTd+fAClqnmHOFA==
X-CSE-MsgGUID: GtGlqvpsQ+yDaTCO9qtFpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63744882"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="63744882"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 07:03:27 -0700
X-CSE-ConnectionGUID: RuhpVMTJTUCTIYqFQpaKbw==
X-CSE-MsgGUID: yd7fuzCsTgmcfEDgpRruHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="151471639"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jun 2025 07:03:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uScKu-000LpW-2I;
	Fri, 20 Jun 2025 14:03:20 +0000
Date: Fri, 20 Jun 2025 22:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Michal Simek <monstr@monstr.eu>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [PATCH net 4/4] net: axienet: Split into MAC and MDIO drivers
Message-ID: <202506202126.EmqQsj0w-lkp@intel.com>
References: <20250619200537.260017-5-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619200537.260017-5-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_070338_544048_1E548699 
X-CRM114-Status: UNSURE (   8.74  )
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

Hi Sean,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/auxiliary-Allow-empty-id/20250620-040839
base:   net/main
patch link:    https://lore.kernel.org/r/20250619200537.260017-5-sean.anderson%40linux.dev
patch subject: [PATCH net 4/4] net: axienet: Split into MAC and MDIO drivers
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250620/202506202126.EmqQsj0w-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506202126.EmqQsj0w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506202126.EmqQsj0w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of '__inittest'
    3225 | module_platform_driver(axienet_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:131:42: note: expanded from macro '\
   module_init'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2900:1: note: previous definition is here
    2900 | module_auxiliary_driver(xilinx_axienet_mac)
         | ^
   include/linux/auxiliary_bus.h:289:2: note: expanded from macro 'module_auxiliary_driver'
     289 |         module_driver(__auxiliary_driver, auxiliary_driver_register, auxiliary_driver_unregister)
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:131:42: note: expanded from macro '\
   module_init'
     131 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of 'init_module'
    3225 | module_platform_driver(axienet_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:133:6: note: expanded from macro '\
   module_init'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2900:1: note: previous definition is here
    2900 | module_auxiliary_driver(xilinx_axienet_mac)
         | ^
   include/linux/auxiliary_bus.h:289:2: note: expanded from macro 'module_auxiliary_driver'
     289 |         module_driver(__auxiliary_driver, auxiliary_driver_register, auxiliary_driver_unregister)
         |         ^
   include/linux/device/driver.h:261:3: note: expanded from macro 'module_driver'
     261 | } \
         |   ^
   include/linux/module.h:133:6: note: expanded from macro '\
   module_init'
     133 |         int init_module(void) __copy(initfn)                    \
         |             ^
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of '__exittest'
    3225 | module_platform_driver(axienet_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:139:42: note: expanded from macro '\
   module_exit'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2900:1: note: previous definition is here
    2900 | module_auxiliary_driver(xilinx_axienet_mac)
         | ^
   include/linux/auxiliary_bus.h:289:2: note: expanded from macro 'module_auxiliary_driver'
     289 |         module_driver(__auxiliary_driver, auxiliary_driver_register, auxiliary_driver_unregister)
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:139:42: note: expanded from macro '\
   module_exit'
     139 |         static inline exitcall_t __maybe_unused __exittest(void)                \
         |                                                 ^
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of 'cleanup_module'
    3225 | module_platform_driver(axienet_driver);
         | ^
   include/linux/platform_device.h:292:2: note: expanded from macro 'module_platform_driver'
     292 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:141:7: note: expanded from macro '\
   module_exit'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2900:1: note: previous definition is here
    2900 | module_auxiliary_driver(xilinx_axienet_mac)
         | ^
   include/linux/auxiliary_bus.h:289:2: note: expanded from macro 'module_auxiliary_driver'
     289 |         module_driver(__auxiliary_driver, auxiliary_driver_register, auxiliary_driver_unregister)
         |         ^
   include/linux/device/driver.h:266:3: note: expanded from macro 'module_driver'
     266 | } \
         |   ^
   include/linux/module.h:141:7: note: expanded from macro '\
   module_exit'
     141 |         void cleanup_module(void) __copy(exitfn)                \
         |              ^
   4 errors generated.


vim +/__inittest +3225 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

8a3b7a252dca9f Daniel Borkmann  2012-01-19  3224  
2be586205ca2b8 Srikanth Thokala 2015-05-05 @3225  module_platform_driver(axienet_driver);
8a3b7a252dca9f Daniel Borkmann  2012-01-19  3226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

