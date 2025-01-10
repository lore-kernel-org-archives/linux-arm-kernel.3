Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB43E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEGFvFEjeM3iTMV//DBspEI97aSXsu+WT+P2HkyrtWg=; b=PzaoNCUnL76YrZyE731KucJ0l/
	pMyBDn+jqiG5viml2Wd9JJWUQJCbXPe+kGDhM5dSnGOAv1ZY+R7i2+HaQRLzVU1aSKLk5hGuMzQKe
	kGzN9fsqFfgVNFEKZgyU8/xB+N5tgzUlBb5TPx6exEpQ7Fm0uZQIKgCdl8eBHf6WvLnqy3AEit46h
	onLp3U+T3XcfahJ2apRdQzsWZTFnLDIh8h7Y7IIO1OVznvjA9Xlbkr6/bNrKApmoe72DtgAdxHnYA
	mmfIC4hUbf9QtzsVG9lbSgiaZL0mSjc0wIENyqFogjbrnhLfQF7K3INj4DRDYwSfXmjIaVs0nEV7D
	tPOIAe4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFhl-0000000Fan1-3ubF;
	Fri, 10 Jan 2025 14:09:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFdh-0000000FZwv-3WQb
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 14:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HEGFvFEjeM3iTMV//DBspEI97aSXsu+WT+P2HkyrtWg=; b=oHqxputYbubnqN8rxaOrGs9ubZ
	wuSUENTF4V+GEEqZQNihgEXYWCmWnKnQHxCZhiLjMtzkFPus9fPYbvCYslSXdbqowLltu92IWVV2R
	efs1FMnBn9RkT/650qUEDh/4xD6pA6nvmncqQm9zw/PU+n41Zz8sb+ODe2sebFvWvwzfV1hGRIrtw
	0V2TP0zKIcgA3CdFw2pm5sPhaHHfB2YYSIChk+gkQS86QjH8O0abM5wuR6wMiv2D15ta8oTG0u/yb
	15ZmkSH4JuzJFpeQ3K/dxivnpSYq6CYO15H2uHk+sH5/td2gyWcLZUkV47J3V4vglLg3RObrGXlhe
	RLIKKELQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFde-00000009nCp-2yXe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 14:05:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68537204C;
	Fri, 10 Jan 2025 06:05:52 -0800 (PST)
Received: from [10.44.160.93] (e126510-lin.lund.arm.com [10.44.160.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E17B63F59E;
	Fri, 10 Jan 2025 06:05:18 -0800 (PST)
Message-ID: <705c7fec-8e3c-4d4d-b3c2-c1f75d10db42@arm.com>
Date: Fri, 10 Jan 2025 15:05:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 13/15] arm64: mm: Guard page table writes with
 kpkeys
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org
References: <20250108103250.3188419-1-kevin.brodsky@arm.com>
 <20250108103250.3188419-14-kevin.brodsky@arm.com>
 <6b4c4abb-8d53-4b17-8a1c-1d28fb4d5f88@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <6b4c4abb-8d53-4b17-8a1c-1d28fb4d5f88@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_140527_108707_840C9792 
X-CRM114-Status: GOOD (  23.56  )
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

On 09/01/2025 08:17, Qi Zheng wrote:
> [...]
>
>> @@ -314,6 +315,7 @@ static inline pte_t pte_clear_uffd_wp(pte_t pte)
>>     static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>>   {
>> +    guard(kpkeys_hardened_pgtables)();
>>       WRITE_ONCE(*ptep, pte);
>>   }
>>   @@ -758,6 +760,7 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>>       }
>>   #endif /* __PAGETABLE_PMD_FOLDED */
>>   +    guard(kpkeys_hardened_pgtables)();
>>       WRITE_ONCE(*pmdp, pmd);
>>         if (pmd_valid(pmd)) {
>
> I noticed a long time ago that set_pte/set_pmd/... was implemented
> separately by each architecture without a unified entry point. This
> makes it difficult to add some hooks for them.
>
> Taking set_pte() as an example, is it possible to do the following:
>
> 1) add a generic set_pte() in include/asm-generic/tlb.h (Or other more
>    appropriate files)
>
> static inline void set_pte(pte_t *ptep, pte_t pte)
> {
>     arch_set_pte(ptep, pte);
> }
>
> 2) let each architecture include this file and rename the original
>    set_pte() to arch_set_pte().
>
> 3) then we can add hooks for generic set_pte():
>
> static inline void set_pte(pte_t *ptep, pte_t pte)
> {
>     guard(kpkeys_hardened_pgtables)();
>     arch_set_pte(ptep, pte);
> }
>
> 4) in this way, the architecture that supports
>    ARCH_HAS_KPKEYS_HARDENED_PGTABLES only needs to implement
>    the kpkeys_hardened_pgtables(), otherwise it is no-op.

Thanks for chiming in, it is an interesting idea for sure. I think the
issue here might be the benefit/churn ratio, because this would simply
be adding a layer of (generic) function calls without unifying any
existing arch code. Unfortunately, unlike the pagetable_alloc/tlb stuff,
the majority of what happens in the page table modifiers is arch-specific.

For set_p*(), we could potentially have it call a generic __set_p*()
that does a WRITE_ONCE(), which is what most architectures do (in
addition to various other things, like DSB/ISB on arm64). Adding the
kpkeys_hardened_pgtables guard there would be better, as it reduces the
"privileged" window to just the write itself. However for the other
modifiers, say ptep_get_and_clear(), the implementation seems to vary
wildly between arch's, including the atomic operation itself. Any
unification of those seems therefore difficult.

That said, I'd be happy to look into adding that generic layer on top
(i.e. generic set_pte() calls arch_set_pte()) if there is enough
consensus that the churn is justified. We could potentially do a mix of
both as well (arch-defined set_pte() calls generic __set_pte(), while
generic ptep_get_and_clear() calls arch_ptep_get_and_clear()).

- Kevin

