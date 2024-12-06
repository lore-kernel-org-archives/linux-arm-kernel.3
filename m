Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759B4E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 08:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlbhwV05PRQRcmyiMjnTDY1gEnoj/DcSGIfqgzLvL5s=; b=UpHBnJ0dtmKO8uhFn07bHjKWum
	h1qTzh8aZLc9VYoJwYQcpXfgNNFBuBzfJrsStFTGvRiWqXNRtdvX6Q0zdmNc+DAumcFHHYdzEfnrC
	vw+FoR7764bGEdZMPwh3t4vL4ka0/2Ez12rsOmkcA1AUeUKbQNoXHPsMvNrrBZqVbbm96xNcNVlzy
	bw3SNOGohVkQNylu99AqlGYM7RVqUk4fuE1CBbiLcSluJ0IM6de+0yXC8OEzgQMowNLb08JgxRfY5
	Srl7ESS2V3mv1DXyPVa9K+7kBJYkQCJTTpNbZQAG5p9uejQLTAOWfNo+9/Jpxa0qXp3uGckwDtNTw
	Gun02jwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTG1-00000000rYW-1faf;
	Fri, 06 Dec 2024 08:00:13 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTF0-00000000rL1-1PTz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 07:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471950; x=1765007950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uh1GtNgeJXD3jjxW/WbErm5HG89T+2j4ihV8ipDenzw=;
  b=UuBqxDHK3Xnpi2kj0IJ1VaVcoYpidbpuFYi+XGydKstdRvu2fRcICU7M
   JjYmEn8Ej3jDE4FFsjueS/MG9Z3ZOEZw725WWXZV3wQ8R19AFP4ZDsfMS
   nSUwvpQWXbNmWUfPsVmT5vPlQyIZr1stWzWjZDyroTS0xHPBCsudQL9HV
   YLbGeleaAqY5yB2AAHa5XNAXDonkrB/tJUOygWwt0NsOvAdz1A8xYupDt
   sXW5TKvO0i25dmTr604Tt5cmcWikpvLk+2gZIMBtM1dKgzaWDBHaLzCJH
   f6NVo8YqDE+iBp6cI6as0DQ7O3jly5OTCsz+GAloCc49H4Rch3Dkem5fc
   A==;
X-CSE-ConnectionGUID: KBnG/jPKQ02kx2ubFPzw6w==
X-CSE-MsgGUID: 3rejaF5jTrKyDwIaxSGEdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192755"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192755"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:06 -0800
X-CSE-ConnectionGUID: JvQ4gwdtSrS4ez3aatitGA==
X-CSE-MsgGUID: tB2L8oKAREmMv3tfZ4NGxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144258"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Dec 2024 23:59:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJTEq-0000pj-1e;
	Fri, 06 Dec 2024 07:59:00 +0000
Date: Fri, 6 Dec 2024 15:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] clk: samsung: Introduce Exynos990 clock
 controller driver
Message-ID: <202412061549.wyFF9u8X-lkp@intel.com>
References: <20241205193423.783815-4-igor.belwon@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205193423.783815-4-igor.belwon@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_235910_415576_A7217830 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Igor,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on krzk-dt/for-next clk/clk-next linus/master v6.13-rc1 next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Igor-Belwon/clk-samsung-clk-pll-Add-support-for-pll_-0717x-0718x-0732x/20241206-043559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241205193423.783815-4-igor.belwon%40mentallysanemainliners.org
patch subject: [PATCH v1 3/3] clk: samsung: Introduce Exynos990 clock controller driver
config: arm64-randconfig-004-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061549.wyFF9u8X-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061549.wyFF9u8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061549.wyFF9u8X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/samsung/clk-exynos990.c:13:10: fatal error: 'dt-bindings/clock/exynos990.h' file not found
      13 | #include <dt-bindings/clock/exynos990.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +13 drivers/clk/samsung/clk-exynos990.c

    12	
  > 13	#include <dt-bindings/clock/exynos990.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

