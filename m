Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E51D10BF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfGb/D1BxknT+o8I7XliQpk+FGJy+H+E4MvaZvzaKM0=; b=fnZHMGtNxnRka0yN3KT3JE4/Tw
	G+jQH+uQABJErwkc4pGOoslToLQOqD7sxmq6r63xvztdLD9QquojLyWYNcPaIsonMZpFe1cp6AVnl
	UTIgOX/XZb55gHXTdSDfb3/gtGlkmrfiWOeLnEurVGkPWRQvlp7rzQNPxZ61ZvlhqwBi002EbcUZZ
	B0xxnPYXW2+XXju/oZrr79emEd8QzEm2DrtA12kl2ZZOkXK2tJ3RjiB5RayB6oaaBP3EOJqsyHLNE
	GFxbbspa+BctN1/LRshjpwsKqyOQIipaMZth/hxlQLqrKVIjq35SaZP3bfZ8YuKwwgWSej523UaxO
	TcvYkHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4eHk-00000006OOw-0OhC;
	Sat, 26 Oct 2024 10:44:44 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4eG9-00000006OEK-258X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 10:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729939385; x=1761475385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9gVwNcR3yel3JsSy5pGYF3kpnt/UQMXBg0o/oFDzLJc=;
  b=T/qSFx5goUFeTPSpYZNMjhvX5QjcZAEojaitJz06Dh0I/uPqMNLLKiCm
   p5gECxDKy62aQmPZv2C3n7TiBrRiiolZH9jTj/zDev+rK3GZVQ+s1UWX5
   aooH17CeVRDhukCdVA5GbSwPXD7R3f/nbewaBa0GXkrcztqtnMTIn55Tu
   WvLyVCLMNuRu5bomXut81JRVlTkepT+It6p3WSU0OgMjq9jr2xoO//5dY
   7L/kBWl6hkBrRq+jTTJJXvwys08Z14r27FRkOlgDTeNH1coEK7jYTk8C0
   98OwSCXexPStkoMftafkj7d+KGUf12UVObKtaX9W5AzZUXO4nZ7bBBRip
   A==;
X-CSE-ConnectionGUID: QVmgiK75TryJvbjaFWdQIQ==
X-CSE-MsgGUID: B5J1tI73SR+Nb+5JZZmTSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29064885"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="29064885"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 03:43:00 -0700
X-CSE-ConnectionGUID: mMOIbCyXRwyZRGGBfDLOfw==
X-CSE-MsgGUID: S0CHul1SSlCWgangkFYJUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="81079534"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Oct 2024 03:42:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4eFz-000ZWs-0K;
	Sat, 26 Oct 2024 10:42:55 +0000
Date: Sat, 26 Oct 2024 18:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [PATCH v4 10/18] KVM: arm64: nv: Describe trap behaviour of
 MDCR_EL2.HPMN
Message-ID: <202410261839.enJ68VEv-lkp@intel.com>
References: <20241025182354.3364124-11-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025182354.3364124-11-oliver.upton@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_034305_606126_0453778B 
X-CRM114-Status: GOOD (  11.12  )
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
config: arm64-randconfig-004-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261839.enJ68VEv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261839.enJ68VEv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261839.enJ68VEv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/emulate-nested.c: In function 'check_mdcr_hpmn':
>> arch/arm64/kvm/emulate-nested.c:532:13: error: too many arguments to function 'kvm_pmu_counter_is_hyp'
     532 |         if (kvm_pmu_counter_is_hyp(vcpu, idx))
         |             ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/kvm_host.h:38,
                    from include/linux/kvm_host.h:45,
                    from arch/arm64/kvm/emulate-nested.c:8:
   include/kvm/arm_pmu.h:191:20: note: declared here
     191 | static inline bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu)
         |                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_pmu_counter_is_hyp +532 arch/arm64/kvm/emulate-nested.c

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

