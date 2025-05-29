Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3003C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Z50P76e+tNuj0Diftm6bTQuWVaT4SGkua5vpAss930=; b=R6lrxPFSQ+BCvD
	Akoz3vZ1hsfjZ1nL5cUzkKOAipo6h/yEbWHBuc3E14ZLl6k4AaJbw+ZR+BUdYNd5GGDdiujrWoNkb
	ML1LP+e5CaFP5h31WXEJb8ZE+j8doVOpFWXp0JSvpBjfnv91qFErer3a4o+NTsGMjFER6ki2AThkl
	l+5Co8B50o/a69a5C19raxiq276Ho51mwVFHZ01EdqtV0Fj/7vVWCT8ooaREfpUqcgPQ16ZeHJtj6
	aiyrdBqDHD/qUBhqZMj//1ye4bfyaKbcyOGXIaZn2q1pB7fXsV06s6YpoxYIOvFtu4m8OFhIVUoM9
	iE2Fb8HC1pIPa2kvY/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKalk-0000000FX7j-1V0E;
	Thu, 29 May 2025 10:45:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKajc-0000000FX0s-2ndS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:43:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 335D51424;
	Thu, 29 May 2025 03:43:21 -0700 (PDT)
Received: from [10.57.48.123] (unknown [10.57.48.123])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 756F83F673;
	Thu, 29 May 2025 03:43:36 -0700 (PDT)
Message-ID: <b055d2d3-235f-4cd3-a611-a887f9ab2a0b@arm.com>
Date: Thu, 29 May 2025 11:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: debug: split bkpt32 exception entry
To: Will Deacon <will@kernel.org>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-11-ada.coupriediaz@arm.com>
 <20250521090719.GA20168@willie-the-truck>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250521090719.GA20168@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_034340_751506_3D82FA42 
X-CRM114-Status: GOOD (  11.25  )
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

On 21/05/2025 10:07, Will Deacon wrote:

> On Mon, May 12, 2025 at 06:43:25PM +0100, Ada Couprie Diaz wrote:
>> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
>> index 94779c957b70..53f0b2281f14 100644
>> --- a/arch/arm64/kernel/debug-monitors.c
>> +++ b/arch/arm64/kernel/debug-monitors.c
>> @@ -298,6 +298,15 @@ void do_brk64(unsigned long esr, struct pt_regs *regs)
>>   }
>>   NOKPROBE_SYMBOL(do_brk64);
>>   
>> +#ifdef CONFIG_COMPAT
>> +/* BRKPT exception always traps to be handled. */
> nit: I don't understand this comment
>
> Will
We don't do any handling of BKPT in the kernel and let userspace do it, 
so I think I am stretching the meaning of "trap" a bit here to mean 
"send a SIGTRAP to userspace".
I'll keep that in mind in the future and be more precise.

However, given that `do_sp_pc_abort()` is a very similar handler and we 
don't make a note of it, I'll remove the comment : it doesn't feel 
really useful.

Thanks,
Ada


