Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A40D1039A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+1YBf//CJ0Klp9NkdbwC6JyVRNo/xjqVcwMeaGgnRk=; b=j7mpR5EkphZfj1TmhFbDu1owYJ
	1m1SIucxY/SqEdtrAi4tHE09TtX0/XpM5juFvWAAvkBFzkOHrZoofzeZ8gLXOHmOUT+sypu3zlHTH
	cpQZp1AOv6IRZGtnbfHyuodRzQWticrstiej6sHvqQC8HQgkbqPbR+6zuy1umN06Wo/MHzNGzKfNl
	ghdxmR/gZIHmm0kCnQTviWnTyp9Zwdj2kBfDnTcBe+1WyAoVSqrmhyrAo1Zgrn/cQnTVS+JrHQTP7
	QIAw+6RN0GUB7pKzDNrFrtHTWED6DwTqMwwOByiVgg35mQnB2Rd9Ad1JfnKRTTRb67VrVpkbfU0bR
	+bVLeW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Mcz-00000004KDp-1quV;
	Fri, 25 Oct 2024 15:53:29 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MXz-00000004JTi-2Na5;
	Fri, 25 Oct 2024 15:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729871299; x=1761407299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pYHHIJNTG01AQgTmBwG9U5BsfqO8HYoXVzbsu2Ldj1Y=;
  b=atUaxLq2g4YKKd1vowsHVR3mhFSQ8GooeBFr3qjZAa3fzV4UPVpAv8NT
   Aa7MV4Al1BuwTwiHl1Q10w9vR3+Nlvoks74MSKgyZNw6covAtPXWjH6hc
   eNn100rpFY/apH9FLzZKVHQFpZIcmshFj3kr1T1zkMSEV/v+qzUE7qoiN
   vUCoWS/z77Z2bNaMCKN4BCoJxmkOIQKifFWqtIbNGF/GNaAdU2smhREnI
   UowSimO+bL7fsEyEg6GQ4jB00Qo2Tpga+qpm/M59DfAShHUcLcx4vsbFJ
   /2qseHNudOO44jFYZi/ElI2TuJFu/Lbki5/d9fx8x0VRH9iWlQ0Lq3cKA
   w==;
X-CSE-ConnectionGUID: 2gPTC7ntQf+EgD0Oxu9kBQ==
X-CSE-MsgGUID: 5Sc1fF0DR9+em+JH3k4dMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="28996530"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="28996530"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 08:48:18 -0700
X-CSE-ConnectionGUID: 6O3g3ryfTOyp22Ft1rrElQ==
X-CSE-MsgGUID: TeHm3+K9ReK+WrkH/5guHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="80865917"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Oct 2024 08:48:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4MXp-000YQm-1F;
	Fri, 25 Oct 2024 15:48:09 +0000
Date: Fri, 25 Oct 2024 23:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <202410252357.pCyOX2bg-lkp@intel.com>
References: <20241025011000.244350-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025011000.244350-5-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_084819_679356_15767C03 
X-CRM114-Status: GOOD (  13.24  )
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

Hi Inochi,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on sophgo/for-next sophgo/fixes net-next/main net/main linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-net-snps-dwmac-Add-dwmac-5-30a-version/20241025-091315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241025011000.244350-5-inochiama%40gmail.com
patch subject: [PATCH v2 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410252357.pCyOX2bg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252357.pCyOX2bg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252357.pCyOX2bg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c: In function 'sophgo_dwmac_fix_mac_speed':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:30:16: error: implicit declaration of function 'rgmii_clock' [-Wimplicit-function-declaration]
      30 |         rate = rgmii_clock(speed);
         |                ^~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c: In function 'sophgo_sg2044_dwmac_init':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:46:13: warning: unused variable 'ret' [-Wunused-variable]
      46 |         int ret;
         |             ^~~


vim +/rgmii_clock +30 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

    23	
    24	static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
    25	{
    26		struct sophgo_dwmac *dwmac = priv;
    27		long rate;
    28		int ret;
    29	
  > 30		rate = rgmii_clock(speed);
    31		if (ret < 0) {
    32			dev_err(dwmac->dev, "invalid speed %u\n", speed);
    33			return;
    34		}
    35	
    36		ret = clk_set_rate(dwmac->clk_tx, rate);
    37		if (ret)
    38			dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
    39	}
    40	
    41	static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
    42					    struct plat_stmmacenet_data *plat_dat,
    43					    struct stmmac_resources *stmmac_res)
    44	{
    45		struct sophgo_dwmac *dwmac;
  > 46		int ret;
    47	
    48		dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
    49		if (!dwmac)
    50			return -ENOMEM;
    51	
    52		dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
    53		if (IS_ERR(dwmac->clk_tx))
    54			return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
    55					     "failed to get tx clock\n");
    56	
    57		dwmac->dev = &pdev->dev;
    58		plat_dat->bsp_priv = dwmac;
    59		plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
    60		plat_dat->fix_mac_speed = sophgo_dwmac_fix_mac_speed;
    61		plat_dat->multicast_filter_bins = 0;
    62		plat_dat->unicast_filter_entries = 1;
    63	
    64		return 0;
    65	}
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

