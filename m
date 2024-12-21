Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BE9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 01:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETFCUGnQxU1mgmCV42X8/dVRp8fN/6xEKktgq3C8xNw=; b=AaE5QXPUtOtlXUejWRlv732Ryd
	2r7BOS0S3Hc3MRal+rxxxgjncSSbq3Iu0PyCO+HYxmyFQ0u8JPHTXa6/QhwjNBv5dzd1ju4zw9dcG
	bnpJ4fgYPwuIyUeUih5dnQujoJjW+XiqXXi3oHKSnDAXQpZ/hJZIq4BzFRTKza99IpUFKLILoZ7wf
	GFnUKYGkpgFrEg5YtZmZIRfkFahT+TBn/EaIFvxJU/VGPtmOhzp4mACHMQFu+aYpmOQiK6zc2pLrw
	xf5ArPXllIfOFPyRMjmoqa+Z4y2SzH4elCK4C0Cw2mV50UiUUGNC2lPVLgr8jmglkz7I15eWCGUpm
	rlYMAlHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOoY5-00000006PWR-1Wck;
	Sat, 21 Dec 2024 01:44:57 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOoWt-00000006POd-1S0H;
	Sat, 21 Dec 2024 01:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734745424; x=1766281424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l9OB3WeZBCa7EjzzMv8qGnQJVG59xF8v5bFcZYOKStU=;
  b=kGiXr4vKUcMr7rVzuSBNA9tZcXWlA+UeMD4xpmflspWSWVw912oPTW4T
   WZduGckF+GsKzNLKLkqZ/u7uZresCJ/UPV3OiMKGJX+DcMBymqWdRb0wW
   noj6y7Y94oZGIEcgnSY1CDmZOKWJhFR1luJSZawefZE09BfeJiW/q8EQW
   n5FRUCsGlidfw2/CzfSnl1ROywxyLFqEovWGKNmISWl6UF41tYJrAGW0u
   TJYSOuexzJ8ZuUXDW12UO+0nhrcGmdOBi1f8OUgk9aWhX2FO4+M0m15qv
   dfeaD+3updCMzxHlQz0KvPlk9VrX+sM033o1ax5oXuFeB3n64fYXzJIBW
   A==;
X-CSE-ConnectionGUID: Kq9yYEBVRS+LOn4gIvN94w==
X-CSE-MsgGUID: jLdtaHZnRwKerb1wCHeI3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38984752"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="38984752"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 17:43:42 -0800
X-CSE-ConnectionGUID: j88nWNy4ReCZE3bOsc1sBA==
X-CSE-MsgGUID: K+zc8JYvTzyh+eKzHL8GIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="103524778"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2024 17:43:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOoWn-0001qd-0D;
	Sat, 21 Dec 2024 01:43:37 +0000
Date: Sat, 21 Dec 2024 09:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Crystal Guo <crystal.guo@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/2] memory/mediatek: Add an interface to get current DDR
 data rate
Message-ID: <202412210955.FvO0Pee3-lkp@intel.com>
References: <20241212090029.13692-2-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212090029.13692-2-crystal.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_174343_434585_685F9BE0 
X-CRM114-Status: GOOD (  13.59  )
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

Hi Crystal,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk-mem-ctrl/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Crystal-Guo/memory-mediatek-Add-an-interface-to-get-current-DDR-data-rate/20241212-170306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20241212090029.13692-2-crystal.guo%40mediatek.com
patch subject: [PATCH 1/2] memory/mediatek: Add an interface to get current DDR data rate
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241221/202412210955.FvO0Pee3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210955.FvO0Pee3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210955.FvO0Pee3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/memory/mediatek/mtk-dramc.c:300:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Wincompatible-pointer-types]
     300 |         .remove = dramc_remove,
         |                   ^~~~~~~~~~~~
   drivers/memory/mediatek/mtk-dramc.c:300:19: note: (near initialization for 'dramc_drv.<anonymous>.remove')


vim +300 drivers/memory/mediatek/mtk-dramc.c

   297	
   298	static struct platform_driver dramc_drv = {
   299		.probe = dramc_probe,
 > 300		.remove = dramc_remove,
   301		.driver = {
   302			.name = "dramc_drv",
   303			.owner = THIS_MODULE,
   304			.of_match_table = dramc_of_ids,
   305		},
   306	};
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

