Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171DBF417F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bGxNnu/NuRAUbSDNyoh/O1TV+Wc2lJj+jO4jIS/Jqs=; b=DQqC/cuaIO34JP4vnBTrKgMEbZ
	c7cJrKKNZFM6U4cyvCmcroz+JCqCRQMRDPcRoz1ECPsr/0Ez8Pr66VZ/Ew3ufveys3qxwyDRufqjG
	IRFxfmUUX5AEhR16QDDo4H7EsA+fNVmMVu7rqmNxRL6VBs0UlpcdiWX//XMgz91smTosaaZ8mzL3e
	A6UyEVlbt8ZrmC1vlYRESUr/6VvlIwJpU0RS4Z/HjtlTc9uZFT3H19NwfTwhs0jNgc3yX8g4gLwTh
	OrPHz7bBNw0kJBIel/Z0KTcwO7Y7u1ZgAuOllFXfJuInG7rGGXlJnPdH2sHvllpn2A0RPf0Hv3IwA
	bL+fNksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc2A-00000007WyX-0B9k;
	Mon, 09 Mar 2026 14:56:38 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzc27-00000007Wy6-3Y0m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 14:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773068196; x=1804604196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PoL/RgNXwrNphLvs7PMzEUNTz2yJHtGScrZkcIXw6Kk=;
  b=mY8dfJE6BLc/q2q+q3pa7HwDQLOPDcwx4rv3x4EeVpsbvcokzS6iLW/c
   1U7cNf31squlkWlG7iwoJEhMkjcpP09XV00O9dphK8/7ebGy7eBqwk5Mg
   PLCuIPa9OmFhOsE/j42gceprN/Xvw0A22FRGUjIz2/Dt4dCfuaw29kVzJ
   krPFZh58vcpzkOJZcXxkiaGaWl5Zva0QyjkC62pVEWryVoTL9MKTzkehW
   NfLukKNhDcehHlQKx9JAwde9Pdn8cXlDOpCiZxJjx2iZZ7kRGVLIKyWDj
   H8lkcCxFo6CGQQ9zEvAfZSsmq1iZtM7/XLqF9koo932y1NFiOkpdibZ8j
   g==;
X-CSE-ConnectionGUID: EX2LumVoQmGja9gGCtTYzQ==
X-CSE-MsgGUID: qcEogTANSrmbkv9aT86ayA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99563859"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="99563859"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 07:56:34 -0700
X-CSE-ConnectionGUID: NFt3wrsXQPKq6hWDp/kCeg==
X-CSE-MsgGUID: gLqp2eh/TBizXqUAxt8SBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224219446"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Mar 2026 07:56:30 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzc20-000000002sv-0s97;
	Mon, 09 Mar 2026 14:56:28 +0000
Date: Mon, 9 Mar 2026 15:55:54 +0100
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
Message-ID: <202603091555.ZRQIMCqJ-lkp@intel.com>
References: <20260309102625.2315725-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309102625.2315725-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_075635_898998_D84A708C 
X-CRM114-Status: GOOD (  16.27  )
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260309/202603091555.ZRQIMCqJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603091555.ZRQIMCqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603091555.ZRQIMCqJ-lkp@intel.com/

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
   make[3]: *** [scripts/Makefile.build:184: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
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

