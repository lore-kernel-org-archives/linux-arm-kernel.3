Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA4EC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 21:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b+pZkly6KJqOq+hphnWeHd+qvoU/yiY775R39Uq++no=; b=fTnLzVEonHI6H0fZUIVUSH76D4
	6cDT/y1MB/9nklM5r5z3M4ZIJkHr5IYX0IyebCffufJp14UHk4LrNTyEx1HN8AtVOiiuZSD9/rutt
	cMSdKsPAzyBMbWujXsRZDKvPIxy8Y6dngvAIgXaOflaShUWXv7pHKdlxk2izEmfPemChCn6s/ubdS
	iuDPxsp6i9Avg/yyg1IC5xeU61bMPwuzHluPvAPDMO2B3rtgnmRbfNIEm07rjckYuh0V7FI6WF0oQ
	inpfcDA42atLV4ztmHGa+1sRY8Er50Y6KVPwfabxPlNIaR+7xaGz/9NDcMbhki++T79bYQAtCaLF3
	GepOmNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toUs6-0000000F0lT-1HUZ;
	Sat, 01 Mar 2025 21:59:46 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toUqS-0000000F0ij-1oDV;
	Sat, 01 Mar 2025 21:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740866285; x=1772402285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ojFzulCXDEMly9qyeJY7C4BCPM7vNvCVev0pov5Clfo=;
  b=UTMCwYovEJMN4hMYNxiu4eGfo4/trRo7QnSlebqSBrFAAirrFnCjCgzT
   /kz4rfj0btGoGxtwe2aH5JgNrMrJrRuObE7pk0EVDcMif2/9ov3I7boRH
   xhA3F1e6p2nPPLl3CAPiIgDIMhhkiprnaAR8NQpJlWLgLDZg8TQd7LsTs
   D9X9Hiq38E4NKCKmMx1Z9RE2TzGIdCsA0sORQ+mLAdTQIsEdyPU5Va1nh
   8Mkux6rZDA3C4kbI9E2yPGExV3zWQonjUudcsGu4begcvEY7S7u5UlYwZ
   mjv7YFpJ0uUUybSYVdfGUcHQ/mzBvbTSKbLf3JAzssk949bAbFi/iUrvF
   w==;
X-CSE-ConnectionGUID: UqRgQtPDQ+6Z0arzCul31Q==
X-CSE-MsgGUID: HGkHH+i0TnSRJlgUHfWFmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41799352"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41799352"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 13:57:59 -0800
X-CSE-ConnectionGUID: 6vw+F3jjQqmaKPZdwK/CGQ==
X-CSE-MsgGUID: r7mjrjYOR2aeNdzhepfSww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118543134"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Mar 2025 13:57:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toUqC-000GkQ-2k;
	Sat, 01 Mar 2025 21:57:50 +0000
Date: Sun, 2 Mar 2025 05:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Tao Huang <huangtao@rock-chips.com>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>
Subject: [rockchip:v6.15-clk/next 10/10]
 drivers/clk/rockchip/clk-rk3562.c:1081:38: error: invalid use of undefined
 type 'struct platform_device'
Message-ID: <202503020525.AVLjosKr-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_135804_520335_D476902C 
X-CRM114-Status: GOOD (  15.23  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-clk/next
head:   36c7fdc8f585acbf11c8e5bc112fa9d8ef75146a
commit: 36c7fdc8f585acbf11c8e5bc112fa9d8ef75146a [10/10] clk: rockchip: Add clock controller for the RK3562
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250302/202503020525.AVLjosKr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020525.AVLjosKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020525.AVLjosKr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/clk/rockchip/clk-rk3562.c:1079:36: warning: 'struct platform_device' declared inside parameter list will not be visible outside of this definition or declaration
    1079 | static int clk_rk3562_probe(struct platform_device *pdev)
         |                                    ^~~~~~~~~~~~~~~
   drivers/clk/rockchip/clk-rk3562.c: In function 'clk_rk3562_probe':
>> drivers/clk/rockchip/clk-rk3562.c:1081:38: error: invalid use of undefined type 'struct platform_device'
    1081 |         struct device_node *np = pdev->dev.of_node;
         |                                      ^~
   drivers/clk/rockchip/clk-rk3562.c:1085:62: error: invalid use of undefined type 'struct platform_device'
    1085 |         match = of_match_device(clk_rk3562_match_table, &pdev->dev);
         |                                                              ^~
   drivers/clk/rockchip/clk-rk3562.c: At top level:
>> drivers/clk/rockchip/clk-rk3562.c:1096:15: error: variable 'clk_rk3562_driver' has initializer but incomplete type
    1096 | static struct platform_driver clk_rk3562_driver = {
         |               ^~~~~~~~~~~~~~~
>> drivers/clk/rockchip/clk-rk3562.c:1097:10: error: 'struct platform_driver' has no member named 'probe'
    1097 |         .probe          = clk_rk3562_probe,
         |          ^~~~~
>> drivers/clk/rockchip/clk-rk3562.c:1097:27: warning: excess elements in struct initializer
    1097 |         .probe          = clk_rk3562_probe,
         |                           ^~~~~~~~~~~~~~~~
   drivers/clk/rockchip/clk-rk3562.c:1097:27: note: (near initialization for 'clk_rk3562_driver')
>> drivers/clk/rockchip/clk-rk3562.c:1098:10: error: 'struct platform_driver' has no member named 'driver'
    1098 |         .driver         = {
         |          ^~~~~~
>> drivers/clk/rockchip/clk-rk3562.c:1098:27: error: extra brace group at end of initializer
    1098 |         .driver         = {
         |                           ^
   drivers/clk/rockchip/clk-rk3562.c:1098:27: note: (near initialization for 'clk_rk3562_driver')
   drivers/clk/rockchip/clk-rk3562.c:1098:27: warning: excess elements in struct initializer
   drivers/clk/rockchip/clk-rk3562.c:1098:27: note: (near initialization for 'clk_rk3562_driver')
>> drivers/clk/rockchip/clk-rk3562.c:1104:1: warning: data definition has no type or storage class
    1104 | module_platform_driver(clk_rk3562_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/rockchip/clk-rk3562.c:1104:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Wimplicit-int]
>> drivers/clk/rockchip/clk-rk3562.c:1104:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/clk/rockchip/clk-rk3562.c:1096:31: error: storage size of 'clk_rk3562_driver' isn't known
    1096 | static struct platform_driver clk_rk3562_driver = {
         |                               ^~~~~~~~~~~~~~~~~
>> drivers/clk/rockchip/clk-rk3562.c:1096:31: warning: 'clk_rk3562_driver' defined but not used [-Wunused-variable]


vim +1081 drivers/clk/rockchip/clk-rk3562.c

  1078	
> 1079	static int clk_rk3562_probe(struct platform_device *pdev)
  1080	{
> 1081		struct device_node *np = pdev->dev.of_node;
  1082		const struct of_device_id *match;
  1083		const struct clk_rk3562_inits *init_data;
  1084	
> 1085		match = of_match_device(clk_rk3562_match_table, &pdev->dev);
  1086		if (!match || !match->data)
  1087			return -EINVAL;
  1088	
  1089		init_data = match->data;
  1090		if (init_data->inits)
  1091			init_data->inits(np);
  1092	
  1093		return 0;
  1094	}
  1095	
> 1096	static struct platform_driver clk_rk3562_driver = {
> 1097		.probe		= clk_rk3562_probe,
> 1098		.driver		= {
  1099			.name	= "clk-rk3562",
  1100			.of_match_table = clk_rk3562_match_table,
  1101			.suppress_bind_attrs = true,
  1102		},
  1103	};
> 1104	module_platform_driver(clk_rk3562_driver);
  1105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

