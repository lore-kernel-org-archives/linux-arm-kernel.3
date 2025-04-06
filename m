Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6548C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 05:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ezvxs+fwfJsqCkpadDt5g+sQAfZtV3GL2swMmJHhpYU=; b=vH9Pp5sL9p1WtoEiC9zq2KZyyP
	dTo4x2W2sKE+yEi6tmWpFOonzuteOPVsuIlIw3WIxt0hHCg2BiZQ0+SqHtvVeOMJWijSEztByjKQt
	7IPGIn+Vsy3qd0bF0sW0It9r6ilvEI2wOefJuJMHbAzCuaknTAtR4HElhqJVG6fg8KP2JR9+GfuoT
	yvcINxiU3Ntk1LnsKl/bU/1q/3+7+jV5tlJVLNRTm/NMJ6azqL4JNEOKpdkAtI+g5UayTZ7YRwrED
	TMWtc2GmOiKcjrvfP99I2KU+WlyPlTk3ZHzqvu9NtouFhCcy/yQ608XIaIxmw/FHOPrEJdq+lVMzd
	cyUxro7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1I8T-0000000ErQy-0G1Z;
	Sun, 06 Apr 2025 05:01:33 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1I6h-0000000ErKB-1LU3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 04:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743915583; x=1775451583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jZis5iEY4tCqO7K5vNNJgbuHf7Bs+RX9cH+CAloWBw4=;
  b=gUv9BztNNmBgu2C0ePG0xnlZ22lg+m0ERx7BrEpSE7wPl4n+17myvbuB
   xwY4NkqFNM3O2bufb1m8Nm6CUA76VQdORvehCHlPiUtLz7Gq7ZCScFdpR
   4MFQ7/My3Ck0qY5wR3moA9ftjewOqeJHHFG1vpqVb6ENI/RnVrPfrji+Y
   LwSA3jME0OhkqryWuNmUGAdISyLj5tDMIIWQULZVvlftpIKl7f/qSjL+n
   vBRjrtVuC9VhiE4zoeS07g12Am4C//k9McCo2wcQ7UWb2Zpz9V7uppHdL
   iExDZEEXcn+/yh3VMuvZe5UzkfRFTW2C/SUk7eIXP+1wM6e4rXU6CO1HT
   g==;
X-CSE-ConnectionGUID: UOGAdiMvSFahwXa40r42/w==
X-CSE-MsgGUID: JupMyYHbQI2S9svyArJTOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="32920575"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="32920575"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 21:59:36 -0700
X-CSE-ConnectionGUID: XcWY63J2Sva7cCOgaeGbMg==
X-CSE-MsgGUID: 6LxQWgP9QB2dhRy8soqyMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="127630024"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Apr 2025 21:59:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1I6W-0002Rr-06;
	Sun, 06 Apr 2025 04:59:32 +0000
Date: Sun, 6 Apr 2025 12:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-pwm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] pwm: stm32: Emit debug output also for corner cases
 of the rounding callbacks
Message-ID: <202504061207.97zbNPvV-lkp@intel.com>
References: <fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_215943_404434_A5D023BD 
X-CRM114-Status: GOOD (  11.23  )
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
config: x86_64-buildonly-randconfig-001-20250406 (https://download.01.org/0day-ci/archive/20250406/202504061207.97zbNPvV-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504061207.97zbNPvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504061207.97zbNPvV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pwm/pwm-stm32.c:246:60: error: use of undeclared identifier 'rate'
     246 |                 pwm->hwpwm, wfhw->ccer, wfhw->psc, wfhw->arr, wfhw->ccr, rate,
         |                                                                          ^
   1 error generated.


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

