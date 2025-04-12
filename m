Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B0C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 03:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cc2FK4gqjd/5/8RtOKZedld7majqdEVmU/J23hA8sX8=; b=XlEyjQK2n8jpN2GUgl6cgXHeIy
	cFprKELQGsFDhFqG9MG+cBv3fSDguPreKizYCOSlRVzP+pmiwUjbsWyf3SqD9rymVzdWT+6CnOJp2
	rTm6eMFbgrJL2cT+kOZYh+ibcyDyi1BcPeSxIYsd//JzTbV95iJDshlSZsXWnf+zfchCv2uRJ3rCa
	idLruU79A1WgkQRVc6U0Nr3znrnORxc6K638hRSgQkR6r4DOdRY1CYBMjIQrptnIqh6mB4LfmXmor
	235DpnJVCjmGYDH4ZkrHPvJC+OLcDtQ8FWoCjG/9tW/8bPGAPekx6pQPSJjlQtTGDABphul8fXMvw
	GBQhtThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3RPu-0000000FLBn-0yT0;
	Sat, 12 Apr 2025 03:20:26 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3RO5-0000000FL4M-0bMp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 03:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744427913; x=1775963913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5eRW5rxiHznaS29DsjlvBn1/iGmaCk4FYmbVdFXA/TM=;
  b=HOtLac0UUoi2xCEZmapTz4Tqu9VO/SPWnTGu9OEpVE23Nv/B341RBdVg
   0asxdPvsK36sMLGW6jjBHKpGkQl5iAPlIjQYanNdcwwZmZCgh3K1q3Y5m
   cbLTlVbp6wdMbibm6V4FEAAUHhRPDimB8jIb406j+oWMnnxvp9qoorOZg
   mLKsCFf2wSt//X6iqw/EVhEazM0J+xiCp9CFeoudrX62JyVncAx44Fbnn
   aBqfZF/0MPI8whUDaRQPkXgOw58cOPz0S11AClYC+xB7nUqQMy9KNZ62/
   WmchJn3rlNa+5UscILFTxxOEzhNQhI35KVIrWquWiV0W8MGjm8gXMDbDv
   A==;
X-CSE-ConnectionGUID: /pSIDuLvRgya5lD2dij9FQ==
X-CSE-MsgGUID: 0vot/gjPSNi+m8DI+QP/2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45120230"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="45120230"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 20:18:26 -0700
X-CSE-ConnectionGUID: q+jyXXBuRWOmAYFAkaeg5A==
X-CSE-MsgGUID: WaJlrbmWTlSWu6DOVsrunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="160326412"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Apr 2025 20:18:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3RNt-000BXi-0f;
	Sat, 12 Apr 2025 03:18:21 +0000
Date: Sat, 12 Apr 2025 11:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, jgg@ziepe.ca,
	will@kernel.org, jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 1/3] arm-smmu: move MSI_IOVA macro definitions
Message-ID: <202504121044.VSL6FbCC-lkp@intel.com>
References: <20250410225030.2528385-2-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410225030.2528385-2-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_201833_226082_2C4487A5 
X-CRM114-Status: GOOD (  11.01  )
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

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc1 next-20250411]
[cannot apply to soc/for-next joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Saini/arm-smmu-move-MSI_IOVA-macro-definitions/20250411-070014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250410225030.2528385-2-shyamsaini%40linux.microsoft.com
patch subject: [PATCH v2 1/3] arm-smmu: move MSI_IOVA macro definitions
config: arm-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250412/202504121044.VSL6FbCC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504121044.VSL6FbCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504121044.VSL6FbCC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu/arm-smmu.c:1597:35: error: use of undeclared identifier 'MSI_IOVA_BASE'
    1597 |         region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
         |                                          ^
>> drivers/iommu/arm/arm-smmu/arm-smmu.c:1597:50: error: use of undeclared identifier 'MSI_IOVA_LENGTH'
    1597 |         region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
         |                                                         ^
   2 errors generated.


vim +/MSI_IOVA_LENGTH +1597 drivers/iommu/arm/arm-smmu/arm-smmu.c

021bb8420d44cf drivers/iommu/arm-smmu.c              Robin Murphy 2016-09-14  1590  
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1591  static void arm_smmu_get_resv_regions(struct device *dev,
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1592  				      struct list_head *head)
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1593  {
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1594  	struct iommu_resv_region *region;
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1595  	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1596  
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19 @1597  	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
0251d0107cfb0b drivers/iommu/arm/arm-smmu/arm-smmu.c Lu Baolu     2022-10-19  1598  					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1599  	if (!region)
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1600  		return;
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1601  
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1602  	list_add_tail(&region->list, head);
273df9635385b2 drivers/iommu/arm-smmu.c              Robin Murphy 2017-03-16  1603  
273df9635385b2 drivers/iommu/arm-smmu.c              Robin Murphy 2017-03-16  1604  	iommu_dma_get_resv_regions(dev, head);
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1605  }
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1606  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

