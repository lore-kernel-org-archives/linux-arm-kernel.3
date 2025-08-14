Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3043CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkEIOAJZy49RtSHVT4A6P2SXS+pyQeLLJ5XAcWpwXA4=; b=KaBe61KY9Ps7jiNhlFNmzY76UI
	0Az6mECFtGlwdsuCSw+1wz+zSJagxacSLEnIT5V6UzpPXKrMhfOmeFgIl7wNSRpjVYekBSROxApcB
	PWdYqSLmMX1Qg0wIfN37AvA8F32uyrk6AiD/qCv0d0yoVeNPoJLUSNDrLXLPvCVxrDbpqydy8drgp
	PBiukrafF9XhPqMNb8OMaO0Jx+Ie9ojWdqJRs1VKBe2aoKL6gQhQHuQ14XeLY6g4R2UWlP9e/j+nh
	iPpDFVPepYEl9TuIwHoCLXXOIJpn+EH8nGXWtW3pnKR6pCBpXibV5whvM0Qo4NM0BT6m6cUj/5wxX
	tS1ej1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTTV-0000000GGxr-2L0R;
	Thu, 14 Aug 2025 08:38:17 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSxj-0000000GBzv-2bNU;
	Thu, 14 Aug 2025 08:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755158727; x=1786694727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5cPIVXM0nkCET4mfTMJk5eQOYlHUtDVZOyK2tRL3s7U=;
  b=e5qOrdUDMGWQjBVcJtO5/WJMlsR5hKTDEvmqF/KhovkZnQKO+loX5EUD
   MINL4FMrXmLIMwj5xsFhLwS+B66oGs0kO3aga7gYHFN17yyCX82rEebr2
   KGTabiyNmPvQ8sQy9pqM9FkEWx2DjLoBstTjQNINlG13PlASYdjFGHoeU
   MaqfuZxGZu68kvfG9woiPK4gZI+TiZZfRH4bCPtfiWNEWF2Q64PynQ77N
   DP6Igjmfsr/Goi/EcEBIhJEbGU5KNPY+zqidmLo8CiKcD6f8M+rbNDflG
   k/bejF9GhcmDiWbf9xF7oqKOtOXkFLgXDfp7sHjW+Avpb5tze197I/Pbi
   w==;
X-CSE-ConnectionGUID: 0pQCe62qTXGhch2oHSQ5BA==
X-CSE-MsgGUID: /2/IiIO/SSiCBc/229Ttyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57372652"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57372652"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:05:26 -0700
X-CSE-ConnectionGUID: DDCZwDm7QaSoaweUXg1M6A==
X-CSE-MsgGUID: uMzmV2T2TFe/bu5sz1uy2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="190399976"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2025 01:05:19 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umSxZ-000Ajc-1M;
	Thu, 14 Aug 2025 08:05:17 +0000
Date: Thu, 14 Aug 2025 16:04:59 +0800
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
Subject: Re: [PATCH 19/19] perf: Garbage-collect event_init checks
Message-ID: <202508141524.QVgoOKMD-lkp@intel.com>
References: <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_010527_712132_5E2BCB17 
X-CRM114-Status: GOOD (  12.04  )
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
patch link:    https://lore.kernel.org/r/ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy%40arm.com
patch subject: [PATCH 19/19] perf: Garbage-collect event_init checks
config: i386-randconfig-003-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141524.QVgoOKMD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141524.QVgoOKMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141524.QVgoOKMD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/intel/uncore_snb.c:905:24: warning: unused variable 'hwc' [-Wunused-variable]
     905 |         struct hw_perf_event *hwc = &event->hw;
         |                               ^~~
   1 warning generated.


vim +/hwc +905 arch/x86/events/intel/uncore_snb.c

92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  896  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  897  /*
9aae1780e7e81e arch/x86/events/intel/uncore_snb.c                Kan Liang               2018-05-03  898   * Keep the custom event_init() function compatible with old event
9aae1780e7e81e arch/x86/events/intel/uncore_snb.c                Kan Liang               2018-05-03  899   * encoding for free running counters.
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  900   */
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  901  static int snb_uncore_imc_event_init(struct perf_event *event)
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  902  {
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  903  	struct intel_uncore_pmu *pmu;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  904  	struct intel_uncore_box *box;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30 @905  	struct hw_perf_event *hwc = &event->hw;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  906  	u64 cfg = event->attr.config & SNB_UNCORE_PCI_IMC_EVENT_MASK;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  907  	int idx, base;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  908  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  909  	pmu = uncore_event_to_pmu(event);
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  910  	/* no device found for this pmu */
3f710be02ea648 arch/x86/events/intel/uncore_snb.c                Kan Liang               2025-01-08  911  	if (!pmu->registered)
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  912  		return -ENOENT;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  913  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  914  	/* check only supported bits are set */
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  915  	if (event->attr.config & ~SNB_UNCORE_PCI_IMC_EVENT_MASK)
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  916  		return -EINVAL;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  917  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  918  	box = uncore_pmu_to_box(pmu, event->cpu);
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  919  	if (!box || box->cpu < 0)
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  920  		return -EINVAL;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  921  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  922  	event->cpu = box->cpu;
1f2569fac6c6dd arch/x86/events/intel/uncore_snb.c                Thomas Gleixner         2016-02-22  923  	event->pmu_private = box;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  924  
e64cd6f73ff5a7 arch/x86/events/intel/uncore_snb.c                David Carrillo-Cisneros 2016-08-17  925  	event->event_caps |= PERF_EV_CAP_READ_ACTIVE_PKG;
e64cd6f73ff5a7 arch/x86/events/intel/uncore_snb.c                David Carrillo-Cisneros 2016-08-17  926  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  927  	event->hw.idx = -1;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  928  	event->hw.last_tag = ~0ULL;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  929  	event->hw.extra_reg.idx = EXTRA_REG_NONE;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  930  	event->hw.branch_reg.idx = EXTRA_REG_NONE;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  931  	/*
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  932  	 * check event is known (whitelist, determines counter)
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  933  	 */
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  934  	switch (cfg) {
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  935  	case SNB_UNCORE_PCI_IMC_DATA_READS:
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  936  		base = SNB_UNCORE_PCI_IMC_DATA_READS_BASE;
9aae1780e7e81e arch/x86/events/intel/uncore_snb.c                Kan Liang               2018-05-03  937  		idx = UNCORE_PMC_IDX_FREERUNNING;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  938  		break;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  939  	case SNB_UNCORE_PCI_IMC_DATA_WRITES:
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  940  		base = SNB_UNCORE_PCI_IMC_DATA_WRITES_BASE;
9aae1780e7e81e arch/x86/events/intel/uncore_snb.c                Kan Liang               2018-05-03  941  		idx = UNCORE_PMC_IDX_FREERUNNING;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  942  		break;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  943  	case SNB_UNCORE_PCI_IMC_GT_REQUESTS:
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  944  		base = SNB_UNCORE_PCI_IMC_GT_REQUESTS_BASE;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  945  		idx = UNCORE_PMC_IDX_FREERUNNING;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  946  		break;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  947  	case SNB_UNCORE_PCI_IMC_IA_REQUESTS:
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  948  		base = SNB_UNCORE_PCI_IMC_IA_REQUESTS_BASE;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  949  		idx = UNCORE_PMC_IDX_FREERUNNING;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  950  		break;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  951  	case SNB_UNCORE_PCI_IMC_IO_REQUESTS:
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  952  		base = SNB_UNCORE_PCI_IMC_IO_REQUESTS_BASE;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  953  		idx = UNCORE_PMC_IDX_FREERUNNING;
24633d901ea44f arch/x86/events/intel/uncore_snb.c                Vaibhav Shankar         2020-08-13  954  		break;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  955  	default:
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  956  		return -EINVAL;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  957  	}
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  958  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  959  	/* must be done before validate_group */
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  960  	event->hw.event_base = base;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  961  	event->hw.idx = idx;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  962  
8041ffd36f42d8 arch/x86/events/intel/uncore_snb.c                Kan Liang               2019-02-27  963  	/* Convert to standard encoding format for freerunning counters */
8041ffd36f42d8 arch/x86/events/intel/uncore_snb.c                Kan Liang               2019-02-27  964  	event->hw.config = ((cfg - 1) << 8) | 0x10ff;
8041ffd36f42d8 arch/x86/events/intel/uncore_snb.c                Kan Liang               2019-02-27  965  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  966  	/* no group validation needed, we have free running counters */
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  967  
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  968  	return 0;
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  969  }
92807ffdf32c38 arch/x86/kernel/cpu/perf_event_intel_uncore_snb.c Yan, Zheng              2014-07-30  970  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

