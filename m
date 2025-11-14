Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF60CDE011
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 06:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wLugxe0T/C0TTPc09CzIW7jx9qZKwV+l0hXW1nApog=; b=iNvXPKzxr0M95H1lY9Yv0M2WpF
	3arED3qWH4ZOo+KW0F6msN5DXxGqfETSCB5bVSVMzmHoJIL2bVJNxrgTjbLQms0qWQ/TWfiPqU7Ci
	C8kfRiKCfiKIq/DcZ7U74PcKbMywS1J78r5k9Fw6pIQVxFNwAOaMDrqvfg8edIF9UaOwY81INqZRW
	lj/z7af52AMR8xrvpqjDlW3powQqlpcIpYqSz/Xi8Im1tiSvqDt8Hh6eR6Yt6CIcwvL3UGSKJNm2C
	BuCrMpWS0i64tMSIUuAOTgV/3cAJlefh3OmzbVRFjhEDsGj5K9g0ruq3vW/DvWFWwl1JSF2E3YIqg
	iOadISEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnaR-0000000BgYF-3Nz6;
	Fri, 14 Nov 2025 06:47:11 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnaL-0000000BgWF-1f3P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 06:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102826; x=1794638826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pn5oa3TGUgoDE+6tn2mRbL3CFXwukiDstAeboGmSXO4=;
  b=IykEPoMMs+JEoKvju//ZCFJ7DuymxebOeER06GuqWV833ICNQ7Tqm1+f
   yAVurWDf0vgDr4wpJ3srX4SQ8t1W4XhsnkueAboMI7e/GrL0WkvEiK72d
   ZSjk2f3EgBLWv8iZLinCmX2/vuEuFTOJsYKav3IRvayjnr4YrKqXjzXwz
   /TRJzZgFNun+0A9AIQjvOMNEZrAfwSInwrjlA7LUAB39eUhKvB1J05ElJ
   ebtejj+oPDmalP4uTuv8HdLoBJnTvkAO0F68JFJWAH9P0ngA2pYMADxR/
   ZcA+5LaVVrQYYFCzLONdbBHR5BxTp8Fji+vt8oFdMvDOAsU5CHI7mK+P2
   g==;
X-CSE-ConnectionGUID: es1TNtUUSx6p5tFIVUNd/A==
X-CSE-MsgGUID: +A3coK/TQvqd4FUJY4Qd0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64400154"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="64400154"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:47:05 -0800
X-CSE-ConnectionGUID: f3+f0+DlR1eYUHnDegYy7Q==
X-CSE-MsgGUID: CgfjtlbeSre9NPoZvHkDPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="220359551"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2025 22:46:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnaD-0006F5-0S;
	Fri, 14 Nov 2025 06:46:57 +0000
Date: Fri, 14 Nov 2025 14:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Rayagond Kokatanur <rayagond@vayavyalabs.com>,
	Giuseppe CAVALLARO <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH net] net: stmmac: add clk_prepare_enable() error handling
Message-ID: <202511141014.PnFNp7CX-lkp@intel.com>
References: <20251113134009.79440-1-Pavel.Zhigulin@kaspersky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113134009.79440-1-Pavel.Zhigulin@kaspersky.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_224705_462248_612281F1 
X-CRM114-Status: GOOD (  23.64  )
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

Hi Pavel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavel-Zhigulin/net-stmmac-add-clk_prepare_enable-error-handling/20251113-222525
base:   net/main
patch link:    https://lore.kernel.org/r/20251113134009.79440-1-Pavel.Zhigulin%40kaspersky.com
patch subject: [PATCH net] net: stmmac: add clk_prepare_enable() error handling
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20251114/202511141014.PnFNp7CX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141014.PnFNp7CX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141014.PnFNp7CX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:646:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     646 |         if (rc < 0) {
         |             ^~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:687:9: note: uninitialized use occurs here
     687 |         return ret;
         |                ^~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:646:2: note: remove the 'if' if its condition is always false
     646 |         if (rc < 0) {
         |         ^~~~~~~~~~~~~
     647 |                 dev_err(&pdev->dev, "Cannot enable pclk: %d\n", rc);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     648 |                 goto error_pclk_get;
         |                 ~~~~~~~~~~~~~~~~~~~~
     649 |         }
         |         ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:436:11: note: initialize the variable 'ret' to silence this warning
     436 |         void *ret;
         |                  ^
         |                   = NULL
   1 warning generated.


vim +646 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

   419	
   420	/**
   421	 * stmmac_probe_config_dt - parse device-tree driver parameters
   422	 * @pdev: platform_device structure
   423	 * @mac: MAC address to use
   424	 * Description:
   425	 * this function is to read the driver parameters from device-tree and
   426	 * set some private fields that will be used by the main at runtime.
   427	 */
   428	static struct plat_stmmacenet_data *
   429	stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
   430	{
   431		struct device_node *np = pdev->dev.of_node;
   432		struct plat_stmmacenet_data *plat;
   433		struct stmmac_dma_cfg *dma_cfg;
   434		static int bus_id = -ENODEV;
   435		int phy_mode;
   436		void *ret;
   437		int rc;
   438	
   439		plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
   440		if (!plat)
   441			return ERR_PTR(-ENOMEM);
   442	
   443		rc = of_get_mac_address(np, mac);
   444		if (rc) {
   445			if (rc == -EPROBE_DEFER)
   446				return ERR_PTR(rc);
   447	
   448			eth_zero_addr(mac);
   449		}
   450	
   451		phy_mode = device_get_phy_mode(&pdev->dev);
   452		if (phy_mode < 0)
   453			return ERR_PTR(phy_mode);
   454	
   455		plat->phy_interface = phy_mode;
   456	
   457		rc = stmmac_of_get_mac_mode(np);
   458		if (rc >= 0 && rc != phy_mode)
   459			dev_warn(&pdev->dev,
   460				 "\"mac-mode\" property used for %s but differs to \"phy-mode\" of %s, and will be ignored. Please report.\n",
   461				 phy_modes(rc), phy_modes(phy_mode));
   462	
   463		/* Some wrapper drivers still rely on phy_node. Let's save it while
   464		 * they are not converted to phylink. */
   465		plat->phy_node = of_parse_phandle(np, "phy-handle", 0);
   466	
   467		/* PHYLINK automatically parses the phy-handle property */
   468		plat->port_node = of_fwnode_handle(np);
   469	
   470		/* Get max speed of operation from device tree */
   471		of_property_read_u32(np, "max-speed", &plat->max_speed);
   472	
   473		plat->bus_id = of_alias_get_id(np, "ethernet");
   474		if (plat->bus_id < 0) {
   475			if (bus_id < 0)
   476				bus_id = of_alias_get_highest_id("ethernet");
   477			/* No ethernet alias found, init at -1 so first bus_id is 0 */
   478			if (bus_id < 0)
   479				bus_id = -1;
   480			plat->bus_id = ++bus_id;
   481		}
   482	
   483		/* Default to phy auto-detection */
   484		plat->phy_addr = -1;
   485	
   486		/* Default to get clk_csr from stmmac_clk_csr_set(),
   487		 * or get clk_csr from device tree.
   488		 */
   489		plat->clk_csr = -1;
   490		if (of_property_read_u32(np, "snps,clk-csr", &plat->clk_csr))
   491			of_property_read_u32(np, "clk_csr", &plat->clk_csr);
   492	
   493		/* "snps,phy-addr" is not a standard property. Mark it as deprecated
   494		 * and warn of its use. Remove this when phy node support is added.
   495		 */
   496		if (of_property_read_u32(np, "snps,phy-addr", &plat->phy_addr) == 0)
   497			dev_warn(&pdev->dev, "snps,phy-addr property is deprecated\n");
   498	
   499		rc = stmmac_mdio_setup(plat, np, &pdev->dev);
   500		if (rc) {
   501			ret = ERR_PTR(rc);
   502			goto error_put_phy;
   503		}
   504	
   505		of_property_read_u32(np, "tx-fifo-depth", &plat->tx_fifo_size);
   506	
   507		of_property_read_u32(np, "rx-fifo-depth", &plat->rx_fifo_size);
   508	
   509		plat->force_sf_dma_mode =
   510			of_property_read_bool(np, "snps,force_sf_dma_mode");
   511	
   512		if (of_property_read_bool(np, "snps,en-tx-lpi-clockgating")) {
   513			dev_warn(&pdev->dev,
   514				 "OF property snps,en-tx-lpi-clockgating is deprecated, please convert driver to use STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP\n");
   515			plat->flags |= STMMAC_FLAG_EN_TX_LPI_CLOCKGATING;
   516		}
   517	
   518		/* Set the maxmtu to a default of JUMBO_LEN in case the
   519		 * parameter is not present in the device tree.
   520		 */
   521		plat->maxmtu = JUMBO_LEN;
   522	
   523		/* Set default value for multicast hash bins */
   524		plat->multicast_filter_bins = HASH_TABLE_SIZE;
   525	
   526		/* Set default value for unicast filter entries */
   527		plat->unicast_filter_entries = 1;
   528	
   529		/*
   530		 * Currently only the properties needed on SPEAr600
   531		 * are provided. All other properties should be added
   532		 * once needed on other platforms.
   533		 */
   534		if (of_device_is_compatible(np, "st,spear600-gmac") ||
   535			of_device_is_compatible(np, "snps,dwmac-3.50a") ||
   536			of_device_is_compatible(np, "snps,dwmac-3.70a") ||
   537			of_device_is_compatible(np, "snps,dwmac-3.72a") ||
   538			of_device_is_compatible(np, "snps,dwmac")) {
   539			/* Note that the max-frame-size parameter as defined in the
   540			 * ePAPR v1.1 spec is defined as max-frame-size, it's
   541			 * actually used as the IEEE definition of MAC Client
   542			 * data, or MTU. The ePAPR specification is confusing as
   543			 * the definition is max-frame-size, but usage examples
   544			 * are clearly MTUs
   545			 */
   546			of_property_read_u32(np, "max-frame-size", &plat->maxmtu);
   547			of_property_read_u32(np, "snps,multicast-filter-bins",
   548					     &plat->multicast_filter_bins);
   549			of_property_read_u32(np, "snps,perfect-filter-entries",
   550					     &plat->unicast_filter_entries);
   551			plat->unicast_filter_entries = dwmac1000_validate_ucast_entries(
   552					&pdev->dev, plat->unicast_filter_entries);
   553			plat->multicast_filter_bins = dwmac1000_validate_mcast_bins(
   554					&pdev->dev, plat->multicast_filter_bins);
   555			plat->has_gmac = 1;
   556			plat->pmt = 1;
   557		}
   558	
   559		if (of_device_is_compatible(np, "snps,dwmac-3.40a")) {
   560			plat->has_gmac = 1;
   561			plat->enh_desc = 1;
   562			plat->tx_coe = 1;
   563			plat->bugged_jumbo = 1;
   564			plat->pmt = 1;
   565		}
   566	
   567		if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
   568			plat->has_gmac4 = 1;
   569			plat->has_gmac = 0;
   570			plat->pmt = 1;
   571			if (of_property_read_bool(np, "snps,tso"))
   572				plat->flags |= STMMAC_FLAG_TSO_EN;
   573		}
   574	
   575		if (of_device_is_compatible(np, "snps,dwmac-3.610") ||
   576			of_device_is_compatible(np, "snps,dwmac-3.710")) {
   577			plat->enh_desc = 1;
   578			plat->bugged_jumbo = 1;
   579			plat->force_sf_dma_mode = 1;
   580		}
   581	
   582		if (of_device_is_compatible(np, "snps,dwxgmac")) {
   583			plat->has_xgmac = 1;
   584			plat->pmt = 1;
   585			if (of_property_read_bool(np, "snps,tso"))
   586				plat->flags |= STMMAC_FLAG_TSO_EN;
   587			of_property_read_u32(np, "snps,multicast-filter-bins",
   588					     &plat->multicast_filter_bins);
   589		}
   590	
   591		dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg),
   592				       GFP_KERNEL);
   593		if (!dma_cfg) {
   594			ret = ERR_PTR(-ENOMEM);
   595			goto error_put_mdio;
   596		}
   597		plat->dma_cfg = dma_cfg;
   598	
   599		of_property_read_u32(np, "snps,pbl", &dma_cfg->pbl);
   600		if (!dma_cfg->pbl)
   601			dma_cfg->pbl = DEFAULT_DMA_PBL;
   602		of_property_read_u32(np, "snps,txpbl", &dma_cfg->txpbl);
   603		of_property_read_u32(np, "snps,rxpbl", &dma_cfg->rxpbl);
   604		dma_cfg->pblx8 = !of_property_read_bool(np, "snps,no-pbl-x8");
   605	
   606		dma_cfg->aal = of_property_read_bool(np, "snps,aal");
   607		dma_cfg->fixed_burst = of_property_read_bool(np, "snps,fixed-burst");
   608		dma_cfg->mixed_burst = of_property_read_bool(np, "snps,mixed-burst");
   609	
   610		plat->force_thresh_dma_mode = of_property_read_bool(np, "snps,force_thresh_dma_mode");
   611		if (plat->force_thresh_dma_mode && plat->force_sf_dma_mode) {
   612			plat->force_sf_dma_mode = 0;
   613			dev_warn(&pdev->dev,
   614				 "force_sf_dma_mode is ignored if force_thresh_dma_mode is set.\n");
   615		}
   616	
   617		of_property_read_u32(np, "snps,ps-speed", &plat->mac_port_sel_speed);
   618	
   619		plat->axi = stmmac_axi_setup(pdev);
   620	
   621		rc = stmmac_mtl_setup(pdev, plat);
   622		if (rc) {
   623			ret = ERR_PTR(rc);
   624			goto error_put_mdio;
   625		}
   626	
   627		/* clock setup */
   628		if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
   629			plat->stmmac_clk = devm_clk_get(&pdev->dev,
   630							STMMAC_RESOURCE_NAME);
   631			if (IS_ERR(plat->stmmac_clk)) {
   632				dev_warn(&pdev->dev, "Cannot get CSR clock\n");
   633				plat->stmmac_clk = NULL;
   634			}
   635			rc = clk_prepare_enable(plat->stmmac_clk);
   636			if (rc < 0)
   637				dev_warn(&pdev->dev, "Cannot enable CSR clock: %d\n", rc);
   638		}
   639	
   640		plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
   641		if (IS_ERR(plat->pclk)) {
   642			ret = plat->pclk;
   643			goto error_pclk_get;
   644		}
   645		rc = clk_prepare_enable(plat->pclk);
 > 646		if (rc < 0) {
   647			dev_err(&pdev->dev, "Cannot enable pclk: %d\n", rc);
   648			goto error_pclk_get;
   649		}
   650	
   651		/* Fall-back to main clock in case of no PTP ref is passed */
   652		plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
   653		if (IS_ERR(plat->clk_ptp_ref)) {
   654			plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
   655			plat->clk_ptp_ref = NULL;
   656			dev_info(&pdev->dev, "PTP uses main clock\n");
   657		} else {
   658			plat->clk_ptp_rate = clk_get_rate(plat->clk_ptp_ref);
   659			dev_dbg(&pdev->dev, "PTP rate %lu\n", plat->clk_ptp_rate);
   660		}
   661	
   662		plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
   663								   STMMAC_RESOURCE_NAME);
   664		if (IS_ERR(plat->stmmac_rst)) {
   665			ret = plat->stmmac_rst;
   666			goto error_hw_init;
   667		}
   668	
   669		plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
   670								&pdev->dev, "ahb");
   671		if (IS_ERR(plat->stmmac_ahb_rst)) {
   672			ret = plat->stmmac_ahb_rst;
   673			goto error_hw_init;
   674		}
   675	
   676		return plat;
   677	
   678	error_hw_init:
   679		clk_disable_unprepare(plat->pclk);
   680	error_pclk_get:
   681		clk_disable_unprepare(plat->stmmac_clk);
   682	error_put_mdio:
   683		of_node_put(plat->mdio_node);
   684	error_put_phy:
   685		of_node_put(plat->phy_node);
   686	
   687		return ret;
   688	}
   689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

