Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AA2C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 04:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YQQcmJGUGSrj7JO07Va65FsHFWozNcC1UvirEG4Kqf0=; b=RvPWBjHQzPTTlmptNFYJ47yhOs
	wdIVpa85rECCYsFDLuPnUqqmemTDVhCE/FTA6lXlnSHuHuhMRc1WyfAeE64SopZw2JZjZOZ00p8bG
	GHhd9bolAgRYs562h3p/uV4MP8deoI5N0CZ0cymY36gRwfnLGktyMo6yg25+vPdV1GM4c9cr05pRW
	xIotZeEto/jG0N8uDyPX+6GfVihxPZqpodNmuZG0C4RkQA0S0hrHwQHk5742eylQ1yJ2+zxL500Lo
	bsHt1EVb0iQpI7NAcWXJxBcRGdolHQq2mqUW9aqp+Ffitz4SeG2sGGvsQVD1G/3SC+p/rEsLsk6zn
	ZTsjthbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwBDe-00000007GOF-3PG0;
	Tue, 18 Aug 2026 04:14:34 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwBDb-00000007GNo-3qdJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 04:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787026472; x=1818562472;
  h=date:from:to:cc:subject:message-id;
  bh=A9K5UVNRK65wUQoVxBO2w+uY+7241BWUFdn5G49wz6w=;
  b=gijHJdPu5Ah9TYzXVC4zp+6q7vhsObmCVT/Wx1YKLUHaPkGawCao3r1u
   ZUNFO8051qJ6oefOL0lXmt3Ifr15izEP4EkdZ3KEs6bYpXs0cA0lMv5F3
   URlwLfTceXBmJCLsYE//b1s6ViiA2S0QzF+J+n5rG+JGtPXN9DYEeFrp2
   hIun8IRy9jv69l3VNtgweb8SAlUjTmH5NQnT6yQ58hyDu67IusYiEotrU
   8496mFk3IDCPH+jq7sR9hVxYFQpGp2IFICBynBJ822RYmUGGYQ/54Bh41
   u7/yto2SClDedubhFazKq82FdwtXiDuAAl4FW52Q/EYxrp0JC/8Hl2U9Q
   w==;
X-CSE-ConnectionGUID: 60NZiV7tSvyPc2P34n/W3Q==
X-CSE-MsgGUID: Gb10nFDtQG+nf4aBvtKpWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="110293219"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="110293219"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 21:14:31 -0700
X-CSE-ConnectionGUID: 3O0VjNlgTMeq51WH1Cuxjw==
X-CSE-MsgGUID: IXGBxBQdQsuwuEsbv/Y0oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263367012"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Aug 2026 21:14:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwBDW-00000000e60-4B78;
	Tue, 18 Aug 2026 04:14:26 +0000
Date: Tue, 18 Aug 2026 12:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 171/217] drivers/mfd/tc3589x.c:335:24:
 error: returning 'void *' from a function with return type 'int' makes
 integer from pointer without a cast
Message-ID: <202608181210.YG2HmdEf-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_211432_027272_65D8ADD5 
X-CRM114-Status: UNSURE (   9.21  )
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
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 9220687cca8bad538843ff5a1a062b10e008e238 [171/217] mfd: tc3589x: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260818/202608181210.YG2HmdEf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181210.YG2HmdEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181210.YG2HmdEf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/tc3589x.c: In function 'tc3589x_of_probe':
>> drivers/mfd/tc3589x.c:335:24: error: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
     335 |                 return ERR_PTR(-ENODEV);
         |                        ^~~~~~~~~~~~~~~~
   drivers/mfd/tc3589x.c: In function 'tc3589x_probe':
   drivers/mfd/tc3589x.c:351:37: warning: unused variable 'id' [-Wunused-variable]
     351 |         const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
         |                                     ^~


vim +335 drivers/mfd/tc3589x.c

a381b13e2aa064 Linus Walleij       2014-01-23  324  
9220687cca8bad Arnd Bergmann       2026-08-07  325  static int
9220687cca8bad Arnd Bergmann       2026-08-07  326  tc3589x_of_probe(struct device *dev, enum tc3589x_version *version,
9220687cca8bad Arnd Bergmann       2026-08-07  327  		 unsigned int *block)
a435ae1d51e2f1 Lee Jones           2012-09-07  328  {
a381b13e2aa064 Linus Walleij       2014-01-23  329  	struct device_node *np = dev->of_node;
a435ae1d51e2f1 Lee Jones           2012-09-07  330  	struct device_node *child;
a381b13e2aa064 Linus Walleij       2014-01-23  331  	const struct of_device_id *of_id;
a381b13e2aa064 Linus Walleij       2014-01-23  332  
a381b13e2aa064 Linus Walleij       2014-01-23  333  	of_id = of_match_device(tc3589x_match, dev);
a381b13e2aa064 Linus Walleij       2014-01-23  334  	if (!of_id)
a381b13e2aa064 Linus Walleij       2014-01-23 @335  		return ERR_PTR(-ENODEV);
a2ce000265b780 Krzysztof Kozlowski 2023-08-10  336  	*version = (uintptr_t) of_id->data;
a435ae1d51e2f1 Lee Jones           2012-09-07  337  
9220687cca8bad Arnd Bergmann       2026-08-07  338  	*block = 0;
a435ae1d51e2f1 Lee Jones           2012-09-07  339  	for_each_child_of_node(np, child) {
a381b13e2aa064 Linus Walleij       2014-01-23  340  		if (of_device_is_compatible(child, "toshiba,tc3589x-gpio"))
9220687cca8bad Arnd Bergmann       2026-08-07  341  			*block |= TC3589x_BLOCK_GPIO;
a381b13e2aa064 Linus Walleij       2014-01-23  342  		if (of_device_is_compatible(child, "toshiba,tc3589x-keypad"))
9220687cca8bad Arnd Bergmann       2026-08-07  343  			*block |= TC3589x_BLOCK_KEYPAD;
a435ae1d51e2f1 Lee Jones           2012-09-07  344  	}
a435ae1d51e2f1 Lee Jones           2012-09-07  345  
9220687cca8bad Arnd Bergmann       2026-08-07  346  	return 0;
a381b13e2aa064 Linus Walleij       2014-01-23  347  }
a435ae1d51e2f1 Lee Jones           2012-09-07  348  

:::::: The code at line 335 was first introduced by commit
:::::: a381b13e2aa064122325de9deaec51d6e4765ad7 mfd: tc3589x: Reform device tree probing

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Lee Jones <lee.jones@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

