Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8156C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 05:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WkN/Mc+MlB3a+omNUoZmpm8osX6KcDfAO15OXrjI0Mo=; b=Hst0MPuayZhs7zYUi23pWDt191
	bLJPIfuFggLyZRq02QbblfySQmHroEByhLkaIF1VsvOjZLKsOEL2dZB+HmZ5TK7GWVE658pWuzUzQ
	v8mDZ3tL2YsNErqzYH/aEt2Zup4TUDqXMkK6vEhTgA1TYTPTLlzZxtVYZBe33xxPH4xHiqLnX04ZB
	KF0bljyzHxkheFNFrM4v/1+cxRseanN45otT2VNvHM+J/HPx4oMY8HHQEcXRkykJPEnauhpde+nZN
	rfV9502Z0lxkLntWBF8AqRA6Job1MgfEXxYJ5x+lT7j5UdbKYUy3BXdfEp/c7itElvx/UaO1kYtSu
	4QqN4mZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tocJ0-0000000FQtx-32JS;
	Sun, 02 Mar 2025 05:56:02 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tocHS-0000000FQr1-3Ml0;
	Sun, 02 Mar 2025 05:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740894867; x=1772430867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bwxh65enYp7z7+nk/ktcyTAllt4Dp53/Oa30yt7HiuU=;
  b=fzU58whdxmYQ3LQMbO0eQqriSl8K2yE234bX8sobBIJzbhEHFhaLyDi4
   v3I4YY6T9WsQIlm03JXslzk/D+a9WII576ICnBLF8IzrZgBniGaRFJKbH
   Rc6P3d/uksqsst+odTkc5O3ebGcDqqFao6hrgFqwyaMHZPEGOqrbckP7E
   Rg0mrLhfQBqfOLqS7adN92oB+hMLm21rPg5f06abPJj4rfWE07Ky7CJPh
   014OCGjAEkQ6hbfg2psm19Bo0+lXn0GV8PcwQXgk5kK9v5EfnkHb9huNy
   7lGT5nVpTEgN3+YeFAqp+B4GUMC3jY8n+tNIbGDYgxo8zMXNNiAtKU5Ho
   A==;
X-CSE-ConnectionGUID: eHP4CufTQZyAJp2k/7Ivxg==
X-CSE-MsgGUID: brMRMdnGQl65JiTY2qT44g==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="67155141"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="67155141"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 21:54:24 -0800
X-CSE-ConnectionGUID: WCehWzXNSiC9JI7J71HIQg==
X-CSE-MsgGUID: ZMWTrckeReaUabKYD4YVHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="122710107"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Mar 2025 21:54:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tocHK-000H6U-3C;
	Sun, 02 Mar 2025 05:54:18 +0000
Date: Sun, 2 Mar 2025 13:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Tao Huang <huangtao@rock-chips.com>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>
Subject: [rockchip:v6.15-clk/next 10/10]
 drivers/clk/rockchip/clk-rk3562.c:1081:31: error: incomplete definition of
 type 'struct platform_device'
Message-ID: <202503021302.FjsycBI2-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_215426_903664_72B5CE4D 
X-CRM114-Status: GOOD (  13.85  )
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
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250302/202503021302.FjsycBI2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021302.FjsycBI2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021302.FjsycBI2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/clk/rockchip/clk-rk3562.c:1079:36: warning: declaration of 'struct platform_device' will not be visible outside of this function [-Wvisibility]
    1079 | static int clk_rk3562_probe(struct platform_device *pdev)
         |                                    ^
>> drivers/clk/rockchip/clk-rk3562.c:1081:31: error: incomplete definition of type 'struct platform_device'
    1081 |         struct device_node *np = pdev->dev.of_node;
         |                                  ~~~~^
   drivers/clk/rockchip/clk-rk3562.c:1079:36: note: forward declaration of 'struct platform_device'
    1079 | static int clk_rk3562_probe(struct platform_device *pdev)
         |                                    ^
   drivers/clk/rockchip/clk-rk3562.c:1085:55: error: incomplete definition of type 'struct platform_device'
    1085 |         match = of_match_device(clk_rk3562_match_table, &pdev->dev);
         |                                                          ~~~~^
   drivers/clk/rockchip/clk-rk3562.c:1079:36: note: forward declaration of 'struct platform_device'
    1079 | static int clk_rk3562_probe(struct platform_device *pdev)
         |                                    ^
>> drivers/clk/rockchip/clk-rk3562.c:1096:31: error: variable has incomplete type 'struct platform_driver'
    1096 | static struct platform_driver clk_rk3562_driver = {
         |                               ^
   drivers/clk/rockchip/clk-rk3562.c:1096:15: note: forward declaration of 'struct platform_driver'
    1096 | static struct platform_driver clk_rk3562_driver = {
         |               ^
>> drivers/clk/rockchip/clk-rk3562.c:1104:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1104 | module_platform_driver(clk_rk3562_driver);
         | ^
         | int
>> drivers/clk/rockchip/clk-rk3562.c:1104:24: error: a parameter list without types is only allowed in a function definition
    1104 | module_platform_driver(clk_rk3562_driver);
         |                        ^
   1 warning and 5 errors generated.


vim +1081 drivers/clk/rockchip/clk-rk3562.c

  1078	
> 1079	static int clk_rk3562_probe(struct platform_device *pdev)
  1080	{
> 1081		struct device_node *np = pdev->dev.of_node;
  1082		const struct of_device_id *match;
  1083		const struct clk_rk3562_inits *init_data;
  1084	
  1085		match = of_match_device(clk_rk3562_match_table, &pdev->dev);
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
  1097		.probe		= clk_rk3562_probe,
  1098		.driver		= {
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

