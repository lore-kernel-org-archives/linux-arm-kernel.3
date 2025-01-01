Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EDEE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jan 2025 17:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWEXo+4LhXx4wQX4yQ+sbTtleHpG3OF3AWBJ7Fe13hE=; b=YO/t+Rg63mzT0Tz+8JuOLDeaKn
	1dIb7I7keLCi8YKbcEQ+Nu3As1Xb8P+WNBsZJM9827wOKpLZdd/mU6i4479Q8jRNEe5UHERANMMVS
	Qz4V9Zwc7sAlKm/vpar57SkxGs62x+VDa+XVCSNBa+gp13+oWclgX7/FivLPx4OyiIckkkDvCTGj7
	Uww3049kSIhdRSyxBlUh4F6U8RAfO1OTPGFkfJ/HX0nzWgq7pkpSRMeAgouf6kGKKLBIllnvUp2St
	phPjI3IwQUKqvcyMO5b8GK9f3TjVrPGpveRIwG6Gbg2dgOMS4edDvpERo+Fz7xFp3NJQhWtSxw9ka
	zBRwpFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tT2Ff-00000009DPU-0PpD;
	Wed, 01 Jan 2025 17:11:23 +0000
Received: from [192.198.163.13] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tT2EQ-00000009DHk-3UcC;
	Wed, 01 Jan 2025 17:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735751407; x=1767287407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w4806pHttcq14fcDsE1TCQs1bNJyXM6xixxGIsaUg00=;
  b=R9qvFud+jcfMkthSHNDaSAdwrVI3Z6h/VfeY4kS2OQK9NR+6ES8zNXN7
   uPQ7CxazMpmyEIBT9C6vPCgx4DftDQOx/tnIDTyqrm/69a9M80vrS8QGH
   beS09eMIKElnd9waqldO8HtQT9iJQmEd4z6cXrL3Hjk4TDQKhA2VLC/Nn
   RSWJv3stSxNRqJbRu1Cr1GaNL7tlktFp8pxKc+PRG3Qx/w9sJ0YBMiTFq
   2iMN3fZanbkbEtPkewLHTqPK1BK6tUL+i9m9xk/fHjPnqXUEi7BVAv3+E
   US61dfz73O2lo2wttea4iHGjUCcEn+wBp/r3ivgKN7DyI9+RfXLds5o03
   w==;
X-CSE-ConnectionGUID: VtOjt3aGRWCeB09s5nWcPQ==
X-CSE-MsgGUID: HpEoNWwKRp+1IjhJyLJLAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="38830085"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="38830085"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 09:09:59 -0800
X-CSE-ConnectionGUID: skjhXKsiSWyP1f8EVfehDQ==
X-CSE-MsgGUID: 1u7BJ6rmS0+nb2yF7WxL+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132237852"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jan 2025 09:09:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tT2EC-0007xz-1b;
	Wed, 01 Jan 2025 17:09:52 +0000
Date: Thu, 2 Jan 2025 01:09:14 +0800
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
Subject: Re: [PATCH 5/5] clk: meson: t7: add t7 clock peripherals controller
 driver
Message-ID: <202501020007.bve7QkV9-lkp@intel.com>
References: <20241231060047.2298871-6-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231060047.2298871-6-jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_091006_915964_F5B13EF9 
X-CRM114-Status: GOOD (  12.33  )
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
patch link:    https://lore.kernel.org/r/20241231060047.2298871-6-jian.hu%40amlogic.com
patch subject: [PATCH 5/5] clk: meson: t7: add t7 clock peripherals controller driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250102/202501020007.bve7QkV9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501020007.bve7QkV9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501020007.bve7QkV9-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: module t7-pll uses symbol meson_clk_hw_get from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol meson_clk_pll_ops from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol clk_regmap_divider_ops from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol meson_clk_pcie_pll_ops from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol meson_clk_mpll_ops from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol clk_regmap_gate_ops from namespace CLK_MESON, but does not import it.
WARNING: modpost: module t7-pll uses symbol clk_regmap_mux_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-peripherals uses symbol meson_clk_hw_get from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-peripherals uses symbol clk_regmap_gate_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-peripherals uses symbol meson_clk_dualdiv_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-peripherals uses symbol clk_regmap_mux_ops from namespace CLK_MESON, but does not import it.
>> WARNING: modpost: module t7-peripherals uses symbol clk_regmap_divider_ops from namespace CLK_MESON, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

