Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDD0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNz3UiIv3gIWIuN/JTymAQOAKEk3PB6rr5c8p6pqhYg=; b=1wsrNQnZqLo1DbmUOyKZcRuTzf
	+ce+7Jn7VK/d+6FRHxvICW7AyhOkI5wRK8RjM2iEFYSqnw4CbhXoHZnXMZYNnF539ou1yMbggDyg6
	Ve012z+ZvUYnSB40XhmZPVg4PbO+EV7vhdym3lGUFCJItHW3n0PrIfzrzY//17YkJoIy9fZPVviCE
	dhe2k/aa10BLUVhTNLWJ+bchp1ubnab5ykSVKR9TcobSpl2jVZDg25BjyMsuMQXsR+gPYsLAjYpSa
	elon1AuHNUnumnP2Ff3re+M+GXHvyNzifMn/gk/aRe7WRp/eYdfOjneJO5nsv/Jj1rSD+SZbYl+FO
	Jy0aByZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Zg-0000000BqtB-0gGV;
	Tue, 10 Dec 2024 14:50:56 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Vj-0000000BpxI-15ym;
	Tue, 10 Dec 2024 14:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733842011; x=1765378011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zCVNItat7KAJZV5fl9f36Lgf1b8uI6A148fvl6A9d1U=;
  b=jMBXDUUG6jvk5mjQ9QLt5TzA/RqQZHdQlx5/L81Ho9I+IQKG/Qevpjpy
   xj2CYHGrgx1TFG5m6Yr+TmgxkRWKLd8V3oYBSUUaOcUFfonaYVqwOylcj
   S5AIZ0atueN2mpd1GjIaecAxl79dVXMUalcFVZynmHRt/FlsTbeAu39BM
   V8pON+vIS9yiT4bNHZxqEM7PYQEGnOUh9Lj7RieSaN3M4LPS/04L5CjXO
   yq4mM0rSnVQOumMgBaho909SzrvE1DecmKqRqyR/x0NZl+jTg0D/AzP/0
   844fUkP/umWM1ARZu1w+wd1d/NT/XqXlU8dj/ZQC6DVcJuQDUqlPD0j9U
   A==;
X-CSE-ConnectionGUID: ZdCjH3S3Qk+iabMNQaBMMQ==
X-CSE-MsgGUID: lHfacFz2TaCr7ds7RMXtsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33918608"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33918608"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:46:51 -0800
X-CSE-ConnectionGUID: orNCXP5iSfORxIjovRQcxQ==
X-CSE-MsgGUID: EY2JQNdjRmSVxx2IfMJGSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95264822"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2024 06:46:44 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tL1VZ-0005fr-2R;
	Tue, 10 Dec 2024 14:46:41 +0000
Date: Tue, 10 Dec 2024 22:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>, akpm@linux-foundation.org,
	vbabka@suse.cz, yang@os.amperecomputing.com, riel@surriel.com,
	david@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, linux@armlinux.org.uk,
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, davem@davemloft.net,
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
	leitao@debian.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH mm-unstable 13/17] mm: sparc64: Introduce arch_mmap_hint()
Message-ID: <202412102215.fF34r4Uo-lkp@intel.com>
References: <20241210024119.2488608-14-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210024119.2488608-14-kaleshsingh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_064651_349625_479CBC45 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

Hi Kalesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/mm-Introduce-generic_mmap_hint/20241210-104424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241210024119.2488608-14-kaleshsingh%40google.com
patch subject: [PATCH mm-unstable 13/17] mm: sparc64: Introduce arch_mmap_hint()
config: sparc-randconfig-002-20241210 (https://download.01.org/0day-ci/archive/20241210/202412102215.fF34r4Uo-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412102215.fF34r4Uo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412102215.fF34r4Uo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sparc/kernel/sys_sparc_64.c: In function 'arch_get_unmapped_area':
>> arch/sparc/kernel/sys_sparc_64.c:135:13: warning: variable 'do_color_align' set but not used [-Wunused-but-set-variable]
     135 |         int do_color_align;
         |             ^~~~~~~~~~~~~~


vim +/do_color_align +135 arch/sparc/kernel/sys_sparc_64.c

aef9ae8eac4116 arch/sparc/kernel/sys_sparc_64.c Kalesh Singh      2024-12-09  131  
25d4054cc97484 arch/sparc/kernel/sys_sparc_64.c Mark Brown        2024-09-04  132  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  133  {
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  134  	unsigned long task_size = TASK_SIZE;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16 @135  	int do_color_align;
b80fa3cbb78c0f arch/sparc/kernel/sys_sparc_64.c Rick Edgecombe    2024-03-25  136  	struct vm_unmapped_area_info info = {};
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  137  	bool file_hugepage = false;
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  138  
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  139  	if (filp && is_file_hugepages(filp))
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  140  		file_hugepage = true;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  141  
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  142  	if (flags & MAP_FIXED) {
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  143  		/* We do not accept a shared mapping if it would violate
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  144  		 * cache aliasing constraints.
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  145  		 */
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  146  		if (!file_hugepage && (flags & MAP_SHARED) &&
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  147  		    ((addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1)))
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  148  			return -EINVAL;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  149  		return addr;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  150  	}
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  151  
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  152  	if (test_thread_flag(TIF_32BIT))
d61e16df940e02 arch/sparc64/kernel/sys_sparc.c  David S. Miller   2006-03-17  153  		task_size = STACK_TOP32;
a91690ddd05ab0 arch/sparc64/kernel/sys_sparc.c  David S. Miller   2006-03-17  154  	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  155  		return -ENOMEM;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  156  
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  157  	do_color_align = 0;
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  158  	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  159  		do_color_align = 1;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  160  
aef9ae8eac4116 arch/sparc/kernel/sys_sparc_64.c Kalesh Singh      2024-12-09  161  	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
aef9ae8eac4116 arch/sparc/kernel/sys_sparc_64.c Kalesh Singh      2024-12-09  162  	if (addr)
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  163  		return addr;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  164  
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  165  	info.length = len;
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  166  	info.low_limit = TASK_UNMAPPED_BASE;
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  167  	info.high_limit = min(task_size, VA_EXCLUDE_START);
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  168  	info.align_mask = get_align_mask(filp, flags);
a8d457b29b017a arch/sparc/kernel/sys_sparc_64.c Oscar Salvador    2024-10-07  169  	if (!file_hugepage)
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  170  		info.align_offset = pgoff << PAGE_SHIFT;
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  171  	addr = vm_unmapped_area(&info);
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  172  
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  173  	if ((addr & ~PAGE_MASK) && task_size > VA_EXCLUDE_END) {
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  174  		VM_BUG_ON(addr != -ENOMEM);
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  175  		info.low_limit = VA_EXCLUDE_END;
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  176  		info.high_limit = task_size;
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  177  		addr = vm_unmapped_area(&info);
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  178  	}
1363c3cd8603a9 arch/sparc64/kernel/sys_sparc.c  Wolfgang Wander   2005-06-21  179  
bb64f55019c7b0 arch/sparc/kernel/sys_sparc_64.c Michel Lespinasse 2012-12-11  180  	return addr;
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  181  }
^1da177e4c3f41 arch/sparc64/kernel/sys_sparc.c  Linus Torvalds    2005-04-16  182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

