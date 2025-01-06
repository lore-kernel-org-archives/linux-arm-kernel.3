Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FC5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 10:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixM0DazKG3KzmwqQrWR86TiKT9eE8NPJEKcRXqd3AUU=; b=axcxZAQm4aPSPvlD8TM5tFMNRX
	U3dHe4H22CStzrYT/FgyzHV3lHWQllm5QnwNyQ30Z4mz21z7h4Rac7jnCW7wRjH6Vsu/Zaua8FefR
	oQ4UT3Mf5ZP23h8kK5v49fjTEI7nD2fIVLjU3lWCXJuzalw8XMMzMP1ysNwDGLk/w0K8qEH5VUiIA
	6sRHYgHhuFNYwTgoSVvGYak6PlnfQtovOP+w/e4sy75gdJmtzg3BcAdubYvZ4P3V4svBeqrPQJRqY
	3gZPwHFbGPS8sVClZFCcXXLwqA+DtBA9ZoeQQ+xEkBDMCYPAZPQzBYdQo4kKOvOPNZ6CFz4zhocvC
	De+jfhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUk2y-00000000p4Y-3yzb;
	Mon, 06 Jan 2025 10:09:20 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUk1g-00000000ocH-1fsh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 10:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736158081; x=1767694081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sEL7NksqZgZXuAEm9a2vntcgzwajolbt9hhD8Ehbcv8=;
  b=CobwqmSdAsANWGWvS2XriQmGb0XLMu4CKljJn0bE9nxsDsQVHNLwK/kV
   Z5IUcMNOMNTvQKpBPR13nX9zU+ahnMihBIsc9Lu4IAeQ7fFIER6M11z+X
   /BgWXLQ0Tnc2iBAmJ3gu/ElxqFC6t5oYbETMo38Lr3Iz9xtPTnJkz4R11
   kWssikjEm33ZAFE5VRWcTzxLDr/iADmE+vtgYJ+wNyOOuflWNqQumAfFN
   nyzt4SGvj6lzfCmOm9aePxeMbKNJJ+9RTTkXxAjeI47gLpEO8/4XumGOE
   GJUNfQORFie2K5t0xBWLcWcVdBo4UZVWtau4z/5YS0eGJ5ssDGJnmGw7O
   g==;
X-CSE-ConnectionGUID: E8qS5SaESHWAU0pr7T69UQ==
X-CSE-MsgGUID: Qn2cO6HlTW2AGxcdKLWbDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36178041"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36178041"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 02:08:00 -0800
X-CSE-ConnectionGUID: r8cLw7L4SKCzwa2GNg8UxA==
X-CSE-MsgGUID: IFzx8dRQSGCblnOYPgMMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102893843"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jan 2025 02:07:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUk1X-000CTb-0m;
	Mon, 06 Jan 2025 10:07:51 +0000
Date: Mon, 6 Jan 2025 18:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, linux-kernel@vger.kernel.org, ioworker0@gmail.com,
	david@redhat.com, ryan.roberts@arm.com, zhengtangquan@oppo.com,
	ying.huang@intel.com, kasong@tencent.com, chrisl@kernel.org,
	baolin.wang@linux.alibaba.com, Barry Song <v-songbaohua@oppo.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shaoqin Huang <shahuang@redhat.com>, Gavin Shan <gshan@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
Message-ID: <202501061736.FoHcInHJ-lkp@intel.com>
References: <20250106031711.82855-3-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106031711.82855-3-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_020800_523445_3B528C52 
X-CRM114-Status: GOOD (  15.31  )
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

Hi Barry,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-set-folio-swapbacked-iff-folios-are-dirty-in-try_to_unmap_one/20250106-112638
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250106031711.82855-3-21cnbao%40gmail.com
patch subject: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
config: riscv-randconfig-001-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061736.FoHcInHJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061736.FoHcInHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061736.FoHcInHJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/rmap.c: In function 'set_tlb_ubc_flush_pending':
>> mm/rmap.c:685:9: error: too many arguments to function 'arch_tlbbatch_add_pending'
     685 |         arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/include/asm/pgtable.h:113,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/rmap.c:55:
   arch/riscv/include/asm/tlbflush.h:62:6: note: declared here
      62 | void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_tlbbatch_add_pending +685 mm/rmap.c

   663	
   664	/*
   665	 * Bits 0-14 of mm->tlb_flush_batched record pending generations.
   666	 * Bits 16-30 of mm->tlb_flush_batched bit record flushed generations.
   667	 */
   668	#define TLB_FLUSH_BATCH_FLUSHED_SHIFT	16
   669	#define TLB_FLUSH_BATCH_PENDING_MASK			\
   670		((1 << (TLB_FLUSH_BATCH_FLUSHED_SHIFT - 1)) - 1)
   671	#define TLB_FLUSH_BATCH_PENDING_LARGE			\
   672		(TLB_FLUSH_BATCH_PENDING_MASK / 2)
   673	
   674	static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
   675					      unsigned long uaddr,
   676					      unsigned long size)
   677	{
   678		struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
   679		int batch;
   680		bool writable = pte_dirty(pteval);
   681	
   682		if (!pte_accessible(mm, pteval))
   683			return;
   684	
 > 685		arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
   686		tlb_ubc->flush_required = true;
   687	
   688		/*
   689		 * Ensure compiler does not re-order the setting of tlb_flush_batched
   690		 * before the PTE is cleared.
   691		 */
   692		barrier();
   693		batch = atomic_read(&mm->tlb_flush_batched);
   694	retry:
   695		if ((batch & TLB_FLUSH_BATCH_PENDING_MASK) > TLB_FLUSH_BATCH_PENDING_LARGE) {
   696			/*
   697			 * Prevent `pending' from catching up with `flushed' because of
   698			 * overflow.  Reset `pending' and `flushed' to be 1 and 0 if
   699			 * `pending' becomes large.
   700			 */
   701			if (!atomic_try_cmpxchg(&mm->tlb_flush_batched, &batch, 1))
   702				goto retry;
   703		} else {
   704			atomic_inc(&mm->tlb_flush_batched);
   705		}
   706	
   707		/*
   708		 * If the PTE was dirty then it's best to assume it's writable. The
   709		 * caller must use try_to_unmap_flush_dirty() or try_to_unmap_flush()
   710		 * before the page is queued for IO.
   711		 */
   712		if (writable)
   713			tlb_ubc->writable = true;
   714	}
   715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

