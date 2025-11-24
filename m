Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C9DCFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pU+jnmvgd+G4YbcI1jrZhswEj1b5jzOEmkm4kKdxr30=; b=Xa1P3PZ4YDGo5jMNLOGiOEyZeC
	yzB7G11mlAOAKCbs/dz2pa/p7zcPep760iD1KBgrAWWfnv4gcAZHW9oGOx/acESkhn0nTXCS7sG4a
	kVebNkRvsHFpsCQ1JGtntI7NkLMsCo9IBdaQ4Jimgi5z2NWFpINnA8fgcow/ZCTTBywzlQa/TMCMf
	ZeWkHeUaOiBfi+R1KTPxyHYtHlxNp6xXi/p9K3kFQSrir6WuCEJ/yo9r/r0A+BJRz3RS09DXY1qUe
	+0K5n6PhFIlRWaO9j0NhFae7VciI+Xe21X8MMNpRUfRS+PvvQvaVf7OXT/IYJKmwyhva2y0xLzJts
	Lpg2sKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVzF-0000000BfeT-1jMd;
	Mon, 24 Nov 2025 12:48:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVzC-0000000Bfdg-1SlP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 12:48:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57038497;
	Mon, 24 Nov 2025 04:47:57 -0800 (PST)
Received: from [10.57.40.193] (unknown [10.57.40.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEF4F3F6A8;
	Mon, 24 Nov 2025 04:47:56 -0800 (PST)
Message-ID: <f36ebc15-c724-487a-8e4a-9ca95edc544a@arm.com>
Date: Mon, 24 Nov 2025 13:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
 <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
 <b44825dd-aef9-4d3e-91fd-a44122264c23@arm.com>
Content-Language: en-GB
In-Reply-To: <b44825dd-aef9-4d3e-91fd-a44122264c23@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_044806_552933_70163B56 
X-CRM114-Status: GOOD (  14.60  )
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

On 10/11/2025 11:45, Kevin Brodsky wrote:
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index b8d37eb037fc..d9c8e94f140f 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -731,7 +731,7 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>>  		return -EINVAL;
>>>  
>>>  	mutex_lock(&pgtable_split_lock);
>>> -	arch_enter_lazy_mmu_mode();
>>> +	lazy_mmu_mode_enable();
>>>  
>>>  	/*
>>>  	 * The split_kernel_leaf_mapping_locked() may sleep, it is not a
>> This is a bit unfortunate, IMHO. The rest of this comment explains that although
>> you're not supposed to sleep inside lazy mmu mode, it's fine for arm64's
>> implementation. But we are no longer calling arm64's implementation; we are
>> calling a generic function, which does who knows what.
>>
>> I think it all still works, but we are no longer containing our assumptions in
>> arm64 code. We are relying on implementation details of generic code.
> I see your point. The change itself is still correct (and required
> considering patch 8), but maybe the documentation of the generic
> interface should be clarified to guarantee that the generic layer can
> itself cope with sleeping - without any guarantee regarding the
> behaviour of arch_*_lazy_mmu_mode.

Re-reading the existing comment in <linux/pgtable.h>, I think it already
makes clear that sleeping is not forbidden by design:

>  * In the general case, no lock is guaranteed to be held between entry
> and exit
>  * of the lazy mode. So the implementation must assume preemption may
> be enabled
>  * and cpu migration is possible; it must take steps to be robust
> against this.

The arch implementation may disable preemption, but arm64 code can rely
on the arm64 implementation allowing sleeping.

- Kevin


