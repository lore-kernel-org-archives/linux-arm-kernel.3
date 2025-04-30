Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B43C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C54stjkP4fHiWQBeN/EhA0A+2uiXFXbC/RSjFs9mYXw=; b=tC/55sa27Yvx1kBlTEp7rx4eB+
	kktHXTaLpRYJVCsAbb9GD8Pi4kny1OZTHmUBSovf8hx/E+7rTa70CdvOa2kGsf/pG/iwXfSocOBH7
	Nf+uEglEvMrr1hWbkXiClmZC3/gYbKCkDsRY764RVBcytb1RiH3MZzQkLOM18coU8xlWVYIrUvJDI
	AhPPN4vNtV2C2Nv2kR6CVFgy+OLg+mEurVejJb0wYtGdbnu0XEnC6fu4ECXKUyI9LNJZNwKqI1W0K
	beXGj0wWzyVDPly4hUwLYry/YzwEHaR7RP/DCKLiz2dbhe45qRQfA5ene7Wb3cwylwxn1gLDdvhp+
	MY+W7Zpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0W0-0000000BoiN-04Hw;
	Wed, 30 Apr 2025 06:01:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0H2-0000000Bn7H-1a82
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 05:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C54stjkP4fHiWQBeN/EhA0A+2uiXFXbC/RSjFs9mYXw=; b=dfQGEg0BPPIUcbN2GFDuVUB4Ne
	XZu79RkbzHV5FZ+9jhM9TZpVm8joKvQZiGEZKwGvQNNCz+aiv3UcEucvZPvn5kvXedGN2dqpuSodY
	+ZwYRUFdvQwjvKkqp0KoK5j0fzbqVMhLiT4FIDOpff+alopzhfHBSA4TZrZbEhyM+3BfHxrJzkUfd
	6ND34S4knkuvNbeR078jGLe0RKPS8nsS4yBD+0sB9bYkFJiznJSBq3Tgw5SP/dGUQaBie7YaW4uYw
	/IpE67jbBzFPAJDC8M25/NBBWM8i4U/kZm6yNChv1cxcFIGCUDynu0UXwgxtPFf/x2gHSbzNP0OIc
	VCRuDi+g==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA0Gx-0000000DhgK-1VoK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745991980; x=1777527980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B59v+IvNsmnaorjIyh3dZ9NgCQZ2KF+vHvFz0KbpMgE=;
  b=PBK08U6siGprTZgR5DgzoaSuHouUGyIsmWeZ/rQzG7KxOwX9bHcCsXy+
   Oellzp/AKufeOehZEsJiH5NZ+sknOvNII23VL6wbGCq8SunFw9dIIfMkg
   Sgszm8S4qI0uVpveEHjgYJEg53nuriyrDvsuIvRo6/1H7uQOWcm5cERC1
   5DTVZU0z3ZqpqPvIzowEIqmDm4UDzQ41LmD19BZYGUtryONVAkbV6gGgm
   dfGTKqFxnekhQIw0X8TGr6iz1/4Ew8fUuOgKYJoD0ofU7gk+lrvc30S9V
   vNzbgc3qvKaBMwnqnumxs/QFOwXcmbdCc2wwz5GWwoYDeEG41iafhXUAh
   Q==;
X-CSE-ConnectionGUID: jCCJ9VGFQFCpp4NK0nlIRQ==
X-CSE-MsgGUID: 9MHv0WniRdiS9f2Mdue2MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73023721"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="73023721"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 22:46:16 -0700
X-CSE-ConnectionGUID: mv+A/y/RQrCyY35Lon7BEA==
X-CSE-MsgGUID: e4thOnXNQpWq2L2samo24A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133931527"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 22:46:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA0Gj-0003CH-0W;
	Wed, 30 Apr 2025 05:46:05 +0000
Date: Wed, 30 Apr 2025 13:45:46 +0800
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
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <202504301328.ltLGuTxD-lkp@intel.com>
References: <20250429052336.18912-4-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429052336.18912-4-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_064621_243760_4E212470 
X-CRM114-Status: GOOD (  14.31  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on arm64/for-next/core linus/master v6.15-rc4 next-20250429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dev-Jain/mm-Refactor-code-in-mprotect/20250429-133151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250429052336.18912-4-dev.jain%40arm.com
patch subject: [PATCH v2 3/7] mm: Add batched versions of ptep_modify_prot_start/commit
config: arm-randconfig-003-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301328.ltLGuTxD-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301328.ltLGuTxD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301328.ltLGuTxD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:31:
>> include/linux/pgtable.h:901:8: error: call to undeclared function 'ptep_modify_prot_start'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     901 |         pte = ptep_modify_prot_start(vma, addr, ptep);
         |               ^
>> include/linux/pgtable.h:921:3: error: call to undeclared function 'ptep_modify_prot_commit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     921 |                 ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
         |                 ^
>> include/linux/pgtable.h:1356:21: error: static declaration of 'ptep_modify_prot_start' follows non-static declaration
    1356 | static inline pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
         |                     ^
   include/linux/pgtable.h:901:8: note: previous implicit declaration is here
     901 |         pte = ptep_modify_prot_start(vma, addr, ptep);
         |               ^
   include/linux/pgtable.h:1367:20: error: static declaration of 'ptep_modify_prot_commit' follows non-static declaration
    1367 | static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
         |                    ^
   include/linux/pgtable.h:921:3: note: previous implicit declaration is here
     921 |                 ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
         |                 ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:


vim +/ptep_modify_prot_start +901 include/linux/pgtable.h

   893	
   894	/* See the comment for ptep_modify_prot_start */
   895	#ifndef modify_prot_start_ptes
   896	static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
   897			unsigned long addr, pte_t *ptep, unsigned int nr)
   898	{
   899		pte_t pte, tmp_pte;
   900	
 > 901		pte = ptep_modify_prot_start(vma, addr, ptep);
   902		while (--nr) {
   903			ptep++;
   904			addr += PAGE_SIZE;
   905			tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
   906			if (pte_dirty(tmp_pte))
   907				pte = pte_mkdirty(pte);
   908			if (pte_young(tmp_pte))
   909				pte = pte_mkyoung(pte);
   910		}
   911		return pte;
   912	}
   913	#endif
   914	
   915	/* See the comment for ptep_modify_prot_commit */
   916	#ifndef modify_prot_commit_ptes
   917	static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
   918			pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
   919	{
   920		for (;;) {
 > 921			ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
   922			if (--nr == 0)
   923				break;
   924			ptep++;
   925			addr += PAGE_SIZE;
   926			old_pte = pte_next_pfn(old_pte);
   927			pte = pte_next_pfn(pte);
   928		}
   929	}
   930	#endif
   931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

