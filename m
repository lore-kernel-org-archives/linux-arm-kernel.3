Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7F2EA3F0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UcWNzuF7jdG9YY4BCdRHLU1BZ/CAp5RU6F6/GujEq0=; b=HZitiCT3Pos6r1QklyNB360KMn
	C2NqE52IXtRX+5gAqsPmmZdBbMJqw+n1ogAC//K4LUJakXaOHsIvlmUZX2Al+bthnC74eWzJBEJz1
	2SL32XSmbA8BDMEtPVNGS1jRlW9vn6TbWbA1/8BgVTJU2c4tNZHM5nbiDUnatVeZVAII7Qd1pav+y
	x5DXEYjyw5IAle/9JF8QuRMNu8tOtgdYmr0T4Qd3fQF+qqh2ZC4NW6Yjr2RP9tNvvbK2WADpgAgc+
	SX9p/RrYv1zYqwpo5105UUE5ZqgXZfBRvP/gynZhGQqDfrCagomrombY/PN5G3xx+4EdjCPNsdJ4M
	Tzsp0bDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgip-0000000GVL3-1tPk;
	Tue, 10 Feb 2026 05:55:39 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgim-0000000GVKb-2Hgz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770702937; x=1802238937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9nnWMdj/22l/UeayrTX5T1lj3a2Zm8Tv6HcRko/maj4=;
  b=aNtOSgt17uYI0ZhRJCdfu0cwXuayJe6shmzrNQpPle7+SVkMUgTGn3gh
   xhTeIk/1M4eBwHydAx1D9IZaLyC9zQL3OyvgM13UuBVMTChzGvgfnh4KN
   OX26Pm8uLbzLQ4Ffpr69iIxMURuYrfpQrxFHFCEOxIl+7J3GUIiqlJgaR
   ql4rpi/jioag67EdVkWGK7Pc9EM1opVf47jofoiQ3qXMg8CoaBIYqGM/Z
   I3oX3Zh0HkC9dWXgX+GnfENrU/bZzcVHr07MlheBEDPn+HAKrunV6to/0
   SXWks6BMu+9opE8vSQdO+Ll7Vl6npXeQ7CIEqWKivTR4W/t2roTSQFF89
   g==;
X-CSE-ConnectionGUID: ViV+tbu9RbysUCxF+N+avg==
X-CSE-MsgGUID: +p5UtbAaS4ewL5TTKitqDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82552881"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82552881"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 21:55:30 -0800
X-CSE-ConnectionGUID: arSyvb8yT9+dGXp6koLMDA==
X-CSE-MsgGUID: OiiH5N3LTQOp/Uz4oFV5Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211845844"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 21:55:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpgiY-00000000ogW-0ClM;
	Tue, 10 Feb 2026 05:55:22 +0000
Date: Tue, 10 Feb 2026 13:55:00 +0800
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
Subject: Re: [PATCH v6 16/19] KVM: arm64: Add vCPU device attr to partition
 the PMU
Message-ID: <202602101354.lZex1CmW-lkp@intel.com>
References: <20260209221414.2169465-17-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209221414.2169465-17-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_215536_650232_8B89693D 
X-CRM114-Status: GOOD (  11.43  )
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
patch link:    https://lore.kernel.org/r/20260209221414.2169465-17-coltonlewis%40google.com
patch subject: [PATCH v6 16/19] KVM: arm64: Add vCPU device attr to partition the PMU
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260210/202602101354.lZex1CmW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101354.lZex1CmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101354.lZex1CmW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/arm64/kvm/pmu-direct.c:55 function parameter 'vcpu' not described in 'kvm_vcpu_pmu_is_partitioned'
>> Warning: arch/arm64/kvm/pmu-direct.c:55 expecting prototype for kvm_pmu_is_partitioned(). Prototype was for kvm_vcpu_pmu_is_partitioned() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

