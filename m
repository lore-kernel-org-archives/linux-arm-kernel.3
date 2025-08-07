Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEE9C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHe3DXGlkhpE+u7X0kbUMzSWfFvMMwSfNOW+GmRvtBc=; b=O/W12MDOYEKOLQVmSgQK41n1WD
	0nSYm8Q+IIsE+Pmwtd9ViLN7P9LnDwRoM4iEhsvKqigGVLd50epibb6vOR24aVNqwRXorXkt8g6tH
	NpSPaqQV4K/EvFRFNjTFxniTEheoRo8onJmJJ0f/8IqH6YjB2bqiiaTg0YVr6uythxXPfDpIJMXEv
	4Qi/GackcNX0UY0IHLTga+s1/lo329oagi5ltYGNtr2cZsZ6AEsjM4Y1xdob+eG33o83m2AsRsfTD
	q0nZxLRuaF/1EIJu3PMIvzRcVZvIb/QyspTPN4zgKF/aWIRvA1UVTOg+Yhe9WlSX2diEifp59bE/8
	IPIt8Ohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk1jP-00000000pbK-3AiL;
	Thu, 07 Aug 2025 14:36:35 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk1gn-00000000pFx-1gFr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 14:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754577233; x=1786113233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wb1Mj5eB9a3PVIkwcblhXlBnzqloEY/YGjLzscQcGsI=;
  b=UnG4kWmC/btmo/hWah90Cq/ORjgCe5R+fNmZNrJs6pO2NeD2jVMgoECo
   ifFN9DVIEVB8PWLhobx5ifJrVfXK0EKVKGu8jT9owSNKsBHxJ30SidzsO
   K49TyOU+E8ag75fLEbQ+me9zjm+REAoplrv0KJdbqTZexTFNjcxl7j+L8
   GySpK9ft2XMOT6L5TYoS/afVUbAK2aoBZD5D5IaOgUuTXqtbUM2fR7ABm
   bvWGYYC/WSamPTWEeR/GQL6lRpboGv46QW9KdAnJc4Zi9/K+lpHTLFCAa
   S7l67tbNIv5hxafhGlpkT3zyIuvS3d5A5GY5piwAEl3cjiEbkcoh91JVS
   g==;
X-CSE-ConnectionGUID: PUWwnbJ6Tly3dJZDyT6i0Q==
X-CSE-MsgGUID: BnP7vw2ZQyGVIEIJWPH9qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68288324"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="68288324"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 07:33:47 -0700
X-CSE-ConnectionGUID: 9Us8bKFQSI+xgOF3SRwvCA==
X-CSE-MsgGUID: JQBwjP7BRQusc2Djw8PMcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169281764"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Aug 2025 07:33:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk1gb-0002sw-1Q;
	Thu, 07 Aug 2025 14:33:41 +0000
Date: Thu, 7 Aug 2025 22:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, jgg@ziepe.ca, will@kernel.org,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com, bboscaccy@linux.microsoft.com
Subject: Re: [PATCH v3 1/3] arm-smmu: move MSI_IOVA macro definitions
Message-ID: <202508072221.zOvuARaV-lkp@intel.com>
References: <20250806215539.1240561-2-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806215539.1240561-2-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_073353_458466_0B9701FC 
X-CRM114-Status: GOOD (  12.33  )
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
patch link:    https://lore.kernel.org/r/20250806215539.1240561-2-shyamsaini%40linux.microsoft.com
patch subject: [PATCH v3 1/3] arm-smmu: move MSI_IOVA macro definitions
config: um-randconfig-r071-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072221.zOvuARaV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072221.zOvuARaV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508072221.zOvuARaV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu/arm-smmu.c:24:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/iommu/arm/arm-smmu/arm-smmu.c:1603:35: error: use of undeclared identifier 'MSI_IOVA_BASE'
    1603 |         region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
         |                                          ^~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1603:50: error: use of undeclared identifier 'MSI_IOVA_LENGTH'
    1603 |         region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
         |                                                         ^~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/MSI_IOVA_BASE +1603 drivers/iommu/arm/arm-smmu/arm-smmu.c

021bb8420d44cf drivers/iommu/arm-smmu.c              Robin Murphy 2016-09-14  1596  
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1597  static void arm_smmu_get_resv_regions(struct device *dev,
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1598  				      struct list_head *head)
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1599  {
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1600  	struct iommu_resv_region *region;
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1601  	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1602  
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19 @1603  	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
0251d0107cfb0b drivers/iommu/arm/arm-smmu/arm-smmu.c Lu Baolu     2022-10-19  1604  					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1605  	if (!region)
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1606  		return;
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1607  
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1608  	list_add_tail(&region->list, head);
273df9635385b2 drivers/iommu/arm-smmu.c              Robin Murphy 2017-03-16  1609  
273df9635385b2 drivers/iommu/arm-smmu.c              Robin Murphy 2017-03-16  1610  	iommu_dma_get_resv_regions(dev, head);
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1611  }
f3ebee80b3131d drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1612  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

