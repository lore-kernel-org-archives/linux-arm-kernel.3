Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D29CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PejloQnKGuK3bpH0pnM/kdDvHB2ShDka/sYljxbJywo=; b=r4LsxXB/sudYOyjJ2f9d8oJncK
	XfGZPOSLKgY4TqCJFD1Z3DgiCdXsmjYVEzoi7yvgJ6ouyuNeKVtk604bvetpVrszswp/0l0yjzW/I
	DZif4qDslV0RnGA0HGE1iWrNYP2vHNBYr4YZJ5EdaFROEp4io9bjXg3BSu+isJKuiWpA7tWVfxvj+
	FWDSbjGMvok/tCYT8QbybeCpYCcIe6rkmU2ehNj4a79C2gmP6ezE9bHtOmzwX5ePgFOIJV+LKAFQw
	mKNPKrIO0D9NZMF11IeLeSTu6zOa+Zm+d3DkNi1sFIADEKMp4b70qRfes+UHNDvu37Wl821uw4wnX
	4TA6o25A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzIo-0000000AUQt-49rd;
	Mon, 03 Nov 2025 18:29:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzIl-0000000AUQT-3HLX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 18:29:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD0752A6B;
	Mon,  3 Nov 2025 10:29:02 -0800 (PST)
Received: from [10.1.30.16] (unknown [10.1.30.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 191F33F694;
	Mon,  3 Nov 2025 10:29:02 -0800 (PST)
Message-ID: <285faae4-dab6-4819-847a-889bdf87d5d7@arm.com>
Date: Mon, 3 Nov 2025 18:29:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] x86/xen: use lazy_mmu_state when
 context-switching
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-12-kevin.brodsky@arm.com>
 <c7c8a233-2103-4b48-b65e-ec81666d20e4@kernel.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <c7c8a233-2103-4b48-b65e-ec81666d20e4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_102911_866246_077126CF 
X-CRM114-Status: GOOD (  15.42  )
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

On 03/11/2025 16:15, David Hildenbrand (Red Hat) wrote:
> On 29.10.25 11:09, Kevin Brodsky wrote:
>> [...]
>>
>> @@ -437,7 +436,7 @@ static void xen_end_context_switch(struct
>> task_struct *next)
>>         xen_mc_flush();
>>       leave_lazy(XEN_LAZY_CPU);
>> -    if (test_and_clear_ti_thread_flag(task_thread_info(next),
>> TIF_LAZY_MMU_UPDATES))
>> +    if (next->lazy_mmu_state.active)
>
> This is nasty. If in_lazy_mmu_mode() is not sufficient, we will want
> to have a separate helper that makes it clear what the difference
> between both variants is.

in_lazy_mmu_mode() operates on current, but here we're operating on a
different task. The difference is more fundamental than just passing a
task_struct * or not: in_lazy_mmu_mode() is about whether we're
currently in lazy MMU mode, i.e. not paused and not in interrupt
context. A task that isn't scheduled is never in lazy MMU mode -
lazy_mmu_state.active is just the saved state to be restored when
scheduled again.

My point here is that we could have a helper for this use-case, but it
should not be used in other situations (at least not on current). Maybe
__task_lazy_mmu_active(task)? I do wonder if accessing lazy_mmu_state
directly isn't expressing the intention well enough though (checking the
saved state).

- Kevin

