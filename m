Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F41CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 05:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pibiIHcs1nQ5PqesA7d/pc0kX16e810a/N+i8rUabVI=; b=qwiVZBcjH5aJu32hsofz2m9h7g
	Uab6qHKwRwPQcuEiHRlNw2nb8LtW1XiIkMGmggT07D/XpadPr35JblDbRMhgLAld8Mw/Hro336myd
	wfhHuYj9WF4932LjrzKJKW039Y+BJDy8Ysc5ym4dLqe58TOdTk+sVOHIOShXL3xpzP7qoEjXHJC3A
	XI8+eldV6+xYkerUrMeO5QOGb9xl6XQp/zWcP9vFqZExgXMrKzIfVuzxI0JBTR2N0piC4Q+F3vvN3
	YRfLs9jgvfmpUyADIhM93CZMU+Nk2VbV6lsKKQ+eegKRL9C2xWGoeGK7q8+uktoJ/a3+OZrpiBYar
	pMqbySPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvpi1-00000005QpG-3eyv;
	Mon, 17 Aug 2026 05:16:29 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvphy-00000005Qow-1nU2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 05:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786943786; x=1818479786;
  h=date:from:to:cc:subject:message-id;
  bh=0gRjb7GbT7paYjKUZ9ewHtfHxURlAGynqCWuCCnJDx8=;
  b=jQTAAqNAZtOTMKBmZr9hOCXkqx/ZRfC0nTH8kTqtAXkyA8CDCY7HiviZ
   kSyKQ2CV4HZPotHREbvuQ8S/A+pjKtPW6D5loVVEZvx3V8qnAZVBvjRPM
   mGkHHD3Bq5F6fNZlsOzsM6i/Et8MvymfwdQpUZFhU/Xb0YbTp9DsziisS
   oDSlrRUWhjVdQeY2+TFiIaTNEV9M9qqwTyOC4tZ3c13YASeEu//HU+thN
   HC2C8PhzPwsi0471QCX2Ts3mXG62W9/I5AHnsSbQI7gZygFDvWZYO10Lv
   T8CgAgaUT3SovvDhMwiNtqE731HB4O7lChQz8e1Lkf3qooJlf3+VjJ5rB
   Q==;
X-CSE-ConnectionGUID: Gjpq/HMQQtagWWyGLiPNZQ==
X-CSE-MsgGUID: cGvm0FBuRPeOU7C+gvTOzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87480292"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87480292"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 22:16:25 -0700
X-CSE-ConnectionGUID: gaX2yrFdRQ+u8MR4i4y78w==
X-CSE-MsgGUID: KMUivrqmQK+YuSh8naMc4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="261531174"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Aug 2026 22:16:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvphs-00000000dJ0-3eSL;
	Mon, 17 Aug 2026 05:16:20 +0000
Date: Mon, 17 Aug 2026 13:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 132/217]
 drivers/i2c/busses/i2c-pxa-pci.c:41:29: warning: unused variable 'prop'
Message-ID: <202608171507.CDOR43wB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_221626_505395_85794BE4 
X-CRM114-Status: GOOD (  10.12  )
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
commit: 965e36538dc05c1751e466c2afa3124be407bc2d [132/217] i2c: pxa: remove platform data based probing
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260817/202608171507.CDOR43wB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171507.CDOR43wB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608171507.CDOR43wB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-pxa-pci.c: In function 'add_i2c_device':
>> drivers/i2c/busses/i2c-pxa-pci.c:41:29: warning: unused variable 'prop' [-Wunused-variable]
      41 |                 const void *prop;
         |                             ^~~~


vim +/prop +41 drivers/i2c/busses/i2c-pxa-pci.c

7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  21  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  22  static struct platform_device *add_i2c_device(struct pci_dev *dev, int bar)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  23  {
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  24  	struct platform_device *pdev;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  25  	struct resource res[2];
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  26  	struct device_node *child;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  27  	static int devnum;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  28  	int ret;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  29  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  30  	memset(&res, 0, sizeof(res));
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  31  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  32  	res[0].flags = IORESOURCE_MEM;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  33  	res[0].start = pci_resource_start(dev, bar);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  34  	res[0].end = pci_resource_end(dev, bar);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  35  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  36  	res[1].flags = IORESOURCE_IRQ;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  37  	res[1].start = dev->irq;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  38  	res[1].end = dev->irq;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  39  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  40  	for_each_child_of_node(dev->dev.of_node, child) {
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02 @41  		const void *prop;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  42  		struct resource r;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  43  		int ret;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  44  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  45  		ret = of_address_to_resource(child, 0, &r);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  46  		if (ret < 0)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  47  			continue;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  48  		if (r.start != res[0].start)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  49  			continue;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  50  		if (r.end != res[0].end)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  51  			continue;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  52  		if (r.flags != res[0].flags)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  53  			continue;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  54  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  55  		break;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  56  	}
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  57  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  58  	if (!child) {
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  59  		dev_err(&dev->dev, "failed to match a DT node for bar %d.\n",
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  60  				bar);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  61  		ret = -EINVAL;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  62  		goto out;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  63  	}
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  64  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  65  	pdev = platform_device_alloc("ce4100-i2c", devnum);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  66  	if (!pdev) {
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  67  		of_node_put(child);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  68  		ret = -ENOMEM;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  69  		goto out;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  70  	}
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  71  	pdev->dev.parent = &dev->dev;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  72  	pdev->dev.of_node = child;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  73  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  74  	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  75  	if (ret)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  76  		goto err;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  77  
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  78  	ret = platform_device_add(pdev);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  79  	if (ret)
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  80  		goto err;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  81  	devnum++;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  82  	return pdev;
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  83  err:
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  84  	platform_device_put(pdev);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  85  out:
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  86  	return ERR_PTR(ret);
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  87  }
7e94dd154e934aa Sebastian Andrzej Siewior 2011-03-02  88  

:::::: The code at line 41 was first introduced by commit
:::::: 7e94dd154e934aa2137c427c3b1c8e9a6e465fcd i2c-pxa2xx: Add PCI support for PXA I2C controller

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Ben Dooks <ben-linux@fluff.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

