Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59552D10BF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 10:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFrAqsEFEMYNKPbxwM/7TmT/rSv7+qMBhIA2/hWjTrc=; b=k33kEgibegVDfOkOMBVK13coMe
	4mMu114x36D88gRIzIg5aTbYVDZ9y55jHwbRzpDyjUXRjFJl/8LQIKGLo1zWIt8UD6mzNPa0X8FOF
	dk6YHyTbNfAm4TmsiNbval0SmzaOzX2eO5VIeRCJCdEf7ctOK1XzuZCapTKZ3vXmeK5LUY8uf7MRr
	TpqOwVvKMHCAj8p04vUa6WwoJOWIvx+XCj704xYJ/XfwtgID3vVUTOpMQlhJDBOqPuAYvBj1SIXAT
	Lz/Kc0TJDHEDbtlmqIb++QtxyAQXbnYO/uayMHoOkXEXnR9iGAqK+WByf1KMJBO/WJZsF5syZDfnr
	aEdfu81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4dxM-00000006Mdq-48e9;
	Sat, 26 Oct 2024 10:23:41 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4dvl-00000006MUy-35hB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 10:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729938122; x=1761474122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OPKuXPHv05CbANj4GSwIspH+ZPJUtxzHe4p1mP5dGuY=;
  b=LyibKHAGWC1A2iJ0YHC5HzKcdU6DJ6mj8ADhr1Ow4B5k+vv34nT1PLd/
   NRfMWS4JYLwkCAnbU500OIP5AvUpu55T0jJcwl7GBzbiA02dpvPTDxJfg
   TvzT6JtHCk5l+UqHyPouNOMSgWPW2sO3mCq3jQPqmoWHiMtEaul7ihmzB
   rpt0wlxK8M4IenGr/wI3NZyhqqXysfBM138wCoCGyymezuaqdGAifmll3
   VNJtw6cG54xLnq/Ofd16k2VFjg5FX39Q8/iv1Qjt84ulHwA19Xwlsi9Pj
   ZqT9a6e83GutNhOrD4zwdfWEDJgGn+Ed9wCQIcrk5hrrVorGWqAvzGbQG
   A==;
X-CSE-ConnectionGUID: nU3Ax83uSTCWhM43vFXfsw==
X-CSE-MsgGUID: RoGlyJFjRme0nGboDfrwjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29557742"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29557742"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 03:22:01 -0700
X-CSE-ConnectionGUID: SK9Ub1PSSvaVlfptiHZJig==
X-CSE-MsgGUID: ciyX6KyqRYagVEcBlNXZWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="85720390"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Oct 2024 03:21:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4dve-000ZVW-1T;
	Sat, 26 Oct 2024 10:21:54 +0000
Date: Sat, 26 Oct 2024 18:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [PATCH v4 10/18] KVM: arm64: nv: Describe trap behaviour of
 MDCR_EL2.HPMN
Message-ID: <202410261855.fvLOtls9-lkp@intel.com>
References: <20241025182354.3364124-11-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025182354.3364124-11-oliver.upton@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_032201_947377_7A237160 
X-CRM114-Status: GOOD (  11.84  )
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

Hi Oliver,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8e929cb546ee42c9a61d24fae60605e9e3192354]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Upton/KVM-arm64-Extend-masking-facility-to-arbitrary-registers/20241026-023055
base:   8e929cb546ee42c9a61d24fae60605e9e3192354
patch link:    https://lore.kernel.org/r/20241025182354.3364124-11-oliver.upton%40linux.dev
patch subject: [PATCH v4 10/18] KVM: arm64: nv: Describe trap behaviour of MDCR_EL2.HPMN
config: arm64-randconfig-003-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261855.fvLOtls9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261855.fvLOtls9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261855.fvLOtls9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kvm/emulate-nested.c:8:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm64/kvm/emulate-nested.c:532:35: error: too many arguments to function call, expected single argument 'vcpu', have 2 arguments
     532 |         if (kvm_pmu_counter_is_hyp(vcpu, idx))
         |             ~~~~~~~~~~~~~~~~~~~~~~       ^~~
   include/kvm/arm_pmu.h:191:20: note: 'kvm_pmu_counter_is_hyp' declared here
     191 | static inline bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu)
         |                    ^                      ~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/vcpu +532 arch/arm64/kvm/emulate-nested.c

   509	
   510	static enum trap_behaviour check_mdcr_hpmn(struct kvm_vcpu *vcpu)
   511	{
   512		u32 sysreg = esr_sys64_to_sysreg(kvm_vcpu_get_esr(vcpu));
   513		unsigned int idx;
   514	
   515	
   516		switch (sysreg) {
   517		case SYS_PMEVTYPERn_EL0(0) ... SYS_PMEVTYPERn_EL0(30):
   518		case SYS_PMEVCNTRn_EL0(0) ... SYS_PMEVCNTRn_EL0(30):
   519			idx = (sys_reg_CRm(sysreg) & 0x3) << 3 | sys_reg_Op2(sysreg);
   520			break;
   521		case SYS_PMXEVTYPER_EL0:
   522		case SYS_PMXEVCNTR_EL0:
   523			idx = SYS_FIELD_GET(PMSELR_EL0, SEL,
   524					    __vcpu_sys_reg(vcpu, PMSELR_EL0));
   525			break;
   526		default:
   527			/* Someone used this trap helper for something else... */
   528			KVM_BUG_ON(1, vcpu->kvm);
   529			return BEHAVE_HANDLE_LOCALLY;
   530		}
   531	
 > 532		if (kvm_pmu_counter_is_hyp(vcpu, idx))
   533			return BEHAVE_FORWARD_RW | BEHAVE_IN_HOST_EL0;
   534	
   535		return BEHAVE_HANDLE_LOCALLY;
   536	}
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

