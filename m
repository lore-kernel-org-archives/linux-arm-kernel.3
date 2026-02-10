Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2823CEF0702
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 04:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+nfNxi+yIldqWai1GAked+S9Dn5ckpgkEXEpbRxCo8=; b=kZVIsT0x0UjR48WJ/3ldTl603a
	37uTKbfaUCEl3JhExr5vNMCJfdNvet9wVwjREAsNgZ0y6EM5dZZFAzNxOt4shX5QroJp58UsldBBX
	EugZUL77JjTlLFjE6zRZFza2OjdELUTS3e2h6NdnPR2frjbyjYhWbYYahoxdA6WiPycfhdFpwKpHd
	r4IYv9t1O5St4/qob02KGW0+Uo47KBSYc75g+RyFHiW9bfS3QvGCQWTP/HsL3te29f9YGJbZlFQ8U
	R3AW4KEMYcoDpL0MbDbUFES7BDBAi3ugiCgI9JMfgBSVQdAq3qSuqf+A4r91ErtTIcdK0wJ8lA0ZL
	MU24ZiLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfiy-0000000GR45-1mNf;
	Tue, 10 Feb 2026 04:51:44 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfiv-0000000GR3f-0SZR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 04:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770699102; x=1802235102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sdVn/Ig/goNcDcWLdyb5V3vbF0uqZltYsRh8bFBXC38=;
  b=b5AuQLARc+Ph1LooE2ttbCtuIXFszSG5sj38uxPIQBJ5s4lexRxlMrK0
   e1fmdexDnXAk5Vscudptt0G8Cw5xVXH/Ovjv0fj3zbQ16lGk1f0aYbCkc
   Xzt43UnLDXH9og2gQTlQIIs8rygJwXAQjULTo3QMCxxkE/Bkv4sq4khZe
   PGEWqlIZA1IuZV2oizUNTme2yZJqkucQj7s+004Sz86p+8dPY+LrD6zrq
   rkGyoPN/HMFwJaPQhOX0aMrdkLHvDqVjwSAQXg3g4kWORUBFgSWjm4Zo/
   IL0PHhmo39AAl1vYVRfwz3J60pYelyWpmEpTddUvqRm0DB/FkJIL2wPRR
   Q==;
X-CSE-ConnectionGUID: cdd/GNkIQUOH/2Zoyd6lYg==
X-CSE-MsgGUID: nF3hQzfGTzaruVcOBWabxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75445245"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75445245"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 20:51:33 -0800
X-CSE-ConnectionGUID: z4MKFQY1QtCAzMNLgWuSKg==
X-CSE-MsgGUID: frORhow2SfqYp6Rr+sBB2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="215972172"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2026 20:51:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpfia-00000000oei-3BRb;
	Tue, 10 Feb 2026 04:51:20 +0000
Date: Tue, 10 Feb 2026 12:51:19 +0800
From: kernel test robot <lkp@intel.com>
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandru Elisei <alexandru.elisei@arm.com>,
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
	Shuah Khan <skhan@linuxfoundation.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Colton Lewis <coltonlewis@google.com>
Subject: Re: [PATCH v6 14/19] perf: arm_pmuv3: Handle IRQs for Partitioned
 PMU guest counters
Message-ID: <202602101258.VRaEHc98-lkp@intel.com>
References: <20260209221414.2169465-15-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209221414.2169465-15-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_205141_242980_FBC9610E 
X-CRM114-Status: GOOD (  12.80  )
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

[auto build test WARNING on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20260210-064939
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260209221414.2169465-15-coltonlewis%40google.com
patch subject: [PATCH v6 14/19] perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
config: arm64-randconfig-001-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101258.VRaEHc98-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101258.VRaEHc98-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101258.VRaEHc98-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:16:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/arm64/include/asm/kvm_host.h:38:
>> include/kvm/arm_pmu.h:310:52: warning: declaration of 'struct arm_pmu' will not be visible outside of this function [-Wvisibility]
     310 | static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
         |                                                    ^
   include/kvm/arm_pmu.h:281:12: warning: unused function 'kvm_vcpu_read_pmuserenr' [-Wunused-function]
     281 | static u64 kvm_vcpu_read_pmuserenr(struct kvm_vcpu *vcpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from arch/arm64/kernel/asm-offsets.c:16:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/arm64/include/asm/kvm_host.h:38:
>> include/kvm/arm_pmu.h:310:52: warning: declaration of 'struct arm_pmu' will not be visible outside of this function [-Wvisibility]
   310 | static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
   |                                                    ^
   include/kvm/arm_pmu.h:281:12: warning: unused function 'kvm_vcpu_read_pmuserenr' [-Wunused-function]
   281 | static u64 kvm_vcpu_read_pmuserenr(struct kvm_vcpu *vcpu)
   |            ^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   warning: unused variable: `args`
   --> rust/kernel/kunit.rs:19:12
   |
   19 | pub fn err(args: fmt::Arguments<'_>) {
   |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
   |
   = note: `#[warn(unused_variables)]` on by default


vim +310 include/kvm/arm_pmu.h

   307	
   308	static inline void kvm_pmu_host_counters_enable(void) {}
   309	static inline void kvm_pmu_host_counters_disable(void) {}
 > 310	static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

