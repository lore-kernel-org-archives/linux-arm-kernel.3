Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACC8C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 06:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RiYh7I4Oq0vp/nuHYsyB5cUr1VBs/Sl1C/Du/luO37w=; b=valPoruTunUPg2M6lJTMBxfiD1
	mNZBaBS4BviE9zJ7sSV+tY44UB2i8YXeNpKSrT3lpCRsecUAIt08L3z+6BJbOUVM1S/iiefE6/CH8
	TOsgyvUL1iZ84AW4HbIc4GBSeOSpF8vRCeXjeTTe6hrySRR1ZyEL20UwUS1ASijz7Hkk0RsObddnJ
	vQEq3YKp8cWdnpqVhNySWLWv7Pz2CoDGxq3GoXDOmYd5cH6MiRAHlPFJX3PqAka7mdYskbRvoXVAl
	9Q+MkinaKFh0h5AXOLflKcHKGjAiVcmwj+aobkXIU1hnOFCnSi527BEXc8jGjTLAwXFjOStJbiUXV
	sR4Qcs3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZVG-0000000941a-2ek8;
	Wed, 19 Aug 2026 06:10:23 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZV9-0000000940i-3LnN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 06:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787119816; x=1818655816;
  h=date:from:to:cc:subject:message-id;
  bh=TmOHFK4T8w9GQlQdpithi5wUjMH32Z8usQrYLn2tblA=;
  b=mDq8fCIwM4Qs0awoU4dH6BZu1VkEGPTnfDzgxt+ONvtzhOf9fFeKVAO+
   nbV7eVvQ/TK4m1T77NvVSZ0nJbOXDW1YqkIfHf6cYWa8Ex4MY6Pt/1BWj
   yb3V9AXRwM8Lh6LNm0ch/ec0vURFWXi2YkCfW/kK86PPcXymeWpAS1fiE
   BitHWSpSd+OnqzoI0ArcS+zSd+JFyWMJsAmfW5olYeGfvLZbY9ZKpto+C
   zTWCEQRXSHpuVHgFWuCl60rR8EKb3SiE3sQ/I4ko96oQtFFKbUAq6Yb4b
   7Au78eU8lICZCcN5V6sdBIVKEKOmpCIS3mwhJLmEURImKhUo30+eWbaKM
   A==;
X-CSE-ConnectionGUID: AOwMUNu3SxOX5wx2TtmdaA==
X-CSE-MsgGUID: LP09GZl/Qcu/4Kr75liCfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87538592"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="87538592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:09:38 -0700
X-CSE-ConnectionGUID: taugNEcVT4egK7ZZU+ScvQ==
X-CSE-MsgGUID: Wu+ZxQYCRIWFRdi0ILmXCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269719920"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Aug 2026 23:09:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwZUS-00000000evo-2uxt;
	Wed, 19 Aug 2026 06:09:32 +0000
Date: Wed, 19 Aug 2026 14:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove 137/200] drivers/mfd/max8925-i2c.c:175:28:
 warning: variable 'tsc_irq' is uninitialized when used here
Message-ID: <202608191428.rYgVrQ4k-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_231016_608030_A1B3DDAE 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
commit: cdd7cbf79d6c020c83a34985cae63f91f8f8a4c9 [137/200] mfd: max8925: remove platform data probing
config: i386-randconfig-016-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191428.rYgVrQ4k-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191428.rYgVrQ4k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191428.rYgVrQ4k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/max8925-i2c.c:175:28: warning: variable 'tsc_irq' is uninitialized when used here [-Wuninitialized]
     175 |         max8925_device_init(chip, tsc_irq);
         |                                   ^~~~~~~
   drivers/mfd/max8925-i2c.c:138:13: note: initialize the variable 'tsc_irq' to silence this warning
     138 |         int tsc_irq;
         |                    ^
         |                     = 0
   1 warning generated.


vim +/tsc_irq +175 drivers/mfd/max8925-i2c.c

   133	
   134	static int max8925_probe(struct i2c_client *client)
   135	{
   136		struct max8925_chip *chip;
   137		struct device_node *node = client->dev.of_node;
   138		int tsc_irq;
   139		int ret;
   140	
   141		chip = devm_kzalloc(&client->dev,
   142				    sizeof(struct max8925_chip), GFP_KERNEL);
   143		if (chip == NULL)
   144			return -ENOMEM;
   145	
   146		/* parse DT to get platform data */
   147		ret = of_property_read_u32(node, "maxim,tsc-irq", &chip->tsc_irq);
   148		if (ret) {
   149			dev_err(&client->dev, "Not found maxim,tsc-irq property\n");
   150			return -EINVAL;
   151		}
   152	
   153		chip->i2c = client;
   154		chip->dev = &client->dev;
   155		i2c_set_clientdata(client, chip);
   156		mutex_init(&chip->io_lock);
   157	
   158		chip->rtc = i2c_new_dummy_device(chip->i2c->adapter, RTC_I2C_ADDR);
   159		if (IS_ERR(chip->rtc)) {
   160			dev_err(chip->dev, "Failed to allocate I2C device for RTC\n");
   161			return PTR_ERR(chip->rtc);
   162		}
   163		i2c_set_clientdata(chip->rtc, chip);
   164	
   165		chip->adc = i2c_new_dummy_device(chip->i2c->adapter, ADC_I2C_ADDR);
   166		if (IS_ERR(chip->adc)) {
   167			dev_err(chip->dev, "Failed to allocate I2C device for ADC\n");
   168			i2c_unregister_device(chip->rtc);
   169			return PTR_ERR(chip->adc);
   170		}
   171		i2c_set_clientdata(chip->adc, chip);
   172	
   173		device_init_wakeup(&client->dev, 1);
   174	
 > 175		max8925_device_init(chip, tsc_irq);
   176	
   177		return 0;
   178	}
   179	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

