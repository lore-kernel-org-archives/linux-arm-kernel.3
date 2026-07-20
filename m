Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD755C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qh40Kaf5239dKtP22X4SPcyyQ2a1IDHQ6RgI2IFlkJE=; b=Biy2wKOfTw8b6WCwhl8wNPG860
	2M+Ni5Ir8GBj6KxmxggIw53vi5zXEBsQjizCGWN4/BECJunso97lQO18OghQTecXVmeZNwv+l4/4E
	bUJ2eBgjLA6laGf12oZ+16ki7tQCS6dwGH3XsFe2XaEnCwDF0rlA7CeXWUiKlLqGH+dWeP7XaMMuu
	ul2yHhuC1LWRSi+rafeHurgdB0VmbvlcycKMiv/j10sYMf1e5RJdB+4f173v42ifuffxNUoc9m9Md
	m/CY+3PGZaJ/HdgqGqSFkP4UPZTEItpcIWNedc1BztNydWGiwCZYovAcG2EHprZQzpF1d5boZiSKw
	9ihLjASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkKI-00000006K18-2idT;
	Mon, 20 Jul 2026 09:30:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkKF-00000006K0N-2XcM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:30:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68F132B;
	Mon, 20 Jul 2026 02:30:10 -0700 (PDT)
Received: from [10.164.19.57] (unknown [10.164.19.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 828D03F86F;
	Mon, 20 Jul 2026 02:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784539814; bh=u78go90jcYIuVoiboHtv2/azilqOO6gPDtK1P1MBAVg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Ohi2gNJRzYgy+THnDJEd8IqotthDyQLMLN7Z19lvW/SaHBwbg/iX2n+RhkH7ME117
	 rf1bSX7rSKv/2RofZpRqxXzzdLu+410DMkIY4tyuyo4fuBWrPt6HF0U/g0truGNetK
	 ON8g2xnwGaKdcaqE1OH4sNpxXn0u20RyTo+yv5SQ=
Message-ID: <b7e7707e-e722-4daf-9d98-df82ddefd635@arm.com>
Date: Mon, 20 Jul 2026 15:00:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: ptdump: Flush the last region
From: Dev Jain <dev.jain@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Wei-Lin Chang <weilin.chang@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Oliver Upton <oupton@kernel.org>,
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Sebastian Ene <sebastianene@google.com>,
 Vincent Donnefort <vdonnefort@google.com>
References: <20260717231233.2299068-1-weilin.chang@arm.com>
 <ad52d1ee-04cb-42d7-b50c-dfb3d28db5df@arm.com> <868q76f2wy.wl-maz@kernel.org>
 <4a598a6c-496f-441c-b268-a725f9ee8090@arm.com>
Content-Language: en-US
In-Reply-To: <4a598a6c-496f-441c-b268-a725f9ee8090@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_023015_746240_71C804EA 
X-CRM114-Status: GOOD (  25.04  )
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



On 20/07/26 2:40 pm, Dev Jain wrote:
> 
> 
> On 20/07/26 2:33 pm, Marc Zyngier wrote:
>> On Mon, 20 Jul 2026 09:53:29 +0100,
>> Dev Jain <dev.jain@arm.com> wrote:
>>>
>>>
>>>
>>> On 18/07/26 4:42 am, Wei-Lin Chang wrote:
>>>> Currently the stage-2 ptdump calls note_page() at each leaf entry visit.
>>>> This simply misses the output of the last region, because note_page()
>>>> only dumps output when it detects a change in level/prot, or when the
>>>> walk enters a next marker section. The last region in the guest IPA
>>>> space with the same level/prot is not dumped since there is no change
>>>> after it.
>>>>
>>>> To dump the final region, manually issue a note_page() call with address
>>>> BIT(ia_bits) (end of guest IPA space) and level == -1 to trigger a level
>>>> change after the last region. Additionally treat level == -1 as a last
>>>> flushing note_page() call and avoid dumping the name of the next marker
>>>> for this case.
>>>>
>>>> Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")
>>>> Reported-by: Sashiko AI <sashiko-bot@kernel.org>
>>>> Closes: https://lore.kernel.org/kvmarm/20260630122758.891011F00A3A@smtp.kernel.org/
>>>> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
>>>> ---
>>>>  arch/arm64/kvm/ptdump.c | 8 +++++---
>>>>  arch/arm64/mm/ptdump.c  | 5 +++--
>>>>  2 files changed, 8 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
>>>> index c9140e22abcf..4096e4a92fae 100644
>>>> --- a/arch/arm64/kvm/ptdump.c
>>>> +++ b/arch/arm64/kvm/ptdump.c
>>>> @@ -155,11 +155,13 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
>>>>  		.seq		= m,
>>>>  	};
>>>>  
>>>> -	write_lock(&kvm->mmu_lock);
>>>> +	guard(write_lock)(&kvm->mmu_lock);
>>>
>>> The guard clause change has nothing to do with the fix I think? Although the change
>>> is small and the fix is for a recent commit so maybe we don't care having this
>>> in the same patch - not sure how strict kvm reviewers are about this : )
>>>
>>
>> Look at the quality spaghetti code this would otherwise result in:
>>
>> 	write_lock();
>> 	ret = kvm_pgtable_walk();
>> 	if (ret) {
>> 		write_unlock();
>> 		return ret;
>> 	}
>> 	note_page_flush();
>> 	write_unlock();
>>
>> 	return 0;
>>
>> How is that better? So it has *everything* to do with the fix.
>>
>> And FWIW, the policy for KVM is that we don't do lock->guard
>> conversions as a separate patches. Only when we need to change the
>> code, and as part of the patch that changes that code.  Which is
>> exactly what is happening here.
> 
> I agree, thanks.

Yeah in my head I was thinking that the guard clause is a "functional change"
but it really isn't, the fix implies that without the guard you will get
horrible code, and had the code been correct in the first place, it would
have been written *with* the guard, so yes that was a stupid
observation from my side : )

> 
> 
>>
>>>
>>>>  	ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
>>>> -	write_unlock(&kvm->mmu_lock);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +	note_page(&st->parser_state.ptdump, BIT(mmu->pgt->ia_bits), -1, 0);
>>>>  
>>>> -	return ret;
>>>> +	return 0;
>>>>  }
>>>>  
>>>>  static int kvm_ptdump_guest_open(struct inode *m, struct file *file)
>>>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>>>> index ab9899ca1e5f..fed4e4407e0e 100644
>>>> --- a/arch/arm64/mm/ptdump.c
>>>> +++ b/arch/arm64/mm/ptdump.c
>>>> @@ -194,6 +194,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>>>>  	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
>>>>  	struct ptdump_pg_level *pg_level = st->pg_level;
>>>>  	static const char units[] = "KMGTPE";
>>>> +	bool flush = level == -1;
>>>
>>> Can we do something similar to what S1 ptdump does (note_page_flush in ptdump_walk_pgd).
>>
>> See Mark's email.
>>
>> 	M.
>>
> 


