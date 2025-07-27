Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0343C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 01:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvKDBXE4QefmR0az3BI6KNpIlhAU5S6dBKTwQ0xOsJ4=; b=ma+/zyQsDZhQMJoyMyYo+iki4a
	P0gVesMeSjHLrJZ+EWYw4bbVpnZLcEtZbL4Af7WX6LJca2NBERg3H8L+pVuY6IaXTafGaOHfb7fNK
	v4bXjjJL61kSafG8E4ZbuHARCTg0ulg37meAXCsByfisZjtHEEFy9AMpLFd/MxSpmdt2BehtNW17M
	0XX0Y0r2mx8w1DWYaq82WjiE6N5O+VYLeFbOVWhSoT6GGFlqIAV+iUoWGB5E7I8MR+GYLTA9KBKW8
	orTNMBWmnANmMFTXVdnmDzYUz9QvYavIRYYiGSHq1K/nxTRzXD9Wa1jKlz7FElUJ0cGrl93Vail7Q
	oZAPo6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufplb-0000000CABL-3w3T;
	Sun, 27 Jul 2025 01:01:31 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufpj4-0000000C9zw-0Yks
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 00:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753577934; x=1785113934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h89CzlG5Uwr7KSli3FIIw5sVKNhuYoUuSvarvHfA5V0=;
  b=jDKvVBIT8xHSquwtEp3uBEOVYBiLPKiXasqSBkp02K+IVKHn9VpjRzJi
   nIChAgnDTdxkAjQHxGUG5TcXrH1H9NIktJj8NICZNTS1uayH+ruQIE5Av
   oybCJHs0+H0fEjfVgxeqasrt4+UJvOq1MAvlItcjVjYqectIL5FeT8IXJ
   HMZtA69cR0Kh03044hJcsRf1n7YAZtSzPEje2aeEQNUrk3uHXAO098AB8
   SphYMXHPCfokQS9bzDuLYQFCe1v2x8p8ijzDFvMWk5vCAyCl3PQkdDP8S
   dwYFt0784RYdidJOoiUedOAzMD9A4qLvbuTft5Qa9ZDF4J6AqskNBeYxx
   g==;
X-CSE-ConnectionGUID: zdzpGXWmQ+WJAh043VjUig==
X-CSE-MsgGUID: e1K7wgoXQJqTmCxdSPkk+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55951490"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55951490"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 17:58:48 -0700
X-CSE-ConnectionGUID: wPhHR4UjTYaxYkDs9BJ6Xg==
X-CSE-MsgGUID: kT8KfUMHR7mDyL7f/wMHGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162637035"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jul 2025 17:58:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufpiq-000MNX-2c;
	Sun, 27 Jul 2025 00:58:40 +0000
Date: Sun, 27 Jul 2025 08:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: huaqian.li@siemens.com, christophe.jaillet@wanadoo.fr
Cc: oe-kbuild-all@lists.linux.dev, baocheng.su@siemens.com,
	bhelgaas@google.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, diogo.ivo@siemens.com,
	helgaas@kernel.org, huaqian.li@siemens.com, jan.kiszka@siemens.com,
	kristo@kernel.org, krzk+dt@kernel.org, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, lpieralisi@kernel.org, nm@ti.com,
	robh@kernel.org, s-vadapalli@ti.com, ssantosh@kernel.org,
	vigneshr@ti.com
Subject: Re: [PATCH v11 3/7] soc: ti: Add IOMMU-like PVU driver
Message-ID: <202507270850.rFyJ9cu3-lkp@intel.com>
References: <20250723034521.138695-4-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723034521.138695-4-huaqian.li@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_175854_187430_FB81A62B 
X-CRM114-Status: GOOD (  13.12  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on pci/next pci/for-linus linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/huaqian-li-siemens-com/dt-bindings-soc-ti-Add-AM65-peripheral-virtualization-unit/20250723-114915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250723034521.138695-4-huaqian.li%40siemens.com
patch subject: [PATCH v11 3/7] soc: ti: Add IOMMU-like PVU driver
config: arm64-randconfig-r131-20250727 (https://download.01.org/0day-ci/archive/20250727/202507270850.rFyJ9cu3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce: (https://download.01.org/0day-ci/archive/20250727/202507270850.rFyJ9cu3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270850.rFyJ9cu3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/ti/ti-pvu.c:422:44: sparse: sparse: Using plain integer as NULL pointer
   drivers/soc/ti/ti-pvu.c:422:47: sparse: sparse: Using plain integer as NULL pointer

vim +422 drivers/soc/ti/ti-pvu.c

   384	
   385	static int ti_pvu_probe(struct platform_device *pdev)
   386	{
   387		struct device *dev = &pdev->dev;
   388		struct device_node *its_node;
   389		void __iomem *base;
   390		struct ti_pvu *pvu;
   391		u32 val;
   392		int ret;
   393	
   394		pvu = devm_kzalloc(dev, sizeof(*pvu), GFP_KERNEL);
   395		if (!pvu)
   396			return -ENOMEM;
   397	
   398		pvu->pdev = pdev;
   399	
   400		base = devm_platform_ioremap_resource_byname(pdev, "cfg");
   401		if (IS_ERR(base))
   402			return PTR_ERR(base);
   403	
   404		pvu->cfg = devm_regmap_init_mmio(dev, base, &pvu_cfg_regmap_cfg);
   405		if (IS_ERR(pvu->cfg))
   406			return dev_err_probe(dev, PTR_ERR(pvu->cfg), "failed to init cfg regmap");
   407	
   408		ret = devm_regmap_field_bulk_alloc(dev, pvu->cfg, pvu->cfg_fields,
   409						   pvu_cfg_reg_fields, PVU_MAX_CFG_FIELDS);
   410		if (ret)
   411			return dev_err_probe(dev, ret, "failed to alloc cfg regmap fields");
   412	
   413		pvu->num_tlbs = pvu_field_read(pvu, PVU_TLBS);
   414		pvu->num_entries = pvu_field_read(pvu, PVU_TLB_ENTRIES);
   415		dev_info(dev, "TLBs: %d, entries per TLB: %d\n", pvu->num_tlbs,
   416			 pvu->num_entries);
   417	
   418		pvu->tlbif_base = devm_platform_ioremap_resource_byname(pdev, "tlbif");
   419		if (IS_ERR(pvu->tlbif_base))
   420			return PTR_ERR(pvu->tlbif_base);
   421	
 > 422		its_node = of_find_compatible_node(0, 0, "arm,gic-v3-its");
   423		if (its_node) {
   424			u32 pre_its_window[2];
   425	
   426			ret = of_property_read_u32_array(its_node,
   427							 "socionext,synquacer-pre-its",
   428							 pre_its_window,
   429							 ARRAY_SIZE(pre_its_window));
   430			if (ret) {
   431				dev_err(dev, "failed to read pre-its property\n");
   432				return ret;
   433			}
   434	
   435			ret = pvu_create_region(pvu, pre_its_window[0],
   436						pre_its_window[1]);
   437			if (ret)
   438				return ret;
   439		}
   440	
   441		/* Enable the first two TLBs, chaining from 0 to 1 */
   442		val = readl(pvu->tlbif_base + PVU_CHAIN);
   443		val |= PVU_CHAIN_EN | 1;
   444		writel(val, pvu->tlbif_base + PVU_CHAIN);
   445	
   446		val = readl(pvu->tlbif_base + PVU_CHAIN + 0x1000);
   447		val |= PVU_CHAIN_EN;
   448		writel(val, pvu->tlbif_base + PVU_CHAIN + 0x1000);
   449	
   450		pvu_field_write(pvu, PVU_DMA_CNT, 0);
   451		pvu_field_write(pvu, PVU_DMA_CL0, 0);
   452		pvu_field_write(pvu, PVU_DMA_CL1, 0);
   453		pvu_field_write(pvu, PVU_DMA_CL2, 0);
   454		pvu_field_write(pvu, PVU_DMA_CL3, 0);
   455		pvu_field_write(pvu, PVU_MAX_VIRTID, NUM_VIRTIDS);
   456	
   457		ret = platform_get_irq(pdev, 0);
   458		if (ret < 0)
   459			return dev_err_probe(dev, ret, "failed to get irq\n");
   460	
   461		ret = devm_request_irq(dev, ret, pvu_fault_isr, 0, dev_name(dev), pvu);
   462		if (ret)
   463			return dev_err_probe(dev, ret, "failed to request irq\n");
   464	
   465		pvu_field_write(pvu, PVU_EXC_ENABLE, 1);
   466		pvu_field_write(pvu, PVU_ENABLED, 1);
   467	
   468		dev_set_drvdata(dev, pvu);
   469	
   470		mutex_lock(&ti_pvu_lock);
   471		list_add(&pvu->entry, &ti_pvu_list);
   472		mutex_unlock(&ti_pvu_lock);
   473	
   474		return 0;
   475	}
   476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

