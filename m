Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1082CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 11:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+EAM0XQQoLVEORwNHeMrdT+RATLgROribnJQCWjWOk=; b=Hv5qW+x7HU1dbd2g8jRS8Qg8O7
	7rIriV1pQp1mPSqeBaJn/NtMyKFToDP/SFhqFNnevBbj9VZiOv2DBFYp8sknE+YWXoD2rPwuyzGQF
	fVfveRFhJQruAmYwrKWhw76dl9ukms0eTYgTZkCELexWhlYQNTEPvZE4vO9Z2o1PPINDs4ju0XAr1
	fOA9oSNz7kfrbbMyV2ffav9YKaccVqy186T33Lv5SSXHIQq8BiCqegHfBICiE6mh9xf6mUPY4dOQ8
	HZ8O/FuG9dRlB8vWay9q74BI/Q9XW/rrIMBvuys5vPbrTn0G2LnHZnMNI3Au+c+bRHwdpCZITuHXM
	GkraUjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuqmi-00000007cMd-35t7;
	Sat, 06 Sep 2025 11:08:44 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuqjq-00000007bsc-0zhC;
	Sat, 06 Sep 2025 11:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757156746; x=1788692746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qMYBvVdJ1HSlHVvYz/hS01oKPmqpmnjHlzwp0s/H3Mk=;
  b=T6Ki+ZCnSvS8o3eXPJ1wuNx9lEwDWVz5GJPmorBH3zulQo8/+7u+h+zY
   BM2Sfts3Q8Q+KJQw6OTeo++U9inE88XtQthPAarq3xWwGX431/g8jj+L7
   i63a3PhCHOyZ1MSCw5SFAK9wQizhrkl2hnHV8xNHmgFeoJX5ZjiD/srl2
   ASlbRnwDdGKJRNdWr3ctO74my9oLJhkdgBLuy38kFN8fUShXW5dScDar7
   clmnxunP85/m3OrhCGPp3+PVAw3kG0dPXBFvBOTYXHKksbXk2OVOyrygm
   Tfz8BgnkMpGBD4snTJOX8NnGwR1HKFeehbw8R+sD0aRdi45VJ7kc0uPe6
   w==;
X-CSE-ConnectionGUID: dIhbGkB2SeaLAwgE9SCGsA==
X-CSE-MsgGUID: ZUFjnsOeRHarAaOgeZFx+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="47058314"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="47058314"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 04:05:31 -0700
X-CSE-ConnectionGUID: nGcxIybSS1qxAhsECIbVLQ==
X-CSE-MsgGUID: /xIRjD2aS3+C7ekmIsiaOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="196028943"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Sep 2025 04:05:27 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuqjV-0001NR-1N;
	Sat, 06 Sep 2025 11:05:25 +0000
Date: Sat, 6 Sep 2025 19:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Luiz Von Dentz <luiz.dentz@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Wang <sean.wang@mediatek.com>,
	Jiande Lu <jiande.lu@mediatek.com>,
	Deren Wu <deren.Wu@mediatek.com>, Chris Lu <chris.lu@mediatek.com>,
	Hao Qin <Hao.qin@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
Subject: Re: [PATCH v7 1/1] Bluetooth: mediatek: add gpio pin to reset bt
Message-ID: <202509061837.tyzBvcs9-lkp@intel.com>
References: <20250905084059.26959-2-ot_zhangchao.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905084059.26959-2-ot_zhangchao.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_040546_288029_B65EC130 
X-CRM114-Status: GOOD (  12.21  )
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

Hi Zhangchao,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on bluetooth-next/master linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhangchao-Zhang/Bluetooth-mediatek-add-gpio-pin-to-reset-bt/20250905-164341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20250905084059.26959-2-ot_zhangchao.zhang%40mediatek.com
patch subject: [PATCH v7 1/1] Bluetooth: mediatek: add gpio pin to reset bt
config: x86_64-buildonly-randconfig-001-20250906 (https://download.01.org/0day-ci/archive/20250906/202509061837.tyzBvcs9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061837.tyzBvcs9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061837.tyzBvcs9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/btmtk.c:370:34: error: incompatible pointer types passing 'struct device_node *' to parameter of type 'struct device *' [-Werror,-Wincompatible-pointer-types]
     370 |         reset_gpio = gpiod_get_optional(hdev->dev.of_node, "reset", GPIOD_OUT_HIGH);
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/gpio/consumer.h:72:66: note: passing argument to parameter 'dev' here
      72 | struct gpio_desc *__must_check gpiod_get_optional(struct device *dev,
         |                                                                  ^
   1 error generated.


vim +370 drivers/bluetooth/btmtk.c

   363	
   364	static int btmtk_hw_gpio_reset(struct hci_dev *hdev, struct btmtk_data *reset_work)
   365	{
   366		struct gpio_desc *reset_gpio;
   367	
   368		/* Find device node*/
   369		hdev->dev.of_node = of_find_compatible_node(NULL, NULL, "mediatek,mt7925-bluetooth");
 > 370		reset_gpio = gpiod_get_optional(hdev->dev.of_node, "reset", GPIOD_OUT_HIGH);
   371		if (IS_ERR(reset_gpio))
   372			return PTR_ERR(reset_gpio);
   373	
   374		if (!reset_gpio)
   375			return -ENODEV;
   376	
   377		if (test_and_set_bit(BTMTK_HW_RESET_ACTIVE, &reset_work->flags)) {
   378			bt_dev_err(hdev, "last reset failed? Not resetting again");
   379			gpiod_put(reset_gpio);
   380			return -EBUSY;
   381		}
   382		gpiod_set_value_cansleep(reset_gpio, 0);
   383		msleep(100);
   384		gpiod_set_value_cansleep(reset_gpio, 1);
   385		gpiod_put(reset_gpio);
   386		return 0;
   387	}
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

