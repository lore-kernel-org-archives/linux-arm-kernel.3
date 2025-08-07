Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEBEC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 17:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsAS9Tuy4AgNXXWDeNU01MnGPKVHZKKw0o/G3y82Y4U=; b=23Bbsjdkf0os3CPxGnTCYD9Tzf
	NNI4aMXtWf8aj8xdlN7F/wIIRtvTQaIwaqCKE+QMDYI7KyjLeg6YYSYmJPMzKH4//SObkbkCrZ3K5
	H1W5wSN6g4UggTsxvrKLBhw+Fh1E2d8N1uCz1hMdLMJm779c0qlPvaCS0GgZZiixvCR1TSTuY/sw+
	7fUxX/H71h6Fk86lutNadbGXj3g0i+XdbxIw8Z0S9enyB0pJ8bTQ2RueayKGWZosk1O2Tuigl1PEP
	jMoctt/f8bZ9TJh992xt9Njj5P960O2D4C06R3PQv/MrEgkLbUohx3VfwqsOimPkNCXxUoZAQzJYF
	4cRmnqmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4t5-00000001HpV-3LaN;
	Thu, 07 Aug 2025 17:58:47 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4qX-00000001HLw-2Vme
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 17:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754589370; x=1786125370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TAXqubzsBEIA8arpECTj6N2IP2QqQQyNT2bLiy8zTkI=;
  b=OFZHRB63wzj9AOXNkzdwMfRF4qAM+psvPYcQsqO9+TbJ2GNTqGhYsQV+
   lQ8G3rz7hdAoLpbgmVc2Zw7AEkZ2WxEypo8VMsT/Zw0BsM5lXwSFjUhFo
   4LmDKD/SDNbY71K3zpxnbOozKOyIrNVOCitdlUjkXnUDH2FPvMwWCLIbn
   9ywHr/y/kzKBGr3ktAMgXkHmZODg64QFzJCsJQXO/N6X7DL8pltdd3mon
   /QANDEGuzhTE4svtt/2zj2rVze+VfPH+dP8Fj4eAf5LFae/GxU1mpLNWX
   kpvw8DodLQMrEmbd96WDfmdsv+FihInaYeOXi3ijHHcwzMrnePMJ6vmbx
   Q==;
X-CSE-ConnectionGUID: INBHXtN9RDKr+oNkk+wWJQ==
X-CSE-MsgGUID: 7LSZ9ktsQlSaMgpK9aDTnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56141673"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56141673"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 10:56:04 -0700
X-CSE-ConnectionGUID: sgd3Ks+xRWWyEHltsJTu+w==
X-CSE-MsgGUID: 3Dd3cOroRKuj9Wq4M4u96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165139305"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2025 10:56:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk4qG-00034I-2D;
	Thu, 07 Aug 2025 17:55:55 +0000
Date: Fri, 8 Aug 2025 01:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, jgg@ziepe.ca, will@kernel.org,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com, bboscaccy@linux.microsoft.com
Subject: Re: [PATCH v3 3/3] arm-smmu: select suitable MSI IOVA
Message-ID: <202508080104.M1bnmiMo-lkp@intel.com>
References: <20250806215539.1240561-4-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806215539.1240561-4-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_105609_678138_FFA1B060 
X-CRM114-Status: GOOD (  14.19  )
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

Hi Shyam,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.16 next-20250807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Saini/arm-smmu-move-MSI_IOVA-macro-definitions/20250807-055741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20250806215539.1240561-4-shyamsaini%40linux.microsoft.com
patch subject: [PATCH v3 3/3] arm-smmu: select suitable MSI IOVA
config: um-randconfig-r071-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080104.M1bnmiMo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080104.M1bnmiMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080104.M1bnmiMo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu/arm-smmu.c:24:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1602:35: error: use of undeclared identifier 'MSI_IOVA_BASE'
    1602 |         static const u64 msi_bases[] = { MSI_IOVA_BASE, MSI_IOVA_BASE2 };
         |                                          ^~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu/arm-smmu.c:1602:50: error: use of undeclared identifier 'MSI_IOVA_BASE2'
    1602 |         static const u64 msi_bases[] = { MSI_IOVA_BASE, MSI_IOVA_BASE2 };
         |                                                         ^~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu/arm-smmu.c:1610:23: error: invalid application of 'sizeof' to an incomplete type 'const u64[]' (aka 'const unsigned long long[]')
    1610 |         for (int i = 0; i != ARRAY_SIZE(msi_bases); i++) {
         |                              ^~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1613:44: error: use of undeclared identifier 'MSI_IOVA_LENGTH'
    1613 |                 if (resv_region_intersects(msi_bases[i], MSI_IOVA_LENGTH, head))
         |                                                          ^~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1616:50: error: use of undeclared identifier 'MSI_IOVA_LENGTH'
    1616 |                 region = iommu_alloc_resv_region(msi_bases[i], MSI_IOVA_LENGTH, prot,
         |                                                                ^~~~~~~~~~~~~~~
   1 warning and 5 errors generated.


vim +/MSI_IOVA_BASE2 +1602 drivers/iommu/arm/arm-smmu/arm-smmu.c

  1596	
  1597	static void arm_smmu_get_resv_regions(struct device *dev,
  1598					      struct list_head *head)
  1599	{
  1600		int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
  1601	
> 1602		static const u64 msi_bases[] = { MSI_IOVA_BASE, MSI_IOVA_BASE2 };
  1603	
  1604		iommu_dma_get_resv_regions(dev, head);
  1605	
  1606		/*
  1607		 * Use the first msi_base that does not intersect with a platform
  1608		 * reserved region. The SW MSI base selection is entirely arbitrary.
  1609		 */
> 1610		for (int i = 0; i != ARRAY_SIZE(msi_bases); i++) {
  1611			struct iommu_resv_region *region;
  1612	
  1613			if (resv_region_intersects(msi_bases[i], MSI_IOVA_LENGTH, head))
  1614				continue;
  1615	
  1616			region = iommu_alloc_resv_region(msi_bases[i], MSI_IOVA_LENGTH, prot,
  1617							 IOMMU_RESV_SW_MSI, GFP_KERNEL);
  1618			if (!region)
  1619				return;
  1620	
  1621			list_add_tail(&region->list, head);
  1622			return;
  1623		}
  1624	}
  1625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

