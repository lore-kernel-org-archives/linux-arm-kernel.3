Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB47FD65528
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7x4f8BY8GynScz5iUPqtBGCKWxEIeZZAw/o0QRcMsU8=; b=BNm3wPkgnbfCuLgJICmFZdRxrx
	IFEaXRb9Y+Hpz9V5qbM4KO9rrsJiBWNG3i1/Jt2MlMaFJa5pfoOvP7CZ7mdOHIL4qrR8Rz9BQPRKT
	dwrbnqcq0PoG7KHAFkFe0C5kt8ui80CnrV/OIgt9m0FTVzwEG7X6Gpa+D9xbX5Ed1MMfbPw4WtkbE
	nn8u/rjrSaydLoQ+MvdQupkALb5pXv5HjYhlAvVzEIKkUvYEa/XIoHmq3LlUPkdac58brTb9NI7Dg
	2LDnp/J69EvRX01OYtD3mDjNtSARKbV3FRqKqkUpOydZCZBdrvzk3xJY5OSadknxvNsS5NySucere
	HjrMTr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoLr-00000006UvX-3yuC;
	Wed, 17 Dec 2025 10:01:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoLm-00000006Uu4-0jTe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:01:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 326E314BF;
	Wed, 17 Dec 2025 02:01:32 -0800 (PST)
Received: from [10.57.91.77] (unknown [10.57.91.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4ADE3F73B;
	Wed, 17 Dec 2025 02:01:32 -0800 (PST)
Message-ID: <ca0da7fd-245c-4d52-8f4d-f8fce4717494@arm.com>
Date: Wed, 17 Dec 2025 10:01:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
Content-Language: en-GB
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
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
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
 <20251215150323.2218608-15-kevin.brodsky@arm.com>
 <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
 <f9550d22-8810-4145-aaa8-48961f6ea35e@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <f9550d22-8810-4145-aaa8-48961f6ea35e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_020142_260779_D99EB36F 
X-CRM114-Status: GOOD (  13.31  )
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

On 17/12/2025 09:26, Kevin Brodsky wrote:
> On 17/12/2025 05:14, Andrew Morton wrote:
>> On Mon, 15 Dec 2025 15:03:23 +0000 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>>
>>> Add basic KUnit tests for the generic aspects of the lazy MMU mode:
>>> ensure that it appears active when it should, depending on how
>>> enable/disable and pause/resume pairs are nested.
>> I needed this for powerpc allmodconfig;
>>
>> --- a/arch/powerpc/mm/book3s64/hash_tlb.c~mm-add-basic-tests-for-lazy_mmu-fix
>> +++ a/arch/powerpc/mm/book3s64/hash_tlb.c
>> @@ -30,6 +30,7 @@
>>  #include <trace/events/thp.h>
>>  
>>  DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
>> +EXPORT_SYMBOL_GPL(ppc64_tlb_batch);
>>  
>>  /*
>>   * A linux PTE was changed and the corresponding hash table entry
>> @@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tl
>>  		flush_hash_range(i, local);
>>  	batch->index = 0;
>>  }
>> +EXPORT_SYMBOL_GPL(__flush_tlb_pending);
>>  
>>  void hash__tlb_flush(struct mmu_gather *tlb)
>>  {
>> _
> 
> Oh indeed I hadn't considered that arch_{enter,leave}_lazy_mmu_mode()
> refer to those symbols on powerpc... Maybe a bit overkill to export
> those just for a test module, but I'm not sure there's a good
> alternative. Forcing LAZY_MMU_MODE_KUNIT_TEST=y is ugly as it would also
> force KUNIT=y. Alternatively we could depend on !PPC, not pretty either.

Does EXPORT_SYMBOL_IF_KUNIT() help?

> 
> - Kevin


