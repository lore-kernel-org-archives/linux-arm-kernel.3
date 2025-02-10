Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9A6C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VUvymq+M/AWURG0iFOzAbgEurPjxXQ5J0hBNkC+vYPU=; b=jD23JPTYV9LGrZGJskQQaAw/Ow
	In+A68AO8cZ6i2vzwX+kMXT9innE2dbvXwIu983k2l9QM6kya6O4ZmHWchpN4LFecLAcjjxTFjmaS
	ag1Wn17DolQhEytrtfxDCSdOdKKylWZ6npWsB51SycwTyRX/OEGox9En8qd5v+Af03/e5ELfAkr+X
	epzWyHelbXMp3O4Xvl02Q4O5MqEjOB1/2gnwe4SBXhc/hkFcCKu89lKciZkp62al+pRRDMabU0ZJy
	bEJyC48q/6AeHkWUvKVeJqikm+XRU/pB9Yt4yBulj0XP884qMfQp8zXnJ4CJW2BkCfiFl1lx3p/V3
	VqJbmGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thT20-0000000HQJB-08J3;
	Mon, 10 Feb 2025 12:36:56 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thSxV-0000000HPXb-3ERx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739190738; x=1770726738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pqO6Qxvbsv+4kYRysubWhB7OwajdKx15TkyPcvnHrUc=;
  b=Y2K0D4gGwlLtGgtuzLMwh6INrvktOs9Q7lbc4T8rKnzVJoCBSyhxM/Q/
   Hrj4LogoxfZq7kHyJnkjCUFQ/20kOhXfIhA6QaPK9GVxko5CTgKAL08Ml
   H/M9M6hcgiadG6efH1fTDQ/nc1EIso5ctFafFk4f4HE8zM2BFGp/WZCIp
   P1rZkcPss9w0Pz3/UODhZTo5JVoAI1vtGPzJ2AKv5Nop+RAGrwwPnpb6q
   mHJzo7afFpbUGUFNqb+6YtDAjXRUHCv71Dbl8xXqz9vI1+7haVSAoFnBv
   j4F7taKd6CmKntvN0jv3eFgQwQHMLgT5X6mynyF046Xn9Lv0LR4s/SEna
   Q==;
X-CSE-ConnectionGUID: 07cup/HXSeWnf4dJ7MRU4g==
X-CSE-MsgGUID: GX9M+LvcR2Sn8PRqvrBgxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43428144"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="43428144"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 04:32:17 -0800
X-CSE-ConnectionGUID: inX1EuMhRwikjwx5gc8fRQ==
X-CSE-MsgGUID: oq13K/7BSea63svyn5iOZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112121353"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2025 04:32:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thSxP-0012kB-2B;
	Mon, 10 Feb 2025 12:32:11 +0000
Date: Mon, 10 Feb 2025 20:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/pmu-includes 15/15]
 drivers/perf/arm_pmu.c:932:2: error: call to undeclared function
 'kvm_host_pmu_init'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202502102059.w8qrGKZn-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_043217_851505_8720B274 
X-CRM114-Status: UNSURE (   9.22  )
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
config: arm-bcm2835_defconfig (https://download.01.org/0day-ci/archive/20250210/202502102059.w8qrGKZn-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502102059.w8qrGKZn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502102059.w8qrGKZn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/arm_pmu.c:932:2: error: call to undeclared function 'kvm_host_pmu_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           kvm_host_pmu_init(pmu);
           ^
   1 error generated.


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

