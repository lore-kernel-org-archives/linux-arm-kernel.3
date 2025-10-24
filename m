Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E838DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+NzFcJxTQ88UObe6RCiomPcPFxCGLX+axvPSVA7A04=; b=dII3eHChS6aQd20hzIJ9nt5Mvw
	SSdAF3t3J9+jxOKCPjEqZAGOX0CjGCdnQsLf3gDRIIudQQIdpEClqrwgt+P7IJIlfx1ucIn71Opf2
	VIcwIfjfoJ++8DMJcd59z4iY5n3GNoNjwYuDX76/xyYP0LXC+Mj/+xZghWuoEPRKgVQ9ivjBosUfH
	nn7PkVwPI7zmMpjBkcwamWDifjteXneICjcHtRgt9lN+w3CECtTxY7ewjKlKgHOhpsz9gZXuMNhB+
	4OMQUJlvGkZbc5PosvwswfNq/VhdKhffSxRihrjK9GYVx9ujaTbLXF1vkIZUTXwRJCoTDrxIGGHZq
	Vi5QGI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIrK-00000009fY6-2A1A;
	Fri, 24 Oct 2025 14:33:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIrH-00000009fXK-2vdO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 14:33:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66B1C1516;
	Fri, 24 Oct 2025 07:33:26 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7FEF3F66E;
	Fri, 24 Oct 2025 07:33:25 -0700 (PDT)
Message-ID: <f458fbed-266b-48a5-a6e0-745dc2893a34@arm.com>
Date: Fri, 24 Oct 2025 16:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] mm: enable lazy_mmu sections to nest
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
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
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-8-kevin.brodsky@arm.com>
 <2073294c-8003-451a-93e0-9aab81de4d22@redhat.com>
 <7a4e136b-66a5-4244-ab07-f0bcc3a26a83@arm.com>
 <af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_073335_852920_2DDEA085 
X-CRM114-Status: GOOD (  21.77  )
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

On 24/10/2025 15:23, David Hildenbrand wrote:
>>>> + * currently enabled.
>>>>     */
>>>>    #ifdef CONFIG_ARCH_LAZY_MMU
>>>>    static inline void lazy_mmu_mode_enable(void)
>>>>    {
>>>> -    arch_enter_lazy_mmu_mode();
>>>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>> +
>>>> +    VM_BUG_ON(state->count == U8_MAX);
>>>
>>> No VM_BUG_ON() please.
>>
>> I did wonder if this would be acceptable!
>
> Use VM_WARN_ON_ONCE() and let early testing find any such issues.
>
> VM_* is active in debug kernels only either way! :)

That was my intention - I don't think the checking overhead is justified
in production.

>
> If you'd want to handle this in production kernels you'd need
>
> if (WARN_ON_ONCE()) {
>     /* Try to recover */
> }
>
> And that seems unnecessary/overly-complicated for something that
> should never happen, and if it happens, can be found early during testing.

Got it. Then I guess I'll go for a VM_WARN_ON_ONCE() (because indeed
once the overflow/underflow occurs it'll go wrong on every
enable/disable pair).

>
>>
>> What should we do in case of underflow/overflow then? Saturate or just
>> let it wrap around? If an overflow occurs we're probably in some
>> infinite recursion and we'll crash anyway, but an underflow is likely
>> due to a double disable() and saturating would probably allow to
>> recover.
>>
>>>
>>>> +    /* enable() must not be called while paused */
>>>> +    VM_WARN_ON(state->count > 0 && !state->enabled);
>>>> +
>>>> +    if (state->count == 0) {
>>>> +        arch_enter_lazy_mmu_mode();
>>>> +        state->enabled = true;
>>>> +    }
>>>> +    ++state->count;
>>>
>>> Can do
>>>
>>> if (state->count++ == 0) {
>>
>> My idea here was to have exactly the reverse order between enable() and
>> disable(), so that arch_enter() is called before lazy_mmu_state is
>> updated, and arch_leave() afterwards. arch_* probably shouldn't rely on
>> this (or care), but I liked the symmetry.
>
> I see, but really the arch callback should never have to care about that
> value -- unless something is messed up :)

Fair enough, then I can fold those increments/decrements ;)

- Kevin

