Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BC1C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 23:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRTAtS+PqLGgoX0KUF2yxa87zN4HrUWl2C+fmoRKzXw=; b=V9VkuAj+ZPuLd3KnGp+7/FVISV
	QhnaHxuOjqac2Iy6NHVaBJYjEPGhrEr2cUEDKp623HnHFIeIOXSq5+rckENmAJJK6d7NYvoSgfUL5
	b2ZNJ7twBxBM7rBztoQ/iA6RnEyhrHwUQzLg7m1IOFRLQEkRQFeAmaYJr7rtIiRFs/scjBnPGvGAS
	ektNlIMM3dGC329A1UGvvQUWuuY9KLn1C3zEubL63D+9D7CGy9mdUTweI67pep/y5v0cCrxL8YhDK
	x72I02gpT5XS7pztEQisWfrH844AuGLxfgTWQzrzwPwLo2PJADGHKhqJV8Dq4dgDB7CBgh3fY8mAK
	+GUiIT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKQ4U-0000000EMiV-3bZ4;
	Wed, 28 May 2025 23:20:30 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKQ2C-0000000EMEx-0qpm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 23:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748474288; x=1780010288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OlkQ5LDNFcAG4+B3fU48CyA1LXgDRJ2eUlh71NIIl0g=;
  b=Jlv4JkvB3rycat4AdDXxcybti9Vccu0M1XPEc5MasGtBxbD+giqNhjWd
   be5h+WBZ3jpk9p7JLPITivUM75wiACWLYcK37f8JJxyC6pP1eFo+X0QwJ
   lsMw/Ur+AYA+DG6s61lHJtzuDiWC6Xay/DB4HbHLmyEKE0vbHeejLjwKQ
   YvGVZC7WNzkNFiUwwOflz4LOmDu90Q28T5kp0PJKaooNki19JQScaEzoI
   s/uwDwE9pb6+/gOuC4GVJIM7HslqFTIXYZCoGupa9+hpS2dq1d/acTCPL
   +Qj21TwuLKYYREwLd0iskHWA1vieMaRM+zKN2IQzZsuSIvMiud88BbXpd
   g==;
X-CSE-ConnectionGUID: HySF5D1ESE6D2LMnq4EEDA==
X-CSE-MsgGUID: Oh8PwEUdRpKBvtV8xnUg9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="68070668"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="68070668"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 16:18:05 -0700
X-CSE-ConnectionGUID: Ynjqfh96TUCxktsd33xPwA==
X-CSE-MsgGUID: M+fn4Cj8S6uE04O0uNAhPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148524148"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 May 2025 16:18:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKQ23-000W9G-1F;
	Wed, 28 May 2025 23:17:59 +0000
Date: Thu, 29 May 2025 07:17:03 +0800
From: kernel test robot <lkp@intel.com>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] clk: samsung: exynos990: Add CMU_HSI1 block
Message-ID: <202505290752.ccgBnlpc-lkp@intel.com>
References: <20250528105252.157533-3-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528105252.157533-3-umer.uddin@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_161808_263735_1765FEF5 
X-CRM114-Status: GOOD (  13.87  )
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

Hi Umer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on krzk-dt/for-next clk/clk-next linus/master v6.15 next-20250528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umer-Uddin/dt-bindings-clock-exynos990-Add-CMU_HSI1-bindings/20250528-185847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250528105252.157533-3-umer.uddin%40mentallysanemainliners.org
patch subject: [PATCH v1 2/2] clk: samsung: exynos990: Add CMU_HSI1 block
config: arm-randconfig-002-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290752.ccgBnlpc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290752.ccgBnlpc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290752.ccgBnlpc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/samsung/clk-exynos990.c:15:
>> drivers/clk/samsung/clk-exynos990.c:1666:7: warning: 'mout_hsi1_mmc_card_p' defined but not used [-Wunused-const-variable=]
    PNAME(mout_hsi1_mmc_card_p) =  { "oscclk",
          ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:237:44: note: in definition of macro 'PNAME'
    #define PNAME(x) static const char * const x[] __initconst
                                               ^
>> drivers/clk/samsung/clk-exynos990.c:1658:7: warning: 'mout_hsi1_bus_p' defined but not used [-Wunused-const-variable=]
    PNAME(mout_hsi1_bus_p) =  { "dout_cmu_shared0_div3",
          ^~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:237:44: note: in definition of macro 'PNAME'
    #define PNAME(x) static const char * const x[] __initconst
                                               ^
>> drivers/clk/samsung/clk-exynos990.c:1657:7: warning: 'mout_hsi1_pcie_p' defined but not used [-Wunused-const-variable=]
    PNAME(mout_hsi1_pcie_p) =  { "oscclk", "fout_shared2_pll" };
          ^~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:237:44: note: in definition of macro 'PNAME'
    #define PNAME(x) static const char * const x[] __initconst
                                               ^
>> drivers/clk/samsung/clk-exynos990.c:1653:7: warning: 'mout_hsi1_ufs_card_p' defined but not used [-Wunused-const-variable=]
    PNAME(mout_hsi1_ufs_card_p) =  { "oscclk",
          ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:237:44: note: in definition of macro 'PNAME'
    #define PNAME(x) static const char * const x[] __initconst
                                               ^
>> drivers/clk/samsung/clk-exynos990.c:1649:7: warning: 'mout_hsi1_ufs_embd_p' defined but not used [-Wunused-const-variable=]
    PNAME(mout_hsi1_ufs_embd_p) =  { "oscclk",
          ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:237:44: note: in definition of macro 'PNAME'
    #define PNAME(x) static const char * const x[] __initconst
                                               ^


vim +/mout_hsi1_mmc_card_p +1666 drivers/clk/samsung/clk-exynos990.c

  1647	
  1648	/* Parent clock list for CMU_HSI1 muxes */
> 1649	PNAME(mout_hsi1_ufs_embd_p) =		{ "oscclk",
  1650						  "dout_cmu_shared0_div4",
  1651						  "dout_cmu_shared2_div2",
  1652						  "oscclk" };
> 1653	PNAME(mout_hsi1_ufs_card_p) =		{ "oscclk",
  1654						  "dout_cmu_shared0_div4",
  1655						  "dout_cmu_shared2_div2",
  1656						  "oscclk" };
> 1657	PNAME(mout_hsi1_pcie_p) =		{ "oscclk", "fout_shared2_pll" };
> 1658	PNAME(mout_hsi1_bus_p) =		{ "dout_cmu_shared0_div3",
  1659						  "dout_cmu_shared0_div4",
  1660						  "dout_cmu_shared1_div4",
  1661						  "dout_cmu_shared4_div3",
  1662						  "dout_cmu_shared2_div2",
  1663						  "fout_mmc_pll",
  1664						  "oscclk",
  1665						  "oscclk" };
> 1666	PNAME(mout_hsi1_mmc_card_p) =		{ "oscclk",
  1667						  "fout_shared2_pll",
  1668						  "fout_mmc_pll",
  1669						  "dout_cmu_shared0_div4" };
  1670	PNAME(mout_hsi1_bus_user_p) =		{ "oscclk", "dout_cmu_hsi1_bus" };
  1671	PNAME(mout_hsi1_mmc_card_user_p) =	{ "oscclk", "dout_cmu_hsi1_mmc_card" };
  1672	PNAME(mout_hsi1_pcie_user_p) =		{ "oscclk", "dout_cmu_hsi1_pcie" };
  1673	PNAME(mout_hsi1_ufs_card_user_p) =	{ "oscclk", "dout_cmu_hsi1_ufs_card" };
  1674	PNAME(mout_hsi1_ufs_embd_user_p) =	{ "oscclk", "dout_cmu_hsi1_ufs_embd" };
  1675	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

