Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2444FF417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XubodAVkj7PrSIyTr4R3wi/xhRAzOLjaemhOt4Py5Lk=; b=P2ycNjknFrMouuANvikx83TFqX
	HSqGhDWlxQNdWZNsktrtEukMeigOcPn60H193mKEI435dBfUo7IN1xEEpDb+kDEAu0vA2oAqc4DdT
	21IyVAbg09EW/V8wT0XLoYprWL/bLf1846d2QWGO62sZjJxkOEzcXZbjaOFf92C48q90zCgIsea1X
	GognPXf4GjXGt103wkSyQbkZr+7QNH+VLfxNlTRm0pYkPn3ZiyqBOMBD7kvU5ulQmZCgsCowBs28f
	sx5Es+upMvCIMY21X+SM7pKU6ubN80BwvyCnve+XWM1KcmEh2NpAsftZHhBMd6RX4Smmz21mK50lJ
	w63hgknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcnh-00000007daM-3sj8;
	Mon, 09 Mar 2026 15:45:45 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcnd-00000007dZ9-0L4o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 15:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773071141; x=1804607141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C0IERCaiDhJjwjRH+GzcWKFQytEH7/GbdqP3ydZUU+A=;
  b=bpUKGqMTgAUokgOGeZxdHHJjR1yO/jLxE1zKdjADJO2WDvGUohQkB3qS
   N5VDkqqa50a6oXXdQ7K1oeyElnuTpnxGo1GrL4l9d89rLhbFugn+wajvB
   5UbLO1+7IzfnmcWM5/jgBSOsA+z+MFg+Y+j8+oLJYQyfeknBX0OFsM+jT
   UI7K4PW7nB0iYxbvA2WPAdTQLacdFXtuhhL/tAty6ZjMBFnTqAnAE0PV8
   6NsJM+K51FVpgMrqob8/UJqljRIrfiNk0bXViYg5n4Ca/4cqCNA9KveIV
   mGgwVlDkMGL1sWOzvLdT9be+6CsyzlNnkGB2W1BNtewmHvh/SwQ9wH7Gg
   g==;
X-CSE-ConnectionGUID: +n4a4oKVSym++BFH5I8S3Q==
X-CSE-MsgGUID: xK78QqMqQhmwnQexQ9Qyzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84425148"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84425148"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 08:45:40 -0700
X-CSE-ConnectionGUID: C4FrXierQmyhlsz5uk+0cA==
X-CSE-MsgGUID: xknhvzjeTO2fAxTcp1vAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218939086"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Mar 2026 08:45:36 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzcnV-000000000Ry-19GY;
	Mon, 09 Mar 2026 15:45:33 +0000
Date: Mon, 9 Mar 2026 23:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v3 2/3] swiotlb: dma: its: Enforce host page-size
 alignment for shared buffers
Message-ID: <202603092323.myqT3tXw-lkp@intel.com>
References: <20260309102625.2315725-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309102625.2315725-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_084541_251340_F3E6B724 
X-CRM114-Status: GOOD (  15.95  )
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

Hi Aneesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on tip/irq/core arm/for-next arm/fixes kvmarm/next soc/for-next linus/master v7.0-rc3 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V-Arm/dma-direct-swiotlb-handle-swiotlb-alloc-free-outside-__dma_direct_alloc_pages/20260309-182834
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20260309102625.2315725-3-aneesh.kumar%40kernel.org
patch subject: [PATCH v3 2/3] swiotlb: dma: its: Enforce host page-size alignment for shared buffers
config: i386-randconfig-013-20260309 (https://download.01.org/0day-ci/archive/20260309/202603092323.myqT3tXw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603092323.myqT3tXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603092323.myqT3tXw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/processor-flags.h:6,
                    from arch/x86/include/asm/irqflags.h:5,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/mem_encrypt.h: In function 'mem_decrypt_granule_size':
>> include/linux/mem_encrypt.h:60:16: error: 'PAGE_SIZE' undeclared (first use in this function)
      60 |         return PAGE_SIZE;
         |                ^~~~~~~~~
   include/linux/mem_encrypt.h:60:16: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/mem_encrypt.h: In function 'mem_decrypt_align':
>> include/linux/mem_encrypt.h:66:16: error: implicit declaration of function 'ALIGN' [-Wimplicit-function-declaration]
      66 |         return ALIGN(size, mem_decrypt_granule_size());
         |                ^~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=4157930943
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2 shuffle=4157930943
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=4157930943
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=4157930943
   make: Target 'prepare' not remade because of errors.


vim +/PAGE_SIZE +60 include/linux/mem_encrypt.h

    56	
    57	#ifndef mem_decrypt_granule_size
    58	static inline size_t mem_decrypt_granule_size(void)
    59	{
  > 60		return PAGE_SIZE;
    61	}
    62	#endif
    63	
    64	static inline size_t mem_decrypt_align(size_t size)
    65	{
  > 66		return ALIGN(size, mem_decrypt_granule_size());
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

