Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D09E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H52Bq6kMVTE4www0lRo1ypjhW2GCHbOkO7runOpgyW8=; b=GyytUzJTduO0hK6WOgJWl9lLA7
	o+Mbd9y0HMcuKmWpYo7EZdUQoSuHoja63M29DPSz5LRRTlTGjO9x+TjhKdTihWwqEuSeUp0Uj9/e0
	keSjnBULFIViM8uO/1rH6laT/NaHLzd96Pqeezd9uKvRSllUGUmJr/3fOEaxUxPmA/AN3AW/dTk5P
	MAmHATp8nDTc0q3CfeSwoWikcn3zxGgSBRNL7SpQZHWr3NkisrEyzuSIyJkiEb02XSaIGkP1JzCF/
	xYg/GDIxtITrr5GTfJbNfM74fsdFga+mGFCXILX9/BzxDk9OhgRnexeSfYfHcyuDe5IWdpFIWEyWo
	jh06ZNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUiPf-00000000Uw1-1hnC;
	Mon, 06 Jan 2025 08:24:39 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUiOU-00000000UpQ-0eT8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 08:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736151806; x=1767687806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qbh8stjkoKOoPPH9RsjjUGRjx6DS+Qtuv/u29rQsVzA=;
  b=QMhHEk/+Ga8Y/SdzeQoE/daRKD9xxojKTPg6J++RDXUax/Z59pz19CYn
   FsC+DcWswcmk2ua8Ja2UkjPXOvbR2vgQ2nfE5AtWZlMev3QPcOq941Pxj
   EkH4iXevJeYfjx84o5tGipUYibLUbJDNv4MrqomoANM9QzXNG6vvBBRw9
   Niy7TCcxvCnKgY/U5eEuhEs0ViQPR2u0kVE4DtkMWQtGODZy9MtJ5FLN5
   Ek6ez6XoJw0+YjL8WQj7W9JXmqSp7OSHOJKdMxavrd7mozH1oOTZox9lQ
   QKwJLlWYfmaHHPEMS4tExexvV/rJe6El/brYuOnq2gNH5zZW3CkQbct1m
   Q==;
X-CSE-ConnectionGUID: E3khSPDxS7+E3Rc1P4qYPg==
X-CSE-MsgGUID: /O3SjYC7To+ubWlaBJEa7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36170378"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36170378"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 00:23:20 -0800
X-CSE-ConnectionGUID: ddA8u+WbRImU6byF4QhJSA==
X-CSE-MsgGUID: rQt2dOlFQfWP2aIwx4Tt5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133296706"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jan 2025 00:23:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUiOD-000CNn-0p;
	Mon, 06 Jan 2025 08:23:09 +0000
Date: Mon, 6 Jan 2025 16:22:37 +0800
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
Message-ID: <202501061535.zx9E486H-lkp@intel.com>
References: <20250106031711.82855-3-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106031711.82855-3-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_002326_232119_70BFE7AE 
X-CRM114-Status: GOOD (  12.14  )
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
config: i386-buildonly-randconfig-002-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061535.zx9E486H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061535.zx9E486H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061535.zx9E486H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
>> arch/x86/include/asm/tlbflush.h:283:46: error: unknown type name 'unsignd'; did you mean 'unsigned'?
     283 |                                              unsignd long size)
         |                                              ^~~~~~~
         |                                              unsigned
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=998720002
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=998720002
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=998720002
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=998720002
   make: Target 'prepare' not remade because of errors.


vim +283 arch/x86/include/asm/tlbflush.h

   279	
   280	static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
   281						     struct mm_struct *mm,
   282						     unsigned long uaddr,
 > 283						     unsignd long size)
   284	{
   285		inc_mm_tlb_gen(mm);
   286		cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
   287		mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

