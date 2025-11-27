Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2573D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2U9tRgChnHu5jzro4sa8R4cdAfuMXBkhEVB7e1x7f8=; b=mMPo2xwXxD0fa0TCoQSJCN/23t
	3fMuoBqEyTL0cV1J08NwvjXlct0rVVXpeh9U6TJfoYbZID8RNTz++povbR7Drmm4q/3QYDbZkY7jE
	2GOGEDkIV2GrZt5Hv3qjOmFH/GH7asW67m8g6YC9gRPTPQpQJFOpKbaZ5+lPjPyA8zhcS/2QsWgCW
	6gz6BL6AHMGjmcvXHBuitM+VAZJliBgPoqJVkw31F2MW9yGgDouFkx38ibYZ+9BhNSil150FL82Qg
	zcJR6+ZRz1Zldt2LMr1kFrGDNy6WlmE9pCce81wpN7HKC2L31dRVDGebXq/xonrQ/VmXaptbcRKQT
	31bjA9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZNd-0000000GOVs-0hz3;
	Thu, 27 Nov 2025 10:37:41 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZNV-0000000GOTf-2mBY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764239853; x=1795775853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f7hhmDtXODYt87CdFOKiBsu/XuhbqKkmbcAJ1l7uZgo=;
  b=R1NaUxFjHwWyOXBBN8j1nh135rVNe6/ESTq4kMp1MKJ60A0EKbDVUe+f
   mXCdW2vWsatSJi4XidWIn30O8LMHwJ2TGQvJzr72LxH9mRvQRJ1lNqJgK
   4pT0NeX/ZpoRBdQvzdIz30FmEAKcEpnULCovdivuzVWCqpbLAMECB0VNM
   y/4lYaGkJhdeqe4HoxxmF/KW0AzoSUuT1mYbhBHEEWVnQyhn+5pOd1XJr
   xbg2SsJFdZ5UOx6F+rgSYNR0yyfW4VP+4MBY5VmY17SkMHL/emLVchSLx
   rgIJ2F0IEqRvbe34Idqj9WVtEl1tLUufcopb6ibsGPWBoWknKSwlWQGgJ
   g==;
X-CSE-ConnectionGUID: abI6vNjZTqOeqiDxRZ4tGg==
X-CSE-MsgGUID: mfSVwerUSIuH9wAsmzjkfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70152346"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="70152346"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 02:37:31 -0800
X-CSE-ConnectionGUID: 4CJrhnLqSEWuE6kRo2ej5A==
X-CSE-MsgGUID: u7Oyl7xuTPaKP9+NYaIsRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193422643"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Nov 2025 02:37:25 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOZNL-000000004XD-1Ooj;
	Thu, 27 Nov 2025 10:37:23 +0000
Date: Thu, 27 Nov 2025 18:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Anirudh Raybharam <anirudh@anirudhrb.com>, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
	maz@kernel.org, tglx@linutronix.de, Arnd Bergmann <arnd@arndb.de>,
	akpm@linux-foundation.org, agordeev@linux.ibm.com,
	guoweikang.kernel@gmail.com, osandov@fb.com, bsz@amazon.de,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] irqchip/gic-v3: allocate one SGI for MSHV
Message-ID: <202511271745.71G6M2De-lkp@intel.com>
References: <20251125170124.2443340-3-anirudh@anirudhrb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125170124.2443340-3-anirudh@anirudhrb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_023733_810737_54161665 
X-CRM114-Status: GOOD (  11.49  )
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

Hi Anirudh,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251125]
[also build test ERROR on v6.18-rc7]
[cannot apply to arm64/for-next/core tip/irq/core arnd-asm-generic/master linus/master v6.18-rc7 v6.18-rc6 v6.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anirudh-Raybharam/arm64-hyperv-move-hyperv-detection-earlier-in-boot/20251126-011057
base:   next-20251125
patch link:    https://lore.kernel.org/r/20251125170124.2443340-3-anirudh%40anirudhrb.com
patch subject: [PATCH 2/3] irqchip/gic-v3: allocate one SGI for MSHV
config: arm-randconfig-002-20251127 (https://download.01.org/0day-ci/archive/20251127/202511271745.71G6M2De-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271745.71G6M2De-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271745.71G6M2De-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:37:10: fatal error: 'asm/mshyperv.h' file not found
      37 | #include <asm/mshyperv.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.


vim +37 drivers/irqchip/irq-gic-v3.c

    32	
    33	#include <asm/cputype.h>
    34	#include <asm/exception.h>
    35	#include <asm/smp_plat.h>
    36	#include <asm/virt.h>
  > 37	#include <asm/mshyperv.h>
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

