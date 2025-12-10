Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D705D3C536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 12:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7U6r9XhiLjPQs0OMzhMZM895UJPCl1Ah3Wxg+R9efm8=; b=tFVxwOr3iKdYu+EBXJte2BOR7U
	kOWeQuckhSb2ym6Im9JzTIMqOvPWtg7PJzIki2GunhPwYmiF5klYV31VLPy3yM0cg1R1m+bM2F1CY
	43ptAYRsfenbEX/rZcGBOpoCV+HP9SAQeksGd3nswQfaf0W2O99qe1U3u9fuI8LpYITQ3r2CvU4CB
	zKTsafUp5/wcL66359FPMy9Usm0bTaYIjLMz8j8D8c6pw9OL+Pu4v3YaWi2LX9//rZL+6YxWtdMpF
	FFzedVPUWHyEOW9HKrymb9OpiPkeMST7IUSvVwjVYB/JwvQsvAxg2aAsCTntM5fDd1g7C7jOUboje
	YNqE7LoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTJK9-0000000FQMu-3aps;
	Wed, 10 Dec 2025 12:29:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTJK7-0000000FQMR-1YRi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 12:29:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C2FE153B;
	Wed, 10 Dec 2025 04:29:29 -0800 (PST)
Received: from [10.57.90.205] (unknown [10.57.90.205])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FA123F73B;
	Wed, 10 Dec 2025 04:29:34 -0800 (PST)
Message-ID: <eb583fda-cbd1-4ef2-900a-a86e08a0b5d3@arm.com>
Date: Wed, 10 Dec 2025 12:29:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] arm64: Replace TLB invalidation preprocessor macros
 with C functions
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250711161732.384-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_042939_458748_872ABBE8 
X-CRM114-Status: GOOD (  14.93  )
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

On 11/07/2025 17:17, Will Deacon wrote:
> Hi all,
> 
> I cooked this series following a complaint from Linus back in March
> about our range-based TLB invalidation macro after we fixed an
> over-invalidation bug thanks to incorrect handling of its arguments:
> 
>   https://lore.kernel.org/all/CAHk-=wgiX0q0WCL+SFwVCYtG7JR3=2Rshse-5J3AO2Y4AgT7Jw@mail.gmail.com/
> 
> Once I started trying to rework the range macro into a C function, I
> spotted a few other opportunities for cleanup and so I've ended up with
> this series.
> 
> Testing and feedback welcome.

Hi Will,

Did this go anywhere/are you planning to post a new version? There are a couple
of other cleanups I'd like to do in this area, and also I'd like to add tlbip
support. But I don't want to spend time on it if the baseline is going to
drastically change.

If you're not planning a v2, perhaps I could have a go then extend for the
extras I want to do?

Thanks,
Ryan


> 
> Cheers,
> 
> Will
> 
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Marc Zyngier <maz@kernel.org>
> 
> --->8
> 
> Will Deacon (10):
>   arm64: mm: Introduce a C wrapper for by-level TLB invalidation helpers
>   arm64: mm: Introduce a C wrapper for by-range TLB invalidation helpers
>   arm64: mm: Implicitly invalidate user ASID based on TLBI operation
>   arm64: mm: Remove unused 'tlbi_user' argument from
>     __flush_tlb_range_op()
>   arm64: mm: Re-implement the __tlbi_level macro in C
>   arm64: mm: Simplify __TLBI_RANGE_NUM() macro
>   arm64: mm: Push __TLBI_VADDR() into __tlbi_level()
>   arm64: mm: Inline __TLBI_VADDR_RANGE() into __tlbi_range()
>   arm64: mm: Simplify __flush_tlb_range_limit_excess()
>   arm64: mm: Re-implement the __flush_tlb_range_op macro in C
> 
>  arch/arm64/include/asm/tlbflush.h | 230 ++++++++++++++++++------------
>  arch/arm64/kernel/sys_compat.c    |   2 +-
>  arch/arm64/kvm/hyp/nvhe/mm.c      |   2 +-
>  arch/arm64/kvm/hyp/pgtable.c      |   4 +-
>  4 files changed, 140 insertions(+), 98 deletions(-)
> 


