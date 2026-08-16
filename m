Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7D9C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9+YIHxqjmqGI2SfqyqOm1ATS0+Iqsj6aJ9vTZbp1m5w=; b=mWCwc45PIQ6SP3fLFGyHsWmJgy
	/NLzynGMeVmvp7UI+eqEnZKCFpbrR8qGASc2C8hzPtKIuPTvuxbtkMZ11KLNfQAL/aOO9yDNBl0aV
	PvLd0df4BNGGKOFzdy+lyK/KSU+c7KxMHpy0+4vaeEbgOv9+w2G61rpC0qH5YeKrdkWYE97h1CR4p
	LjmaCEcm+6pJYwEy0gByhEfIiCjuvSTlbe4WYClJerTve+qoDNRzu7CpXwFLQg3v+IxpIQB0umczW
	Z+j0rZIJqPRgEnmuvs7RnppNZ26CFq8fibsyH9lD16SAPNGZt1gF4b+wXrxbIZk68L3XrDR8DxH/M
	+tsEGwqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvdr9-00000004tuS-0Enn;
	Sun, 16 Aug 2026 16:37:07 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvdr6-00000004tty-0Dpj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 16:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786898224; x=1818434224;
  h=date:from:to:cc:subject:message-id;
  bh=LUT1X5gNR2zGDfqYMkVCXmcxX/qUeGz6V976KRKVfRY=;
  b=MGNzomsX5BMGQHWjA88H1ckpnvUOd2230HJJrU/3iUGJszzfofyE/d/y
   +B4S3hUph7cSvVjsBdsf42xhm8xs4kFdnAbdIgXUHV9ehYs7FirKb43/h
   BVnl1GKO5Cv//ij5sb00Bu3spo6s5USnn+SgLIB6+6UZbJw5yiFXQERx2
   PdkoeCF6Es6CWK3Yp1lyRb8yLKbc8baCHoBaaU7zfL21AN3jDG9BQC/vA
   R9r5XBGXwRpJo4WqF1+8VdaS7+EF67sbKESM94dU/kPS2o36GiG3JLhYC
   8c3AAU75Xmp1P1sj/l1c0eTOvxoh2LBjB7nYPgQa/ogxEXILGP1fw5yds
   A==;
X-CSE-ConnectionGUID: N72ecGC3T4KHoUJaC1H8Cw==
X-CSE-MsgGUID: 9TVzFKaKQx2YgvwTNCzytA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="91204014"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="91204014"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 09:37:02 -0700
X-CSE-ConnectionGUID: TOdTP/B7TzyXdNk/171kAg==
X-CSE-MsgGUID: Zer9avPYT1Sp+4uQ96tO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="264747119"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2026 09:37:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvdr0-00000000d0M-1OwO;
	Sun, 16 Aug 2026 16:36:58 +0000
Date: Mon, 17 Aug 2026 00:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 154/217] drivers/mfd/max8925-i2c.c:146:9:
 error: 'ret' undeclared; did you mean 'net'?
Message-ID: <202608170025.qu8rAquT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_093704_137043_43D77F0F 
X-CRM114-Status: GOOD (  13.28  )
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
commit: a4e72f5a88a6efa6a9edbb7e22c08bb45fd91940 [154/217] mfd: max8925: remove platform data probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260817/202608170025.qu8rAquT-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170025.qu8rAquT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170025.qu8rAquT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/max8925-i2c.c: In function 'max8925_probe':
>> drivers/mfd/max8925-i2c.c:146:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     146 |         ret = of_property_read_u32(np, "maxim,tsc-irq", &chip->tsc_irq);
         |         ^~~
         |         net
   drivers/mfd/max8925-i2c.c:146:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/mfd/max8925-i2c.c:146:36: error: 'np' undeclared (first use in this function); did you mean 'up'?
     146 |         ret = of_property_read_u32(np, "maxim,tsc-irq", &chip->tsc_irq);
         |                                    ^~
         |                                    up
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/mfd/max8925-i2c.c:10:
>> drivers/mfd/max8925-i2c.c:148:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     148 |                 dev_err(dev, "Not found maxim,tsc-irq property\n");
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/mfd/max8925-i2c.c:148:17: note: in expansion of macro 'dev_err'
     148 |                 dev_err(dev, "Not found maxim,tsc-irq property\n");
         |                 ^~~~~~~
   drivers/mfd/max8925-i2c.c:137:29: warning: unused variable 'node' [-Wunused-variable]
     137 |         struct device_node *node = client->dev.of_node;
         |                             ^~~~


vim +146 drivers/mfd/max8925-i2c.c

   133	
   134	static int max8925_probe(struct i2c_client *client)
   135	{
   136		struct max8925_chip *chip;
   137		struct device_node *node = client->dev.of_node;
   138		int tsc_irq;
   139	
   140		chip = devm_kzalloc(&client->dev,
   141				    sizeof(struct max8925_chip), GFP_KERNEL);
   142		if (chip == NULL)
   143			return -ENOMEM;
   144	
   145		/* parse DT to get platform data */
 > 146		ret = of_property_read_u32(np, "maxim,tsc-irq", &chip->tsc_irq);
   147		if (ret) {
 > 148			dev_err(dev, "Not found maxim,tsc-irq property\n");
   149			return -EINVAL;
   150		}
   151	
   152		chip->i2c = client;
   153		chip->dev = &client->dev;
   154		i2c_set_clientdata(client, chip);
   155		mutex_init(&chip->io_lock);
   156	
   157		chip->rtc = i2c_new_dummy_device(chip->i2c->adapter, RTC_I2C_ADDR);
   158		if (IS_ERR(chip->rtc)) {
   159			dev_err(chip->dev, "Failed to allocate I2C device for RTC\n");
   160			return PTR_ERR(chip->rtc);
   161		}
   162		i2c_set_clientdata(chip->rtc, chip);
   163	
   164		chip->adc = i2c_new_dummy_device(chip->i2c->adapter, ADC_I2C_ADDR);
   165		if (IS_ERR(chip->adc)) {
   166			dev_err(chip->dev, "Failed to allocate I2C device for ADC\n");
   167			i2c_unregister_device(chip->rtc);
   168			return PTR_ERR(chip->adc);
   169		}
   170		i2c_set_clientdata(chip->adc, chip);
   171	
   172		device_init_wakeup(&client->dev, 1);
   173	
   174		max8925_device_init(chip, tsc_irq);
   175	
   176		return 0;
   177	}
   178	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

