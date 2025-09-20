Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622ACCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Nd1aPrqiCLeeIiqpc7HTCpBA6v4isFixlY3rP006h4=; b=Q9fVbpfLyqk51OGDMef2Vxps4y
	CaPmBoyJfbrFbEXUqjZUiyltF1SPfauLMuJf2tt0/62w97RuCdCfKneMf3deizXGCYsKX3DHaGHfs
	F2QfK74KEQ6OhzvvDXq66975SWogX2MNRjejV5UtZAFj5xd0Q3VhprmsTwqx9JRgD+LHPdKblMDiM
	2jhHAZ3focUsXfFm+xeUSkR6Pq0cojrWLPJsYcnlB4/OwLSRvddN+cocrePFo4m3q8ebQH57JiasJ
	1rLG+DV+96Q9J3MprPSJ22KNl7Dbo7vlq2CwmEpBfnZLid2N20cxVtHvqx6WEwrRWAFQJUGWCWUoz
	Rt3lJPbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwDA-00000005Hrz-2QrN;
	Sat, 20 Sep 2025 11:57:04 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwD4-00000005Hmz-34jL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 11:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758369418; x=1789905418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8eIVJEoHUAIRvD1gg14WYcW9cJd5BsuqTZpTJujtgI8=;
  b=JDPppct9d4+FQ80IEPfKRXDOA4exTBKChywRlB1TUb8HcnkNlLp4Ca5d
   EKwd4XdBzcaF5eplw4/DHG7vm/qTdNXQjHFrNykqr7TRCTW4XcxdQZMLQ
   Hb+ltEF7QMJP6AUEgPaJ6Lv9fPIHmZ1jWcAhFfTCJh89Nh/0oDyB5ZzTH
   YPpaVj/jrvZ97BFKG2/aIHu0OLFKtCOYRsEhfTA9UrNJr8zga6r14+WEb
   /vv/2RSW1ekrTkR4JqrPqX3IOx/9DMmcAZvM4bkys/HBBhRloZU+lvsMM
   GKIg8QXvp3tlDp0TlCNSQONFHIuGlFOKff8v00+74vT28qpAAU0bOucqS
   w==;
X-CSE-ConnectionGUID: +hwHlGU8SEWobJy4zbjr3w==
X-CSE-MsgGUID: 0vLqLPN2Sp+e02BLUIDLCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="63328307"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="63328307"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 04:56:54 -0700
X-CSE-ConnectionGUID: GdGMHqegT/ekI/kvtyvU7Q==
X-CSE-MsgGUID: yhVq0D/mS1S/k52k8buX+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="176872093"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Sep 2025 04:56:52 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzwCw-0005J9-06;
	Sat, 20 Sep 2025 11:56:50 +0000
Date: Sat, 20 Sep 2025 19:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, jgg@ziepe.ca, praan@google.com,
	Mostafa Saleh <smostafa@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <202509201953.E4CkTm6w-lkp@intel.com>
References: <20250919133316.2741279-5-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919133316.2741279-5-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_045658_817759_2BFAF0B7 
X-CRM114-Status: GOOD (  10.97  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.17-rc6 next-20250919]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mostafa-Saleh/iommu-io-pgtable-arm-Simplify-error-prints-for-selftests/20250919-213912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250919133316.2741279-5-smostafa%40google.com
patch subject: [PATCH v3 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
config: xtensa-randconfig-002-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201953.E4CkTm6w-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201953.E4CkTm6w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201953.E4CkTm6w-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/iommu/io-pgtable-arm-selftests: section mismatch in reference: 0x84 (section: .text.unlikely) -> arm_lpae_dump_ops (section: .init.text)
>> WARNING: modpost: drivers/iommu/io-pgtable-arm-selftests: section mismatch in reference: arm_lpae_run_tests+0xa6 (section: .text.unlikely) -> arm_lpae_dump_ops (section: .init.text)
ERROR: modpost: "alloc_io_pgtable_ops" [drivers/iommu/io-pgtable-arm-selftests.ko] undefined!
ERROR: modpost: "free_io_pgtable_ops" [drivers/iommu/io-pgtable-arm-selftests.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
   Selected by [m]:
   - IOMMU_IO_PGTABLE_LPAE_KUNIT_TEST [=m] && IOMMU_SUPPORT [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

