Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D100FCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 20:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7L6zmwF6yGggWJMfeGBoaeDd3ftd/sKTwPXe5q8sYhE=; b=ObbOQ92a+tKHqOnMr76vggnuDL
	PB5qGDHw1QIUMxqt9EGPcYDuJio9e6gJqwlR6VYuTwF3/Q+MGUA9IWf59MxJ4TLPA1+/nR2LGRL4U
	wZKPjCeddztyjToHAyXbMXUILSzph+GIk/jD+DmRPOiucTWmrApZDtmo9wPIzGlQH1I2OEn2LJkoV
	vhpq1mmnfV5UO8VRyu7S/ldthWUmQ7wWUQCwM6/lcRuCa9PYcGw2VYHQzh9QeBQAV5vD9V0Bel149
	e9CzrxBqgJ2zk3N/pjBV3AmUuV+T3S8JqA+toIFar0wTaAPmO7EemfAY0nBNWk/GhGiZtWJ8+Gbzb
	V+RjVY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuH0q-0000000EPxV-1YjV;
	Thu, 04 Sep 2025 20:56:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCBd-0000000CdEt-0cxy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 15:47:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F682339;
	Thu,  4 Sep 2025 08:47:35 -0700 (PDT)
Received: from [10.57.59.221] (unknown [10.57.59.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1309D3F6A8;
	Thu,  4 Sep 2025 08:47:35 -0700 (PDT)
Message-ID: <af6ea636-a5cb-4b78-aae0-ff7e7caa5e5d@arm.com>
Date: Thu, 4 Sep 2025 17:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
 <aLmq+dwZV9dyTYuq@e129823.arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <aLmq+dwZV9dyTYuq@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_084745_282493_3C7A830D 
X-CRM114-Status: GOOD (  17.34  )
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

On 04/09/2025 17:06, Yeoreum Yun wrote:
> Hi Kevin,
>
> [...]
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h              | 10 +++++++---
>>  .../include/asm/book3s/64/tlbflush-hash.h     |  9 ++++++---
>>  arch/powerpc/mm/book3s64/hash_tlb.c           | 10 ++++++----
>>  arch/powerpc/mm/book3s64/subpage_prot.c       |  5 +++--
>>  arch/sparc/include/asm/tlbflush_64.h          |  5 +++--
>>  arch/sparc/mm/tlb.c                           |  6 ++++--
>>  arch/x86/include/asm/paravirt.h               |  6 ++++--
>>  arch/x86/include/asm/paravirt_types.h         |  2 ++
>>  arch/x86/xen/enlighten_pv.c                   |  2 +-
>>  arch/x86/xen/mmu_pv.c                         |  2 +-
>>  fs/proc/task_mmu.c                            |  5 +++--
>>  include/linux/mm_types.h                      |  3 +++
>>  include/linux/pgtable.h                       |  6 ++++--
>>  mm/madvise.c                                  | 20 ++++++++++---------
>>  mm/memory.c                                   | 20 +++++++++++--------
>>  mm/migrate_device.c                           |  5 +++--
>>  mm/mprotect.c                                 |  5 +++--
>>  mm/mremap.c                                   |  5 +++--
>>  mm/vmalloc.c                                  | 15 ++++++++------
>>  mm/vmscan.c                                   | 15 ++++++++------
>>  20 files changed, 97 insertions(+), 59 deletions(-)
> I think you miss the mm/kasan/shadow.c

Ah yes that's because my series is based on v6.17-rc4 but [1] isn't in
mainline yet. I'll rebase v2 on top of mm-stable.

[1]
https://lore.kernel.org/all/0d2efb7ddddbff6b288fbffeeb10166e90771718.1755528662.git.agordeev@linux.ibm.com/

> But here, the usage is like:
>
> static int kasan_populate_vmalloc_pte()
> {
> 	...
> 	arch_leave_lazy_mmu_mode();
> 	...
> 	arch_enter_lazy_mmu_mode();
> 	...
> }
>
> Might be you can call the arch_leave_lazy_mmu_mode() with LAZY_MMU_DEFAULT
> in here since I think kasan_populate_vmalloc_pte() wouldn't be called
> nestly.

In fact in that case it doesn't matter if the section is nested or not.
We're already assuming that lazy_mmu is enabled, and we want to fully
disable it so that PTE operations take effect immediately. For that to
happen we must call arch_leave_lazy_mmu_mode(LAZY_MMU_DEFAULT). We will
then re-enable lazy_mmu, and the next call to leave() will do the right
thing whether it is nested or not.

It's worth nothing the same situation occurs in xen_flush_lazy_mmu() and
this patch handles it in the way I've just described.

I'll take care of that in v2, thanks for the heads-up!

- Kevin

