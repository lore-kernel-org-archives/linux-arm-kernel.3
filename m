Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CB9C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 05:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rkwutj8ZtWX64xlxzDByLBp9bVgEAoXL4l4/bD8Hrk8=; b=yuzgmJKS2e3uRG2HTGMf2xjDZX
	TuK9OZ4tFeRilkeRAeRClR/rm3Vr+HHRESTwI6H7+KNdlX/fPIPoT8ftWKO3t3SsesLAjP+86dw+5
	2GsID2d+J6MjqX3JUkTlND5OiH67iHxY1CeIBts86+mV+Y1U9mk0RwL8q7wfj4hV/uSAEckVxo94+
	Qkh/p4e78JM4h6Rjrp8Nu0lO7bOyHYdgLz0S+hYp1ANKjmchV6Ksnou5BMG8+6S3xrnvC+PAiE4d6
	dKhlGkp5OD45ki9S0PNTVcOEDDGp6hSvbjOx2uI6NlPKO+j6SykQR1Ye+UYOmaovCokNE+6j9KHj3
	njeYrF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZH3-000000093A8-1pTD;
	Wed, 19 Aug 2026 05:55:41 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZGz-0000000939n-27VY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 05:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787118938; x=1818654938;
  h=date:from:to:cc:subject:message-id;
  bh=tXXTBHK+knshOkHL6FG5iOhTNI9yTTxLDKRbdhxYQok=;
  b=FGEPfWM+JKZUvzMw+k5F4CfTihGdnKbmyahqTVWq0V1Jr8aQAsHqqyWS
   KypO1aVcSB1LA/bNIr/jaLUTARPg4L0eUqPoXIXcczyEKOnl9rmvSS7pS
   S71kwCd7BuozOFYC5ZdVVYKSXqJ0fxDvjDWCxNerHcj5pylJEcd/cRv5Z
   pLZU4qqgvX3pcaaTYnCZLA1W/KFzIfApz0J97lf0tKdvFFiy3xvlpusmQ
   WcsrjiccQW+E+Y9uXM+1bA0qmWP3kmU/q8YF9sBFU/YB9gm6M2OBsX+TC
   BKMlWGp/cwmWuNcn7OTrM3hl/tQNJ0ylF3LB8X24LaNlY4YiJSQrXXSLI
   g==;
X-CSE-ConnectionGUID: gEeraxq0S4q3T8t5Ym+F7g==
X-CSE-MsgGUID: 29ufEyECQ1ifOwjmDXgN3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98779660"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="98779660"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 22:55:36 -0700
X-CSE-ConnectionGUID: bi0Q5AtvSiuoQnBFNP1ZkQ==
X-CSE-MsgGUID: YBuNOc7OTC+yRB/8hz0W5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="263708642"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Aug 2026 22:55:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwZGt-00000000ev8-3TaM;
	Wed, 19 Aug 2026 05:55:31 +0000
Date: Wed, 19 Aug 2026 13:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 161/200]
 drivers/net/dsa/b53/b53_srab.c:619:29: warning: unused variable 'dn'
Message-ID: <202608191337.lWFpSf1X-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_225537_656465_4C8C5B57 
X-CRM114-Status: UNSURE (   9.95  )
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
commit: 17d6f307eeac32b9e1bae82f8f4388297cc4647f [161/200] net: dsa: remove pdata based probing
config: x86_64-buildonly-randconfig-006-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191337.lWFpSf1X-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191337.lWFpSf1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191337.lWFpSf1X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/dsa/b53/b53_srab.c: In function 'b53_srab_probe':
>> drivers/net/dsa/b53/b53_srab.c:619:29: warning: unused variable 'dn' [-Wunused-variable]
     619 |         struct device_node *dn = pdev->dev.of_node;
         |                             ^~


vim +/dn +619 drivers/net/dsa/b53/b53_srab.c

0e01491de64600 Florian Fainelli 2018-09-05  616  
967dd82ffc52e9 Florian Fainelli 2016-06-09  617  static int b53_srab_probe(struct platform_device *pdev)
967dd82ffc52e9 Florian Fainelli 2016-06-09  618  {
fefae6909ead17 Florian Fainelli 2016-07-08 @619  	struct device_node *dn = pdev->dev.of_node;
fefae6909ead17 Florian Fainelli 2016-07-08  620  	const struct of_device_id *of_id = NULL;
967dd82ffc52e9 Florian Fainelli 2016-06-09  621  	struct b53_srab_priv *priv;
967dd82ffc52e9 Florian Fainelli 2016-06-09  622  	struct b53_device *dev;
967dd82ffc52e9 Florian Fainelli 2016-06-09  623  
967dd82ffc52e9 Florian Fainelli 2016-06-09  624  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
967dd82ffc52e9 Florian Fainelli 2016-06-09  625  	if (!priv)
967dd82ffc52e9 Florian Fainelli 2016-06-09  626  		return -ENOMEM;
967dd82ffc52e9 Florian Fainelli 2016-06-09  627  
291f4b6de48aa8 YueHaibing       2019-08-01  628  	priv->regs = devm_platform_ioremap_resource(pdev, 0);
967dd82ffc52e9 Florian Fainelli 2016-06-09  629  	if (IS_ERR(priv->regs))
ef24d6c3d69651 Tiezhu Yang      2020-05-22  630  		return PTR_ERR(priv->regs);
967dd82ffc52e9 Florian Fainelli 2016-06-09  631  
967dd82ffc52e9 Florian Fainelli 2016-06-09  632  	dev = b53_switch_alloc(&pdev->dev, &b53_srab_ops, priv);
967dd82ffc52e9 Florian Fainelli 2016-06-09  633  	if (!dev)
967dd82ffc52e9 Florian Fainelli 2016-06-09  634  		return -ENOMEM;
967dd82ffc52e9 Florian Fainelli 2016-06-09  635  
17d6f307eeac32 Arnd Bergmann    2026-08-07  636  	of_id = of_match_node(b53_srab_of_match, dn);
17d6f307eeac32 Arnd Bergmann    2026-08-07  637  	dev->chip_id = (u32)(unsigned long)of_id->data;
fefae6909ead17 Florian Fainelli 2016-07-08  638  
967dd82ffc52e9 Florian Fainelli 2016-06-09  639  	platform_set_drvdata(pdev, dev);
967dd82ffc52e9 Florian Fainelli 2016-06-09  640  
16994374a6fc6a Florian Fainelli 2018-09-05  641  	b53_srab_prepare_irq(pdev);
0e01491de64600 Florian Fainelli 2018-09-05  642  	b53_srab_mux_init(pdev);
16994374a6fc6a Florian Fainelli 2018-09-05  643  
967dd82ffc52e9 Florian Fainelli 2016-06-09  644  	return b53_switch_register(dev);
967dd82ffc52e9 Florian Fainelli 2016-06-09  645  }
967dd82ffc52e9 Florian Fainelli 2016-06-09  646  

:::::: The code at line 619 was first introduced by commit
:::::: fefae6909ead1798c39bee4d94e7e8f1f2752ef6 net: dsa: b53: Allow SRAB driver to specify platform data

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

