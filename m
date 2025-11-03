Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DEFCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 18:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMupISCSYd/eNzrdMLFaLu2UlclpMU6/awU7/8GJBY0=; b=s8+PTor3BXe7+4+PdYlgUkwuwe
	wdG/bchjk8ER7rlRtM6qxq6eIGK1q5qQKOIIvfpsRqW9RXtkn5EhGt06/po8Yi+UtmECCd4rjKlcX
	QysqdvLjg318dbY3cBfEbW4/gBtafGt9XX8o+ZdZEOeK0rnys2tJXx+m6X4WO2DR7HMW9p+uTMWbL
	03VRjghpeVLls2DMxTIEpSClIDIwtSh1zWqbzgnQrgltfGrcgxXt97Bqoan3LPhkSIAZntZG0bfme
	oRrl0nO6xa/s3scuZexr0ivLlI3iUV1aoNlvaHu+YjBVSmCN+86CXY/0oDkQWV+kTZnJIHrvji6+Y
	sCyt9o1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyzD-0000000ASpL-0hMI;
	Mon, 03 Nov 2025 18:08:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyzB-0000000ASp0-0XGv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 18:08:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DBAF2A6B;
	Mon,  3 Nov 2025 10:08:48 -0800 (PST)
Received: from [10.1.30.16] (unknown [10.1.30.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 463A43F694;
	Mon,  3 Nov 2025 10:08:48 -0800 (PST)
Message-ID: <1965fe85-3734-45e9-af89-651c65845e8a@arm.com>
Date: Mon, 3 Nov 2025 18:08:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
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
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <ae1236da-2647-4d53-bf4d-ff8fc32eb734@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <ae1236da-2647-4d53-bf4d-ff8fc32eb734@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_100857_233009_49952C7A 
X-CRM114-Status: GOOD (  13.97  )
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

On 01/11/2025 12:22, David Hildenbrand wrote:
>
>>   static inline void lazy_mmu_mode_pause(void)
>>   {
>> +    struct lazy_mmu_state *state = &current->lazy_mmu_state;
>> +
>> +    VM_WARN_ON(state->nesting_level == 0 || !state->active);
>> +
>> +    state->active = false;
>>       arch_leave_lazy_mmu_mode();
>
> Just one question:
>
> Don't we want to allow for pause/resume when not enabled? Would seem
> valid to me, because pause/resume code should actually not worry about
> that, right?

This does sound sensible, thanks for the suggestion. The initial goal
was to allow functions that know they're called with lazy MMU enabled to
be able to pause it temporarily if they need batching disabled. But we
could generalise this to: if you know batching would break things, then
you can preemptively add a pause/resume pair, and it won't do anything
unless you're called with lazy MMU enabled.

I also like this as this removes an invalid usage situation - now as
long as you have balanced enable/disable and pause/resume calls, you're
good. Will make that change in v5.

- Kevin

>
> if (!state->nesting_level) {
>     VM_WARN_ON(state->active);
>     return;
> }
> VM_WARN_ON(!state->active);
> state->active = false;
> arch_leave_lazy_mmu_mode();
>

