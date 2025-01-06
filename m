Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005CDE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 21:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opS3vibTnLli0endV0DEJk8g10qyZfILYO/Wajj227c=; b=ABDRHdxVbTL9pRpEqq6l6zEcqu
	1FiIejq8Tm9o8VM23tg8+8+6zrbEiPtbSaGrJgKV0mY5xxeSG10Q1KAiSMmIuRkr2DKThG092lDJx
	329YA6Xs0Jkz90Y5mS3yhIsozsvP5QklXosIRuK0zfWLcJ5xYXsJUXHDk6SRr+frpBgIdccAjYQcu
	Vj0rRelK+7z1EZpKlpiGUR5frJBl3ItzPu/TCdz7EgD3rEMYd6ZNXfDvAxq+33gz1OeoiOOZx3qps
	Y/LG1dlqkYMQECP8lliq/TyQ7neNBmWRr1ZSZKYhi6gEFAk4Wqlo2ttDl5eIywlv+xzHyvIeQbGBC
	q3GzS+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuor-00000002l5U-3AQz;
	Mon, 06 Jan 2025 21:39:29 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUund-00000002kxy-2AvE;
	Mon, 06 Jan 2025 21:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736199493; x=1767735493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HvONposlKuJw4Y+dSo+jkkd/aq1cJfkDp0GXQPM1m7g=;
  b=c8W/l5OvXlUBRgeKoaJUs7IErUePU5giZiuzSySJqMtKS/loh7xuurKH
   2Ao9xFK7EB9iLfm+xZdrIUpsGhKtHFw4GFAbON3MuodV/L3FDnCOQpzMg
   IFdlyC4hpRVEGvAnQpVSnpuPkZkPI6KO0eMdGUfUIOuZ3WjFGwXz03msS
   oGxdzYVwD1gW2/MfRtG6wWKMuF2SY21kT3IyAh3sEC1PP7tQF7OCLqhl6
   jTliJkzX82w9LrwuhEqAtFx1Rv1TYSMGywnpD05jUg8xTkJ7Dpq0R3OLI
   1zyvH2lDGdfL0r64sDtRDnpCcXy/9/3xumFN4v1XMlbNmx7vvsL/bVNPq
   w==;
X-CSE-ConnectionGUID: 0bQPJu+lRIeZz/qTxU40GQ==
X-CSE-MsgGUID: HX/cV7DCS62OSTARvlF6lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="53780328"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="53780328"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 13:38:11 -0800
X-CSE-ConnectionGUID: QPWSosUcR8GXShDSJc/YYQ==
X-CSE-MsgGUID: fPwO4tSLSAarkRVBMlbf0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="103079957"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jan 2025 13:38:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUunW-000Dwh-1W;
	Mon, 06 Jan 2025 21:38:06 +0000
Date: Tue, 7 Jan 2025 05:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Chukun Pan <amadeus@jmu.edu.cn>, Vinod Koul <vkoul@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/1] phy: rockchip: naneng-combphy: compatible with old
 DT for RK3568
Message-ID: <202501070458.qKEuL2HH-lkp@intel.com>
References: <20250106070000.605284-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106070000.605284-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_133813_608837_571D32F4 
X-CRM114-Status: GOOD (  14.89  )
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250107/202501070458.qKEuL2HH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070458.qKEuL2HH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070458.qKEuL2HH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/rockchip/phy-rockchip-naneng-combphy.c: In function 'rockchip_combphy_parse_dt':
>> drivers/phy/rockchip/phy-rockchip-naneng-combphy.c:314:32: error: passing argument 1 of 'ERR_PTR' makes integer from pointer without a cast [-Wint-conversion]
     314 |         if (IS_ERR(ERR_PTR(priv->phy_rst)))
         |                            ~~~~^~~~~~~~~
         |                                |
         |                                struct reset_control *
   In file included from include/linux/clk.h:12,
                    from drivers/phy/rockchip/phy-rockchip-naneng-combphy.c:9:
   include/linux/err.h:39:48: note: expected 'long int' but argument is of type 'struct reset_control *'
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                           ~~~~~^~~~~


vim +/ERR_PTR +314 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c

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

