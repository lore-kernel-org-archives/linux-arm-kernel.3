Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61A3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 18:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eU7WK/1PqFlvzgHgAfgHxGbQJbuUHY5MaiGqpoJ3158=; b=FHNf9G+wjIRdz+aL//Gmh+xDDa
	iA4046SrETAV/zB7WmUNLrhwejPAMS8Qn2me43iWWucuIS97CU3vz9ADCyCMb4HCxGWvhimXy6dfz
	hnF9hWueCAKRVRLGI0q4N4kE9u3cXVydurJBmw5D6toz33j2sBLXQGEGXK+1HIfDFzWO5vEHNxMKh
	sEA+7elUbpM/PQvzrIw00z2P1XVuMwCBmL+DwtS07/Pwq9m1QZYOdagJ0HvlJ8rDhbbsggLMxBRYb
	LbZZgZnfgzquTcSUnZtD1sbk14SgLHKtjXxDOMmpTCqFiJ+NGaLth9qwNpepp2fD5HZWw/JewklAD
	+RF7YOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFywx-0000000ASV7-2Xym;
	Mon, 03 Nov 2025 18:06:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFywv-0000000ASU1-1OjN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 18:06:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 183932A6B;
	Mon,  3 Nov 2025 10:06:27 -0800 (PST)
Received: from [10.1.30.16] (unknown [10.1.30.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67BAA3F694;
	Mon,  3 Nov 2025 10:06:27 -0800 (PST)
Message-ID: <bcc78ea0-5eca-49e5-bafd-84a16e06ab98@arm.com>
Date: Mon, 3 Nov 2025 18:06:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
 <5a3ccb7e-9d36-4ac8-9634-c8dec3d6a47c@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <5a3ccb7e-9d36-4ac8-9634-c8dec3d6a47c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_100637_493598_0A2DE84C 
X-CRM114-Status: GOOD (  18.32  )
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

On 01/11/2025 12:14, David Hildenbrand wrote:
> On 29.10.25 11:08, Kevin Brodsky wrote:
>> arch_flush_lazy_mmu_mode() is called when outstanding batched
>> pgtable operations must be completed immediately. There should
>> however be no need to leave and re-enter lazy MMU completely. The
>> only part of that sequence that we really need is xen_mc_flush();
>> call it directly.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>   arch/x86/xen/mmu_pv.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
>> index 2a4a8deaf612..7a35c3393df4 100644
>> --- a/arch/x86/xen/mmu_pv.c
>> +++ b/arch/x86/xen/mmu_pv.c
>> @@ -2139,10 +2139,8 @@ static void xen_flush_lazy_mmu(void)
>>   {
>>       preempt_disable();
>>   -    if (xen_get_lazy_mode() == XEN_LAZY_MMU) {
>> -        arch_leave_lazy_mmu_mode();
>> -        arch_enter_lazy_mmu_mode();
>> -    }
>> +    if (xen_get_lazy_mode() == XEN_LAZY_MMU)
>> +        xen_mc_flush();
>>         preempt_enable();
>>   }
>
> Looks like that was moved to XEN code in
>
> commit a4a7644c15096f57f92252dd6e1046bf269c87d8
> Author: Juergen Gross <jgross@suse.com>
> Date:   Wed Sep 13 13:38:27 2023 +0200
>
>     x86/xen: move paravirt lazy code
>
>
> And essentially the previous implementation lived in
> arch/x86/kernel/paravirt.c:paravirt_flush_lazy_mmu(void) in an
> implementation-agnostic way:
>
> void paravirt_flush_lazy_mmu(void)
> {
>        preempt_disable();
>
>        if (paravirt_get_lazy_mode() == PARAVIRT_LAZY_MMU) {
>                arch_leave_lazy_mmu_mode();
>                arch_enter_lazy_mmu_mode();
>        }
>
>        preempt_enable();
> }

Indeed, I saw that too. Calling the generic leave/enter functions made
some sense at that point, but now that the implementation is
Xen-specific we can directly call xen_mc_flush().

>
> So indeed, I assume just doing the flush here is sufficient.
>
> Reviewed-by: David Hildenbrand <david@redhat.com> 

Thanks for the review!

- Kevin

