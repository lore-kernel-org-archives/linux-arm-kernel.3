Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC72C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOzzCpCg47IZeLV5BzjmPiZ2oEsFdgUOmfuTOZ4lHxI=; b=nGiMPAjSGhB79CUQbIRc8AfLvr
	PMEDDncvxmv/9IiZFm36b2McyHe+XJSTDLKoLGj6BfZ9SwrIdgqBKXVFsE3yeIEZAU/rxcJpcRHHO
	Jq9PO1j+8xzBM5vDOkjBcgR+nzT7db03LKT4qaT+My9pczvMM3l3N3zcU8tjkik9T55Xan3hi0o17
	OckE3BHLjuqpDYxUv6a9lidTbMvAcGqVXK3ytVFXcycWivL5lqsDtnXUqfmTtUE2aINkYK0pB6vjg
	tlhPSsU9W+dJn0srt3ZJf/uc6MHayzbeIyzQZuf8NZmTO0EdO6kRQaHBWVAIvy95vCuyY6CpOsc0C
	pvm9XT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBk-000000061uj-3bDf;
	Tue, 15 Jul 2025 19:19:40 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubjR5-00000005pMZ-3UBP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 17:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752600444; x=1784136444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ovPKG96PX8GRLMCJnscYphDbflIJz5ol2cbrtMEYKMU=;
  b=jKXrMoayu6f0xFJ74k6TvXmsmf4eX9+n2aTEw1HlPv7KEjV1gZgg92V6
   bfdRilvUv0RKvG4P0bqGaOUeHUxiwEnbbcYc5u1V3amuvNCxQ7ENSYEQp
   kFwiirTa3aNRw6ZeTq7ChbQ/3mAB055DDK/g63/ounmfLw8W7uIk4NcPN
   oU1DNZ/Ox/N/hAXXnQJbdCF8RWfZQ2qFDZ8FI8I3IB+xSyEJvsI6SZBN+
   WRdUrZiy64qC31VhyWbn11FwI53VN/5DCeDMjmeE+4yOzLHs7vFPyOrWe
   5PKM3VuJgDeoB+N7Vb9c64RgXSkot9VRYo0b625dWces2kR/GOzv5AFeR
   Q==;
X-CSE-ConnectionGUID: diD+/0xNTMmsh57J+Xp3kw==
X-CSE-MsgGUID: hT1iwSDlQ16t53rHwynRdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54048316"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54048316"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 10:27:21 -0700
X-CSE-ConnectionGUID: dJg+dbpVQYq+HakiiLMIUQ==
X-CSE-MsgGUID: kn5/sUpZQIa1Yvs1bCgxAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="161605026"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jul 2025 10:27:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubjQu-000BNn-1v;
	Tue, 15 Jul 2025 17:27:12 +0000
Date: Wed, 16 Jul 2025 01:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Colton Lewis <coltonlewis@google.com>
Subject: Re: [PATCH v4 22/23] KVM: arm64: Add ioctl to partition the PMU when
 supported
Message-ID: <202507160129.vrvWpdVu-lkp@intel.com>
References: <20250714225917.1396543-23-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714225917.1396543-23-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_102723_885823_9E5BDA29 
X-CRM114-Status: GOOD (  11.33  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20250715-070741
base:   79150772457f4d45e38b842d786240c36bb1f97f
patch link:    https://lore.kernel.org/r/20250714225917.1396543-23-coltonlewis%40google.com
patch subject: [PATCH v4 22/23] KVM: arm64: Add ioctl to partition the PMU when supported
config: arm64-randconfig-003-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160129.vrvWpdVu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160129.vrvWpdVu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160129.vrvWpdVu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/kvm_host.h:31,
                    from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:15:
   arch/arm64/include/asm/kvm_pmu.h: In function 'kvm_pmu_is_partitioned':
>> arch/arm64/include/asm/kvm_pmu.h:301:43: error: parameter name omitted
    static inline bool kvm_pmu_is_partitioned(void *)
                                              ^~~~~~
   arch/arm64/include/asm/kvm_pmu.h: In function 'kvm_pmu_host_counter_mask':
   arch/arm64/include/asm/kvm_pmu.h:306:45: error: parameter name omitted
    static inline u64 kvm_pmu_host_counter_mask(void *)
                                                ^~~~~~
   arch/arm64/include/asm/kvm_pmu.h: In function 'kvm_pmu_guest_counter_mask':
   arch/arm64/include/asm/kvm_pmu.h:311:46: error: parameter name omitted
    static inline u64 kvm_pmu_guest_counter_mask(void *)
                                                 ^~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=21662191
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2 shuffle=21662191
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=21662191
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=21662191
   make: Target 'prepare' not remade because of errors.


vim +301 arch/arm64/include/asm/kvm_pmu.h

   300	
 > 301	static inline bool kvm_pmu_is_partitioned(void *)
   302	{
   303		return false;
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

