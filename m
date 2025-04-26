Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92183C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 07:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnc4swAUT4ageYQdCgf2JvBEhLJpEZaUOqiedfOmY5A=; b=kor3/Mki/9kWJDP+NKR9kpeNAh
	+x6828Kj6tUik7nvPsV+D69ZeUX2NtNGlT9A3PisfS2FmtMBX3zqUbEmqKu8dqT/xfdRvFzZ8qDFY
	R3TkEZZPuA4g+sIEIzfd4eS/IhtvXakXPWrriGExXXPfRX/IuZd9nYkMdoTNNdUSoJavDBEfAwHxB
	JjY4zyBcUwHV/ESwFudausdkVG5x/cLGzKGUOB/h9/f5geyYIajqh0mo6amKML3U4fSRivhDCKG5o
	rzg17pu6IaRdzFrPQx9Ugw4ZF3y0YVUScZjbxPcT6PKbv4X0jZ+wv9xpa7S860z9RaFmUUmCaTRgb
	XBRphnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ZvD-00000001fLZ-3uTj;
	Sat, 26 Apr 2025 07:25:59 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ZXm-00000001cyo-3go4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 07:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745650907; x=1777186907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GP0K1Rv9ZXdHQPB5bmi50oLNLtVvYZGG8O2PcVpf/mg=;
  b=k5l3cfcv7wiw2SitjxMFDLQjo2i0DD2CwW9exphdvNUPtVcDwc48m9jP
   045xiwMxp0rsypAKq2O1cv1ZG0T0K1dkxJKmsiez3dCZozWM7oM/b7Pxj
   kHXO4HqB5a2i121bXJsBB7i0de7HADzqkYprez/vrvIHH1cpAV8weAYd1
   y/PJcmoZpH7IdoHApHDSb1wpFyGZy2/xBnCp1Q96EqIXrQtelSOT2BrSR
   oDcb5mIjPfOUGZvVvIlsXvNdwjcq6CUQe0j0Y912CV/BPQQEJHKRsR2uN
   mopqmsQ8zjiM8cBkMto4ajo8ORpWi4Y2AUWzq9uwEUZkQ78DIQqOsQ/VG
   w==;
X-CSE-ConnectionGUID: VocfuGGiQOGD8y73WVWzSw==
X-CSE-MsgGUID: /IL45RThQri0BGK+8SoBUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51112569"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="51112569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 00:01:46 -0700
X-CSE-ConnectionGUID: UB3CB3T6QZWK5LSf3Zj6Ag==
X-CSE-MsgGUID: ALlMkpTIRLKP8WKzX6udoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="138238692"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Apr 2025 00:01:40 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8ZXe-0005lJ-18;
	Sat, 26 Apr 2025 07:01:38 +0000
Date: Sat, 26 Apr 2025 15:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, lee@kernel.org,
	alexandre.torgue@foss.st.com, daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ukleinek@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, devicetree@vger.kernel.org, wbg@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com, fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v5 3/7] clocksource: stm32-lptimer: add support for
 stm32mp25
Message-ID: <202504261456.aCATBoYN-lkp@intel.com>
References: <20250425124755.166193-4-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425124755.166193-4-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_000146_965665_DBCE8061 
X-CRM114-Status: GOOD (  15.42  )
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

Hi Fabrice,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-leds/for-leds-next linus/master v6.15-rc3 next-20250424]
[cannot apply to atorgue-stm32/stm32-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabrice-Gasnier/dt-bindings-mfd-stm32-lptimer-add-support-for-stm32mp25/20250425-210409
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250425124755.166193-4-fabrice.gasnier%40foss.st.com
patch subject: [PATCH v5 3/7] clocksource: stm32-lptimer: add support for stm32mp25
config: arm-randconfig-003-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261456.aCATBoYN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504261456.aCATBoYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504261456.aCATBoYN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/timer-stm32-lp.c:57:6: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
      57 |         if (!val & STM32_LPTIM_ENABLE) {
         |             ^    ~
   drivers/clocksource/timer-stm32-lp.c:57:6: note: add parentheses after the '!' to evaluate the bitwise operator first
      57 |         if (!val & STM32_LPTIM_ENABLE) {
         |             ^                        
         |              (                       )
   drivers/clocksource/timer-stm32-lp.c:57:6: note: add parentheses around left hand side expression to silence this warning
      57 |         if (!val & STM32_LPTIM_ENABLE) {
         |             ^
         |             (   )
   1 warning generated.


vim +57 drivers/clocksource/timer-stm32-lp.c

    50	
    51	static int stm32mp25_clkevent_lp_set_evt(struct stm32_lp_private *priv, unsigned long evt)
    52	{
    53		int ret;
    54		u32 val;
    55	
    56		regmap_read(priv->reg, STM32_LPTIM_CR, &val);
  > 57		if (!val & STM32_LPTIM_ENABLE) {
    58			/* Enable LPTIMER to be able to write into IER and ARR registers */
    59			regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
    60			/*
    61			 * After setting the ENABLE bit, a delay of two counter clock cycles is needed
    62			 * before the LPTIM is actually enabled. For 32KHz rate, this makes approximately
    63			 * 62.5 micro-seconds, round it up.
    64			 */
    65			udelay(63);
    66		}
    67		/* set next event counter */
    68		regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
    69		/* enable ARR interrupt */
    70		regmap_write(priv->reg, STM32_LPTIM_IER, STM32_LPTIM_ARRMIE);
    71	
    72		/* Poll DIEROK and ARROK to ensure register access has completed */
    73		ret = regmap_read_poll_timeout_atomic(priv->reg, STM32_LPTIM_ISR, val,
    74						      (val & STM32_LPTIM_DIEROK_ARROK) ==
    75						      STM32_LPTIM_DIEROK_ARROK,
    76						      10, 500);
    77		if (ret) {
    78			dev_err(priv->dev, "access to LPTIM timed out\n");
    79			/* Disable LPTIMER */
    80			regmap_write(priv->reg, STM32_LPTIM_CR, 0);
    81			return ret;
    82		}
    83		/* Clear DIEROK and ARROK flags */
    84		regmap_write(priv->reg, STM32_LPTIM_ICR, STM32_LPTIM_DIEROKCF_ARROKCF);
    85	
    86		return 0;
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

