Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7439FC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 23:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MyiUcTeYDT80LcolGd+0iSkCIWURcBDsidU4jle0a2w=; b=WrnpZb67/4yYHMdSMiI5nbxs4D
	6QewbhZiAaT4rZzlYgKJgl3R6w/3MmHQ/pPvrqMt/Ycm9oPrRZecgpiadUQY7awuqHshvHeNUNipE
	uUxDQf+b7+k5klySdbdzClpHiIKCNWOdj23mEwfynKD3D9h9JLuopqpEl2PnUlTwuQ8XjwVrjlWgY
	kNvqG6zzjlLUuybG5Dq8hBv/5OtpHjcdq0V8/VSbwfxxqk1pgdn/+De+6cKAzu2UEFYVS4VBOZDRf
	aD+IL4G1ivfIEDGbCbQKYFOtUZDezhlWOGRqWyB0iScKJc44tBJi2k/CO9PVuI1tUxr6z6COnjMxi
	r9giQLCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Npz-0000000F4xF-2xO7;
	Fri, 11 Apr 2025 23:31:07 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3No9-0000000F4bw-23Hs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 23:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744414153; x=1775950153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OJYsQ+v7XiUNwZtukFdPE6VB8Nuu1DBPLSvnq6QW3ZM=;
  b=H9k4184L5oiasVacVaka2vYqc46vgon3Pp3zCAqfwyRiz0BPOEh4+tua
   ScQS6CyPVgftIQ+Cco9gB5o4M+dfND3StX4R+itwen7gZwCi4wF/53iWH
   B8HUqUENUPtJ23dLCoXsXy/6yEuFlkebRkYDCrCgwbAB6hB0bg5qGkGkI
   3syO2Wr34yD/EBGhYgx06hfRbn0J9u9EuFWxQYsblbJI4ZYsdvl52MfZK
   tGygIyOfY59/q8Fw8Z7ntS5uB3pU1GwxzU3CJ24ji3Z2LhZKf03DeFXmo
   1e9jd371y8EQ4Js5qZzz1yY4ISOQ0CM156237qk66vQwqXodmUmsbw1Rf
   A==;
X-CSE-ConnectionGUID: EZCvv2K3Qo2rg3JWE5EfYQ==
X-CSE-MsgGUID: FJIeS2ntS8q/mlmnl1Lmbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46103718"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="46103718"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 16:29:08 -0700
X-CSE-ConnectionGUID: 9OhknDFPTe+BVkcOYOy2Nw==
X-CSE-MsgGUID: GOGtGaBbSAWpi2xE8iassQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="166511778"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Apr 2025 16:29:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Nnz-000BR8-1g;
	Fri, 11 Apr 2025 23:29:03 +0000
Date: Sat, 12 Apr 2025 07:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, jgg@ziepe.ca, will@kernel.org,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 1/3] arm-smmu: move MSI_IOVA macro definitions
Message-ID: <202504120700.1UwOUvMR-lkp@intel.com>
References: <20250410225030.2528385-2-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410225030.2528385-2-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_162913_543272_9A99C071 
X-CRM114-Status: GOOD (  15.10  )
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
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Saini/arm-smmu-move-MSI_IOVA-macro-definitions/20250411-070014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250410225030.2528385-2-shyamsaini%40linux.microsoft.com
patch subject: [PATCH v2 1/3] arm-smmu: move MSI_IOVA macro definitions
config: arc-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250412/202504120700.1UwOUvMR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120700.1UwOUvMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120700.1UwOUvMR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu/arm-smmu.c: In function 'arm_smmu_get_resv_regions':
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1597:42: error: 'MSI_IOVA_BASE' undeclared (first use in this function); did you mean 'PCI_IO_BASE'?
    1597 |         region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
         |                                          ^~~~~~~~~~~~~
         |                                          PCI_IO_BASE
   drivers/iommu/arm/arm-smmu/arm-smmu.c:1597:42: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/iommu/arm/arm-smmu/arm-smmu.c:1597:57: error: 'MSI_IOVA_LENGTH' undeclared (first use in this function)
    1597 |         region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
         |                                                         ^~~~~~~~~~~~~~~


vim +/MSI_IOVA_LENGTH +1597 drivers/iommu/arm/arm-smmu/arm-smmu.c

021bb8420d44cf5 drivers/iommu/arm-smmu.c              Robin Murphy 2016-09-14  1590  
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1591  static void arm_smmu_get_resv_regions(struct device *dev,
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1592  				      struct list_head *head)
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1593  {
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1594  	struct iommu_resv_region *region;
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1595  	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1596  
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19 @1597  	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
0251d0107cfb0bb drivers/iommu/arm/arm-smmu/arm-smmu.c Lu Baolu     2022-10-19  1598  					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1599  	if (!region)
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1600  		return;
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1601  
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1602  	list_add_tail(&region->list, head);
273df9635385b21 drivers/iommu/arm-smmu.c              Robin Murphy 2017-03-16  1603  
273df9635385b21 drivers/iommu/arm-smmu.c              Robin Murphy 2017-03-16  1604  	iommu_dma_get_resv_regions(dev, head);
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1605  }
f3ebee80b3131d4 drivers/iommu/arm-smmu.c              Eric Auger   2017-01-19  1606  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

