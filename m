Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B65C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4ulAaKD9xbXjQ60ZJ9CwtgqdPUp6buVGge0086/J+Q=; b=M5geNrWgkDY4Va7RljElTyrnD0
	VG4h9pZ/EwFGYOQa17b309y9/fHJqhqLxqmsnSEFdLtqug+XX9ajrUVb5KPYSgs4RZSO+4y6xeH9y
	5suUJWy5U4hhD0HSgHfUxt/yWSfle5YxaiSpz5PDh47Shu86U7cJLxGLpE7ivTo7JheRKbMNegx3X
	nPyLMwjwaM69QOQ4g7okQK+Fvo0tib0m3mTNr0/qQI40/ymEMt57DWXBWKi0jPh835OLCzVE7ffJv
	9CCi/HW34RGPj9N2wlg1E+1SYud2EzS7sPnhZWaLtKmyHrdOqiGS7r+pGpF839C7z3MaFm/9bxQmR
	/bJ80eBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrV5-00000001aZd-0pXP;
	Sat, 07 Jun 2025 11:14:11 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrJ7-00000001ZTX-3B9p
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749294110; x=1780830110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oXRpziViexH8/fIeHAWT0i0ImnFtdOkJs/7hpOj+v+k=;
  b=A4lqOjD4W9J42pe8DxTmtJGkBADglxD5q9tgKfs+2MDJMjbEgn8AU24H
   PE9rhBYSwjej8jjBlrzw/Kjn+upU+XFap8UEARmFP1OKFCFnlmZWh11j2
   KOWMOZuoRxMBoUJWn0v+5SLYpksBhOyWX9TfQux0gDXw5YXlVAlJECCQe
   EnS9yWrs3+iso2UYo0fr+2egUDdcur9Q8p3xvyC9q5jXSToiGiqWfeW/2
   47tC4id00PyIeriYSX8GORrqAjViCsyqOE+HwSGna0Nq64FrziE8RbAt3
   w2NbyjX7nfnIVnH04TzGqb+Fl7e4vxwsU0HgbVgeeQ3i7s6O4lMquzrOf
   w==;
X-CSE-ConnectionGUID: SjvmGVHjQMOhbeVjIAvi/Q==
X-CSE-MsgGUID: dKaRHKFSS8CkM3Zo24IOjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="54062167"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="54062167"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 04:01:45 -0700
X-CSE-ConnectionGUID: GadTKGbxQgOwAieMHe6U0A==
X-CSE-MsgGUID: 9PPzAVzYRGWL7j+VBDs/7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="176950060"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2025 04:01:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNrIw-0005k1-1j;
	Sat, 07 Jun 2025 11:01:38 +0000
Date: Sat, 7 Jun 2025 19:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	quic_schintav@quicinc.com, shradha.t@samsung.com, cassel@kernel.org,
	thippeswamy.havalige@amd.com
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/9] PCI: stm32: Add PCIe Endpoint support for
 STM32MP25
Message-ID: <202506071838.C54p5js2-lkp@intel.com>
References: <20250606120403.2964857-5-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606120403.2964857-5-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040149_814362_CD67F3C2 
X-CRM114-Status: GOOD (  12.81  )
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

[auto build test WARNING on 911483b25612c8bc32a706ba940738cc43299496]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/dt-bindings-PCI-Add-STM32MP25-PCIe-Root-Complex-bindings/20250606-201204
base:   911483b25612c8bc32a706ba940738cc43299496
patch link:    https://lore.kernel.org/r/20250606120403.2964857-5-christian.bruel%40foss.st.com
patch subject: [PATCH v11 4/9] PCI: stm32: Add PCIe Endpoint support for STM32MP25
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250607/202506071838.C54p5js2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071838.C54p5js2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071838.C54p5js2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-stm32-ep.c: In function 'stm32_pcie_probe':
>> drivers/pci/controller/dwc/pcie-stm32-ep.c:339:79: warning: format '%d' expects a matching 'int' argument [-Wformat=]
     339 |                 return dev_err_probe(dev, ret, "Failed to request PERST IRQ: %d\n");
         |                                                                              ~^
         |                                                                               |
         |                                                                               int


vim +339 drivers/pci/controller/dwc/pcie-stm32-ep.c

   275	
   276	static int stm32_pcie_probe(struct platform_device *pdev)
   277	{
   278		struct stm32_pcie *stm32_pcie;
   279		struct device *dev = &pdev->dev;
   280		int ret;
   281	
   282		stm32_pcie = devm_kzalloc(dev, sizeof(*stm32_pcie), GFP_KERNEL);
   283		if (!stm32_pcie)
   284			return -ENOMEM;
   285	
   286		stm32_pcie->pci.dev = dev;
   287		stm32_pcie->pci.ops = &dw_pcie_ops;
   288	
   289		stm32_pcie->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
   290		if (IS_ERR(stm32_pcie->regmap))
   291			return dev_err_probe(dev, PTR_ERR(stm32_pcie->regmap),
   292					     "No syscfg specified\n");
   293	
   294		stm32_pcie->phy = devm_phy_get(dev, NULL);
   295		if (IS_ERR(stm32_pcie->phy))
   296			return dev_err_probe(dev, PTR_ERR(stm32_pcie->phy),
   297					     "failed to get pcie-phy\n");
   298	
   299		stm32_pcie->clk = devm_clk_get(dev, NULL);
   300		if (IS_ERR(stm32_pcie->clk))
   301			return dev_err_probe(dev, PTR_ERR(stm32_pcie->clk),
   302					     "Failed to get PCIe clock source\n");
   303	
   304		stm32_pcie->rst = devm_reset_control_get_exclusive(dev, NULL);
   305		if (IS_ERR(stm32_pcie->rst))
   306			return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
   307					     "Failed to get PCIe reset\n");
   308	
   309		stm32_pcie->perst_gpio = devm_gpiod_get(dev, "reset", GPIOD_IN);
   310		if (IS_ERR(stm32_pcie->perst_gpio))
   311			return dev_err_probe(dev, PTR_ERR(stm32_pcie->perst_gpio),
   312					     "Failed to get reset GPIO\n");
   313	
   314		ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
   315		if (ret)
   316			return ret;
   317	
   318		platform_set_drvdata(pdev, stm32_pcie);
   319	
   320		pm_runtime_get_noresume(dev);
   321	
   322		ret = devm_pm_runtime_enable(dev);
   323		if (ret < 0) {
   324			pm_runtime_put_noidle(&pdev->dev);
   325			return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
   326		}
   327	
   328		stm32_pcie->perst_irq = gpiod_to_irq(stm32_pcie->perst_gpio);
   329	
   330		/* Will be enabled in start_link when device is initialized. */
   331		irq_set_status_flags(stm32_pcie->perst_irq, IRQ_NOAUTOEN);
   332	
   333		ret = devm_request_threaded_irq(dev, stm32_pcie->perst_irq, NULL,
   334						stm32_pcie_ep_perst_irq_thread,
   335						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
   336						"perst_irq", stm32_pcie);
   337		if (ret) {
   338			pm_runtime_put_noidle(&pdev->dev);
 > 339			return dev_err_probe(dev, ret, "Failed to request PERST IRQ: %d\n");
   340		}
   341	
   342		ret = stm32_add_pcie_ep(stm32_pcie, pdev);
   343		if (ret)
   344			pm_runtime_put_noidle(&pdev->dev);
   345	
   346		return ret;
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

