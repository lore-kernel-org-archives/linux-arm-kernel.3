Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C9DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 05:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WiZMEh+83nC/Nb7MrCulBVj5masp7auALNWiYYBtSg=; b=z/wdLb79N5zZ2JCEO2SqpGN5e+
	X1Z6LeFYVecO+ccT8w17ft2P27EklBd2UR2GtwdxsIcACyWLWgrrOF7oftkU448c6dl/4msdenHKx
	BjM4tBQpesY+uLq5SZ9R4e0rqOWqM1KxzVceSo2x7tIM/Rc1rE51E87tKnicgOVtHUA+7ERqM/JRO
	kJwGEfvZG1bMHxUqn981RYxef/Y6/8cyTmOEx6nQKvrgZqR5i3su5QALiRyvQSPmfNK+p04b6WgH8
	FwaifxhtA1NhnrMqbVgi7A+IybY3H7nL8YjknzPrsnX2OH+wLw/VVSZnfng8XgjGZk9YLLgg7Upuv
	wEuxTqPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQnn-0000000Fr6e-1lZL;
	Thu, 14 Aug 2025 05:47:03 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQlD-0000000FqXk-0iYr;
	Thu, 14 Aug 2025 05:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755150263; x=1786686263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g6R08dRtzi78aEFReCyHEuWUNRmsPZO1Bp8+EA825f0=;
  b=dGR1nc5b0tPjgKO1DkYSW0gExhCfJTGxu+stADZZboVTjI+a2E/jHniz
   Qdj/CpDsLeIhTiQBeYLaN+fJHvKuLqBJ/rf4CTjErfjp35BxEQglgrUbK
   x+9cNfvNnxZUZr7b1ql+N9umMFZbvBD95beh/qnayf6kKDPnVM49k3PTo
   31DMNXaYWmOs33v9cBUt3wsV5uQ5ahUD66TaGqzb4HXeo1QGF5BAnY4gO
   +4NIrc8zYikUhyLxSeOpVYBZVfJt3JnJPdBwKduIRuYlNzfyUWxz+lgOe
   wOZXZlrP0AFKAwOw5p6ADrAOdfsmODIjQ7MDC4mK3soDeRQEIYb4MihIa
   A==;
X-CSE-ConnectionGUID: cdUKLeswT8qpzfXIK73MSw==
X-CSE-MsgGUID: VX3jq3adR9mwEJpoZ6oT6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68063297"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68063297"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 22:44:20 -0700
X-CSE-ConnectionGUID: EW+xK8OMTcegzO0PV9/IwQ==
X-CSE-MsgGUID: DyMXdD5CQGikV6ws5RD5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="170876883"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Aug 2025 22:44:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umQkr-000AcW-2Z;
	Thu, 14 Aug 2025 05:44:08 +0000
Date: Thu, 14 Aug 2025 13:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>, mingo@redhat.com, will@kernel.org,
	mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 13/19] perf: Add helper for checking grouped events
Message-ID: <202508141353.JZWHsrYP-lkp@intel.com>
References: <b05607c3ce0d3ce52de1784823ef9f6de324283c.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b05607c3ce0d3ce52de1784823ef9f6de324283c.1755096883.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_224423_233177_CDDB6911 
X-CRM114-Status: GOOD (  13.39  )
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

Hi Robin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.17-rc1 next-20250814]
[cannot apply to perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/perf-arm-cmn-Fix-event-validation/20250814-010626
base:   linus/master
patch link:    https://lore.kernel.org/r/b05607c3ce0d3ce52de1784823ef9f6de324283c.1755096883.git.robin.murphy%40arm.com
patch subject: [PATCH 13/19] perf: Add helper for checking grouped events
config: i386-randconfig-003-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141353.JZWHsrYP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141353.JZWHsrYP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141353.JZWHsrYP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/amd/ibs.c:264:6: warning: unused variable 'ret' [-Wunused-variable]
     264 |         int ret;
         |             ^~~
   1 warning generated.


vim +/ret +264 arch/x86/events/amd/ibs.c

d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  258  
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  259  static int perf_ibs_init(struct perf_event *event)
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  260  {
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  261  	struct hw_perf_event *hwc = &event->hw;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  262  	struct perf_ibs *perf_ibs;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  263  	u64 config;
7c2128235eff99 arch/x86/events/amd/ibs.c                Ravi Bangoria  2023-06-20 @264  	int ret;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  265  
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  266  	perf_ibs = get_ibs_pmu(event->attr.type);
2fad201fe38ff9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2023-05-04  267  	if (!perf_ibs)
2fad201fe38ff9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2023-05-04  268  		return -ENOENT;
2fad201fe38ff9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2023-05-04  269  
450bbd493d436f arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-03-12  270  	config = event->attr.config;
450bbd493d436f arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-03-12  271  
450bbd493d436f arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-03-12  272  	if (event->pmu != &perf_ibs->pmu)
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  273  		return -ENOENT;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  274  
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  275  	if (config & ~perf_ibs->config_mask)
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  276  		return -EINVAL;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  277  
0f9e0d7928d8e8 arch/x86/events/amd/ibs.c                Namhyung Kim   2023-11-30  278  	if (has_branch_stack(event))
0f9e0d7928d8e8 arch/x86/events/amd/ibs.c                Namhyung Kim   2023-11-30  279  		return -EOPNOTSUPP;
0f9e0d7928d8e8 arch/x86/events/amd/ibs.c                Namhyung Kim   2023-11-30  280  
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  281  	/* handle exclude_{user,kernel} in the IRQ handler */
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  282  	if (event->attr.exclude_host || event->attr.exclude_guest ||
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  283  	    event->attr.exclude_idle)
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  284  		return -EINVAL;
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  285  
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  286  	if (!(event->attr.config2 & IBS_SW_FILTER_MASK) &&
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  287  	    (event->attr.exclude_kernel || event->attr.exclude_user ||
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  288  	     event->attr.exclude_hv))
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  289  		return -EINVAL;
d29e744c71673a arch/x86/events/amd/ibs.c                Namhyung Kim   2024-12-03  290  
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  291  	/*
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  292  	 * Grouping of IBS events is not possible since IBS can have only
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  293  	 * one event active at any point in time.
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  294  	 */
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  295  	if (in_hardware_group(event))
ccec93f5de464b arch/x86/events/amd/ibs.c                Robin Murphy   2025-08-13  296  		return -EINVAL;
7c2128235eff99 arch/x86/events/amd/ibs.c                Ravi Bangoria  2023-06-20  297  
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  298  	if (hwc->sample_period) {
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  299  		if (config & perf_ibs->cnt_mask)
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  300  			/* raw max_cnt may not be set */
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  301  			return -EINVAL;
88c7bcad71c83f arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  302  
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  303  		if (event->attr.freq) {
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  304  			hwc->sample_period = perf_ibs->min_period;
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  305  		} else {
88c7bcad71c83f arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  306  			/* Silently mask off lower nibble. IBS hw mandates it. */
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  307  			hwc->sample_period &= ~0x0FULL;
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  308  			if (hwc->sample_period < perf_ibs->min_period)
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  309  				return -EINVAL;
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  310  		}
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  311  	} else {
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  312  		u64 period = 0;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  313  
e1e7844ced88f9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  314  		if (event->attr.freq)
e1e7844ced88f9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  315  			return -EINVAL;
e1e7844ced88f9 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  316  
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  317  		if (perf_ibs == &perf_ibs_op) {
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  318  			period = (config & IBS_OP_MAX_CNT) << 4;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  319  			if (ibs_caps & IBS_CAPS_OPCNTEXT)
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  320  				period |= config & IBS_OP_MAX_CNT_EXT_MASK;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  321  		} else {
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  322  			period = (config & IBS_FETCH_MAX_CNT) << 4;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  323  		}
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  324  
db98c5faf8cb35 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  325  		config &= ~perf_ibs->cnt_mask;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  326  		event->attr.sample_period = period;
598bdf4fefff5a arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  327  		hwc->sample_period = period;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  328  
b2fc7b282bf7c1 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-01-15  329  		if (hwc->sample_period < perf_ibs->min_period)
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  330  			return -EINVAL;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  331  	}
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  332  
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  333  	if (perf_ibs_ldlat_event(perf_ibs, event)) {
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  334  		u64 ldlat = event->attr.config1 & 0xFFF;
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  335  
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  336  		if (ldlat < 128 || ldlat > 2048)
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  337  			return -EINVAL;
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  338  		ldlat >>= 7;
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  339  
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  340  		config |= (ldlat - 1) << 59;
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  341  		config |= IBS_OP_L3MISSONLY | IBS_OP_LDLAT_EN;
d20610c19b4a22 arch/x86/events/amd/ibs.c                Ravi Bangoria  2025-02-05  342  	}
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  343  
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  344  	/*
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  345  	 * If we modify hwc->sample_period, we also need to update
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  346  	 * hwc->last_period and hwc->period_left.
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  347  	 */
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  348  	hwc->last_period = hwc->sample_period;
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  349  	local64_set(&hwc->period_left, hwc->sample_period);
6accb9cf760804 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2012-04-02  350  
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  351  	hwc->config_base = perf_ibs->msr;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  352  	hwc->config = config;
510419435c6948 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-12-15  353  
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  354  	return 0;
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  355  }
b716916679e720 arch/x86/kernel/cpu/perf_event_amd_ibs.c Robert Richter 2011-09-21  356  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

