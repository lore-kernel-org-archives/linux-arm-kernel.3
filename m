Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDDEC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qj5zMVY6ybE+9w8uFeoIR1Juz6pAcyfWaacjP9KfLAA=; b=MNYMXuItLkgEQc3GWPgusv0QB2
	lRL37zZvc0GBrugneDuQZOJ9prbQPBGsxAR96aTDXGtrOVvJh62K1YE5g3mKkcWVwTijNETGl09eP
	1kIhYC7axVBSTHa1HnZm42fqn/kwqx1ECMVkTT2xtXzeEf7l88c/u+p850nHHRC6IlJTB0Rzr2M78
	ia/6Rl4nNv7EdZJnpgQg8UWnvM01NeZzKM8zaaxBLtFOre7+rPlHRA+g4X5V3tQsA+zxde6vPdzwJ
	8hio2SwlzE9hZDciZveVVmD2ZQ0j6RMnYGNTQ8YLB4KzOQEJ2CKFXqUS/OApPtKNq2cbnbNY2A+/q
	uHYyzi4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAsd-0000000AzUZ-0mxh;
	Thu, 06 Mar 2025 13:03:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9o9-0000000AqsW-1QxB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 11:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qj5zMVY6ybE+9w8uFeoIR1Juz6pAcyfWaacjP9KfLAA=; b=GZ9B3xBO9TEID215RvSn+RiV/l
	7bC7g5BoPYtdvacgvp1kzrXrBIda8YPZFU3t5ayPerT9UFfJW155vwbCvrnBXBWHO9dTsPoOKtFMV
	68gvN78VkkPpKt90ojRQFE2wRnCtJWI/fx0UrLlhQl9mb7HSe58bwe9aVP3ZKh8Ipj7d0I24PeXAk
	2IPOQjna+q6MVH3aiQ9WtXCaNKXfeq8mKaWJMiR/cLtQLMns4OX2/87mKOLXjyAYBjM5lCWWocBjI
	IHaRMfVtaBKitjDXU23YAeH3AVFdZspTRqIsfg1twT/xETR4zu+KGq9B4zENUUexSAIF+0Zdp9SPD
	QZT+ufBg==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9o5-00000008dka-31xO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:54:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 271491007;
	Thu,  6 Mar 2025 03:54:40 -0800 (PST)
Received: from [10.1.37.172] (XHFQ2J9959.cambridge.arm.com [10.1.37.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADE103F673;
	Thu,  6 Mar 2025 03:54:24 -0800 (PST)
Message-ID: <169f2d13-8374-48b2-8af1-db412f283e5b@arm.com>
Date: Thu, 6 Mar 2025 11:54:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] arm64/mm: Refactor __set_ptes() and
 __ptep_get_and_clear()
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304150444.3788920-5-ryan.roberts@arm.com>
 <202503061237.QurSXHSC-lkp@intel.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <202503061237.QurSXHSC-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_115430_000244_21D02A38 
X-CRM114-Status: GOOD (  22.56  )
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

On 06/03/2025 05:08, kernel test robot wrote:
> Hi Ryan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.14-rc5 next-20250305]
> [cannot apply to arm64/for-next/core akpm-mm/mm-everything arm-perf/for-next/perf]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/arm64-hugetlb-Cleanup-huge_pte-size-discovery-mechanisms/20250304-230647
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250304150444.3788920-5-ryan.roberts%40arm.com
> patch subject: [PATCH v3 04/11] arm64/mm: Refactor __set_ptes() and __ptep_get_and_clear()
> config: arm64-randconfig-001-20250305 (https://download.01.org/0day-ci/archive/20250306/202503061237.QurSXHSC-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061237.QurSXHSC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503061237.QurSXHSC-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/arm64/kernel/asm-offsets.c:12:
>    In file included from include/linux/ftrace.h:10:
>    In file included from include/linux/trace_recursion.h:5:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from arch/arm64/include/asm/hardirq.h:17:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:14:
>    In file included from arch/arm64/include/asm/io.h:12:
>    In file included from include/linux/pgtable.h:6:
>>> arch/arm64/include/asm/pgtable.h:639:7: error: duplicate case value '536870912'
>            case PUD_SIZE:
>                 ^
>    include/asm-generic/pgtable-nopud.h:20:20: note: expanded from macro 'PUD_SIZE'
>    #define PUD_SIZE        (1UL << PUD_SHIFT)
>                            ^
>    arch/arm64/include/asm/pgtable.h:636:7: note: previous case defined here
>            case PMD_SIZE:
>                 ^
>    include/asm-generic/pgtable-nopmd.h:22:20: note: expanded from macro 'PMD_SIZE'
>    #define PMD_SIZE        (1UL << PMD_SHIFT)
>                            ^
>    In file included from arch/arm64/kernel/asm-offsets.c:12:
>    In file included from include/linux/ftrace.h:10:
>    In file included from include/linux/trace_recursion.h:5:
>    In file included from include/linux/interrupt.h:11:
>    In file included from include/linux/hardirq.h:11:
>    In file included from arch/arm64/include/asm/hardirq.h:17:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:14:
>    In file included from arch/arm64/include/asm/io.h:12:
>    In file included from include/linux/pgtable.h:6:
>    arch/arm64/include/asm/pgtable.h:1303:7: error: duplicate case value '536870912'
>            case PUD_SIZE:
>                 ^
>    include/asm-generic/pgtable-nopud.h:20:20: note: expanded from macro 'PUD_SIZE'
>    #define PUD_SIZE        (1UL << PUD_SHIFT)
>                            ^
>    arch/arm64/include/asm/pgtable.h:1300:7: note: previous case defined here
>            case PMD_SIZE:
>                 ^
>    include/asm-generic/pgtable-nopmd.h:22:20: note: expanded from macro 'PMD_SIZE'
>    #define PMD_SIZE        (1UL << PMD_SHIFT)
>                            ^
>    2 errors generated.
>    make[3]: *** [scripts/Makefile.build:102: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=4064171735
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=4064171735
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=4064171735
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:251: __sub-make] Error 2 shuffle=4064171735
>    make: Target 'prepare' not remade because of errors.
> 
> 
> vim +/536870912 +639 arch/arm64/include/asm/pgtable.h
> 
>    626	
>    627	static inline void set_ptes_anysz(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>    628					  unsigned int nr, unsigned long pgsize)
>    629	{
>    630		unsigned long stride = pgsize >> PAGE_SHIFT;
>    631	
>    632		switch (pgsize) {
>    633		case PAGE_SIZE:
>    634			page_table_check_ptes_set(mm, ptep, pte, nr);
>    635			break;
>    636		case PMD_SIZE:
>    637			page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
>    638			break;
>  > 639		case PUD_SIZE:
>    640			page_table_check_puds_set(mm, (pud_t *)ptep, pte_pud(pte), nr);
>    641			break;

Looks like this needs to be wrapped in `#ifndef __PAGETABLE_PMD_FOLDED`. This
failing config folds the PMD so PMD_SIZE and PUD_SIZE are the same.

Given there are now 2 kernel robot reports, I'll respin the series next week,
giving time for any interim review comments.

Thanks,
Ryan


>    642		default:
>    643			VM_WARN_ON(1);
>    644		}
>    645	
>    646		__sync_cache_and_tags(pte, nr * stride);
>    647	
>    648		for (;;) {
>    649			__check_safe_pte_update(mm, ptep, pte);
>    650			__set_pte(ptep, pte);
>    651			if (--nr == 0)
>    652				break;
>    653			ptep++;
>    654			pte = pte_advance_pfn(pte, stride);
>    655		}
>    656	}
>    657	
> 


