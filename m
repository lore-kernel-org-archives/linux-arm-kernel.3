Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AA8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 22:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lKoo/ZbDhYM9RiCmirWI9K2heacv2o2hdJ55p6p3QY=; b=dRwbF7ynrTu0f6xzQUodm8MsiL
	SWZTuQFI2+ZpyNS4SuPPq59UrQtSPnwtmnR586hpL4808XA6cLfY9kWh2PqZOPm4BurwuLmMIL4mZ
	QXDJqgQ0MmCAnPSg7XJ5xsS+XB3lNa3NRER4AGM/GPEmjokRD5pHutJvrluUl7F7TUa8wqiGiGFws
	i8tXqiI9qa/nepNKGYaKxAoe5zU4iyVeekEf3MmxesV5gxOErbE2icJ0wlXlgXMZISLpCgVPxcPsp
	C+J27fQD+6ZVN+48y/oxhPHf/CGmz5hpK8P0UNlJbuDsMbt7L1OeKlXvIe8LEFGjB6LAykAwHtyg5
	3lbqABcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Bpv-0000000EY7l-0v3G;
	Sat, 05 Apr 2025 22:17:59 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1BoA-0000000EY2l-1jyK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 22:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743891370; x=1775427370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xXUS4GgMNiPbO1jwMYGA+GWr2ekyWvBCCBz0RyIJHDM=;
  b=ZednLHSLeeM4wbi/4UI4nKOHa7ISx8olIqZHdDfi2hYSkoqdaXSIGItz
   YYbHeNflTSDmuYUd3W9Rc1+14RYnyBh0FqLGgQYQcXTql6mSYS8AbgdL/
   WzmHTgmNORvx23U7bobZ9/ThkgOnQ7D5K2V7S5PZpbDbEcJ86XHPDq//y
   68P5Gre/8Eanr8VDZnfhMLFDdQbRGQRW1pZdWXwZOI1CkUychvfMH9m9m
   LycL4LF9LWGalGRmZNzdKwYqZ2/bTnRnEOxAV1yTr91uTyPqIDQbFX23Q
   80GtEb5+kQRvukyeRfJC7Eq5IhcaU/aIOLjIG4mpcjHdCgC5dxlxCsGsg
   w==;
X-CSE-ConnectionGUID: coZz3HVFRkSIFkKlgAxhcg==
X-CSE-MsgGUID: O6q+qOhbQ/ikSoZgngGzCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="48018101"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="48018101"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 15:16:06 -0700
X-CSE-ConnectionGUID: g4MEpJ50TTiUgcuNLPmOSw==
X-CSE-MsgGUID: C0wrrevxTpKJWYkd9AmLDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="128116775"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Apr 2025 15:16:04 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1Bo2-0002Jz-06;
	Sat, 05 Apr 2025 22:16:02 +0000
Date: Sun, 6 Apr 2025 06:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-pwm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] pwm: stm32: Emit debug output also for corner cases
 of the rounding callbacks
Message-ID: <202504060517.dHXuUANs-lkp@intel.com>
References: <fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_151610_492388_F3FAB665 
X-CRM114-Status: GOOD (  14.76  )
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

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on e48e99b6edf41c69c5528aa7ffb2daf3c59ee105]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/pwm-Let-pwm_set_waveform-succeed-even-if-lowlevel-driver-rounded-up/20250405-173024
base:   e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
patch link:    https://lore.kernel.org/r/fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH 4/6] pwm: stm32: Emit debug output also for corner cases of the rounding callbacks
config: arm-randconfig-004-20250406 (https://download.01.org/0day-ci/archive/20250406/202504060517.dHXuUANs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060517.dHXuUANs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060517.dHXuUANs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dmaengine.h:8,
                    from include/linux/mfd/stm32-timers.h:11,
                    from drivers/pwm/pwm-stm32.c:12:
   drivers/pwm/pwm-stm32.c: In function 'stm32_pwm_round_waveform_fromhw':
>> drivers/pwm/pwm-stm32.c:246:60: error: 'rate' undeclared (first use in this function)
     246 |   pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
         |                                                            ^~~~
   include/linux/dev_printk.h:139:35: note: in definition of macro 'dev_no_printk'
     139 |    _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
         |                                   ^~~~~~~~~~~
   drivers/pwm/pwm-stm32.c:245:2: note: in expansion of macro 'dev_dbg'
     245 |  dev_dbg(&chip->dev, "pwm#%u: CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x @%lu -> %lld/%lld [+%lld]\n",
         |  ^~~~~~~
   drivers/pwm/pwm-stm32.c:246:60: note: each undeclared identifier is reported only once for each function it appears in
     246 |   pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
         |                                                            ^~~~
   include/linux/dev_printk.h:139:35: note: in definition of macro 'dev_no_printk'
     139 |    _dev_printk(level, dev, fmt, ##__VA_ARGS__); \
         |                                   ^~~~~~~~~~~
   drivers/pwm/pwm-stm32.c:245:2: note: in expansion of macro 'dev_dbg'
     245 |  dev_dbg(&chip->dev, "pwm#%u: CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x @%lu -> %lld/%lld [+%lld]\n",
         |  ^~~~~~~


vim +/rate +246 drivers/pwm/pwm-stm32.c

   208	
   209	static int stm32_pwm_round_waveform_fromhw(struct pwm_chip *chip,
   210						   struct pwm_device *pwm,
   211						   const void *_wfhw,
   212						   struct pwm_waveform *wf)
   213	{
   214		const struct stm32_pwm_waveform *wfhw = _wfhw;
   215		struct stm32_pwm *priv = to_stm32_pwm_dev(chip);
   216		unsigned int ch = pwm->hwpwm;
   217	
   218		if (wfhw->ccer & TIM_CCER_CCxE(ch + 1)) {
   219			unsigned long rate = clk_get_rate(priv->clk);
   220			u64 ccr_ns;
   221	
   222			/* The result doesn't overflow for rate >= 15259 */
   223			wf->period_length_ns = stm32_pwm_mul_u64_u64_div_u64_roundup(((u64)wfhw->psc + 1) * (wfhw->arr + 1),
   224										     NSEC_PER_SEC, rate);
   225	
   226			ccr_ns = stm32_pwm_mul_u64_u64_div_u64_roundup(((u64)wfhw->psc + 1) * wfhw->ccr,
   227								       NSEC_PER_SEC, rate);
   228	
   229			if (wfhw->ccer & TIM_CCER_CCxP(ch + 1)) {
   230				wf->duty_length_ns =
   231					stm32_pwm_mul_u64_u64_div_u64_roundup(((u64)wfhw->psc + 1) * (wfhw->arr + 1 - wfhw->ccr),
   232									      NSEC_PER_SEC, rate);
   233	
   234				wf->duty_offset_ns = ccr_ns;
   235			} else {
   236				wf->duty_length_ns = ccr_ns;
   237				wf->duty_offset_ns = 0;
   238			}
   239		} else {
   240			*wf = (struct pwm_waveform){
   241				.period_length_ns = 0,
   242			};
   243		}
   244	
   245		dev_dbg(&chip->dev, "pwm#%u: CCER: %08x, PSC: %08x, ARR: %08x, CCR: %08x @%lu -> %lld/%lld [+%lld]\n",
 > 246			pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
   247			wf->duty_length_ns, wf->period_length_ns, wf->duty_offset_ns);
   248	
   249		return 0;
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

