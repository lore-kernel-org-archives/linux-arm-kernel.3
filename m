Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9BBC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8asgZyIqtMJ68tn2aurNAQthwnaNz+FHFnlX1Gno1Ww=; b=udcMPmQhtq/y2p3KLSePVS3I7P
	BEKXANQiC+a69zf9RN/lUBZJl2dMHgNkjs7X3OsVW10nExwAW4L0dVsgSVINZQ/mo3T0+rgd8JFnx
	Ja4d+/BYuvPWqMFmiJvzkFwXG7N1zFhs3mecukzlF4kkCA8+xSvWHxKC/R3M2on9J2Cfoi/IdX9RK
	cZYLLXAWp122XI8xMC9yi+C40njgWVfAFIw1Ou0bblJnJSJY6i/BMG4IJoW6Ulp7pnUc16/aV44r3
	akQ744AvMD1gN3c7Z1OiqP3XR2BFL1yvvo0wVF6qg0jL4jrTeqg9xcM28iMbh5PWIvI0Qv63qKWP4
	LLApxvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrhL-0000000H0sn-3w00;
	Mon, 03 Aug 2026 12:23:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrhI-0000000H0sJ-3pBq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:23:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CEE5143D;
	Mon,  3 Aug 2026 05:23:08 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76E3A3F66F;
	Mon,  3 Aug 2026 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785759792; bh=12JEbYG9hbgqgLaUhSxFcqShBSphGm6qDQgrUvaTEI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YZiFnsDq6RWnHlgRYes/imJ4hWYQKPO0VXCqo6dXkw0bm3FRCvqi+0kXZlEH2HRsZ
	 H8PJ7nVSHp92tS3tLUKmt8q/KSXE8nMEU/LXPSee/7M5AuDY8UHdXccc1PlH2+7qtT
	 dEhwl195DTlq2BpmYxIB16NENOlc6nxRM/K78EJw=
Message-ID: <9a182e18-6dcf-442d-b5e8-455d0bb4fa3c@arm.com>
Date: Mon, 3 Aug 2026 13:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 15/45] arm64: entry: replace DAIF helpers with
 entry helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-16-vladimir.murzin@arm.com>
 <6af9b8a6-eadd-4914-a750-4deebd943b02@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <6af9b8a6-eadd-4914-a750-4deebd943b02@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_052312_992826_BB4428E3 
X-CRM114-Status: GOOD (  11.41  )
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

On 7/28/26 10:53, Jinjie Ruan wrote:
>> @@ -526,21 +545,32 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>>  
>> +	arm64_unmask_exc_context(NONMI_CONTEXT);
>> +
>>  	irq_enter_rcu();
>>  	do_interrupt_handler(regs, handler);
>>  	irq_exit_rcu();
>>  
>> -	arm64_exit_to_kernel_mode_preempt(regs, state);
>> +	/*
>> +	 * If pseudo-NMIs are enabled and the interrupted context had
>> +	 * IRQs unmasked, the interrupt handler will have cleared DAIF
>> +	 * and switched to PMR masking in order to handle
>> +	 * NMIs. Otherwise it would keep IF.  In both cases on return
>> +	 * we effectivly have NOIRQ_CONTEXT - keep track of it
>> +	 */
>> +	arm64_debug_exc_context(NOIRQ_CONTEXT);
>> +	arm64_exit_to_kernel_mode(regs, state, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
>>  }
> Is this a typo?
> 
> arm64_exit_to_kernel_mode_preempt(regs,
> arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
> 

Oops! Seems lost that while splitting the patch. Nice catch!

> otherwise LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

Thanks
Vladimir



