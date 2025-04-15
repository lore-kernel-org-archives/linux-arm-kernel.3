Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31F9C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 17:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mj1oX4uH4nJRL8toIJyqfYxrcDiF5lKUR/vX6O7p1rM=; b=ssGZu29ghBe03pJd8D9HowSFVq
	vcX7f3gqNEsLKSpXYU3KRSQsd7ARL3PHYHbwN+Tg2JXl10ZmyOki3YZfQdi7JWGHvwM39RIbza8qk
	RJnPqVWBb7cZVX8JwZSZqZkLR8ha+rlPCKlkkekbFc1pOEhQQXL8ivu36xTMKzYyNOzKSeAeL6NQb
	gjZrm+jXqXah49ok2kHzUwLkdEdQ0B6Zoo8aZx+mA32HXTipOYlWNYXRfuYcVa3Pq8qkmGFndULGb
	UFaWSMhIiwb158l2yb+Jbvwp7N4nbo5/QKAydpTR99lFSVAYKZE0xU0XdTAaM22hXlit52apyACZH
	c+mMjFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kWp-00000006e11-3QZj;
	Tue, 15 Apr 2025 17:56:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4k55-00000006Z08-3MnD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:28:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E85C115A1;
	Tue, 15 Apr 2025 10:28:16 -0700 (PDT)
Received: from [10.57.86.225] (unknown [10.57.86.225])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D5E83F59E;
	Tue, 15 Apr 2025 10:28:16 -0700 (PDT)
Message-ID: <19d2b1c6-ef45-49f5-b11b-a57adc522852@arm.com>
Date: Tue, 15 Apr 2025 18:28:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] arm64/mm: Batch barriers when updating kernel
 mappings
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-12-ryan.roberts@arm.com> <Z_1IC-_Fp-yGLRSc@arm.com>
 <aabc9fb1-4e74-409a-b25b-8e844e65c502@arm.com> <Z_46QUFXVI69zRZR@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z_46QUFXVI69zRZR@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_102819_932537_45FC80E1 
X-CRM114-Status: GOOD (  21.28  )
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

On 15/04/2025 11:51, Catalin Marinas wrote:
> On Mon, Apr 14, 2025 at 07:28:46PM +0100, Ryan Roberts wrote:
>> On 14/04/2025 18:38, Catalin Marinas wrote:
>>> On Tue, Mar 04, 2025 at 03:04:41PM +0000, Ryan Roberts wrote:
>>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>>> index 1898c3069c43..149df945c1ab 100644
>>>> --- a/arch/arm64/include/asm/pgtable.h
>>>> +++ b/arch/arm64/include/asm/pgtable.h
>>>> @@ -40,6 +40,55 @@
>>>>  #include <linux/sched.h>
>>>>  #include <linux/page_table_check.h>
>>>>  
>>>> +static inline void emit_pte_barriers(void)
>>>> +{
>>>> +	/*
>>>> +	 * These barriers are emitted under certain conditions after a pte entry
>>>> +	 * was modified (see e.g. __set_pte_complete()). The dsb makes the store
>>>> +	 * visible to the table walker. The isb ensures that any previous
>>>> +	 * speculative "invalid translation" marker that is in the CPU's
>>>> +	 * pipeline gets cleared, so that any access to that address after
>>>> +	 * setting the pte to valid won't cause a spurious fault. If the thread
>>>> +	 * gets preempted after storing to the pgtable but before emitting these
>>>> +	 * barriers, __switch_to() emits a dsb which ensure the walker gets to
>>>> +	 * see the store. There is no guarrantee of an isb being issued though.
>>>> +	 * This is safe because it will still get issued (albeit on a
>>>> +	 * potentially different CPU) when the thread starts running again,
>>>> +	 * before any access to the address.
>>>> +	 */
>>>> +	dsb(ishst);
>>>> +	isb();
>>>> +}
>>>> +
>>>> +static inline void queue_pte_barriers(void)
>>>> +{
>>>> +	if (test_thread_flag(TIF_LAZY_MMU))
>>>> +		set_thread_flag(TIF_LAZY_MMU_PENDING);
>>>
>>> As we can have lots of calls here, it might be slightly cheaper to test
>>> TIF_LAZY_MMU_PENDING and avoid setting it unnecessarily.
>>
>> Yes, good point.
>>
>>> I haven't checked - does the compiler generate multiple mrs from sp_el0
>>> for subsequent test_thread_flag()?
>>
>> It emits a single mrs but it loads from the pointer twice.
> 
> It's not that bad if only do the set_thread_flag() once.
> 
>> I think v3 is the version we want?
>>
>>
>> void TEST_queue_pte_barriers_v1(void)
>> {
>> 	if (test_thread_flag(TIF_LAZY_MMU))
>> 		set_thread_flag(TIF_LAZY_MMU_PENDING);
>> 	else
>> 		emit_pte_barriers();
>> }
>>
>> void TEST_queue_pte_barriers_v2(void)
>> {
>> 	if (test_thread_flag(TIF_LAZY_MMU) &&
>> 	    !test_thread_flag(TIF_LAZY_MMU_PENDING))
>> 		set_thread_flag(TIF_LAZY_MMU_PENDING);
>> 	else
>> 		emit_pte_barriers();
>> }
>>
>> void TEST_queue_pte_barriers_v3(void)
>> {
>> 	unsigned long flags = read_thread_flags();
>>
>> 	if ((flags & (_TIF_LAZY_MMU | _TIF_LAZY_MMU_PENDING)) == _TIF_LAZY_MMU)
>> 		set_thread_flag(TIF_LAZY_MMU_PENDING);
>> 	else
>> 		emit_pte_barriers();
>> }
> 
> Doesn't v3 emit barriers once _TIF_LAZY_MMU_PENDING has been set? We
> need something like:
> 
> 	if (flags & _TIF_LAZY_MMU) {
> 		if (!(flags & _TIF_LAZY_MMU_PENDING))
> 			set_thread_flag(TIF_LAZY_MMU_PENDING);
> 	} else {
> 		emit_pte_barriers();
> 	}

Gah, yeah sorry, going to quickly. v2 is also logicially incorrect.

Fixed versions:

void TEST_queue_pte_barriers_v2(void)
{
	if (test_thread_flag(TIF_LAZY_MMU)) {
		if (!test_thread_flag(TIF_LAZY_MMU_PENDING))
			set_thread_flag(TIF_LAZY_MMU_PENDING);
	} else {
		emit_pte_barriers();
	}
}

void TEST_queue_pte_barriers_v3(void)
{
	unsigned long flags = read_thread_flags();

	if (flags & BIT(TIF_LAZY_MMU)) {
		if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
			set_thread_flag(TIF_LAZY_MMU_PENDING);
	} else {
		emit_pte_barriers();
	}
}

000000000000105c <TEST_queue_pte_barriers_v2>:
    105c:	d5384100 	mrs	x0, sp_el0
    1060:	f9400001 	ldr	x1, [x0]
    1064:	37f80081 	tbnz	w1, #31, 1074 <TEST_queue_pte_barriers_v2+0x18>
    1068:	d5033a9f 	dsb	ishst
    106c:	d5033fdf 	isb
    1070:	d65f03c0 	ret
    1074:	f9400001 	ldr	x1, [x0]
    1078:	b707ffc1 	tbnz	x1, #32, 1070 <TEST_queue_pte_barriers_v2+0x14>
    107c:	14000004 	b	108c <TEST_queue_pte_barriers_v2+0x30>
    1080:	d2c00021 	mov	x1, #0x100000000           	// #4294967296
    1084:	f821301f 	stset	x1, [x0]
    1088:	d65f03c0 	ret
    108c:	f9800011 	prfm	pstl1strm, [x0]
    1090:	c85f7c01 	ldxr	x1, [x0]
    1094:	b2600021 	orr	x1, x1, #0x100000000
    1098:	c8027c01 	stxr	w2, x1, [x0]
    109c:	35ffffa2 	cbnz	w2, 1090 <TEST_queue_pte_barriers_v2+0x34>
    10a0:	d65f03c0 	ret

00000000000010a4 <TEST_queue_pte_barriers_v3>:
    10a4:	d5384101 	mrs	x1, sp_el0
    10a8:	f9400020 	ldr	x0, [x1]
    10ac:	36f80060 	tbz	w0, #31, 10b8 <TEST_queue_pte_barriers_v3+0x14>
    10b0:	b60000a0 	tbz	x0, #32, 10c4 <TEST_queue_pte_barriers_v3+0x20>
    10b4:	d65f03c0 	ret
    10b8:	d5033a9f 	dsb	ishst
    10bc:	d5033fdf 	isb
    10c0:	d65f03c0 	ret
    10c4:	14000004 	b	10d4 <TEST_queue_pte_barriers_v3+0x30>
    10c8:	d2c00020 	mov	x0, #0x100000000           	// #4294967296
    10cc:	f820303f 	stset	x0, [x1]
    10d0:	d65f03c0 	ret
    10d4:	f9800031 	prfm	pstl1strm, [x1]
    10d8:	c85f7c20 	ldxr	x0, [x1]
    10dc:	b2600000 	orr	x0, x0, #0x100000000
    10e0:	c8027c20 	stxr	w2, x0, [x1]
    10e4:	35ffffa2 	cbnz	w2, 10d8 <TEST_queue_pte_barriers_v3+0x34>
    10e8:	d65f03c0 	ret

So v3 is the way to go, I think; it's a single mrs and a single ldr.

I'll get this fixed up and posted early next week.

Thanks,
Ryan


