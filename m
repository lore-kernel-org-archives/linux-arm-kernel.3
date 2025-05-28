Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61338C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moZDet3kPr+CVy3Dt4QLK4BT13c2GN2/ubGebRT+trg=; b=IPcD06OfyhTC5U
	PR8UkPn7Acx433GKsYQgA03l9xj6BoJCqiPOjAZSY9j3zvU8IP1dWR9AgrRJR7qUknLqk4sRIr57W
	BYXF3hieE1Q+qFw4ytt7XA0WvD4Io4T8FBLapBixCOJmYiOB4cgXAJzrmCql+HiilN2dqdLDKB5ag
	rRJkr4cn2VOEyh5YfwQYr+YeOhhD8bQBmg9/Wrl3ikKsfp7TJa2srpeGHbq8La38OUBeisTHkJl/4
	9QLQn42GQj7dKac3uwyiAictgeza6ChjZdSgc1XABVF/r1/QfhgX7Pl167MtznTxjIMnZRQ+mYmqL
	GCskMrVtqNhzIBshj9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdz-0000000Dfrl-1KAL;
	Wed, 28 May 2025 16:28:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJEl-0000000Dbyr-43mt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 16:02:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ED421A2D;
	Wed, 28 May 2025 09:02:21 -0700 (PDT)
Received: from [10.1.34.177] (e137867.arm.com [10.1.34.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DB753F673;
	Wed, 28 May 2025 09:02:36 -0700 (PDT)
Message-ID: <c91901c9-b443-429d-acbf-558322ce152b@arm.com>
Date: Wed, 28 May 2025 17:02:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] arm64: debug: call step handlers statically
To: Will Deacon <will@kernel.org>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
 <20250512174326.133905-4-ada.coupriediaz@arm.com>
 <20250520153558.GC18901@willie-the-truck>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250520153558.GC18901@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_090240_058414_A2A56B15 
X-CRM114-Status: GOOD (  11.26  )
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

On 20/05/2025 16:35, Will Deacon wrote:

> On Mon, May 12, 2025 at 06:43:18PM +0100, Ada Couprie Diaz wrote:
>> +#if CONFIG_UPROBES
> nit: this should be #ifdef and my compiler complains about that:
>
>    | arch/arm64/kernel/debug-monitors.c:172:5: warning: 'CONFIG_UPROBES' is not defined, evaluates to 0 [-Wundef]
Indeed, that's my bad.
Replacing it in v3 with an #ifndef for the stand-in.
>> +		return uprobe_singlestep_handler(regs, esr);
>> +#else
>> +		return DBG_HOOK_ERROR;
>> +#endif
> It would probably be cleaner to have a static inline definition of
> uprobe_singlestep_handler() when !CONFIG_UPROBES that just returns
> DBG_HOOK_ERROR.
>
>>   	}
>>   
>> -	return retval;
>> +#ifdef CONFIG_KGDB
>> +	return kgdb_singlestep_handler(regs, esr);
>> +#else
>> +	return DBG_HOOK_ERROR;
>> +#endif
> Similarly here.

That's fair, it does make the function itself very clear !

Replaced the #ifdefs in the function with static inline stand-ins
when the configs are disabled for v3.

> Will

Thanks,

Ada


