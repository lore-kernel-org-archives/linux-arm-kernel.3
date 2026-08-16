Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7497DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 09:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/g/TWas5mLMhJmlRENB0C8fXjTmRLTEFaiwfEEjjFJ0=; b=B5G3k+Sz3Sjp8PvD6qQ7t1grFA
	koeTY0P2GKJkw2x9mk616YoPli5j5d9rO4AYWzpcz4VS31gOD90m8iipYB/tpGlO9S/Eqlq4RDvAK
	UeSrSSjPd8rr1d6txb23baah/zeGLwXxP3tRE4Hvn/N/OLijvlJpgdYCfpJEKpwbpnpaCUjHuwhz2
	ubAJ+SsXXVcAUWrZ4mAeETIgvDA4THFFqcVXWHP1YHlXqHjZfRnnAXlJLvvNgbFjCUtDC8CIp/9Fx
	twet+nhR+SaUOGU6yC535GqBJygeD/KVnn1JFxVq4nQPhp7/jcmG7a+G3snoBoSnPupMFJps1ztFa
	SBe6xQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXEF-00000004cCl-0BCR;
	Sun, 16 Aug 2026 09:32:31 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXEB-00000004cCI-15xu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 09:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786872747; x=1818408747;
  h=date:from:to:cc:subject:message-id;
  bh=StQmV5OrVMenz39D8q13bAe7PQZjTUbCu7bUqGAXJwc=;
  b=ijL++oQT49DOZGD7tMdK2oOq21T3qWacng/zneY6Co7I273c7wtntU11
   gzo3hT4/gvfiYTYXN5+jB+1njlg5PU4Fjac7ecMuE2Yq5Xr7faKP4dYBc
   NlY0CXQLeGPfdD59g7qOGqmiUt0VBssOpyj9vmClQRH8bRgb/txU0yJ8+
   TV8LYvdO8lZWfe/VPV/TTe0SGvNfePBSlC3Ei27U6hNXFCNQl0a2pl0WU
   0W1M54oZjlu1rQlt/NmUi8/mtU1X+wpZ1FeTLjl4fVJd0fgvlpXD1PRRc
   7j+x4yYUEPakPYL/fWSbHsDEUaKUFTTm2z0jLUynWQM8TccTG8cB5Rr7m
   w==;
X-CSE-ConnectionGUID: 3ShMDyDMTg+urGBUb+c+KA==
X-CSE-MsgGUID: lgS3Uyv9TJ+IaBpr4JVXAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="110163587"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="110163587"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 02:32:25 -0700
X-CSE-ConnectionGUID: Je2ryJCdSMyTjSLsKQtoGQ==
X-CSE-MsgGUID: CgtSzv6dQ5u2EktFcogRmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="268487655"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2026 02:32:24 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvXE5-00000000cqI-2Hl0;
	Sun, 16 Aug 2026 09:32:21 +0000
Date: Sun, 16 Aug 2026 17:31:21 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 114/217]
 drivers/regulator/da9055-regulator.c:77:26: error: field 'reg_rselect' has
 incomplete type
Message-ID: <202608161718.qy3xohxH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_023227_392121_57229020 
X-CRM114-Status: GOOD (  17.49  )
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260816/202608161718.qy3xohxH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161718.qy3xohxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161718.qy3xohxH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/da9055-regulator.c:77:26: error: field 'reg_rselect' has incomplete type
      77 |         enum gpio_select reg_rselect;
         |                          ^~~~~~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_set_voltage_sel':
>> drivers/regulator/da9055-regulator.c:208:39: error: 'NO_GPIO' undeclared (first use in this function)
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
>> drivers/regulator/da9055-regulator.c:466:42: error: 'pdata' undeclared (first use in this function); did you mean '_data'?
     466 |                 regulator->reg_rselect = pdata->reg_rsel[id];
         |                                          ^~~~~
         |                                          _data
   drivers/regulator/da9055-regulator.c:417:33: warning: parameter 'id' set but not used [-Wunused-but-set-parameter=]
     417 |                             int id)
         |                             ~~~~^~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kcsan-checks.h:14,
                    from include/asm-generic/barrier.h:17,
                    from arch/alpha/include/asm/barrier.h:21,
                    from arch/alpha/include/asm/rwonce.h:10,
                    from include/linux/compiler.h:369,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/regulator/da9055-regulator.c:9:
   drivers/regulator/da9055-regulator.c: In function 'da9055_regulator_probe':
>> include/linux/stddef.h:8:14: error: passing argument 4 of 'da9055_gpio_init' makes integer from pointer without a cast [-Wint-conversion]
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
>> drivers/regulator/da9055-regulator.c:534:15: error: too many arguments to function 'da9055_gpio_init'; expected 4, have 5
     534 |         ret = da9055_gpio_init(&pdev->dev, regulator, &config, NULL, pdev->id);
         |               ^~~~~~~~~~~~~~~~                                       ~~~~~~~~
   drivers/regulator/da9055-regulator.c:414:12: note: declared here
     414 | static int da9055_gpio_init(struct device *dev,
         |            ^~~~~~~~~~~~~~~~
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_disable':
   drivers/regulator/da9055-regulator.c:287:1: warning: control reaches end of non-void function [-Wreturn-type]
     287 | }
         | ^
   drivers/regulator/da9055-regulator.c: In function 'da9055_suspend_enable':
   drivers/regulator/da9055-regulator.c:274:1: warning: control reaches end of non-void function [-Wreturn-type]
     274 | }
         | ^


vim +/reg_rselect +77 drivers/regulator/da9055-regulator.c

f6130be652d0b4f Ashish Jangam       2012-11-01   72  
f6130be652d0b4f Ashish Jangam       2012-11-01   73  struct da9055_regulator {
f6130be652d0b4f Ashish Jangam       2012-11-01   74  	struct da9055 *da9055;
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09   75  	const struct da9055_regulator_info *info;
f6130be652d0b4f Ashish Jangam       2012-11-01   76  	struct regulator_dev *rdev;
f6130be652d0b4f Ashish Jangam       2012-11-01  @77  	enum gpio_select reg_rselect;
f6130be652d0b4f Ashish Jangam       2012-11-01   78  };
f6130be652d0b4f Ashish Jangam       2012-11-01   79  
f6130be652d0b4f Ashish Jangam       2012-11-01   80  static unsigned int da9055_buck_get_mode(struct regulator_dev *rdev)
f6130be652d0b4f Ashish Jangam       2012-11-01   81  {
f6130be652d0b4f Ashish Jangam       2012-11-01   82  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09   83  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01   84  	int ret, mode = 0;
f6130be652d0b4f Ashish Jangam       2012-11-01   85  
f6130be652d0b4f Ashish Jangam       2012-11-01   86  	ret = da9055_reg_read(regulator->da9055, info->mode.reg);
f6130be652d0b4f Ashish Jangam       2012-11-01   87  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01   88  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01   89  
f6130be652d0b4f Ashish Jangam       2012-11-01   90  	switch ((ret & info->mode.mask) >> info->mode.shift) {
f6130be652d0b4f Ashish Jangam       2012-11-01   91  	case DA9055_BUCK_MODE_SYNC:
f6130be652d0b4f Ashish Jangam       2012-11-01   92  		mode = REGULATOR_MODE_FAST;
f6130be652d0b4f Ashish Jangam       2012-11-01   93  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01   94  	case DA9055_BUCK_MODE_AUTO:
f6130be652d0b4f Ashish Jangam       2012-11-01   95  		mode = REGULATOR_MODE_NORMAL;
f6130be652d0b4f Ashish Jangam       2012-11-01   96  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01   97  	case DA9055_BUCK_MODE_SLEEP:
f6130be652d0b4f Ashish Jangam       2012-11-01   98  		mode = REGULATOR_MODE_STANDBY;
f6130be652d0b4f Ashish Jangam       2012-11-01   99  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  100  	}
f6130be652d0b4f Ashish Jangam       2012-11-01  101  
f6130be652d0b4f Ashish Jangam       2012-11-01  102  	return mode;
f6130be652d0b4f Ashish Jangam       2012-11-01  103  }
f6130be652d0b4f Ashish Jangam       2012-11-01  104  
f6130be652d0b4f Ashish Jangam       2012-11-01  105  static int da9055_buck_set_mode(struct regulator_dev *rdev,
f6130be652d0b4f Ashish Jangam       2012-11-01  106  					unsigned int mode)
f6130be652d0b4f Ashish Jangam       2012-11-01  107  {
f6130be652d0b4f Ashish Jangam       2012-11-01  108  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  109  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  110  	int val = 0;
f6130be652d0b4f Ashish Jangam       2012-11-01  111  
f6130be652d0b4f Ashish Jangam       2012-11-01  112  	switch (mode) {
f6130be652d0b4f Ashish Jangam       2012-11-01  113  	case REGULATOR_MODE_FAST:
f6130be652d0b4f Ashish Jangam       2012-11-01  114  		val = DA9055_BUCK_MODE_SYNC << info->mode.shift;
f6130be652d0b4f Ashish Jangam       2012-11-01  115  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  116  	case REGULATOR_MODE_NORMAL:
f6130be652d0b4f Ashish Jangam       2012-11-01  117  		val = DA9055_BUCK_MODE_AUTO << info->mode.shift;
f6130be652d0b4f Ashish Jangam       2012-11-01  118  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  119  	case REGULATOR_MODE_STANDBY:
f6130be652d0b4f Ashish Jangam       2012-11-01  120  		val = DA9055_BUCK_MODE_SLEEP << info->mode.shift;
f6130be652d0b4f Ashish Jangam       2012-11-01  121  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  122  	}
f6130be652d0b4f Ashish Jangam       2012-11-01  123  
f6130be652d0b4f Ashish Jangam       2012-11-01  124  	return da9055_reg_update(regulator->da9055, info->mode.reg,
f6130be652d0b4f Ashish Jangam       2012-11-01  125  				 info->mode.mask, val);
f6130be652d0b4f Ashish Jangam       2012-11-01  126  }
f6130be652d0b4f Ashish Jangam       2012-11-01  127  
f6130be652d0b4f Ashish Jangam       2012-11-01  128  static unsigned int da9055_ldo_get_mode(struct regulator_dev *rdev)
f6130be652d0b4f Ashish Jangam       2012-11-01  129  {
f6130be652d0b4f Ashish Jangam       2012-11-01  130  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  131  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  132  	int ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  133  
f6130be652d0b4f Ashish Jangam       2012-11-01  134  	ret = da9055_reg_read(regulator->da9055, info->volt.reg_b);
f6130be652d0b4f Ashish Jangam       2012-11-01  135  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  136  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  137  
f6130be652d0b4f Ashish Jangam       2012-11-01  138  	if (ret >> info->volt.sl_shift)
f6130be652d0b4f Ashish Jangam       2012-11-01  139  		return REGULATOR_MODE_STANDBY;
f6130be652d0b4f Ashish Jangam       2012-11-01  140  	else
f6130be652d0b4f Ashish Jangam       2012-11-01  141  		return REGULATOR_MODE_NORMAL;
f6130be652d0b4f Ashish Jangam       2012-11-01  142  }
f6130be652d0b4f Ashish Jangam       2012-11-01  143  
f6130be652d0b4f Ashish Jangam       2012-11-01  144  static int da9055_ldo_set_mode(struct regulator_dev *rdev, unsigned int mode)
f6130be652d0b4f Ashish Jangam       2012-11-01  145  {
f6130be652d0b4f Ashish Jangam       2012-11-01  146  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  147  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  148  	struct da9055_volt_reg volt = info->volt;
f6130be652d0b4f Ashish Jangam       2012-11-01  149  	int val = 0;
f6130be652d0b4f Ashish Jangam       2012-11-01  150  
f6130be652d0b4f Ashish Jangam       2012-11-01  151  	switch (mode) {
f6130be652d0b4f Ashish Jangam       2012-11-01  152  	case REGULATOR_MODE_NORMAL:
f6130be652d0b4f Ashish Jangam       2012-11-01  153  	case REGULATOR_MODE_FAST:
f6130be652d0b4f Ashish Jangam       2012-11-01  154  		val = DA9055_LDO_MODE_SYNC;
f6130be652d0b4f Ashish Jangam       2012-11-01  155  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  156  	case REGULATOR_MODE_STANDBY:
f6130be652d0b4f Ashish Jangam       2012-11-01  157  		val = DA9055_LDO_MODE_SLEEP;
f6130be652d0b4f Ashish Jangam       2012-11-01  158  		break;
f6130be652d0b4f Ashish Jangam       2012-11-01  159  	}
f6130be652d0b4f Ashish Jangam       2012-11-01  160  
f6130be652d0b4f Ashish Jangam       2012-11-01  161  	return da9055_reg_update(regulator->da9055, volt.reg_b,
f6130be652d0b4f Ashish Jangam       2012-11-01  162  				 1 << volt.sl_shift,
f6130be652d0b4f Ashish Jangam       2012-11-01  163  				 val << volt.sl_shift);
f6130be652d0b4f Ashish Jangam       2012-11-01  164  }
f6130be652d0b4f Ashish Jangam       2012-11-01  165  
f6130be652d0b4f Ashish Jangam       2012-11-01  166  static int da9055_regulator_get_voltage_sel(struct regulator_dev *rdev)
f6130be652d0b4f Ashish Jangam       2012-11-01  167  {
f6130be652d0b4f Ashish Jangam       2012-11-01  168  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  169  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  170  	struct da9055_volt_reg volt = info->volt;
f6130be652d0b4f Ashish Jangam       2012-11-01  171  	int ret, sel;
f6130be652d0b4f Ashish Jangam       2012-11-01  172  
f6130be652d0b4f Ashish Jangam       2012-11-01  173  	/*
f6130be652d0b4f Ashish Jangam       2012-11-01  174  	 * There are two voltage register set A & B for voltage ramping but
f6130be652d0b4f Ashish Jangam       2012-11-01  175  	 * either one of then can be active therefore we first determine
f6130be652d0b4f Ashish Jangam       2012-11-01  176  	 * the active register set.
f6130be652d0b4f Ashish Jangam       2012-11-01  177  	 */
f6130be652d0b4f Ashish Jangam       2012-11-01  178  	ret = da9055_reg_read(regulator->da9055, info->conf.reg);
f6130be652d0b4f Ashish Jangam       2012-11-01  179  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  180  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  181  
f6130be652d0b4f Ashish Jangam       2012-11-01  182  	ret &= info->conf.sel_mask;
f6130be652d0b4f Ashish Jangam       2012-11-01  183  
f6130be652d0b4f Ashish Jangam       2012-11-01  184  	/* Get the voltage for the active register set A/B */
f6130be652d0b4f Ashish Jangam       2012-11-01  185  	if (ret == DA9055_REGUALTOR_SET_A)
f6130be652d0b4f Ashish Jangam       2012-11-01  186  		ret = da9055_reg_read(regulator->da9055, volt.reg_a);
f6130be652d0b4f Ashish Jangam       2012-11-01  187  	else
f6130be652d0b4f Ashish Jangam       2012-11-01  188  		ret = da9055_reg_read(regulator->da9055, volt.reg_b);
f6130be652d0b4f Ashish Jangam       2012-11-01  189  
f6130be652d0b4f Ashish Jangam       2012-11-01  190  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  191  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  192  
f6130be652d0b4f Ashish Jangam       2012-11-01  193  	sel = (ret & volt.v_mask);
f6130be652d0b4f Ashish Jangam       2012-11-01  194  	return sel;
f6130be652d0b4f Ashish Jangam       2012-11-01  195  }
f6130be652d0b4f Ashish Jangam       2012-11-01  196  
f6130be652d0b4f Ashish Jangam       2012-11-01  197  static int da9055_regulator_set_voltage_sel(struct regulator_dev *rdev,
f6130be652d0b4f Ashish Jangam       2012-11-01  198  					    unsigned int selector)
f6130be652d0b4f Ashish Jangam       2012-11-01  199  {
f6130be652d0b4f Ashish Jangam       2012-11-01  200  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  201  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  202  	int ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  203  
f6130be652d0b4f Ashish Jangam       2012-11-01  204  	/*
f6130be652d0b4f Ashish Jangam       2012-11-01  205  	 * Regulator register set A/B is not selected through GPIO therefore
f6130be652d0b4f Ashish Jangam       2012-11-01  206  	 * we use default register set A for voltage ramping.
f6130be652d0b4f Ashish Jangam       2012-11-01  207  	 */
f6130be652d0b4f Ashish Jangam       2012-11-01 @208  	if (regulator->reg_rselect == NO_GPIO) {
f6130be652d0b4f Ashish Jangam       2012-11-01  209  		/* Select register set A */
f6130be652d0b4f Ashish Jangam       2012-11-01  210  		ret = da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4f Ashish Jangam       2012-11-01  211  					info->conf.sel_mask, DA9055_SEL_REG_A);
f6130be652d0b4f Ashish Jangam       2012-11-01  212  		if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  213  			return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  214  
f6130be652d0b4f Ashish Jangam       2012-11-01  215  		/* Set the voltage */
369cf602f364a60 Axel Lin            2012-11-20  216  		return da9055_reg_update(regulator->da9055, info->volt.reg_a,
369cf602f364a60 Axel Lin            2012-11-20  217  					 info->volt.v_mask, selector);
f6130be652d0b4f Ashish Jangam       2012-11-01  218  	}
f6130be652d0b4f Ashish Jangam       2012-11-01  219  
f6130be652d0b4f Ashish Jangam       2012-11-01  220  	/*
f6130be652d0b4f Ashish Jangam       2012-11-01  221  	 * Here regulator register set A/B is selected through GPIO.
f6130be652d0b4f Ashish Jangam       2012-11-01  222  	 * Therefore we first determine the selected register set A/B and
f6130be652d0b4f Ashish Jangam       2012-11-01  223  	 * then set the desired voltage for that register set A/B.
f6130be652d0b4f Ashish Jangam       2012-11-01  224  	 */
f6130be652d0b4f Ashish Jangam       2012-11-01  225  	ret = da9055_reg_read(regulator->da9055, info->conf.reg);
f6130be652d0b4f Ashish Jangam       2012-11-01  226  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  227  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  228  
f6130be652d0b4f Ashish Jangam       2012-11-01  229  	ret &= info->conf.sel_mask;
f6130be652d0b4f Ashish Jangam       2012-11-01  230  
f6130be652d0b4f Ashish Jangam       2012-11-01  231  	/* Set the voltage */
f6130be652d0b4f Ashish Jangam       2012-11-01  232  	if (ret == DA9055_REGUALTOR_SET_A)
369cf602f364a60 Axel Lin            2012-11-20  233  		return da9055_reg_update(regulator->da9055, info->volt.reg_a,
369cf602f364a60 Axel Lin            2012-11-20  234  					 info->volt.v_mask, selector);
f6130be652d0b4f Ashish Jangam       2012-11-01  235  	else
369cf602f364a60 Axel Lin            2012-11-20  236  		return da9055_reg_update(regulator->da9055, info->volt.reg_b,
369cf602f364a60 Axel Lin            2012-11-20  237  					 info->volt.v_mask, selector);
f6130be652d0b4f Ashish Jangam       2012-11-01  238  }
f6130be652d0b4f Ashish Jangam       2012-11-01  239  
f6130be652d0b4f Ashish Jangam       2012-11-01  240  static int da9055_regulator_set_suspend_voltage(struct regulator_dev *rdev,
f6130be652d0b4f Ashish Jangam       2012-11-01  241  						int uV)
f6130be652d0b4f Ashish Jangam       2012-11-01  242  {
f6130be652d0b4f Ashish Jangam       2012-11-01  243  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  244  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  245  	int ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  246  
f6130be652d0b4f Ashish Jangam       2012-11-01  247  	/* Select register set B for suspend voltage ramping. */
f6130be652d0b4f Ashish Jangam       2012-11-01  248  	if (regulator->reg_rselect == NO_GPIO) {
f6130be652d0b4f Ashish Jangam       2012-11-01  249  		ret = da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4f Ashish Jangam       2012-11-01  250  					info->conf.sel_mask, DA9055_SEL_REG_B);
f6130be652d0b4f Ashish Jangam       2012-11-01  251  		if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  252  			return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  253  	}
f6130be652d0b4f Ashish Jangam       2012-11-01  254  
6b1f8a45666877d Axel Lin            2012-11-27  255  	ret = regulator_map_voltage_linear(rdev, uV, uV);
f6130be652d0b4f Ashish Jangam       2012-11-01  256  	if (ret < 0)
f6130be652d0b4f Ashish Jangam       2012-11-01  257  		return ret;
f6130be652d0b4f Ashish Jangam       2012-11-01  258  
369cf602f364a60 Axel Lin            2012-11-20  259  	return da9055_reg_update(regulator->da9055, info->volt.reg_b,
369cf602f364a60 Axel Lin            2012-11-20  260  				 info->volt.v_mask, ret);
f6130be652d0b4f Ashish Jangam       2012-11-01  261  }
f6130be652d0b4f Ashish Jangam       2012-11-01  262  
f6130be652d0b4f Ashish Jangam       2012-11-01  263  static int da9055_suspend_enable(struct regulator_dev *rdev)
f6130be652d0b4f Ashish Jangam       2012-11-01  264  {
f6130be652d0b4f Ashish Jangam       2012-11-01  265  	struct da9055_regulator *regulator = rdev_get_drvdata(rdev);
dfa9e708c63e783 Krzysztof Kozlowski 2024-09-09  266  	const struct da9055_regulator_info *info = regulator->info;
f6130be652d0b4f Ashish Jangam       2012-11-01  267  
f6130be652d0b4f Ashish Jangam       2012-11-01  268  	/* Select register set B for voltage ramping. */
f6130be652d0b4f Ashish Jangam       2012-11-01 @269  	if (regulator->reg_rselect == NO_GPIO)
f6130be652d0b4f Ashish Jangam       2012-11-01  270  		return da9055_reg_update(regulator->da9055, info->conf.reg,
f6130be652d0b4f Ashish Jangam       2012-11-01  271  					info->conf.sel_mask, DA9055_SEL_REG_B);
f6130be652d0b4f Ashish Jangam       2012-11-01  272  	else
f6130be652d0b4f Ashish Jangam       2012-11-01  273  		return 0;
f6130be652d0b4f Ashish Jangam       2012-11-01  274  }
f6130be652d0b4f Ashish Jangam       2012-11-01  275  

:::::: The code at line 77 was first introduced by commit
:::::: f6130be652d0b4fbf710d83a816298c007e59ed1 regulator: DA9055 regulator driver

:::::: TO: Ashish Jangam <ashish.jangam@kpitcummins.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

