Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D398D1CA15
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 03:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPwv7ATeqSlSRRfPfw+iu5oZ93uIYGag6YJHbmSIdVc=; b=4QfWVwwRim6CjtdY8uHG9v1LES
	GfTv/oMXcpYRE2b9OLzAvQ1WG5CjhhnHJmib45FYaUhWhGz8Z7zWgwz2bLHW6MyWEY8Gy70Z6lrOb
	mV6adP4AAVMq6dCty1k+ev678iQ+jwM4EsOFJ5A4VJ6yKufOatdaBqbiGNauK5ELszqQeKKqhrjDn
	uwqgFap1DsjsnYkOh6rqgkQgtiC/gScFBCtKx7Iru1Qigsfr8fI3cpVtFpbNYuRSvdaw9eGo+5CYn
	4KNxlqXpRhlqC17zUUcjCnsGjibVJAmLm10qdpD0+r4n+U7FAZyRl3zVhRmRac87VRp04hxq0g0oQ
	3ba/dgEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8AYp-0000000Fnu8-3Dwm;
	Tue, 05 Nov 2024 03:48:55 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8AX8-0000000Fnia-0CxF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 03:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730778430; x=1762314430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2JD/SF3RDU/EAWXGkUkiGo50LDNAryP1U70AYzXZvO0=;
  b=KLVp4wDzBYjKW0x0lm3LBQWD+7/pCpJPaMcg44ikKb4vQ4mLRD6GDWFm
   sjGIhU5UlL/kcsJ9sxpLAVRbly3AnLgCiQAxf45n2t15OeBa46DT0JCl6
   ifwBXAToT84gctQAkKQq6zr6xn/pYIFaSyZ3FvdTBXQmAtD7a/h6L7bgL
   Poe+ZwdG/Mo3QXNmXnPjaKPneTaSxkce1P7rEv9NBvFqxSm8BCKlKoL37
   OU09dtmKNJXEhFTab3qeBW+9UVG7q1xSlMozaqwu7vKUYcoiyK/2/oDtf
   xSdc6wL9yjWYx89q7VMDO0cSVpLN8Hsy6cxoOS7/eTf6dTwY+d7BtAXuD
   g==;
X-CSE-ConnectionGUID: Al1n0uFXR6iU0Bo1vN7bkg==
X-CSE-MsgGUID: qdfmHYCPSV6b4uZsFP8sgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29924997"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="29924997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 19:47:04 -0800
X-CSE-ConnectionGUID: l5goev/0QASn+AOycwOZzg==
X-CSE-MsgGUID: dmiN3I2oQNi4+gFw6oTIJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="88366034"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2024 19:47:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8AWx-000lZl-1v;
	Tue, 05 Nov 2024 03:46:59 +0000
Date: Tue, 5 Nov 2024 11:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Boris Brezillon <bbrezillon@kernel.org>,
	dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
	patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 3/3] iommu: Add a kdoc to iommu_unmap()
Message-ID: <202411051125.mlgeWlEm-lkp@intel.com>
References: <3-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_194710_127369_CC57FA49 
X-CRM114-Status: GOOD (  13.55  )
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

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8e929cb546ee42c9a61d24fae60605e9e3192354]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/iommu-io-pgtable-arm-Remove-split-on-unmap-behavior/20241105-014356
base:   8e929cb546ee42c9a61d24fae60605e9e3192354
patch link:    https://lore.kernel.org/r/3-v2-fd55d00a60b2%2Bc69-arm_no_split_jgg%40nvidia.com
patch subject: [PATCH v2 3/3] iommu: Add a kdoc to iommu_unmap()
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241105/202411051125.mlgeWlEm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051125.mlgeWlEm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051125.mlgeWlEm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommu.c:2605: warning: Function parameter or struct member 'size' not described in 'iommu_unmap'
>> drivers/iommu/iommu.c:2605: warning: Excess function parameter 'len' description in 'iommu_unmap'


vim +2605 drivers/iommu/iommu.c

add02cfdc9bc29 drivers/iommu/iommu.c Joerg Roedel    2017-08-23  2588  
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2589  /**
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2590   * iommu_unmap() - Remove mappings from a range of IOVA
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2591   * @domain: Domain to manipulate
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2592   * @iova: IO virtual address to start
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2593   * @len: Length of the range starting from @iova
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2594   *
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2595   * iommu_unmap() will remove a translation created by iommu_map(). It cannot
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2596   * subdivide a mapping created by iommu_map(), so it should be called with IOVA
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2597   * ranges that match what was passed to iommu_map(). The range can aggregate
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2598   * contiguous iommu_map() calls so long as no individual range is split.
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2599   *
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2600   * Returns: Number of bytes of IOVA unmapped. iova + res will be the point
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2601   * unmapping stopped.
6aa7e03e9dd8b5 drivers/iommu/iommu.c Jason Gunthorpe 2024-11-04  2602   */
add02cfdc9bc29 drivers/iommu/iommu.c Joerg Roedel    2017-08-23  2603  size_t iommu_unmap(struct iommu_domain *domain,
add02cfdc9bc29 drivers/iommu/iommu.c Joerg Roedel    2017-08-23  2604  		   unsigned long iova, size_t size)
add02cfdc9bc29 drivers/iommu/iommu.c Joerg Roedel    2017-08-23 @2605  {
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2606  	struct iommu_iotlb_gather iotlb_gather;
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2607  	size_t ret;
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2608  
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2609  	iommu_iotlb_gather_init(&iotlb_gather);
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2610  	ret = __iommu_unmap(domain, iova, size, &iotlb_gather);
aae4c8e27bd756 drivers/iommu/iommu.c Tom Murphy      2020-08-17  2611  	iommu_iotlb_sync(domain, &iotlb_gather);
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2612  
a7d20dc19d9ea7 drivers/iommu/iommu.c Will Deacon     2019-07-02  2613  	return ret;
add02cfdc9bc29 drivers/iommu/iommu.c Joerg Roedel    2017-08-23  2614  }
cefc53c7f49424 drivers/base/iommu.c  Joerg Roedel    2010-01-08  2615  EXPORT_SYMBOL_GPL(iommu_unmap);
1460432cb513f0 drivers/iommu/iommu.c Alex Williamson 2011-10-21  2616  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

