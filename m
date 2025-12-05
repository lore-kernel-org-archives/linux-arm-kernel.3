Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EFCD2F7EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 12:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5/J1xrrQ4v7y7EnDQHi7nPKin/NlY5YRzNA1rygu68=; b=XWZNvyIoMuwJsgt6CpcUbHlf+P
	oHvVdgyi8I6CCUH2G44IeO/8x7V7AO8IGXB5ktzGsUeEgrJfoSQozlZoqL25pmKepgt2fTqT5PJ+A
	Svgw3fqI9ztuxl3BaJO87XzEJD72luClYqAksPs6VEu+vN4qRxbwjBeOzu8F2TIKZxNqFBjWm2bqM
	m+suLQv3jgvRz5qmP759EJFrYebXb9xUJfUq+1b+30bqTwb28e1xOBKBPLMuymeQgWQ44sM4HDc7a
	NuYnmWm7zeYO3PtnlQOcEVO55BHc9ZYSRfxlNK0fpzI4fuEexumUaQjFyjsU6fJ06ZxJNA9dmlOeQ
	dvLIj7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRVMI-00000009VC5-0EuN;
	Fri, 05 Dec 2025 12:56:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRVMF-00000009VBi-2Fkl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 12:56:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D48521575;
	Fri,  5 Dec 2025 04:56:14 -0800 (PST)
Received: from [10.44.160.68] (e126510-lin.lund.arm.com [10.44.160.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 903273F59E;
	Fri,  5 Dec 2025 04:56:14 -0800 (PST)
Message-ID: <89e76670-4a7b-46b6-ba55-d225dbb68cbd@arm.com>
Date: Fri, 5 Dec 2025 13:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
 <2dfd54d7-fe2a-4921-85ff-a581392a777a@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <2dfd54d7-fe2a-4921-85ff-a581392a777a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_045623_729005_EC9139CA 
X-CRM114-Status: GOOD (  19.35  )
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

On 04/12/2025 07:23, Anshuman Khandual wrote:
>> [...]
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 8ff6fdb4b13d..24fdb6f5c2e1 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -230,39 +230,140 @@ static inline int pmd_dirty(pmd_t pmd)
>>   * (In practice, for user PTE updates, the appropriate page table lock(s) are
>>   * held, but for kernel PTE updates, no lock is held). The mode is disabled in
>>   * interrupt context and calls to the lazy_mmu API have no effect.
>> - * Nesting is not permitted.
>> + *
>> + * The lazy MMU mode is enabled for a given block of code using:
>> + *
>> + *   lazy_mmu_mode_enable();
>> + *   <code>
>> + *   lazy_mmu_mode_disable();
>> + *
>> + * Nesting is permitted: <code> may itself use an enable()/disable() pair.
>> + * A nested call to enable() has no functional effect; however disable() causes
>> + * any batched architectural state to be flushed regardless of nesting. After a
> Just wondering if there is a method for these generic helpers to ensure that platform
> really does the required flushing on _disable() or the expected platform semantics is
> only described via this comment alone ?

From the generic layer's perspective, flushing means calling
arch_flush_lazy_mmu_mode(). Like the other arch_*_lazy_mmu_mode helpers,
the actual semantics is unspecified - an arch could choose not to do
anything on flush if that's not required for page table changes to be
visible. There is actually an example of this in the kpkeys page table
hardening series [1] (this isn't doing any batching so there is nothing
to flush either).

[1]
https://lore.kernel.org/linux-hardening/20250815085512.2182322-19-kevin.brodsky@arm.com/

>> + * call to disable(), the caller can therefore rely on all previous page table
>> + * modifications to have taken effect, but the lazy MMU mode may still be
>> + * enabled.
>> + *
>> + * In certain cases, it may be desirable to temporarily pause the lazy MMU mode.
>> + * This can be done using:
>> + *
>> + *   lazy_mmu_mode_pause();
>> + *   <code>
>> + *   lazy_mmu_mode_resume();
>> + *
>> + * pause() ensures that the mode is exited regardless of the nesting level;
>> + * resume() re-enters the mode at the same nesting level. Any call to the
>> + * lazy_mmu_mode_* API between those two calls has no effect. In particular,
>> + * this means that pause()/resume() pairs may nest.
>> + *
>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>> + * currently enabled.
> Just wondering - could a corresponding test be included probably via KUNIT_TEST
> to ensure the above described semantics are being followed.

Checking that is_lazy_mmu_mode_active() returns the right value at
different call depths should be doable, yes. I suppose that could live
in some file under mm/tests/ (doesn't exist yet but that's the preferred
approach for KUnit tests).

- Kevin

