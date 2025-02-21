Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDE6C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuJq5eduRx8QZJKlSTiISXB6moPavzJHtgOzhKN4eis=; b=hlxKM4fTXUqsTin6RLyX98ZI3s
	pXjW9wUZZRqOAq91jX55yVCAG5mcgEQ23PKjwMi3QKxDReI1nV6SlnBqkQk50t6PT7zYBP6Yi++D8
	SDpODnZAYDc8GPudyvktZxADslRoriAUYF7lJopKX2Fug6XiXjJaUNX+lqrsNuebzhUAzo1bZuOaw
	VGrFki9OGYOOxnhsuN3X0FiXAqqATMjGx/XRw1ei9AHpnbshoOI9avk7GKcXu+KC54obffQdNq7Zv
	ciu3xb2mERHuGlrJ5MBHfbB9wZPeSkiJvXKdCilhwcD6zWQ/4YpzHuicevHzK6Hi3Z/QwICg56QBO
	nrZETHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYuu-00000006g6R-423U;
	Fri, 21 Feb 2025 19:42:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYrv-00000006fit-1Fdx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:39:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74B1C169C;
	Fri, 21 Feb 2025 11:39:44 -0800 (PST)
Received: from [10.57.85.121] (unknown [10.57.85.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 463B23F59E;
	Fri, 21 Feb 2025 11:39:25 -0800 (PST)
Message-ID: <16e715ab-0d12-47e6-af01-e2da4e0609b2@arm.com>
Date: Fri, 21 Feb 2025 19:39:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: lib: Use MOPS for usercopy routines
To: Robin Murphy <robin.murphy@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tong Tiangen <tongtiangen@huawei.com>,
 James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20250218171430.28227-1-kristina.martsenko@arm.com>
 <20250218171430.28227-4-kristina.martsenko@arm.com>
 <6728bf8a-00f0-4f53-9955-c47f65cd126b@arm.com>
Content-Language: en-US
From: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>
In-Reply-To: <6728bf8a-00f0-4f53-9955-c47f65cd126b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_113927_417832_30FCFAEC 
X-CRM114-Status: GOOD (  17.15  )
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

On 20/02/2025 19:15, Robin Murphy wrote:
> On 18/02/2025 5:14 pm, Kristina Martšenko wrote:
>> --- a/arch/arm64/lib/clear_user.S
>> +++ b/arch/arm64/lib/clear_user.S
>> @@ -17,14 +17,27 @@
>>    * Alignment fixed up by hardware.
>>    */
>>   -    .p2align 4
>> -    // Alignment is for the loop, but since the prologue (including BTI)
>> -    // is also 16 bytes we can keep any padding outside the function
>>   SYM_FUNC_START(__arch_clear_user)
>>       add    x2, x0, x1
> 
> This subtlety...
> 
>> +
>> +#ifdef CONFIG_AS_HAS_MOPS
>> +    .arch_extension mops
>> +alternative_if_not ARM64_HAS_MOPS
>> +    b    .Lno_mops
>> +alternative_else_nop_endif
>> +
>> +USER(9f, setpt    [x0]!, x1!, xzr)
>> +USER(6f, setmt    [x0]!, x1!, xzr)
>> +USER(6f, setet    [x0]!, x1!, xzr)
>> +    mov    x0, #0
>> +    ret
>> +.Lno_mops:
>> +#endif
>> +
>>       subs    x1, x1, #8
>>       b.mi    2f
>> -1:
>> +
>> +1:    .p2align 4
>>   USER(9f, sttr    xzr, [x0])
>>       add    x0, x0, #8
>>       subs    x1, x1, #8
>> @@ -47,6 +60,10 @@ USER(7f, sttrb    wzr, [x2, #-1])
>>       ret
>>         // Exception fixups
>> +6:    b.cs    9f
>> +    // Registers are in Option A format
>> +    add    x0, x0, x1
>> +    b    9f
> 
> ...and then all this, is a bit hard to follow IMO. I'd be inclined to just have dedicated "mov x0, x1; ret" and "cneg x0, x1, cc; ret" fixups for the prologue and other ops, rather than entangle them with the non-MOPS flow at all. (Plus then the prologue fixup could arguably be the normal exit path as well...)

I think it's easier to follow if the logic is similar to the copy fixups.

> 
>>   7:    sub    x0, x2, #5    // Adjust for faulting on the final byte...
>>   8:    add    x0, x0, #4    // ...or the second word of the 4-7 byte case
>>   9:    sub    x0, x2, x0
>> diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
>> index 34e317907524..400057d607ec 100644
>> --- a/arch/arm64/lib/copy_from_user.S
>> +++ b/arch/arm64/lib/copy_from_user.S
>> @@ -52,6 +52,13 @@
>>       stp \reg1, \reg2, [\ptr], \val
>>       .endm
>>   +    .macro cpy1 dst, src, count
>> +    .arch_extension mops
>> +    USER_CPY(9997f, 0, cpyfprt [\dst]!, [\src]!, \count!)
>> +    USER_CPY(9996f, 0, cpyfmrt [\dst]!, [\src]!, \count!)
>> +    USER_CPY(9996f, 0, cpyfert [\dst]!, [\src]!, \count!)
>> +    .endm
>> +
>>   end    .req    x5
>>   srcin    .req    x15
>>   SYM_FUNC_START(__arch_copy_from_user)
>> @@ -62,6 +69,9 @@ SYM_FUNC_START(__arch_copy_from_user)
>>       ret
>>         // Exception fixups
>> +9996:    b.cs    9997f
>> +    // Registers are in Option A format
>> +    add    dst, dst, count
> 
> However for copies it's somewhat justified since, IIUC, MOPS aren't guaranteed to make progress if we're starting on the last byte of a page and the next page is unmapped, and thus we may still have a "try harder" requirement similar to the previous alignment fault case, is that right?

Yes, that's right.

Thanks,
Kristina

>>   9997:    cmp    dst, dstin
>>       b.ne    9998f
>>       // Before being absolutely sure we couldn't copy anything, try harder


