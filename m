Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FCCCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkZnWIFMTgMlEtlbQgLD0HsGvOLtVXBjP58onLTqVkg=; b=0aJSMCevtwA3iAV8BO6nlm5x4V
	Fa7uzaHI+Cshn125Tk2yQHbNPbsE+K/yeMb3yRYHPs73B81VOWSFE0LtuHkO7wOCaii8uIjC9LiAX
	T+zi3PL+d3cURSzq7iIlGuCMClXf9NDmUUhA0HHBQc0Vzf5udKhM6Ob1VhfAie+G0hEN7aD5C1T/z
	qDFMn7lOQcFYMTiOnvystBBp+aTt4GZQ7+qVycfnOpXCfI6+eS1qIwfiNJgIO0+wGOlmjN1CrHq/v
	R1A9gO/NfF5PMQgyai2MzEZnPojTaIiIIuMLGLDXTz5h6GRDj/LC274JBk1y35eTW6emP9S6lOzwg
	Jv3NfiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxJB-0000000FKaH-2hTX;
	Thu, 06 Nov 2025 10:33:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxJ8-0000000FKZv-2cFm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:33:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 260141596;
	Thu,  6 Nov 2025 02:33:26 -0800 (PST)
Received: from [10.1.34.75] (unknown [10.1.34.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9451F3F66E;
	Thu,  6 Nov 2025 02:33:26 -0800 (PST)
Message-ID: <1ac5be9f-fc05-463f-9512-74922acf8980@arm.com>
Date: Thu, 6 Nov 2025 10:33:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org
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
 <20251029100909.3381140-6-kevin.brodsky@arm.com>
 <87o6ph3xdq.ritesh.list@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <87o6ph3xdq.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_023334_759495_17AF26CB 
X-CRM114-Status: GOOD (  21.97  )
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

On 05/11/2025 04:40, Ritesh Harjani (IBM) wrote:
> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> Architectures currently opt in for implementing lazy_mmu helpers by
>> defining __HAVE_ARCH_ENTER_LAZY_MMU_MODE.
>>
>> In preparation for introducing a generic lazy_mmu layer that will
>> require storage in task_struct, let's switch to a cleaner approach:
>> instead of defining a macro, select a CONFIG option.
>>
>> This patch introduces CONFIG_ARCH_HAS_LAZY_MMU_MODE and has each
>> arch select it when it implements lazy_mmu helpers.
>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is removed and <linux/pgtable.h>
>> relies on the new CONFIG instead.
>>
>> On x86, lazy_mmu helpers are only implemented if PARAVIRT_XXL is
>> selected. This creates some complications in arch/x86/boot/, because
>> a few files manually undefine PARAVIRT* options. As a result
>> <asm/paravirt.h> does not define the lazy_mmu helpers, but this
>> breaks the build as <linux/pgtable.h> only defines them if
>> !CONFIG_ARCH_HAS_LAZY_MMU_MODE. There does not seem to be a clean
>> way out of this - let's just undefine that new CONFIG too.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/arm64/Kconfig                                 | 1 +
>>  arch/arm64/include/asm/pgtable.h                   | 1 -
>>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
>>  arch/powerpc/platforms/Kconfig.cputype             | 1 +
>>  arch/sparc/Kconfig                                 | 1 +
>>  arch/sparc/include/asm/tlbflush_64.h               | 2 --
>>  arch/x86/Kconfig                                   | 1 +
>>  arch/x86/boot/compressed/misc.h                    | 1 +
>>  arch/x86/boot/startup/sme.c                        | 1 +
>>  arch/x86/include/asm/paravirt.h                    | 1 -
>>  include/linux/pgtable.h                            | 2 +-
>>  mm/Kconfig                                         | 3 +++
>>  12 files changed, 10 insertions(+), 7 deletions(-)
> Maybe we can add this to ... ?
>
> Documentation/features/vm/lazy_mmu/arch-support.txt
>
> #
> # Feature name:          lazy_mmu mode
> #         Kconfig:       ARCH_HAS_LAZY_MMU_MODE
> #         description:   arch supports arch_{enter|flush|leave}_lazy_mmu_mode()
> #
>     -----------------------
>     |         arch |status|
>     -----------------------
>     |       arm64: |  ok  |
>     |     powerpc: |  ok  |
>     |       sparc: |  ok  |
>     |         x86: |  ok  |
>     -----------------------

That's an interesting idea but I'm not sure it really makes sense for
lazy MMU? AFAIU these arch-support.txt files are meant to help identify
which generic features an arch has support for. Lazy MMU isn't really a
feature though, in the sense that what it does is entirely defined by
the arch. This patch does introduce a generic layer, but ultimately it
remains a collection of arch hooks.

> As for this patch, the changes are mostly straight forward around the
> configs part. This looks good to me. Please feel free to add: 
>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thanks for the review!

- Kevin

