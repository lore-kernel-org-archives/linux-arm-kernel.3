Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09755D12692
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 03:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFAdreauSNoqNkNTkr/DzuseKmYCWOi6IFiwFbZopQ0=; b=lthPqOjn+T9g6icmFMYlhrqA/Q
	Fx0inTY7jF2mmuyzR5aJW0sklORJed0TOSoSI9d3NwWolXbMCgPv8a6hChmvY+cgZu+v39i3AMnbo
	neZIY4ZRKRcMRORzMN/2i/dHNxpOCJH54c/tGy6H9zckNkVj1Q131VHKf8LBQ64PMaGxytDUoabjD
	kjzfo+Bn/DvpG46F9NpgcVCOPRXXrYvXxnUc5KZWJWxO/Wjp1oxBxGfrK6otH51U6A/+4aXhAly5M
	wsiqRyBnWgIAWr4DetdvC3BqtPbvoovmzUThV6NSi0r2qpBYkvvK4QKrsv4kAlKPF0q61i1VooqGf
	9rKqVBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRipk-0000000AWsE-40Qq;
	Sat, 06 Dec 2025 03:19:44 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRiph-0000000AWrk-31G2;
	Sat, 06 Dec 2025 03:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764991182; x=1796527182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5gH637Pes04sa8dca3MnyEjtJ4p46PyN8XeJW2eyJ/s=;
  b=End4kVXZYaL1FtOQNiCI1f8LFRDc2ta0KZ4tBAMsjy+TV97hX+yD9u20
   Fn0eMiYKj6aFbApH55j6M+4GSXYfZ1BG7ASlXE38gwbgeCqqF6d1IRROd
   UQoUfwc8iiWEfV9rLaaAx/7SQpC9D5P8nzIRq5c5/Dyw+wg8mgJFkOxKn
   9coDDDyN5X9MGYLYADRbbcdIiaczRoZAa51f2Yz4ysNO8T7De64iWMAle
   l1fbM9Hjta8EAS/Mrc44l7Z7QrdylyhM5eM3zelvJTPnXMD39MyIE1OKU
   qUspaVdOglewgaCLrKJdScSKIlJ3luFywR9U76Jjk2EU/fUxHAcsenrSn
   A==;
X-CSE-ConnectionGUID: OtIXD5uPTHGEPVvIenLbkQ==
X-CSE-MsgGUID: IrTPpenhR9SkAupvJzMaig==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70877767"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="70877767"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 19:19:40 -0800
X-CSE-ConnectionGUID: /FlQIMuHQ6WB1l5Y0IpOnA==
X-CSE-MsgGUID: 1rZPUzLrShiRQVuphcTEzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="199929287"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Dec 2025 19:19:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRipZ-00000000Fob-2I6r;
	Sat, 06 Dec 2025 03:19:33 +0000
Date: Sat, 6 Dec 2025 11:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jian Hu <jian.hu@amlogic.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 4/5] clk: meson: t7: add support for the T7 SoC PLL
 clock
Message-ID: <202512061054.wsIzRCCd-lkp@intel.com>
References: <20251204053635.1234150-5-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204053635.1234150-5-jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_191941_825368_61FD6F9F 
X-CRM114-Status: GOOD (  10.51  )
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

Hi Jian,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.18 next-20251205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Hu/dt-bindings-clock-add-Amlogic-T7-PLL-clock-controller/20251204-135351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251204053635.1234150-5-jian.hu%40amlogic.com
patch subject: [PATCH v6 4/5] clk: meson: t7: add support for the T7 SoC PLL clock
config: arm64-randconfig-003-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061054.wsIzRCCd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061054.wsIzRCCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061054.wsIzRCCd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: meson_clk_mpll_ops
   >>> referenced by t7-pll.c
   >>>               drivers/clk/meson/t7-pll.o:(.compoundliteral.51) in archive vmlinux.a
   >>> referenced by t7-pll.c
   >>>               drivers/clk/meson/t7-pll.o:(.compoundliteral.59) in archive vmlinux.a
   >>> referenced by t7-pll.c
   >>>               drivers/clk/meson/t7-pll.o:(.compoundliteral.67) in archive vmlinux.a
   >>> referenced 1 more times
   >>> did you mean: meson_clk_pll_ops
   >>> defined in: vmlinux.a(drivers/clk/meson/clk-pll.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

