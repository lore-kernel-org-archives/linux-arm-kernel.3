Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E3AC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5GlNMyx1pyFW3Owc7kbmSjKVFs1LVbvZVg1jr5Slc8=; b=JwdNTK8TH8raHA/thmeHqrD3oq
	WvdKbPXn3zt73fHQ2VWFJ3WbXfhNdsKVn5b1DGAaI15WhNhtm37PhFllubqFd482b/zZ3rl6YF+sK
	JS6x4gjdOMIyY6d2Ge+xBbzRke3alcC5p6mY2fAEe3Jrf+pE8R6BCTUjxC3MJjNjMSgvRyiIhwljM
	NUjwWQRfGTlyxr83DH8i9w+0QU02JFoj0MDdBMd6QzwNgSin2SoO6P2YCurIj0iXnOIm+Bcqoosk6
	eSeypvC97Ajc2n50rbr+3iJkUTjoT9jYtG4MK82D7vXjP8LLxQRd/6e0It1pO/75xutzIeDW43F/v
	JoI2j+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaeWL-0000000GsKo-1wIY;
	Sat, 12 Jul 2025 18:00:21 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaeTK-0000000Gs0F-1clu;
	Sat, 12 Jul 2025 17:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752343034; x=1783879034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZqFuhsGBU+wJcNeFRHN2M3/rUmGdy3TQzFSP8z9fkRE=;
  b=FjzB3cY5oUdxALBHmIpT14thrVhNgbN79sluV9EpD4rI9g0Z3hnpmeyU
   WbXHkfn2ASEGyi4xQ5hsCcakGBEWBstqVxmSRyEr4TRTY08hDQy3hV+cJ
   /oRBDT5OVO3QqNo+vN+kEw/HZi18ptcFki5eHEuq4DijgEh6ehROoYNGv
   IuPUjHe3l7+F8c9NQld9FHkNDVgn55i69G66kyCorvM+LhwIMevSJxvmx
   p21rDn9Y6F3oHl/zmylsG88XrN5GkfS6Frd6Tf+NA7EQgDFMls1PPDixU
   QC8VrIwzZWVhIWd6ZQ/QISJz64QLFjPkKIjQucRM8nbz6KOnzQi75UEpE
   Q==;
X-CSE-ConnectionGUID: J3VmcF1KSwSGnAP9kqLKdA==
X-CSE-MsgGUID: 4cI2W/LVTdipRZWD6KizjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54570796"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="54570796"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 10:57:10 -0700
X-CSE-ConnectionGUID: 9jkPxG5WSLiUICQXlrvIjA==
X-CSE-MsgGUID: dApIRtUfTKCNLasfM3x7ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="160938198"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jul 2025 10:57:07 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaeTB-0007ZR-0h;
	Sat, 12 Jul 2025 17:57:05 +0000
Date: Sun, 13 Jul 2025 01:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troy.mitchell@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH] ASoC: rockchip: i2s: simplify clock handling and error
 cleanup in probe
Message-ID: <202507130140.HxI37WQ3-lkp@intel.com>
References: <20250712-rockchip-i2s-simplify-clk-v1-1-3b23fd1b3e26@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712-rockchip-i2s-simplify-clk-v1-1-3b23fd1b3e26@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_105714_466003_A4A04D1C 
X-CRM114-Status: GOOD (  13.43  )
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

Hi Troy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 733923397fd95405a48f165c9b1fbc8c4b0a4681]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/ASoC-rockchip-i2s-simplify-clock-handling-and-error-cleanup-in-probe/20250712-215647
base:   733923397fd95405a48f165c9b1fbc8c4b0a4681
patch link:    https://lore.kernel.org/r/20250712-rockchip-i2s-simplify-clk-v1-1-3b23fd1b3e26%40linux.dev
patch subject: [PATCH] ASoC: rockchip: i2s: simplify clock handling and error cleanup in probe
config: x86_64-buildonly-randconfig-003-20250712 (https://download.01.org/0day-ci/archive/20250713/202507130140.HxI37WQ3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507130140.HxI37WQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507130140.HxI37WQ3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/rockchip/rockchip_i2s.c:776:36: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     776 |                 return dev_err_probe(&pdev->dev, ret, "Failed to initialise managed register map");
         |                                                  ^~~
   sound/soc/rockchip/rockchip_i2s.c:742:9: note: initialize the variable 'ret' to silence this warning
     742 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +776 sound/soc/rockchip/rockchip_i2s.c

   733	
   734	static int rockchip_i2s_probe(struct platform_device *pdev)
   735	{
   736		struct device_node *node = pdev->dev.of_node;
   737		struct rk_i2s_dev *i2s;
   738		struct snd_soc_dai_driver *dai;
   739		struct resource *res;
   740		void __iomem *regs;
   741		struct clk *clk;
   742		int ret;
   743	
   744		i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
   745		if (!i2s)
   746			return -ENOMEM;
   747	
   748		spin_lock_init(&i2s->lock);
   749		i2s->dev = &pdev->dev;
   750	
   751		i2s->grf = syscon_regmap_lookup_by_phandle(node, "rockchip,grf");
   752		if (!IS_ERR(i2s->grf)) {
   753			i2s->pins = device_get_match_data(&pdev->dev);
   754			if (!i2s->pins)
   755				return -EINVAL;
   756	
   757		}
   758	
   759		/* try to prepare related clocks */
   760		clk = devm_clk_get_enabled(&pdev->dev, "i2s_hclk");
   761		if (IS_ERR(clk))
   762			return dev_err_probe(&pdev->dev, PTR_ERR(clk), "hclock enable failed");
   763	
   764		i2s->mclk = devm_clk_get(&pdev->dev, "i2s_clk");
   765		if (IS_ERR(i2s->mclk))
   766			return dev_err_probe(&pdev->dev, PTR_ERR(i2s->mclk),
   767					     "Can't retrieve i2s master clock");
   768	
   769		regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
   770		if (IS_ERR(regs))
   771			dev_err_probe(&pdev->dev, PTR_ERR(regs), "Can't ioremap registers");
   772	
   773		i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
   774						    &rockchip_i2s_regmap_config);
   775		if (IS_ERR(i2s->regmap))
 > 776			return dev_err_probe(&pdev->dev, ret, "Failed to initialise managed register map");
   777	
   778		i2s->bclk_ratio = 64;
   779		i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
   780		if (!IS_ERR(i2s->pinctrl)) {
   781			i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl, "bclk_on");
   782			if (!IS_ERR_OR_NULL(i2s->bclk_on)) {
   783				i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl, "bclk_off");
   784				if (IS_ERR_OR_NULL(i2s->bclk_off))
   785					return dev_err_probe(&pdev->dev, -EINVAL,
   786							     "failed to find i2s bclk_off");
   787			}
   788		} else {
   789			dev_dbg(&pdev->dev, "failed to find i2s pinctrl\n");
   790		}
   791	
   792		i2s_pinctrl_select_bclk_off(i2s);
   793	
   794		dev_set_drvdata(&pdev->dev, i2s);
   795	
   796		pm_runtime_enable(&pdev->dev);
   797		if (!pm_runtime_enabled(&pdev->dev)) {
   798			ret = i2s_runtime_resume(&pdev->dev);
   799			if (ret)
   800				goto err_pm_disable;
   801		}
   802	
   803		ret = rockchip_i2s_init_dai(i2s, res, &dai);
   804		if (ret)
   805			goto err_pm_disable;
   806	
   807		ret = devm_snd_soc_register_component(&pdev->dev,
   808						      &rockchip_i2s_component,
   809						      dai, 1);
   810	
   811		if (ret) {
   812			dev_err(&pdev->dev, "Could not register DAI\n");
   813			goto err_suspend;
   814		}
   815	
   816		ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
   817		if (ret) {
   818			dev_err(&pdev->dev, "Could not register PCM\n");
   819			goto err_suspend;
   820		}
   821	
   822		return 0;
   823	
   824	err_suspend:
   825		if (!pm_runtime_status_suspended(&pdev->dev))
   826			i2s_runtime_suspend(&pdev->dev);
   827	err_pm_disable:
   828		pm_runtime_disable(&pdev->dev);
   829		return ret;
   830	}
   831	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

