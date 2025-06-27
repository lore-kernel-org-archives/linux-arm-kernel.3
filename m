Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8164AC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFffsWSP9wE6BDzyHbT0IRZNUmIrPtpRMCeF7m6L65I=; b=nwmHviisXlxjJk
	eYHtHvRYtCu0oSV8On9FfyriU8K3ERdpm7SG7ffQFVenNKOX63eq2vQFKgJ5TRIuZUi/8vRY1L2Qe
	e28yodp/MOtTmoBzhzgTTWTG0Qd5JAGsQtXXayhmMfZdh+evD6AOGPpvXHo8GJPXWXAUauxHzk89r
	IMVfprbeqpXdC3Xs/LlNGUX2LAZxjwrBGgFgr8LBRjwd/5ggc/iFEyKHQv12OJZcw78gnpxFiKSVI
	Q36CIxhdLat3fA7lfnjeN9xOh8Wl+celgcjSP+PDfUVQfxvdXys3dGhbwDX4GKki7Cd9odSVcKp5y
	cG8Aj3CyjG7/AEDZahyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVENT-0000000FYuC-2tEG;
	Fri, 27 Jun 2025 19:04:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCrJ-0000000FPVz-2x0t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 17:27:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA0761A00;
	Fri, 27 Jun 2025 10:27:11 -0700 (PDT)
Received: from [10.57.30.218] (unknown [10.57.30.218])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3498F3F66E;
	Fri, 27 Jun 2025 10:27:27 -0700 (PDT)
Message-ID: <e73942ec-4c38-4c1d-a817-d8ef4d4c2c5c@arm.com>
Date: Fri, 27 Jun 2025 18:27:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] arm64: debug: remove hook registration, split
 exception entry
To: Will Deacon <will@kernel.org>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <aF69RR36vD5U2q9z@willie-the-truck>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <aF69RR36vD5U2q9z@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_102729_784411_46887EBA 
X-CRM114-Status: GOOD (  16.98  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, "Luis Claudio R . Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Will,

On 27/06/2025 16:48, Will Deacon wrote:
> Hi Ada,
>
> On Fri, Jun 20, 2025 at 10:11:54PM +0100, Ada Couprie Diaz wrote:
>> This series simplifies the debug exception entry path by removing handler
>> registration mechanisms for the debug exception handlers, a holdover from
>> the arm kernel, as well as the break and stepping handlers.
>> This moves much of the code related to debug exceptions outside of
>> `mm/fault.c` where it didn't make much sense.
>> This allows us to split the debug exception entries: going from one common
>> path per EL for all debug exceptions to a unique one per exception and EL.
>>
>> The result is a much simpler and fully static exception entry path, which
>> we tailor to the different exceptions and their constraints.
> I think this looks great, thanks. I've left Reviewed-bys on everything
> and a minor nit on the last patch.
Thanks ! Added your tag and applied the nit, I raised the possibility 
earlier
so absolutely fine with it.
> However, the linker is less
> enthusiastic than me because it fails with this series and 'allnoconfig':
>
>    ld.lld: error: undefined symbol: do_breakpoint
>    >>> referenced by entry-common.c
>    >>>               arch/arm64/kernel/entry-common.o:(el1_breakpt) in archive vmlinux.a
>    >>> referenced by entry-common.c
>    >>>               arch/arm64/kernel/entry-common.o:(el0_breakpt) in archive vmlinux.a
>
>    ld.lld: error: undefined symbol: do_watchpoint
>    >>> referenced by entry-common.c
>    >>>               arch/arm64/kernel/entry-common.o:(el1_watchpt) in archive vmlinux.a
>    >>> referenced by entry-common.c
>    >>>               arch/arm64/kernel/entry-common.o:(el0_watchpt) in archive vmlinux.a
>    make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>
> Please can you take a look?
Apologies, I knew exactly what that was : hardware breakpoints being 
behind a config,
which I failed to consider when exposing the handlers in 
`include/asm/exception.h`.

I added a static inline stub for this case for both and built 
successfully with `allnoconfig`.
> Will

I sent a v5 with the changes mentioned here and the fix for `allnoconfig`.

Thanks,
Ada

