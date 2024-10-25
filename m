Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E60D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 05:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70uPfxYFzBJWc7suBzM5Mrn79cMshpzzMxkFSxqbKQY=; b=SVWY4zDDXcR6esSe673Fqifecd
	NQwLr2azAGpEEzYlbbSgdzXBa+pfAWyu4wKtTG68rFcJX1fkZJpt9nTPFMQwkLJil//7e+hd4wijA
	mHYgeHl/NwXxi89N12gNH0pSfD9dKSQlyNdUAF9zNrjQKaSj/h7RxohPfQGL+Lc0UYgCTjopuDYJj
	hVwYEx6IhjgbGupbBhcpl3JRbaeYX0TjzZaw+jOzv4Z2MLSYwxZ3xmwH/x0bneZmIdMibxW4Q3iIy
	+VVGd7fQQGWQ9QNyPsh6LGDkkxD/mboWvrZDb8/ZQkrE91w5Jmmz546dmjW8KeLX1inHOjWFyjnTI
	DBskidNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DKB-00000002cRA-211G;
	Fri, 25 Oct 2024 05:57:27 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DIc-00000002cEC-16pH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 05:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729835750; x=1761371750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ihN9tLagLqN+X4m2rDGdBN+nxGXvbHRzDHkz4gXlS7I=;
  b=bOz6MLtStxhmMdDXk211ez9Gp95VsU0N+cz3Bmqc5lqWC2gBGwN7JWvd
   n83eQPPDkhfOvWs/QqQN6SmYMU4KS84wt/LL+EM+ISOreGkk9KD/dHIQs
   lEsiC8tJNfz/b4XkvT1GPQDVQPP2uMWfHTXJe2W0H5ee1fwNmydkPfBHE
   QRA2Jq65QjFivaNmBedkv+vqgkFWPMOHCKFl9yIvimc5UNeUq8HpQWOg3
   9MF3DxhRbMKWGUxQNjo2N1ZEgAwZIzkjmhusZjR9QBxGBFrEHgZp3rC6Z
   d0qE46l3sbPr+V36Ve3v6ue3SN171Pi3NQXibg05SHgeyFBGIwf5uPwDE
   w==;
X-CSE-ConnectionGUID: sbu6LYi+Qa2o7Z9Kvt8rpQ==
X-CSE-MsgGUID: 2H5dUFWaQ9+PhwSrGamk3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29434827"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29434827"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 22:55:47 -0700
X-CSE-ConnectionGUID: zTGlRI0mTFy3nvanWu1jeQ==
X-CSE-MsgGUID: 4Gef3XNkSBGEFn/4Gq6+qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="81651364"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2024 22:55:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4DIT-000Xeo-07;
	Fri, 25 Oct 2024 05:55:41 +0000
Date: Fri, 25 Oct 2024 13:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: goutongchen <goutongchen@uniontech.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, goutongchen <goutongchen@uniontech.com>,
	=?utf-8?B?6Iuf5rWp?= <gouhao@uniontech.com>
Subject: Re: [PATCH] iommu/arm-smmu: Add judgment on the size and granule
 parameters passed in
Message-ID: <202410251314.KllYat7L-lkp@intel.com>
References: <20241024100224.62942-1-goutongchen@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024100224.62942-1-goutongchen@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_225550_392823_3D3914C7 
X-CRM114-Status: GOOD (  14.98  )
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

Hi goutongchen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on arm-perf/for-next/perf linus/master joro-iommu/next v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/goutongchen/iommu-arm-smmu-Add-judgment-on-the-size-and-granule-parameters-passed-in/20241024-181048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20241024100224.62942-1-goutongchen%40uniontech.com
patch subject: [PATCH] iommu/arm-smmu: Add judgment on the size and granule parameters passed in
config: i386-buildonly-randconfig-005-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251314.KllYat7L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251314.KllYat7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251314.KllYat7L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from drivers/iommu/arm/arm-smmu/arm-smmu.c:20:
   drivers/iommu/arm/arm-smmu/arm-smmu.c: In function 'arm_smmu_tlb_inv_range_s1':
>> drivers/iommu/arm/arm-smmu/arm-smmu.c:287:34: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     287 |                                  "The size or granule passed in is err. size=%lu, granule=%lu\n",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:286:17: note: in expansion of macro 'dev_err'
     286 |                 dev_err(smmu->dev,
         |                 ^~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:287:80: note: format string is defined here
     287 |                                  "The size or granule passed in is err. size=%lu, granule=%lu\n",
         |                                                                              ~~^
         |                                                                                |
         |                                                                                long unsigned int
         |                                                                              %u
   drivers/iommu/arm/arm-smmu/arm-smmu.c:287:34: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     287 |                                  "The size or granule passed in is err. size=%lu, granule=%lu\n",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:286:17: note: in expansion of macro 'dev_err'
     286 |                 dev_err(smmu->dev,
         |                 ^~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:287:93: note: format string is defined here
     287 |                                  "The size or granule passed in is err. size=%lu, granule=%lu\n",
         |                                                                                           ~~^
         |                                                                                             |
         |                                                                                             long unsigned int
         |                                                                                           %u
   drivers/iommu/arm/arm-smmu/arm-smmu.c: In function 'arm_smmu_tlb_inv_range_s2':
   drivers/iommu/arm/arm-smmu/arm-smmu.c:321:34: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     321 |                                  "The size or granule passed in is err. size=%lu, granule=%lu\n",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:320:17: note: in expansion of macro 'dev_err'
     320 |                 dev_err(smmu->dev,
         |                 ^~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:321:80: note: format string is defined here
     321 |                                  "The size or granule passed in is err. size=%lu, granule=%lu\n",
         |                                                                              ~~^
         |                                                                                |
         |                                                                                long unsigned int
         |                                                                              %u
   drivers/iommu/arm/arm-smmu/arm-smmu.c:321:34: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     321 |                                  "The size or granule passed in is err. size=%lu, granule=%lu\n",
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:320:17: note: in expansion of macro 'dev_err'
     320 |                 dev_err(smmu->dev,
         |                 ^~~~~~~
   drivers/iommu/arm/arm-smmu/arm-smmu.c:321:93: note: format string is defined here
     321 |                                  "The size or granule passed in is err. size=%lu, granule=%lu\n",
         |                                                                                           ~~^
         |                                                                                             |
         |                                                                                             long unsigned int
         |                                                                                           %u

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +287 drivers/iommu/arm/arm-smmu/arm-smmu.c

   276	
   277	static void arm_smmu_tlb_inv_range_s1(unsigned long iova, size_t size,
   278					      size_t granule, void *cookie, int reg)
   279	{
   280		struct arm_smmu_domain *smmu_domain = cookie;
   281		struct arm_smmu_device *smmu = smmu_domain->smmu;
   282		struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
   283		int idx = cfg->cbndx;
   284	
   285		if (size == 0 || granule == 0 || (size % granule) != 0) {
   286			dev_err(smmu->dev,
 > 287					 "The size or granule passed in is err. size=%lu, granule=%lu\n",
   288					 size, granule);
   289			return;
   290		}
   291	
   292		if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
   293			wmb();
   294	
   295		if (cfg->fmt != ARM_SMMU_CTX_FMT_AARCH64) {
   296			iova = (iova >> 12) << 12;
   297			iova |= cfg->asid;
   298			do {
   299				arm_smmu_cb_write(smmu, idx, reg, iova);
   300				iova += granule;
   301			} while (size -= granule);
   302		} else {
   303			iova >>= 12;
   304			iova |= (u64)cfg->asid << 48;
   305			do {
   306				arm_smmu_cb_writeq(smmu, idx, reg, iova);
   307				iova += granule >> 12;
   308			} while (size -= granule);
   309		}
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

