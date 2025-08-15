Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E775CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 06:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18xvjs6MsSG3zYTjDVDZ0REL9/yF4M49s4IRbaQPYrY=; b=H7LdVgHfaHfk9lLuDgCZlP6FV7
	aHACGxmasX6V9uWb9cuRFmb/Rk8mUjCCHPbwn6ghpKTaiCU8KxTojynmLOQxQ9wRefpLYZ65957+f
	DAoRbkhRIHh8iXUK8YntlF9kDo2WophD5V7tw8MYeOyy0NmqnXRtrdPvBDt3mehBcegrH0vQWiE8u
	LFmgtyDoFbZqkCVsI7tPstctVQg9IBq3PnIf8wqzm5+wdCVFxakSh6NCtz4h3xgoxykO/DGGrSp+l
	K3aG7stU4Aj2GENq2T94xFNPUyHRTEWp64rePycqx1BBCJDoxy2aeYe/YUB+SeqdDcHOEKE8BhC26
	uslKZCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoGy-00000001eOr-2uOL;
	Fri, 15 Aug 2025 06:50:44 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoEO-00000001e60-0PAo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 06:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755240484; x=1786776484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JoZn79aBzPPrDDr0xHM5IQgwaowZCOkP1rtnzUXddyI=;
  b=hhpOe2b7OA14qslN6tTAin5LdQIBE7nFsAGXDEyh1vBrjaWUe/1LzOBQ
   je7fVBXgglS9jZ4r8+R8wYdqili9ZNpqwOynhHbTnPFcGxG502+oHWHR6
   MEUOY/orjIlIIqd38OW8VpSOoOyALtCiw4Tx2VSZ6hpY6JrqisTwpgG2E
   dmV/Y9kUxDcRi4zZbL5ynpCcaR05/BIHMZ0WUHTNGgn2VZ5rh7B4m2OUu
   lCv9o8OGrWWeXAOt3ohZ/UKp7hQWoJJSyCNOYyAMHKyhauZunsSv+zv2C
   0oQOMpsfO3f+YruBId09f1sypNov0KfnnyAyjevYtF4hzfyVeM6VQU2fd
   g==;
X-CSE-ConnectionGUID: WdbE6LJYSdOxsLl2KoV65A==
X-CSE-MsgGUID: lTZ1OxkER3y3F1owQcB3HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57714253"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57714253"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 23:48:01 -0700
X-CSE-ConnectionGUID: q5kEDUGMRySi7HKMbuH4gA==
X-CSE-MsgGUID: nDLocVRPTjaBabj3cOv3kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171083464"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 14 Aug 2025 23:47:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umoEG-000Bea-1u;
	Fri, 15 Aug 2025 06:47:56 +0000
Date: Fri, 15 Aug 2025 14:47:39 +0800
From: kernel test robot <lkp@intel.com>
To: Qinxin Xia <xiaqinxin@huawei.com>, will@kernel.org,
	robin.murphy@arm.com, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, xiaqinxin@huawei.com, yangyicong@huawei.com,
	wangzhou1@hisilicon.com, prime.zeng@hisilicon.com,
	xuwei5@huawei.com, fanghao11@huawei.com,
	jonathan.cameron@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH 1/2] iommu/debug: Add IOMMU page table dump debug facility
Message-ID: <202508151456.FmgCiCK4-lkp@intel.com>
References: <20250814093005.2040511-2-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814093005.2040511-2-xiaqinxin@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_234804_179781_ED3F2714 
X-CRM114-Status: GOOD (  11.09  )
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

Hi Qinxin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.17-rc1 next-20250814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qinxin-Xia/iommu-debug-Add-IOMMU-page-table-dump-debug-facility/20250814-173720
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250814093005.2040511-2-xiaqinxin%40huawei.com
patch subject: [PATCH 1/2] iommu/debug: Add IOMMU page table dump debug facility
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508151456.FmgCiCK4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151456.FmgCiCK4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151456.FmgCiCK4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/io_ptdump_debugfs.c:14:13: warning: no previous prototype for 'io_ptdump_debugfs_register' [-Wmissing-prototypes]
      14 | void __init io_ptdump_debugfs_register(const char *name)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/io_ptdump_debugfs_register +14 mm/io_ptdump_debugfs.c

    13	
  > 14	void __init io_ptdump_debugfs_register(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

