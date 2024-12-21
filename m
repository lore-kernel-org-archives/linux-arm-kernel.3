Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032F5E77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 11:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFjU7eH9WbkZruY/LJ0A1KQ5qNhoCMltjcHY6xaOSjc=; b=EsWA4CCUOTdS45xpuK+Hke8lu/
	q9eo9uyOdY6/xJ8gwSXvI7JzieyO14B1U/GJPh7QZwbReqjHKCj3iiE3yosCMXws2/rDzUGEvFyX0
	iAA0pCXCTzvC7RV+zIu3xIv4Ido6r+d5ehwYzigXchF5hpFUgHbb//nElL5i7LmTEVh0bKyOS9MjE
	hP8+TinPOgQzdcc0ecrIAGzq+utXi94mSJlFqIxA4luFUNnwPILFfGFNNHcjBn2Vxzl3zg0jf0Q0t
	/FNgZoTyA6nKmhzxnNwnOz4qW7bEFksc+j9b2mz8y76VKbQvVjwgHPdr3J7VvRPQYIt4G7WxF6hiI
	DRv12w1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOxIm-00000006tFo-2kP3;
	Sat, 21 Dec 2024 11:05:44 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOxHZ-00000006tAQ-2iC6;
	Sat, 21 Dec 2024 11:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734779070; x=1766315070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ES8Y72tN7tCHNq2hsEeiaznpfJMqN6LAm9ib+DuisM4=;
  b=LmAVfz5ebS24+5eUmdW/2PU+S/hkeXA9VY5TuS7UIEXqduf8fOTBXXcd
   +4cPjpsUAD+zqGpXs14K6f3aG9PupEcKbXMY0HBfTsLoeLMttxIYaE5T7
   ZCYUPthYmSYmIKe/EaFeqlGn0sVmi5jJcFxzwPJsDIOwUiKrBp1/1ae3K
   cdeDQ3F0sU/aMvJG9AawyCL0GY3ZW2wNtZOZOy8J+Lc+NDnWkZP7Ubo0L
   bYp6v8xmKcW8ObOQ7GGcJrXsGb67XnUrdYzZaVDNWhsh8Dwj3yyWEmaAD
   Ug5Bs1EW/Ne4I9jkWYvk5JvCEeztoVQOvmEUOGo4Wz7MIRC2sV2fMXvkm
   A==;
X-CSE-ConnectionGUID: +cF02rlySWO4s7ajvd/ZmA==
X-CSE-MsgGUID: botm1ycCSgGnFct3C+z0kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39253553"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="39253553"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 03:04:29 -0800
X-CSE-ConnectionGUID: uFj1EdARQcqphn1GerJJrA==
X-CSE-MsgGUID: Lnl/soBsT22O45oTf0M77A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="99145758"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2024 03:04:26 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOxHT-000295-2w;
	Sat, 21 Dec 2024 11:04:23 +0000
Date: Sat, 21 Dec 2024 19:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: Crystal Guo <crystal.guo@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/2] memory/mediatek: Add an interface to get current DDR
 data rate
Message-ID: <202412211805.ulwSEmZa-lkp@intel.com>
References: <20241212090029.13692-2-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212090029.13692-2-crystal.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_030429_737140_BB8AD196 
X-CRM114-Status: GOOD (  13.77  )
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241221/202412211805.ulwSEmZa-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211805.ulwSEmZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211805.ulwSEmZa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/memory/mediatek/mtk-dramc.c:300:12: error: incompatible function pointer types initializing 'void (*)(struct platform_device *)' with an expression of type 'int (struct platform_device *)' [-Wincompatible-function-pointer-types]
     300 |         .remove = dramc_remove,
         |                   ^~~~~~~~~~~~
   1 error generated.


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

