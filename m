Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676D0C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cT/90xZaViu9n21Bl3syCt1wWI2oqW2FHfa0uBqaKIY=; b=mH5FS4PTEPDSURO9/xw/kMXtf9
	d/dH+O4PxKG+LI+mTaY5kPUhSJhpFYOTyVR3cbJWVA3wv9ClSd5CUMtr8WRAtk9F+ddjex40zfxRC
	dEiugxfKpegUs40IEIwlrevxNLReMwNvNOiVgCdKkubgyAKEIG3Ypg4dALpimUNlSmqqC9xaxDDBL
	GjGXi2u+wLG6Vzn4+aoZpuJIj7eOHjpiiyIHvgKWXK5qXgiC6LXsWZkai7lP1m5gXIAol1yYwun29
	TLPlV3gSHAqEKbLPANoSpMF11PBjkeT9IWrjOrsLWO8/CyMZYWQCQPvw5m9SGrtHhmq89Uk/5qBHE
	zpFYCGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFa6-0000000BnDq-2XkN;
	Thu, 06 Mar 2025 18:04:26 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFXp-0000000BmbP-0gJt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 18:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741284126; x=1772820126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aS4+MiTQzEhxzLiPX4aqCukgIbUCu3ZfrqEOUCUr7XI=;
  b=HN+x65T4dZ3b+TAVGVTOYGHoHnuNLmJyzpnOiXWE+ggzIrukvoJf5GoZ
   TWZH8JiWgnMzJyUVolx6iqyBmtWbMnVV7oGf+vOUaiBp8Z+1USgdz/4tj
   VICM3ByDk2p4W+6eJsBhiQEC61Zt3vGdWV7S+2veTe9bhHGaZRWwpjhOd
   Yl0ZlzTztK6Q7+g/Lh+o73dCjDZAFsvQGNmX6cut52dG6dSmZGGapWv44
   nQAZ3mU2r/MR/JbaPQRqHZWU63IoGObplYZgGQYV1rtrmZt83Kse8sFRd
   sEBtzGcnvtAqQ1aLPSF64dCstR4p7/3huC4FyBKR1MXDZPQr18z7RwhmR
   g==;
X-CSE-ConnectionGUID: 9XXHjbHyTuS234Md0GO3uQ==
X-CSE-MsgGUID: GRvHEzOhQUuevwCGFKKbpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42447278"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42447278"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 10:01:54 -0800
X-CSE-ConnectionGUID: gNpnIM6CT4yTMEC2oo0i5w==
X-CSE-MsgGUID: 7bbIzenPRDe7V8jlIyKzsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="119280835"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 10:01:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqFXY-000NQI-0V;
	Thu, 06 Mar 2025 18:01:48 +0000
Date: Fri, 7 Mar 2025 02:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 3/3] clk: aspeed: add AST2700 clock driver
Message-ID: <202503070117.mMjnpop8-lkp@intel.com>
References: <20250224095506.2047064-4-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224095506.2047064-4-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_100205_243909_350FDA02 
X-CRM114-Status: GOOD (  14.05  )
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

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-binding-clock-ast2700-modify-soc0-1-clock-define/20250224-175830
base:   linus/master
patch link:    https://lore.kernel.org/r/20250224095506.2047064-4-ryan_chen%40aspeedtech.com
patch subject: [PATCH v9 3/3] clk: aspeed: add AST2700 clock driver
config: powerpc64-randconfig-r121-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070117.mMjnpop8-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250307/202503070117.mMjnpop8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070117.mMjnpop8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/clk-ast2700.c:1066:92: sparse: sparse: Using plain integer as NULL pointer

vim +1066 drivers/clk/clk-ast2700.c

   952	
   953	static int ast2700_soc_clk_probe(struct platform_device *pdev)
   954	{
   955		const struct ast2700_clk_data *clk_data;
   956		struct ast2700_clk_ctrl *clk_ctrl;
   957		struct clk_hw_onecell_data *clk_hw_data;
   958		struct device *dev = &pdev->dev;
   959		void __iomem *clk_base;
   960		struct clk_hw **hws;
   961		char *reset_name;
   962		int ret;
   963		int i;
   964	
   965		clk_ctrl = devm_kzalloc(dev, sizeof(*clk_ctrl), GFP_KERNEL);
   966		if (!clk_ctrl)
   967			return -ENOMEM;
   968		clk_ctrl->dev = dev;
   969		dev_set_drvdata(&pdev->dev, clk_ctrl);
   970	
   971		spin_lock_init(&clk_ctrl->lock);
   972	
   973		clk_base = devm_platform_ioremap_resource(pdev, 0);
   974		if (IS_ERR(clk_base))
   975			return PTR_ERR(clk_base);
   976	
   977		clk_ctrl->base = clk_base;
   978	
   979		clk_data = device_get_match_data(dev);
   980		if (!clk_data)
   981			return -ENODEV;
   982	
   983		clk_ctrl->clk_data = clk_data;
   984		reset_name = devm_kasprintf(dev, GFP_KERNEL, "reset%d", clk_data->scu);
   985	
   986		clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, clk_data->nr_clks),
   987					   GFP_KERNEL);
   988		if (!clk_hw_data)
   989			return -ENOMEM;
   990	
   991		clk_hw_data->num = clk_data->nr_clks;
   992		hws = clk_hw_data->hws;
   993	
   994		if (clk_data->scu)
   995			ast2700_soc1_configure_i3c_clk(clk_ctrl);
   996	
   997		for (i = 0; i < clk_data->nr_clks; i++) {
   998			const struct ast2700_clk_info *clk = &clk_data->clk_info[i];
   999			void __iomem *reg;
  1000	
  1001			if (clk->type == CLK_FIXED) {
  1002				const struct ast2700_clk_fixed_rate_data *fixed_rate = &clk->data.rate;
  1003	
  1004				hws[i] = devm_clk_hw_register_fixed_rate(dev, clk->name, NULL, 0,
  1005									 fixed_rate->fixed_rate);
  1006			} else if (clk->type == CLK_FIXED_FACTOR) {
  1007				const struct ast2700_clk_fixed_factor_data *factor = &clk->data.factor;
  1008	
  1009				hws[i] = devm_clk_hw_register_fixed_factor(dev, clk->name,
  1010									   factor->parent->name,
  1011									   0, factor->mult, factor->div);
  1012			} else if (clk->type == DCLK_FIXED) {
  1013				const struct ast2700_clk_pll_data *pll = &clk->data.pll;
  1014	
  1015				reg = clk_ctrl->base + pll->reg;
  1016				hws[i] = ast2700_clk_hw_register_dclk(reg, clk->name, clk_ctrl);
  1017			} else if (clk->type == CLK_HPLL) {
  1018				const struct ast2700_clk_pll_data *pll = &clk->data.pll;
  1019	
  1020				reg = clk_ctrl->base + pll->reg;
  1021				hws[i] = ast2700_clk_hw_register_hpll(reg, clk->name,
  1022								      pll->parent->name, clk_ctrl);
  1023			} else if (clk->type == CLK_PLL) {
  1024				const struct ast2700_clk_pll_data *pll = &clk->data.pll;
  1025	
  1026				reg = clk_ctrl->base + pll->reg;
  1027				hws[i] = ast2700_clk_hw_register_pll(i, reg, clk->name,
  1028								     pll->parent->name, clk_ctrl);
  1029			} else if (clk->type == CLK_UART_PLL) {
  1030				const struct ast2700_clk_pll_data *pll = &clk->data.pll;
  1031	
  1032				reg = clk_ctrl->base + pll->reg;
  1033				hws[i] = ast2700_clk_hw_register_uartpll(reg, clk->name,
  1034									 pll->parent->name, clk_ctrl);
  1035			} else if (clk->type == CLK_MUX) {
  1036				const struct ast2700_clk_mux_data *mux = &clk->data.mux;
  1037	
  1038				reg = clk_ctrl->base + mux->reg;
  1039				hws[i] = devm_clk_hw_register_mux_parent_data_table(dev, clk->name,
  1040										    mux->parents,
  1041										    mux->num_parents, 0,
  1042										    reg, mux->bit_shift,
  1043										    mux->bit_width, 0,
  1044										    NULL, &clk_ctrl->lock);
  1045			} else if (clk->type == CLK_MISC) {
  1046				const struct ast2700_clk_pll_data *misc = &clk->data.pll;
  1047	
  1048				reg = clk_ctrl->base + misc->reg;
  1049				hws[i] = ast2700_clk_hw_register_misc(i, reg, clk->name,
  1050								      misc->parent->name, clk_ctrl);
  1051			} else if (clk->type == CLK_DIVIDER) {
  1052				const struct ast2700_clk_div_data *div = &clk->data.div;
  1053	
  1054				reg = clk_ctrl->base + div->reg;
  1055				hws[i] = devm_clk_hw_register_divider_table(dev, clk->name,
  1056									    div->parent->name, 0,
  1057									    reg, div->bit_shift,
  1058									    div->bit_width, 0,
  1059									    div->div_table,
  1060									    &clk_ctrl->lock);
  1061			} else if (clk->type == CLK_GATE_ASPEED) {
  1062				const struct ast2700_clk_gate_data *gate = &clk->data.gate;
  1063	
  1064				reg = clk_ctrl->base + gate->reg;
  1065				hws[i] = ast2700_clk_hw_register_gate(dev, clk->name, gate->parent,
> 1066								      reg, gate->bit, gate->flags, 0);
  1067	
  1068			} else {
  1069				const struct ast2700_clk_gate_data *gate = &clk->data.gate;
  1070	
  1071				reg = clk_ctrl->base + gate->reg;
  1072				hws[i] = devm_clk_hw_register_gate_parent_data(dev, clk->name, gate->parent,
  1073									       0, reg, clk->clk_idx, 0,
  1074									       &clk_ctrl->lock);
  1075			}
  1076	
  1077			if (IS_ERR(hws[i]))
  1078				return PTR_ERR(hws[i]);
  1079		}
  1080	
  1081		ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
  1082		if (ret)
  1083			return ret;
  1084	
  1085		return aspeed_reset_controller_register(dev, clk_base, reset_name);
  1086	}
  1087	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

