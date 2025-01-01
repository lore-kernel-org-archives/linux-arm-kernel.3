Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43356E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jan 2025 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1CKd0WGfXAB7vA7hQeRHeKPuvx3vIwg7kYPxMCM2rM=; b=NFKDBDixi8hi9aeJA4MSz3NHRo
	tmFfKula5BQEclJvBMLfCoQsPMvaFdGEoNYbbWOnMtSa+A8L2qkZQxWDsNb2FcqN61XY9Na5p0pXg
	J1q6l0PAt5REcmIVDnoqf0c5Eh2JihLPvr37abPkXGRnslaJzWW0EXyqE8gLFxg0Xc3Jobdr7FnTc
	uPivrmZgy1k9PFz59gX/HAoT3E+MVSpzJy4z1i5ftcQYdt450Q9iWI42jdCxTYSaGTbs1vfsCMWro
	3jtMDmS6F7BEc721ySJOxdvgBjffzeJr1M/X6DUX/rqyOCIYf/r9M51RIq/MDT/qccPiI5lGj3zcA
	UmnDnmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSuei-00000008Skz-2xCi;
	Wed, 01 Jan 2025 09:04:44 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSudW-00000008SdA-2XjG;
	Wed, 01 Jan 2025 09:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735722210; x=1767258210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nz9aDcQrTUetxC6iaoCKUJgnBxM+z4ES6m8B+iYezLY=;
  b=BWa6NUfio121hELwaZJoH5MRkXX3dtBUn8wLhY86i6MuqVQucAgJCH7R
   92VYekKeBKvUzldHJddG+4G0DmYhMFvvf7Qcsap0ZzH/KE36SeG3VeBgq
   i3SlziZpTESOewXZ76gZD7KTdkMbODXHQNznfh9ykTjHYfsvwuYaTNivK
   4AsS8+zi/Yt9+A2O+WJlR9dnXVbSR+aipIJbhD5jamyigcpUpDvtYBAD2
   ZNoi0K5p3NoZV31Yg2VIE4iwkQdC0/cZVXF1CiNc3Q1LK/RNDD0Ro5Nm9
   B0CCcjrYIOmrGWKqJziBauQ/ad0Sb6OCiDQrbRFK7U3kZbVaUB/RzcPck
   A==;
X-CSE-ConnectionGUID: SQPseovYTqKbgmQRSd2BwA==
X-CSE-MsgGUID: MSPC4cQOQ9yDWakkpL9mQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46972197"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="46972197"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 01:03:26 -0800
X-CSE-ConnectionGUID: XuUNBDnHRJ6foHwmfMM9/A==
X-CSE-MsgGUID: IBcWmbpJQUmPS6sZZkwOAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101051676"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jan 2025 01:03:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSudM-0007jb-19;
	Wed, 01 Jan 2025 09:03:20 +0000
Date: Wed, 1 Jan 2025 17:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jian Hu <jian.hu@amlogic.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/5] clk: meson: t7: add support for the T7 SoC PLL clock
Message-ID: <202501011623.EZwn2GFV-lkp@intel.com>
References: <20241231060047.2298871-5-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231060047.2298871-5-jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_010330_691756_01408808 
X-CRM114-Status: GOOD (  13.10  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.13-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Hu/dt-bindings-clock-add-Amlogic-T7-PLL-clock-controller/20241231-141835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241231060047.2298871-5-jian.hu%40amlogic.com
patch subject: [PATCH 4/5] clk: meson: t7: add support for the T7 SoC PLL clock
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250101/202501011623.EZwn2GFV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011623.EZwn2GFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011623.EZwn2GFV-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module t7-pll uses symbol meson_clk_hw_get from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol meson_clk_pll_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol clk_regmap_divider_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol meson_clk_pcie_pll_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol meson_clk_mpll_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol clk_regmap_gate_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-pll uses symbol clk_regmap_mux_ops from namespace CLK_MESON, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

