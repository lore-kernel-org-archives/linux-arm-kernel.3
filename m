Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B62C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 07:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioPUWgscyPWmod5/tzPfoDeL7ip2pIgc/ShXrvy8Bb0=; b=mLkWzxKjjHfLdt/JPTA1YAjnGy
	IT6f3gRsFhNLu6DVOKVXsYwpQfGVKOsJxaaSZgGAGtO0CdZps36hU0ep8YEBOtzIgg3JMKZ5gTcDG
	KyW1zk0fy7EsyVTiB90k90zxPMAjBIXnsEdFwQOjINz1wg+GboJ/h42lf3dA1xyDXmCYbzq6VEjln
	HH9QLgIcFR2RNAijg1KWW9Jzy9jhHChZIxJJtuGrOD3UhW53Be903mfoV0tiIKaEj6RRSFIp4Ki0M
	2otXqK2hPhLfEOuGpByjFJuElm/w1hZud2eDvHL9TKASDqRsvi/slmO4z9Ul6doZihMOdDqaVDNw+
	nSKpyRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVPkE-0000000GTnt-2dE5;
	Sat, 28 Jun 2025 07:13:02 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVPhw-0000000GTgy-10vG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 07:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751094640; x=1782630640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2tVRa6wsMqTyE/oQPrMRT6Uokojksj6kxjX9glGnRB0=;
  b=MoJoAffoS/tu+72qcR9XVVxFg8+gUguMGZtdJKmZwqMXTA4PpQAhwA3+
   Vo4N3u1067RPTAjJCR/4loQtzazDxqvdnv91iMvWwU42o1FLcdoeI+t82
   K10aO1ZSDv0Ovx92mL9pxRZ7y9Cg2e+fukK0xEh9VRBcttCK1Wgp0MC6d
   b70ES4lhxZIV9KpYyeZnA5zcdVqn8LnWtnDcXk/c/Ve4540Te9G66VsO8
   633ViniHFGHZAilqHysXJvrsd427xGiFzb1cXWn95f08rQLDqVnjpkr6R
   N1OT/VrdTGJLdMyRUGdTaa/ZW2POI0uZz+eEyjrwWhULgxten3mcNXPNV
   g==;
X-CSE-ConnectionGUID: C/kRYSCBSRqLmnTOnAPPaA==
X-CSE-MsgGUID: TYzKMGR8RFamM+pvtG2QwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57080309"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="57080309"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 00:10:37 -0700
X-CSE-ConnectionGUID: ohOsf+HWQWOFrhTjoH3+RA==
X-CSE-MsgGUID: zP+1cSr+RoWpV9omkLPlxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="158488584"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jun 2025 00:10:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVPhm-000Wsw-0M;
	Sat, 28 Jun 2025 07:10:30 +0000
Date: Sat, 28 Jun 2025 15:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
	linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, gregkh@linuxfoundation.org,
	Will Deacon <will@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>
Cc: oe-kbuild-all@lists.linux.dev, Yicong Yang <yangyicong@huawei.com>,
	linuxarm@huawei.com, Yushan Wang <wangyushan12@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, H Peter Anvin <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 5/8] arm64: Select
 GENERIC_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <202506281452.zc1D1sSz-lkp@intel.com>
References: <20250624154805.66985-6-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624154805.66985-6-Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_001040_363927_2645D2A0 
X-CRM114-Status: GOOD (  11.50  )
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

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus arm64/for-next/core linus/master nvdimm/libnvdimm-for-next v6.16-rc3]
[cannot apply to nvdimm/dax-misc next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/memregion-Support-fine-grained-invalidate-by-cpu_cache_invalidate_memregion/20250624-235402
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20250624154805.66985-6-Jonathan.Cameron%40huawei.com
patch subject: [PATCH v2 5/8] arm64: Select GENERIC_CPU_CACHE_INVALIDATE_MEMREGION
config: arm64-randconfig-r111-20250628 (https://download.01.org/0day-ci/archive/20250628/202506281452.zc1D1sSz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce: (https://download.01.org/0day-ci/archive/20250628/202506281452.zc1D1sSz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281452.zc1D1sSz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/cache.c:12:1: sparse: sparse: symbol 'scfm_lock' was not declared. Should it be static?
   drivers/base/cache.c:14:6: sparse: sparse: context imbalance in 'generic_set_sys_cache_flush_method' - wrong count at exit
   drivers/base/cache.c:27:9: sparse: sparse: context imbalance in 'generic_clr_sys_cache_flush_method' - wrong count at exit
   drivers/base/cache.c:31:5: sparse: sparse: context imbalance in 'cpu_cache_invalidate_memregion' - wrong count at exit
   drivers/base/cache.c:41:6: sparse: sparse: context imbalance in 'cpu_cache_has_invalidate_memregion' - wrong count at exit

vim +/scfm_lock +12 drivers/base/cache.c

b51d47491c68aef Yicong Yang 2025-06-24   9  
b51d47491c68aef Yicong Yang 2025-06-24  10  
b51d47491c68aef Yicong Yang 2025-06-24  11  static const struct system_cache_flush_method *scfm_data;
b51d47491c68aef Yicong Yang 2025-06-24 @12  DEFINE_SPINLOCK(scfm_lock);
b51d47491c68aef Yicong Yang 2025-06-24  13  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

