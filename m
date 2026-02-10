Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CDBEB28F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 04:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42EEirI8/dMboOjRYX8FX7XLwwcAsNlEeDpXBwPduVk=; b=fDIh3BPWOw+qOzBoZXqwlwOA0G
	A/JD6BGXO8FXzHdTW4YmMihJXG+JODkl+0l/9KDNqc10cCg2mhb7SBc1nLX4d1S2XgzJNolVHasPZ
	arL3VzLcFy2TLbcu5oM1r+PJmgXe1NggbeZhZclwKWTYRcNIK3HIypQW9N5Lnxa2KQOIWBhRdBnvV
	nOXcaC2vIdRvlheoE3gCGC2Iej+KSHiUt34WhQZkpAfUz/909Hqe1ucA4zwCWH/xLcCXSDKWkxNSu
	nesVRb/W7xkUpNNxBy+7YN7l2rGvZMCwdWC8OnPsoX0BxTaDtis58pVtoiFVpOV/RHHvyU7aRtZbF
	6FX7LAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfPP-0000000GQJa-306S;
	Tue, 10 Feb 2026 04:31:31 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfPM-0000000GQJ8-0tnk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 04:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770697888; x=1802233888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DW5KiIguPY0xR9hCzywIYFuXhTS2MXhhTtWRg5PD0YA=;
  b=RUtX6acwWJF4dAhM6ftjftnROwSJu5H6/9x0grRwbiRWPLGYSG8/mnlB
   lNmzfrX9JhKjiEcxfkH8Mt8r/8ZgKf2D6Sr2Ht4wCseYsPW/Gkx/5nKjO
   2NmSEFu/IqoXxbl4w4uQ+L4/wJ15ehz6ukxlS/hnKWochoERwiJwuau6n
   OeFWpv/nFbYvqHCrE7q9/Gu+G+g8sB9bbiBmeGDGg3re5um8AtHwPrxYK
   nfCY4Rntp7WXKeCUiR95/gETcn8GyJtvVCt9Nd4gGroeBWmwrIFFn+RAL
   8i2U/hBfv1rH2WDgPIIj/5QbQ+5x0uTVTDCGmqWE+8gxPZpyYhs7PUPzA
   w==;
X-CSE-ConnectionGUID: I4D9CyCJRwmoXPMej9Jg1g==
X-CSE-MsgGUID: EHpoiEA0RlWWNMRjHVRSYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75666135"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75666135"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 20:31:26 -0800
X-CSE-ConnectionGUID: 3kprSobOTIeVB41nvr3pzQ==
X-CSE-MsgGUID: y2eYKf7tTjaiRjbwSrEsGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211872575"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 20:31:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpfPC-00000000odm-0uNs;
	Tue, 10 Feb 2026 04:31:18 +0000
Date: Tue, 10 Feb 2026 12:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
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
Subject: Re: [PATCH v6 08/19] KVM: arm64: Define access helpers for PMUSERENR
 and PMSELR
Message-ID: <202602101245.8Hv4avst-lkp@intel.com>
References: <20260209221414.2169465-9-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209221414.2169465-9-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_203128_350631_AC05A2CB 
X-CRM114-Status: GOOD (  11.87  )
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
patch link:    https://lore.kernel.org/r/20260209221414.2169465-9-coltonlewis%40google.com
patch subject: [PATCH v6 08/19] KVM: arm64: Define access helpers for PMUSERENR and PMSELR
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602101245.8Hv4avst-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101245.8Hv4avst-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101245.8Hv4avst-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/kvm_host.h:38,
                    from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
>> include/kvm/arm_pmu.h:260:12: warning: 'kvm_vcpu_read_pmuserenr' defined but not used [-Wunused-function]
     260 | static u64 kvm_vcpu_read_pmuserenr(struct kvm_vcpu *vcpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/arm64/include/asm/kvm_host.h:38,
                    from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
>> include/kvm/arm_pmu.h:260:12: warning: 'kvm_vcpu_read_pmuserenr' defined but not used [-Wunused-function]
     260 | static u64 kvm_vcpu_read_pmuserenr(struct kvm_vcpu *vcpu)
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_vcpu_read_pmuserenr +260 include/kvm/arm_pmu.h

   259	
 > 260	static u64 kvm_vcpu_read_pmuserenr(struct kvm_vcpu *vcpu)
   261	{
   262		return 0;
   263	}
   264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

