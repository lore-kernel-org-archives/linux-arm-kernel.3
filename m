Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F40C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 00:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AsDpBd372isRzW48/55A3QAr8UBvNqrMPu40ALNMZRw=; b=3OzrRr1Ivch0xy3Xz7f+j+EzBv
	/hkL9Rn7wGEKQMVBLLGGAklhm2qGGN393pp/62ZIseuJ6A+VHqwB5B2RK66v5oOgoCj6u0jZBOn6z
	DEENoMDWnUdHokJK4k+mzeHbczX6JgfQNXIOAVK96tyIJ5K3ngKBoLu5L/P5UM9ufbjiCz6hwK3VJ
	GwPgeRfQeVnWBqVdqtdI/8Ulw7e+VTy+K1vkggVD3i96GLHfJiiDSsJfl+FU11jXTT1M174TqeAG/
	BFCHittG5Jkra6wSCWHUNMhut5sf59eavWx3BtQFR+Fv2XasViAIQo5fLm2EbuxJ40v7likod0964
	QqMaqBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvlWC-00000005EWP-0kj6;
	Mon, 17 Aug 2026 00:48:00 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvlW8-00000005EW3-39Uz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 00:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786927677; x=1818463677;
  h=date:from:to:cc:subject:message-id;
  bh=1PLO5Ilx9TbXwf1yvM93LzKql71nGhWVQD4LOtyYCSw=;
  b=TDcnAKSj2jljGbppTITJIKt1R/R/dRixqroVwDXRMRkxbyFpwKBmitAr
   Ua5QHYZqlxViJTwLaNzbvX25CgdVFNjFqkZP7uXSvER4YdS2p+swk/8+H
   BsUuzCii9fiUApJNVriHPj/ejMrjD64iWj8/Wikm+cgdbF2zmHxczH7jG
   yB+7jh7HmcIbYnTkvUmjUcFRT9eqmwz4T4D0jehL0OO+XI+/KShe+fFNB
   sJaKChmHPhML7vZvMGsOlOo4mgaHGiAR/I7yYLFubDGue5bGnkaunKcSs
   qinTBGW3H6KijRokOAjWaB6Lmjf+pdBC3IUQceMjBl8eQ9JfXe+bfBKjp
   Q==;
X-CSE-ConnectionGUID: vppwuZwWSLajMaJhzpDTew==
X-CSE-MsgGUID: OX3YGl6iT3aExbxKf9mpLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87322214"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87322214"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 17:47:55 -0700
X-CSE-ConnectionGUID: 8MIANVFlRA+tWb2rZFPbkA==
X-CSE-MsgGUID: EuRwRdOySm6NWdfbH3n9rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="268256347"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Aug 2026 17:47:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvlW2-00000000dB8-3v3i;
	Mon, 17 Aug 2026 00:47:50 +0000
Date: Mon, 17 Aug 2026 08:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 160/217]
 drivers/mfd/88pm860x-core.c:841:13: warning: 'device_codec_init' defined but
 not used
Message-ID: <202608170852.2QxCkILI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_174756_886283_8407D121 
X-CRM114-Status: GOOD (  14.66  )
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
commit: 59d0d39f2a1e71a171b677f5c4a10641c22d6fff [160/217] mfd: 88pm860x: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260817/202608170852.2QxCkILI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170852.2QxCkILI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170852.2QxCkILI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/88pm860x-core.c: In function 'pm860x_probe':
   drivers/mfd/88pm860x-core.c:985:36: error: 'np' undeclared (first use in this function); did you mean 'up'?
     985 |         ret = of_property_read_u32(np, "marvell,88pm860x-slave-addr",
         |                                    ^~
         |                                    up
   drivers/mfd/88pm860x-core.c:985:36: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from include/linux/i2c.h:13,
                    from drivers/mfd/88pm860x-core.c:13:
   drivers/mfd/88pm860x-core.c:988:25: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
     988 |                 dev_err(dev,
         |                         ^~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/mfd/88pm860x-core.c:988:17: note: in expansion of macro 'dev_err'
     988 |                 dev_err(dev,
         |                 ^~~~~~~
   drivers/mfd/88pm860x-core.c:980:29: warning: unused variable 'node' [-Wunused-variable]
     980 |         struct device_node *node = client->dev.of_node;
         |                             ^~~~
   drivers/mfd/88pm860x-core.c: At top level:
>> drivers/mfd/88pm860x-core.c:841:13: warning: 'device_codec_init' defined but not used [-Wunused-function]
     841 | static void device_codec_init(struct pm860x_chip *chip)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/mfd/88pm860x-core.c:326:33: warning: 'chg_desc_regulator_data' defined but not used [-Wunused-variable]
     326 | static struct charger_regulator chg_desc_regulator_data[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/input/touchscreen/88pm860x-ts.c: In function 'pm860x_touch_probe':
>> drivers/input/touchscreen/88pm860x-ts.c:174:34: warning: unused variable 'data' [-Wunused-variable]
     174 |         int irq, ret, res_x = 0, data = 0;
         |                                  ^~~~


vim +/device_codec_init +841 drivers/mfd/88pm860x-core.c

   840	
 > 841	static void device_codec_init(struct pm860x_chip *chip)
   842	{
   843		int ret;
   844	
   845		codec_devs[0].num_resources = ARRAY_SIZE(codec_resources);
   846		codec_devs[0].resources = &codec_resources[0];
   847		ret = mfd_add_devices(chip->dev, 0, &codec_devs[0],
   848				      ARRAY_SIZE(codec_devs), &codec_resources[0], 0,
   849				      NULL);
   850		if (ret < 0)
   851			dev_err(chip->dev, "Failed to add codec subdev\n");
   852	}
   853	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

