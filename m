Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095E4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 03:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5eb8IWYDkedYq2wqpvbvt6UnIvHYw+BRl+T8m5JCr4=; b=QqAQsEea/wuE4+FYfJaleUYsB9
	MrMLOWquedyEB8cl49rblCxI1VnAUtMsWDAHUQ1hyPjo4rybrOUSkpcQhEC+aOTSN5BHhO1KFp13G
	0NvISodcDVwrShrq/f3qGLjD9aUH9qT/UqkHG9qDRDd+VT/ppajw8fjpk9ijNTfUvQeUfN8l27Mfy
	XOKvCwLcZcxmFPCtzFt3y6mZbjPxPEP1PAJDzz39gApV9emKfjqb80WG0ihz3/mDQKVbrQnzTllX1
	S+8OhO23C8l6+eSX/oZB+g1HyehvfMpDPrSwhi/oE0MZjhDWVZNK1O/WahbLmf3HSL27mnhYucVhx
	33rsa7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVNAm-000000074SB-306y;
	Wed, 08 Jan 2025 03:56:00 +0000
Received: from [198.175.65.13] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVN9X-000000074D3-0o7q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 03:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736308483; x=1767844483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4hsOMAZJ7j21xofFoIQjJ3dhFztVfnFxioSs/Xh+tLU=;
  b=Ns4TLp2EteAkrxIUMOEh2bcrEsXBe0xp8znRWPsDxU/wAqBkEQKCGaUY
   FylhYpyY1f34KcLUTDZe/dX/Iiw4ez0c9nS6lomoHV3RP1AIscygIT//j
   EN1KAuLkz8E8D+VZirIHC4v5KxHpka+JAABYgRZQtLhXPuU0+nlGCi5TI
   2N4MpigZ6QSaaU52WnJzAYHiVyFKtIsF/6yjGPR//TMV2UDynFifsUdIV
   oxLguIBUQFGwYfWaJVX2M8NDuKTir+seAcIL+DErJMkE3t121/D2v/Qcb
   Sxcdn4p8v3ANKW1inJIOuZA/9bvQPzSn6/HHxRsIX18qJGxwTkQ9gEFnZ
   g==;
X-CSE-ConnectionGUID: 3Hc3ur+ZRaW0hw5BKCKwsg==
X-CSE-MsgGUID: xYCf+F84SMaZxpLDJEnFdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47510440"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="47510440"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 19:54:41 -0800
X-CSE-ConnectionGUID: SJ5v1rFaTKWUWQYQjFva9w==
X-CSE-MsgGUID: YgoBDvlkT9i+Phi1I3SMyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="103034161"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jan 2025 19:54:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVN9M-000FaR-39;
	Wed, 08 Jan 2025 03:54:32 +0000
Date: Wed, 8 Jan 2025 11:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
	dan.j.williams@intel.com, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net, zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
	jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
	will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev
Subject: Re: [PATCH v5 15/25] huge_memory: Add vmf_insert_folio_pud()
Message-ID: <202501081149.VDLF8cwh-lkp@intel.com>
References: <5729b98a4f8edfec80edffddc36cac6dbaa8f4b9.1736221254.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5729b98a4f8edfec80edffddc36cac6dbaa8f4b9.1736221254.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_195443_273780_568AAADA 
X-CRM114-Status: GOOD (  11.86  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on e25c8d66f6786300b680866c0e0139981273feba]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/fuse-Fix-dax-truncate-punch_hole-fault-path/20250107-114726
base:   e25c8d66f6786300b680866c0e0139981273feba
patch link:    https://lore.kernel.org/r/5729b98a4f8edfec80edffddc36cac6dbaa8f4b9.1736221254.git-series.apopple%40nvidia.com
patch subject: [PATCH v5 15/25] huge_memory: Add vmf_insert_folio_pud()
config: i386-buildonly-randconfig-004-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081149.VDLF8cwh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081149.VDLF8cwh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081149.VDLF8cwh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/huge_memory.c:1561: warning: Function parameter or struct member 'folio' not described in 'vmf_insert_folio_pud'
>> mm/huge_memory.c:1561: warning: Excess function parameter 'pfn' description in 'vmf_insert_folio_pud'


vim +1561 mm/huge_memory.c

  1551	
  1552	/**
  1553	 * vmf_insert_folio_pud - insert a pud size folio mapped by a pud entry
  1554	 * @vmf: Structure describing the fault
  1555	 * @pfn: pfn of the page to insert
  1556	 * @write: whether it's a write fault
  1557	 *
  1558	 * Return: vm_fault_t value.
  1559	 */
  1560	vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio, bool write)
> 1561	{
  1562		struct vm_area_struct *vma = vmf->vma;
  1563		unsigned long addr = vmf->address & PUD_MASK;
  1564		pud_t *pud = vmf->pud;
  1565		struct mm_struct *mm = vma->vm_mm;
  1566		spinlock_t *ptl;
  1567	
  1568		if (addr < vma->vm_start || addr >= vma->vm_end)
  1569			return VM_FAULT_SIGBUS;
  1570	
  1571		if (WARN_ON_ONCE(folio_order(folio) != PUD_ORDER))
  1572			return VM_FAULT_SIGBUS;
  1573	
  1574		ptl = pud_lock(mm, pud);
  1575		if (pud_none(*vmf->pud)) {
  1576			folio_get(folio);
  1577			folio_add_file_rmap_pud(folio, &folio->page, vma);
  1578			add_mm_counter(mm, mm_counter_file(folio), HPAGE_PUD_NR);
  1579		}
  1580		insert_pfn_pud(vma, addr, vmf->pud, pfn_to_pfn_t(folio_pfn(folio)), write);
  1581		spin_unlock(ptl);
  1582	
  1583		return VM_FAULT_NOPAGE;
  1584	}
  1585	EXPORT_SYMBOL_GPL(vmf_insert_folio_pud);
  1586	#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
  1587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

