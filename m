Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC67D29FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tA3kKlIajVNI5auwh+ymgX4xSwVj315HtDR3DLoI84o=; b=Y0bzpE72U7E2wWHU6pNNkzyq66
	AFPfEAsqonk/Imxn9Ykz/cvxEe46HYrRZfVyWWqMCfm8HNlSIOQnq/Hm3CQs8p30z7Ycrcq6wOmZ8
	Me4jY1eSQDuk2qMLnAzcciphK4r+fXNnRggSkfvLikNrOwSwhqyRmHPwjA9vU2aREZfVXsYHEJdt8
	3gUPhYTjpOtoeb92lDOpJ0OagMkuqgFpXrEhcFAjRyzSyQgxCxJF7ylaHVcPqlLv3EwvERCjjAry9
	xIcvCz6r6t4Uq8mXGme2kWrlKNgVRaeivxywPXQWDLZ29iDDsg+5WM0QorQqakzAhOMibW8inM9XG
	ipvLbKlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bgm-00000002Laf-2CVg;
	Wed, 06 Nov 2024 08:46:56 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bdM-00000002Kue-2r1e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 08:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730882604; x=1762418604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2FaB9DZ+5bt0vHcem3FiA70mddNIj2sFcK506ZwMn/Q=;
  b=Uyg5pSBK8bmoNQVa8I2Aq6AHVt4MMJ/ZirgCghCVcKd1nhntHSTl/+AJ
   /jJJMZVauqBdoM0w3by3f3wIVM9PoVYaP3aztcY/mDSHo3f19OtBLKias
   KMXBAWjeUFWtYMkgSjBDELHlpMMe6506p9spGyXHXtB8rE5Ui4bRdZPu5
   iEn13GGBF9OZNjQW67sJIa5S6xlr5fM0kBFjc/DvmNElprNdzN7jAptT0
   yNEnyf2egCHaotF0w4Lhn9BevyoY5FSSn0LdSF7UnsS9W9JEsh+ZrGD1d
   woTw/9gVDMh2hKKaDBZ8uMxly3DSOyNn/SYN2tvgLXlF2dRa2HQHXS/4F
   Q==;
X-CSE-ConnectionGUID: JZFk7ijKTiaLuzK0vSHPwA==
X-CSE-MsgGUID: IzI0JPiJRzqJQC28SGNfZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30889099"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30889099"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 00:43:21 -0800
X-CSE-ConnectionGUID: FQSFjxl3TY2wyKbOXhKltw==
X-CSE-MsgGUID: IM4k9HfgRNW2rIV3li9lkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="115233886"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Nov 2024 00:43:18 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8bdD-000n6B-37;
	Wed, 06 Nov 2024 08:43:15 +0000
Date: Wed, 6 Nov 2024 16:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boris Brezillon <bbrezillon@kernel.org>,
	dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
	patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap
 behavior
Message-ID: <202411061634.3EtgZij8-lkp@intel.com>
References: <2-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_004324_756085_4B54E0A5 
X-CRM114-Status: GOOD (  11.89  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/iommu-io-pgtable-arm-Remove-split-on-unmap-behavior/20241106-021511
base:   8e929cb546ee42c9a61d24fae60605e9e3192354
patch link:    https://lore.kernel.org/r/2-v3-b3a5b5937f56%2B7bb-arm_no_split_jgg%40nvidia.com
patch subject: [PATCH v3 2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap behavior
config: arm-randconfig-004-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061634.3EtgZij8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061634.3EtgZij8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061634.3EtgZij8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/io-pgtable-arm-v7s.c:823:18: warning: variable 'loopnr' set but not used [-Wunused-but-set-variable]
     823 |         unsigned int i, loopnr = 0;
         |                         ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/loopnr +823 drivers/iommu/io-pgtable-arm-v7s.c

e5fc9753b1a831 Robin Murphy    2016-01-26  810  
e5fc9753b1a831 Robin Murphy    2016-01-26  811  static int __init arm_v7s_do_selftests(void)
e5fc9753b1a831 Robin Murphy    2016-01-26  812  {
e5fc9753b1a831 Robin Murphy    2016-01-26  813  	struct io_pgtable_ops *ops;
e5fc9753b1a831 Robin Murphy    2016-01-26  814  	struct io_pgtable_cfg cfg = {
e5fc9753b1a831 Robin Murphy    2016-01-26  815  		.tlb = &dummy_tlb_ops,
e5fc9753b1a831 Robin Murphy    2016-01-26  816  		.oas = 32,
e5fc9753b1a831 Robin Murphy    2016-01-26  817  		.ias = 32,
4f41845b340783 Will Deacon     2019-06-25  818  		.coherent_walk = true,
4f41845b340783 Will Deacon     2019-06-25  819  		.quirks = IO_PGTABLE_QUIRK_ARM_NS,
e5fc9753b1a831 Robin Murphy    2016-01-26  820  		.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M,
e5fc9753b1a831 Robin Murphy    2016-01-26  821  	};
76b8c2705cdd26 Jason Gunthorpe 2024-11-05  822  	unsigned int iova, size;
e5fc9753b1a831 Robin Murphy    2016-01-26 @823  	unsigned int i, loopnr = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

