Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F60C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoPORYCR+5J+TLheXkTnsoZP1b4dLReNbO/slARVIcQ=; b=k9OUxhQG5I1VXhp1FaogRZyCZy
	gF4+cCPS+EifoT9+BDugQZw1V5PYfQAP63qOpT+gwuW6/atGNyB0t4UIlRbZgyxxPIH6S5V17CMWC
	GAoNGiG0JeHVfxKjVpH/LJ0IjyqL8yo5W2YM7QqvV0FIEvESoSyhcUc+gLQBzVjmoDRCEat1v2MX4
	+gdT+TbN8BPKn0Z9Bufe369+0+J2ITOtMFeskXoP1o3wiKIxyaHkF/jCPz4Gl9yps7aLBnHkFOucc
	LJqPY/jPhOnjRtKW5RRwWXdGbav/svz7v6Juj5hqbq875knTJfIv1Maf+ORKouHBp0krsXepTOFXE
	GAe44Phw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS48-0000000B6KF-23Tp;
	Tue, 03 Jun 2025 13:52:32 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRtC-0000000B4NR-0t33;
	Tue, 03 Jun 2025 13:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748958075; x=1780494075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ld/DmiOsr/GIjO8Gve7Gwa5r9+0LnmJEzLNU8zeFIpw=;
  b=fCP52rM+mcy7Aa+hcBmV+fhTqaqyq++Zyg2L/jN2yNNs1qWacJqbKCxu
   iyewglkI+sDTAEooaSyn951V9PI4vtufivrGFVI8XGk/1ez+LmUUKTZ4q
   Qo5uJRU3qDn24GIvlw1mEv3IEpnZG3rI/bRcGFPrVuixxm0On9/3UC6Kh
   YacMkR0+d/zjLYSO9/8E0zv4gWcXE58G2Pwvlod8R974IOO33vzNd8eQt
   6lvVC871a8QCA5RHrU/tACy1Ki8wM3J37OI6Ch5Ur0mXP39HpEU4ulHtS
   jgp5P5q4hGBLbyMzRSc4jbQuWIIV/206NgI7dzrzUyhH5d+Lcmab1AvSe
   g==;
X-CSE-ConnectionGUID: 81azBalwRISSzx3Ktam3kA==
X-CSE-MsgGUID: ZzIaRA2zQMyZl8cDEdtcQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50693255"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="50693255"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 06:41:13 -0700
X-CSE-ConnectionGUID: Ksv9muBGQaGp28i285/M4Q==
X-CSE-MsgGUID: Xh9d85mtRBWw5r1/a3RPuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="145823921"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2025 06:41:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMRt4-0002Sv-1r;
	Tue, 03 Jun 2025 13:41:06 +0000
Date: Tue, 3 Jun 2025 21:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, nfraprado@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Irving lin <irving-ch.lin@mediatek.corp-partner.google.com>
Subject: Re: [1/5] clk: mt8189: Porting driver for clk
Message-ID: <202506032107.zewlKCY5-lkp@intel.com>
References: <20250602083624.1849719-1-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602083624.1849719-1-irving-ch.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_064114_321186_CFF15196 
X-CRM114-Status: GOOD (  16.95  )
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

Hi irving.ch.lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/irving-ch-lin/clk-mt8189-Porting-driver-for-clk/20250603-105623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20250602083624.1849719-1-irving-ch.lin%40mediatek.com
patch subject: [1/5] clk: mt8189: Porting driver for clk
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250603/202506032107.zewlKCY5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506032107.zewlKCY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506032107.zewlKCY5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/mediatek/clk-bringup.c: In function '__bring_up_enable':
   drivers/clk/mediatek/clk-bringup.c:18:50: error: invalid use of undefined type 'struct platform_device'
      18 |         clk_con = of_count_phandle_with_args(pdev->dev.of_node, "clocks",
         |                                                  ^~
   drivers/clk/mediatek/clk-bringup.c:22:38: error: invalid use of undefined type 'struct platform_device'
      22 |                 clk = of_clk_get(pdev->dev.of_node, i);
         |                                      ^~
   drivers/clk/mediatek/clk-bringup.c: In function 'clk_post_ao_probe':
   drivers/clk/mediatek/clk-bringup.c:48:40: error: invalid use of undefined type 'struct platform_device'
      48 |         struct device_node *node = pdev->dev.of_node;
         |                                        ^~
   drivers/clk/mediatek/clk-bringup.c: In function 'bring_up_probe':
   drivers/clk/mediatek/clk-bringup.c:78:51: error: invalid use of undefined type 'struct platform_device'
      78 |         clk_probe = of_device_get_match_data(&pdev->dev);
         |                                                   ^~
   drivers/clk/mediatek/clk-bringup.c:84:17: error: implicit declaration of function 'dev_err' [-Werror=implicit-function-declaration]
      84 |                 dev_err(&pdev->dev,
         |                 ^~~~~~~
   drivers/clk/mediatek/clk-bringup.c:84:30: error: invalid use of undefined type 'struct platform_device'
      84 |                 dev_err(&pdev->dev,
         |                              ^~
   drivers/clk/mediatek/clk-bringup.c:86:29: error: invalid use of undefined type 'struct platform_device'
      86 |                         pdev->name, r);
         |                             ^~
   drivers/clk/mediatek/clk-bringup.c: At top level:
   drivers/clk/mediatek/clk-bringup.c:96:15: error: variable 'bring_up' has initializer but incomplete type
      96 | static struct platform_driver bring_up = {
         |               ^~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-bringup.c:97:10: error: 'struct platform_driver' has no member named 'probe'
      97 |         .probe          = bring_up_probe,
         |          ^~~~~
   drivers/clk/mediatek/clk-bringup.c:97:27: warning: excess elements in struct initializer
      97 |         .probe          = bring_up_probe,
         |                           ^~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-bringup.c:97:27: note: (near initialization for 'bring_up')
   drivers/clk/mediatek/clk-bringup.c:98:10: error: 'struct platform_driver' has no member named 'remove'
      98 |         .remove         = bring_up_remove,
         |          ^~~~~~
   drivers/clk/mediatek/clk-bringup.c:98:27: warning: excess elements in struct initializer
      98 |         .remove         = bring_up_remove,
         |                           ^~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-bringup.c:98:27: note: (near initialization for 'bring_up')
   drivers/clk/mediatek/clk-bringup.c:99:10: error: 'struct platform_driver' has no member named 'driver'
      99 |         .driver         = {
         |          ^~~~~~
   drivers/clk/mediatek/clk-bringup.c:99:27: error: extra brace group at end of initializer
      99 |         .driver         = {
         |                           ^
   drivers/clk/mediatek/clk-bringup.c:99:27: note: (near initialization for 'bring_up')
   drivers/clk/mediatek/clk-bringup.c:99:27: warning: excess elements in struct initializer
   drivers/clk/mediatek/clk-bringup.c:99:27: note: (near initialization for 'bring_up')
   drivers/clk/mediatek/clk-bringup.c:106:1: warning: data definition has no type or storage class
     106 | module_platform_driver(bring_up);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-bringup.c:106:1: error: type defaults to 'int' in declaration of 'module_platform_driver' [-Werror=implicit-int]
>> drivers/clk/mediatek/clk-bringup.c:106:1: warning: parameter names (without types) in function declaration
   drivers/clk/mediatek/clk-bringup.c:96:31: error: storage size of 'bring_up' isn't known
      96 | static struct platform_driver bring_up = {
         |                               ^~~~~~~~
   drivers/clk/mediatek/clk-bringup.c:96:31: warning: 'bring_up' defined but not used [-Wunused-variable]
   cc1: some warnings being treated as errors


vim +106 drivers/clk/mediatek/clk-bringup.c

   105	
 > 106	module_platform_driver(bring_up);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

