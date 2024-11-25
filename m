Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3318ED3B7D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 05:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXjj/rqkU4B/m0L+T3pcpEmQf9RvuZjLAT8hl7QuXw8=; b=anE7g8hJ4V94Ct0Q3pu9rIFMwx
	SMK+inVUXgkwnKjHU17SMjihyydHjyLCB74i4U5DiQoVdFtNQ9qdTablTO2IuzKG4m7ZMVS8Td9ow
	x/1ltv0OwTlCkaQoQE9Y4kuWyewwOBf0QQl2r0+aaEjps4JUw/8U/9SZBUxq5Hp6oVhgT7C3t5rj2
	qZ3+vkUEqa8FQo6GY919zi+emWzafppOReXVEQWD+tVA1fIk91vqyZQB+kWsUMBF0HBg1S2XkcokB
	9y1AZ8k9BMO1lfTMdHtbwiSB0QYCMmF12DqllNGpy+PCBp98+UfSAXv8Kdr/yvJ+vAfMXBG10Gd+e
	LlX/HeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFRJV-000000073z0-1Yex;
	Mon, 25 Nov 2024 05:07:09 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFRIX-000000073rH-3sQy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 05:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732511170; x=1764047170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NREGBayAwFFBU4tE1Ma2gDyzoVU71MdcWhe9JFquPAI=;
  b=IpZ6OlhARrE5jE77r5GgJsZ4x1zn5A/oIYKD+dTuqnBlSaiJV07Tl0Nv
   ATKCOdt8DSJ+oPWb0IhJHPX7jT1wSHm1AfmcR6UAH5I/sVssKJH4Ddbwu
   pOz5oZVbT36iGxIT7VFgbW3LFrXAl8WeDVPWIcdfP4F8+/vVc+4Ym2bPf
   LukCAxqgoKlE8XBsOaT653+qzBMBP4MoHsDOwmCHYlSJytSTq8Qv3rv3S
   cf3s4o7ZF9cvmLnI2ClhiqamK1fFPt+szsDejO0/3m4Onq85mpICc5csw
   7Pz+A5j4EZ2Y7HEbYEnGic1JE0OlKKDEeJ/Hbp51D+K9lGZyREsyon6Ck
   Q==;
X-CSE-ConnectionGUID: AUk+TxO6T+2xu7FNc3S7CA==
X-CSE-MsgGUID: cRqc/H5EQMW4i/5Am1/ueQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="36515038"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="36515038"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 21:06:07 -0800
X-CSE-ConnectionGUID: d/cc0nO9SLOOH97XqPNIkw==
X-CSE-MsgGUID: suWKtIxOTi+PfZR2YkgwOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96212099"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Nov 2024 21:06:00 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFRIL-0005uL-2Z;
	Mon, 25 Nov 2024 05:05:57 +0000
Date: Mon, 25 Nov 2024 13:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alistair Popple <apopple@nvidia.com>, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v3 11/25] mm: Allow compound zone device pages
Message-ID: <202411251251.Tjig4oaV-lkp@intel.com>
References: <f1a93b8a38e14e2ab279ece310175334e973b970.1732239628.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1a93b8a38e14e2ab279ece310175334e973b970.1732239628.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_210610_013888_AF06871B 
X-CRM114-Status: GOOD (  12.07  )
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

Hi Alistair,

kernel test robot noticed the following build errors:

[auto build test ERROR on 81983758430957d9a5cb3333fe324fd70cf63e7e]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/fuse-Fix-dax-truncate-punch_hole-fault-path/20241125-094004
base:   81983758430957d9a5cb3333fe324fd70cf63e7e
patch link:    https://lore.kernel.org/r/f1a93b8a38e14e2ab279ece310175334e973b970.1732239628.git-series.apopple%40nvidia.com
patch subject: [PATCH v3 11/25] mm: Allow compound zone device pages
config: powerpc-ebony_defconfig (https://download.01.org/0day-ci/archive/20241125/202411251251.Tjig4oaV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251251.Tjig4oaV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251251.Tjig4oaV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:32:
>> include/linux/memremap.h:164:3: error: call to undeclared function 'page_pgmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     164 |                 page_pgmap(page)->type == MEMORY_DEVICE_PRIVATE;
         |                 ^
>> include/linux/memremap.h:164:21: error: member reference type 'int' is not a pointer
     164 |                 page_pgmap(page)->type == MEMORY_DEVICE_PRIVATE;
         |                 ~~~~~~~~~~~~~~~~  ^
   include/linux/memremap.h:176:3: error: call to undeclared function 'page_pgmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     176 |                 page_pgmap(page)->type == MEMORY_DEVICE_PCI_P2PDMA;
         |                 ^
   include/linux/memremap.h:176:21: error: member reference type 'int' is not a pointer
     176 |                 page_pgmap(page)->type == MEMORY_DEVICE_PCI_P2PDMA;
         |                 ~~~~~~~~~~~~~~~~  ^
   include/linux/memremap.h:182:3: error: call to undeclared function 'page_pgmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     182 |                 page_pgmap(page)->type == MEMORY_DEVICE_COHERENT;
         |                 ^
   include/linux/memremap.h:182:21: error: member reference type 'int' is not a pointer
     182 |                 page_pgmap(page)->type == MEMORY_DEVICE_COHERENT;
         |                 ~~~~~~~~~~~~~~~~  ^
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   include/linux/mman.h:157:9: warning: division by zero is undefined [-Wdivision-by-zero]
     157 |                _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
     159 |                _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   4 warnings and 6 errors generated.
   make[3]: *** [scripts/Makefile.build:102: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/page_pgmap +164 include/linux/memremap.h

   159	
   160	static inline bool is_device_private_page(const struct page *page)
   161	{
   162		return IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
   163			is_zone_device_page(page) &&
 > 164			page_pgmap(page)->type == MEMORY_DEVICE_PRIVATE;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

