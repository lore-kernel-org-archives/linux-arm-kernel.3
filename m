Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3620CC83F2D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JC/+cqUsHFLRltREelpjPuBvd6bj1UbYbvbQ5k0Mog=; b=oJ9/fwVpD3+D31q/ONAGCuhZwM
	O0/EtJCSwDHS6hLRIpbCn7Ic6qZb5EfYprLZCL3k1Z9vsq4siZ1NbXcDvoQFSXqR7x7yQY4j3V0cL
	TIvlyDgptBREqKA4Tz6O26YJyZrZXJYpG8OicIek+TvHAuToThmkSIbV+5xmScjTh0jI++xXZ6sxP
	6wFBUaTg1xZG2DS5d1ZSdiI1n+KyUXELO8jLO2Qh9EX/3HYy/FhMWYqbvtsC6b4u/xrWsT1pIq/8h
	m0JHLSKEhZtmIORt6aINJ3JFGZ+/0lpuU786N/BY7WxhJyQn/eHzoLhZT0036GPdZmEyd7SqVxQxe
	2lBEFZMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBo-0000000620s-1BLd;
	Tue, 15 Jul 2025 19:19:44 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubjak-00000005q6W-3pMv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 17:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752601042; x=1784137042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LCQcMxbE4qBoe+rmXlWppTEdGOzkpPs9FBZLfSoELDY=;
  b=a5vPjrQU7AyXdecGst6QeGKMFQVmDLCxM9JwTTLkmmR2lOXoU4emyVfG
   O+ixYOBt7WonKk/6qki3i7SVJreJHx0vlkWYtL7brs8haRfaL7j/4+puS
   5UYMyTpGIxwLNpJIeM0IKkoNavvJ31Ze+ZQw/oQ34IJtN3DxhMFViztCx
   DfZDnVsImV9YtnADQZevOk5fKca4uiG1aSqpf/Ty2Br6/jeejRDTCE56S
   5XBVI737MfihEu5SEu6iIlgFtMDBZoZGsSIXa60ZjNrzfVxtHUBXPvIzx
   e5PmQOvG4Dc8o+Jd6O7R1twMztQlM2zskum6LkTEYe0GKB9TaTv6xYAzV
   Q==;
X-CSE-ConnectionGUID: KWcIlbnURySMnxsUbMuo9w==
X-CSE-MsgGUID: PVqo76qsRb6eo4Rpnaip/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65898666"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="65898666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 10:37:19 -0700
X-CSE-ConnectionGUID: AA0ida7UQd2O1yQHkyYcvg==
X-CSE-MsgGUID: uSnHo+YET2i/aYux139fjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="188290194"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2025 10:37:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubjab-000BOL-1c;
	Tue, 15 Jul 2025 17:37:13 +0000
Date: Wed, 16 Jul 2025 01:36:41 +0800
From: kernel test robot <lkp@intel.com>
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paolo Bonzini <pbonzini@redhat.com>,
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
Message-ID: <202507160120.lx4XxDb5-lkp@intel.com>
References: <20250714225917.1396543-23-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714225917.1396543-23-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_103723_015168_DC2E42E4 
X-CRM114-Status: GOOD (  11.96  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 79150772457f4d45e38b842d786240c36bb1f97f]

url:    https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20250715-070741
base:   79150772457f4d45e38b842d786240c36bb1f97f
patch link:    https://lore.kernel.org/r/20250714225917.1396543-23-coltonlewis%40google.com
patch subject: [PATCH v4 22/23] KVM: arm64: Add ioctl to partition the PMU when supported
config: arm64-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160120.lx4XxDb5-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160120.lx4XxDb5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160120.lx4XxDb5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:15:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/arm64/include/asm/kvm_host.h:31:
>> arch/arm64/include/asm/kvm_pmu.h:301:49: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline bool kvm_pmu_is_partitioned(void *)
                                                   ^
   arch/arm64/include/asm/kvm_pmu.h:306:51: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline u64 kvm_pmu_host_counter_mask(void *)
                                                     ^
   arch/arm64/include/asm/kvm_pmu.h:311:52: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline u64 kvm_pmu_guest_counter_mask(void *)
                                                      ^
   3 warnings generated.
--
   In file included from arch/arm64/kernel/asm-offsets.c:15:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/arm64/include/asm/kvm_host.h:31:
>> arch/arm64/include/asm/kvm_pmu.h:301:49: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline bool kvm_pmu_is_partitioned(void *)
                                                   ^
   arch/arm64/include/asm/kvm_pmu.h:306:51: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline u64 kvm_pmu_host_counter_mask(void *)
                                                     ^
   arch/arm64/include/asm/kvm_pmu.h:311:52: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline u64 kvm_pmu_guest_counter_mask(void *)
                                                      ^
   3 warnings generated.


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

