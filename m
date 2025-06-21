Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49D4C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUSINKezBIROTJ8AT+Yl5jVbZLLeLNpkkgCaZEFxgNE=; b=Xg1z6ML0TLgBSYIx+19sMrUL1t
	o75virG7qONcFvBZp5cAJyCg4hI0ioN/7sf48Xy96vcXhF0QQneiljIh3ozVPQy4rcUgjC6zM5Ezr
	9x4SCYAMsv9iyBvTTOJ3rpD7ksgJYj0OvlOL2HaJKlgJhO/sxfgxx9hiRd2d7kdIUTf6N/alhROnn
	BalNE74fOnjPUJE/utrbdEG3S7jGTEjyUDBjKzwoJg/NHqiXlLGYsdYE27ilWlBgDXdDvNE2rQe16
	ns0VZMpprkbdaS9eMHFgac5+h8CXNuT5RLB0AgZOQFjD2dpI3fHfCr6+0oyHaACGMCtRaYn2+VprK
	kMxfqqaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSzgl-0000000HXlq-11UF;
	Sat, 21 Jun 2025 14:59:27 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSzeW-0000000HXcW-1146
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 14:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750517828; x=1782053828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X3vV+eJu0dvr53qzXk4iuxmihuUGtVvgs8eqeDhJh9o=;
  b=avEzWE8RhpejSpMIpCWpVkjD0JbKnxovumBr1tjd7BYDDjfU6RmyNo9m
   PdBlIjpJit0BF+IHGVFTiOs9aOq+kXPK7v+XIBILwrP7QZ+NDIPtoiOJ8
   CQWLUjPFQFoyRfTd3bn1Wmet87vdy1Q2Ui5UrQa0C9s454ADmpJ41a0vl
   N5+/ig3kiI6PzHXZgZQCPkZy0JNV0EuA8xr77dPS5HbMQhRmYIQbfn/zn
   u2jU11k/MJiIDPCx2UHGE+RwccqIIXY611uyidrP9twzDZL8N0qeeSE+h
   cs2+B2KdivzR24zElJKdR7Ax8q60ugvvZ5r92X8g6kv5NvY0MiTobU7rh
   g==;
X-CSE-ConnectionGUID: vmnAxmnMS5+y5GdWgpjHXQ==
X-CSE-MsgGUID: t1B0U71YQmiQrhYu+kYPwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52697051"
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="52697051"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 07:57:07 -0700
X-CSE-ConnectionGUID: /ElNxIjAQAOkdsx+BhBW4w==
X-CSE-MsgGUID: YjlOm5efQmS2CH7jY5cacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="155720770"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jun 2025 07:57:03 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSzeN-000MgQ-2S;
	Sat, 21 Jun 2025 14:56:59 +0000
Date: Sat, 21 Jun 2025 22:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Colton Lewis <coltonlewis@google.com>
Subject: Re: [PATCH v2 05/23] KVM: arm64: Cleanup PMU includes
Message-ID: <202506212205.NmAR3sAH-lkp@intel.com>
References: <20250620221326.1261128-6-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620221326.1261128-6-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_075708_335319_8C7F540C 
X-CRM114-Status: GOOD (  12.10  )
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

Hi Colton,

kernel test robot noticed the following build errors:

[auto build test ERROR on 79150772457f4d45e38b842d786240c36bb1f97f]

url:    https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20250621-102220
base:   79150772457f4d45e38b842d786240c36bb1f97f
patch link:    https://lore.kernel.org/r/20250620221326.1261128-6-coltonlewis%40google.com
patch subject: [PATCH v2 05/23] KVM: arm64: Cleanup PMU includes
config: arm64-randconfig-004-20250621 (https://download.01.org/0day-ci/archive/20250621/202506212205.NmAR3sAH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506212205.NmAR3sAH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506212205.NmAR3sAH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/arm_pmuv3.c:143:41: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_RD'
     143 |  [C(L1D)][C(OP_READ)][C(RESULT_MISS)] = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_RD,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:123:45: warning: initialized field overwritten [-Woverride-init]
     123 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR   0x0041
         |                                             ^~~~~~
   drivers/perf/arm_pmuv3.c:144:44: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR'
     144 |  [C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:123:45: note: (near initialization for 'armv8_vulcan_perf_cache_map[0][1][0]')
     123 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR   0x0041
         |                                             ^~~~~~
   drivers/perf/arm_pmuv3.c:144:44: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR'
     144 |  [C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:125:51: warning: initialized field overwritten [-Woverride-init]
     125 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR  0x0043
         |                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:145:42: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR'
     145 |  [C(L1D)][C(OP_WRITE)][C(RESULT_MISS)] = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:125:51: note: (near initialization for 'armv8_vulcan_perf_cache_map[0][1][1]')
     125 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR  0x0043
         |                                                   ^~~~~~
   drivers/perf/arm_pmuv3.c:145:42: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR'
     145 |  [C(L1D)][C(OP_WRITE)][C(RESULT_MISS)] = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:44: warning: initialized field overwritten [-Woverride-init]
     134 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD    0x004E
         |                                            ^~~~~~
   drivers/perf/arm_pmuv3.c:147:44: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
     147 |  [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:44: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][0][0]')
     134 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD    0x004E
         |                                            ^~~~~~
   drivers/perf/arm_pmuv3.c:147:44: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
     147 |  [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:44: warning: initialized field overwritten [-Woverride-init]
     135 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR    0x004F
         |                                            ^~~~~~
   drivers/perf/arm_pmuv3.c:148:45: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
     148 |  [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:44: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][1][0]')
     135 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR    0x004F
         |                                            ^~~~~~
   drivers/perf/arm_pmuv3.c:148:45: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
     148 |  [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:50: warning: initialized field overwritten [-Woverride-init]
     132 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD   0x004C
         |                                                  ^~~~~~
   drivers/perf/arm_pmuv3.c:149:42: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
     149 |  [C(DTLB)][C(OP_READ)][C(RESULT_MISS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:50: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][0][1]')
     132 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD   0x004C
         |                                                  ^~~~~~
   drivers/perf/arm_pmuv3.c:149:42: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
     149 |  [C(DTLB)][C(OP_READ)][C(RESULT_MISS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:50: warning: initialized field overwritten [-Woverride-init]
     133 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR   0x004D
         |                                                  ^~~~~~
   drivers/perf/arm_pmuv3.c:150:43: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
     150 |  [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:50: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][1][1]')
     133 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR   0x004D
         |                                                  ^~~~~~
   drivers/perf/arm_pmuv3.c:150:43: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
     150 |  [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:46: warning: initialized field overwritten [-Woverride-init]
     149 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD   0x0060
         |                                              ^~~~~~
   drivers/perf/arm_pmuv3.c:152:44: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
     152 |  [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:46: note: (near initialization for 'armv8_vulcan_perf_cache_map[6][0][0]')
     149 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD   0x0060
         |                                              ^~~~~~
   drivers/perf/arm_pmuv3.c:152:44: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
     152 |  [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:46: warning: initialized field overwritten [-Woverride-init]
     150 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR   0x0061
         |                                              ^~~~~~
   drivers/perf/arm_pmuv3.c:153:45: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
     153 |  [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:46: note: (near initialization for 'armv8_vulcan_perf_cache_map[6][1][0]')
     150 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR   0x0061
         |                                              ^~~~~~
   drivers/perf/arm_pmuv3.c:153:45: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
     153 |  [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_pmuv3.c: In function 'armv8pmu_enable_event_counter':
>> drivers/perf/arm_pmuv3.c:680:2: error: implicit declaration of function 'kvm_set_pmu_events' [-Werror=implicit-function-declaration]
     680 |  kvm_set_pmu_events(mask, attr);
         |  ^~~~~~~~~~~~~~~~~~
   drivers/perf/arm_pmuv3.c: In function 'armv8pmu_disable_event_counter':
>> drivers/perf/arm_pmuv3.c:702:2: error: implicit declaration of function 'kvm_clr_pmu_events' [-Werror=implicit-function-declaration]
     702 |  kvm_clr_pmu_events(mask);
         |  ^~~~~~~~~~~~~~~~~~
   drivers/perf/arm_pmuv3.c: In function 'update_pmuserenr':
>> drivers/perf/arm_pmuv3.c:757:6: error: implicit declaration of function 'kvm_set_pmuserenr' [-Werror=implicit-function-declaration]
     757 |  if (kvm_set_pmuserenr(val))
         |      ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kvm_set_pmu_events +680 drivers/perf/arm_pmuv3.c

030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  674  
9343c790e6de7e drivers/perf/arm_pmuv3.c       James Clark       2023-12-11  675  static void armv8pmu_enable_event_counter(struct perf_event *event)
c13207905340d8 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  676  {
d1947bc4bc63e5 arch/arm64/kernel/perf_event.c Andrew Murray     2019-04-09  677  	struct perf_event_attr *attr = &event->attr;
a4a6e2078d85a9 drivers/perf/arm_pmuv3.c       Rob Herring (Arm  2024-07-31  678) 	u64 mask = armv8pmu_event_cnten_mask(event);
d1947bc4bc63e5 arch/arm64/kernel/perf_event.c Andrew Murray     2019-04-09  679  
29227d6ea1572b arch/arm64/kernel/perf_event.c Robin Murphy      2020-03-17 @680  	kvm_set_pmu_events(mask, attr);
d1947bc4bc63e5 arch/arm64/kernel/perf_event.c Andrew Murray     2019-04-09  681  
d1947bc4bc63e5 arch/arm64/kernel/perf_event.c Andrew Murray     2019-04-09  682  	/* We rely on the hypervisor switch code to enable guest counters */
29227d6ea1572b arch/arm64/kernel/perf_event.c Robin Murphy      2020-03-17  683  	if (!kvm_pmu_counter_deferred(attr))
29227d6ea1572b arch/arm64/kernel/perf_event.c Robin Murphy      2020-03-17  684  		armv8pmu_enable_counter(mask);
c13207905340d8 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  685  }
c13207905340d8 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  686  
a4a6e2078d85a9 drivers/perf/arm_pmuv3.c       Rob Herring (Arm  2024-07-31  687) static void armv8pmu_disable_counter(u64 mask)
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  688  {
df29ddf4f04b00 drivers/perf/arm_pmuv3.c       Marc Zyngier      2023-03-17  689  	write_pmcntenclr(mask);
0fdf1bb75953a6 arch/arm64/kernel/perf_event.c Mark Rutland      2020-09-24  690  	/*
0fdf1bb75953a6 arch/arm64/kernel/perf_event.c Mark Rutland      2020-09-24  691  	 * Make sure the effects of disabling the counter are visible before we
0fdf1bb75953a6 arch/arm64/kernel/perf_event.c Mark Rutland      2020-09-24  692  	 * start configuring the event.
0fdf1bb75953a6 arch/arm64/kernel/perf_event.c Mark Rutland      2020-09-24  693  	 */
0fdf1bb75953a6 arch/arm64/kernel/perf_event.c Mark Rutland      2020-09-24  694  	isb();
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  695  }
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  696  
9343c790e6de7e drivers/perf/arm_pmuv3.c       James Clark       2023-12-11  697  static void armv8pmu_disable_event_counter(struct perf_event *event)
c13207905340d8 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  698  {
d1947bc4bc63e5 arch/arm64/kernel/perf_event.c Andrew Murray     2019-04-09  699  	struct perf_event_attr *attr = &event->attr;
a4a6e2078d85a9 drivers/perf/arm_pmuv3.c       Rob Herring (Arm  2024-07-31  700) 	u64 mask = armv8pmu_event_cnten_mask(event);
d1947bc4bc63e5 arch/arm64/kernel/perf_event.c Andrew Murray     2019-04-09  701  
29227d6ea1572b arch/arm64/kernel/perf_event.c Robin Murphy      2020-03-17 @702  	kvm_clr_pmu_events(mask);
d1947bc4bc63e5 arch/arm64/kernel/perf_event.c Andrew Murray     2019-04-09  703  
d1947bc4bc63e5 arch/arm64/kernel/perf_event.c Andrew Murray     2019-04-09  704  	/* We rely on the hypervisor switch code to disable guest counters */
29227d6ea1572b arch/arm64/kernel/perf_event.c Robin Murphy      2020-03-17  705  	if (!kvm_pmu_counter_deferred(attr))
29227d6ea1572b arch/arm64/kernel/perf_event.c Robin Murphy      2020-03-17  706  		armv8pmu_disable_counter(mask);
d1947bc4bc63e5 arch/arm64/kernel/perf_event.c Andrew Murray     2019-04-09  707  }
c13207905340d8 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  708  
a4a6e2078d85a9 drivers/perf/arm_pmuv3.c       Rob Herring (Arm  2024-07-31  709) static void armv8pmu_enable_intens(u64 mask)
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  710  {
df29ddf4f04b00 drivers/perf/arm_pmuv3.c       Marc Zyngier      2023-03-17  711  	write_pmintenset(mask);
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  712  }
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  713  
9343c790e6de7e drivers/perf/arm_pmuv3.c       James Clark       2023-12-11  714  static void armv8pmu_enable_event_irq(struct perf_event *event)
c13207905340d8 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  715  {
bf5ffc8c80e0cf drivers/perf/arm_pmuv3.c       Rob Herring (Arm  2024-07-31  716) 	armv8pmu_enable_intens(BIT(event->hw.idx));
c13207905340d8 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  717  }
c13207905340d8 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  718  
a4a6e2078d85a9 drivers/perf/arm_pmuv3.c       Rob Herring (Arm  2024-07-31  719) static void armv8pmu_disable_intens(u64 mask)
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  720  {
df29ddf4f04b00 drivers/perf/arm_pmuv3.c       Marc Zyngier      2023-03-17  721  	write_pmintenclr(mask);
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  722  	isb();
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  723  	/* Clear the overflow flag in case an interrupt is pending. */
df29ddf4f04b00 drivers/perf/arm_pmuv3.c       Marc Zyngier      2023-03-17  724  	write_pmovsclr(mask);
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  725  	isb();
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  726  }
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  727  
9343c790e6de7e drivers/perf/arm_pmuv3.c       James Clark       2023-12-11  728  static void armv8pmu_disable_event_irq(struct perf_event *event)
c13207905340d8 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  729  {
bf5ffc8c80e0cf drivers/perf/arm_pmuv3.c       Rob Herring (Arm  2024-07-31  730) 	armv8pmu_disable_intens(BIT(event->hw.idx));
c13207905340d8 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  731  }
c13207905340d8 arch/arm64/kernel/perf_event.c Suzuki K Poulose  2018-07-10  732  
a4a6e2078d85a9 drivers/perf/arm_pmuv3.c       Rob Herring (Arm  2024-07-31  733) static u64 armv8pmu_getreset_flags(void)
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  734  {
a4a6e2078d85a9 drivers/perf/arm_pmuv3.c       Rob Herring (Arm  2024-07-31  735) 	u64 value;
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  736  
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  737  	/* Read */
df29ddf4f04b00 drivers/perf/arm_pmuv3.c       Marc Zyngier      2023-03-17  738  	value = read_pmovsclr();
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  739  
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  740  	/* Write to clear flags */
d30f09b6d7de5d drivers/perf/arm_pmuv3.c       James Clark       2023-12-11  741  	value &= ARMV8_PMU_OVERFLOWED_MASK;
df29ddf4f04b00 drivers/perf/arm_pmuv3.c       Marc Zyngier      2023-03-17  742  	write_pmovsclr(value);
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  743  
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  744  	return value;
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  745  }
030896885ade0a arch/arm64/kernel/perf_event.c Will Deacon       2012-03-05  746  
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  747  static void update_pmuserenr(u64 val)
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  748  {
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  749  	lockdep_assert_irqs_disabled();
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  750  
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  751  	/*
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  752  	 * The current PMUSERENR_EL0 value might be the value for the guest.
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  753  	 * If that's the case, have KVM keep tracking of the register value
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  754  	 * for the host EL0 so that KVM can restore it before returning to
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  755  	 * the host EL0. Otherwise, update the register now.
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  756  	 */
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02 @757  	if (kvm_set_pmuserenr(val))
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  758  		return;
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  759  
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  760  	write_pmuserenr(val);
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  761  }
0c2f9acf6ae741 drivers/perf/arm_pmuv3.c       Reiji Watanabe    2023-06-02  762  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

