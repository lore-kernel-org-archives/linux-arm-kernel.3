Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0E7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0A/YlbFGn5bAjUx4mRKIDmYjcr0jyp+LgOFGGQ+1Noc=; b=YcSgO0DdnD3U2RKPs8bjJ3EEEv
	KIm8KLgX33mXCeJWO9OsmRuSJV/5FydknVaxagTecgtwVPievgYZXgd9CR4xTqMBQd9p7dlzHT42y
	+3sQ3HJsCziYi6u4rVY9dy+1t+ZSnyB8Y/3w7dtVvLCldvapcYpJB2zB5gguHKq0jqkzNvZP6uHXJ
	zXL7EheQlmZjhjzGJM82/yHUmvQgqJigndEiv95vygNXqAB1iBP49Aa34ojF0gTYvBDSko2+L4vPW
	kpKX8Nf3U+nzSvXzif6mcVuflz57E2CNI1WeBeHkJHic+wSBVDygzZeYHnqpwSWWKUcDvanEinlSK
	Y90cZl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1YP-0000000BqTC-2e1g;
	Tue, 10 Dec 2024 14:49:37 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Vf-0000000BpxI-3Ft9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733842008; x=1765378008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Do7dwzzjllAqqtvBa73eePMIDuR9IMn0/w3h50zwnJw=;
  b=c5cd9jztjX3CZLQY2Dt4fZP7Ahl7coHY/r+QqruIA3qvQU58UPQUJWhU
   C/qZjXmj/wcMf3O43FicwuG1kO76AohpWBhF8jyzPO7fP8liOrmM2ZjRn
   tTXnyljnwkipRPujyXZgrkMOptHFIfS1yLsrlFc68lk4iMGi7fGw27n6W
   LBIlVn3WiQ7T+Z4nZo+pu/78lKHMI9VQahv8nReUTtqvOD0Ad6qN6uaF8
   O8skTB+EefUkTIHhZJKgYdcSzfQbkWlq1WwMx/BHVbGI3g3mpf31h32v+
   bfi1bZOBvfPZtFd+XxR5UzQ0VxCCcxzunLj2naWXhDOVrG98PARohv4Fx
   A==;
X-CSE-ConnectionGUID: gS1NUSeIT2ONOvzbg5NqBw==
X-CSE-MsgGUID: SzPt57+pQYaDl1uLg0bXbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33918599"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33918599"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:46:47 -0800
X-CSE-ConnectionGUID: 8UXF8N9lQmy0iqLdrqk76A==
X-CSE-MsgGUID: dgzL6dt7ThijvCzrvWlGLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95264819"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2024 06:46:44 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL1VZ-0005fp-2N;
	Tue, 10 Dec 2024 14:46:41 +0000
Date: Tue, 10 Dec 2024 22:45:42 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the
 spectre_bhb_k24_list
Message-ID: <202412102224.bmEeK15u-lkp@intel.com>
References: <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_064647_859723_020D0ED4 
X-CRM114-Status: GOOD (  12.67  )
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

Hi Douglas,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arm-perf/for-next/perf kvmarm/next soc/for-next arm/for-next arm/fixes linus/master v6.13-rc2 next-20241210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/arm64-errata-Add-QCOM_KRYO_4XX_GOLD-to-the-spectre_bhb_k24_list/20241210-014833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384%40changeid
patch subject: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
config: arm64-randconfig-002-20241210 (https://download.01.org/0day-ci/archive/20241210/202412102224.bmEeK15u-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412102224.bmEeK15u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412102224.bmEeK15u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/proton-pack.c:21:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/proton-pack.c:870:22: error: use of undeclared identifier 'MIDR_QCOM_KRYO_5XX_GOLD'
     870 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
         |                                           ^
   4 warnings and 1 error generated.


vim +/MIDR_QCOM_KRYO_5XX_GOLD +870 arch/arm64/kernel/proton-pack.c

   843	
   844	/*
   845	 * This must be called with SCOPE_LOCAL_CPU for each type of CPU, before any
   846	 * SCOPE_SYSTEM call will give the right answer.
   847	 */
   848	u8 spectre_bhb_loop_affected(int scope)
   849	{
   850		u8 k = 0;
   851		static u8 max_bhb_k;
   852	
   853		if (scope == SCOPE_LOCAL_CPU) {
   854			static const struct midr_range spectre_bhb_k32_list[] = {
   855				MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
   856				MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
   857				MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
   858				MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
   859				MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
   860				MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
   861				MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
   862				MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
   863				{},
   864			};
   865			static const struct midr_range spectre_bhb_k24_list[] = {
   866				MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
   867				MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
   868				MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
   869				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
 > 870				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
   871				{},
   872			};
   873			static const struct midr_range spectre_bhb_k11_list[] = {
   874				MIDR_ALL_VERSIONS(MIDR_AMPERE1),
   875				{},
   876			};
   877			static const struct midr_range spectre_bhb_k8_list[] = {
   878				MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
   879				MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
   880				{},
   881			};
   882	
   883			if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
   884				k = 32;
   885			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
   886				k = 24;
   887			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_list))
   888				k = 11;
   889			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
   890				k =  8;
   891	
   892			max_bhb_k = max(max_bhb_k, k);
   893		} else {
   894			k = max_bhb_k;
   895		}
   896	
   897		return k;
   898	}
   899	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

