Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D151C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzwBUHMTTLY4KfyYe7Oqmpldgz8NbjWW+e3wXEyxA+U=; b=iHADIya6U4zrQi
	0VTqDUuUjxjYMQZmG/4YbU3o9ntW0c9E+41Va7P83yWUeeUnFDuyaTilyTtwesSNq/lwzzV+CapuW
	iLSKsR0Q+kCmLTIlanLIXQno3OK1+UZDJwnpZariQ6sZUKWWgzSVCideDoWMvusSAlt7NF4MPJWCM
	DJBDekmd4Ovl042TeSolrCTLAbCc7IAak51qT9AlCQm0HoHz4bg4fyazisrGGZsruQqCJZmbMyKRi
	4Q0qwHmBfcK9AYyuzd8eeskspaIYCAdmy+rwGHLLIKKYl5lRpQCLE3WZTTeNUltjgrCTj8QKlyFwx
	wMlG6IspNfy2rGc8DD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJx5-0000000Djgl-1HoN;
	Wed, 28 May 2025 16:48:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJqd-0000000DizC-1qzv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 16:41:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C4B11FC7;
	Wed, 28 May 2025 09:41:30 -0700 (PDT)
Received: from [10.1.34.177] (e137867.arm.com [10.1.34.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EE7F3F673;
	Wed, 28 May 2025 09:41:45 -0700 (PDT)
Message-ID: <7d856e23-2697-4ba1-ab80-a658a9b84d9a@arm.com>
Date: Wed, 28 May 2025 17:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] arm64: debug: remove debug exception
 registration infrastructure
To: Will Deacon <will@kernel.org>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-12-ada.coupriediaz@arm.com>
 <20250521093817.GA20245@willie-the-truck>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB
Organization: Arm Ltd.
In-Reply-To: <20250521093817.GA20245@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_094147_531865_C096D1D3 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 21/05/2025 10:38, Will Deacon wrote:

> On Mon, May 12, 2025 at 06:43:26PM +0100, Ada Couprie Diaz wrote:
>> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
>> index 50d7a6a75f45..ce20f46e08cb 100644
>> --- a/arch/arm64/kernel/traps.c
>> +++ b/arch/arm64/kernel/traps.c
>> @@ -1101,29 +1101,5 @@ int ubsan_brk_handler(struct pt_regs *regs, unsigned long esr)
>>   }
>>   #endif
>>   
>> -/*
>> - * Initial handler for AArch64 BRK exceptions
>> - * This handler only used until debug_traps_init().
>> - */
>> -int __init early_brk64(unsigned long addr, unsigned long esr,
>> -		struct pt_regs *regs)
>> -{
>> -#ifdef CONFIG_CFI_CLANG
>> -	if (esr_is_cfi_brk(esr))
>> -		return cfi_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
>> -#endif
>> -#ifdef CONFIG_KASAN_SW_TAGS
>> -	if ((esr_brk_comment(esr) & ~KASAN_BRK_MASK) == KASAN_BRK_IMM)
>> -		return kasan_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
>> -#endif
>> -#ifdef CONFIG_UBSAN_TRAP
>> -	if ((esr_brk_comment(esr) & ~UBSAN_BRK_MASK) == UBSAN_BRK_IMM)
>> -		return ubsan_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
>> -#endif
>> -	return bug_brk_handler(regs, esr) != DBG_HOOK_HANDLED;
> The early bug handler is now only called if the brk immediate matches,
> but I couldn't spot any problems with that.

Correct, as far as I can tell the behaviour is unchanged for a 
fall-through :
`bug_brk_handler()` would have called `report_bug()`, which would
not have found a non-BUG BRK and bailed early with BUG_TRAP_TYPE_NONE,
leading `bug_brk_handler()` to return `DBG_HOOK_ERROR`.

Now, we would return `DBG_HOOK_ERROR` anyway if it's not an immediate we 
know how to handle. (This also seems to match better with the 
expectations of the comment in `is_valid_bugaddr()`, in `kernel/traps.c` !)

> Will

Happy to have my logic checked or add a mention in a commit message
(either this one, or patch 02 ?)

Thanks,
Ada


