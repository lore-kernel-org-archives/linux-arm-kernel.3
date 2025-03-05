Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9932FC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JyH2l8AJyXXGwC7HNKWIPV6u4cJc7+mq6nZIX3qxvQ=; b=2Heagc/CGH3iwf0xpcYT02xiF5
	/bF5s44mth7mHSr18tfL0ndEy5UxY4vNDVqZKLTJx0Yx59OnT5JuCqReBSgMmfadD/n/4+XIEO0j+
	HgST+6pv2nSYatDj/4YGwfymqyOyAfN1DdggovTE23bS/9vDFuRJbgHb0cFzZ7XX96NgFMZnoluLJ
	sYGFPm/bfgpZUZoI8Hk3A1umPjMZZEtu4HDw5A9hgNfCnXEswje1aZrJQjq027boAIxO0bhbzXeoN
	m6YAkjB+4Jd8BQK0PHsQRcSlxY1zMca+nXWH5pM1swoJMrNrVixP41bUtOkCv/q/hg4mWyoQrfeQo
	2baqNSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprDz-00000008bYI-2BwI;
	Wed, 05 Mar 2025 16:03:59 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tprAZ-00000008alm-4Bxb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 16:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741190428; x=1772726428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ejXxKQV90DW4dp+iOv5aIiKOpBAg3qGk/MHrDfxAI8=;
  b=iG1YfyR0ZkG04jTh7X3Apb8k/RTwcpNr1za+tnDKUGhotkRdUjt3kg/K
   T4If8os8Af1sSoSIdkZ+KLm3h+0qR/ANorMSII+CI2x45tCIHlYp4oZxJ
   /l4gU3oQyhDMMm+YCq2CwV6JRf2LbG2BKw9YYxkpqRJehEmNRi6DgXviM
   p9isYMGKsD/PRg52/Tt6PTzJ0kheA1sm5UvKBPx38Fio0AM/bWvMyHw0N
   hglGHHfir70S5zhWDds95FZWjPGfQAoK6Co9fp4irteJQwvb9CE1yQv0Y
   LjkxqmL8++C5WjOO596jKoZjgZ4i7FZn09IoJz6rDw2CsfbmaYq4erobZ
   A==;
X-CSE-ConnectionGUID: /3hD47LwTIK1f+RXmAFGCA==
X-CSE-MsgGUID: wnhFFZSWT+aVDn3iQEmCfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59707252"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59707252"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 08:00:27 -0800
X-CSE-ConnectionGUID: hjYKjvcmR5utfjW6V3Dwbg==
X-CSE-MsgGUID: kLV+FyYORG66FQT1ByJXBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118650255"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2025 08:00:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tprAS-000LBm-0Y;
	Wed, 05 Mar 2025 16:00:20 +0000
Date: Thu, 6 Mar 2025 00:00:01 +0800
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
Subject: Re: [PATCH v3 05/11] arm64: hugetlb: Use set_ptes_anysz() and
 ptep_get_and_clear_anysz()
Message-ID: <202503052315.vk7m958M-lkp@intel.com>
References: <20250304150444.3788920-6-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-6-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_080028_050707_03CA4B10 
X-CRM114-Status: GOOD (  15.01  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc5 next-20250305]
[cannot apply to arm64/for-next/core akpm-mm/mm-everything arm-perf/for-next/perf]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/arm64-hugetlb-Cleanup-huge_pte-size-discovery-mechanisms/20250304-230647
base:   linus/master
patch link:    https://lore.kernel.org/r/20250304150444.3788920-6-ryan.roberts%40arm.com
patch subject: [PATCH v3 05/11] arm64: hugetlb: Use set_ptes_anysz() and ptep_get_and_clear_anysz()
config: arm64-randconfig-003-20250305 (https://download.01.org/0day-ci/archive/20250305/202503052315.vk7m958M-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503052315.vk7m958M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503052315.vk7m958M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/mm/hugetlbpage.c:12:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/hugetlbpage.c:154:23: warning: parameter 'addr' set but not used [-Wunused-but-set-parameter]
     154 |                              unsigned long addr,
         |                                            ^
   3 warnings generated.


vim +/addr +154 arch/arm64/mm/hugetlbpage.c

bc5dfb4fd7bd471 Baolin Wang       2022-05-16  144  
d8bdcff2876424d Steve Capper      2017-08-22  145  /*
d8bdcff2876424d Steve Capper      2017-08-22  146   * Changing some bits of contiguous entries requires us to follow a
d8bdcff2876424d Steve Capper      2017-08-22  147   * Break-Before-Make approach, breaking the whole contiguous set
d8bdcff2876424d Steve Capper      2017-08-22  148   * before we can change any entries. See ARM DDI 0487A.k_iss10775,
d8bdcff2876424d Steve Capper      2017-08-22  149   * "Misprogramming of the Contiguous bit", page D4-1762.
d8bdcff2876424d Steve Capper      2017-08-22  150   *
d8bdcff2876424d Steve Capper      2017-08-22  151   * This helper performs the break step.
d8bdcff2876424d Steve Capper      2017-08-22  152   */
fb396bb459c1fa3 Anshuman Khandual 2022-05-10  153  static pte_t get_clear_contig(struct mm_struct *mm,
d8bdcff2876424d Steve Capper      2017-08-22 @154  			     unsigned long addr,
d8bdcff2876424d Steve Capper      2017-08-22  155  			     pte_t *ptep,
d8bdcff2876424d Steve Capper      2017-08-22  156  			     unsigned long pgsize,
d8bdcff2876424d Steve Capper      2017-08-22  157  			     unsigned long ncontig)
d8bdcff2876424d Steve Capper      2017-08-22  158  {
49c87f7677746f3 Ryan Roberts      2025-02-26  159  	pte_t pte, tmp_pte;
49c87f7677746f3 Ryan Roberts      2025-02-26  160  	bool present;
49c87f7677746f3 Ryan Roberts      2025-02-26  161  
66251d3eadf78e2 Ryan Roberts      2025-03-04  162  	pte = ptep_get_and_clear_anysz(mm, ptep, pgsize);
49c87f7677746f3 Ryan Roberts      2025-02-26  163  	present = pte_present(pte);
49c87f7677746f3 Ryan Roberts      2025-02-26  164  	while (--ncontig) {
49c87f7677746f3 Ryan Roberts      2025-02-26  165  		ptep++;
49c87f7677746f3 Ryan Roberts      2025-02-26  166  		addr += pgsize;
66251d3eadf78e2 Ryan Roberts      2025-03-04  167  		tmp_pte = ptep_get_and_clear_anysz(mm, ptep, pgsize);
49c87f7677746f3 Ryan Roberts      2025-02-26  168  		if (present) {
49c87f7677746f3 Ryan Roberts      2025-02-26  169  			if (pte_dirty(tmp_pte))
49c87f7677746f3 Ryan Roberts      2025-02-26  170  				pte = pte_mkdirty(pte);
49c87f7677746f3 Ryan Roberts      2025-02-26  171  			if (pte_young(tmp_pte))
49c87f7677746f3 Ryan Roberts      2025-02-26  172  				pte = pte_mkyoung(pte);
d8bdcff2876424d Steve Capper      2017-08-22  173  		}
49c87f7677746f3 Ryan Roberts      2025-02-26  174  	}
49c87f7677746f3 Ryan Roberts      2025-02-26  175  	return pte;
d8bdcff2876424d Steve Capper      2017-08-22  176  }
d8bdcff2876424d Steve Capper      2017-08-22  177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

