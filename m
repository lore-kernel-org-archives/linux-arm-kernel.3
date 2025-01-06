Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004E4E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pvUfIHg4+WJXZgN87XTmZPjdV0QDXV9TWSD0GsFeHQ=; b=cOQ6zNaSDhUoCXxBEAW1EPz6WX
	FCcaH9xVWU48MGTD6FLxXTO1T0B0VzKHy2EkhCNsyPCVoRkFZLeVAmtM3lFr+nJUbkT16Q7SZvnOt
	HXTKn3gQOQ88DLDEr0/EoWXck/s4vmgqVYc+F2x5BSpGPeRoVqSveVqcGUAbWeEpn+b9Xhteus2vx
	M3Bl1CLYOwtF4lqd/+4Fowwu7BK9y5MDZZpOXpkkPv+pdrWOMWHcwp/trSrerxMXC8diDxoep+3mR
	pteNrU3ULyPoN49PsjzmFE5VbP5z2whQaIjJ/Iot1yD6Hhmae2kIbE6uQJ+WRZTkxogviVm5qq/1m
	OgQxCwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUm7Q-00000001CJt-22zC;
	Mon, 06 Jan 2025 12:22:04 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlqj-000000018PS-0HhF;
	Mon, 06 Jan 2025 12:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736165089; x=1767701089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NfJHdrBGwxLD4KXgBvfFDw2dyyxkbKlKk/G9mt3LZRg=;
  b=hxGGh/3CQUbaH+zmwj6hkRqnSQjvHsMMM48Jc2AWcjkq0QSqyjKtvvJ6
   vKRuk4nON+IuNqSCGkE/FQruOOg9zPHNOK1DrSxbFcEoyKvdH414kAFhB
   qHSyTNWrQSf+9Ig4SzBgk0Z0kv7Mn5b//b58iuczegxcnZRsumDnWy5g1
   Qq/mr2Uq+rV/VuRGjg6LwTQ5EQ6mMUuY4dxw010LJ2ev69J+Os5uqzeYM
   DIqlIYYY5LP31C4DK49cIfv67SAepckoDceO2MMCMTmzK2UQadteOhX7U
   TdbX0kfqc2wACMpo4ljAfCTfTBAXyU5jSXeRcA9XrU4i/WS8sjFqvDGK1
   A==;
X-CSE-ConnectionGUID: 3no2b0e+QuSiUt3iWCAoGA==
X-CSE-MsgGUID: qbae+hztRTeG3YMc8uut/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40081293"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="40081293"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 04:04:48 -0800
X-CSE-ConnectionGUID: kR/KRLXITESOX5ZmQ2HLXw==
X-CSE-MsgGUID: lzy1oEUZT2uwsB8DV3SmAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102320508"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2025 04:04:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUlqd-000CZ5-1K;
	Mon, 06 Jan 2025 12:04:43 +0000
Date: Mon, 6 Jan 2025 20:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Chukun Pan <amadeus@jmu.edu.cn>, Vinod Koul <vkoul@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/1] phy: rockchip: naneng-combphy: compatible with old
 DT for RK3568
Message-ID: <202501061921.ToV59CNC-lkp@intel.com>
References: <20250106070000.605284-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106070000.605284-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_040449_254711_BEE5C32F 
X-CRM114-Status: GOOD (  14.77  )
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

Hi Chukun,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc6 next-20250106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chukun-Pan/phy-rockchip-naneng-combphy-compatible-with-old-DT-for-RK3568/20250106-150311
base:   linus/master
patch link:    https://lore.kernel.org/r/20250106070000.605284-1-amadeus%40jmu.edu.cn
patch subject: [PATCH 1/1] phy: rockchip: naneng-combphy: compatible with old DT for RK3568
config: arm64-randconfig-004-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061921.ToV59CNC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061921.ToV59CNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061921.ToV59CNC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/phy/rockchip/phy-rockchip-naneng-combphy.c:12:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/rockchip/phy-rockchip-naneng-combphy.c:314:21: error: incompatible pointer to integer conversion passing 'struct reset_control *' to parameter of type 'long' [-Wint-conversion]
     314 |         if (IS_ERR(ERR_PTR(priv->phy_rst)))
         |                            ^~~~~~~~~~~~~
   include/linux/err.h:39:48: note: passing argument to parameter 'error' here
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                                ^
   3 warnings and 1 error generated.


vim +314 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c

   274	
   275	static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy_priv *priv)
   276	{
   277		int i;
   278	
   279		priv->num_clks = devm_clk_bulk_get_all(dev, &priv->clks);
   280		if (priv->num_clks < 1)
   281			return -EINVAL;
   282	
   283		priv->refclk = NULL;
   284		for (i = 0; i < priv->num_clks; i++) {
   285			if (!strncmp(priv->clks[i].id, "ref", 3)) {
   286				priv->refclk = priv->clks[i].clk;
   287				break;
   288			}
   289		}
   290	
   291		if (!priv->refclk) {
   292			dev_err(dev, "no refclk found\n");
   293			return -EINVAL;
   294		}
   295	
   296		priv->pipe_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,pipe-grf");
   297		if (IS_ERR(priv->pipe_grf)) {
   298			dev_err(dev, "failed to find peri_ctrl pipe-grf regmap\n");
   299			return PTR_ERR(priv->pipe_grf);
   300		}
   301	
   302		priv->phy_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,pipe-phy-grf");
   303		if (IS_ERR(priv->phy_grf)) {
   304			dev_err(dev, "failed to find peri_ctrl pipe-phy-grf regmap\n");
   305			return PTR_ERR(priv->phy_grf);
   306		}
   307	
   308		priv->enable_ssc = device_property_present(dev, "rockchip,enable-ssc");
   309	
   310		priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
   311	
   312		priv->phy_rst = devm_reset_control_get(dev, "phy");
   313		/* fallback to old behaviour */
 > 314		if (IS_ERR(ERR_PTR(priv->phy_rst)))
   315			priv->phy_rst = devm_reset_control_array_get_exclusive(dev);
   316	
   317		if (IS_ERR(priv->phy_rst))
   318			return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
   319	
   320		return 0;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

