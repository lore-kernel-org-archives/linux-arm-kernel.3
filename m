Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18770CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhykxz9GzsE8kMIXaPXFCgys3OFctwySkKvMft9wrnQ=; b=S0ssoVmrNldTxX5X/2QuG+gJHe
	sH9q2H5PgfuhmYrXKDfmGAuw5jeOjYiw9O8h/0/NIzYfqUggsTwkN5cEYvMa7XehPQQhhgU5RAwRu
	Ey8TlaSpcqylFDKSUJF0xXQ6cvNxCH+9xqo+/v+FS3QJqeW/IIQbLQtCa+5YcstHYtthYSY35xxdv
	A4bNyGVuA3eGcADPy9+JGiXKz1zjVvv+jd/5MzZ0AMHg1sAhNdF5wPzuRDcSkLapwkV9U7RG0O5zm
	XoO+9iFe2ySfTVmXQav+uINBbM+XEdXmQQDtqdA3AjC5MN4gg/kJxy0FzvIIkZje28TO79WCNj1VI
	nFHKZ9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVvx-000000029d1-0DkB;
	Fri, 19 Sep 2025 07:53:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVvu-000000029cU-2s2X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:53:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE4E9169C;
	Fri, 19 Sep 2025 00:53:21 -0700 (PDT)
Received: from [10.164.18.52] (MacBook-Pro.blr.arm.com [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAF2E3F673;
	Fri, 19 Sep 2025 00:53:25 -0700 (PDT)
Message-ID: <e9ea7a4c-6f37-40e2-8812-3125e85cbeed@arm.com>
Date: Fri, 19 Sep 2025 13:23:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, anshuman.khandual@arm.com,
 quic_zhenhuah@quicinc.com, ryan.roberts@arm.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com, mark.rutland@arm.com, urezki@gmail.com,
 jthoughton@google.com
References: <20250723161827.15802-1-dev.jain@arm.com>
 <aMk8QhkumtEoPVTh@willie-the-truck>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aMk8QhkumtEoPVTh@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_005330_805388_96BEE576 
X-CRM114-Status: GOOD (  29.89  )
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


On 16/09/25 4:00 pm, Will Deacon wrote:
> Hi Dev,
>
> On Wed, Jul 23, 2025 at 09:48:27PM +0530, Dev Jain wrote:
>> @@ -1301,16 +1319,76 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>   	}
>>   
>>   	table = pmd_offset(pudp, addr);
>> +
>> +	/*
>> +	 * Our objective is to prevent ptdump from reading a PMD table which has
>> +	 * been freed.  Assume that ptdump_walk_pgd() (call this thread T1)
>> +	 * executes completely on CPU1 and pud_free_pmd_page() (call this thread
>> +	 * T2) executes completely on CPU2. Let the region sandwiched by the
>> +	 * mmap_write_lock/unlock in T1 be called CS (the critical section).
>> +	 *
>> +	 * Claim: The CS of T1 will never operate on a freed PMD table.
>> +	 *
>> +	 * Proof:
>> +	 *
>> +	 * Case 1: The static branch is visible to T2.
>> +	 *
>> +	 * Case 1 (a): T1 acquires the lock before T2 can.
>> +	 * T2 will block until T1 drops the lock, so pmd_free() will only be
>> +	 * executed after T1 exits CS.
>> +	 *
>> +	 * Case 1 (b): T2 acquires the lock before T1 can.
>> +	 * The sequence of barriers issued in __flush_tlb_kernel_pgtable()
>> +	 * ensures that an empty PUD (via pud_clear()) is visible to T1 before
>> +	 * T1 can enter CS, therefore it is impossible for the CS to get hold
>> +	 * of the address of the isolated PMD table.
>> +	 *
>> +	 * Case 2: The static branch is not visible to T2.
>> +	 *
>> +	 * Since static_branch_enable() (via dmb(ish)) and mmap_write_lock()
>> +	 * have acquire semantics, it is guaranteed that the static branch
>> +	 * will be visible to all CPUs before T1 can enter CS. The static
>> +	 * branch not being visible to T2 therefore guarantees that T1 has
>> +	 * not yet entered CS .... (i)
>> +	 * The sequence of barriers via __flush_tlb_kernel_pgtable() in T2
>> +	 * implies that if the invisibility of the static branch has been
>> +	 * observed by T2 (i.e static_branch_unlikely() is observed as false),
>> +	 * then all CPUs will have observed an empty PUD ... (ii)
>> +	 * Combining (i) and (ii), we conclude that T1 observes an empty PUD
>> +	 * before entering CS => it is impossible for the CS to get hold of
>> +	 * the address of the isolated PMD table. Q.E.D
>> +	 *
>> +	 * We have proven that the claim is true on the assumption that
>> +	 * there is no context switch for T1 and T2. Note that the reasoning
>> +	 * of the proof uses barriers operating on the inner shareable domain,
>> +	 * which means that they will affect all CPUs, and also a context switch
>> +	 * will insert extra barriers into the code paths => the claim will
>> +	 * stand true even if we drop the assumption.
>> +	 *
>> +	 * It is also worth reasoning whether something can go wrong via
>> +	 * pud_free_pmd_page() -> __pmd_free_pte_page(), since the latter
>> +	 * will be called locklessly on this code path.
>> +	 *
>> +	 * For Case 1 (a), T2 will block until CS is finished, so we are safe.
>> +	 * For Case 1 (b) and Case 2, the PMD table will be isolated before
>> +	 * T1 can enter CS, therefore it is safe for T2 to operate on the
>> +	 * PMD table locklessly.
>> +	 */
> Although I can see that you put a lot of effort into this comment, I
> think we should just remove it. Instead, we should have a litmus test
> in the commit message and probably just some small comments here to
> explain e.g. why the mmap_read_lock() critical section is empty.
>
> I'm currently trying to put together a litmus test with James (cc'd) so
> maybe we can help you out with that part.

Thanks for the effort!

>
> In the meantime...
>
>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>> index 421a5de806c6..65335c7ba482 100644
>> --- a/arch/arm64/mm/ptdump.c
>> +++ b/arch/arm64/mm/ptdump.c
>> @@ -283,6 +283,13 @@ void note_page_flush(struct ptdump_state *pt_st)
>>   	note_page(pt_st, 0, -1, pte_val(pte_zero));
>>   }
>>   
>> +static void arm64_ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm)
>> +{
>> +	static_branch_enable(&arm64_ptdump_lock_key);
>> +	ptdump_walk_pgd(st, mm, NULL);
>> +	static_branch_disable(&arm64_ptdump_lock_key);
>> +}
> What serialises the toggling of the static key here? For example, I can't
> see what prevents a kernel page-table dump running concurrently with a
> check_wx() and the key ending up in the wrong state.

Good spot. I believe static_branch_{inc, dec} should work here. The vmalloc code
only needs to know that someone is traversing the pagetables, and there is no
synchronization needed between check_wx and ptdump. And, static_branch_inc()
should have the same semantics as static_branch_enable().

>
> Either we need an additional lock or perhaps using
> static_branch_{inc,dec}() would work instead? I haven't thought too hard
> about that but it looks like we need _something_.
>
> Will

