Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043C1CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLIWSHI/A9e2kSP+KDoNcN4xIeENb9wP8vYDPb9tF5Q=; b=r0Mkr3bRDVb/cUupnzrCpSoT8L
	k/aZcFhuwIuj4Znh1BJkfEeaK2poqHcBNEqa/uUJigvuT0JZ3Bey//F+JaOsU7DL4O/4YeAfOjvFu
	wx6sWRPHgdksK9JozQNUvrUzHzNrKNDUOtnOdM3oRWaF4ttOlxPjst5ka3C3T0/uhpJUhuJs0O6Mm
	FCLeR5ODWHI/wu94fszKdXDUK1wlQ3l6OhS7i7OjphVSOGn3zBNjxc9VralER0sgaEyRV5RzV064Z
	dDMf3MjuRqoZ/LDjmQc08ln7aIHT0KKoyVuq/WIyxAa5PCSYveVqO4mCV3aSaBtjcjs3U4xNjkRz5
	4WjD8NRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzv4J-00000005Cm5-3joQ;
	Sat, 20 Sep 2025 10:43:51 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzv4H-00000005ClJ-18rZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 10:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758365029; x=1789901029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GGcqmDnzpkqL527dvwmPXxPejn0tRqSqA9TUjS43tF4=;
  b=IDzOXjxu6n+OEjCQkPqoNbD3Qer68DNkE1FU3BTPmOwoCJQaWv42xDPf
   wqcqTah6WWDjT5eF7Fj4YrysdfItEZFe5zCSx72DFeI9r+YqTLRmemjBn
   yBEWzmsOB4351gKi56QsKSA+pi9sbPhpVM/RhcSaK98cFdwVRdBhg9R6r
   CqgdyZDOf08XdTNnSa9x7S/uZM8W+wPOL/khAUonwOETAc0RKJWDlTCXH
   5rs4uYz5IB3vu61tgOwGna7FwyNVYrCzy4qUPp/vDLDBcixl0x+Ynj3tP
   w5BAJcqiNMjX6P+shoMqL+Yeg+DfHQdcElycSvykFsEo18iyQfsPrGz0E
   g==;
X-CSE-ConnectionGUID: 6E2WdHdfTa2wsFYTrCzZkQ==
X-CSE-MsgGUID: yKeOjVEkQwqsGlE7Flrkkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="64334364"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="64334364"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 03:43:46 -0700
X-CSE-ConnectionGUID: ka3svwETTDyUeiqFLjtQ7A==
X-CSE-MsgGUID: KLR2Z4G+SdK4f8cCYhbYAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="180446374"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Sep 2025 03:43:44 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzv49-0005EB-1x;
	Sat, 20 Sep 2025 10:43:41 +0000
Date: Sat, 20 Sep 2025 18:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, jgg@ziepe.ca, praan@google.com,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <202509201819.f369wBHc-lkp@intel.com>
References: <20250919133316.2741279-5-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919133316.2741279-5-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_034349_383388_47DFFAC8 
X-CRM114-Status: GOOD (  10.59  )
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

Hi Mostafa,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.17-rc6 next-20250919]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mostafa-Saleh/iommu-io-pgtable-arm-Simplify-error-prints-for-selftests/20250919-213912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250919133316.2741279-5-smostafa%40google.com
patch subject: [PATCH v3 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
config: i386-randconfig-013-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201819.f369wBHc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201819.f369wBHc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201819.f369wBHc-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/iommu/io-pgtable-arm-selftests: section mismatch in reference: arm_lpae_run_tests+0x100 (section: .text) -> arm_lpae_dump_ops (section: .init.text)
>> ERROR: modpost: "alloc_io_pgtable_ops" [drivers/iommu/io-pgtable-arm-selftests.ko] undefined!
>> ERROR: modpost: "free_io_pgtable_ops" [drivers/iommu/io-pgtable-arm-selftests.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]
   Selected by [m]:
   - IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST [=m] && IOMMU_SUPPORT [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

