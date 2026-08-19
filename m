Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4020C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 06:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s6q6ihmYv6INeBIbnBWmbGTqM6Dw78ZKvUj8QpwpCLE=; b=eP5sHXMIBmArAQv8vn0rMcYGr0
	x14ZiUyoeiR20BJPI5m//CyQneoOGxV7/K+4iI+i7VGdcXEyNtaWaZ5RmUdh+NQKlsMyt1OQexPB1
	umdlYWR9cRdDDlhqiKjtejULWte/fNHW6nGVmfPdMhxKf4luvmrXzPX+aXGjgFKfT0FKDO/fWDCFS
	Vtlxg2o4XZCLW6bEpG/q1GwFdWBVTw+3ozAcmHrjnkNKIKkhCRb9lj++cuzF0AeL+ssGTq6JjzXLN
	BjvI7g0xNZiGqG/Pzn6sZt0FUGp3h95dThWkVcMwSwcLewc1qo9NFTdasF4tby/BpUsMfQn8c7wg8
	ShkUpWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZfJ-000000095da-45e8;
	Wed, 19 Aug 2026 06:20:45 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZfB-000000095cB-46H1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 06:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787120438; x=1818656438;
  h=date:from:to:cc:subject:message-id;
  bh=Ae5EtFaI9BGXxjoLx/GdUMTnmrJbYbn05HWs+4m7cjs=;
  b=aTPH5aHXGAmNxdAbGJuxsbnBmM6bUJuaLTgGNZJFULFPEWWnaLmmZAkh
   enAxC/i8lACxN864YHDEyW22SYrRw5vqNe5wgXUfby1Q+pyx0/Q79PO4v
   lVY4aTA//OIJbbhsvbUO3NYIr+4PluD3ikXQS3951x2mJLlpZn15DoGeF
   glCoR9g0IATSdJoFqN64Ni+BrgNRgJrO2FUOAv9unWp3X3qdr77c/vXYK
   gKvIy9E/ytl3mb1vSuwChymiaJ7HpqkuwF+J3wAZBhGvbSlpBOzZ0Wizy
   rOxUmYv466/F9AlFnadWxqker5Dh/pdXzNT5AXAPcL8L3isxxefUxBZZ4
   A==;
X-CSE-ConnectionGUID: WgcEuDQTS6ySEfjqmi25vw==
X-CSE-MsgGUID: EupFpxeRS3quKeakZOibAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="86740145"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="86740145"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:20:37 -0700
X-CSE-ConnectionGUID: wqXct5asQouFb3hiKQu9Vg==
X-CSE-MsgGUID: kdMqOqGLTKOOkCAngsBGtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="268961315"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2026 23:20:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwZf7-00000000ewE-0Sgv;
	Wed, 19 Aug 2026 06:20:33 +0000
Date: Wed, 19 Aug 2026 14:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 148/200]
 drivers/regulator/max8907-regulator.c:296 max8907_regulator_probe() warn:
 inconsistent indenting
Message-ID: <202608191451.uGAOqA5g-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_232038_060138_E6EB4327 
X-CRM114-Status: GOOD (  10.20  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   c12d647b0229f4d75a2973c9b4e79f9b53406426
commit: f8926841ac3e6d3be98b2ce7873f2a038816b3d2 [148/200] mfd: max8907: remove pdata based probing
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260819/202608191451.uGAOqA5g-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191451.uGAOqA5g-lkp@intel.com/

smatch warnings:
drivers/regulator/max8907-regulator.c:296 max8907_regulator_probe() warn: inconsistent indenting

vim +296 drivers/regulator/max8907-regulator.c

ffee19091a4e0c Gyungoh Yoo         2012-08-09  255  
a5023574d120ca Bill Pemberton      2012-11-19  256  static int max8907_regulator_probe(struct platform_device *pdev)
ffee19091a4e0c Gyungoh Yoo         2012-08-09  257  {
ffee19091a4e0c Gyungoh Yoo         2012-08-09  258  	struct max8907 *max8907 = dev_get_drvdata(pdev->dev.parent);
ffee19091a4e0c Gyungoh Yoo         2012-08-09  259  	int ret;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  260  	struct max8907_regulator *pmic;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  261  	unsigned int val;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  262  	int i;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  263  	struct regulator_config config = {};
ffee19091a4e0c Gyungoh Yoo         2012-08-09  264  	struct regulator_init_data *idata;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  265  	const char *mbatt_rail_name = NULL;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  266  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  267  	ret = max8907_regulator_parse_dt(pdev);
ffee19091a4e0c Gyungoh Yoo         2012-08-09  268  	if (ret)
ffee19091a4e0c Gyungoh Yoo         2012-08-09  269  		return ret;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  270  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  271  	pmic = devm_kzalloc(&pdev->dev, sizeof(*pmic), GFP_KERNEL);
d016bdc7f4e8b2 Sachin Kamat        2014-02-20  272  	if (!pmic)
ffee19091a4e0c Gyungoh Yoo         2012-08-09  273  		return -ENOMEM;
d016bdc7f4e8b2 Sachin Kamat        2014-02-20  274  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  275  	platform_set_drvdata(pdev, pmic);
ffee19091a4e0c Gyungoh Yoo         2012-08-09  276  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  277  	memcpy(pmic->desc, max8907_regulators, sizeof(pmic->desc));
ffee19091a4e0c Gyungoh Yoo         2012-08-09  278  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  279  	/* Backwards compatibility with MAX8907B; SD1 uses different voltages */
472b39c3d1bba0 Yizhuo              2019-10-03  280  	ret = regmap_read(max8907->regmap_gen, MAX8907_REG_II2RR, &val);
472b39c3d1bba0 Yizhuo              2019-10-03  281  	if (ret)
472b39c3d1bba0 Yizhuo              2019-10-03  282  		return ret;
472b39c3d1bba0 Yizhuo              2019-10-03  283  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  284  	if ((val & MAX8907_II2RR_VERSION_MASK) ==
ffee19091a4e0c Gyungoh Yoo         2012-08-09  285  	    MAX8907_II2RR_VERSION_REV_B) {
ffee19091a4e0c Gyungoh Yoo         2012-08-09  286  		pmic->desc[MAX8907_SD1].min_uV = 637500;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  287  		pmic->desc[MAX8907_SD1].uV_step = 12500;
7305608bc88827 Axel Lin            2012-08-16  288  		pmic->desc[MAX8907_SD1].n_voltages =
7305608bc88827 Axel Lin            2012-08-16  289  						(1425000 - 637500) / 12500 + 1;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  290  	}
ffee19091a4e0c Gyungoh Yoo         2012-08-09  291  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  292  	for (i = 0; i < MAX8907_NUM_REGULATORS; i++) {
f991525a1acc64 Krzysztof Kozlowski 2014-03-10  293  		struct regulator_dev *rdev;
f991525a1acc64 Krzysztof Kozlowski 2014-03-10  294  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  295  		config.dev = pdev->dev.parent;
db55168265699c Stephen Warren      2012-08-20 @296  			idata = match_init_data(i);
ffee19091a4e0c Gyungoh Yoo         2012-08-09  297  		config.init_data = idata;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  298  		config.driver_data = pmic;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  299  		config.regmap = max8907->regmap_gen;
db55168265699c Stephen Warren      2012-08-20  300  		config.of_node = match_of_node(i);
ffee19091a4e0c Gyungoh Yoo         2012-08-09  301  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  302  		switch (pmic->desc[i].id) {
ffee19091a4e0c Gyungoh Yoo         2012-08-09  303  		case MAX8907_MBATT:
5fc72f57e62e10 Stephen Warren      2012-08-23  304  			if (idata && idata->constraints.name)
ffee19091a4e0c Gyungoh Yoo         2012-08-09  305  				mbatt_rail_name = idata->constraints.name;
5fc72f57e62e10 Stephen Warren      2012-08-23  306  			else
5fc72f57e62e10 Stephen Warren      2012-08-23  307  				mbatt_rail_name = pmic->desc[i].name;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  308  			break;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  309  		case MAX8907_BBAT:
ffee19091a4e0c Gyungoh Yoo         2012-08-09  310  		case MAX8907_SDBY:
ffee19091a4e0c Gyungoh Yoo         2012-08-09  311  		case MAX8907_VRTC:
ffee19091a4e0c Gyungoh Yoo         2012-08-09  312  			idata->supply_regulator = mbatt_rail_name;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  313  			break;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  314  		}
ffee19091a4e0c Gyungoh Yoo         2012-08-09  315  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  316  		if (pmic->desc[i].ops == &max8907_ldo_ops) {
472b39c3d1bba0 Yizhuo              2019-10-03  317  			ret = regmap_read(config.regmap, pmic->desc[i].enable_reg,
ffee19091a4e0c Gyungoh Yoo         2012-08-09  318  				    &val);
472b39c3d1bba0 Yizhuo              2019-10-03  319  			if (ret)
472b39c3d1bba0 Yizhuo              2019-10-03  320  				return ret;
472b39c3d1bba0 Yizhuo              2019-10-03  321  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  322  			if ((val & MAX8907_MASK_LDO_SEQ) !=
ffee19091a4e0c Gyungoh Yoo         2012-08-09  323  			    MAX8907_MASK_LDO_SEQ)
ffee19091a4e0c Gyungoh Yoo         2012-08-09  324  				pmic->desc[i].ops = &max8907_ldo_hwctl_ops;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  325  		} else if (pmic->desc[i].ops == &max8907_out5v_ops) {
472b39c3d1bba0 Yizhuo              2019-10-03  326  			ret = regmap_read(config.regmap, pmic->desc[i].enable_reg,
ffee19091a4e0c Gyungoh Yoo         2012-08-09  327  				    &val);
472b39c3d1bba0 Yizhuo              2019-10-03  328  			if (ret)
472b39c3d1bba0 Yizhuo              2019-10-03  329  				return ret;
472b39c3d1bba0 Yizhuo              2019-10-03  330  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  331  			if ((val & (MAX8907_MASK_OUT5V_VINEN |
ffee19091a4e0c Gyungoh Yoo         2012-08-09  332  						MAX8907_MASK_OUT5V_ENSRC)) !=
ffee19091a4e0c Gyungoh Yoo         2012-08-09  333  			    MAX8907_MASK_OUT5V_ENSRC)
ffee19091a4e0c Gyungoh Yoo         2012-08-09  334  				pmic->desc[i].ops = &max8907_out5v_hwctl_ops;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  335  		}
ffee19091a4e0c Gyungoh Yoo         2012-08-09  336  
f991525a1acc64 Krzysztof Kozlowski 2014-03-10  337  		rdev = devm_regulator_register(&pdev->dev,
5ecdf140f21c50 Sachin Kamat        2013-09-04  338  						&pmic->desc[i], &config);
f991525a1acc64 Krzysztof Kozlowski 2014-03-10  339  		if (IS_ERR(rdev)) {
ffee19091a4e0c Gyungoh Yoo         2012-08-09  340  			dev_err(&pdev->dev,
ffee19091a4e0c Gyungoh Yoo         2012-08-09  341  				"failed to register %s regulator\n",
ffee19091a4e0c Gyungoh Yoo         2012-08-09  342  				pmic->desc[i].name);
f991525a1acc64 Krzysztof Kozlowski 2014-03-10  343  			return PTR_ERR(rdev);
ffee19091a4e0c Gyungoh Yoo         2012-08-09  344  		}
ffee19091a4e0c Gyungoh Yoo         2012-08-09  345  	}
ffee19091a4e0c Gyungoh Yoo         2012-08-09  346  
ffee19091a4e0c Gyungoh Yoo         2012-08-09  347  	return 0;
ffee19091a4e0c Gyungoh Yoo         2012-08-09  348  }
ffee19091a4e0c Gyungoh Yoo         2012-08-09  349  

:::::: The code at line 296 was first introduced by commit
:::::: db55168265699c72e6ebf7a4228029da590a3eab regulator: max8907: fix compile error when !CONFIG_OF

:::::: TO: Stephen Warren <swarren@nvidia.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

