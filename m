Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5004C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JQgLSG4YvoZaXajqXQOdtfedfHyyujRBI6cJxUYlHN0=; b=YL28IfzcgXWw4cXuv0zXsANVDL
	pgvRIGDJlhc8h1lUv2FQfS2CvkCvoJmxjomXdfJD/F+vZVIjA+UF8j12XLDDrwnM6LruBctSaE8Cf
	4ZYehgNen/Iof6taEjK+osDECfv+0U+nY1y1hdpQUCVV9ShVWhsdGInzNGGfJrDFkadP3aUzmoEvg
	DU84UV59qPwGqlK+a0GEK9UNTGucSscG8QUgV+7h9wz2D+uPpV2Ab1y1IygKogJ5gBy99Ek4mpCaw
	9gT4O7ROcP1cqMcbusTPu/JjvKYYW27Wop9y/NwR726aeQsWLM2mSeBsGnYIGhq6DxyCowgEUSUzv
	davWaXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgfj-000000051nn-0JxS;
	Sun, 16 Aug 2026 19:37:31 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvgfg-000000051nS-3Qsr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 19:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786909049; x=1818445049;
  h=date:from:to:cc:subject:message-id;
  bh=CnrXjJZl16h6sjUMPByZym1rW8nYJW7wjfR5SUt/PRM=;
  b=Br3pHgN6MrbPWxiIoNvrrdxMD8yzIg11jD/dt6fFibPHZECTg9iJ28dB
   VNC1WBDlVfif0fXcHq6TS8gn62PUiRso2cU2nLVYQ/OIWdy0W3MlBVvuG
   +FhpUItrUYKZQccoLTCp4X+OZKnJqKiEpbXP1AG70TC6Ijodg5PPivAqw
   dC4WKr15ie4gtGSiOiW/Wc83lTrkD8nKq1ciYXsn2RkxdaP2lNOFqv7gH
   n7QsdtfdKbS7wrT+JsITBUy2wVYn+jzvDdV8PTyhTM/S3emyVsgvrBUP/
   FiMLxjvaRLaNJdRVfT/6TNFXxZo82eXj+zoaCG0t50DO6Z/RhABm8VAgy
   w==;
X-CSE-ConnectionGUID: /7fcb4QYTwCoUQRIWKiOhA==
X-CSE-MsgGUID: ckBGk1DAR8ymEkrcMkoSCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91208663"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="91208663"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 12:37:28 -0700
X-CSE-ConnectionGUID: nV8t2L3DSi6j4jrufTn84Q==
X-CSE-MsgGUID: owRCc+OeTo2RcLT492OThw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="264766524"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2026 12:37:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvgfb-00000000d4f-2vG8;
	Sun, 16 Aug 2026 19:37:23 +0000
Date: Mon, 17 Aug 2026 03:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 114/217]
 drivers/regulator/da9055-regulator.c:534:15: error: too many arguments to
 function 'da9055_gpio_init'
Message-ID: <202608170503.dqOGRyEa-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_123728_902162_F50B01EB 
X-CRM114-Status: GOOD (  17.65  )
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
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 158b19afd623da6a93d8ac59dd4aeefe48fa2085 [114/217] mfd: da9055: remove pdata based probing
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260817/202608170503.dqOGRyEa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170503.dqOGRyEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170503.dqOGRyEa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/da9055-regulator.c:77:26: error: field 'reg_rselect' has incomplete type
      77 |         enum gpio_select reg_rselect;
         |                          ^~~~~~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_set_voltage_sel':
   drivers/regulator/da9055-regulator.c:208:39: error: 'NO_GPIO' undeclared (first use in this function)
     208 |         if (regulator->reg_rselect == NO_GPIO) {
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c:208:39: note: each undeclared identifier is reported only once for each function it appears in
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_set_suspend_voltage':
   drivers/regulator/da9055-regulator.c:248:39: error: 'NO_GPIO' undeclared (first use in this function)
     248 |         if (regulator->reg_rselect == NO_GPIO) {
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_enable':
   drivers/regulator/da9055-regulator.c:269:39: error: 'NO_GPIO' undeclared (first use in this function)
     269 |         if (regulator->reg_rselect == NO_GPIO)
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_disable':
   drivers/regulator/da9055-regulator.c:282:39: error: 'NO_GPIO' undeclared (first use in this function)
     282 |         if (regulator->reg_rselect == NO_GPIO)
         |                                       ^~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_gpio_init':
   drivers/regulator/da9055-regulator.c:466:42: error: 'pdata' undeclared (first use in this function); did you mean '_data'?
     466 |                 regulator->reg_rselect = pdata->reg_rsel[id];
         |                                          ^~~~~
         |                                          _data
   drivers/regulator/da9055-regulator.c:417:33: warning: parameter 'id' set but not used [-Wunused-but-set-parameter]
     417 |                             int id)
         |                             ~~~~^~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/regulator/da9055-regulator.c:9:
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_probe':
   include/linux/stddef.h:8:14: error: passing argument 4 of 'da9055_gpio_init' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/regulator/da9055-regulator.c:534:64: note: in expansion of macro 'NULL'
     534 |         ret = da9055_gpio_init(&pdev->dev, regulator, &config, NULL, pdev->id);
         |                                                                ^~~~
   drivers/regulator/da9055-regulator.c:417:33: note: expected 'int' but argument is of type 'void *'
     417 |                             int id)
         |                             ~~~~^~
>> drivers/regulator/da9055-regulator.c:534:15: error: too many arguments to function 'da9055_gpio_init'
     534 |         ret = da9055_gpio_init(&pdev->dev, regulator, &config, NULL, pdev->id);
         |               ^~~~~~~~~~~~~~~~
   drivers/regulator/da9055-regulator.c:414:12: note: declared here
     414 | static int da9055_gpio_init(struct device *dev,
         |            ^~~~~~~~~~~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_enable':
   drivers/regulator/da9055-regulator.c:274:1: warning: control reaches end of non-void function [-Wreturn-type]
     274 | }
         | ^
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_disable':
   drivers/regulator/da9055-regulator.c:287:1: warning: control reaches end of non-void function [-Wreturn-type]
     287 | }
         | ^


vim +/da9055_gpio_init +534 drivers/regulator/da9055-regulator.c

   510	
   511	static int da9055_regulator_probe(struct platform_device *pdev)
   512	{
   513		struct regulator_config config = { };
   514		struct da9055_regulator *regulator;
   515		struct da9055 *da9055 = dev_get_drvdata(pdev->dev.parent);
   516		int ret, irq;
   517	
   518		regulator = devm_kzalloc(&pdev->dev, sizeof(struct da9055_regulator),
   519					 GFP_KERNEL);
   520		if (!regulator)
   521			return -ENOMEM;
   522	
   523		regulator->info = find_regulator_info(pdev->id);
   524		if (regulator->info == NULL) {
   525			dev_err(&pdev->dev, "invalid regulator ID specified\n");
   526			return -EINVAL;
   527		}
   528	
   529		regulator->da9055 = da9055;
   530		config.dev = da9055->dev;
   531		config.driver_data = regulator;
   532		config.regmap = da9055->regmap;
   533	
 > 534		ret = da9055_gpio_init(&pdev->dev, regulator, &config, NULL, pdev->id);
   535		if (ret < 0)
   536			return ret;
   537	
   538		regulator->rdev = devm_regulator_register(&pdev->dev,
   539							  &regulator->info->reg_desc,
   540							  &config);
   541		if (IS_ERR(regulator->rdev)) {
   542			dev_err(&pdev->dev, "Failed to register regulator %s\n",
   543				regulator->info->reg_desc.name);
   544			return PTR_ERR(regulator->rdev);
   545		}
   546	
   547		/* Only LDO 5 and 6 has got the over current interrupt */
   548		if (pdev->id == DA9055_ID_LDO5 || pdev->id ==  DA9055_ID_LDO6) {
   549			irq = platform_get_irq_byname(pdev, "REGULATOR");
   550			if (irq < 0)
   551				return irq;
   552	
   553			ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
   554							da9055_ldo5_6_oc_irq,
   555							IRQF_TRIGGER_HIGH |
   556							IRQF_ONESHOT |
   557							IRQF_PROBE_SHARED,
   558							pdev->name, regulator);
   559			if (ret != 0) {
   560				if (ret != -EBUSY) {
   561					dev_err(&pdev->dev,
   562					"Failed to request Regulator IRQ %d: %d\n",
   563					irq, ret);
   564					return ret;
   565				}
   566			}
   567		}
   568	
   569		platform_set_drvdata(pdev, regulator);
   570	
   571		return 0;
   572	}
   573	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

