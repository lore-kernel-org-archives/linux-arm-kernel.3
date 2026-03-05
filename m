Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBF1EEF319
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whU3kcL+g5eBye4BCtYB3BZcfDonNFXgMU3MAVBNrH0=; b=J/ShyiQkMjE7TVf8xS7JaCKn18
	pRJu5ck8knzqgDoKPVrEoS9niye/IFh3psVmdeTCnYS6rKIphn3E2DO08oGMRaEsevy5sjvaX+/4t
	ND86wYi4Mr0AIL6EUfm2GmXPXzwdRAcumokyPt21JnE+i/J+LrTAc//hvQz32c7ENCWYoZl5YsPzx
	I5hKalKqIYQyzzlpe80gbmz2DxytNpFT2mxct7m/oQbpMSkqRDTiaZL76SPUffMjvUTebg6lXV4Xl
	XqyYa06bVnsa+tHLQWVv4btmBv+oiRk8pPDGQAklR0AdMUzX52c5IRa5QiVr9uWzaPO+U4Wm3L0El
	FOuI/Pmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4s5-00000001MA7-2kij;
	Thu, 05 Mar 2026 09:19:55 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4s0-00000001M6n-2nSf;
	Thu, 05 Mar 2026 09:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772702389; x=1804238389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yVVOJTE/zUJqhnidUw+HOA7ZyLMPee+UqnKATnAGtjc=;
  b=NBBg+DDhsHAMX70v9JiwFGyan1QfYmi2tmQNVTJQR8KSA8sd6I8Sk3RG
   2dYaSqDhT6SKsM4/M9e+wg+LOS0gvzNKV3Lli3mfHn+0uRiLG2AZvnovP
   YzDRm7rqNGkOh2hTmJ/q6+OnTSgFl4iVQSaUb1AMecvNCPUJ0TzhsQJ8W
   xrWOaEmxldtSUWzw0a7rTRZv51uXBS27PMgy65vhYdOLWV/+1WRjoCAJh
   5Qzo8TNNWO2sMXbie5T78IA/xLE76qqs3m5v+i91MKWjPbCzoXHYYUz67
   7pS3/jV3dfQnKfc2eovKyIEnRLAoeb/A44W1Uz7PgEr/4q+1UzxCmnr5y
   g==;
X-CSE-ConnectionGUID: /sAJvzXfSsaym/XYsaYa0w==
X-CSE-MsgGUID: WoXQIYWnSMOkbTJr1V5GHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91172598"
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; 
   d="scan'208";a="91172598"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 01:19:46 -0800
X-CSE-ConnectionGUID: 3dYZ3uZqRW2W1VQJXXPtuQ==
X-CSE-MsgGUID: oj9nWylPSQyWZXvbMNo52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; 
   d="scan'208";a="245123518"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Mar 2026 01:19:43 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy4rs-000000000Ow-1L25;
	Thu, 05 Mar 2026 09:19:40 +0000
Date: Thu, 5 Mar 2026 17:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 4/4] phy: airoha: Add support for Airoha AN7581 USB PHY
Message-ID: <202603051725.x2cR2ynI-lkp@intel.com>
References: <20260304005843.2680-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304005843.2680-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_011949_982495_CAC95125 
X-CRM114-Status: GOOD (  13.47  )
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

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260303]
[cannot apply to robh/for-next linus/master v7.0-rc2 v7.0-rc1 v6.19 v7.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-soc-Add-bindings-for-Airoha-SCU-Serdes-lines/20260304-090107
base:   next-20260303
patch link:    https://lore.kernel.org/r/20260304005843.2680-5-ansuelsmth%40gmail.com
patch subject: [PATCH v5 4/4] phy: airoha: Add support for Airoha AN7581 USB PHY
config: powerpc64-randconfig-r131-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051725.x2cR2ynI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051725.x2cR2ynI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051725.x2cR2ynI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/airoha/phy-an7581-usb.c:569:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/phy/airoha/phy-an7581-usb.c:569:14: sparse:     expected void *base
   drivers/phy/airoha/phy-an7581-usb.c:569:14: sparse:     got void [noderef] __iomem *
>> drivers/phy/airoha/phy-an7581-usb.c:573:24: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *regs @@     got void *base @@
   drivers/phy/airoha/phy-an7581-usb.c:573:24: sparse:     expected void [noderef] __iomem *regs
   drivers/phy/airoha/phy-an7581-usb.c:573:24: sparse:     got void *base

vim +569 drivers/phy/airoha/phy-an7581-usb.c

   545	
   546	static int an7581_usb_phy_probe(struct platform_device *pdev)
   547	{
   548		struct phy_provider *phy_provider;
   549		struct an7581_usb_phy_priv *priv;
   550		struct device *dev = &pdev->dev;
   551		unsigned int index;
   552		void *base;
   553		int ret;
   554	
   555		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   556		if (!priv)
   557			return -ENOMEM;
   558	
   559		priv->dev = dev;
   560	
   561		ret = of_property_read_u32(dev->of_node, "airoha,usb2-monitor-clk-sel",
   562					   &priv->monclk_sel);
   563		if (ret)
   564			return dev_err_probe(dev, ret, "Monitor clock selection is mandatory for USB PHY calibration\n");
   565	
   566		if (priv->monclk_sel > 3)
   567			return dev_err_probe(dev, -EINVAL, "only 4 Monitor clock are selectable on the SoC\n");
   568	
 > 569		base = devm_platform_ioremap_resource(pdev, 0);
   570		if (IS_ERR(base))
   571			return PTR_ERR(base);
   572	
 > 573		priv->regmap = devm_regmap_init_mmio(dev, base, &an7581_usb_phy_regmap_config);
   574		if (IS_ERR(priv->regmap))
   575			return PTR_ERR(priv->regmap);
   576	
   577		platform_set_drvdata(pdev, priv);
   578	
   579		for (index = 0; index < AIROHA_PHY_USB_MAX; index++) {
   580			enum an7581_usb_phy_instance_type phy_type;
   581			struct an7581_usb_phy_instance *instance;
   582	
   583			switch (index) {
   584			case AIROHA_PHY_USB2:
   585				phy_type = PHY_TYPE_USB2;
   586				break;
   587			case AIROHA_PHY_USB3:
   588				phy_type = PHY_TYPE_USB3;
   589				break;
   590			}
   591	
   592			if (phy_type == PHY_TYPE_USB3) {
   593				ret = of_property_read_u32(dev->of_node, "airoha,usb3-serdes",
   594							   &priv->serdes_port);
   595				if (ret)
   596					return dev_err_probe(dev, ret, "missing serdes line for USB 3.0\n");
   597	
   598				priv->scu = syscon_regmap_lookup_by_compatible("airoha,en7581-scu");
   599				if (IS_ERR(priv->scu))
   600					return dev_err_probe(dev, PTR_ERR(priv->scu), "failed to get SCU syscon\n");
   601			}
   602	
   603			instance = devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
   604			if (!instance)
   605				return -ENOMEM;
   606	
   607			instance->type = phy_type;
   608			priv->phys[index] = instance;
   609	
   610			instance->phy = devm_phy_create(dev, NULL, &airoha_phy);
   611			if (IS_ERR(instance->phy))
   612				return dev_err_probe(dev, PTR_ERR(instance->phy), "failed to create phy\n");
   613	
   614			phy_set_drvdata(instance->phy, instance);
   615		}
   616	
   617		phy_provider = devm_of_phy_provider_register(&pdev->dev, an7581_usb_phy_xlate);
   618	
   619		return PTR_ERR_OR_ZERO(phy_provider);
   620	}
   621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

