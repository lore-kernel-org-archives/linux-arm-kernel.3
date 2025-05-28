Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03D1C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+LnNJDdfX1knYfCerM8gkqTZrju8i3M37FPE9hKTdM=; b=x5pA+X0Es9GXpn
	mwGQ/ufL11Nb+3vj2a5XnozrsB8UH99E4AN8paG073gqewZz8PCzEnaUmJXy/RB5qF3LxNi0lWCrU
	y8ZanvT0B3Wc2gKrbghIxh/dyqqehRMrVGf5deLS2OJfWk2b0azTgf/InTQQtaiQmDhH00N3TBSfc
	WJ8cny3W4j2q1/WJF2af3njbyK6Ha9e5hLTyp21+gVpWPavqt+peLEXbF1eQbOGYXl2ft2WuUeY7K
	tsfhjWMheXp3uuyFoVEqkYt0AEmmAvIDdS+dFaxflshkTP91ipaVxQ8qL4qc+K/gT4Wwozw6MyqjJ
	DWkLP7bf3Vy7hRKDOIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHdG-0000000DN31-2Xjb;
	Wed, 28 May 2025 14:19:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHSR-0000000DKQ2-0moI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:08:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 254B91A25;
	Wed, 28 May 2025 07:08:22 -0700 (PDT)
Received: from [10.1.34.177] (e137867.arm.com [10.1.34.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A0A63F673;
	Wed, 28 May 2025 07:08:36 -0700 (PDT)
Message-ID: <ddc2fd08-1171-4ec7-9ffd-eae069984d48@arm.com>
Date: Wed, 28 May 2025 15:08:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] arm64: entry: Add entry and exit functions for
 debug exceptions
To: Will Deacon <will@kernel.org>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-6-ada.coupriediaz@arm.com>
 <20250520153619.GE18901@willie-the-truck>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250520153619.GE18901@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_070840_580522_64FFD185 
X-CRM114-Status: GOOD (  19.68  )
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

On 20/05/2025 16:36, Will Deacon wrote:

> On Mon, May 12, 2025 at 06:43:20PM +0100, Ada Couprie Diaz wrote:
>> Duplicate the `debug_exception_entry()` and `debug_exception_exit()`
> nit: it's debug_exception_enter().
Thanks,fixed for v3.
>> functions from mm/fault.c, as they are needed to split
>> the debug exceptions entry paths from the current unified one.
>> The original will be removed in a cleanup patch.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> ---
>>   arch/arm64/kernel/entry-common.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
>> index b260ddc4d3e9..92d78b329e67 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> @@ -418,6 +418,28 @@ static inline void fp_user_discard(void)
>>   	}
>>   }
>>   
>> +/*
>> + * In debug exception context, we explicitly disable preemption despite
>> + * having interrupts disabled.
>> + * This serves two purposes: it makes it much less likely that we would
>> + * accidentally schedule in exception context and it will force a warning
>> + * if we somehow manage to schedule by accident.
>> + */
>> +static void debug_exception_enter(struct pt_regs *regs)
>> +{
>> +	preempt_disable();
>> +
>> +	/* This code is a bit fragile.  Test it. */
>> +	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
>> +}
>> +NOKPROBE_SYMBOL(debug_exception_enter);
>> +
>> +static void debug_exception_exit(struct pt_regs *regs)
>> +{
>> +	preempt_enable_no_resched();
>> +}
>> +NOKPROBE_SYMBOL(debug_exception_exit);
> Could you make these externally visible (i.e. drop the 'static') so that
> you can remove the definitions from mm/fault.c at the same time? Then
> you could add the 'static' back at the end when there are no more
> external callers.
>
> Will
If you are happy with some header noise, adding `debug_exception_enter()`
and `debug_exception_exit()` to include/asm/exception.h` so that they can
be visible in `mm/fault.c` during the clean up and removing them when
done, I would much prefer doing it that way !

It felt strange to just have some duplicate code, but I didn't know
what would be acceptable.
I will make the change for v3, unless the header noise mentioned above is
an issue.

Thanks,
Ada

