Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19D9C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 05:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8G2aY5sjB6hS79dBzmv3nLrVDBe7J/6IiIOIxegPv5I=; b=WdH3IQAFZzZzxNY8x44VVG1ISM
	2ydkesQ6uolUKOS2BCFKM9kCH5dHvVDA4ZhtNl6f5Bw6NRcpI4XDJQtIyPIPuF9jwyFaM6Mn4pFG4
	XGiEoS+Fhis4wpbnLiPOX2RWQb4Ke9KAxWipUd0+1vdkOplrbo2TRVUAHJpq4eB3EmYJSLcLouzlp
	AEMM6RsZy6TzlxR7ehgGjUoW4FmdLlDpDZEpUkRs+P1laSx43TEzbgj1s3wZ6/5VzMixdgMIQURUx
	MmizendS083/0VLY2m7ot2j+63KzoFrB3l0IB84aOIAOp9GuNR16iiBwwmYpu3bqMK6MabqMLlwkA
	GNwX5HAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq3Uz-0000000A1db-0RzJ;
	Thu, 06 Mar 2025 05:10:21 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq3TM-0000000A1TY-2I3H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 05:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741237721; x=1772773721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+viV11nQBG/pa4OYx4X5/r1x+AdDiOmvsrgtAtgFNcs=;
  b=FcFF3uXIjnFUSzyB6wGggWwcNzVNfWmve3vqRqEyKuQQ2tpdmPb6+UDu
   anj5L7OvdhBh7PD+58tYgX0csUuo+SUQt0DxaXONCS1ECcqROuSjDoMwg
   yde3oAi7cSJjM1KnIQ1Alt6+XgUrTNGwzXUkKh5Jim2R9QoNY0d6RVvAp
   rVnVN5Ye80win3X2eczuaR5HZQV1mouB+KUIpxhhUDeYXZ5P1vCr1NXFO
   8kTxkMSZqWodFfuILsY1rI57+TTyPAE5m8tCMcqaMRRKkSM6JsMsZMQ25
   xXhgL2JemIPqYYmzkmPb3Zy85PX0oQrjK7visTDkloVtISwFGSaA4AYLd
   w==;
X-CSE-ConnectionGUID: ZpwRTr3lRtanHadECkWznw==
X-CSE-MsgGUID: enHPOSFdSLyFwM+JLvYMTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53216195"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="53216195"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 21:08:39 -0800
X-CSE-ConnectionGUID: 3xZfakiyQbySmXPipKosRQ==
X-CSE-MsgGUID: oTR3TydRSpSUiPDMcps1RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119822472"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2025 21:08:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq3TD-000MYs-1d;
	Thu, 06 Mar 2025 05:08:31 +0000
Date: Thu, 6 Mar 2025 13:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/11] arm64/mm: Refactor __set_ptes() and
 __ptep_get_and_clear()
Message-ID: <202503061237.QurSXHSC-lkp@intel.com>
References: <20250304150444.3788920-5-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-5-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_210840_682386_9E9AABA6 
X-CRM114-Status: GOOD (  13.92  )
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

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc5 next-20250305]
[cannot apply to arm64/for-next/core akpm-mm/mm-everything arm-perf/for-next/perf]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/arm64-hugetlb-Cleanup-huge_pte-size-discovery-mechanisms/20250304-230647
base:   linus/master
patch link:    https://lore.kernel.org/r/20250304150444.3788920-5-ryan.roberts%40arm.com
patch subject: [PATCH v3 04/11] arm64/mm: Refactor __set_ptes() and __ptep_get_and_clear()
config: arm64-randconfig-001-20250305 (https://download.01.org/0day-ci/archive/20250306/202503061237.QurSXHSC-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061237.QurSXHSC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061237.QurSXHSC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:639:7: error: duplicate case value '536870912'
           case PUD_SIZE:
                ^
   include/asm-generic/pgtable-nopud.h:20:20: note: expanded from macro 'PUD_SIZE'
   #define PUD_SIZE        (1UL << PUD_SHIFT)
                           ^
   arch/arm64/include/asm/pgtable.h:636:7: note: previous case defined here
           case PMD_SIZE:
                ^
   include/asm-generic/pgtable-nopmd.h:22:20: note: expanded from macro 'PMD_SIZE'
   #define PMD_SIZE        (1UL << PMD_SHIFT)
                           ^
   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/arm64/include/asm/hardirq.h:17:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/arm64/include/asm/io.h:12:
   In file included from include/linux/pgtable.h:6:
   arch/arm64/include/asm/pgtable.h:1303:7: error: duplicate case value '536870912'
           case PUD_SIZE:
                ^
   include/asm-generic/pgtable-nopud.h:20:20: note: expanded from macro 'PUD_SIZE'
   #define PUD_SIZE        (1UL << PUD_SHIFT)
                           ^
   arch/arm64/include/asm/pgtable.h:1300:7: note: previous case defined here
           case PMD_SIZE:
                ^
   include/asm-generic/pgtable-nopmd.h:22:20: note: expanded from macro 'PMD_SIZE'
   #define PMD_SIZE        (1UL << PMD_SHIFT)
                           ^
   2 errors generated.
   make[3]: *** [scripts/Makefile.build:102: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=4064171735
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=4064171735
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=4064171735
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=4064171735
   make: Target 'prepare' not remade because of errors.


vim +/536870912 +639 arch/arm64/include/asm/pgtable.h

   626	
   627	static inline void set_ptes_anysz(struct mm_struct *mm, pte_t *ptep, pte_t pte,
   628					  unsigned int nr, unsigned long pgsize)
   629	{
   630		unsigned long stride = pgsize >> PAGE_SHIFT;
   631	
   632		switch (pgsize) {
   633		case PAGE_SIZE:
   634			page_table_check_ptes_set(mm, ptep, pte, nr);
   635			break;
   636		case PMD_SIZE:
   637			page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
   638			break;
 > 639		case PUD_SIZE:
   640			page_table_check_puds_set(mm, (pud_t *)ptep, pte_pud(pte), nr);
   641			break;
   642		default:
   643			VM_WARN_ON(1);
   644		}
   645	
   646		__sync_cache_and_tags(pte, nr * stride);
   647	
   648		for (;;) {
   649			__check_safe_pte_update(mm, ptep, pte);
   650			__set_pte(ptep, pte);
   651			if (--nr == 0)
   652				break;
   653			ptep++;
   654			pte = pte_advance_pfn(pte, stride);
   655		}
   656	}
   657	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

