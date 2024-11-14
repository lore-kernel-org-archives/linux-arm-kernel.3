Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1DDD637A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 00:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irqL6pr5FGKQNln0RCNGxRMdsDOI546965/EfKxMtaA=; b=4cMAJDRKgGDsTwhw/KxWYtMteg
	wPzloGcED8FPDnbt2P8+qm+OHg8KPCnCC6tHzeQyKS1TxphX+Of8y2sJMGiTWyxEMGFwQrCFIJEiO
	UmH/UVochkdXh8izZvARF/auieICq5U22MaKg4fhJJIUEATKSTEfzxgRoki37DqNnSIr3oblE+qC4
	3W4JpsL6KmC0M9mwgOi+7oOewhNgKD8C9Acgzvk7+leE78E2hWomCm3WY3zZXQ3Ycysztg6WTLr9/
	z0XNFcBjWFsDwvdKgvU3ZNoKQTuasP/GwGN5l2pXhBE8bRKmA7dvD34FDzlFNPLnwWPnyuPZ1QQt3
	WM/G0c7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBNOp-00000008JfB-37YA;
	Thu, 14 Nov 2024 00:07:52 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBNN0-00000008JQc-2aoA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 00:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731542758; x=1763078758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QCU4sOzgkeIKbdmKlY+8wD3dNS2f394YpPWJGiZp+Bs=;
  b=QUUcgK8LIG7NhljrT0/pJdd89kLe22wCJWDa2uS7Is40ePI2YS3dA9Z3
   rkscJRW3mNI5SzShg3zyd83XRONIbZS6x4jBmc1IVnUyiRcnlWNnH6K3V
   rbVKbkOENR/F8H4itk7oigXhwEAdWBb45Vuz3JnidSTqHOm5mfkwOnJfW
   8TCsTE+w94zOCzTDVAljsm6flfbRw6DBfqnW7ZGK/CSEnWqTKg/Ldd2hi
   SrYF/eFImK1R92oP7NAYf3efMi+kU2czGt8l/G92DNYjea3neACHcGfVc
   etNlCh1xLOLzTzxNXxO6FgDiySloarJAuyT10BhgZXNO7yLKZgRFSg/+t
   g==;
X-CSE-ConnectionGUID: p7rdzvW2Qqe3wE4uEBai5A==
X-CSE-MsgGUID: zz+JVGGZQ36GtkyFpmxSVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42073495"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="42073495"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 16:05:57 -0800
X-CSE-ConnectionGUID: KKYYy0w6RvCAL6KZ1+vJGA==
X-CSE-MsgGUID: MXJRmlm9RzmXYn9RqXolmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="111341296"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2024 16:05:54 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBNMt-0000uR-20;
	Thu, 14 Nov 2024 00:05:51 +0000
Date: Thu, 14 Nov 2024 08:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robdclark@gmail.com,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, quic_bibekkum@quicinc.com
Subject: Re: [PATCH v17 1/5] iommu/arm-smmu: re-enable context caching in
 smmu reset operation
Message-ID: <202411140748.6mcFdJdO-lkp@intel.com>
References: <20241112165454.2698269-2-quic_bibekkum@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112165454.2698269-2-quic_bibekkum@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_160558_697073_9465FC20 
X-CRM114-Status: GOOD (  11.80  )
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

Hi Bibek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on joro-iommu/next v6.12-rc7 next-20241113]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bibek-Kumar-Patro/iommu-arm-smmu-re-enable-context-caching-in-smmu-reset-operation/20241113-042646
base:   linus/master
patch link:    https://lore.kernel.org/r/20241112165454.2698269-2-quic_bibekkum%40quicinc.com
patch subject: [PATCH v17 1/5] iommu/arm-smmu: re-enable context caching in smmu reset operation
config: powerpc64-randconfig-r064-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140748.6mcFdJdO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140748.6mcFdJdO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140748.6mcFdJdO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu/arm-smmu-impl.c:10:
   In file included from drivers/iommu/arm/arm-smmu/arm-smmu.h:18:
   In file included from include/linux/io-64-nonatomic-hi-lo.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iommu/arm/arm-smmu/arm-smmu-impl.c:113:6: warning: unused variable 'i' [-Wunused-variable]
     113 |         int i;
         |             ^
   2 warnings generated.


vim +/i +113 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c

62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  109  
759aaa10c76cba drivers/iommu/arm-smmu-impl.c Vivek Gautam 2019-09-20  110  int arm_mmu500_reset(struct arm_smmu_device *smmu)
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  111  {
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  112  	u32 reg, major;
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15 @113  	int i;
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  114  	/*
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  115  	 * On MMU-500 r2p0 onwards we need to clear ACR.CACHE_LOCK before
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  116  	 * writes to the context bank ACTLRs will stick. And we just hope that
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  117  	 * Secure has also cleared SACR.CACHE_LOCK for this to take effect...
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  118  	 */
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  119  	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_ID7);
fba6e960772b7b drivers/iommu/arm-smmu-impl.c Will Deacon  2020-01-10  120  	major = FIELD_GET(ARM_SMMU_ID7_MAJOR, reg);
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  121  	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sACR);
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  122  	if (major >= 2)
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  123  		reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  124  	/*
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  125  	 * Allow unmatched Stream IDs to allocate bypass
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  126  	 * TLB entries for reduced latency.
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  127  	 */
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  128  	reg |= ARM_MMU500_ACR_SMTNMB_TLBEN | ARM_MMU500_ACR_S2CRB_TLBEN;
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  129  	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sACR, reg);
62b993a36e4c2d drivers/iommu/arm-smmu-impl.c Robin Murphy 2019-08-15  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

