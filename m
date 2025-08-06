Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170CBC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inE9cqX/MHPPWEi+D4aKwkVrXLTIpin3butlDuonrBc=; b=fLdAiNJIRcqSaeXhmy1kjWVRmN
	H0hKfxUsUy/LxMfpFsoRqTDARj9LN8QkFFLzyVxYNipJemWPvMk2VdI2SS2b3kOLNqGENrot078YC
	mRElIt/0QI+AsGBTGHo3vcteDRU7yfHDosgaoPhKRKKz5H1rDzkQ9fcaDUytKtbudW0Gi8nTFGV5I
	SQdCw+eczMhaanyogza2O0Rvz4HtQI/GD6fkRHhFVTD2U4kuYrvbBKIqPW+mC3vf2d94QTL1345fC
	6rtp3lZQYlsI94Xn3oJVescZHngAdGsC9C4FzZL7m8OPmVpuM2Q4ks0jo05oA1Z3AyaHrYIXDyW1A
	a3JUBrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujefh-0000000FMdf-2nt6;
	Wed, 06 Aug 2025 13:59:13 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeSp-0000000FKcC-2ps0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 13:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754487956; x=1786023956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1sfomC6Anx2G3kwiN6eoDsR68zgbKNy3CnQTk1f/Eq0=;
  b=ei+7cGJIIoHYNhW3r9meYgdsOJa8XwJ7ZGjsilSKBe030X9q/nJ6n04x
   U04j9WLBKAJ072CdWnfKMzxmYxazq3wVTPKhlBNz46WMPI9zfKKmwp16L
   AAF5OCSEtInwIgRbeGiP/9zwqSdZVlc/T5IZCxDkFd1lAUVfTutAogNk5
   GQ826AO/K/jqzFPM6gbpSBfLxRZkoUX6YngayF/rzZh1VbrJkwomYvhGI
   8iHPzRibkSib242tDd6IJOZKunjhvwGiK89ka+rEzJp4QxNotV4LvnjxV
   sRNDCspj0GfrOZyeics75BiAUEfkPD1ZxCQWC8oo5eLZ58Dyvv58vQ9PV
   A==;
X-CSE-ConnectionGUID: PxTeV7IBTp+h+ECCSKGdyw==
X-CSE-MsgGUID: t4PXuxHWSfmWSEYK3o+gUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74264623"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="74264623"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 06:45:56 -0700
X-CSE-ConnectionGUID: i3961c/oSFSE2YkkPNUf9Q==
X-CSE-MsgGUID: Ybf5pxqFQPy79FSvKv7tNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164791096"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2025 06:45:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujeSf-0001jk-0w;
	Wed, 06 Aug 2025 13:45:46 +0000
Date: Wed, 6 Aug 2025 21:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lifeng Zheng <zhenglifeng1@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	beata.michalska@arm.com, sudeep.holla@arm.com
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	vincent.guittot@linaro.org, yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com, lihuisong@huawei.com, yubowen8@huawei.com,
	linhongye@h-partners.com, zhenglifeng1@huawei.com
Subject: Re: [PATCH v3 3/3] arm64: topology: Setup AMU FIE for online CPUs
 only
Message-ID: <202508062150.aKsrWjHB-lkp@intel.com>
References: <20250805093330.3715444-4-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805093330.3715444-4-zhenglifeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_064555_752517_034568E6 
X-CRM114-Status: GOOD (  16.02  )
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

Hi Lifeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge arm/for-next arm/fixes kvmarm/next soc/for-next linus/master v6.16 next-20250806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lifeng-Zheng/arm64-topology-Set-scale-freq-source-only-for-the-CPUs-that-have-not-been-set-before/20250806-101537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20250805093330.3715444-4-zhenglifeng1%40huawei.com
patch subject: [PATCH v3 3/3] arm64: topology: Setup AMU FIE for online CPUs only
config: arm64-randconfig-003-20250806 (https://download.01.org/0day-ci/archive/20250806/202508062150.aKsrWjHB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508062150.aKsrWjHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508062150.aKsrWjHB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/topology.c: In function 'cpuhp_topology_online':
   arch/arm64/kernel/topology.c:409:34: error: implicit declaration of function 'cpufreq_cpu_get_raw_no_check'; did you mean 'cpufreq_cpu_get_raw'? [-Werror=implicit-function-declaration]
     409 |  struct cpufreq_policy *policy = cpufreq_cpu_get_raw_no_check(cpu);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  cpufreq_cpu_get_raw
>> arch/arm64/kernel/topology.c:409:34: warning: initialization of 'struct cpufreq_policy *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +409 arch/arm64/kernel/topology.c

   406	
   407	static int cpuhp_topology_online(unsigned int cpu)
   408	{
 > 409		struct cpufreq_policy *policy = cpufreq_cpu_get_raw_no_check(cpu);
   410	
   411		/*
   412		 * If the online CPUs are not all AMU FIE CPUs or the new one is already
   413		 * an AMU FIE one, no need to set it.
   414		 */
   415		if (!policy || !cpumask_available(amu_fie_cpus) ||
   416		    !cpumask_subset(policy->cpus, amu_fie_cpus) ||
   417		    cpumask_test_cpu(cpu, amu_fie_cpus))
   418			return 0;
   419	
   420		/*
   421		 * If the new online CPU cannot pass this check, all the CPUs related to
   422		 * the same policy should be clear from amu_fie_cpus mask, otherwise they
   423		 * may use different source of the freq scale.
   424		 */
   425		if (!freq_counters_valid(cpu)) {
   426			topology_clear_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
   427							 policy->related_cpus);
   428			cpumask_andnot(amu_fie_cpus, amu_fie_cpus, policy->related_cpus);
   429			return 0;
   430		}
   431	
   432		cpumask_set_cpu(cpu, amu_fie_cpus);
   433	
   434		topology_set_scale_freq_source(&amu_sfd, cpumask_of(cpu));
   435	
   436		pr_debug("CPU[%u]: counter will be used for FIE.", cpu);
   437	
   438		return 0;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

