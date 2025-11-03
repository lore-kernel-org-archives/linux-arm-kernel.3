Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1BDCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 18:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Xh/82epPYCxQQw2FW1rqZLFSQMgbCtmljXqcyGvdlI=; b=Ok/p+F4JcPb+XKWPZXxOVRDROR
	FQMU+1J0qgFXaoVix9KA88rrX8ZTfvIgfZyvz2Lr25MpOObkeLQ951YaVk9DE2cG2V8fU2A2aDmts
	sM0k2pZexqNxkKlrM1C6FFnKA2PsyIzuLO7N96QmoMKS8+1pUQzBHTZfeSTX8b/Z15eZs0aBd+AE5
	x1ZXnKElRznfqn/8Tk0yZcB5bb8cyIt5HtRJX+nzp4LXfevq9Ium18bckHAEwh0V7IIrfhoooIs3D
	Fpmn+fYQtGfCTArH4La/G8gimpbqd69h5ixlD/odplMDW6skGrRb2u9RD1BX56V/HAPhNcPOV3QJJ
	RkR8cidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzFe-0000000AUBk-3m1Q;
	Mon, 03 Nov 2025 18:25:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzFY-0000000AUBL-0iUD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 18:25:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EF862A6B;
	Mon,  3 Nov 2025 10:25:43 -0800 (PST)
Received: from [10.1.30.16] (unknown [10.1.30.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E06143F694;
	Mon,  3 Nov 2025 10:25:43 -0800 (PST)
Message-ID: <334d6272-a1c2-4075-a956-3f41908371a6@arm.com>
Date: Mon, 3 Nov 2025 18:25:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] arm64: mm: replace TIF_LAZY_MMU with
 in_lazy_mmu_mode()
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
 <20251029100909.3381140-9-kevin.brodsky@arm.com>
 <b6f5b3cc-93a0-408a-b7e0-72462f3fd549@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <b6f5b3cc-93a0-408a-b7e0-72462f3fd549@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_102552_549977_B062EE10 
X-CRM114-Status: GOOD (  17.92  )
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

On 03/11/2025 16:03, David Hildenbrand wrote:
> On 29.10.25 11:09, Kevin Brodsky wrote:
>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>> mode. As a result we no longer need a TIF flag for that purpose -
>> let's use the new in_lazy_mmu_mode() helper instead.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h     | 16 +++-------------
>>   arch/arm64/include/asm/thread_info.h |  3 +--
>>   2 files changed, 4 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h
>> b/arch/arm64/include/asm/pgtable.h
>> index 535435248923..61ca88f94551 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -62,30 +62,21 @@ static inline void emit_pte_barriers(void)
>>     static inline void queue_pte_barriers(void)
>>   {
>> -    unsigned long flags;
>> -
>>       if (in_interrupt()) {
>>           emit_pte_barriers();
>>           return;
>>       }
>>   -    flags = read_thread_flags();
>> -
>> -    if (flags & BIT(TIF_LAZY_MMU)) {
>> -        /* Avoid the atomic op if already set. */
>> -        if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
>> -            set_thread_flag(TIF_LAZY_MMU_PENDING);
>> -    } else {
>> +    if (in_lazy_mmu_mode())
>> +        test_and_set_thread_flag(TIF_LAZY_MMU_PENDING);
>
> You likely don't want a test_and_set here, which would do a
> test_and_set_bit() -- an atomic rmw.

Ah yes good point, the new version would do an atomic RMW in all cases.
Simpler code but also slower :/

>
> You only want to avoid the atomic write if already set.
>
> So keep the current
>
>     /* Avoid the atomic op if already set. */
>     if (!(flags & BIT(TIF_LAZY_MMU_PENDING)))
>         set_thread_flag(TIF_LAZY_MMU_PENDING); 

Pretty much, since we're now only considering one flag we can simplify
it to:

if (!test_thread_flag(TIF_LAZY_MMU_PENDING))
    set_thread_flag(TIF_LAZY_MMU_PENDING);

- Kevin

