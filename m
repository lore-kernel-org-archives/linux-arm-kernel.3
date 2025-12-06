Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29872D12692
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 04:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nu10Xq4mtJJqkwKAZJtqZndwQyRolDkZs+/NvgZILBw=; b=p38d5WQQ6JXKG8//k1rrwwJr6G
	o7P/hO3rynI9MoHkH3yn2zFtHu/4UEr6v2OcOO3J/B4ooyC1n/H1GBwLa5MOLrN1YI6JeL3O7IKQc
	kaVvG/cnqhAa6hSxki/67zVMxb0zCcS5RjACnAO02YpGW6kDTD+pOmXGxwA3rbRXllau2xlinRkMk
	KOH6ZxbN5ScXIHKD8hv7DksS4703DSU1nLoTMvZ4h5kuzEDJxMHsB2VZAmmbX+iJ/wW6Fw4lQNS2t
	jJDs5YHLUJBMxH5kvh5EPBfsNfoCcKltdhm0kfyZ5vEKrfiyPe1B3K/fUzGhATyjYiR1wUxU6jYVh
	3UKKIH+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRjok-0000000Ab1K-2rh5;
	Sat, 06 Dec 2025 04:22:46 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRjoi-0000000Ab0u-0Zhh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 04:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764994964; x=1796530964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KoHQ1YurYEAqQvA+3ldEYO+Mkmk1wGzucehdLddRfIE=;
  b=OvtmdlXgBPGKbeMrzWfem7C6MyySW+YIL1NPHKxFcN740R+nVFRfewXY
   zBZH399lxEStVJXwFnGlFHrXsXPwSEcp90bYlVm5qkVpMI7PAlYZTeveZ
   0oGrYBZHfUWJeNIEkuQ/0N75NyzbOR48Mi1xmSUjYDDXI793S5/vE5b5D
   skbwTImryZG8VSH18c/m+3oRzlxX30cxvTvTIUsdMjHCTsAMCuRVtNXTe
   MUwXBFwvIK/mq+5VBFFLk3xcrektN9uJPPO+a8Ithbisi8qmI7E1P+5Dn
   OSOdgRCXfkjfJLsQaGSZzGRPmZjBy/Uj+3Be/3XnXpeWUREfOPzoh/W8I
   A==;
X-CSE-ConnectionGUID: tIbbNpV8SfuiJjH3I/LyrA==
X-CSE-MsgGUID: 4RxTnCYNQK2dJcgE51knjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78381004"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="78381004"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 20:22:41 -0800
X-CSE-ConnectionGUID: 23Ol/a8aQaGKwXs3aouUqg==
X-CSE-MsgGUID: Cm0ArHt/QdKN45YW4S2wNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="199901108"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Dec 2025 20:22:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRjoZ-00000000FqH-1Wwd;
	Sat, 06 Dec 2025 04:22:35 +0000
Date: Sat, 6 Dec 2025 12:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Genoud <richard.genoud@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 2/4] pwm: sun50i: Add H616 PWM support
Message-ID: <202512061109.UxaYeMZ9-lkp@intel.com>
References: <20251205100239.1563353-3-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205100239.1563353-3-richard.genoud@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_202244_227480_5F86CB76 
X-CRM114-Status: GOOD (  13.97  )
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

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6987d58a9cbc5bd57c983baa514474a86c945d56]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Genoud/dt-bindings-pwm-sunxi-add-PWM-controller-for-Allwinner-H616/20251205-214804
base:   6987d58a9cbc5bd57c983baa514474a86c945d56
patch link:    https://lore.kernel.org/r/20251205100239.1563353-3-richard.genoud%40bootlin.com
patch subject: [PATCH 2/4] pwm: sun50i: Add H616 PWM support
config: hexagon-randconfig-r073-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061109.UxaYeMZ9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 14bf95b06a18b9b59c89601cbc0e5a6f2176b118)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061109.UxaYeMZ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061109.UxaYeMZ9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pwm/pwm-sun50i-h616.c:452:23: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     452 |         tmp = NSEC_PER_SEC * PWM_REG_DUTY(val);
         |                              ^
   drivers/pwm/pwm-sun50i-h616.c:76:28: note: expanded from macro 'PWM_REG_DUTY'
      76 | #define PWM_REG_DUTY(reg)               FIELD_GET(PWM_DUTY_MASK, reg)
         |                                         ^
>> drivers/pwm/pwm-sun50i-h616.c:493:40: error: call to undeclared function 'FIELD_MAX'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     493 |                 freq = div64_u64(NSEC_PER_SEC * (u64)PWM_PERIOD_MAX, period);
         |                                                      ^
   drivers/pwm/pwm-sun50i-h616.c:79:26: note: expanded from macro 'PWM_PERIOD_MAX'
      79 | #define PWM_PERIOD_MAX                  FIELD_MAX(PWM_PERIOD_MASK)
         |                                         ^
   drivers/pwm/pwm-sun50i-h616.c:508:27: error: call to undeclared function 'FIELD_MAX'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     508 |         if ((cnt == 0) || (cnt > PWM_PERIOD_MAX)) {
         |                                  ^
   drivers/pwm/pwm-sun50i-h616.c:79:26: note: expanded from macro 'PWM_PERIOD_MAX'
      79 | #define PWM_PERIOD_MAX                  FIELD_MAX(PWM_PERIOD_MASK)
         |                                         ^
>> drivers/pwm/pwm-sun50i-h616.c:577:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     577 |                 val = PWM_DUTY(chan->active_cycles);
         |                       ^
   drivers/pwm/pwm-sun50i-h616.c:78:25: note: expanded from macro 'PWM_DUTY'
      78 | #define PWM_DUTY(dty)                   FIELD_PREP(PWM_DUTY_MASK, dty)
         |                                         ^
   4 errors generated.


vim +/FIELD_GET +452 drivers/pwm/pwm-sun50i-h616.c

   413	
   414	static int h616_pwm_get_state(struct pwm_chip *chip,
   415				      struct pwm_device *pwm,
   416				      struct pwm_state *state)
   417	{
   418		struct h616_pwm_chip *h616chip = to_h616_pwm_chip(chip);
   419		struct h616_pwm_channel *chan = &h616chip->channels[pwm->hwpwm];
   420		u64 clk_rate, tmp;
   421		u32 val;
   422	
   423		clk_rate = clk_get_rate(chan->pwm_clk);
   424		if (!clk_rate)
   425			return -EINVAL;
   426	
   427		val = h616_pwm_readl(h616chip, PWM_ENR);
   428		state->enabled = !!(PWM_ENABLE(pwm->hwpwm) & val);
   429	
   430		val = h616_pwm_readl(h616chip, PWM_XY_CLK_CR(PWM_PAIR_IDX(pwm->hwpwm)));
   431		if (val & BIT(PWM_XY_CLK_CR_BYPASS_BIT(pwm->hwpwm))) {
   432			/*
   433			 * When bypass is enabled, the PWM logic is inactive.
   434			 * The PWM_clock_src_xy is directly routed to PWM_clock_x
   435			 */
   436			state->period = DIV_ROUND_UP_ULL(NSEC_PER_SEC, clk_rate);
   437			state->duty_cycle = DIV_ROUND_UP_ULL(state->period, 2);
   438			state->polarity = PWM_POLARITY_NORMAL;
   439			return 0;
   440		}
   441	
   442		state->enabled &= !!(BIT(PWM_XY_CLK_CR_GATE_BIT) & val);
   443	
   444		val = h616_pwm_readl(h616chip, PWM_CTRL_REG(pwm->hwpwm));
   445		if (val & PWM_CTRL_ACTIVE_STATE)
   446			state->polarity = PWM_POLARITY_NORMAL;
   447		else
   448			state->polarity = PWM_POLARITY_INVERSED;
   449	
   450		val = h616_pwm_readl(h616chip, PWM_PERIOD_REG(pwm->hwpwm));
   451	
 > 452		tmp = NSEC_PER_SEC * PWM_REG_DUTY(val);
   453		state->duty_cycle = DIV_ROUND_CLOSEST_ULL(tmp, clk_rate);
   454	
   455		tmp = NSEC_PER_SEC * PWM_REG_PERIOD(val);
   456		state->period = DIV_ROUND_CLOSEST_ULL(tmp, clk_rate);
   457	
   458		return 0;
   459	}
   460	
   461	static int h616_pwm_calc(struct pwm_chip *chip, unsigned int idx,
   462				 const struct pwm_state *state)
   463	{
   464		struct h616_pwm_chip *h616chip = to_h616_pwm_chip(chip);
   465		struct h616_pwm_channel *chan = &h616chip->channels[idx];
   466		unsigned int cnt, duty_cnt;
   467		unsigned long max_rate;
   468		long calc_rate;
   469		u64 duty, period, freq;
   470	
   471		duty = state->duty_cycle;
   472		period = state->period;
   473	
   474		max_rate = clk_round_rate(chan->pwm_clk, UINT32_MAX);
   475	
   476		dev_dbg(pwmchip_parent(chip), "max_rate: %ld Hz\n", max_rate);
   477	
   478		if ((period * max_rate >= NSEC_PER_SEC) &&
   479		    (period * max_rate < 2 * NSEC_PER_SEC) &&
   480		    (duty * max_rate * 2 >= NSEC_PER_SEC)) {
   481			/*
   482			 * If the requested period is to small to be generated by the
   483			 * PWM, we can just select the highest clock and bypass the
   484			 * PWM logic
   485			 */
   486			dev_dbg(pwmchip_parent(chip), "Setting bypass (period=%lld)\n",
   487				period);
   488			freq = div64_u64(NSEC_PER_SEC, period);
   489			chan->bypass = true;
   490			duty = period / 2;
   491		} else {
   492			chan->bypass = false;
 > 493			freq = div64_u64(NSEC_PER_SEC * (u64)PWM_PERIOD_MAX, period);
   494			if (freq > UINT32_MAX)
   495				freq = UINT32_MAX;
   496		}
   497	
   498		calc_rate = clk_round_rate(chan->pwm_clk, freq);
   499		if (calc_rate <= 0) {
   500			dev_err(pwmchip_parent(chip),
   501				"Invalid source clock frequency %llu\n", freq);
   502			return calc_rate ? calc_rate : -EINVAL;
   503		}
   504	
   505		dev_dbg(pwmchip_parent(chip), "calc_rate: %ld Hz\n", calc_rate);
   506	
   507		cnt = mul_u64_u64_div_u64(calc_rate, period, NSEC_PER_SEC);
   508		if ((cnt == 0) || (cnt > PWM_PERIOD_MAX)) {
   509			dev_err(pwmchip_parent(chip), "Period out of range\n");
   510			return -EINVAL;
   511		}
   512	
   513		duty_cnt = mul_u64_u64_div_u64(calc_rate, duty, NSEC_PER_SEC);
   514	
   515		if (duty_cnt >= cnt)
   516			duty_cnt = cnt - 1;
   517	
   518		dev_dbg(pwmchip_parent(chip), "period=%llu cnt=%u duty=%llu duty_cnt=%u\n",
   519			period, cnt, duty, duty_cnt);
   520	
   521		chan->active_cycles = duty_cnt;
   522		chan->entire_cycles = cnt;
   523	
   524		chan->rate = calc_rate;
   525	
   526		return 0;
   527	}
   528	
   529	static int h616_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
   530				  const struct pwm_state *state)
   531	{
   532		struct h616_pwm_chip *h616chip = to_h616_pwm_chip(chip);
   533		struct h616_pwm_channel *chan = &h616chip->channels[pwm->hwpwm];
   534		struct pwm_state cstate;
   535		unsigned long flags;
   536		u32 val;
   537		int ret;
   538	
   539		ret = h616_pwm_calc(chip, pwm->hwpwm, state);
   540		if (ret) {
   541			dev_err(pwmchip_parent(chip), "period exceeds the maximum value\n");
   542			return ret;
   543		}
   544	
   545		pwm_get_state(pwm, &cstate);
   546	
   547		ret = clk_set_rate(chan->pwm_clk, chan->rate);
   548		if (ret) {
   549			dev_err(pwmchip_parent(chip), "failed to set PWM %d clock rate to %lu\n",
   550				pwm->hwpwm, chan->rate);
   551			return ret;
   552		}
   553	
   554		h616_pwm_set_bypass(h616chip, pwm->hwpwm, chan->bypass);
   555	
   556		/*
   557		 * If bypass is set, the PWM logic (polarity, duty) can't be applied
   558		 */
   559	
   560		if (chan->bypass && (state->polarity == PWM_POLARITY_INVERSED)) {
   561			dev_warn(pwmchip_parent(chip),
   562				 "Can't set inversed polarity with bypass enabled\n");
   563		} else {
   564			val = h616_pwm_readl(h616chip, PWM_CTRL_REG(pwm->hwpwm));
   565			val &= ~PWM_CTRL_ACTIVE_STATE;
   566			if (state->polarity == PWM_POLARITY_NORMAL)
   567				val |= PWM_CTRL_ACTIVE_STATE;
   568			h616_pwm_writel(h616chip, val, PWM_CTRL_REG(pwm->hwpwm));
   569		}
   570	
   571		if (chan->bypass && (state->duty_cycle * 2 != state->period)) {
   572			dev_warn(pwmchip_parent(chip),
   573				 "Can't set a duty cycle with bypass enabled\n");
   574		}
   575	
   576		if (!chan->bypass) {
 > 577			val = PWM_DUTY(chan->active_cycles);
   578			val |= PWM_PERIOD(chan->entire_cycles);
   579			h616_pwm_writel(h616chip, val, PWM_PERIOD_REG(pwm->hwpwm));
   580		}
   581	
   582		if (state->enabled == cstate.enabled)
   583			return 0;
   584	
   585		if (cstate.enabled) {
   586			unsigned long delay_us;
   587	
   588			/*
   589			 * We need a full period to elapse before
   590			 * disabling the channel.
   591			 */
   592			delay_us = DIV_ROUND_UP_ULL(cstate.period, NSEC_PER_USEC);
   593			fsleep(delay_us);
   594		}
   595	
   596		spin_lock_irqsave(&h616chip->clk_pdata->lock, flags);
   597	
   598		val = h616_pwm_readl(h616chip, PWM_ENR);
   599		if (state->enabled)
   600			val |= PWM_ENABLE(pwm->hwpwm);
   601		else
   602			val &= ~PWM_ENABLE(pwm->hwpwm);
   603		h616_pwm_writel(h616chip, val, PWM_ENR);
   604	
   605		spin_unlock_irqrestore(&h616chip->clk_pdata->lock, flags);
   606	
   607		return 0;
   608	}
   609	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

