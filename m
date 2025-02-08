Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE96C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IIrwbK+DalIWYXuLGd2lW6KMIjzhUgBOxmxjvVe0Q2g=; b=21JlQM+ZeyCeectjB41WyrwEJx
	i6hmJXw5IRCAw2vK2E9NsCJQO1OlBaAHu9VY9SQz5dxAcurhK5iPGc9XFi9KahB2C7wtC1WTZcHVv
	fsLB2NV+xL2f9sz8CdgO0i+0jsmXmGBHLz6TrIj3sYNt0pv7fZEQOfcuPHR4PiWSArcXOJp+hsFA9
	yh7xLPimefsk9WNE7eZAOMYeUOjx79+ZvlyIgj7+5LDjOoFUYYj90ymmUPnnVqBYqFbyTMXG6i832
	F8CTSKwMkycMEnKGWEzX40rVkzlSu9BRG/J/S3kd7HoD2yX0ICW9K49JoeTydZS5gnw4CkmE9tusT
	TTor2+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgjqp-0000000Ctdx-2NPG;
	Sat, 08 Feb 2025 12:22:23 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgjpQ-0000000CtUb-2G4x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 12:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739017256; x=1770553256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z0AYpSE++mauA/nSQ4WIDHtqZ8bhNfsQHTob/frjZS4=;
  b=XxkoKB1PHs3rwLyWx9Uq0CCY6VlhVgxrIGqjjagX3M+Ax0lNakX74tYH
   jpcFx/ipwufNVbvYVUOtHGs6jxJ6bIRsTXmp6eDe0w/DUvmUKn7+mdbsI
   YLjYMBSBcEcT0jLoMpCtDktHni+Qed7F08gza00c673Hh2fDgucEcjrc8
   S7dc64ArOtWW3NtdFJ7WTeY11ZzzPVtI8/1zcNjA7wrGt11Ot/1kuIdJc
   QJnBZhYAjIgPDpGIk8zjZAuWa9QPwofS4iUT8WYDlE4WziSrEXkoAdyab
   AY5wOQK8hJkvStQIL7F6+zrQkUCRgsAH8BXBX8tzk0a3/6amcAch1QfFv
   g==;
X-CSE-ConnectionGUID: 1AHoBV4oQDyKXGfVcwTTrg==
X-CSE-MsgGUID: cUZMBDWxSiqzqeDc6TBBHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50289937"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="50289937"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 04:20:52 -0800
X-CSE-ConnectionGUID: WN9A1+EQSbS+nLZMZS87oA==
X-CSE-MsgGUID: +pQmBIb6Sca0+2n2tz0Mww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112200073"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2025 04:20:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgjpI-000zwt-01;
	Sat, 08 Feb 2025 12:20:48 +0000
Date: Sat, 8 Feb 2025 20:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/pmu-includes 15/15]
 drivers/perf/arm_pmu.c:932:9: error: implicit declaration of function
 'kvm_host_pmu_init'
Message-ID: <202502082022.BTq0xSDj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_042056_594711_E4C1E2BC 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/pmu-includes
head:   7f3348d6c8577e4e729279ef30f5e9013cf9fbd5
commit: 7f3348d6c8577e4e729279ef30f5e9013cf9fbd5 [15/15] PMU include cleanup
config: arm-randconfig-004-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082022.BTq0xSDj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082022.BTq0xSDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082022.BTq0xSDj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/arm_pmu.c: In function 'armpmu_register':
>> drivers/perf/arm_pmu.c:932:9: error: implicit declaration of function 'kvm_host_pmu_init' [-Wimplicit-function-declaration]
     932 |         kvm_host_pmu_init(pmu);
         |         ^~~~~~~~~~~~~~~~~


vim +/kvm_host_pmu_init +932 drivers/perf/arm_pmu.c

2681f0184276d7 Mark Rutland      2017-03-10  911  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  912  int armpmu_register(struct arm_pmu *pmu)
74a2b3ea2d8c6c Mark Rutland      2017-04-11  913  {
74a2b3ea2d8c6c Mark Rutland      2017-04-11  914  	int ret;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  915  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  916  	ret = cpu_pmu_init(pmu);
74a2b3ea2d8c6c Mark Rutland      2017-04-11  917  	if (ret)
74a2b3ea2d8c6c Mark Rutland      2017-04-11  918  		return ret;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  919  
1d899c0e9bc2a1 Andrew Murray     2019-01-10  920  	if (!pmu->set_event_filter)
1d899c0e9bc2a1 Andrew Murray     2019-01-10  921  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
1d899c0e9bc2a1 Andrew Murray     2019-01-10  922  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  923  	ret = perf_pmu_register(&pmu->pmu, pmu->name, -1);
74a2b3ea2d8c6c Mark Rutland      2017-04-11  924  	if (ret)
74a2b3ea2d8c6c Mark Rutland      2017-04-11  925  		goto out_destroy;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  926  
bf5ffc8c80e0cf Rob Herring (Arm  2024-07-31  927) 	pr_info("enabled with %s PMU driver, %d (%*pb) counters available%s\n",
bf5ffc8c80e0cf Rob Herring (Arm  2024-07-31  928) 		pmu->name, bitmap_weight(pmu->cntr_mask, ARMPMU_MAX_HWEVENTS),
bf5ffc8c80e0cf Rob Herring (Arm  2024-07-31  929) 		ARMPMU_MAX_HWEVENTS, &pmu->cntr_mask,
d8f6267f7ce5dc Julien Thierry    2020-09-24  930  		has_nmi ? ", using NMIs" : "");
74a2b3ea2d8c6c Mark Rutland      2017-04-11  931  
e840f42a499257 Marc Zyngier      2021-09-19 @932  	kvm_host_pmu_init(pmu);
e840f42a499257 Marc Zyngier      2021-09-19  933  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  934  	return 0;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  935  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  936  out_destroy:
74a2b3ea2d8c6c Mark Rutland      2017-04-11  937  	cpu_pmu_destroy(pmu);
74a2b3ea2d8c6c Mark Rutland      2017-04-11  938  	return ret;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  939  }
74a2b3ea2d8c6c Mark Rutland      2017-04-11  940  

:::::: The code at line 932 was first introduced by commit
:::::: e840f42a49925707fca90e6c7a4095118fdb8c4d KVM: arm64: Fix PMU probe ordering

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

