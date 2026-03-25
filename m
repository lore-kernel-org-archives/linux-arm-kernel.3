Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748F7103A9A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NM8JSFaEyEeCholdV5PCFvNGSWlHCai+7Rdls4nOTWk=; b=2kcPKWDS/4pdVxWZh90gjv82/Y
	PYLeaO7sFeVQccwVVMROJLusv6E+cH2k7fUxaGLOq/7kk72IYx9Fenf6Wzh2JOyiXPZzzVaL/rZIp
	DyAhkWCUcwThA87MxBo3J/v3mTqHU2eeuEQb6sex9sEwvlIasz6frYrF7sTfxnM4IWuW4dCt3YP40
	YEEdc3rPTUDmk7/grfSe1bMi3HedrOn5kP9zCeEmxyqW2maxhPU90/EAs2OPjswEtaF88iMvGF+tN
	G2FdwrtpYIquHxUL1Z706G9myzCf6QnE+3fMFopnwI3H++ow8NTXT4/CZJkYO1YDV/LPMA2P2Rv7A
	Qy0TyABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Lnl-00000003BXA-1lx8;
	Wed, 25 Mar 2026 10:49:29 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Lnj-00000003BWl-0EOH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 10:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774435767; x=1805971767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y4rM1iLTl82BhRRs5Nx7wm1CXx7QRUPDPGxS9HlKH1E=;
  b=nxu7d1GX4F7V5Srusf2JFscLEntsFZwf9yQy4Ui6gndjTI2404MNdLsb
   Na2kNdJjPbErknPwUnnslYGKLMlh1o1tE41jmxGA6KnnnDlve1ma1ZAEi
   HaMVaJ2lHhKDCdLgPyJ1FaX+3coPoCLALprLkwL4EXaamn6E4vBHRV6e5
   gOa8KmaQ1CMSA0TiuujUbQxGZs3P27YuzSkvAgijRMyuLzVj5lqz3Zp9g
   X/uqaekiZbIrxHdD6URMtv14J0xuL5PKOAcjuzzXLaPTJJDPfIzGJIa/e
   AJs/piJY5Z40d5Xh14uCeTEOb2G7wxLjsmoxp/vu9qNIceTrpIfH9e7DO
   A==;
X-CSE-ConnectionGUID: +SmDOMtTQKGYYj56B27kmA==
X-CSE-MsgGUID: nKjvhp2fRe2AU1xpFGx0Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79325155"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79325155"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:49:26 -0700
X-CSE-ConnectionGUID: 7OsIQRFCTLuqPlybnrUTfg==
X-CSE-MsgGUID: nOQqZgnMTDyMoRJF43rx7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224905102"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Mar 2026 03:49:21 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Lna-000000006f7-2Nd7;
	Wed, 25 Mar 2026 10:49:18 +0000
Date: Wed, 25 Mar 2026 18:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
	andriy.shevchenko@linux.intel.com,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v27 3/4] i2c: ast2600: Add controller driver for AST2600
 new register set
Message-ID: <202603251835.KJc3nKCn-lkp@intel.com>
References: <20260324-upstream_i2c-v27-3-f19b511c8c28@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-upstream_i2c-v27-3-f19b511c8c28@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_034927_167636_2D65A0A5 
X-CRM114-Status: GOOD (  13.44  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-Split-AST2600-binding-into-a-new-YAML/20260325-112805
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260324-upstream_i2c-v27-3-f19b511c8c28%40aspeedtech.com
patch subject: [PATCH v27 3/4] i2c: ast2600: Add controller driver for AST2600 new register set
config: sparc-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251835.KJc3nKCn-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251835.KJc3nKCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251835.KJc3nKCn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ast2600.c: In function 'ast2600_i2c_probe':
>> drivers/i2c/busses/i2c-ast2600.c:955:15: error: 'struct ast2600_i2c_bus' has no member named 'dma_abailable'; did you mean 'dma_available'?
     if (i2c_bus->dma_abailable)
                  ^~~~~~~~~~~~~
                  dma_available


vim +955 drivers/i2c/busses/i2c-ast2600.c

   916	
   917	static int ast2600_i2c_probe(struct platform_device *pdev)
   918	{
   919		struct device *dev = &pdev->dev;
   920		struct ast2600_i2c_bus *i2c_bus;
   921		struct reset_control *rst;
   922		struct resource *res;
   923		u32 global_ctrl;
   924		int ret;
   925	
   926		if (!device_property_present(dev, "aspeed,global-regs"))
   927			return -ENODEV;
   928	
   929		i2c_bus = devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
   930		if (!i2c_bus)
   931			return -ENOMEM;
   932	
   933		i2c_bus->reg_base = devm_platform_ioremap_resource(pdev, 0);
   934		if (IS_ERR(i2c_bus->reg_base))
   935			return PTR_ERR(i2c_bus->reg_base);
   936	
   937		rst = devm_reset_control_get_shared_deasserted(dev, NULL);
   938		if (IS_ERR(rst))
   939			return dev_err_probe(dev, PTR_ERR(rst), "Missing reset ctrl\n");
   940	
   941		i2c_bus->global_regs =
   942			syscon_regmap_lookup_by_phandle(dev_of_node(dev), "aspeed,global-regs");
   943		if (IS_ERR(i2c_bus->global_regs))
   944			return PTR_ERR(i2c_bus->global_regs);
   945	
   946		regmap_read(i2c_bus->global_regs, AST2600_I2CG_CTRL, &global_ctrl);
   947		if ((global_ctrl & AST2600_GLOBAL_INIT) != AST2600_GLOBAL_INIT) {
   948			regmap_write(i2c_bus->global_regs, AST2600_I2CG_CTRL, AST2600_GLOBAL_INIT);
   949			regmap_write(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, I2CCG_DIV_CTRL);
   950		}
   951	
   952		i2c_bus->dev = dev;
   953		i2c_bus->multi_master = device_property_read_bool(dev, "multi-master");
   954		i2c_bus->dma_available = device_property_read_bool(dev, "aspeed,enable-dma");
 > 955		if (i2c_bus->dma_abailable)
   956			i2c_bus->mode = DMA_MODE;
   957		else
   958			i2c_bus->mode = BUFF_MODE;
   959	
   960		if (i2c_bus->mode == BUFF_MODE) {
   961			i2c_bus->buf_base = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
   962			if (IS_ERR(i2c_bus->buf_base))
   963				i2c_bus->mode = BYTE_MODE;
   964			else
   965				i2c_bus->buf_size = resource_size(res) / 2;
   966		}
   967	
   968		ast2600_i2c_set_xfer_mode(i2c_bus, i2c_bus->mode);
   969	
   970		/*
   971		 * i2c timeout counter: use base clk4 1Mhz,
   972		 * per unit: 1/(1000/1024) = 1024us
   973		 */
   974		ret = device_property_read_u32(dev, "i2c-scl-clk-low-timeout-us", &i2c_bus->timeout);
   975		if (!ret)
   976			i2c_bus->timeout = DIV_ROUND_UP(i2c_bus->timeout, 1024);
   977	
   978		init_completion(&i2c_bus->cmd_complete);
   979	
   980		i2c_bus->irq = platform_get_irq(pdev, 0);
   981		if (i2c_bus->irq < 0)
   982			return i2c_bus->irq;
   983	
   984		platform_set_drvdata(pdev, i2c_bus);
   985	
   986		i2c_bus->clk = devm_clk_get(i2c_bus->dev, NULL);
   987		if (IS_ERR(i2c_bus->clk))
   988			return dev_err_probe(i2c_bus->dev, PTR_ERR(i2c_bus->clk), "Can't get clock\n");
   989	
   990		i2c_bus->apb_clk = clk_get_rate(i2c_bus->clk);
   991	
   992		i2c_parse_fw_timings(i2c_bus->dev, &i2c_bus->timing_info, true);
   993	
   994		/* Initialize the I2C adapter */
   995		i2c_bus->adap.owner = THIS_MODULE;
   996		i2c_bus->adap.algo = &i2c_ast2600_algorithm;
   997		i2c_bus->adap.retries = 0;
   998		i2c_bus->adap.dev.parent = i2c_bus->dev;
   999		device_set_node(&i2c_bus->adap.dev, dev_fwnode(dev));
  1000		i2c_bus->adap.algo_data = i2c_bus;
  1001		strscpy(i2c_bus->adap.name, pdev->name);
  1002		i2c_set_adapdata(&i2c_bus->adap, i2c_bus);
  1003	
  1004		ret = ast2600_i2c_init(i2c_bus);
  1005		if (ret < 0)
  1006			return dev_err_probe(dev, ret, "Unable to initial i2c %d\n", ret);
  1007	
  1008		ret = devm_request_irq(dev, i2c_bus->irq, ast2600_i2c_bus_irq, 0,
  1009				       dev_name(dev), i2c_bus);
  1010		if (ret < 0) {
  1011			ret = dev_err_probe(dev, ret, "Unable to request irq %d\n",
  1012					    i2c_bus->irq);
  1013			goto err;
  1014		}
  1015	
  1016		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
  1017		       i2c_bus->reg_base + AST2600_I2CM_IER);
  1018	
  1019		ret = devm_i2c_add_adapter(dev, &i2c_bus->adap);
  1020		if (ret)
  1021			goto err;
  1022	
  1023		ret = sysfs_create_file(&dev->kobj, &dev_attr_xfer_mode.attr);
  1024		if (ret)
  1025			goto err;
  1026	
  1027		return 0;
  1028	
  1029	err:
  1030		writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
  1031		writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
  1032		return ret;
  1033	}
  1034	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

