Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2C9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkOtPRKbyZcWMA1+sVWj0C3M4U0xrTDTG/fL86uOF4k=; b=1jRNh0UH6X8Hg7W5yzHXtsgu7X
	SVPhLAbT4JCwczi/l5trFP5PqqvjbdjCnaBSfc9QuZBUu9NrJri/1pV6o7Bs9d+M+urlELBeK61dQ
	zx7R6gzSYrK+rJnM8qDwaXORwf1eEzMq/vUpP+C0xAFjc4zZi9a5DhEVtXYpksgbWth1sDcGQoLtC
	PwoK8VrCC2NfSyLqOY7M6a+9z87SLtJxRPiWLHIY4oFScQZrt8dwpf4nePfLKT4gbn5s35EmpkKyy
	EHPWcVvfJANHBct4AO2437x8oU0i8/QJZyj1PxE8KpoxW68mGN/tHFttN1RgcfzFFyrPa0N/yEhHF
	k7ovE/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gy0-000000094M8-1zwI;
	Tue, 29 Apr 2025 09:09:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gs1-000000093Kr-1MII
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 09:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wkOtPRKbyZcWMA1+sVWj0C3M4U0xrTDTG/fL86uOF4k=; b=XMiQ8oNZU4+HgN/yTfiF71U4RF
	yI0CdSq0h6hD3lZDJsOIkRYUFkEuTnBpvXpnFq6AYlBRStCXHuxHO/eOHdhnZYjRwsY1DJC8O01Iz
	RxgZ3yjp8E1Qus8FoXwvZapBcSuytALSo0jytTgC+eKwHxZEYwre3BhWrfORSOSIoHGCDsa9LUAPB
	1a2+tqe6rJe0NOgztnxwZoaMtOxsxbCTKtu4dff5vC8HHF465UMxluo/QZy7reJqVQnjRvI7z5P3h
	FmHsGm0MzGzexO/2iptbmyWWD4BOnNNykwVPTlzucPdyNao8aBq0K7DqkRT4SRlyGk1qXtMC6HFFy
	NCH438Hw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9gry-0000000DEgE-0m0s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 09:03:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8995622F8;
	Tue, 29 Apr 2025 02:03:06 -0700 (PDT)
Received: from [10.163.78.253] (unknown [10.163.78.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B9003F673;
	Tue, 29 Apr 2025 02:03:02 -0700 (PDT)
Message-ID: <05c3cd68-0d75-4682-a51c-59307e2b2e78@arm.com>
Date: Tue, 29 Apr 2025 14:32:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Optimize mprotect for large folios
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <ba73873b-1b26-44cd-ac0f-76e33e8fc2cf@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <ba73873b-1b26-44cd-ac0f-76e33e8fc2cf@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_100314_616829_0A00E032 
X-CRM114-Status: GOOD (  30.05  )
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



On 29/04/25 12:36 pm, Lance Yang wrote:
> Hey Dev,
> 
> Hmm... I also hit the same compilation errors:
> 
> In file included from ./include/linux/kasan.h:37,
>                   from ./include/linux/slab.h:260,
>                   from ./include/linux/crypto.h:19,
>                   from arch/x86/kernel/asm-offsets.c:9:
> ./include/linux/pgtable.h: In function ‘modify_prot_start_ptes’:
> ./include/linux/pgtable.h:905:15: error: implicit declaration of 
> function ‘ptep_modify_prot_start’ [-Werror=implicit-function-declaration]
>    905 |         pte = ptep_modify_prot_start(vma, addr, ptep);
>        |               ^~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h:905:15: error: incompatible types when 
> assigning to type ‘pte_t’ from type ‘int’
> ./include/linux/pgtable.h:909:27: error: incompatible types when 
> assigning to type ‘pte_t’ from type ‘int’
>    909 |                 tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>        |                           ^~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h: In function ‘modify_prot_commit_ptes’:
> ./include/linux/pgtable.h:925:17: error: implicit declaration of 
> function ‘ptep_modify_prot_commit’ [-Werror=implicit-function-declaration]
>    925 |                 ptep_modify_prot_commit(vma, addr, ptep, 
> old_pte, pte);
>        |                 ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h: At top level:
> ./include/linux/pgtable.h:1360:21: error: conflicting types for 
> ‘ptep_modify_prot_start’; have ‘pte_t(struct vm_area_struct *, long 
> unsigned int,  pte_t *)’
>   1360 | static inline pte_t ptep_modify_prot_start(struct 
> vm_area_struct *vma,
>        |                     ^~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h:905:15: note: previous implicit declaration of 
> ‘ptep_modify_prot_start’ with type ‘int()’
>    905 |         pte = ptep_modify_prot_start(vma, addr, ptep);
>        |               ^~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h:1371:20: warning: conflicting types for 
> ‘ptep_modify_prot_commit’; have ‘void(struct vm_area_struct *, long 
> unsigned int,  pte_t *, pte_t,  pte_t)’
>   1371 | static inline void ptep_modify_prot_commit(struct 
> vm_area_struct *vma,
>        |                    ^~~~~~~~~~~~~~~~~~~~~~~
> ./include/linux/pgtable.h:1371:20: error: static declaration of 
> ‘ptep_modify_prot_commit’ follows non-static declaration
> ./include/linux/pgtable.h:925:17: note: previous implicit declaration of 
> ‘ptep_modify_prot_commit’ with type ‘void(struct vm_area_struct *, long 
> unsigned int,  pte_t *, pte_t,  pte_t)’
>    925 |                 ptep_modify_prot_commit(vma, addr, ptep, 
> old_pte, pte);
>        |                 ^~~~~~~~~~~~~~~~~~~~~~~
>    CC /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/objtool/ 
> libstring.o
>    CC /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/objtool/ 
> libctype.o
>    CC /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/objtool/ 
> str_error_r.o
>    CC /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/objtool/ 
> librbtree.o
> cc1: some warnings being treated as errors
> make[2]: *** [scripts/Makefile.build:98: arch/x86/kernel/asm-offsets.s] 
> Error 1
> make[1]: *** [/home/runner/work/mm-test-robot/mm-test-robot/linux/ 
> Makefile:1280: prepare0] Error 2
> make[1]: *** Waiting for unfinished jobs....
>    LD /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/objtool/ 
> objtool-in.o
>    LINK /home/runner/work/mm-test-robot/mm-test-robot/linux/tools/ 
> objtool/objtool
> make: *** [Makefile:248: __sub-make] Error 2
> 
> Well, modify_prot_start_ptes() calls ptep_modify_prot_start(), but x86
> does not define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION. To avoid
> implicit declaration errors, the architecture-independent
> ptep_modify_prot_start() must be defined before modify_prot_start_ptes().
> 
> With the changes below, things work correctly now ;)

Ah thanks! My bad :(

> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 10cdb87ccecf..d9d6c49bb914 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -895,44 +895,6 @@ static inline void wrprotect_ptes(struct mm_struct 
> *mm, unsigned long addr,
>   }
>   #endif
> 
> -/* See the comment for ptep_modify_prot_start */
> -#ifndef modify_prot_start_ptes
> -static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> -        unsigned long addr, pte_t *ptep, unsigned int nr)
> -{
> -    pte_t pte, tmp_pte;
> -
> -    pte = ptep_modify_prot_start(vma, addr, ptep);
> -    while (--nr) {
> -        ptep++;
> -        addr += PAGE_SIZE;
> -        tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> -        if (pte_dirty(tmp_pte))
> -            pte = pte_mkdirty(pte);
> -        if (pte_young(tmp_pte))
> -            pte = pte_mkyoung(pte);
> -    }
> -    return pte;
> -}
> -#endif
> -
> -/* See the comment for ptep_modify_prot_commit */
> -#ifndef modify_prot_commit_ptes
> -static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, 
> unsigned long addr,
> -        pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> -{
> -    for (;;) {
> -        ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> -        if (--nr == 0)
> -            break;
> -        ptep++;
> -        addr += PAGE_SIZE;
> -        old_pte = pte_next_pfn(old_pte);
> -        pte = pte_next_pfn(pte);
> -    }
> -}
> -#endif
> -
>   /*
>    * On some architectures hardware does not set page access bit when 
> accessing
>    * memory page, it is responsibility of software setting this bit. It 
> brings
> @@ -1375,6 +1337,45 @@ static inline void ptep_modify_prot_commit(struct 
> vm_area_struct *vma,
>       __ptep_modify_prot_commit(vma, addr, ptep, pte);
>   }
>   #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> +
> +/* See the comment for ptep_modify_prot_start */
> +#ifndef modify_prot_start_ptes
> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> +        unsigned long addr, pte_t *ptep, unsigned int nr)
> +{
> +    pte_t pte, tmp_pte;
> +
> +    pte = ptep_modify_prot_start(vma, addr, ptep);
> +    while (--nr) {
> +        ptep++;
> +        addr += PAGE_SIZE;
> +        tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> +        if (pte_dirty(tmp_pte))
> +            pte = pte_mkdirty(pte);
> +        if (pte_young(tmp_pte))
> +            pte = pte_mkyoung(pte);
> +    }
> +    return pte;
> +}
> +#endif
> +
> +/* See the comment for ptep_modify_prot_commit */
> +#ifndef modify_prot_commit_ptes
> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, 
> unsigned long addr,
> +        pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> +{
> +    for (;;) {
> +        ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> +        if (--nr == 0)
> +            break;
> +        ptep++;
> +        addr += PAGE_SIZE;
> +        old_pte = pte_next_pfn(old_pte);
> +        pte = pte_next_pfn(pte);
> +    }
> +}
> +#endif
> +
>   #endif /* CONFIG_MMU */
> 
>   /*
> -- 
> 
> Thanks,
> Lance
> 
> On 2025/4/29 13:23, Dev Jain wrote:
>> This patchset optimizes the mprotect() system call for large folios
>> by PTE-batching.
>>
>> We use the following test cases to measure performance, mprotect()'ing
>> the mapped memory to read-only then read-write 40 times:
>>
>> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
>> pte-mapping those THPs
>> Test case 2: Mapping 1G of memory with 64K mTHPs
>> Test case 3: Mapping 1G of memory with 4K pages
>>
>> Average execution time on arm64, Apple M3:
>> Before the patchset:
>> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
>>
>> After the patchset:
>> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.2 seconds
>>
>> Observing T1/T2 and T3 before the patchset, we also remove the regression
>> introduced by ptep_get() on a contpte block. And, for large folios we get
>> an almost 74% performance improvement.
>>
>> v1->v2:
>>   - Rebase onto mm-unstable (6ebffe676fcf: util_macros.h: make the 
>> header more resilient)
>>   - Abridge the anon-exclusive condition (Lance Yang)
>>
>> Dev Jain (7):
>>    mm: Refactor code in mprotect
>>    mm: Optimize mprotect() by batch-skipping PTEs
>>    mm: Add batched versions of ptep_modify_prot_start/commit
>>    arm64: Add batched version of ptep_modify_prot_start
>>    arm64: Add batched version of ptep_modify_prot_commit
>>    mm: Batch around can_change_pte_writable()
>>    mm: Optimize mprotect() through PTE-batching
>>
>>   arch/arm64/include/asm/pgtable.h |  10 ++
>>   arch/arm64/mm/mmu.c              |  21 +++-
>>   include/linux/mm.h               |   4 +-
>>   include/linux/pgtable.h          |  42 ++++++++
>>   mm/gup.c                         |   2 +-
>>   mm/huge_memory.c                 |   4 +-
>>   mm/memory.c                      |   6 +-
>>   mm/mprotect.c                    | 165 ++++++++++++++++++++-----------
>>   mm/pgtable-generic.c             |  16 ++-
>>   9 files changed, 198 insertions(+), 72 deletions(-)
>>
> 


