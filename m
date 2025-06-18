Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9E8C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 18:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fICVGUj4ZciPJ7mvCj/PmWXVkMwth4yRgzimN23W/M=; b=XQusMT6VRF1HroCvtdni4STntx
	TPnrb7WgjlIT+F0qTdHdfLQXrRpjdVOekFHrB+EwDjL4bb1U9A81oYo+kU6Og+p6oP8gTO8USE7/N
	FwGpFRhMwskCncT+MEYL1N4Pkf5hrLQH7bW5rGexhz65RW8Thrf28fKksIOTACIHXDe6pXOaCPXOn
	9lFQJP+GWuLrIsQ+ZN6gW+GAAzB0n/oEs1/R8vRxCYiHmUysWcIy40B4RfPID9opWNkAtOQFOe5PH
	5Ui0d9pq+xOtkObDf0u7sbxwNzvIldJ5bsOO42KHKL9ooiDy+dCfzDQfJrw6ADxqUnSHOT8SQ3KQD
	DY04vPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxLM-0000000B2zx-1SlH;
	Wed, 18 Jun 2025 18:17:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwS9-0000000Apfm-2Mfy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 17:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5fICVGUj4ZciPJ7mvCj/PmWXVkMwth4yRgzimN23W/M=; b=Jj3apQetvaw0LaV4oZliadgYyY
	b2T1zjYI8Hhgb0bjj1DRGsfARISzvUcQ/2vxUYKMe64ZF9cGKsNslttKYSe4P0vBw6xl+DhAvqTiV
	Vt2MWrQJPFtJJOrNveJVWW9gS9oeYBucnmXTsDCuUTwXzVanln/3MWRaWyEa5xZxVv19EfkUNlxDp
	+ylMeozjSby3p0jhhHLqhcFFaSTGj42wnSFUdb5nus27vpw47LzaiLG4prQ14ecL3PjG+9uIRaaOx
	2G5strwNymU2gASVcUYV0NUD16hj3aotUDwLVKR5XmnOcVYv2apOcKS5ELf5mTzGfAbKxelvmiood
	Ebm7hBCQ==;
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwS7-00000004Dn5-0pRK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 17:20:00 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55220699ba8so8977473e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750267196; x=1750871996; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5fICVGUj4ZciPJ7mvCj/PmWXVkMwth4yRgzimN23W/M=;
        b=bQq40GrQIvw+RRQGjB8LHnsfgLtGnTXvfYVQN+xOeST+8Q+/u/z5GXwgduF/ziIA25
         BZKnh2KsaV1/OyFLnlbQWQzlGirMuwy9lhsOuo4aHedezr/dEKelau2V0TKvkInJiFAn
         aoBEBraSBZ0AK+rR0QfXBnmgJd9X499YSiMmLjIjyAgGorjPn8T/tsZFknZERBv9W9yN
         prdu+n+RZKyfQ3euXltRBzBe5x6m73yWluXxpQqWgOTKHU5E2tqtt40+JZiEupp+FyrD
         GyK1op/NhfETHqSSq+5o414rVqkBka2PYsBvy8ipUMddCAvGzOhiJ5bCMPh4UwDGg6XA
         PngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267196; x=1750871996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fICVGUj4ZciPJ7mvCj/PmWXVkMwth4yRgzimN23W/M=;
        b=tGGeQ52aHdkFGXzPC3zVnn+7wVMkbk9CHtKnd8R7i2mR6O9pbbuThy3Ggja6R4Wh/R
         tc5j49u9ss+Vk90mtJjoHvXwOB/f0JOWoueerPmw5aQdtM4YloQM+E5/E0rsM7sb5HyU
         wQOXLuudzo6KL7RONQ4sCEoR4xIf7IAZP7xyD9P4oL0nM3tsMXuVGVMWXWdpcbY+uVLy
         5xO8HDH62gX497uV7Drd0brMcDWng9IbTqqlphX+ZUJkRLEX+AhbY9foqFn03AkwQONc
         kvSA7/eCQjaxs1Tsii+tvceHW5URC+Tg81EC/tJ/NavLKvVhTzzGkBpECsjEhiWZw9wc
         oiKw==
X-Forwarded-Encrypted: i=1; AJvYcCUty5AyoR0ZPcr0QcJfnk3I2UOY4fgUDHLyvFvoRjtuFed9oXljb/SKeuzZ0mmCxQF9F7NuXVd7vwuptqrbMITr@lists.infradead.org
X-Gm-Message-State: AOJu0YwGU5Ajx/hdk8QXvh0bi+UrkW+WnkHNRZ9cCFzMx5ORmaaqICa1
	1etlvIi3xhG3vDrXv18NDgIJNal8kdyLkNGjoHNJ3eiBJIXBCAK1ViL9
X-Gm-Gg: ASbGncv6f+tlTuFP7fOS8R0/5VOcg0jFhRDpb80uof8Q9J4g9Ri4s1FOL+PN4p7UiAc
	JhKYbsc997pI503N/R/XbYhD6DlNoTXvA8OjtL9dtaSFlDasrMS7Moi+wj0JNKaBYz4zaZrwk4P
	JlaA43VhBUO9g+PGVAdMLs2KfcKQRbhmbPYQBcSYFjtL7i9gqsFe5l9hmD4Wn41EFkQbw27EVT1
	6UPzqNO5Naf3kJM/Wqe9hgAkl39ZvKp/vpxZeVHOX1Q5RWMq0dwxF7KoPdTd0lsUM0i12eg9GAX
	9KlJSDQ8r5pPXJjxO5W37eYtjsovwThUkuENvyUbwy3dZM98S+moDry6nUalobBwORqX4uqnaB4
	RiWY4gWFKdHc=
X-Google-Smtp-Source: AGHT+IGeTB187BiVB/r3aWXG7/r9waMt9yZG6RIm+hM86FBPPOEg0kE3qM4eFuBD7K/DXfKECK2NXA==
X-Received: by 2002:a05:6512:3ca4:b0:553:2c92:a867 with SMTP id 2adb3069b0e04-553b6f6f32dmr4688134e87.55.1750267196026;
        Wed, 18 Jun 2025 10:19:56 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ca1a77f1sm685889e87.155.2025.06.18.10.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:19:55 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 18 Jun 2025 19:19:52 +0200
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>,
	catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	quic_zhenhuah@quicinc.com, kevin.brodsky@arm.com,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aFL1OFy3OPzW_BRk@pc636>
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
 <ed2df0cc-e02c-4376-af7a-7deac6efa9b4@arm.com>
 <aFFWw4O2PjOScWld@pc636>
 <351c113c-d658-4cf6-9e5c-441b1c96bf17@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <351c113c-d658-4cf6-9e5c-441b1c96bf17@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_181959_401839_9023F136 
X-CRM114-Status: GOOD (  52.30  )
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

On Wed, Jun 18, 2025 at 12:21:48PM +0100, Ryan Roberts wrote:
> On 17/06/2025 12:51, Uladzislau Rezki wrote:
> > On Mon, Jun 16, 2025 at 10:20:29PM +0100, Ryan Roberts wrote:
> >> On 16/06/2025 19:07, Ryan Roberts wrote:
> >>> On 16/06/2025 11:33, Dev Jain wrote:
> >>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> >>>> because an intermediate table may be removed, potentially causing the
> >>>> ptdump code to dereference an invalid address. We want to be able to
> >>>> analyze block vs page mappings for kernel mappings with ptdump, so to
> >>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
> >>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> >>>> use mmap_read_lock and not write lock because we don't need to synchronize
> >>>> between two different vm_structs; two vmalloc objects running this same
> >>>> code path will point to different page tables, hence there is no race.
> >>>>
> >>>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> >>>> 512 times again via pmd_free_pte_page().
> >>>>
> >>>> We implement the locking mechanism using static keys, since the chance
> >>>> of a race is very small. Observe that the synchronization is needed
> >>>> to avoid the following race:
> >>>>
> >>>> CPU1							CPU2
> >>>> 						take reference of PMD table
> >>>> pud_clear()
> >>>> pte_free_kernel()
> >>>> 						walk freed PMD table
> >>>>
> >>>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
> >>>>
> >>>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
> >>>> we are safe. If not, then the patched-in read and write locks help us
> >>>> avoid the race.
> >>>>
> >>>> To implement the mechanism, we need the static key access from mmu.c and
> >>>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
> >>>> target in the Makefile, therefore we cannot initialize the key there, as
> >>>> is being done, for example, in the static key implementation of
> >>>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
> >>>> the jump_label mechanism. Declare the key there and define the key to false
> >>>> in mmu.c.
> >>>>
> >>>> No issues were observed with mm-selftests. No issues were observed while
> >>>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> >>>> sysfs in a loop.
> >>>>
> >>>> v2->v3:
> >>>>  - Use static key mechanism
> >>>>
> >>>> v1->v2:
> >>>>  - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
> >>>>  - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
> >>>>    the lock 512 times again via pmd_free_pte_page()
> >>>>
> >>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >>>> ---
> >>>>  arch/arm64/include/asm/cpufeature.h |  1 +
> >>>>  arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
> >>>>  arch/arm64/mm/ptdump.c              |  5 +++
> >>>>  3 files changed, 53 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> >>>> index c4326f1cb917..3e386563b587 100644
> >>>> --- a/arch/arm64/include/asm/cpufeature.h
> >>>> +++ b/arch/arm64/include/asm/cpufeature.h
> >>>> @@ -26,6 +26,7 @@
> >>>>  #include <linux/kernel.h>
> >>>>  #include <linux/cpumask.h>
> >>>>  
> >>>> +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
> >>>>  /*
> >>>>   * CPU feature register tracking
> >>>>   *
> >>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >>>> index 8fcf59ba39db..e242ba428820 100644
> >>>> --- a/arch/arm64/mm/mmu.c
> >>>> +++ b/arch/arm64/mm/mmu.c
> >>>> @@ -41,11 +41,14 @@
> >>>>  #include <asm/tlbflush.h>
> >>>>  #include <asm/pgalloc.h>
> >>>>  #include <asm/kfence.h>
> >>>> +#include <asm/cpufeature.h>
> >>>>  
> >>>>  #define NO_BLOCK_MAPPINGS	BIT(0)
> >>>>  #define NO_CONT_MAPPINGS	BIT(1)
> >>>>  #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
> >>>>  
> >>>> +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
> >>>> +
> >>>>  enum pgtable_type {
> >>>>  	TABLE_PTE,
> >>>>  	TABLE_PMD,
> >>>> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
> >>>>  	return 1;
> >>>>  }
> >>>>  
> >>>> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >>>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
> >>>>  {
> >>>> +	bool lock_taken = false;
> >>>>  	pte_t *table;
> >>>>  	pmd_t pmd;
> >>>>  
> >>>> @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >>>>  		return 1;
> >>>>  	}
> >>>>  
> >>>> +	/* See comment in pud_free_pmd_page for static key logic */
> >>>>  	table = pte_offset_kernel(pmdp, addr);
> >>>>  	pmd_clear(pmdp);
> >>>>  	__flush_tlb_kernel_pgtable(addr);
> >>>> +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
> >>>> +		mmap_read_lock(&init_mm);
> >>>> +		lock_taken = true;
> >>>> +	}
> >>>> +	if (unlikely(lock_taken))
> >>>> +		mmap_read_unlock(&init_mm);
> >>>> +
> >>>>  	pte_free_kernel(NULL, table);
> >>>>  	return 1;
> >>>>  }
> >>>>  
> >>>> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >>>> +{
> >>>> +	return __pmd_free_pte_page(pmdp, addr, true);
> >>>> +}
> >>>> +
> >>>>  int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> >>>>  {
> >>>> +	bool lock_taken = false;
> >>>>  	pmd_t *table;
> >>>>  	pmd_t *pmdp;
> >>>>  	pud_t pud;
> >>>> @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> >>>>  	}
> >>>>  
> >>>>  	table = pmd_offset(pudp, addr);
> >>>> +	/*
> >>>> +	 * Isolate the PMD table; in case of race with ptdump, this helps
> >>>> +	 * us to avoid taking the lock in __pmd_free_pte_page().
> >>>> +	 *
> >>>> +	 * Static key logic:
> >>>> +	 *
> >>>> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
> >>>> +	 * execute the if block, then this patches in the read lock, ptdump has
> >>>> +	 * the write lock patched in, therefore ptdump will never read from
> >>>> +	 * a potentially freed PMD table.
> >>>> +	 *
> >>>> +	 * Case 2: If the if block starts executing before ptdump's
> >>>> +	 * static_branch_enable(), then no locking synchronization
> >>>> +	 * will be done. However, pud_clear() + the dsb() in
> >>>> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
> >>>> +	 * empty PUD. Thus, it will never walk over a potentially freed
> >>>> +	 * PMD table.
> >>>> +	 */
> >>>> +	pud_clear(pudp);
> >>>
> >>> How can this possibly be correct; you're clearing the pud without any
> >>> synchronisation. So you could have this situation:
> >>>
> >>> CPU1 (vmalloc)			CPU2 (ptdump)
> >>>
> >>> 				static_branch_enable()
> >>> 				  mmap_write_lock()
> >>> 				    pud = pudp_get()
> >>> pud_free_pmd_page()
> >>>   pud_clear()
> >>> 				    access the table pointed to by pud
> >>> 				    BANG!
> >>>
> >>> Surely the logic needs to be:
> >>>
> >>> 	if (static_branch_unlikely(&ptdump_lock_key)) {
> >>> 		mmap_read_lock(&init_mm);
> >>> 		lock_taken = true;
> >>> 	}
> >>> 	pud_clear(pudp);
> >>> 	if (unlikely(lock_taken))
> >>> 		mmap_read_unlock(&init_mm);
> >>>
> >>> That fixes your first case, I think? But doesn't fix your second case. You could
> >>> still have:
> >>>
> >>> CPU1 (vmalloc)			CPU2 (ptdump)
> >>>
> >>> pud_free_pmd_page()
> >>>   <ptdump_lock_key=FALSE>
> >>> 				static_branch_enable()
> >>> 				  mmap_write_lock()
> >>> 				    pud = pudp_get()
> >>>   pud_clear()
> >>> 				    access the table pointed to by pud
> >>> 				    BANG!
> >>>
> >>> I think what you need is some sort of RCU read-size critical section in the
> >>> vmalloc side that you can then synchonize on in the ptdump side. But you would
> >>> need to be in the read side critical section when you sample the static key, but
> >>> you can't sleep waiting for the mmap lock while in the critical section. This
> >>> feels solvable, and there is almost certainly a well-used pattern, but I'm not
> >>> quite sure what the answer is. Perhaps others can help...
> >>
> >> Just taking a step back here, I found the "percpu rw semaphore". From the
> >> documentation:
> >>
> >> """
> >> Percpu rw semaphores is a new read-write semaphore design that is
> >> optimized for locking for reading.
> >>
> >> The problem with traditional read-write semaphores is that when multiple
> >> cores take the lock for reading, the cache line containing the semaphore
> >> is bouncing between L1 caches of the cores, causing performance
> >> degradation.
> >>
> >> Locking for reading is very fast, it uses RCU and it avoids any atomic
> >> instruction in the lock and unlock path. On the other hand, locking for
> >> writing is very expensive, it calls synchronize_rcu() that can take
> >> hundreds of milliseconds.
> >> """
> >>
> >> Perhaps this provides the properties we are looking for? Could just define one
> >> of these and lock it in read mode around pXd_clear() on the vmalloc side. Then
> >> lock it in write mode around ptdump_walk_pgd() on the ptdump side. No need for
> >> static key or other hoops. Given its a dedicated lock, there is no risk of
> >> accidental contention because no other code is using it.
> >>
> > Write-lock indeed is super expensive, as you noted it blocks on
> > synchronize_rcu(). If that write-lock interferes with a critical
> > vmalloc fast path, where a read-lock could be injected, then it
> > is definitely a problem. 
> > 
> > I have not analysed this patch series. I need to have a look what
> > "ptdump" does.
> 
> ptdump is the kernel page table dumper. It is only invoked when a privileged
> user reads from a debugfs file. This is debug functionality only. It's
> acceptable for the write side to be slow.
> 
> Regardless, I've backtracked on my original review... I actually think Dev's
> approach with the static key is the correct approach here. It means that there
> is zero overhead for the common case of nobody actively dumping kernel page
> tables but it also makes the table removal operation safe in the presence of ptdump.
> 
OK, thank you!

--
Uladzislau Rezki

