Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DCBE7719D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 10:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koUzhaC5lP69OII/PnB7KVz2q/f2cPDBtDqBB+DljrI=; b=XOIoATo8rftk2L31BGbwC+eALd
	tA/ctBra7D4bNP6tZk7E/diTgtX3h1tY6H1C+EKjEuIDkthFD0Kf01gcOdB9kLBqqhWqyRgy/7SA8
	VjDYNDnDsGUGcZgBYS6mSe/LUoq/QGMmoO2ZP23L50+LraLY72b6P2ThxL84u3GQR1ZWgvs5IlC01
	bk82HenoA/HwmSdjLkW7ljAvGAxfzVJTrW92noZos6E4NzrDVqt0MmH4HBPMxo+kt2qz7wA8s/PLQ
	UTckPaldZdivd6Z+WkXE23vqOivCms6rQiPv02A5XIcnAeabJX2PPEIPyhIKD3jr9CWp4ZoOJTQA/
	DbDH7V9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWYrj-00000000cwi-0qws;
	Sat, 11 Jan 2025 10:37:15 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWYpr-00000000ciS-13KY;
	Sat, 11 Jan 2025 10:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736591719; x=1768127719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4BeJTqqm28Qv5oKR0dD1hGxB/DuI9FfILfZRugCKv8I=;
  b=bOxQ4p9VzT7swh9fidpG/COE72yVeL+MZEetc8zZYngyQPLSRMTsvNws
   MoFDgDQc1KN3NYIGXK5EppHGJeUe76rzFWNa3w5dsv2gPZYvZ6qdpH7b3
   gEWORlKJ552yWKY3APYcyhSKS3PVj9EfIkgoPdRj8rdIyr6EiHV54WS5A
   x6rnaPyCW/hOWWDfBfUKuDCoV1sXAmFW3Aps9s5xjN22vuRREXPUCiRWg
   otZV3iKFOcJhc7PLjKGw3hQIyLBXsrRRAjCV77DZkdKBFgcxKSRp5ppQv
   5aqfceIjnVh2YGnL+fV6dyDN1JODT4UBEVlzSyhZm99AEXVT9feCruWw2
   g==;
X-CSE-ConnectionGUID: y8PXLkS9RV2DCDwvn3Hz3g==
X-CSE-MsgGUID: h0Uav5AZR3mY5FwNIecl/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37112091"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="37112091"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 02:35:13 -0800
X-CSE-ConnectionGUID: pGD7UTJTQc2Da3Y2xbpPoA==
X-CSE-MsgGUID: CUAO05POTmibjKRUAVNYcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="108970921"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2025 02:32:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWYn7-000KUR-1E;
	Sat, 11 Jan 2025 10:32:29 +0000
Date: Sat, 11 Jan 2025 18:31:36 +0800
From: kernel test robot <lkp@intel.com>
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>,
	wenbin.mei@mediatek.com
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Guodong Liu <guodong.liu@mediatek.com>,
	Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: Re: [PATCH v2 2/2] pinctrl: mediatek: add mt8196 driver
Message-ID: <202501111834.dc1JHSLT-lkp@intel.com>
References: <20250110104703.13625-3-ot_cathy.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110104703.13625-3-ot_cathy.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_023519_332854_9A7F788A 
X-CRM114-Status: GOOD (  15.43  )
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

Hi Cathy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next robh/for-next krzk-dt/for-next pinctrl-samsung/for-next linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cathy-Xu/dt-bindings-pinctrl-mediatek-add-support-for-mt8196/20250110-184846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20250110104703.13625-3-ot_cathy.xu%40mediatek.com
patch subject: [PATCH v2 2/2] pinctrl: mediatek: add mt8196 driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501111834.dc1JHSLT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111834.dc1JHSLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111834.dc1JHSLT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/pinctrl/mediatek/pinctrl-mt8196.c:7:
>> drivers/pinctrl/mediatek/pinctrl-mt8196.c:1753:37: error: 'mtk_eint_pm_ops' undeclared here (not in a function); did you mean 'mtk_eint_regs'?
    1753 |                 .pm = pm_sleep_ptr(&mtk_eint_pm_ops),
         |                                     ^~~~~~~~~~~~~~~
   include/linux/kernel.h:48:44: note: in definition of macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/pinctrl/mediatek/pinctrl-mt8196.c:1753:23: note: in expansion of macro 'pm_sleep_ptr'
    1753 |                 .pm = pm_sleep_ptr(&mtk_eint_pm_ops),
         |                       ^~~~~~~~~~~~


vim +1753 drivers/pinctrl/mediatek/pinctrl-mt8196.c

  1748	
  1749	static struct platform_driver mt8196_pinctrl_driver = {
  1750		.driver = {
  1751			.name = "mt8196-pinctrl",
  1752			.of_match_table = mt8196_pinctrl_of_match,
> 1753			.pm = pm_sleep_ptr(&mtk_eint_pm_ops),
  1754		},
  1755		.probe = mtk_paris_pinctrl_probe,
  1756	};
  1757	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

