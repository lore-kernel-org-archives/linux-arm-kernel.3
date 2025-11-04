Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA7BCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 11:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WOQeTavzPrauVi8MwJO524evgvZo3Tkv1ShmH0pjuo=; b=ffkEtLuyRqmsk8qnUO4pET0Ic1
	wkbL5wYUk1ztI7zdYWl47elWhw6m4Eu4JuKk1tm+0H+lvSvr+KpuuHgqZ0/die3D3uYsOfEOhRu+c
	GJ5Q4mGUUvzJ3pXY15cqrfpFl6H8jHkAqXEa7vQN/SeVoFoFZcDpdvDGfvymPuGq8EUR/095SkLtq
	3w4alVNNeH911h7PXtPQOYuFzzsjtNPq+leIfQAcKo2qBz7Nm094PWdNbxL0YsND1QCwyB0LlH46V
	SOy8YuolPORnVaI691ypzyQRhNpWlly4311v1TLLPyKLD+yGxcRNTCqeE+PMRm4udqeRjD+FmE8JL
	3mKytzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFHp-0000000Bikw-2lTS;
	Tue, 04 Nov 2025 11:33:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFHn-0000000BikY-3obs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 11:33:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D06201C2B;
	Tue,  4 Nov 2025 03:33:05 -0800 (PST)
Received: from [10.1.38.100] (e126510-lin.cambridge.arm.com [10.1.38.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C979F3F63F;
	Tue,  4 Nov 2025 03:33:06 -0800 (PST)
Message-ID: <e3326a9c-108a-4eb2-b12e-bff2b5edd1d3@arm.com>
Date: Tue, 4 Nov 2025 11:33:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] powerpc/mm: replace batch->active with
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
 <20251029100909.3381140-10-kevin.brodsky@arm.com>
 <05e2062c-1689-44e7-9cc6-697646ca075d@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <05e2062c-1689-44e7-9cc6-697646ca075d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_033315_997845_DDAD50E0 
X-CRM114-Status: GOOD (  15.25  )
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

On 03/11/2025 16:05, David Hildenbrand wrote:
> On 29.10.25 11:09, Kevin Brodsky wrote:
>> A per-CPU batch struct is activated when entering lazy MMU mode; its
>> lifetime is the same as the lazy MMU section (it is deactivated when
>> leaving the mode). Preemption is disabled in that interval to ensure
>> that the per-CPU reference remains valid.
>>
>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>> mode. We can therefore use the generic helper in_lazy_mmu_mode()
>> to tell whether a batch struct is active instead of tracking it
>> explicitly.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>
> I suspect you were not able to test this on real HW. Some help from
> the ppc folks would be appreciated.

Indeed, it would be nice to get some testing on ppc HW that actually
uses lazy MMU (!radix_enabled()).

>
> LGTM, but the interaction with pause/resume adds a bit of complication
> on top.

Does it? This series doesn't change when arch_enter() and arch_leave()
are called, batch->active and in_lazy_mmu_mode() should coincide. 

- Kevin

