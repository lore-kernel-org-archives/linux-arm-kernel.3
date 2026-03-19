Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAB61075262
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 07:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/fUcPZMaN1EmAIgEAIs1BB2V9BDRyeP90qUb0Gut/4=; b=xrYUCML1UTepfeb54A4IKjP0Or
	3cG4C6NDuAyMDR0SH+uaTrP58lWKjLfso1RsXFPpq2TFk8JJV++85Y+aOTls1tkHfsmP5dxZ3My6Z
	hMOD62Y6AqGzcHu9GQrIc0cblR+QeJaXbqgTl06IGYPEQu6ocCJxJBm92zUubMI53Izg19hd2Ao2D
	P1sVsx2sBZ17UZpSJ2RidDvxO4eBIgp587OlfrO8xFstCKq5W6fJgEZfUsbN15qUDCbvA52PrQWyO
	Xntmw6He7GjLTRxwbMcJsLbLWr6WLjY/Wp/FbS6uvEHyBifLzNqCjvtwankI9igeIfAnagr8UZp+K
	TjB8A/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37QW-0000000A6Ge-0mxw;
	Thu, 19 Mar 2026 07:04:16 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37QT-0000000A6GF-1YlR;
	Thu, 19 Mar 2026 07:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773903854; x=1805439854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XWRb4tG0WfjZbF3L2bUwVIdS+/4y/LWaL3SwWGs47Z8=;
  b=cFNRpJXffnxMDHZ/rLN7fPnVMJHtYOy3KhcIN/9nrwaPhUVFjtdnlCuq
   rcOMHJ+01yAj6LqyZpFNua7DgLFeaVTuTWZiJp3dYtDFn/oPNfaEKV6i9
   uPEUXrxZqeIDlnb0B7wHnv4XSE3zoE7cuTl16VOWyiXUE6s/KwOxO08pP
   BHU5w3oEzAMVYma3uvQyowYc0c6VY73AJqaJCiRGM8KcZi+QyLn0YAgIp
   yU/AxkWyuMGzHvAC6vhof8rvaVhnC+UdRTjCkvoQYduqmfOTFCWlHnimn
   IOZ8ZbhxFg0BwLfH8bgPjGmQBW/lmezUuB8TywteyhV+xdZuJnQWMDMuE
   Q==;
X-CSE-ConnectionGUID: G7i3Q570SkiMIabT9QU7pg==
X-CSE-MsgGUID: 8nW3RhVLSuKCuNO30ckuLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="62538843"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="62538843"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:04:13 -0700
X-CSE-ConnectionGUID: 6kIld5kyQMCuWrGShd9Iow==
X-CSE-MsgGUID: ePfOVPAlSMy5V8WuidXKGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="224890375"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Mar 2026 00:04:08 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w37Ps-000000000Sn-1nKh;
	Thu, 19 Mar 2026 07:03:42 +0000
Date: Thu, 19 Mar 2026 15:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Briguglio <hello@superkali.me>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Daniele Briguglio <hello@superkali.me>
Subject: Re: [PATCH 3/3] clk: rockchip: rk3588: add GATE_GRF clocks for I2S
 MCLK output to IO
Message-ID: <202603191419.MH6EuPga-lkp@intel.com>
References: <20260316-rk3588-mclk-gate-grf-v1-3-66fb9a246718@superkali.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-rk3588-mclk-gate-grf-v1-3-66fb9a246718@superkali.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_000413_505505_331F9764 
X-CRM114-Status: GOOD (  12.38  )
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

Hi Daniele,

kernel test robot noticed the following build errors:

[auto build test ERROR on b84a0ebe421ca56995ff78b66307667b62b3a900]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniele-Briguglio/dt-bindings-clock-rockchip-rk3588-cru-add-I2S-MCLK-output-to-IO-clock-IDs/20260316-222240
base:   b84a0ebe421ca56995ff78b66307667b62b3a900
patch link:    https://lore.kernel.org/r/20260316-rk3588-mclk-gate-grf-v1-3-66fb9a246718%40superkali.me
patch subject: [PATCH 3/3] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260319/202603191419.MH6EuPga-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191419.MH6EuPga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191419.MH6EuPga-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/rockchip/clk-rk3588.c: In function 'rk3588_clk_early_init':
>> drivers/clk/rockchip/clk-rk3588.c:2496:29: error: implicit declaration of function 'kzalloc_obj' [-Wimplicit-function-declaration]
    2496 |                 sys_grf_e = kzalloc_obj(*sys_grf_e);
         |                             ^~~~~~~~~~~
>> drivers/clk/rockchip/clk-rk3588.c:2496:27: error: assignment to 'struct rockchip_aux_grf *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2496 |                 sys_grf_e = kzalloc_obj(*sys_grf_e);
         |                           ^


vim +/kzalloc_obj +2496 drivers/clk/rockchip/clk-rk3588.c

  2447	
  2448	static void __init rk3588_clk_early_init(struct device_node *np)
  2449	{
  2450		struct rockchip_clk_provider *ctx;
  2451		struct rockchip_aux_grf *sys_grf_e;
  2452		struct regmap *sys_grf;
  2453		unsigned long clk_nr_clks, max_clk_id1, max_clk_id2;
  2454		void __iomem *reg_base;
  2455	
  2456		max_clk_id1 = rockchip_clk_find_max_clk_id(rk3588_clk_branches,
  2457						ARRAY_SIZE(rk3588_clk_branches));
  2458		max_clk_id2 = rockchip_clk_find_max_clk_id(rk3588_early_clk_branches,
  2459						ARRAY_SIZE(rk3588_early_clk_branches));
  2460		clk_nr_clks = max(max_clk_id1, max_clk_id2) + 1;
  2461	
  2462		reg_base = of_iomap(np, 0);
  2463		if (!reg_base) {
  2464			pr_err("%s: could not map cru region\n", __func__);
  2465			return;
  2466		}
  2467	
  2468		ctx = rockchip_clk_init_early(np, reg_base, clk_nr_clks);
  2469		if (IS_ERR(ctx)) {
  2470			pr_err("%s: rockchip clk init failed\n", __func__);
  2471			iounmap(reg_base);
  2472			return;
  2473		}
  2474		early_ctx = ctx;
  2475	
  2476		rockchip_clk_register_plls(ctx, rk3588_pll_clks,
  2477					   ARRAY_SIZE(rk3588_pll_clks),
  2478					   RK3588_GRF_SOC_STATUS0);
  2479	
  2480		rockchip_clk_register_armclk(ctx, ARMCLK_L, "armclk_l",
  2481				mux_armclkl_p, ARRAY_SIZE(mux_armclkl_p),
  2482				&rk3588_cpulclk_data, rk3588_cpulclk_rates,
  2483				ARRAY_SIZE(rk3588_cpulclk_rates));
  2484		rockchip_clk_register_armclk(ctx, ARMCLK_B01, "armclk_b01",
  2485				mux_armclkb01_p, ARRAY_SIZE(mux_armclkb01_p),
  2486				&rk3588_cpub0clk_data, rk3588_cpub0clk_rates,
  2487				ARRAY_SIZE(rk3588_cpub0clk_rates));
  2488		rockchip_clk_register_armclk(ctx, ARMCLK_B23, "armclk_b23",
  2489				mux_armclkb23_p, ARRAY_SIZE(mux_armclkb23_p),
  2490				&rk3588_cpub1clk_data, rk3588_cpub1clk_rates,
  2491				ARRAY_SIZE(rk3588_cpub1clk_rates));
  2492	
  2493		/* Register SYS_GRF for I2S MCLK output to IO gate clocks */
  2494		sys_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3588-sys-grf");
  2495		if (!IS_ERR(sys_grf)) {
> 2496			sys_grf_e = kzalloc_obj(*sys_grf_e);
  2497			if (sys_grf_e) {
  2498				sys_grf_e->grf = sys_grf;
  2499				sys_grf_e->type = grf_type_sys;
  2500				hash_add(ctx->aux_grf_table, &sys_grf_e->node, grf_type_sys);
  2501			}
  2502		}
  2503	
  2504		rockchip_clk_register_branches(ctx, rk3588_early_clk_branches,
  2505					       ARRAY_SIZE(rk3588_early_clk_branches));
  2506	
  2507		rockchip_clk_of_add_provider(np, ctx);
  2508	}
  2509	CLK_OF_DECLARE_DRIVER(rk3588_cru, "rockchip,rk3588-cru", rk3588_clk_early_init);
  2510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

