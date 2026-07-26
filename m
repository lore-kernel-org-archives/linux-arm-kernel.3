Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D269C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 08:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIMRI54XKOtaM/XNF7b4KXdkzeK8s3hpsYqHXjMEWo0=; b=pzQRVdwWVd6cXR51JasoE2ybc+
	oaps19KWBwe7gvpvXK4iXbZPARZ5LihUboekVD/f6JcSefPDtVjt1JrMAvJiZcWYsT4ID0Mq3vkbB
	IxOAan22Cf+dMj5fPT/TdQq9vT6gkvkNNwEgLisO6X5J1AVkjOpvQXLhCzRiMvztyYFdJoRvMZZYJ
	zz+zhspHKbaq+ymuVwifQWtaKumFl0JxFqDju/NbHtyMCuDQO+F7ojSzpYrrw3GAStqz0QXr+RaFw
	SA9dJOcNx80Toe28U4rj3MAkp+Ef+xWwMaHk55glWkqbgDRJRKv8HRmgt4F3yyWG0qRk7IdpbZmzd
	U3MEWymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wntxY-0000000101j-3M3x;
	Sun, 26 Jul 2026 08:11:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wntxU-0000000101B-1OTN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 08:11:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A18D32F;
	Sun, 26 Jul 2026 01:11:33 -0700 (PDT)
Received: from [10.164.11.0] (unknown [10.164.11.0])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FB023F86F;
	Sun, 26 Jul 2026 01:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785053497; bh=k2iE/VzfxkzEtkmYVXfBqMUOpWMNDd0JKJoJtSnxKII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g8/j78x3Ph9N708CQRhC/0XCbf/W3eJbizgnvD3crznAXLZLWr0FLngPRNl2AefC9
	 tXCinGEYXfB+KCqKh6QrOm2szos4Dzb+CN4K3MZz+PC6P4eZYYR+B/TR1FhONcU8sz
	 ui8kIKIin7j5bEScuV1xyxY3O2bRSpZk0WGuEOQY=
Message-ID: <0758a5e6-7f19-4e4f-b090-abdb49ba7aac@arm.com>
Date: Sun, 26 Jul 2026 13:41:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] KVM: arm64: ptdump: Flush the last region
To: Marc Zyngier <maz@kernel.org>
Cc: Wei-Lin Chang <weilin.chang@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Oliver Upton <oupton@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Matt Fleming <matt@codeblueprint.co.uk>, Ard Biesheuvel <ardb@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sebastian Ene
 <sebastianene@google.com>, Vincent Donnefort <vdonnefort@google.com>,
 Sashiko AI <sashiko-bot@kernel.org>
References: <20260724185431.2990395-1-weilin.chang@arm.com>
 <20260724185431.2990395-3-weilin.chang@arm.com>
 <a2548783-ee41-49c0-bfe3-80b3816dc6b2@arm.com> <87v7a3ou5n.wl-maz@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <87v7a3ou5n.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_011140_931972_2B297E1E 
X-CRM114-Status: GOOD (  21.36  )
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



On 25/07/26 10:58 pm, Marc Zyngier wrote:
> On Sat, 25 Jul 2026 18:16:37 +0100,
> Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 25/07/26 12:24 am, Wei-Lin Chang wrote:
>>> Currently the stage-2 ptdump calls note_page() at each leaf entry visit.
>>> This simply misses the output of the last region, because note_page()
>>> only dumps output when it detects a change in level/prot, or when the
>>> walk enters a next marker section. The last region in the guest IPA
>>> space with the same level/prot is not dumped since there is no change
>>> after it.
>>>
>>> Call note_page_flush() to dump the final region. note_page_flush()
>>> expects ptdump_state.range[] to be initialized to the range of the
>>> address space, so also do that.
>>>
>>> Also change the second marker's start address to ULONG_MAX so we never
>>> cross it. This avoids dumping redundant marker names (which are NULL),
>>> and advancing beyond the end of the marker array.
>>>
>>> Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")
>>> Reported-by: Sashiko AI <sashiko-bot@kernel.org>
>>> Closes: https://lore.kernel.org/kvmarm/20260630122758.891011F00A3A@smtp.kernel.org/
>>> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
>>> ---
>>>  arch/arm64/kvm/ptdump.c | 16 ++++++++++++----
>>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
>>> index c9140e22abcf..222577163d2b 100644
>>> --- a/arch/arm64/kvm/ptdump.c
>>> +++ b/arch/arm64/kvm/ptdump.c
>>> @@ -130,7 +130,7 @@ static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm_s2_mmu
>>>  	}
>>>  
>>>  	st->ipa_marker[0].name		= "Guest IPA";
>>> -	st->ipa_marker[1].start_address = BIT(pgtable->ia_bits);
>>> +	st->ipa_marker[1].start_address = ULONG_MAX;
>>>  
>>>  	st->mmu				= mmu;
>>>  	return st;
>>> @@ -148,18 +148,26 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
>>>  		.flags	= KVM_PGTABLE_WALK_LEAF,
>>>  	};
>>>  
>>> +	guard(write_lock)(&kvm->mmu_lock);
>>>  	st->parser_state = (struct ptdump_pg_state) {
>>>  		.marker		= &st->ipa_marker[0],
>>>  		.level		= -1,
>>>  		.pg_level	= &st->level[0],
>>>  		.seq		= m,
>>> +		.ptdump		= {
>>> +			.range = (struct ptdump_range[]){
>>> +				{0, BIT(mmu->pgt->ia_bits)},
>>> +				{0, 0}
>>> +			}
>>
>> I am having a real hard time reading that indentation :) you
>> could make it look like what we have currently in ptdump_walk().
> 
> This patch:
> 
> 		.ptdump		= {
> 			.range = (struct ptdump_range[]){
> 				{0, BIT(mmu->pgt->ia_bits)},
> 				{0, 0}
> 			}
> 		}
> 
> ptdump_walk():
> 
> 		.ptdump = {
> 			[...]
> 			.range = (struct ptdump_range[]){
> 				{info->base_addr, end},
> 				{0, 0}
> 			}
> 		}
> 
> Zero difference in indentation. Consider using a better email client,
> or look at the applied patches.

I did apply the patches with b4 :) I should have better explained myself.

ptdump_walk does not do a tab before the "=" . That looks better:


.ptdump = {
	[---]
	.range = (struct ptdump_range[]){
		{info->base_addr, end},
		{0, 0}
	}
}

whereas after this patch, kvm_ptdump_guest_show looks like:

.ptdump		= {
	.range = (struct ptdump_range[]){
		{0, BIT(mmu->pgt->ia_bits)},
		{0, 0}
	}
}


In the former, the range initialization starts almost below its corresponding
opening bracket. That looks better to me. Since kvm_ptdump_guest_show did not expect
"nested" declaration before, it looked fine, but after this patch you have a
combination of doing tabs before the equal sign, and not doing the tab in
".range = " .

So my nitpick would be to drop those tabs. Feel free to ignore if you deem this
as unnecessary churn.


> 
> 	M.
> 


