Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BC3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 17:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTZr1sFEMsLYDg2yLhBoZc84H8axTl2mb9qv0nUG21E=; b=1K4KatbnGyxAlM7kbS98FFgqAs
	mCZPgbjRl2E/LtrJMd1ku47Yg7VnNGC/JHaWf3bprCLvd5nP4haOgUSYOsRZ5gSK/DKzvVVUSTunN
	T54oZvacfKGI+X1aU1H9SMN6ablTGTkCbTLi8VEZyCE6IZQaVmR6C3xxKTSvqhJJAEoWv5gtIO+e0
	rxyXtIggXgkO5kNDXjVYRCWfhise1te1ZkNcidx9LrCNtNhnfba+td/UuJOfRW++TplK5HOXUYr/J
	Ykbwk8DLzhLV/IfDJgNW9QvqFzXB1Y1FNrgZ8nBaEZAnXpdDOcl6RCnMyoKAyBGP6wyKd4eNC6LeB
	s7UhbZMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3eo-0000000CC7S-01fa;
	Tue, 10 Dec 2024 17:04:22 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3dk-0000000CBvX-2KBN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 17:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733850197; x=1765386197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f1uDp17DDJ/J/DvndkER4E+QcGCcpN2FmP6SxQ+irRw=;
  b=YjfjU40B3T+ZEyhr2B4BWY29Zgil/JvvUL4SZj8f8Iplda1hLQdxHLEm
   X8wcqwLxs4sEQYzd/Hoz4JnVgEOxlG9tTRrK+jakjnI2r06sWQM2FX/RL
   9Hfv/o3+1CbCvLBhdyAbtGiYujxQ4yftNgz/OdJzMgODpxdBbebO9LA6y
   N26dpzeaqVqWEx5mk6k3h/u3NtjabdTKZaCE/oR68vnwF53ifD3Xa4ib1
   DYfXcxiT7O9rlPDhy2Z3PC0eVXOmhai2IijTI/J1r5lQlgxcie0srYk1Y
   aQZ+6Qd0LvV5B5IwyKiWRas3+4XmppVOwjVGJWzHyAgph+nF+t4yWvBvU
   g==;
X-CSE-ConnectionGUID: rxBjPt3iTKi4UEeFc8B3mg==
X-CSE-MsgGUID: 6JTzlQQrT0Sd9kxTRPeF2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34089289"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="34089289"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 09:03:12 -0800
X-CSE-ConnectionGUID: G85RQGGIS3SYVxkvj13IyA==
X-CSE-MsgGUID: 7A5EG28lTrOQUe4ZG1m6nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="95333830"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Dec 2024 09:03:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL3da-0005nJ-0f;
	Tue, 10 Dec 2024 17:03:06 +0000
Date: Wed, 11 Dec 2024 01:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the
 spectre_bhb_k32_list
Message-ID: <202412110032.Sku0iZvD-lkp@intel.com>
References: <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_090316_636036_9BA6B84A 
X-CRM114-Status: GOOD (  15.79  )
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
patch link:    https://lore.kernel.org/r/20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c%40changeid
patch subject: [PATCH 6/6] arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the spectre_bhb_k32_list
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241211/202412110032.Sku0iZvD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412110032.Sku0iZvD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110032.Sku0iZvD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/cache.h:43,
                    from include/linux/cache.h:6,
                    from include/linux/jiffies.h:5,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:10,
                    from arch/arm64/kernel/proton-pack.c:21:
   arch/arm64/kernel/proton-pack.c: In function 'spectre_bhb_loop_affected':
>> arch/arm64/kernel/proton-pack.c:863:43: error: 'MIDR_QCOM_KRYO_6XX_GOLD' undeclared (first use in this function); did you mean 'MIDR_QCOM_KRYO_4XX_GOLD'?
     863 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:251:26: note: in definition of macro 'MIDR_RANGE'
     251 |                 .model = m,                                     \
         |                          ^
   arch/arm64/kernel/proton-pack.c:863:25: note: in expansion of macro 'MIDR_ALL_VERSIONS'
     863 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:863:43: note: each undeclared identifier is reported only once for each function it appears in
     863 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:251:26: note: in definition of macro 'MIDR_RANGE'
     251 |                 .model = m,                                     \
         |                          ^
   arch/arm64/kernel/proton-pack.c:863:25: note: in expansion of macro 'MIDR_ALL_VERSIONS'
     863 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
         |                         ^~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/proton-pack.c:864:43: error: 'MIDR_QCOM_KRYO_6XX_PRIME' undeclared (first use in this function); did you mean 'MIDR_QCOM_KRYO_3XX_SILVER'?
     864 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_PRIME),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:251:26: note: in definition of macro 'MIDR_RANGE'
     251 |                 .model = m,                                     \
         |                          ^
   arch/arm64/kernel/proton-pack.c:864:25: note: in expansion of macro 'MIDR_ALL_VERSIONS'
     864 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_PRIME),
         |                         ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/proton-pack.c:872:43: error: 'MIDR_QCOM_KRYO_5XX_GOLD' undeclared (first use in this function); did you mean 'MIDR_QCOM_KRYO_4XX_GOLD'?
     872 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/cputype.h:251:26: note: in definition of macro 'MIDR_RANGE'
     251 |                 .model = m,                                     \
         |                          ^
   arch/arm64/kernel/proton-pack.c:872:25: note: in expansion of macro 'MIDR_ALL_VERSIONS'
     872 |                         MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
         |                         ^~~~~~~~~~~~~~~~~


vim +863 arch/arm64/kernel/proton-pack.c

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
 > 863				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
 > 864				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_PRIME),
   865				{},
   866			};
   867			static const struct midr_range spectre_bhb_k24_list[] = {
   868				MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
   869				MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
   870				MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
   871				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
   872				MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
   873				{},
   874			};
   875			static const struct midr_range spectre_bhb_k11_list[] = {
   876				MIDR_ALL_VERSIONS(MIDR_AMPERE1),
   877				{},
   878			};
   879			static const struct midr_range spectre_bhb_k8_list[] = {
   880				MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
   881				MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
   882				{},
   883			};
   884	
   885			if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
   886				k = 32;
   887			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
   888				k = 24;
   889			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_list))
   890				k = 11;
   891			else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
   892				k =  8;
   893	
   894			max_bhb_k = max(max_bhb_k, k);
   895		} else {
   896			k = max_bhb_k;
   897		}
   898	
   899		return k;
   900	}
   901	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

