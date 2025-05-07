Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374A7C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Mi6fXU4wrGMTdEraGxX3LSUiRLkGYFLWPqAlDblosw=; b=Qtf9vrh6KYrTKEDf75gqmZm6G2
	WcFr8NMw28oAJFMgVbRhIImMruDRmzQHpDKvvERTy57lmJdc47gEKE571mEPigjvuc0TqgWi2r5ZP
	1pC/N2ETN0pj5giiNMVhH2PgtaZHeIX0YUGfWGcLSX2HhU1+w+uZF+L/Uh5evtkU+r23B6Cpka/Jh
	iiPIgBkM0aVureY6r6T+W83jE7m3+GGzx0ZWUw0YtNzoXc3i+A5Y3M8JVroMYj7A+MMKKmPQh5SAR
	EZVbipC+KtefbMJg5o5wknsnF7tM0R75gCxRONwELfsKrIr/7Ezosa0UxgubNFYJX0wWbhfakEDaU
	mJVo4cTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbtE-0000000F5vc-06Ps;
	Wed, 07 May 2025 10:20:36 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbaO-0000000F3Jl-2auR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 10:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746612069; x=1778148069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zs1SYKT6lv/EHt5palXhPJ9VMYIN0/AXuAq54Q0W+4Q=;
  b=RsyTmuvqLnYykY740RpidH4V/2iXnp/IAshZBuJMLPFJcftE1FriUw2E
   wlMaSpW0IUIO0JbSnqSA+TkqvI/TXoyLkikZJtoxyjksiy3LQq05deVIE
   Wtpf7fq9Kls720vx5a7E1RAzVrGzGEx7QjUelIMzNVFOwJ7wAD+eYbo+G
   DqoGDsEKHTgwflM8wX10mA5B2ywX81T2WjArr4N9b0JemMOilBXkDgV4E
   7wyHlSkJYHGSNy3wkLBsZDi5exFmwzUGPW6/pw4W8eE4c9bDuHIe+EoRz
   XiYd5jTKDEJkLb5latazyHH32ciXxTt9cbZwZ8YCJIudilCoSe2ywFKw8
   w==;
X-CSE-ConnectionGUID: 22a5C3TmTa6O/58ecvKKGg==
X-CSE-MsgGUID: 0s46Ll4QQHaCT/1mZdFb2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58527556"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="58527556"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:01:08 -0700
X-CSE-ConnectionGUID: JSsk2riqRCqSl8SPZprJdg==
X-CSE-MsgGUID: 0jgR7Dl5Q8u7mmmb2p9Msg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="159199341"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 03:01:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbaH-0007YL-32;
	Wed, 07 May 2025 10:01:01 +0000
Date: Wed, 7 May 2025 18:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Chan <towinchenmi@gmail.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH RESEND v6 03/21] drivers/perf: apple_m1: Support
 per-implementation event tables
Message-ID: <202505071747.2b2WEajY-lkp@intel.com>
References: <20250429-apple-cpmu-v6-3-ed21815f0c3f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-apple-cpmu-v6-3-ed21815f0c3f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_030108_695710_74303255 
X-CRM114-Status: GOOD (  14.47  )
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

Hi Nick,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Chan/dt-bindings-arm-pmu-Add-Apple-A7-A11-SoC-CPU-PMU-compatibles/20250429-114920
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250429-apple-cpmu-v6-3-ed21815f0c3f%40gmail.com
patch subject: [PATCH RESEND v6 03/21] drivers/perf: apple_m1: Support per-implementation event tables
config: arm64-randconfig-004-20250501 (https://download.01.org/0day-ci/archive/20250507/202505071747.2b2WEajY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071747.2b2WEajY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071747.2b2WEajY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/bits.h:34:2: note: (near initialization for 'm1_pmu_event_affinity[248]')
      34 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |  ^
   drivers/perf/apple_m1_cpu_pmu.c:27:23: note: in expansion of macro 'GENMASK'
      27 | #define ONLY_2_TO_7   GENMASK(7, 2)
         |                       ^~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:163:35: note: in expansion of macro 'ONLY_2_TO_7'
     163 |  [M1_PMU_PERFCTR_UNKNOWN_f8]    = ONLY_2_TO_7,
         |                                   ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:28:22: warning: initialized field overwritten [-Woverride-init]
      28 | #define ONLY_2_4_6   (BIT(2) | BIT(4) | BIT(6))
         |                      ^
   drivers/perf/apple_m1_cpu_pmu.c:164:35: note: in expansion of macro 'ONLY_2_4_6'
     164 |  [M1_PMU_PERFCTR_UNKNOWN_fd]    = ONLY_2_4_6,
         |                                   ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:28:22: note: (near initialization for 'm1_pmu_event_affinity[253]')
      28 | #define ONLY_2_4_6   (BIT(2) | BIT(4) | BIT(6))
         |                      ^
   drivers/perf/apple_m1_cpu_pmu.c:164:35: note: in expansion of macro 'ONLY_2_4_6'
     164 |  [M1_PMU_PERFCTR_UNKNOWN_fd]    = ONLY_2_4_6,
         |                                   ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:169:32: warning: initialized field overwritten [-Woverride-init]
     169 |  [PERF_COUNT_HW_CPU_CYCLES]  = M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:169:32: note: (near initialization for 'm1_pmu_perf_map[0]')
   drivers/perf/apple_m1_cpu_pmu.c:170:34: warning: initialized field overwritten [-Woverride-init]
     170 |  [PERF_COUNT_HW_INSTRUCTIONS]  = M1_PMU_PERFCTR_INST_ALL,
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:170:34: note: (near initialization for 'm1_pmu_perf_map[1]')
   drivers/perf/apple_m1_cpu_pmu.c:171:40: warning: initialized field overwritten [-Woverride-init]
     171 |  [PERF_COUNT_HW_BRANCH_INSTRUCTIONS] = M1_PMU_PERFCTR_INST_BRANCH,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:171:40: note: (near initialization for 'm1_pmu_perf_map[4]')
   drivers/perf/apple_m1_cpu_pmu.c:172:35: warning: initialized field overwritten [-Woverride-init]
     172 |  [PERF_COUNT_HW_BRANCH_MISSES]  = M1_PMU_PERFCTR_BRANCH_MISPRED_NONSPEC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:172:35: note: (near initialization for 'm1_pmu_perf_map[5]')
   drivers/perf/apple_m1_cpu_pmu.c:176:40: warning: initialized field overwritten [-Woverride-init]
     176 |  [ARMV8_PMUV3_PERFCTR_##pmuv3_event] = M1_PMU_PERFCTR_##m1_event
         |                                        ^~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:180:2: note: in expansion of macro 'M1_PMUV3_EVENT_MAP'
     180 |  M1_PMUV3_EVENT_MAP(INST_RETIRED, INST_ALL),
         |  ^~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:176:40: note: (near initialization for 'm1_pmu_pmceid_map[8]')
     176 |  [ARMV8_PMUV3_PERFCTR_##pmuv3_event] = M1_PMU_PERFCTR_##m1_event
         |                                        ^~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:180:2: note: in expansion of macro 'M1_PMUV3_EVENT_MAP'
     180 |  M1_PMUV3_EVENT_MAP(INST_RETIRED, INST_ALL),
         |  ^~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:176:40: warning: initialized field overwritten [-Woverride-init]
     176 |  [ARMV8_PMUV3_PERFCTR_##pmuv3_event] = M1_PMU_PERFCTR_##m1_event
         |                                        ^~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:181:2: note: in expansion of macro 'M1_PMUV3_EVENT_MAP'
     181 |  M1_PMUV3_EVENT_MAP(CPU_CYCLES,  CORE_ACTIVE_CYCLE),
         |  ^~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:176:40: note: (near initialization for 'm1_pmu_pmceid_map[17]')
     176 |  [ARMV8_PMUV3_PERFCTR_##pmuv3_event] = M1_PMU_PERFCTR_##m1_event
         |                                        ^~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:181:2: note: in expansion of macro 'M1_PMUV3_EVENT_MAP'
     181 |  M1_PMUV3_EVENT_MAP(CPU_CYCLES,  CORE_ACTIVE_CYCLE),
         |  ^~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:176:40: warning: initialized field overwritten [-Woverride-init]
     176 |  [ARMV8_PMUV3_PERFCTR_##pmuv3_event] = M1_PMU_PERFCTR_##m1_event
         |                                        ^~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:182:2: note: in expansion of macro 'M1_PMUV3_EVENT_MAP'
     182 |  M1_PMUV3_EVENT_MAP(BR_RETIRED,  INST_BRANCH),
         |  ^~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:176:40: note: (near initialization for 'm1_pmu_pmceid_map[33]')
     176 |  [ARMV8_PMUV3_PERFCTR_##pmuv3_event] = M1_PMU_PERFCTR_##m1_event
         |                                        ^~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:182:2: note: in expansion of macro 'M1_PMUV3_EVENT_MAP'
     182 |  M1_PMUV3_EVENT_MAP(BR_RETIRED,  INST_BRANCH),
         |  ^~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:176:40: warning: initialized field overwritten [-Woverride-init]
     176 |  [ARMV8_PMUV3_PERFCTR_##pmuv3_event] = M1_PMU_PERFCTR_##m1_event
         |                                        ^~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:183:2: note: in expansion of macro 'M1_PMUV3_EVENT_MAP'
     183 |  M1_PMUV3_EVENT_MAP(BR_MIS_PRED_RETIRED, BRANCH_MISPRED_NONSPEC),
         |  ^~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:176:40: note: (near initialization for 'm1_pmu_pmceid_map[34]')
     176 |  [ARMV8_PMUV3_PERFCTR_##pmuv3_event] = M1_PMU_PERFCTR_##m1_event
         |                                        ^~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:183:2: note: in expansion of macro 'M1_PMUV3_EVENT_MAP'
     183 |  M1_PMUV3_EVENT_MAP(BR_MIS_PRED_RETIRED, BRANCH_MISPRED_NONSPEC),
         |  ^~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c: In function 'm1_pmu_enable_event':
   drivers/perf/apple_m1_cpu_pmu.c:422:5: warning: variable 'evt' set but not used [-Wunused-but-set-variable]
     422 |  u8 evt;
         |     ^~~
   drivers/perf/apple_m1_cpu_pmu.c:421:13: warning: variable 'kernel' set but not used [-Wunused-but-set-variable]
     421 |  bool user, kernel;
         |             ^~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:421:7: warning: variable 'user' set but not used [-Wunused-but-set-variable]
     421 |  bool user, kernel;
         |       ^~~~
   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/of.h:15,
                    from drivers/perf/apple_m1_cpu_pmu.c:13:
   drivers/perf/apple_m1_cpu_pmu.c: At top level:
>> include/linux/build_bug.h:16:44: warning: anonymous struct declared inside parameter list will not be visible outside of this definition or declaration
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                            ^~~~~~
   include/linux/bits.h:24:35: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
      24 | #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
         |                                   ^~~~~~~~~~~~~~~~~
   include/linux/bits.h:34:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
      34 |  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |   ^~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:24:27: note: in expansion of macro 'GENMASK'
      24 | #define M1_PMU_CFG_EVENT  GENMASK(7, 0)
         |                           ^~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:496:32: note: in expansion of macro 'M1_PMU_CFG_EVENT'
     496 |     const u16 event_affinities[M1_PMU_CFG_EVENT])
         |                                ^~~~~~~~~~~~~~~~


vim +16 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10   6  
bc6245e5efd70c Ian Abbott       2017-07-10   7  #ifdef __CHECKER__
bc6245e5efd70c Ian Abbott       2017-07-10   8  #define BUILD_BUG_ON_ZERO(e) (0)
bc6245e5efd70c Ian Abbott       2017-07-10   9  #else /* __CHECKER__ */
bc6245e5efd70c Ian Abbott       2017-07-10  10  /*
bc6245e5efd70c Ian Abbott       2017-07-10  11   * Force a compilation error if condition is true, but also produce a
8788994376d84d Rikard Falkeborn 2019-12-04  12   * result (of value 0 and type int), so the expression can be used
bc6245e5efd70c Ian Abbott       2017-07-10  13   * e.g. in a structure initializer (or where-ever else comma expressions
bc6245e5efd70c Ian Abbott       2017-07-10  14   * aren't permitted).
bc6245e5efd70c Ian Abbott       2017-07-10  15   */
8788994376d84d Rikard Falkeborn 2019-12-04 @16  #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
527edbc18a70e7 Masahiro Yamada  2019-01-03  17  #endif /* __CHECKER__ */
527edbc18a70e7 Masahiro Yamada  2019-01-03  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

