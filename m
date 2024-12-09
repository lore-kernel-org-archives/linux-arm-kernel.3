Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A04EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 04:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hxp81+ngLZZbpPeucEU+8lXWJmWezbtCugpeS18xONU=; b=lEDsEsFptaYEtWHQUZ4DHbsLTP
	Sei3Pv+LlHDvfIV53973slZmt08t9xW70/8LtqymPmAOpTRqLpiI/vzYlYWW3auTKIQCr6+bHFndd
	e7bNZ2MB8aJNwgckwNWMNueeGKiIxtoTE3mLBWvvpYtoEV7q3EuEnPyXKLrj57u9296vBtl4xwXNe
	hO3TxsPVJiPcmuQvISbzgamkwgTUIinZHGv29S9StpmGFYivpJVwjFntfYI7nhqkaasIJnhqGIx2Z
	v8+WXxTq+leerwk3JRn9SbZmBUcS/Hw5EiSbMSPA57RLiIIWKUodESbJKNEupykW3HKDrdafHxH+X
	XvoXmSlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVVX-00000006QPU-3mmc;
	Mon, 09 Dec 2024 04:36:31 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVUV-00000006QCr-1xQ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 04:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718927; x=1765254927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/byX0QN7l6evzZM3VWd51MOOZPsopsId3NhdI4oXh+w=;
  b=fkhoqYdMyJdLs1+n3kSJUn1pGUmPgysJjutToC7cPJRatsYDKfZwvcE2
   DKD+oK66C3JUM9VnmIbXcL6KJHF2/dOZdpUxAE4wtq2/2Lk4ytxzAu2KB
   q3NcnN22dQOVHiDJNruXQAWE3BF8HHkGU1GLtt2XyiaCpXz9K8ApS7tzq
   xxLxBu5uRK15GdxyMKlFZBQvRhGvK+g58HdJnFdhf/YuS09kzGaXwoUIr
   x7CBJ92E5UuhQeZ/tonEbm5J4MR6cMTOdFFAHwvTebVJXdI80cPC3OIwi
   lb4KuFBKgYZSncuS2vJsljqyeI5207oqxBWubpNnbWWWz1eYn+66xVg9t
   w==;
X-CSE-ConnectionGUID: 1ebQAdRBT3yZv+CWFx8ETA==
X-CSE-MsgGUID: XxOQr/2RRAiJMXNVnTOOrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34237110"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34237110"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:35:27 -0800
X-CSE-ConnectionGUID: +CUXQ3szQaSyFv/p6es35w==
X-CSE-MsgGUID: /NYIfnVgRFyE8+IfO0CAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125844583"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2024 20:35:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVUO-0003sb-08;
	Mon, 09 Dec 2024 04:35:20 +0000
Date: Mon, 9 Dec 2024 12:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>, lpieralisi@kernel.org,
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de, cassel@kernel.org,
	quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH v2 2/5] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <202412080849.1SXhxzpi-lkp@intel.com>
References: <20241126155119.1574564-3-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126155119.1574564-3-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_203527_519514_CF2CFE52 
X-CRM114-Status: GOOD (  13.56  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.13-rc1 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/dt-bindings-PCI-Add-STM32MP25-PCIe-root-complex-bindings/20241128-101958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20241126155119.1574564-3-christian.bruel%40foss.st.com
patch subject: [PATCH v2 2/5] PCI: stm32: Add PCIe host support for STM32MP25
config: openrisc-randconfig-r072-20241208 (https://download.01.org/0day-ci/archive/20241208/202412080849.1SXhxzpi-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080849.1SXhxzpi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080849.1SXhxzpi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-stm32.c: In function 'stm32_pcie_suspend_noirq':
>> drivers/pci/controller/dwc/pcie-stm32.c:101:16: error: implicit declaration of function 'pinctrl_pm_select_sleep_state' [-Wimplicit-function-declaration]
     101 |         return pinctrl_pm_select_sleep_state(dev);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-stm32.c: In function 'stm32_pcie_resume_noirq':
>> drivers/pci/controller/dwc/pcie-stm32.c:114:24: error: 'struct device' has no member named 'pins'
     114 |         if (!IS_ERR(dev->pins->init_state))
         |                        ^~
>> drivers/pci/controller/dwc/pcie-stm32.c:115:23: error: implicit declaration of function 'pinctrl_select_state' [-Wimplicit-function-declaration]
     115 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-stm32.c:115:47: error: 'struct device' has no member named 'pins'
     115 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
         |                                               ^~
   drivers/pci/controller/dwc/pcie-stm32.c:115:61: error: 'struct device' has no member named 'pins'
     115 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
         |                                                             ^~
>> drivers/pci/controller/dwc/pcie-stm32.c:117:23: error: implicit declaration of function 'pinctrl_pm_select_default_state' [-Wimplicit-function-declaration]
     117 |                 ret = pinctrl_pm_select_default_state(dev);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-stm32.c: In function 'stm32_pcie_probe':
   drivers/pci/controller/dwc/pcie-stm32.c:243:29: warning: unused variable 'np' [-Wunused-variable]
     243 |         struct device_node *np = pdev->dev.of_node;
         |                             ^~


vim +/pinctrl_pm_select_sleep_state +101 drivers/pci/controller/dwc/pcie-stm32.c

    88	
    89	static int stm32_pcie_suspend_noirq(struct device *dev)
    90	{
    91		struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
    92	
    93		stm32_pcie->link_is_up = dw_pcie_link_up(stm32_pcie->pci);
    94	
    95		stm32_pcie_stop_link(stm32_pcie->pci);
    96		clk_disable_unprepare(stm32_pcie->clk);
    97	
    98		if (!device_may_wakeup(dev) && !device_wakeup_path(dev))
    99			phy_exit(stm32_pcie->phy);
   100	
 > 101		return pinctrl_pm_select_sleep_state(dev);
   102	}
   103	
   104	static int stm32_pcie_resume_noirq(struct device *dev)
   105	{
   106		struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
   107		struct dw_pcie *pci = stm32_pcie->pci;
   108		struct dw_pcie_rp *pp = &pci->pp;
   109		int ret;
   110	
   111		/* init_state must be called first to force clk_req# gpio when no
   112		 * device is plugged.
   113		 */
 > 114		if (!IS_ERR(dev->pins->init_state))
 > 115			ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
   116		else
 > 117			ret = pinctrl_pm_select_default_state(dev);
   118	
   119		if (ret) {
   120			dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
   121			return ret;
   122		}
   123	
   124		if (!device_may_wakeup(dev) && !device_wakeup_path(dev)) {
   125			ret = phy_init(stm32_pcie->phy);
   126			if (ret) {
   127				pinctrl_pm_select_default_state(dev);
   128				return ret;
   129			}
   130		}
   131	
   132		ret = clk_prepare_enable(stm32_pcie->clk);
   133		if (ret)
   134			goto clk_err;
   135	
   136		ret = dw_pcie_setup_rc(pp);
   137		if (ret)
   138			goto pcie_err;
   139	
   140		if (stm32_pcie->link_is_up) {
   141			ret = stm32_pcie_start_link(stm32_pcie->pci);
   142			if (ret)
   143				goto pcie_err;
   144	
   145			/* Ignore errors, the link may come up later */
   146			dw_pcie_wait_for_link(stm32_pcie->pci);
   147		}
   148	
   149		pinctrl_pm_select_default_state(dev);
   150	
   151		return 0;
   152	
   153	pcie_err:
   154		dw_pcie_host_deinit(pp);
   155		clk_disable_unprepare(stm32_pcie->clk);
   156	clk_err:
   157		phy_exit(stm32_pcie->phy);
   158		pinctrl_pm_select_default_state(dev);
   159	
   160		return ret;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

