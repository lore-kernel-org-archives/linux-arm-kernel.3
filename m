Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656CDD3E76E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8B60kbg/K5MkIQ08fe8zGcwWoIcFmTgHE2Mb63XPEiw=; b=XnOqIXEYZwdU1e46A9DrOpouyH
	GCb7THe8Yq96PLjqoeEG8VXA4qVh7fQmyd91wbhGnxFlUGqEgyBV0V6tpePCyU/+wSToictUtiyTX
	l/BDvYx7rbX3giEUddezb0Sr2oYQMWDVukeKQmAyZoxForsMNViTywo16m8In1p9wCgoJB8hkyyu+
	PE2foJF5zp4b6p/bhAVpge0eNn4nYFp2iN+Xfh2UIJDoqi3rrA4/DHJrtrvoB3TYKjKypbQeq14jA
	DL8J7ZnBkMehLruvHgHuOZZrVg6hjQxuKNEGgMemfRmADUTW+i3SbCufuyJB4EweUqCx/KOBfgLSf
	BicRHa4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTOyf-0000000FkNQ-3wjO;
	Wed, 10 Dec 2025 18:31:53 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTOyd-0000000FkMz-34AF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 18:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765391511; x=1796927511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VNHdDxfKQZYeoMNw23AefvwVyxFS9n8FzpKeC+FIJog=;
  b=Jy1rgSyCZha4H1BTf9dwUO0uL/kNooxr8ZRvRF+HzlUpTtHl35A6t5/9
   LifIO3wxJWr45nL9tNgs/vhTvYBGHCWEcDSiFmtmdR4DttnR06Um+kgiG
   PSOimi40/50qAisQbvuUWb3rehkRgKHVnZ90L5J+h3rYues8H0Ewr+WjO
   HKOMlV5HM8oYgS3lbes8iG4VNy03IOfAL21rKHeeBrqLA3Wa+Qum+9DIG
   PZon80T7Z64KBffV2ZUgYZnYmG+Czg9W1BON9zr1UdoTjiwfL8WtHKu84
   u6lFTToC9ZqxXhOwVsIvSg0Z9fKx28lcGeT1kXqe7GvRAu4CuoaDFyx2P
   Q==;
X-CSE-ConnectionGUID: Rc6pcJLNSxi2NbO6MJgOhQ==
X-CSE-MsgGUID: 0+I/CE2UTgmtgzXSQY/ngA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92847886"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="92847886"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 10:31:50 -0800
X-CSE-ConnectionGUID: sjzEvg3oQTG3/3GQD9wleA==
X-CSE-MsgGUID: hyVtDifxTlaUirZgxJqxuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196647077"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 10:31:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTOyU-000000003dR-1S1d;
	Wed, 10 Dec 2025 18:31:42 +0000
Date: Thu, 11 Dec 2025 02:31:00 +0800
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
	Shuah Khan <skhan@linuxfoundation.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Colton Lewis <coltonlewis@google.com>
Subject: Re: [PATCH v5 11/24] KVM: arm64: Writethrough trapped PMEVTYPER
 register
Message-ID: <202512110209.GjVZa9ti-lkp@intel.com>
References: <20251209205121.1871534-12-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-12-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_103151_785042_495CD7B2 
X-CRM114-Status: UNSURE (   9.74  )
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

Hi Colton,

kernel test robot noticed the following build errors:

[auto build test ERROR on ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d]

url:    https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20251210-055309
base:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
patch link:    https://lore.kernel.org/r/20251209205121.1871534-12-coltonlewis%40google.com
patch subject: [PATCH v5 11/24] KVM: arm64: Writethrough trapped PMEVTYPER register
config: arm64-randconfig-001-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110209.GjVZa9ti-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110209.GjVZa9ti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110209.GjVZa9ti-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c: In function 'writethrough_pmevtyper':
>> arch/arm64/kvm/sys_regs.c:1183:34: error: implicit declaration of function 'kvm_pmu_event_mask'; did you mean 'kvm_pmu_evtyper_mask'? [-Wimplicit-function-declaration]
    1183 |                 eventsel = val & kvm_pmu_event_mask(vcpu->kvm);
         |                                  ^~~~~~~~~~~~~~~~~~
         |                                  kvm_pmu_evtyper_mask


vim +1183 arch/arm64/kvm/sys_regs.c

  1168	
  1169	static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
  1170					   u64 reg, u64 idx)
  1171	{
  1172		u64 eventsel;
  1173		u64 val = p->regval;
  1174		u64 evtyper_set = ARMV8_PMU_EXCLUDE_EL0 |
  1175			ARMV8_PMU_EXCLUDE_EL1;
  1176		u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
  1177	
  1178		__vcpu_assign_sys_reg(vcpu, reg, val);
  1179	
  1180		if (idx == ARMV8_PMU_CYCLE_IDX)
  1181			eventsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
  1182		else
> 1183			eventsel = val & kvm_pmu_event_mask(vcpu->kvm);
  1184	
  1185		if (vcpu->kvm->arch.pmu_filter &&
  1186		    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
  1187			val |= evtyper_set;
  1188	
  1189		val &= ~evtyper_clr;
  1190	
  1191		if (idx == ARMV8_PMU_CYCLE_IDX)
  1192			write_pmccfiltr(val);
  1193		else
  1194			write_pmevtypern(idx, val);
  1195	
  1196		return true;
  1197	}
  1198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

