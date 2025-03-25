Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B915C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqlKFHLR2AbwlK7Zxx+QnZ1XZ5ut/RN+Zf86YSGH6gQ=; b=HlLs9ACOsqhcfpw6NoHeW0CmDN
	gkoM3lJA0mFrlOCteT6coW7twOEdJZXGMv/ruPZuywcBLICbJlTO0ioOB9fnUtrutLvslTFbDSUzV
	kP7fyeIGML6NQJfUaIFYOiPfC+OQJW1MKDQNJJt+tSBE5PFAcxjzarOPcsLVr4fWhDPzUKvOoR9qe
	rHWDtJhi3a0dkC421VplchMr0peDn/nN+gmk0iucQF/8lERwhx8+hJhKB33edY+1uv00RFbdrDTh8
	zuqpmqernGGzVPDGrCR/m8dWWdcCRDn1SFKXc1LMXaYEaCzCYU1FarS5f7E7EYHIvMCNOs6zZeXw8
	gYMFrfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3gf-00000005v8E-3XNY;
	Tue, 25 Mar 2025 12:47:21 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Wa-00000005qlQ-21Nt;
	Tue, 25 Mar 2025 12:36:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC29E441A0;
	Tue, 25 Mar 2025 12:36:44 +0000 (UTC)
Message-ID: <3a7a92e9-8106-4068-915d-beab62308484@ghiti.fr>
Date: Tue, 25 Mar 2025 13:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <1b0d0513-9d18-4603-91e9-20af36334145@csgroup.eu>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <1b0d0513-9d18-4603-91e9-20af36334145@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepheevhfevteehhefhueekiedtheeuvdfgieetteetudffgeegieegieeitdevgeelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihhnfhhrrgguvggrugdrohhrghenucfkphepfedurdefvddrkedurddukeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepfedurdefvddrkedurddukeejpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhihrghnrdhrohgsv
 ghrthhssegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_053656_669874_67E786F8 
X-CRM114-Status: GOOD (  28.36  )
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

Hi Christophe,

On 21/03/2025 18:24, Christophe Leroy wrote:
>
>
> Le 21/03/2025 à 14:06, Alexandre Ghiti a écrit :
>> This patchset intends to merge the contiguous ptes hugetlbfs 
>> implementation
>> of arm64 and riscv.
>
> Can we also add powerpc in the dance ?
>
> powerpc also use contiguous PTEs allthough there is not (yet) a 
> special name for it:
> - b250c8c08c79 powerpc/8xx: Manage 512k huge pages as standard pages
> - e47168f3d1b1 powerpc/8xx: Support 16k hugepages with 4k pages
>
> powerpc also use configuous PMDs/PUDs for larger hugepages:
> - 57fb15c32f4f ("powerpc/64s: use contiguous PMD/PUD instead of HUGEPD")
> - 7c44202e3609 ("powerpc/e500: use contiguous PMD instead of hugepd")
> - 0549e7666373 ("powerpc/8xx: rework support for 8M pages using 
> contiguous PTE entries")


So I have been looking at the powerpc hugetlb implementation and I have 
to admit that I'm struggling to find similarities with how arm64 and 
riscv deal with contiguous pte mappings.

I think the 2 main characteristics of contpte (arm64) and svnapot 
(riscv) are the break-before-make requirement and the HW A/D update on 
only a single pte. Those make the handling of hugetlb pages very similar 
between arm64 and riscv.

But I may have missed something, the powerpc hugetlb implementation is 
quite "scattered" because of the radix/hash page table and 32/64 bit.

Thanks,

Alex


>
> Christophe
>
>>
>> Both arm64 and riscv support the use of contiguous ptes to map pages 
>> that
>> are larger than the default page table size, respectively called contpte
>> and svnapot.
>>
>> The riscv implementation differs from the arm64's in that the LSBs of 
>> the
>> pfn of a svnapot pte are used to store the size of the mapping, allowing
>> for future sizes to be added (for now only 64KB is supported). That's an
>> issue for the core mm code which expects to find the *real* pfn a pte 
>> points
>> to. Patch 1 fixes that by always returning svnapot ptes with the real 
>> pfn
>> and restores the size of the mapping when it is written to a page table.
>>
>> The following patches are just merges of the 2 different implementations
>> that currently exist in arm64 and riscv which are very similar. It paves
>> the way to the reuse of the recent contpte THP work by Ryan [1] to avoid
>> reimplementing the same in riscv.
>>
>> This patchset was tested by running the libhugetlbfs testsuite with 64KB
>> and 2MB pages on both architectures (on a 4KB base page size arm64 
>> kernel).
>>
>> [1] 
>> https://lore.kernel.org/linux-arm-kernel/20240215103205.2607016-1-ryan.roberts@arm.com/
>>
>> v4: 
>> https://lore.kernel.org/linux-riscv/20250127093530.19548-1-alexghiti@rivosinc.com/
>> v3: 
>> https://lore.kernel.org/all/20240802151430.99114-1-alexghiti@rivosinc.com/
>> v2: 
>> https://lore.kernel.org/linux-riscv/20240508113419.18620-1-alexghiti@rivosinc.com/
>> v1: 
>> https://lore.kernel.org/linux-riscv/20240301091455.246686-1-alexghiti@rivosinc.com/
>>
>> Changes in v5:
>>    - Fix "int i" unused variable in patch 2 (as reported by PW)
>>    - Fix !svnapot build
>>    - Fix arch_make_huge_pte() which returned a real napot pte
>>    - Make __ptep_get(), ptep_get_and_clear() and __set_ptes() napot 
>> aware to
>>      avoid leaking real napot pfns to core mm
>>    - Fix arch_contpte_get_num_contig() that used to always try to get 
>> the
>>      mapping size from the ptep, which does not work if the ptep 
>> comes the core mm
>>    - Rebase on top of 6.14-rc7 + fix for
>>      huge_ptep_get_and_clear()/huge_pte_clear()
>> https://lore.kernel.org/linux-riscv/20250317072551.572169-1-alexghiti@rivosinc.com/
>>
>> Changes in v4:
>>    - Rebase on top of 6.13
>>
>> Changes in v3:
>>    - Split set_ptes and ptep_get into internal and external API (Ryan)
>>    - Rename ARCH_HAS_CONTPTE into ARCH_WANT_GENERAL_HUGETLB_CONTPTE 
>> so that
>>      we split hugetlb functions from contpte functions (actually 
>> riscv contpte
>>      functions to support THP will come into another series) (Ryan)
>>    - Rebase on top of 6.11-rc1
>>
>> Changes in v2:
>>    - Rebase on top of 6.9-rc3
>>
>> Alexandre Ghiti (9):
>>    riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
>>    riscv: Restore the pfn in a NAPOT pte when manipulated by core mm 
>> code
>>    mm: Use common huge_ptep_get() function for riscv/arm64
>>    mm: Use common set_huge_pte_at() function for riscv/arm64
>>    mm: Use common huge_pte_clear() function for riscv/arm64
>>    mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
>>    mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
>>    mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
>>    mm: Use common huge_ptep_clear_flush() function for riscv/arm64
>>
>>   arch/arm64/Kconfig                  |   1 +
>>   arch/arm64/include/asm/hugetlb.h    |  22 +--
>>   arch/arm64/include/asm/pgtable.h    |  68 ++++++-
>>   arch/arm64/mm/hugetlbpage.c         | 294 +---------------------------
>>   arch/riscv/Kconfig                  |   1 +
>>   arch/riscv/include/asm/hugetlb.h    |  36 +---
>>   arch/riscv/include/asm/pgtable-64.h |  11 ++
>>   arch/riscv/include/asm/pgtable.h    | 222 ++++++++++++++++++---
>>   arch/riscv/mm/hugetlbpage.c         | 243 +----------------------
>>   arch/riscv/mm/pgtable.c             |   6 +-
>>   include/linux/hugetlb_contpte.h     |  39 ++++
>>   mm/Kconfig                          |   3 +
>>   mm/Makefile                         |   1 +
>>   mm/hugetlb_contpte.c                | 258 ++++++++++++++++++++++++
>>   14 files changed, 583 insertions(+), 622 deletions(-)
>>   create mode 100644 include/linux/hugetlb_contpte.h
>>   create mode 100644 mm/hugetlb_contpte.c
>>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

