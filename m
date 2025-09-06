Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA0FCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 11:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OADmKvkdhRGWuXD6uv1y/uNpD600wLMePta/OUvP8ys=; b=btLe4WcG7pB6F8XYyoWXuvWF0j
	I/PStIPjPKyZzFo2xj+0GxfCtkCdv1IW2iSLkmCFDlcQGT64SQRD8bAsFbKeF3SSF1I+2aib5r0Q5
	9PumTpsVk5dVE2a0f079CLFUUZIwSJZmndjfpOyO56fMSeaJI3Ob5j9P74pL/IIeL51k0LGJ9qMLJ
	jfVo51h5A5fSPXqh1lda8OYb4N9c17lUj9oNy4ACD46yPikvEz8JqRThpQpLnop/b65/M8JmZ9+0q
	8+HK6Vr7wE+Nf4iyBP1OFmZwxVXEInh6YFvvQBfTa4Vqhzji689LiE2xVOg7GfI7zU7p6nRTDjGqq
	zFjDTEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uur7m-00000007goJ-2rGM;
	Sat, 06 Sep 2025 11:30:30 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uur4w-00000007gR7-3Ugm;
	Sat, 06 Sep 2025 11:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757158055; x=1788694055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gtt+QkW89qQ/xiE4F1ORAwE6JL5LfqecUfOhg9hp7B8=;
  b=nTOeL49+Hz1HWapD7r13kQOIgtMvYevFIGa2KDpHU2Jk5UW2TJUI2wiN
   qQq0FvH+a6BXLBIGvdKChMfmnM6Wu3ABhmGinpV56tKaj9F86kB132L69
   WQPnAxINJ5EfzmTfBn+AGuBygp/2X58NJ9B8xIv56he8jqlpr75WdTESK
   cbAcXgt/rQT0F4XE2n7RL0AB4j3dDgMShmuR3K8WBn/TR+AKwXrMs3ljj
   6sXub9bcjWm/VEu4DkjxAcxWgV3kF+GAkWsYWM4x1E5zdCtwW6j4PwAuw
   rtAon/ieGcZdcJRsu6miPAJ3b196gOkQvNVuWA/GVQWHIZU86FCq7faEX
   w==;
X-CSE-ConnectionGUID: QoLUj17tSCSAzCw24JHRfw==
X-CSE-MsgGUID: kH4Mf/yeQwOYk9j/WAar7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58525533"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="58525533"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 04:27:34 -0700
X-CSE-ConnectionGUID: OWRVGH4MTcqWp+tpytIhAw==
X-CSE-MsgGUID: P4w+HXhvSIeDmXPIiyKcPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="177626327"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Sep 2025 04:27:30 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uur4p-0001O3-18;
	Sat, 06 Sep 2025 11:27:27 +0000
Date: Sat, 6 Sep 2025 19:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH v3 2/2] clk: amlogic: add video-related clocks for S4 SoC
Message-ID: <202509061948.3VcIfqLx-lkp@intel.com>
References: <20250905-add_video_clk-v3-2-8304c91b8b94@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-add_video_clk-v3-2-8304c91b8b94@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_042734_908581_E519693B 
X-CRM114-Status: GOOD (  12.59  )
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

Hi Chuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuan-Liu-via-B4-Relay/dt-bindings-clock-add-video-clock-indices-for-Amlogic-S4-SoC/20250905-171121
base:   01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
patch link:    https://lore.kernel.org/r/20250905-add_video_clk-v3-2-8304c91b8b94%40amlogic.com
patch subject: [PATCH v3 2/2] clk: amlogic: add video-related clocks for S4 SoC
config: arm64-randconfig-002-20250906 (https://download.01.org/0day-ci/archive/20250906/202509061948.3VcIfqLx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061948.3VcIfqLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061948.3VcIfqLx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/meson/s4-peripherals.c:1135:26: error: 'mux_table_cts_sel' undeclared here (not in a function)
    1135 |                 .table = mux_table_cts_sel,
         |                          ^~~~~~~~~~~~~~~~~
>> drivers/clk/meson/s4-peripherals.c:1140:31: error: 's4_cts_parent_hws' undeclared here (not in a function); did you mean 's4_cts_parents'?
    1140 |                 .parent_hws = s4_cts_parent_hws,
         |                               ^~~~~~~~~~~~~~~~~
         |                               s4_cts_parents
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:30,
                    from include/linux/bitops.h:6,
                    from include/linux/of.h:15,
                    from include/linux/clk-provider.h:9,
                    from drivers/clk/meson/s4-peripherals.c:9:
   include/linux/compiler.h:197:82: error: expression in static assertion is not an integer
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:202:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/clk/meson/s4-peripherals.c:1141:32: note: in expansion of macro 'ARRAY_SIZE'
    1141 |                 .num_parents = ARRAY_SIZE(s4_cts_parent_hws),
         |                                ^~~~~~~~~~


vim +/mux_table_cts_sel +1135 drivers/clk/meson/s4-peripherals.c

  1129	
  1130	static struct clk_regmap s4_cts_encl_sel = {
  1131		.data = &(struct clk_regmap_mux_data){
  1132			.offset = CLKCTRL_VIID_CLK_DIV,
  1133			.mask = 0xf,
  1134			.shift = 12,
> 1135			.table = mux_table_cts_sel,
  1136		},
  1137		.hw.init = &(struct clk_init_data){
  1138			.name = "cts_encl_sel",
  1139			.ops = &clk_regmap_mux_ops,
> 1140			.parent_hws = s4_cts_parent_hws,
  1141			.num_parents = ARRAY_SIZE(s4_cts_parent_hws),
  1142			.flags = CLK_SET_RATE_PARENT,
  1143		},
  1144	};
  1145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

