Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C74C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tx2RU4mYzFpV71SR5xjVuK8naKNCoMEJ8PxcPvgudp4=; b=EORh7jtRbUdLqnOxxc1IdrJTeP
	KHQcCSlLTPvu8auxG1f3qrFYzjvfBwp/IcBCGco8Rqf5IVe122mJDeEeQchb1p5bgkXazaM8Lej2C
	xh5+eNr1h9k6/XuiHZkoq1XXQXLmjHZDQO220BsPu9O/Xy5kqhuus6SpJatlcSWdOEuepr5g7asGr
	Irhw4aAkW5JYk7R9fJ9E/1uOJUYgwImpkgmzEfoo9Ei+6IP3nGHKwc7c1zIlRExHyRQJh5mWvadGP
	o2azCYgwTOUipmpS+duuLpMTAMRP09rw1//9m1dc+QFA7SiRRzshrJ6y2TkVKJOfjs9uRPj5rd6i7
	RF2HzL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0ns-0000000BqyB-3JgL;
	Wed, 30 Apr 2025 06:20:20 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0lw-0000000Bqln-3gVv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 06:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745993901; x=1777529901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PYkZX74d10lvPGrseB5FE9s3+bTtnF0aDOcSfLFSv0w=;
  b=e9g9fz2rvJJQVwFQma6mHkmrz1PnzcuTnS6nDoFp1y/88OjIU5+9f7hR
   tmAllqCy6i9SHpyWP/68kE1fZwKfkxpGURLaOckwPL/RiqgieiyxiO5Xj
   Bvu9hdgP85uJytHPdguyWGBZ/3bkDEf/Ms2MYv38AmaNZstgk6vilisVu
   2jL6FOUWUrK0ML8IjhEq558T0cU8Qw6ztL1nBFSQo6/nwp5j1scIEh6qa
   okdS04iugaEUS10C7aW2BQfao00It+GYazsXrMbrpyLW2jdGliW5sT90J
   TTgPEVLvcgKqqKMSdSqIi3IMSzf1fK8yTo1owqFqD3C+paUEWS2PgjOZK
   A==;
X-CSE-ConnectionGUID: FKvDvKKpQmOIzWFscAGE7w==
X-CSE-MsgGUID: MPeV+4dqQRSlLenTZFn7Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47521362"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47521362"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 23:18:20 -0700
X-CSE-ConnectionGUID: JZDNPxd7Si6aYG0rC+r71w==
X-CSE-MsgGUID: v1JASB2zTtuddJoWKG34Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133929263"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2025 23:18:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA0lm-0003Dv-0B;
	Wed, 30 Apr 2025 06:18:10 +0000
Date: Wed, 30 Apr 2025 14:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
	anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
	ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
	ziy@nvidia.com, Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
Message-ID: <202504301306.AU2G1yvg-lkp@intel.com>
References: <20250429052336.18912-7-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429052336.18912-7-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_231821_021059_47DE81CA 
X-CRM114-Status: GOOD (  13.87  )
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

Hi Dev,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on arm64/for-next/core linus/master v6.15-rc4 next-20250429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dev-Jain/mm-Refactor-code-in-mprotect/20250429-133151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250429052336.18912-7-dev.jain%40arm.com
patch subject: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
config: arm64-randconfig-002-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301306.AU2G1yvg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301306.AU2G1yvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301306.AU2G1yvg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mprotect.c:46:15: warning: unused variable 'page' [-Wunused-variable]
      46 |         struct page *page;
         |                      ^~~~
   mm/mprotect.c:226:51: error: use of undeclared identifier 'folio'
     226 |                             can_change_ptes_writable(vma, addr, ptent, folio, 1))
         |                                                                        ^
   1 warning and 1 error generated.


vim +/page +46 mm/mprotect.c

36f881883c5794 Kirill A. Shutemov 2015-06-24  42  
695112a1385b39 Dev Jain           2025-04-29  43  bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
695112a1385b39 Dev Jain           2025-04-29  44  			      pte_t pte, struct folio *folio, unsigned int nr)
64fe24a3e05e5f David Hildenbrand  2022-06-14  45  {
64fe24a3e05e5f David Hildenbrand  2022-06-14 @46  	struct page *page;
64fe24a3e05e5f David Hildenbrand  2022-06-14  47  
7ea7e333842ed5 David Hildenbrand  2022-11-08  48  	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
7ea7e333842ed5 David Hildenbrand  2022-11-08  49  		return false;
64fe24a3e05e5f David Hildenbrand  2022-06-14  50  
7ea7e333842ed5 David Hildenbrand  2022-11-08  51  	/* Don't touch entries that are not even readable. */
d84887739d5c98 Nadav Amit         2022-11-08  52  	if (pte_protnone(pte))
64fe24a3e05e5f David Hildenbrand  2022-06-14  53  		return false;
64fe24a3e05e5f David Hildenbrand  2022-06-14  54  
64fe24a3e05e5f David Hildenbrand  2022-06-14  55  	/* Do we need write faults for softdirty tracking? */
f38ee285191813 Barry Song         2024-06-08  56  	if (pte_needs_soft_dirty_wp(vma, pte))
64fe24a3e05e5f David Hildenbrand  2022-06-14  57  		return false;
64fe24a3e05e5f David Hildenbrand  2022-06-14  58  
64fe24a3e05e5f David Hildenbrand  2022-06-14  59  	/* Do we need write faults for uffd-wp tracking? */
64fe24a3e05e5f David Hildenbrand  2022-06-14  60  	if (userfaultfd_pte_wp(vma, pte))
64fe24a3e05e5f David Hildenbrand  2022-06-14  61  		return false;
64fe24a3e05e5f David Hildenbrand  2022-06-14  62  
64fe24a3e05e5f David Hildenbrand  2022-06-14  63  	if (!(vma->vm_flags & VM_SHARED)) {
64fe24a3e05e5f David Hildenbrand  2022-06-14  64  		/*
7ea7e333842ed5 David Hildenbrand  2022-11-08  65  		 * Writable MAP_PRIVATE mapping: We can only special-case on
7ea7e333842ed5 David Hildenbrand  2022-11-08  66  		 * exclusive anonymous pages, because we know that our
7ea7e333842ed5 David Hildenbrand  2022-11-08  67  		 * write-fault handler similarly would map them writable without
7ea7e333842ed5 David Hildenbrand  2022-11-08  68  		 * any additional checks while holding the PT lock.
64fe24a3e05e5f David Hildenbrand  2022-06-14  69  		 */
695112a1385b39 Dev Jain           2025-04-29  70  		if (!folio)
695112a1385b39 Dev Jain           2025-04-29  71  			folio = vm_normal_folio(vma, addr, pte);
695112a1385b39 Dev Jain           2025-04-29  72  		return folio_test_anon(folio) && !folio_maybe_mapped_shared(folio);
64fe24a3e05e5f David Hildenbrand  2022-06-14  73  	}
64fe24a3e05e5f David Hildenbrand  2022-06-14  74  
fce831c92092ad David Hildenbrand  2024-05-22  75  	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
fce831c92092ad David Hildenbrand  2024-05-22  76  
7ea7e333842ed5 David Hildenbrand  2022-11-08  77  	/*
7ea7e333842ed5 David Hildenbrand  2022-11-08  78  	 * Writable MAP_SHARED mapping: "clean" might indicate that the FS still
7ea7e333842ed5 David Hildenbrand  2022-11-08  79  	 * needs a real write-fault for writenotify
7ea7e333842ed5 David Hildenbrand  2022-11-08  80  	 * (see vma_wants_writenotify()). If "dirty", the assumption is that the
7ea7e333842ed5 David Hildenbrand  2022-11-08  81  	 * FS was already notified and we can simply mark the PTE writable
7ea7e333842ed5 David Hildenbrand  2022-11-08  82  	 * just like the write-fault handler would do.
7ea7e333842ed5 David Hildenbrand  2022-11-08  83  	 */
d84887739d5c98 Nadav Amit         2022-11-08  84  	return pte_dirty(pte);
64fe24a3e05e5f David Hildenbrand  2022-06-14  85  }
64fe24a3e05e5f David Hildenbrand  2022-06-14  86  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

