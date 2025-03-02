Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8187C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 02:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjzBiCNHpKzLx/OUXbH0ktZVQuC6rXcPMXXCGxJ74MM=; b=mkSL/ub9iRf7JybAoCoPVFLeUF
	ZraTnxGx9ZqSEtoTBJa3FQBU6O0UOi4IoQXRqfXhIjjWwS4TgchqfVl5Q0sYKKqDXR8yuxYtgkePS
	1DvB7rEqcYd5PPpfGgiEEJCjZqQJiBaUWHizx5Kkwg1Om5AyBMAbK9YJ/hCq9O6Q+IpT1b+eV701v
	tsyO7t+A+3U9htjHsxI3wd+dWfMPP3mPiCg/N7YLW318idSxukEJtegDZcIS81+C1Un/x/LB2PC3u
	yCq51N4yZTq324FGjo1fy+pMoNSC4JttQ2WEPaaXbXSbBTOQPCXVOLUzmxh6o0JiJo59/uvwYqcWb
	TSTPGWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toYnH-0000000FFBg-0JZh;
	Sun, 02 Mar 2025 02:11:03 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toYlT-0000000FF5m-1Sld;
	Sun, 02 Mar 2025 02:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740881351; x=1772417351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N6bdO5ufvOU4UlMfcbW1V2iVFg9S7pViFB0B1Dp885U=;
  b=VMHsCjFy7kmnV01cLE/wFF2CHMKSZSeMjq67SAismO4CeI1Wn2M1xBv5
   M9QTR/rZELIutdv5PkwmqSBx6DltgjTlzfnoDr1+AodcOzjyP5tu+y2ZR
   Zq2/MT1E7zzbGOhMRV0jhsrFreBzdtxPhyOVffeONq/gZU3XiMuz9FYIq
   YqWPKMmaR7TFirag5pT/Jau8eCHY5nuDCTVTY+Rvyfbdaid12lggFXk0x
   0oY4ER1xA7vBKtm3TseVFpi9pc4zRr6vVNO6pxiXiTRcIekHJg9Bjoxww
   uMnPH54rQ4nfNF71MCEvCv6yCgkzyaNO8a0LHQqRK2Q3tmNsPTbvSGGmv
   w==;
X-CSE-ConnectionGUID: VTDzIbpkTyyda1EVMXjBUg==
X-CSE-MsgGUID: OiAGqq3eRsWlfuQV+VJZsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="44596028"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="44596028"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 18:09:04 -0800
X-CSE-ConnectionGUID: kJyzAyBiQCmiU86YmGf5mA==
X-CSE-MsgGUID: EX0HUutsR06iMNtitEBQkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="117696253"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Mar 2025 18:09:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toYlF-000GxG-1r;
	Sun, 02 Mar 2025 02:08:57 +0000
Date: Sun, 2 Mar 2025 10:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
Message-ID: <202503020920.Kw0H8Acs-lkp@intel.com>
References: <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_180911_434264_ABB31B75 
X-CRM114-Status: GOOD (  13.48  )
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

Hi Ivaylo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-phy-rename-qcom-snps-eusb2-phy-binding-to-snps-eusb2-phy/20250223-202709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250223122227.725233-6-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
config: microblaze-randconfig-r123-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020920.Kw0H8Acs-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250302/202503020920.Kw0H8Acs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020920.Kw0H8Acs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/phy-snps-eusb2.c:464:59: sparse: sparse: Using plain integer as NULL pointer

vim +464 drivers/phy/phy-snps-eusb2.c

   398	
   399	static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
   400	{
   401		struct device *dev = &pdev->dev;
   402		struct device_node *np = dev->of_node;
   403		struct snps_eusb2_hsphy *phy;
   404		struct phy_provider *phy_provider;
   405		struct phy *generic_phy;
   406		const struct snps_eusb2_phy_drvdata *drv_data;
   407		int ret, i;
   408		int num;
   409	
   410		phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
   411		if (!phy)
   412			return -ENOMEM;
   413	
   414		drv_data = of_device_get_match_data(dev);
   415		if (!drv_data)
   416			return -EINVAL;
   417		phy->data = drv_data;
   418	
   419		phy->base = devm_platform_ioremap_resource(pdev, 0);
   420		if (IS_ERR(phy->base))
   421			return PTR_ERR(phy->base);
   422	
   423		phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
   424		if (IS_ERR(phy->phy_reset))
   425			return PTR_ERR(phy->phy_reset);
   426	
   427		phy->clks = devm_kcalloc(dev,
   428					 phy->data->num_clks,
   429					 sizeof(*phy->clks),
   430					 GFP_KERNEL);
   431		if (!phy->clks)
   432			return -ENOMEM;
   433	
   434		for (int i = 0; i < phy->data->num_clks; ++i)
   435			phy->clks[i].id = phy->data->clk_names[i];
   436	
   437		ret = devm_clk_bulk_get(dev, phy->data->num_clks,
   438					phy->clks);
   439		if (ret)
   440			return dev_err_probe(dev, ret,
   441					     "failed to get phy clock(s)\n");
   442	
   443		phy->ref_clk = NULL;
   444		for (int i = 0; i < phy->data->num_clks; ++i) {
   445			if (!strcmp(phy->clks[i].id, "ref")) {
   446				phy->ref_clk = phy->clks[i].clk;
   447				break;
   448			}
   449		}
   450	
   451		if (IS_ERR_OR_NULL(phy->ref_clk))
   452			return dev_err_probe(dev, PTR_ERR(phy->ref_clk),
   453					     "failed to get ref clk\n");
   454	
   455		num = ARRAY_SIZE(phy->vregs);
   456		for (i = 0; i < num; i++)
   457			phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
   458	
   459		ret = devm_regulator_bulk_get(dev, num, phy->vregs);
   460		if (ret)
   461			return dev_err_probe(dev, ret,
   462					     "failed to get regulator supplies\n");
   463	
 > 464		phy->repeater = devm_of_phy_optional_get(dev, np, 0);
   465		if (IS_ERR(phy->repeater))
   466			return dev_err_probe(dev, PTR_ERR(phy->repeater),
   467					     "failed to get repeater\n");
   468	
   469		generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
   470		if (IS_ERR(generic_phy)) {
   471			dev_err(dev, "failed to create phy %d\n", ret);
   472			return PTR_ERR(generic_phy);
   473		}
   474	
   475		dev_set_drvdata(dev, phy);
   476		phy_set_drvdata(generic_phy, phy);
   477	
   478		phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
   479		if (IS_ERR(phy_provider))
   480			return PTR_ERR(phy_provider);
   481	
   482		dev_info(dev, "Registered Snps-eUSB2 phy\n");
   483	
   484		return 0;
   485	}
   486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

