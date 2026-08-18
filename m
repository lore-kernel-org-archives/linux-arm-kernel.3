Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F7AC5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 11:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DeWOePFKlThl/VjUyvAxr1c/vGR+dYIkimZOSES1Vf0=; b=RNMWN+djY+SUeYHi7hxecgw+Iq
	Ypla+luSJ5IjE7aotMYHJ3JlKseS2mIatpLWX8MQLG3TZK2cY+5SBnDFcNvSbfLun338Or+q3QSTw
	Q/0ZwsEdOcORf0Re8mLPtakbGnHAje9wMBHzSuI1YXf/E8yGtJTz/7jgkadPhVphXqxSlnu1wgKXA
	x0X/XEOdP5FJjZ1UKyZwVFh0Q1VTSuK7xXiXxcDQNz8N2ET2tBryNwKj7fBPslJ39IEazfQiwmoQL
	Zdll58sdy350nUbAPj0c6frZfakQUsVc8Cu+jLzg1gIYj84t9Ad2IC+8GXpqgzPqRiH3/w3uKXgJH
	eNtOEYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwIOk-00000007spR-3wqm;
	Tue, 18 Aug 2026 11:54:30 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwIOh-00000007sp8-1kgs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 11:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787054067; x=1818590067;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/CsumJnHyMZxq8+3k+jgUVgSP5bnrMaoevTrS8mF/zw=;
  b=c2Riq+0HFnrxt+WFzDw/f/F0HqPtL7E72Gtf62qKGYcQo5GWp8+3LDS6
   2V7XMgfr9w6WDQbGbfgfe6U1W5xawcErFJuwWxLsrDH9ZBiUL62n3kwxf
   ew808oowraAgPsXeDBFFX4W1DNZzTyhWV57PSNFo95Nc5OE2mv9WE1v9/
   gPpCO+K8Mo2nueKq7YNHCG9iDBCrSrWyxmHcaF+58GLPRoFt3Dm5EEbVH
   3UqJUcuArzwyXLv9b0vh2ZPNvL+8yxN4SRNWLcgkgzjLpE1Bhz00VPdbO
   09g/xhWHGTQ1rWuzOnXwWCaxX6z4HO12Fp7xvAaTkkGdT7S2GkhEuMBiP
   Q==;
X-CSE-ConnectionGUID: BeIVK1qwTGqaUCnLDcK1fg==
X-CSE-MsgGUID: q9i6IYsRRyW3i222bYRvow==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87666360"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87666360"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:54:21 -0700
X-CSE-ConnectionGUID: QpmrjTtiTeiLNWl0gDvTQQ==
X-CSE-MsgGUID: Atnpb7YTRzmBkRDyXc6M2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="260994606"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Aug 2026 04:54:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwIOX-00000000eIw-0WeP;
	Tue, 18 Aug 2026 11:54:17 +0000
Date: Tue, 18 Aug 2026 19:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 173/217]
 drivers/gpio/gpio-tps65910.c:146:13: error: wrong type argument to unary
 exclamation mark
Message-ID: <202608181929.NqAM96zH-lkp@intel.com>
User-Agent: s-nail v14.9.25
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_045427_517690_E4E427B9 
X-CRM114-Status: UNSURE (   8.87  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-r=
emove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 6b7810dfef678917c316dcac0f6a5281388e8a4e [173/217] mfd: tps65910: r=
emove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/2026081=
8/202608181929.NqAM96zH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260818/202608181929.NqAM96zH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181929.NqAM96zH-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-tps65910.c: In function 'tps65910_gpio_probe':
>> drivers/gpio/gpio-tps65910.c:146:13: error: wrong type argument to unary=
 exclamation mark
     146 |         if (!pdata)
         |             ^


vim +146 drivers/gpio/gpio-tps65910.c

6fe02e9f46fda7 drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-19  103 =20
3836309d93462b drivers/gpio/gpio-tps65910.c Bill Pemberton           2012-1=
1-19  104  static int tps65910_gpio_probe(struct platform_device *pdev)
2537df722d338a drivers/mfd/tps65910-gpio.c  Graeme Gregory           2011-0=
5-02  105  {
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  106  	struct tps65910 *tps65910 =3D dev_get_drvdata(pdev->dev.parent);
6b7810dfef6789 drivers/gpio/gpio-tps65910.c Arnd Bergmann            2026-0=
8-07  107  	struct tps65910_board pdata =3D {};
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  108  	struct tps65910_gpio *tps65910_gpio;
2537df722d338a drivers/mfd/tps65910-gpio.c  Graeme Gregory           2011-0=
5-02  109  	int ret;
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  110  	int i;
2537df722d338a drivers/mfd/tps65910-gpio.c  Graeme Gregory           2011-0=
5-02  111 =20
6dbe6c07f94f34 drivers/gpio/gpio-tps65910.c Andy Shevchenko          2021-1=
2-06  112  	device_set_node(&pdev->dev, dev_fwnode(pdev->dev.parent));
6dbe6c07f94f34 drivers/gpio/gpio-tps65910.c Andy Shevchenko          2021-1=
2-06  113 =20
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  114  	tps65910_gpio =3D devm_kzalloc(&pdev->dev,
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  115  				sizeof(*tps65910_gpio), GFP_KERNEL);
0661175a2ae7f8 drivers/gpio/gpio-tps65910.c Jingoo Han               2014-0=
4-29  116  	if (!tps65910_gpio)
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  117  		return -ENOMEM;
2537df722d338a drivers/mfd/tps65910-gpio.c  Graeme Gregory           2011-0=
5-02  118 =20
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  119  	tps65910_gpio->tps65910 =3D tps65910;
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  120 =20
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  121  	tps65910_gpio->gpio_chip.owner =3D THIS_MODULE;
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  122  	tps65910_gpio->gpio_chip.label =3D tps65910->i2c_client->name;
11ad14f86a7847 drivers/gpio/tps65910-gpio.c Jorge Eduardo Candelaria 2011-0=
5-16  123 =20
11ad14f86a7847 drivers/gpio/tps65910-gpio.c Jorge Eduardo Candelaria 2011-0=
5-16  124  	switch (tps65910_chip_id(tps65910)) {
11ad14f86a7847 drivers/gpio/tps65910-gpio.c Jorge Eduardo Candelaria 2011-0=
5-16  125  	case TPS65910:
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  126  		tps65910_gpio->gpio_chip.ngpio =3D TPS65910_NUM_GPIO;
58956ba23e2dce drivers/gpio/tps65910-gpio.c Axel Lin                 2011-0=
7-06  127  		break;
11ad14f86a7847 drivers/gpio/tps65910-gpio.c Jorge Eduardo Candelaria 2011-0=
5-16  128  	case TPS65911:
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  129  		tps65910_gpio->gpio_chip.ngpio =3D TPS65911_NUM_GPIO;
58956ba23e2dce drivers/gpio/tps65910-gpio.c Axel Lin                 2011-0=
7-06  130  		break;
11ad14f86a7847 drivers/gpio/tps65910-gpio.c Jorge Eduardo Candelaria 2011-0=
5-16  131  	default:
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  132  		return -EINVAL;
11ad14f86a7847 drivers/gpio/tps65910-gpio.c Jorge Eduardo Candelaria 2011-0=
5-16  133  	}
9fb1f39eb2d670 drivers/gpio/gpio-tps65910.c Linus Walleij            2013-1=
2-04  134  	tps65910_gpio->gpio_chip.can_sleep =3D true;
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  135  	tps65910_gpio->gpio_chip.direction_input =3D tps65910_gpio_inpu=
t;
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  136  	tps65910_gpio->gpio_chip.direction_output =3D tps65910_gpio_out=
put;
d9d87d90cc0b10 drivers/gpio/gpio-tps65910.c Bartosz Golaszewski      2025-0=
7-17  137  	tps65910_gpio->gpio_chip.set	=3D tps65910_gpio_set;
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  138  	tps65910_gpio->gpio_chip.get	=3D tps65910_gpio_get;
58383c78425e4e drivers/gpio/gpio-tps65910.c Linus Walleij            2015-1=
1-04  139  	tps65910_gpio->gpio_chip.parent =3D &pdev->dev;
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  140  	tps65910_gpio->gpio_chip.base =3D -1;
2537df722d338a drivers/mfd/tps65910-gpio.c  Graeme Gregory           2011-0=
5-02  141 =20
6b7810dfef6789 drivers/gpio/gpio-tps65910.c Arnd Bergmann            2026-0=
8-07  142  	tps65910_parse_dt_for_gpio(&pdev->dev, tps65910,
6b7810dfef6789 drivers/gpio/gpio-tps65910.c Arnd Bergmann            2026-0=
8-07  143  				tps65910_gpio->gpio_chip.ngpio,
6b7810dfef6789 drivers/gpio/gpio-tps65910.c Arnd Bergmann            2026-0=
8-07  144  				&pdata);
6fe02e9f46fda7 drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-19  145 =20
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11 @146  	if (!pdata)
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  147  		goto skip_init;
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  148 =20
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  149  	/* Configure sleep control for gpios if provided */
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  150  	for (i =3D 0; i < tps65910_gpio->gpio_chip.ngpio; ++i) {
6b7810dfef6789 drivers/gpio/gpio-tps65910.c Arnd Bergmann            2026-0=
8-07  151  		if (!pdata.en_gpio_sleep[i])
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  152  			continue;
2537df722d338a drivers/mfd/tps65910-gpio.c  Graeme Gregory           2011-0=
5-02  153 =20
a233d4ebfc6f5b drivers/gpio/gpio-tps65910.c Micha=C5=82 Miros=C5=82aw      =
    2020-09-27  154  		ret =3D regmap_set_bits(tps65910->regmap,
9467d298e92455 drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
2-01  155  			TPS65910_GPIO0 + i, GPIO_SLEEP_MASK);
9467d298e92455 drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
2-01  156  		if (ret < 0)
9467d298e92455 drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
2-01  157  			dev_warn(tps65910->dev,
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  158  				"GPIO Sleep setting failed with err %d\n", ret);
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  159  	}
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  160 =20
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  161  skip_init:
96a03e867c70c7 drivers/gpio/gpio-tps65910.c Alexandru Ardelean       2021-0=
5-21  162  	return devm_gpiochip_add_data(&pdev->dev, &tps65910_gpio->gpio_=
chip,
bf6e855a4e89e1 drivers/gpio/gpio-tps65910.c Laxman Dewangan          2016-0=
2-22  163  				      tps65910_gpio);
9467d298e92455 drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
2-01  164  }
10bbc48d7a045c drivers/gpio/gpio-tps65910.c Laxman Dewangan          2012-0=
5-11  165 =20

:::::: The code at line 146 was first introduced by commit
:::::: 10bbc48d7a045c022a54f637c0c6b72f0e38b519 gpio: Convert tps65910 to a=
 platform driver

:::::: TO: Laxman Dewangan <ldewangan@nvidia.com>
:::::: CC: Samuel Ortiz <sameo@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

