Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC7CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhnE+JR+OUx/rzW1uHm1Xcr8yxVKptyPdY1opnXpoVk=; b=eodqbh+wYSnNiNIMzfMnVznE3X
	7fzWcaK1MeuQLJGd+zBJfoAL06b4G7IFMQYKk1YyKLtDw2VwDP1hWNiNixtM8wVPNXD4o99CIcLsd
	WuwBVEe6nCI7tAf0WwHkRVxU6Vk5eOLo8Hz9jI0h0VNVOTAs+WN2a6uKo4UEpxjmPWq9y1YeAVIRe
	mhhYELNbFIpe8As6sqmUnBsbEPdX9xlHtBl68f7GMqbmOSgeo2LBaHRIhylxuszPvlpF5zamy79qM
	rjrjNtFEy6Ah1Tnv4iVNEkVOxzm9cFruL41s5Iun18ij4Wci+vPOlGvIwa2JGcZlHN37zMen5f4vt
	rl08KGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXbn-0000000AtlE-1gXX;
	Thu, 13 Feb 2025 11:42:19 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXZ2-0000000AtBd-15BY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 11:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739446768; x=1770982768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x26+TIGrOJ0KNbq5bnCKvaiY72o7bCtil5dql0WTZB8=;
  b=QBQ/NvAFY4hu95eneJj2kfLy8MA+OZO4tswbj1+Li2U6yzfkvNMTmVKi
   tYQUoGRADrlU9aXEUCAxQXxo2srnQG9DMEE8wziYrQSbF8NOXEBRp+Hvd
   EnSXvydJ+dXQ+xAFFiH5bfOPHB9GbJjgQphB7jYRt7SF5vwz4WISGB/9N
   rHXYs5k5xLcpSZsl05A2k5Ce54k1wEl8nlob9Nn4QxqUc72at2Wn6oz6S
   nbPWHZo4tQAQc5Lyk+bQvhrIEKRn/FjaHsSw5R/n/uImDn15mAXpJ5LC+
   iActcjxdZp/02N1K8Ccq+pFIb17b6cDJL/hd9t+XDM/ii80DTD9vYUNw5
   g==;
X-CSE-ConnectionGUID: YRvdyj1JTdqd+xQC7f6LxA==
X-CSE-MsgGUID: mBMvLcICQRemWC6/s36JNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40008164"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40008164"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 03:39:27 -0800
X-CSE-ConnectionGUID: V46oJ0FCR9maNBzHURCDUg==
X-CSE-MsgGUID: w7kaAZwJSxGZvwrqs0ebwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113648995"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2025 03:39:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiXYu-0016yx-1f;
	Thu, 13 Feb 2025 11:39:20 +0000
Date: Thu, 13 Feb 2025 19:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Philipp Stanner <pstanner@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] stmmac: Replace deprecated PCI functions
Message-ID: <202502131939.DdTP5mv1-lkp@intel.com>
References: <20250212145831.101719-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212145831.101719-2-phasta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_033928_336003_D96FF7E0 
X-CRM114-Status: GOOD (  12.87  )
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

Hi Philipp,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc2 next-20250213]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/stmmac-Replace-deprecated-PCI-functions/20250212-230254
base:   linus/master
patch link:    https://lore.kernel.org/r/20250212145831.101719-2-phasta%40kernel.org
patch subject: [PATCH] stmmac: Replace deprecated PCI functions
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250213/202502131939.DdTP5mv1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131939.DdTP5mv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131939.DdTP5mv1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c: In function 'loongson_dwmac_probe':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:527:18: warning: unused variable 'i' [-Wunused-variable]
     527 |         int ret, i;
         |                  ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c: In function 'loongson_dwmac_remove':
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:604:13: warning: unused variable 'i' [-Wunused-variable]
     604 |         int i;
         |             ^


vim +/i +527 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c

126f4f96c41d2e Yanteng Si      2024-08-07  520  
30bba69d7db40e Qing Zhang      2021-06-18  521  static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id *id)
30bba69d7db40e Qing Zhang      2021-06-18  522  {
30bba69d7db40e Qing Zhang      2021-06-18  523  	struct plat_stmmacenet_data *plat;
0ec04d32b5e7f0 Yanteng Si      2024-08-07  524  	struct stmmac_pci_info *info;
bd83fd598ba34f Philipp Stanner 2025-02-12  525  	struct stmmac_resources res = {};
803fc61df261de Yanteng Si      2024-08-07  526  	struct loongson_data *ld;
126f4f96c41d2e Yanteng Si      2024-08-07 @527  	int ret, i;
30bba69d7db40e Qing Zhang      2021-06-18  528  
30bba69d7db40e Qing Zhang      2021-06-18  529  	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
30bba69d7db40e Qing Zhang      2021-06-18  530  	if (!plat)
30bba69d7db40e Qing Zhang      2021-06-18  531  		return -ENOMEM;
30bba69d7db40e Qing Zhang      2021-06-18  532  
30bba69d7db40e Qing Zhang      2021-06-18  533  	plat->mdio_bus_data = devm_kzalloc(&pdev->dev,
30bba69d7db40e Qing Zhang      2021-06-18  534  					   sizeof(*plat->mdio_bus_data),
30bba69d7db40e Qing Zhang      2021-06-18  535  					   GFP_KERNEL);
e87d3a1370ce9f Yanteng Si      2023-12-11  536  	if (!plat->mdio_bus_data)
e87d3a1370ce9f Yanteng Si      2023-12-11  537  		return -ENOMEM;
e87d3a1370ce9f Yanteng Si      2023-12-11  538  
30bba69d7db40e Qing Zhang      2021-06-18  539  	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg), GFP_KERNEL);
126f4f96c41d2e Yanteng Si      2024-08-07  540  	if (!plat->dma_cfg)
126f4f96c41d2e Yanteng Si      2024-08-07  541  		return -ENOMEM;
30bba69d7db40e Qing Zhang      2021-06-18  542  
803fc61df261de Yanteng Si      2024-08-07  543  	ld = devm_kzalloc(&pdev->dev, sizeof(*ld), GFP_KERNEL);
803fc61df261de Yanteng Si      2024-08-07  544  	if (!ld)
803fc61df261de Yanteng Si      2024-08-07  545  		return -ENOMEM;
803fc61df261de Yanteng Si      2024-08-07  546  
30bba69d7db40e Qing Zhang      2021-06-18  547  	/* Enable pci device */
30bba69d7db40e Qing Zhang      2021-06-18  548  	ret = pci_enable_device(pdev);
30bba69d7db40e Qing Zhang      2021-06-18  549  	if (ret) {
30bba69d7db40e Qing Zhang      2021-06-18  550  		dev_err(&pdev->dev, "%s: ERROR: failed to enable device\n", __func__);
126f4f96c41d2e Yanteng Si      2024-08-07  551  		return ret;
30bba69d7db40e Qing Zhang      2021-06-18  552  	}
30bba69d7db40e Qing Zhang      2021-06-18  553  
126f4f96c41d2e Yanteng Si      2024-08-07  554  	pci_set_master(pdev);
126f4f96c41d2e Yanteng Si      2024-08-07  555  
30bba69d7db40e Qing Zhang      2021-06-18  556  	/* Get the base address of device */
bd83fd598ba34f Philipp Stanner 2025-02-12  557  	res.addr = pcim_iomap_region(pdev, 0, DRIVER_NAME);
bd83fd598ba34f Philipp Stanner 2025-02-12  558  	ret = PTR_ERR_OR_ZERO(res.addr);
30bba69d7db40e Qing Zhang      2021-06-18  559  	if (ret)
fe5b3ce8b4377e Yang Yingliang  2022-11-08  560  		goto err_disable_device;
30bba69d7db40e Qing Zhang      2021-06-18  561  
803fc61df261de Yanteng Si      2024-08-07  562  	plat->bsp_priv = ld;
803fc61df261de Yanteng Si      2024-08-07  563  	plat->setup = loongson_dwmac_setup;
56dbe2c290bc58 Yanteng Si      2024-08-07  564  	ld->dev = &pdev->dev;
803fc61df261de Yanteng Si      2024-08-07  565  	ld->loongson_id = readl(res.addr + GMAC_VERSION) & 0xff;
803fc61df261de Yanteng Si      2024-08-07  566  
0ec04d32b5e7f0 Yanteng Si      2024-08-07  567  	info = (struct stmmac_pci_info *)id->driver_data;
126f4f96c41d2e Yanteng Si      2024-08-07  568  	ret = info->setup(pdev, plat);
0ec04d32b5e7f0 Yanteng Si      2024-08-07  569  	if (ret)
0ec04d32b5e7f0 Yanteng Si      2024-08-07  570  		goto err_disable_device;
0ec04d32b5e7f0 Yanteng Si      2024-08-07  571  
126f4f96c41d2e Yanteng Si      2024-08-07  572  	if (dev_of_node(&pdev->dev))
126f4f96c41d2e Yanteng Si      2024-08-07  573  		ret = loongson_dwmac_dt_config(pdev, plat, &res);
126f4f96c41d2e Yanteng Si      2024-08-07  574  	else
126f4f96c41d2e Yanteng Si      2024-08-07  575  		ret = loongson_dwmac_acpi_config(pdev, plat, &res);
126f4f96c41d2e Yanteng Si      2024-08-07  576  	if (ret)
0c979e6b55f99f Yanteng Si      2024-08-07  577  		goto err_disable_device;
30bba69d7db40e Qing Zhang      2021-06-18  578  
803fc61df261de Yanteng Si      2024-08-07  579  	/* Use the common MAC IRQ if per-channel MSIs allocation failed */
803fc61df261de Yanteng Si      2024-08-07  580  	if (ld->loongson_id == DWMAC_CORE_LS_MULTICHAN)
803fc61df261de Yanteng Si      2024-08-07  581  		loongson_dwmac_msi_config(pdev, plat, &res);
803fc61df261de Yanteng Si      2024-08-07  582  
f2d45fdf9a0ed2 Yang Yingliang  2022-11-08  583  	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
f2d45fdf9a0ed2 Yang Yingliang  2022-11-08  584  	if (ret)
126f4f96c41d2e Yanteng Si      2024-08-07  585  		goto err_plat_clear;
f2d45fdf9a0ed2 Yang Yingliang  2022-11-08  586  
126f4f96c41d2e Yanteng Si      2024-08-07  587  	return 0;
f2d45fdf9a0ed2 Yang Yingliang  2022-11-08  588  
126f4f96c41d2e Yanteng Si      2024-08-07  589  err_plat_clear:
126f4f96c41d2e Yanteng Si      2024-08-07  590  	if (dev_of_node(&pdev->dev))
126f4f96c41d2e Yanteng Si      2024-08-07  591  		loongson_dwmac_dt_clear(pdev, plat);
803fc61df261de Yanteng Si      2024-08-07  592  	if (ld->loongson_id == DWMAC_CORE_LS_MULTICHAN)
803fc61df261de Yanteng Si      2024-08-07  593  		loongson_dwmac_msi_clear(pdev);
fe5b3ce8b4377e Yang Yingliang  2022-11-08  594  err_disable_device:
fe5b3ce8b4377e Yang Yingliang  2022-11-08  595  	pci_disable_device(pdev);
f2d45fdf9a0ed2 Yang Yingliang  2022-11-08  596  	return ret;
30bba69d7db40e Qing Zhang      2021-06-18  597  }
30bba69d7db40e Qing Zhang      2021-06-18  598  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

