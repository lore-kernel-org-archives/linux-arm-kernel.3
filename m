Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72756C5DF6E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7QP5ptzx1AYKLeAKEX1U1n9MMn7duYAguHBKnMXSIHE=; b=c+tM2KbGT4Bi3DGlnrujOs/pMm
	Ompo4YtXIXKWy/udlTgUDy2VXExZF8zwBmXxTT1lskYch2rELZvWB1M3F/VFdbzcuZtSMiejhBBS4
	l4Np1B33gmPYlaFcK0/W5jG5GuEqMzLfI8gTDrgcgn1LMdgs4n9YCYzYY36a+kzUByIaUz8WmWpVg
	uwivo1ATDAyg+v9pfrWpBFlH63uWKx5e5anDvJlwkG3EyygvY36NNJtO4BvA6uUiBp26MnTFFbEOI
	V0W1fjMupuciXnaUQ3YlpD3WDvAt/owjEr/IqOXq6clbXz9wsAuxNxr9U10t38N5vpO2wJO8aorg8
	9iYIJymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wva15-00000004knr-2GzH;
	Sun, 16 Aug 2026 12:31:07 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wva12-00000004kn8-1z6c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 12:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786883464; x=1818419464;
  h=date:from:to:cc:subject:message-id;
  bh=kD8QPIAM6isSShq79uOPcWa3mIUPFU0Gob/Cq6gxC2g=;
  b=CoSUlkTNOoAu65o/1YyWHOv4ffaUu6eo26IYXP7FbrJg8pmVP2iWn2lh
   +SWpvqlnJv8Z9GBqRZGnNCez6Y2FNWY2JCQ+2HXZpisYd3O9gJ2VruAl2
   1OxlR+RBRydfBzlpq4NdDZSXNQF4aKSjPT8xVn5yO8NoSIe9wEvVIT5iM
   XinqKarODQQMstv2ElW+1cF53HZ4Bqi+bDs8Fx+1YhZ2fFvvJ96NeAsm8
   zkns2UnjX5FpRDBeq5JoZE4Bbh7uZydeRLJ0ZXNkMlcTfCMOnZ9T/jzqv
   2Ilwj5MydqlqiL1ykhjm+NpBXAMRDn68M6aB/KSxgxUC+KXOHTbPCrjpq
   w==;
X-CSE-ConnectionGUID: kAiEIFNVSH2qWH5IsCCqlw==
X-CSE-MsgGUID: xOJkenMMTTqdOygaOih8Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87303950"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87303950"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 05:31:03 -0700
X-CSE-ConnectionGUID: NDwx8DRqSiyYIRRLWbH/hw==
X-CSE-MsgGUID: jfARQYuRTtGVvVochLY/HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="260445846"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Aug 2026 05:31:01 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wva0w-00000000csk-1k4x;
	Sun, 16 Aug 2026 12:30:58 +0000
Date: Sun, 16 Aug 2026 20:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 154/217] drivers/mfd/max8925-core.c:44:30:
 warning: 'touch_devs' defined but not used
Message-ID: <202608162020.9k7w3mbZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_053104_579267_A8B23F53 
X-CRM114-Status: GOOD (  14.58  )
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260816/202608162020.9k7w3mbZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608162020.9k7w3mbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608162020.9k7w3mbZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/max8925-core.c:44:30: warning: 'touch_devs' defined but not used [-Wunused-const-variable=]
      44 | static const struct mfd_cell touch_devs[] = {
         |                              ^~~~~~~~~~
--
   drivers/mfd/max8925-i2c.c: In function 'max8925_probe':
   drivers/mfd/max8925-i2c.c:146:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     146 |         ret = of_property_read_u32(np, "maxim,tsc-irq", &chip->tsc_irq);
         |         ^~~
         |         net
   drivers/mfd/max8925-i2c.c:146:9: note: each undeclared identifier is reported only once for each function it appears in
   drivers/mfd/max8925-i2c.c:146:36: error: 'np' undeclared (first use in this function); did you mean 'up'?
     146 |         ret = of_property_read_u32(np, "maxim,tsc-irq", &chip->tsc_irq);
         |                                    ^~
         |                                    up
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/mfd/max8925-i2c.c:10:
   drivers/mfd/max8925-i2c.c:148:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     148 |                 dev_err(dev, "Not found maxim,tsc-irq property\n");
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/mfd/max8925-i2c.c:148:17: note: in expansion of macro 'dev_err'
     148 |                 dev_err(dev, "Not found maxim,tsc-irq property\n");
         |                 ^~~~~~~
>> drivers/mfd/max8925-i2c.c:137:29: warning: unused variable 'node' [-Wunused-variable]
     137 |         struct device_node *node = client->dev.of_node;
         |                             ^~~~


vim +/touch_devs +44 drivers/mfd/max8925-core.c

1ad998934e9c6c Haojian Zhuang     2010-01-08  43  
7c0517b1716bc1 Geert Uytterhoeven 2013-11-18 @44  static const struct mfd_cell touch_devs[] = {
1ad998934e9c6c Haojian Zhuang     2010-01-08  45  	{
1ad998934e9c6c Haojian Zhuang     2010-01-08  46  		.name		= "max8925-touch",
1ad998934e9c6c Haojian Zhuang     2010-01-08  47  		.num_resources	= 1,
1ad998934e9c6c Haojian Zhuang     2010-01-08  48  		.resources	= &touch_resources[0],
1ad998934e9c6c Haojian Zhuang     2010-01-08  49  		.id		= -1,
1ad998934e9c6c Haojian Zhuang     2010-01-08  50  	},
1ad998934e9c6c Haojian Zhuang     2010-01-08  51  };
1ad998934e9c6c Haojian Zhuang     2010-01-08  52  

:::::: The code at line 44 was first introduced by commit
:::::: 7c0517b1716bc1aa873064290401a8ce2fbabc32 mfd: maxim: Constify struct mfd_cell where possible

:::::: TO: Geert Uytterhoeven <geert@linux-m68k.org>
:::::: CC: Lee Jones <lee.jones@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

