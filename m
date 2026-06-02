Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215B7CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 04:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGMcSXlLmelrlkFExuwUUOPrNe6xhBS5KWnaRnD/JaE=; b=V72PZY3MXCOPY6wR1YCAkkiP/T
	8PTCgTlFz00nREEYBqiyiaaNOmbi9BRqZ+z5f0PSWuqJJsNbAVAUlsKumZ7/niKReBOrR7W+ux1JL
	JwOpV9Ozik4FOHkXZn0DYqDN4wfht7sGDDODER2jibWCrFd90fqsmVitqNBlYk6GP23FRGF3Slm0z
	aNWvfmLEvZ9W5HKFii360RAeYS/jDsh2axfLBtWwETgU0SlEV3WHpkFHDRnQAnaqHNjZiHa+u5cGw
	5ZpFwtr0S2p8n4SMdN+VuYxruQFttD9jYfLhFduBpSOb7a70IL1N6ISKd3w6fv/GA87pjqedJYrq/
	ONY+/RIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGWy-0000000CGlM-05ZB;
	Tue, 02 Jun 2026 04:15:08 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGWu-0000000CGkw-0H6O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 04:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780373704; x=1811909704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vfRA/Ie/j4izTP90KkxVG6PO83nBUWibXhsc1OZxR+I=;
  b=SnoGZMsx8Is8yP9e86PyfCtma2EXJIBnj14iMHLNAxU1OOU1eio4svj0
   GaqN3kLpT7ehdBVFIZ3rVjCIcTKVH9tRCpBUXUyPemKy6MVgM8Ry6tlFP
   MGhPMnR3kvF6zt7vMJ5x9iLZ7tCRbnuck4olY3MproICred7Q+fe0/Vr8
   41LcQVIVfdQY8hYZpWHoEVIn0xSqpf+O3OtFGxldpCQBpwVF/Z4dtsAY+
   X2F6pr5o7WJWukPtL3ycCwIKf6KjYFEz1mBebnz0NvkvUr3eMF4OYVq0+
   GiV8sPkLpvOsJifH9OWE3gipBjJjQeGYdDt2yOxnTHMXy1QT5O/c/PU8Z
   g==;
X-CSE-ConnectionGUID: yo7KLqg/Qnm1Ao68f9ChPw==
X-CSE-MsgGUID: ckQZTqAqTPO96qNhRrN5tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81332267"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="81332267"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 21:15:01 -0700
X-CSE-ConnectionGUID: 2Wo58T2iR0ymRS+tXnPy6w==
X-CSE-MsgGUID: XzqRfukNQgysyyAQQYsEyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="242752583"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Jun 2026 21:14:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUGWl-00000000BUI-2Uz6;
	Tue, 02 Jun 2026 04:14:55 +0000
Date: Tue, 2 Jun 2026 12:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: Congkai Tan <congkai@amazon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Congkai Tan <congkai@amazon.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Haris Okanovic <harisokn@amazon.com>,
	Geoff Blake <blakgeof@amazon.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
Message-ID: <202606021209.2lvgE216-lkp@intel.com>
References: <20260601193954.2103455-1-congkai@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601193954.2103455-1-congkai@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_211504_182230_77B3F9D3 
X-CRM114-Status: GOOD (  11.44  )
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

Hi Congkai,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1702da76e017ae0fbe1a92b07bc332972c293e89]

url:    https://github.com/intel-lab-lkp/linux/commits/Congkai-Tan/KVM-arm64-Expose-PMMIR_EL1-SLOTS-to-guests/20260602-034527
base:   1702da76e017ae0fbe1a92b07bc332972c293e89
patch link:    https://lore.kernel.org/r/20260601193954.2103455-1-congkai%40amazon.com
patch subject: [PATCH] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
config: arm64-randconfig-r123-20260602 (https://download.01.org/0day-ci/archive/20260602/202606021209.2lvgE216-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021209.2lvgE216-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021209.2lvgE216-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c: In function 'access_pmmir':
>> arch/arm64/kvm/sys_regs.c:1391:28: error: invalid use of undefined type 'struct arm_pmu'
    1391 |         p->regval = cpu_pmu->reg_pmmir & ARMV8_PMU_SLOTS;
         |                            ^~


vim +1391 arch/arm64/kvm/sys_regs.c

  1373	
  1374	/*
  1375	 * Expose only PMMIR_EL1.SLOTS to the guest, which is consumed by perf in its
  1376	 * topdown default metric group. Other PMMIR_EL1 fields remain RAZ. Future
  1377	 * patches can extend the exposed mask incrementally as KVM gains support for
  1378	 * those features.
  1379	 */
  1380	static bool access_pmmir(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
  1381				 const struct sys_reg_desc *r)
  1382	{
  1383		struct arm_pmu *cpu_pmu = vcpu->kvm->arch.arm_pmu;
  1384	
  1385		if (p->is_write)
  1386			return write_to_read_only(vcpu, p, r);
  1387	
  1388		if (check_pmu_access_disabled(vcpu, 0))
  1389			return false;
  1390	
> 1391		p->regval = cpu_pmu->reg_pmmir & ARMV8_PMU_SLOTS;
  1392		return true;
  1393	}
  1394	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

