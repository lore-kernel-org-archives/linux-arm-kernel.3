Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13857C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5lPhTSE2zTuiMBZn1AtjoxK8UzlHIHkyXKH3rPd4I0=; b=cRx2TgDbq7KYy0e17/keQPDbDt
	e3f4/1ZAmQq9Wujii1XQ+wC68T+odB7FtVINbjQXWkGQL9RZ6U3mddxUTsWh8FCSaTkB3E2dy3mct
	KI//QTBh8oul/0V+VIyyL8NO37+VmxjaQWIBb1KYqY/rbi2TckHVHrd+H8nxpL/5tOWNJxAAMMXR2
	3LRkiH2CozRY+zaOTV6yZU2+GakCIeqcNhD9IvgO75K/r8KmN6KUGuTZXLWh0BOeLa5XCln1ceQ+O
	I5oqFjC87PCSWGAF2z5OST1W5pHzBWldPbukzBWp39RgetsDMKyqJdJwovP755MCZSTZhwwS5ahrM
	6CYu+k7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTH7D-00000000gtB-3TpI;
	Sun, 22 Jun 2025 09:35:55 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTH4u-00000000gmQ-1i2C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 09:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750584813; x=1782120813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Z08jdlIHcA4c+ovnj3MepowoUSoFcvbFQogJV3s/Wk=;
  b=AkMnSn8YYV6BJnnydZ5Kehktdf7p2EDUIdEmAy7bmp3E44peM1Sk0j+f
   ice2/U9gsg4SEiR8z1Wcq0uSLhQPMYiDM/YYbSYlrAhDNZswqYVdeTLIQ
   AIaDFFY1LzzSZbpXa3E8zVYz334fKlLsnXatNROurSFXxOS6xzKglKpB2
   gOl/C1xAvj4V9aCJF1Icexf7hlOH8aNsZ1nwSoEaLfHI57MSszg3Fe/oh
   0jW7uBfN6aTb6xMFs4m+QbExlt8DVEWemAWFmhZYVfr62HkE5exX4WmU2
   Jyglo3vEODF9FyW6rSsJIB1e9CLc5CZrEl50ZrI4Qok3exGILBrkjdrJ+
   w==;
X-CSE-ConnectionGUID: KtJITjNCQmOP5wBkJWOW0Q==
X-CSE-MsgGUID: 90gyFJRcSBCUxriO2wX5rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52671242"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="52671242"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 02:33:32 -0700
X-CSE-ConnectionGUID: 36sjy7DyT/ewbISEKvtofg==
X-CSE-MsgGUID: MBzS2UecQH6f7owpkj2ZqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="156810984"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2025 02:33:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTH4n-000NBI-0H;
	Sun, 22 Jun 2025 09:33:25 +0000
Date: Sun, 22 Jun 2025 17:32:31 +0800
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
Subject: Re: [PATCH v2 17/23] KVM: arm64: Account for partitioning in
 PMCR_EL0 access
Message-ID: <202506221711.tFNGpzj4-lkp@intel.com>
References: <20250620221326.1261128-19-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620221326.1261128-19-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_023332_520053_66B97AD7 
X-CRM114-Status: GOOD (  17.56  )
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
patch link:    https://lore.kernel.org/r/20250620221326.1261128-19-coltonlewis%40google.com
patch subject: [PATCH v2 17/23] KVM: arm64: Account for partitioning in PMCR_EL0 access
config: arm64-randconfig-r073-20250622 (https://download.01.org/0day-ci/archive/20250622/202506221711.tFNGpzj4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221711.tFNGpzj4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506221711.tFNGpzj4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/kvm_host.h:32,
                    from include/linux/kvm_host.h:45,
                    from arch/arm64/kvm/sys_regs.c:16:
   arch/arm64/include/asm/kvm_pmu.h:236:50: warning: 'struct arm_pmu' declared inside parameter list will not be visible outside of this definition or declaration
    static inline bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
                                                     ^~~~~~~
   arch/arm64/include/asm/kvm_pmu.h:241:52: warning: 'struct arm_pmu' declared inside parameter list will not be visible outside of this definition or declaration
    static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
                                                       ^~~~~~~
   arch/arm64/include/asm/kvm_pmu.h:246:53: warning: 'struct arm_pmu' declared inside parameter list will not be visible outside of this definition or declaration
    static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
                                                        ^~~~~~~
   arch/arm64/kvm/sys_regs.c:856:6: warning: no previous prototype for 'pmu_access_el0_disabled' [-Wmissing-prototypes]
    bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu)
         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c: In function 'access_pmu_evtyper':
   arch/arm64/kvm/sys_regs.c:1076:7: error: implicit declaration of function 'kvm_vcpu_pmu_is_partitioned'; did you mean 'kvm_pmu_is_partitioned'? [-Werror=implicit-function-declaration]
      if (kvm_vcpu_pmu_is_partitioned(vcpu))
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
          kvm_pmu_is_partitioned
   arch/arm64/kvm/sys_regs.c: In function 'set_pmcr':
>> arch/arm64/kvm/sys_regs.c:1271:33: error: dereferencing pointer to incomplete type 'struct arm_pmu'
          new_n <= kvm->arch.arm_pmu->hpmn_max))
                                    ^~
   cc1: some warnings being treated as errors


vim +1271 arch/arm64/kvm/sys_regs.c

  1253	
  1254	static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
  1255			    u64 val)
  1256	{
  1257		u8 new_n = FIELD_GET(ARMV8_PMU_PMCR_N, val);
  1258		struct kvm *kvm = vcpu->kvm;
  1259	
  1260		mutex_lock(&kvm->arch.config_lock);
  1261	
  1262		/*
  1263		 * The vCPU can't have more counters than the PMU hardware
  1264		 * implements. Ignore this error to maintain compatibility
  1265		 * with the existing KVM behavior.
  1266		 */
  1267		if (!kvm_vm_has_ran_once(kvm) &&
  1268		    !vcpu_has_nv(vcpu)	      &&
  1269		    new_n <= kvm_arm_pmu_get_max_counters(kvm) &&
  1270		    (!kvm_vcpu_pmu_is_partitioned(vcpu) ||
> 1271		     new_n <= kvm->arch.arm_pmu->hpmn_max))
  1272			kvm->arch.nr_pmu_counters = new_n;
  1273	
  1274		mutex_unlock(&kvm->arch.config_lock);
  1275	
  1276		/*
  1277		 * Ignore writes to RES0 bits, read only bits that are cleared on
  1278		 * vCPU reset, and writable bits that KVM doesn't support yet.
  1279		 * (i.e. only PMCR.N and bits [7:0] are mutable from userspace)
  1280		 * The LP bit is RES0 when FEAT_PMUv3p5 is not supported on the vCPU.
  1281		 * But, we leave the bit as it is here, as the vCPU's PMUver might
  1282		 * be changed later (NOTE: the bit will be cleared on first vCPU run
  1283		 * if necessary).
  1284		 */
  1285		val &= ARMV8_PMU_PMCR_MASK;
  1286	
  1287		/* The LC bit is RES1 when AArch32 is not supported */
  1288		if (!kvm_supports_32bit_el0())
  1289			val |= ARMV8_PMU_PMCR_LC;
  1290	
  1291		__vcpu_assign_sys_reg(vcpu, r->reg, val);
  1292		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
  1293	
  1294		return 0;
  1295	}
  1296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

