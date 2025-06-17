Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29738C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twj8T2eR6XN/ea4DF81VTervPoMfcDtyylv6jyLSLM0=; b=XdYqa/VzyGe35lMIMG1CDFxxeB
	A1mMsZsoLtH8hX0hdQRCXLVQMP3U2Y+s5mjUGjZ+hkeF/HDSwDztO4iO/3cvYKiaLmctqj9SJqAdX
	9y0FKPjgW8zzyEwwBvDXeJFZIhF1I4auccnoxOFEqoP7EmjDrI5NXCFu8XvUupSLsT5UsnA2jB/Sq
	fendPMSX9685/0nYUjwi8WCVE6LG9weSO8K84Mr/2MQLk2FSRN1TqbTf5SD+pPPCqX3p5usVVWcjy
	zQk1YldO+yQqi0VcRbyTB8Bpk69XaAryKtLLbSSYflKFeHJkvpaV768pUtseNuJGHwS9PdClV8VaY
	QXgsEAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUt6-000000075d6-4545;
	Tue, 17 Jun 2025 11:54:00 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUqn-000000075Rv-09zm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 11:51:38 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55394ee39dfso815285e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 04:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750161095; x=1750765895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=twj8T2eR6XN/ea4DF81VTervPoMfcDtyylv6jyLSLM0=;
        b=eMGJx7hHIeZmX+oJcYxrttR8E4rvpcF7B0ocf/2Afd7/TlKCVWBqmMt8GdbWIPcpCu
         1jRInZIEG9xGtIrxw2z45SYyNyTuK7N5Nt8mRuzu5uEunNt/VHoZTw3Mj/qp20hBmehI
         q7IWRbzoeuCXTtcuhPjOM/Vl5rtXDF3QPhutWDxPPVz7x6PaTZGIAuhO9YDkRmAzxNQU
         VAmwDych7JRPiPxdXYwX0XOD6HgvzCDjSM81yfwN+pyyIa36k2j4pxYiPOvfvk9oA3S0
         swyFnWtpfU6G0vPMknOm+iYLyhscAicMbEc+057g2xg3kvHOffjpf5JTCanhk88TLG1n
         hyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750161095; x=1750765895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twj8T2eR6XN/ea4DF81VTervPoMfcDtyylv6jyLSLM0=;
        b=dJp7KajNi93JwTXLJmCp4gBKORwjR+VsPFaQ77r2DnSOH7RcNjdGWy9T2iMjd+v3QU
         2+4+/AlnrkTIe+3swsdP0vit77TUoEZILHeO0ZuqIMZutyRAPu+MTjgQppA8IOkKsZSp
         c8wsWzP59LK+0dzG1+lL9lO2kFgjFnbZlRpvLMlkW+5K4y8uTXyHx29u4US2u79Kh91A
         Zd+L7I1FtaBfABNADp5lqnRBhmjY7v+8t+V5VW7FKSmbZCPUE2nwjnHWg9+xtPYD1hN3
         q1AaoSQWzDM/9kP6fd7W1JZYyu67tBJ0UoA0AnHINNdwE+8zo9ea/W1CSnL99W/2S9eY
         ZsKw==
X-Forwarded-Encrypted: i=1; AJvYcCX6huPpPQWlOzA87jYgPyoURodpTvMyGsbfoYd3IP0jKam78Qt+cHVPcfHYtrVUr+6kPCDHE/fmVXImR2jY+C83@lists.infradead.org
X-Gm-Message-State: AOJu0YzEJWmjx6i09fr0ZZTT8Gi6B+KFp8fwaHGFiBCF2TrPeKUWLCu4
	I7Wf4w54uD10KjRth5hkesdnKhW66EBS7p6izgX/WLdXSMu8pSFA70z0sHvmUpBQ
X-Gm-Gg: ASbGncvrJqeOcOWc9hf/0qfHw77qJDR31+9tGJyxo2WQm47HhOX2ztXvyC1gZgpglwT
	1VNogemCjZJVCj29wZQ9mHIPsH+WCSMdTF13b9ESHli82INYPboPqh5ZHDAVosY3Z1LdaC6Od5K
	2V9yPEcG0cRw5p1Vy8DrKKbAqJO6P/77GDJk2n2wJKeqC3lR1QVTNZG/NHLVEDrXcCGfI4ez6Lv
	LrJso+e3KtMh+cQu22/A7h6wfypg6RFTdgzySqhgzC1CbrxeJNsFZhyixWAil0n5hCUbDXD5fft
	Hha6sn2STqSb7xjvzau1/hNXbaTzwgRrx5t8M9ts3gnQLLD4CWMGid0DfvJ6QlEYh/9js7ycRZx
	/Z40qxk21Z1OnM0JxcX2q2Q==
X-Google-Smtp-Source: AGHT+IEKWlB3168SWBmkir7b5NWAqwlA5k6vSjGyUh+TrlKI3+6zMMfmZ0bIynD2z+XrjGmUbtwH3A==
X-Received: by 2002:a05:6512:aca:b0:553:35bb:f7ba with SMTP id 2adb3069b0e04-553b6828f11mr3690846e87.11.1750161094445;
        Tue, 17 Jun 2025 04:51:34 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab12csm1877346e87.113.2025.06.17.04.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 04:51:33 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 17 Jun 2025 13:51:31 +0200
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org,
	anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aFFWw4O2PjOScWld@pc636>
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
 <ed2df0cc-e02c-4376-af7a-7deac6efa9b4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed2df0cc-e02c-4376-af7a-7deac6efa9b4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_045137_085954_B96E4592 
X-CRM114-Status: GOOD (  53.14  )
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

On Mon, Jun 16, 2025 at 10:20:29PM +0100, Ryan Roberts wrote:
> On 16/06/2025 19:07, Ryan Roberts wrote:
> > On 16/06/2025 11:33, Dev Jain wrote:
> >> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> >> because an intermediate table may be removed, potentially causing the
> >> ptdump code to dereference an invalid address. We want to be able to
> >> analyze block vs page mappings for kernel mappings with ptdump, so to
> >> enable vmalloc-huge with ptdump, synchronize between page table removal in
> >> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> >> use mmap_read_lock and not write lock because we don't need to synchronize
> >> between two different vm_structs; two vmalloc objects running this same
> >> code path will point to different page tables, hence there is no race.
> >>
> >> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> >> 512 times again via pmd_free_pte_page().
> >>
> >> We implement the locking mechanism using static keys, since the chance
> >> of a race is very small. Observe that the synchronization is needed
> >> to avoid the following race:
> >>
> >> CPU1							CPU2
> >> 						take reference of PMD table
> >> pud_clear()
> >> pte_free_kernel()
> >> 						walk freed PMD table
> >>
> >> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
> >>
> >> Therefore, there are two cases: if ptdump sees the cleared PUD, then
> >> we are safe. If not, then the patched-in read and write locks help us
> >> avoid the race.
> >>
> >> To implement the mechanism, we need the static key access from mmu.c and
> >> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
> >> target in the Makefile, therefore we cannot initialize the key there, as
> >> is being done, for example, in the static key implementation of
> >> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
> >> the jump_label mechanism. Declare the key there and define the key to false
> >> in mmu.c.
> >>
> >> No issues were observed with mm-selftests. No issues were observed while
> >> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> >> sysfs in a loop.
> >>
> >> v2->v3:
> >>  - Use static key mechanism
> >>
> >> v1->v2:
> >>  - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
> >>  - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
> >>    the lock 512 times again via pmd_free_pte_page()
> >>
> >> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >> ---
> >>  arch/arm64/include/asm/cpufeature.h |  1 +
> >>  arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
> >>  arch/arm64/mm/ptdump.c              |  5 +++
> >>  3 files changed, 53 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> >> index c4326f1cb917..3e386563b587 100644
> >> --- a/arch/arm64/include/asm/cpufeature.h
> >> +++ b/arch/arm64/include/asm/cpufeature.h
> >> @@ -26,6 +26,7 @@
> >>  #include <linux/kernel.h>
> >>  #include <linux/cpumask.h>
> >>  
> >> +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
> >>  /*
> >>   * CPU feature register tracking
> >>   *
> >> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >> index 8fcf59ba39db..e242ba428820 100644
> >> --- a/arch/arm64/mm/mmu.c
> >> +++ b/arch/arm64/mm/mmu.c
> >> @@ -41,11 +41,14 @@
> >>  #include <asm/tlbflush.h>
> >>  #include <asm/pgalloc.h>
> >>  #include <asm/kfence.h>
> >> +#include <asm/cpufeature.h>
> >>  
> >>  #define NO_BLOCK_MAPPINGS	BIT(0)
> >>  #define NO_CONT_MAPPINGS	BIT(1)
> >>  #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
> >>  
> >> +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
> >> +
> >>  enum pgtable_type {
> >>  	TABLE_PTE,
> >>  	TABLE_PMD,
> >> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
> >>  	return 1;
> >>  }
> >>  
> >> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
> >>  {
> >> +	bool lock_taken = false;
> >>  	pte_t *table;
> >>  	pmd_t pmd;
> >>  
> >> @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >>  		return 1;
> >>  	}
> >>  
> >> +	/* See comment in pud_free_pmd_page for static key logic */
> >>  	table = pte_offset_kernel(pmdp, addr);
> >>  	pmd_clear(pmdp);
> >>  	__flush_tlb_kernel_pgtable(addr);
> >> +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
> >> +		mmap_read_lock(&init_mm);
> >> +		lock_taken = true;
> >> +	}
> >> +	if (unlikely(lock_taken))
> >> +		mmap_read_unlock(&init_mm);
> >> +
> >>  	pte_free_kernel(NULL, table);
> >>  	return 1;
> >>  }
> >>  
> >> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> >> +{
> >> +	return __pmd_free_pte_page(pmdp, addr, true);
> >> +}
> >> +
> >>  int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> >>  {
> >> +	bool lock_taken = false;
> >>  	pmd_t *table;
> >>  	pmd_t *pmdp;
> >>  	pud_t pud;
> >> @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> >>  	}
> >>  
> >>  	table = pmd_offset(pudp, addr);
> >> +	/*
> >> +	 * Isolate the PMD table; in case of race with ptdump, this helps
> >> +	 * us to avoid taking the lock in __pmd_free_pte_page().
> >> +	 *
> >> +	 * Static key logic:
> >> +	 *
> >> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
> >> +	 * execute the if block, then this patches in the read lock, ptdump has
> >> +	 * the write lock patched in, therefore ptdump will never read from
> >> +	 * a potentially freed PMD table.
> >> +	 *
> >> +	 * Case 2: If the if block starts executing before ptdump's
> >> +	 * static_branch_enable(), then no locking synchronization
> >> +	 * will be done. However, pud_clear() + the dsb() in
> >> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
> >> +	 * empty PUD. Thus, it will never walk over a potentially freed
> >> +	 * PMD table.
> >> +	 */
> >> +	pud_clear(pudp);
> > 
> > How can this possibly be correct; you're clearing the pud without any
> > synchronisation. So you could have this situation:
> > 
> > CPU1 (vmalloc)			CPU2 (ptdump)
> > 
> > 				static_branch_enable()
> > 				  mmap_write_lock()
> > 				    pud = pudp_get()
> > pud_free_pmd_page()
> >   pud_clear()
> > 				    access the table pointed to by pud
> > 				    BANG!
> > 
> > Surely the logic needs to be:
> > 
> > 	if (static_branch_unlikely(&ptdump_lock_key)) {
> > 		mmap_read_lock(&init_mm);
> > 		lock_taken = true;
> > 	}
> > 	pud_clear(pudp);
> > 	if (unlikely(lock_taken))
> > 		mmap_read_unlock(&init_mm);
> > 
> > That fixes your first case, I think? But doesn't fix your second case. You could
> > still have:
> > 
> > CPU1 (vmalloc)			CPU2 (ptdump)
> > 
> > pud_free_pmd_page()
> >   <ptdump_lock_key=FALSE>
> > 				static_branch_enable()
> > 				  mmap_write_lock()
> > 				    pud = pudp_get()
> >   pud_clear()
> > 				    access the table pointed to by pud
> > 				    BANG!
> > 
> > I think what you need is some sort of RCU read-size critical section in the
> > vmalloc side that you can then synchonize on in the ptdump side. But you would
> > need to be in the read side critical section when you sample the static key, but
> > you can't sleep waiting for the mmap lock while in the critical section. This
> > feels solvable, and there is almost certainly a well-used pattern, but I'm not
> > quite sure what the answer is. Perhaps others can help...
> 
> Just taking a step back here, I found the "percpu rw semaphore". From the
> documentation:
> 
> """
> Percpu rw semaphores is a new read-write semaphore design that is
> optimized for locking for reading.
> 
> The problem with traditional read-write semaphores is that when multiple
> cores take the lock for reading, the cache line containing the semaphore
> is bouncing between L1 caches of the cores, causing performance
> degradation.
> 
> Locking for reading is very fast, it uses RCU and it avoids any atomic
> instruction in the lock and unlock path. On the other hand, locking for
> writing is very expensive, it calls synchronize_rcu() that can take
> hundreds of milliseconds.
> """
> 
> Perhaps this provides the properties we are looking for? Could just define one
> of these and lock it in read mode around pXd_clear() on the vmalloc side. Then
> lock it in write mode around ptdump_walk_pgd() on the ptdump side. No need for
> static key or other hoops. Given its a dedicated lock, there is no risk of
> accidental contention because no other code is using it.
>
Write-lock indeed is super expensive, as you noted it blocks on
synchronize_rcu(). If that write-lock interferes with a critical
vmalloc fast path, where a read-lock could be injected, then it
is definitely a problem. 

I have not analysed this patch series. I need to have a look what
"ptdump" does.

--
Uladzislau Rezki

