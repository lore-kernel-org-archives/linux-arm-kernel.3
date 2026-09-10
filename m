Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D5BC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x32XE9eOXORPKYvzuNrm3cdAVz+nEPYN5ui+w/zMPu4=; b=dzTGAVpZwoFA7CNGw9onFz+AGF
	30xIZz0WticIDRK2ifQNLGVOHYKqv2aFAnere4pOAAk2sw+U1apC1b6x27UK4Dzoq9VK+vwsRRGrk
	ANfmFFNeXW0IgfJY6ZjDWFGTjYWOVgALzs4TZOqQXLIqRT664Xpc4O1UhuAPw0T9pZAfzblKoD3A1
	G26zl+to2m9asqvhDX/nq4ZhDyYOl4hrxgSq7+cDPjEjIwo/1QB7HXarDICnGhAEALQiIrjgksaga
	/BRXmUkIu9T8/sKEy2XAG+eAmoEZGeK2OgOhGcL/K3qRQIFHVqspz1Aox9msKlu9GOV5wZKJFGVpO
	0JHPaBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4asC-0000000Dpuu-2AB5;
	Thu, 10 Sep 2026 09:15:12 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4as9-0000000Dpu1-22xB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789031709; x=1820567709;
  h=date:from:to:cc:subject:message-id;
  bh=tN+CAfLJT6YMiBD4FrwUdsR3FJnYt0CpRnnqy2E8WM0=;
  b=Gq0Kjpog4B7bNsZf3N3AORBVmm3P7bjH2CoJkNGUmWXp3YpOhsXdql4e
   3YiRU6xwW/LZvPQxtmeeWbrmkiWMSuL8N0uHcokT9S9G6Fuk0D6ZLlWVC
   uJIS1d7sdNQaPw0jrgsbvAA0sycYZ9CBYuWYFc4GZYG9kbVwysSJWpZzV
   x33qRN1aComPsy8Ok/4/4LRg+R+BWTTosLKau4R+MSjlDx050qiKu+Rzc
   LoGXH9I12N7v8zrf2JOVH1EPnvxrRAr+/9vTsjzGkhVyZRLJRsKuOKE/B
   eaSNpic5o6s98FcVQXHiJ+OaXAE5sJpYKOYJTDzhmEf/6l3yBtGsOLlvX
   w==;
X-CSE-ConnectionGUID: WyAev48ZSaKV1jCaDnfuLQ==
X-CSE-MsgGUID: H/Ao0GUWQRG5TkCK2xwDFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89408905"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89408905"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:15:08 -0700
X-CSE-ConnectionGUID: wrEQaj/IRIK1FR1ltkMI+g==
X-CSE-MsgGUID: a5DtEWIBS46svakReqNbbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="276824137"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Sep 2026 02:15:06 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4as4-000000001bg-1OcY;
	Thu, 10 Sep 2026 09:15:04 +0000
Date: Thu, 10 Sep 2026 17:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove-7.3 251/294]
 drivers/leds/leds-da9052.c:104:14: error: dereferencing pointer to incomplete
 type 'struct da9052_pdata'
Message-ID: <202609101731.1CkBqWZb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_021509_620548_52F99478 
X-CRM114-Status: GOOD (  12.44  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   3ac93c1e700558259ea604f7d4f37e26820fba15
commit: 05a9b51265a88cf5d2951982f66d5e5ee799d719 [251/294] leds: remove platform data based probing
config: parisc-randconfig-r134-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101731.1CkBqWZb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101731.1CkBqWZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101731.1CkBqWZb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/leds/leds-da9052.c: In function 'da9052_led_probe':
>> drivers/leds/leds-da9052.c:104:14: error: dereferencing pointer to incomplete type 'struct da9052_pdata'
     pled = pdata->pled;
                 ^~
   drivers/leds/leds-da9052.c: In function 'da9052_led_remove':
   drivers/leds/leds-da9052.c:168:14: error: dereferencing pointer to incomplete type 'struct da9052_pdata'
     pled = pdata->pled;
                 ^~


vim +104 drivers/leds/leds-da9052.c

5ba736311bf6fe David Dajun Chen 2012-05-29   87  
98ea1ea20cb709 Bill Pemberton   2012-11-19   88  static int da9052_led_probe(struct platform_device *pdev)
5ba736311bf6fe David Dajun Chen 2012-05-29   89  {
5ba736311bf6fe David Dajun Chen 2012-05-29   90  	struct da9052_pdata *pdata;
5ba736311bf6fe David Dajun Chen 2012-05-29   91  	struct da9052 *da9052;
5ba736311bf6fe David Dajun Chen 2012-05-29   92  	struct led_platform_data *pled;
5ba736311bf6fe David Dajun Chen 2012-05-29   93  	struct da9052_led *led = NULL;
5ba736311bf6fe David Dajun Chen 2012-05-29   94  	int error = -ENODEV;
5ba736311bf6fe David Dajun Chen 2012-05-29   95  	int i;
5ba736311bf6fe David Dajun Chen 2012-05-29   96  
5ba736311bf6fe David Dajun Chen 2012-05-29   97  	da9052 = dev_get_drvdata(pdev->dev.parent);
87aae1ea82f93f Jingoo Han       2013-07-30   98  	pdata = dev_get_platdata(da9052->dev);
5ba736311bf6fe David Dajun Chen 2012-05-29   99  	if (pdata == NULL) {
5ba736311bf6fe David Dajun Chen 2012-05-29  100  		dev_err(&pdev->dev, "No platform data\n");
5ba736311bf6fe David Dajun Chen 2012-05-29  101  		goto err;
5ba736311bf6fe David Dajun Chen 2012-05-29  102  	}
5ba736311bf6fe David Dajun Chen 2012-05-29  103  
5ba736311bf6fe David Dajun Chen 2012-05-29 @104  	pled = pdata->pled;
5ba736311bf6fe David Dajun Chen 2012-05-29  105  	if (pled == NULL) {
5ba736311bf6fe David Dajun Chen 2012-05-29  106  		dev_err(&pdev->dev, "No platform data for LED\n");
5ba736311bf6fe David Dajun Chen 2012-05-29  107  		goto err;
5ba736311bf6fe David Dajun Chen 2012-05-29  108  	}
5ba736311bf6fe David Dajun Chen 2012-05-29  109  
a86854d0c599b3 Kees Cook        2018-06-12  110  	led = devm_kcalloc(&pdev->dev,
a86854d0c599b3 Kees Cook        2018-06-12  111  			   pled->num_leds, sizeof(struct da9052_led),
5ba736311bf6fe David Dajun Chen 2012-05-29  112  			   GFP_KERNEL);
0c9a03b68511da Xiubo Li         2014-05-07  113  	if (!led) {
5ba736311bf6fe David Dajun Chen 2012-05-29  114  		error = -ENOMEM;
5ba736311bf6fe David Dajun Chen 2012-05-29  115  		goto err;
5ba736311bf6fe David Dajun Chen 2012-05-29  116  	}
5ba736311bf6fe David Dajun Chen 2012-05-29  117  
5ba736311bf6fe David Dajun Chen 2012-05-29  118  	for (i = 0; i < pled->num_leds; i++) {
5ba736311bf6fe David Dajun Chen 2012-05-29  119  		led[i].cdev.name = pled->leds[i].name;
0a1f01d38504dc Andrew Lunn      2015-08-20  120  		led[i].cdev.brightness_set_blocking = da9052_led_set;
5ba736311bf6fe David Dajun Chen 2012-05-29  121  		led[i].cdev.brightness = LED_OFF;
5ba736311bf6fe David Dajun Chen 2012-05-29  122  		led[i].cdev.max_brightness = DA9052_MAX_BRIGHTNESS;
5ba736311bf6fe David Dajun Chen 2012-05-29  123  		led[i].led_index = pled->leds[i].flags;
5ba736311bf6fe David Dajun Chen 2012-05-29  124  		led[i].da9052 = dev_get_drvdata(pdev->dev.parent);
5ba736311bf6fe David Dajun Chen 2012-05-29  125  
5ba736311bf6fe David Dajun Chen 2012-05-29  126  		error = led_classdev_register(pdev->dev.parent, &led[i].cdev);
5ba736311bf6fe David Dajun Chen 2012-05-29  127  		if (error) {
5ba736311bf6fe David Dajun Chen 2012-05-29  128  			dev_err(&pdev->dev, "Failed to register led %d\n",
5ba736311bf6fe David Dajun Chen 2012-05-29  129  				led[i].led_index);
5ba736311bf6fe David Dajun Chen 2012-05-29  130  			goto err_register;
5ba736311bf6fe David Dajun Chen 2012-05-29  131  		}
5ba736311bf6fe David Dajun Chen 2012-05-29  132  
0a1f01d38504dc Andrew Lunn      2015-08-20  133  		error = da9052_set_led_brightness(&led[i],
0a1f01d38504dc Andrew Lunn      2015-08-20  134  						  led[i].cdev.brightness);
5ba736311bf6fe David Dajun Chen 2012-05-29  135  		if (error) {
5ba736311bf6fe David Dajun Chen 2012-05-29  136  			dev_err(&pdev->dev, "Unable to init led %d\n",
5ba736311bf6fe David Dajun Chen 2012-05-29  137  				led[i].led_index);
5ba736311bf6fe David Dajun Chen 2012-05-29  138  			continue;
5ba736311bf6fe David Dajun Chen 2012-05-29  139  		}
5ba736311bf6fe David Dajun Chen 2012-05-29  140  	}
5ba736311bf6fe David Dajun Chen 2012-05-29  141  	error = da9052_configure_leds(led->da9052);
5ba736311bf6fe David Dajun Chen 2012-05-29  142  	if (error) {
5ba736311bf6fe David Dajun Chen 2012-05-29  143  		dev_err(&pdev->dev, "Failed to configure GPIO LED%d\n", error);
5ba736311bf6fe David Dajun Chen 2012-05-29  144  		goto err_register;
5ba736311bf6fe David Dajun Chen 2012-05-29  145  	}
5ba736311bf6fe David Dajun Chen 2012-05-29  146  
5ba736311bf6fe David Dajun Chen 2012-05-29  147  	platform_set_drvdata(pdev, led);
5ba736311bf6fe David Dajun Chen 2012-05-29  148  
5ba736311bf6fe David Dajun Chen 2012-05-29  149  	return 0;
5ba736311bf6fe David Dajun Chen 2012-05-29  150  
5ba736311bf6fe David Dajun Chen 2012-05-29  151  err_register:
0a1f01d38504dc Andrew Lunn      2015-08-20  152  	for (i = i - 1; i >= 0; i--)
5ba736311bf6fe David Dajun Chen 2012-05-29  153  		led_classdev_unregister(&led[i].cdev);
5ba736311bf6fe David Dajun Chen 2012-05-29  154  err:
5ba736311bf6fe David Dajun Chen 2012-05-29  155  	return error;
5ba736311bf6fe David Dajun Chen 2012-05-29  156  }
5ba736311bf6fe David Dajun Chen 2012-05-29  157  

:::::: The code at line 104 was first introduced by commit
:::::: 5ba736311bf6fea25c97e868b7de6d3de8800aba leds: driver for DA9052/53 PMIC v2

:::::: TO: David Dajun Chen <dchen@diasemi.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

