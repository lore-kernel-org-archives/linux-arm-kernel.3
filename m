Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D2ACCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 09:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckBOcqZflt9JytbIBiIarEGG+Em3mLNlwZjX5I6sxgQ=; b=2EK90pLYwDQZb5Hs7cQC9zVirH
	3Bs/ze0ajzVJIQffPkor9EYFsHrVYSjNIZPf+3Jjz2xy/YtylyxRX/Wo8HX4hyfvyl2rpGHqQrL+d
	wukQvsyR0vLW+t0RqTfCsDu1+nO2GLkCu+SMo5bVLWN9hLWGR5D8c/v9+Df7zNFOZDafiQSi/7dQ8
	vQs/r2LpNn26/Ry9QgUGHnC0DXHbXK3bqEtParORX5RoKNzb5B8zORlrXGm04zRz1E3k1X2nu9vvr
	3B9nYZKlx/CaRz9L6UV20j9l9Vy2i8D+Kljltu4nLesQbK/okVOwDXCS+3DKAT6Qbk2A9yVpsD8mb
	wwIezgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAPTK-0000000ArI7-3HXg;
	Sun, 19 Oct 2025 09:13:02 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAPTI-0000000ArHH-0yft;
	Sun, 19 Oct 2025 09:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760865180; x=1792401180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bWGsBC58nVw/sxl2Hx9QNQsauG04QZleHom4h2dfg0U=;
  b=K+VHfG5GygPnAI9qAfutH+1cb3LFE9Uy+4T3mUtbab1iy5zkMLhUU4fX
   JqIvl7tHUooBUi2QSu3nnpzo4Mk6vJV2t7u6gmk4hDwK0z1M2blhlg2TG
   O8RMitea4LWFoIhX4Dyf1fewPNxDIWdOHcKfijKt0XNBv0cV4W8ZyhcXQ
   Ko4lVqfS7jPXhFRwEUXSZOoXVDJ73NmWKgf7LEOUAtw9hFqcda6tlBF1c
   qpjDVrkjCM2KxZcSfxNTDTEE4eeWO06YFoA6oS35H7aXd5Uz4LYnRgaSy
   Q8E1azytU1wXUQqTkiRHRGxPlPDYsfb8TapTYWUIgTLjmwoS61aenNE/3
   Q==;
X-CSE-ConnectionGUID: WFIxqWwfTKq7ILTSL8wE7w==
X-CSE-MsgGUID: WwLS8BJ0QzOBCZweTRp/eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66652784"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="66652784"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 22:32:00 -0700
X-CSE-ConnectionGUID: XocagptQREO66ibi0urNnA==
X-CSE-MsgGUID: FCeZMkrnTHOQr5UUKBE7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="220213467"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2025 22:31:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAM1F-0008s9-3C;
	Sun, 19 Oct 2025 05:31:51 +0000
Date: Sun, 19 Oct 2025 13:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
	sboyd@kernel.org, sugar.zhang@rock-chips.com, heiko@sntech.de,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com
Subject: Re: [PATCH v2 3/5] clk: rockchip: Add clock controller for the
 RV1126B
Message-ID: <202510191337.86OcUAWo-lkp@intel.com>
References: <20251017063107.1606965-4-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017063107.1606965-4-zhangqing@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_021300_337938_1B07CBC2 
X-CRM114-Status: GOOD (  13.50  )
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

Hi Elaine,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on clk/clk-next pza/reset/next linus/master v6.18-rc1 next-20251017]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elaine-Zhang/clk-rockchip-Implement-rockchip_clk_register_armclk_multi_pll/20251017-180259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20251017063107.1606965-4-zhangqing%40rock-chips.com
patch subject: [PATCH v2 3/5] clk: rockchip: Add clock controller for the RV1126B
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20251019/202510191337.86OcUAWo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191337.86OcUAWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510191337.86OcUAWo-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clk/rockchip/clk-rv1126b.o: in function `rv1126b_clk_init':
>> drivers/clk/rockchip/clk-rv1126b.c:1050:(.init.text+0xc8): undefined reference to `rk3576_rst_init'


vim +1050 drivers/clk/rockchip/clk-rv1126b.c

  1012	
  1013	static struct rockchip_clk_branch rv1126b_armclk __initdata =
  1014		MUX(ARMCLK, "armclk", mux_armclk_p, CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
  1015				RV1126B_CORECLKSEL_CON(0), 1, 1, MFLAGS);
  1016	
  1017	static void __init rv1126b_clk_init(struct device_node *np)
  1018	{
  1019		struct rockchip_clk_provider *ctx;
  1020		void __iomem *reg_base;
  1021		unsigned long clk_nr_clks;
  1022	
  1023		clk_nr_clks = rockchip_clk_find_max_clk_id(rv1126b_clk_branches,
  1024							   ARRAY_SIZE(rv1126b_clk_branches)) + 1;
  1025	
  1026		reg_base = of_iomap(np, 0);
  1027		if (!reg_base) {
  1028			pr_err("%s: could not map cru region\n", __func__);
  1029			return;
  1030		}
  1031	
  1032		ctx = rockchip_clk_init(np, reg_base, clk_nr_clks);
  1033		if (IS_ERR(ctx)) {
  1034			pr_err("%s: rockchip clk init failed\n", __func__);
  1035			iounmap(reg_base);
  1036			return;
  1037		}
  1038	
  1039		rockchip_clk_register_plls(ctx, rv1126b_pll_clks,
  1040					   ARRAY_SIZE(rv1126b_pll_clks),
  1041					   RV1126B_GRF_SOC_STATUS0);
  1042	
  1043		rockchip_clk_register_branches(ctx, rv1126b_clk_branches,
  1044					       ARRAY_SIZE(rv1126b_clk_branches));
  1045	
  1046		rockchip_clk_register_armclk_multi_pll(ctx, &rv1126b_armclk,
  1047						       rv1126b_cpuclk_rates,
  1048						       ARRAY_SIZE(rv1126b_cpuclk_rates));
  1049	
> 1050		rk3576_rst_init(np, reg_base);
  1051	
  1052		rockchip_register_restart_notifier(ctx, RV1126B_GLB_SRST_FST, NULL);
  1053	
  1054		rockchip_clk_of_add_provider(np, ctx);
  1055	
  1056		/* pvtpll src init */
  1057		writel_relaxed(PVTPLL_SRC_SEL_PVTPLL, reg_base + RV1126B_CORECLKSEL_CON(0));
  1058		writel_relaxed(PVTPLL_SRC_SEL_PVTPLL, reg_base + RV1126B_NPUCLKSEL_CON(0));
  1059		writel_relaxed(PVTPLL_SRC_SEL_PVTPLL, reg_base + RV1126B_VICLKSEL_CON(0));
  1060		writel_relaxed(PVTPLL_SRC_SEL_PVTPLL, reg_base + RV1126B_VEPUCLKSEL_CON(0));
  1061		writel_relaxed(PVTPLL_SRC_SEL_PVTPLL, reg_base + RV1126B_VCPCLKSEL_CON(0));
  1062	}
  1063	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

