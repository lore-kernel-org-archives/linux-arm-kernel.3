Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF02CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 23:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qL59SAaW/f93czy5nN3xV+oWJd2trEeNu/dPztZX2/U=; b=wmfP8ndTX3onCaGVA3QRxpq2Rc
	Sj28bqG8WFKM4pcw4BWA1X3sX3dEW0eG6o8D7oGpthotBrDHPluOcbWT+lE6cvt8bzeUlZeei//sk
	IbeMi/nc2RVt8UM6ls2fyj6krqEypkxLtZyBPIgmpzraqi+GO4ptNB0IsL9LzQ2MMZvmI7c+Jcx4b
	mGp1kkReTmkgkByvf5iG6aYGoN4jSqHhXxwjQwVpdZzFf2S+rUR6rYryEVHKNITzFjtQ6f1xQExya
	qCL9+M+2pTBZnkpbe0ffri/tBSurR61RlDBF8SeWZ0Z0QcLICNi6J0H2I3eaqGd+NjwxhWSRGfyON
	aqpWL+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgBKh-00000007nXq-2oV5;
	Thu, 06 Feb 2025 23:30:55 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgBIO-00000007mxU-47Me
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 23:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738884513; x=1770420513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IqCJRbnd/ake/rfsaywutu7ZEKHtAxX14+3WiTsN3po=;
  b=l2IdOUxzEh12QeeDpRuHM0GdiyjhleCzX5c9IApyGZ34xhR7fER158jv
   2mB07r9+FquEWpcyd49g8m9LgtOKfF3JnN1g2wh+M3cK50j8r/7M1GIi6
   n7YqSjTmnc72zKjlNYeCneAynyuhzHKTDuwpaHw5L4Z251rcTxSquIZ3h
   A+FGgVhGCI1cC+3Fp4uZSFYwy0O+gjTlwEG/Eza30L9ItduzgcRhuEYm6
   7iOZNutKUw5+5CNpZ7aCKAbAXC9kz1j21zzUnH1Yh0XF7z4nadxMfFtYG
   VrrBVCOgX8ZdtUGb5QG8Bvwh57nmxmPqHIwxPMKjXyixd7uaLogVuPJim
   w==;
X-CSE-ConnectionGUID: +TsZvmo2S4SR69UlyeWiow==
X-CSE-MsgGUID: L4R4RJG1RuqeLaXZbOTirg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39646305"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39646305"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 15:28:32 -0800
X-CSE-ConnectionGUID: 0cmOU3WWQ066b+PBqxIT4w==
X-CSE-MsgGUID: d3vf7E8eTA28v3i/7CNOvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="116395562"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2025 15:28:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgBII-000xVn-1R;
	Thu, 06 Feb 2025 23:28:26 +0000
Date: Fri, 7 Feb 2025 07:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, Colton Lewis <coltonlewis@google.com>
Subject: Re: [PATCH v2] KVM: arm64: Remove cyclical dependency in arm_pmuv3.h
Message-ID: <202502070744.hqS7ZVVX-lkp@intel.com>
References: <20250206001744.3155465-1-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206001744.3155465-1-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_152833_062289_79D0CE89 
X-CRM114-Status: GOOD (  10.65  )
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

[auto build test ERROR on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/KVM-arm64-Remove-cyclical-dependency-in-arm_pmuv3-h/20250206-082034
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250206001744.3155465-1-coltonlewis%40google.com
patch subject: [PATCH v2] KVM: arm64: Remove cyclical dependency in arm_pmuv3.h
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250207/202502070744.hqS7ZVVX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070744.hqS7ZVVX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070744.hqS7ZVVX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/kvm_host.h:38,
                    from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:15:
>> include/kvm/arm_pmu.h:177:20: error: static declaration of 'kvm_vcpu_pmu_resync_el0' follows non-static declaration
     177 | static inline void kvm_vcpu_pmu_resync_el0(void) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/arm_pmuv3.h:10,
                    from include/linux/perf/arm_pmuv3.h:316,
                    from include/kvm/arm_pmu.h:11:
   arch/arm64/include/asm/kvm_pmu.h:6:6: note: previous declaration of 'kvm_vcpu_pmu_resync_el0' with type 'void(void)'
       6 | void kvm_vcpu_pmu_resync_el0(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/kvm_vcpu_pmu_resync_el0 +177 include/kvm/arm_pmu.h

5421db1be3b11c5 Marc Zyngier           2021-04-14  163  
20492a62b99bd43 Marc Zyngier           2022-05-16  164  #define kvm_vcpu_has_pmu(vcpu)		({ false; })
20492a62b99bd43 Marc Zyngier           2022-05-16  165  static inline void kvm_pmu_update_vcpu_events(struct kvm_vcpu *vcpu) {}
20492a62b99bd43 Marc Zyngier           2022-05-16  166  static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}
20492a62b99bd43 Marc Zyngier           2022-05-16  167  static inline void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu) {}
27131b199f9fdc0 Raghavendra Rao Ananta 2023-10-20  168  static inline void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu) {}
3d0dba5764b9430 Marc Zyngier           2022-11-13  169  static inline u8 kvm_arm_pmu_get_pmuver_limit(void)
3d0dba5764b9430 Marc Zyngier           2022-11-13  170  {
3d0dba5764b9430 Marc Zyngier           2022-11-13  171  	return 0;
3d0dba5764b9430 Marc Zyngier           2022-11-13  172  }
bc512d6a9b92390 Oliver Upton           2023-10-19  173  static inline u64 kvm_pmu_evtyper_mask(struct kvm *kvm)
bc512d6a9b92390 Oliver Upton           2023-10-19  174  {
bc512d6a9b92390 Oliver Upton           2023-10-19  175  	return 0;
bc512d6a9b92390 Oliver Upton           2023-10-19  176  }
b1f778a223a2a8a Marc Zyngier           2023-08-20 @177  static inline void kvm_vcpu_pmu_resync_el0(void) {}
20492a62b99bd43 Marc Zyngier           2022-05-16  178  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

