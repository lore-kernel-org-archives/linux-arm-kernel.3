Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E8BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dk1RMo53r9ASYI5n0vhHKP6XA98IE9bXr2M4SGqqujk=; b=bwTiwp08fNKdw+kRaX8cLdfWAi
	u47PqJ+5XCg6Vir+66wqaYC7kd4MD3PWVXyHUNjmtJfQmDrlUcSSljrVe2VijqhBYKEiWg4ofjYL2
	lnRSgORWkPJ7lXWV0GyOgHt/vMK94uj07gjcX8u3HY01fQ+t9OmVpmC/F9Vj7v+0+FSbh2OOocbpB
	HPqa+8xDtgoKih6cXkvpmwmmcaG03cnpMeodPws5RSxTSqf9bhYmSC/Pjp+IHlLsvvkNv/4DUKuDi
	NDUt52mILOsyI2eSs/lT4TcGb+1FsDf48SJHww9fhVrxsmP7cVU9N7w/trH3Hn4NR0eeiBudNmhOV
	xcrKDrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzam-0000000BSpV-2wLH;
	Tue, 10 Dec 2024 12:43:56 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzZf-0000000BSgS-0hgX;
	Tue, 10 Dec 2024 12:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733834568; x=1765370568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2XWkD/yfjEhuZbsTfBejcrrLVZU1NcZkJQDTuM2rIMc=;
  b=MAiXvQmH/7vMSA73y1A/67vTMtxx7SOlSsI8vsDix8xVMEsw8N7gvFND
   WjJg6uA6/imuhK1bb3kDoCcZe0roxwUosjSdh9OhdJCUCBCa4XX0BKGkS
   It2OWPaoiVGO9CFZh8s0poUf21Yy2EuJqXdPYTlhCgvrJfzDkebiqmXmM
   FyNzRtbVIqDOI8zyr+YEXs69HkgqaJF2rvRBhVl4KKb8StCqwke/yXLJQ
   gtiN4SwIwuG42hwucfyNdVHTXRXj4js/CChYPMmc0FjIvjw1XoPkgTGQT
   OlR8S/BThz5Nt7uZ3iGftU7n1tOIWcGKhHSIhaVOPe7vcDBx0LtGEiExD
   g==;
X-CSE-ConnectionGUID: dX1sc1xZRxqap2m4CJif1g==
X-CSE-MsgGUID: MbLLeeNEQ1+nE4TPReDukw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45557335"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45557335"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:42:45 -0800
X-CSE-ConnectionGUID: PNJK2U7TRI6GrhJMzjBjFw==
X-CSE-MsgGUID: 1gEgitiCTumWExA1EmlaFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95741297"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Dec 2024 04:42:38 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKzZT-0005Xl-2l;
	Tue, 10 Dec 2024 12:42:35 +0000
Date: Tue, 10 Dec 2024 20:41:53 +0800
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
Subject: Re: [PATCH mm-unstable 11/17] mm: sh: Introduce arch_mmap_hint()
Message-ID: <202412102044.uIAN0clk-lkp@intel.com>
References: <20241210024119.2488608-12-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210024119.2488608-12-kaleshsingh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_044247_247937_7AA44B42 
X-CRM114-Status: UNSURE (   9.73  )
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
patch link:    https://lore.kernel.org/r/20241210024119.2488608-12-kaleshsingh%40google.com
patch subject: [PATCH mm-unstable 11/17] mm: sh: Introduce arch_mmap_hint()
config: sh-randconfig-001-20241210 (https://download.01.org/0day-ci/archive/20241210/202412102044.uIAN0clk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412102044.uIAN0clk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412102044.uIAN0clk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sh/mm/mmap.c: In function 'arch_get_unmapped_area':
>> arch/sh/mm/mmap.c:79:32: warning: unused variable 'vma' [-Wunused-variable]
      79 |         struct vm_area_struct *vma;
         |                                ^~~
>> arch/sh/mm/mmap.c:78:27: warning: unused variable 'mm' [-Wunused-variable]
      78 |         struct mm_struct *mm = current->mm;
         |                           ^~
   arch/sh/mm/mmap.c: In function 'arch_get_unmapped_area_topdown':
   arch/sh/mm/mmap.c:117:32: warning: unused variable 'vma' [-Wunused-variable]
     117 |         struct vm_area_struct *vma;
         |                                ^~~


vim +/vma +79 arch/sh/mm/mmap.c

2261b9c7c2357a0 Kalesh Singh      2024-12-09   73  
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   74  unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
25d4054cc97484f Mark Brown        2024-09-04   75  	unsigned long len, unsigned long pgoff, unsigned long flags,
25d4054cc97484f Mark Brown        2024-09-04   76  	vm_flags_t vm_flags)
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   77  {
4a4a9be3ebdbf17 Paul Mundt        2008-11-12  @78  	struct mm_struct *mm = current->mm;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12  @79  	struct vm_area_struct *vma;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   80  	int do_colour_align;
b80fa3cbb78c0fb Rick Edgecombe    2024-03-25   81  	struct vm_unmapped_area_info info = {};
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   82  
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   83  	if (flags & MAP_FIXED) {
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   84  		/* We do not accept a shared mapping if it would violate
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   85  		 * cache aliasing constraints.
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   86  		 */
e77414e0aad6a1b Al Viro           2009-12-05   87  		if ((flags & MAP_SHARED) &&
e77414e0aad6a1b Al Viro           2009-12-05   88  		    ((addr - (pgoff << PAGE_SHIFT)) & shm_align_mask))
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   89  			return -EINVAL;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   90  		return addr;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   91  	}
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   92  
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   93  	if (unlikely(len > TASK_SIZE))
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   94  		return -ENOMEM;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   95  
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   96  	do_colour_align = 0;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   97  	if (filp || (flags & MAP_SHARED))
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   98  		do_colour_align = 1;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12   99  
2261b9c7c2357a0 Kalesh Singh      2024-12-09  100  	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
2261b9c7c2357a0 Kalesh Singh      2024-12-09  101  	if (addr)
4a4a9be3ebdbf17 Paul Mundt        2008-11-12  102  		return addr;
4a4a9be3ebdbf17 Paul Mundt        2008-11-12  103  
b4265f12340f809 Michel Lespinasse 2012-12-11  104  	info.length = len;
b4265f12340f809 Michel Lespinasse 2012-12-11  105  	info.low_limit = TASK_UNMAPPED_BASE;
b4265f12340f809 Michel Lespinasse 2012-12-11  106  	info.high_limit = TASK_SIZE;
b4265f12340f809 Michel Lespinasse 2012-12-11  107  	info.align_mask = do_colour_align ? (PAGE_MASK & shm_align_mask) : 0;
b4265f12340f809 Michel Lespinasse 2012-12-11  108  	info.align_offset = pgoff << PAGE_SHIFT;
b4265f12340f809 Michel Lespinasse 2012-12-11  109  	return vm_unmapped_area(&info);
4a4a9be3ebdbf17 Paul Mundt        2008-11-12  110  }
ee1acbfabd5270b Paul Mundt        2009-05-07  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

