Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3CAE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0IIgAVDEROYOZ854gBlewqgUDJIXw12hHa8cvM2nTUQ=; b=ou4ahzQatq+l7d1hYzIamNEs1r
	FCX5fX5bo71Wcxjl+237p5E2FuaiUtadcllXRxku2TizJEIuZBX+NquFFnvx5rCLyIgunuZM6RuIb
	ViuENshSjtn36tIUy3uwMIQpil37j/B37lBR93ahxrMSRmFlybp3bq97TuLBS9pbzqClAwRJVERq4
	8J7YrPlPixL9SuOxacijQ5V3SfA0In1eCqYgD6r/Ag3YCIKGi7/XKLL81ByYxYhpZSm40BvLhRXCj
	coIas23mRWxxcNKWYxJrLHfPVDebzPWU1LeZG65uiNMErb1VjdqOowldv4I7BljvxM1HnaRGftKRA
	EAzVCcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxDY-0000000B5NG-1YdA;
	Tue, 10 Dec 2024 10:11:48 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKx3p-0000000B3aJ-2g2J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733824905; x=1765360905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UxNGTFxLzH5h1Q1qNa96VXFgW2TmHFKNGLlWyoa7Vy4=;
  b=ef+A9CNS93SPt0LAgn+i3M6HMiqqUKTb6Ph/Jns3LHSG4rNZ2Yc0LpQ9
   lwafy0aI0U1V23rWt/SKcs2zH+hiCz2Iuq2Tsm57JlZ6PYMJyVOFFwPg/
   fkMoz4sww9gjtYjRxhpJIHLycX/LJfU72he7nvZ6VZbyshM1VzbtI5Aik
   xoaNyXdKzu3bIrqk3mnaWLBcfVxmIg8pzPlYbhHSYiOYBu9hN7ZaM+z2w
   +JM1aQlRwIJh7MWLUOQcqcaLoYiUeSzBs/TeuSxYgBtjzJ8pI+hqAG/vW
   Evw83Fg96/exkjZj2Og+RMRHQFc7ytRSHT1neHd9xzZd1MbjGB0S/fRKi
   A==;
X-CSE-ConnectionGUID: Qf9Fpx6BRw+PZTIH1ciBjw==
X-CSE-MsgGUID: Us80xMELTWSKHDfYGwQt+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33496478"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33496478"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 02:01:44 -0800
X-CSE-ConnectionGUID: B9ayLaQ6RNOVAX+XyLV+DA==
X-CSE-MsgGUID: u18wOnXHTYOIuzqcp+PPJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="100399525"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Dec 2024 02:01:42 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKx3j-0005N7-2O;
	Tue, 10 Dec 2024 10:01:39 +0000
Date: Tue, 10 Dec 2024 18:00:47 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:pci/xgene-fixes-6.13 8/18]
 drivers/iommu/amd/iommu.c:3810:3: error: field designator 'bus_token' does
 not refer to any field in type 'const struct msi_parent_ops'
Message-ID: <202412101701.Uu0dEEE7-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_020145_692202_6906EEB5 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git pci/xgene-fixes-6.13
head:   32627e010975ae9817552c5e21d1860ce9c9bdfa
commit: 3c9773aab9b801ba71766b264e859785309b13ba [8/18] iommu/amd: Convert to msi_create_parent_irq_domain() helper
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20241210/202412101701.Uu0dEEE7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101701.Uu0dEEE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101701.Uu0dEEE7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/amd/iommu.c:12:
   In file included from include/linux/pci.h:1644:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/amd/iommu.c:3810:3: error: field designator 'bus_token' does not refer to any field in type 'const struct msi_parent_ops'
    3810 |         .bus_token              = DOMAIN_BUS_AMDVI,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +3810 drivers/iommu/amd/iommu.c

  3807	
  3808	static const struct msi_parent_ops amdvi_msi_parent_ops = {
  3809		.supported_flags	= X86_VECTOR_MSI_FLAGS_SUPPORTED | MSI_FLAG_MULTI_PCI_MSI,
> 3810		.bus_token		= DOMAIN_BUS_AMDVI,
  3811		.prefix			= "IR-",
  3812		.init_dev_msi_info	= msi_parent_init_dev_msi_info,
  3813	};
  3814	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

