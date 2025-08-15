Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EE9CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiJhq/cfrZ11EzZvptWoVRgWShLlOSX8WHy2W7nZiI0=; b=fDaYUSFDpIYJalTYE/oP3DpA05
	WGNPqi/1BsKvuHp7J0f7/S4uo/WcwQW7FzKAAvyhumiVz9CY1Fb7V2YjJ1FyFPUA8lcrxcmrmhOh8
	UYTAZMFi+yZmCt3vD9BiROFn/keV4Esc0JOlX/SmI2EW4GTxqKxbrGAQIbNDwzOAZJG/FH2IPJfGV
	p88aGBHclTvEJ/ZeEhzT0nU+Mscfk3E2dGeAtkPAOV/r8z3ffDmOWtE4PJM5m8CnM3xviNwy6yd8H
	uvdlK1gWvR7yruas/kHaz2NmtKiPsBudKSpeZqjwfwhVNGdvdARg32i5CqtPxv301GcESOXrLXEsl
	WLkssDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlZQ-00000001MFW-0rEm;
	Fri, 15 Aug 2025 03:57:36 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlQB-00000001Keg-2ATB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755229684; x=1786765684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JEgTnVH/BV69PpBuDgQi6kkM93lGAGsa5M0gQm+th7k=;
  b=J3Abb0hLomkxmIYH5aUN7krmlpNOL/2KEQrEr5UIuAAKqfkv77BRxAO9
   irymnnwTUNNqVwAw61sXfiORdFEW9amQIeaSTaBejwvb7FKk54n/brljv
   bdU2Xuu4pbmry4LXFSDST6Y4N/Zgr7TbTVGqd2vm/MvWu90RtpECYSRYB
   7cPFUU+glpHrFxgrMh3RFQdHDxR1x8cbI/bwrOPE7q7cAjn6QhswYGddo
   EcjLG294zbG4K80el2hO4gJEzHQMbTFWcix4WUasJO2KmRB0H99AGUPPl
   sz6D+bmvl4diFYqzoxI9o39fBibblyvb5c3BRr8mqd6jL+AizkcGRl6hx
   Q==;
X-CSE-ConnectionGUID: fXoy/MMNRt28IxFjF2myrA==
X-CSE-MsgGUID: lfi/I0gnTM2Ix/wevZsImA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57466910"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57466910"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 20:48:03 -0700
X-CSE-ConnectionGUID: vGRT3hNERv619L2yTCUTnw==
X-CSE-MsgGUID: hTW5MDy3Sx6WZv1OySJ5/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166902366"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2025 20:47:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umlPu-000BWK-1k;
	Fri, 15 Aug 2025 03:47:48 +0000
Date: Fri, 15 Aug 2025 11:47:43 +0800
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
Subject: Re: [PATCH v4 3/3] arm64: topology: Setup AMU FIE for online CPUs
 only
Message-ID: <202508151158.Hm9U6le6-lkp@intel.com>
References: <20250814072853.3426386-4-zhenglifeng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814072853.3426386-4-zhenglifeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_204803_623671_C03582D0 
X-CRM114-Status: GOOD (  14.16  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on rafael-pm/linux-next rafael-pm/bleeding-edge arm/for-next arm/fixes kvmarm/next soc/for-next linus/master v6.17-rc1 next-20250814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lifeng-Zheng/arm64-topology-Set-scale-freq-source-only-for-the-CPUs-that-have-not-been-set-before/20250814-153732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20250814072853.3426386-4-zhenglifeng1%40huawei.com
patch subject: [PATCH v4 3/3] arm64: topology: Setup AMU FIE for online CPUs only
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250815/202508151158.Hm9U6le6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151158.Hm9U6le6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151158.Hm9U6le6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/topology.c: In function 'cpuhp_topology_online':
>> arch/arm64/kernel/topology.c:409:41: error: implicit declaration of function 'cpufreq_cpu_policy'; did you mean 'cpufreq_cpu_put'? [-Wimplicit-function-declaration]
     409 |         struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
         |                                         ^~~~~~~~~~~~~~~~~~
         |                                         cpufreq_cpu_put
   arch/arm64/kernel/topology.c:409:41: error: initialization of 'struct cpufreq_policy *' from 'int' makes pointer from integer without a cast [-Wint-conversion]


vim +409 arch/arm64/kernel/topology.c

   406	
   407	static int cpuhp_topology_online(unsigned int cpu)
   408	{
 > 409		struct cpufreq_policy *policy = cpufreq_cpu_policy(cpu);
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
   425		if (WARN_ON(!freq_counters_valid(cpu))) {
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

