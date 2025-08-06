Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E643C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 02:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFxvkF9BIHKF9AQ41YLnx8MubWVasrWf2Iq9vvoVVYM=; b=E9/SDQZTpbVSmPPkqoHtR5/HQ+
	s6y0F5ObDsnRASOwxCBYxn5QisAyH5ohVueCpeexmq78fZcBI9zM+IMw/29Jc+H/gVgT3MUs7EcPC
	0OtatN38NKUKGuTACxTRxsyAx98PiPbI6Cw2fNlagxF5+lReAORLSgNS7AdyOrNdilBuu0WsPulvx
	/B27vSfOQXHB3e0+q5ojcEhTmPbQUdscoaCHWk0frVdGaYz7LccVDa4g5NcH5heladRtWsiYMdLBT
	WOvo3/LCrZmBaHzG0aAyp/eUJSdK0dJgQlll1VvkfVRzY5iQX5ChR16vZEgMJZ8WsoNMs9Rbz8yFU
	LtgNrk4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUGF-0000000EBxy-0XF4;
	Wed, 06 Aug 2025 02:52:15 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujUDe-0000000EBoY-2DIE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 02:49:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bxZQV4lLmz14MLW;
	Wed,  6 Aug 2025 10:45:06 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E366180B54;
	Wed,  6 Aug 2025 10:49:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 Aug 2025 10:49:21 +0800
Message-ID: <6825c4c4-2c48-db3b-55e2-97922f25897f@huawei.com>
Date: Wed, 6 Aug 2025 10:49:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 2/7] arm64: entry: Refactor the entry and exit
 for exceptions from EL1
Content-Language: en-US
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <mark.rutland@arm.com>, <puranjay@kernel.org>,
	<broonie@kernel.org>, <mbenes@suse.cz>, <ryan.roberts@arm.com>,
	<akpm@linux-foundation.org>, <chenl311@chinatelecom.cn>,
	<anshuman.khandual@arm.com>, <kristina.martsenko@arm.com>,
	<liaochang1@huawei.com>, <ardb@kernel.org>, <leitao@debian.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-3-ruanjinjie@huawei.com>
 <df50cc99-027e-4182-ba4c-9837b354a062@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <df50cc99-027e-4182-ba4c-9837b354a062@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_194934_927546_C86C0C8E 
X-CRM114-Status: GOOD (  17.50  )
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



On 2025/8/5 23:06, Ada Couprie Diaz wrote:
> Hi,
> 
> On 29/07/2025 02:54, Jinjie Ruan wrote:
> 
>> The generic entry code uses irqentry_state_t to track lockdep and RCU
>> state across exception entry and return. For historical reasons, arm64
>> embeds similar fields within its pt_regs structure.
>>
>> In preparation for moving arm64 over to the generic entry code, pull
>> these fields out of arm64's pt_regs, and use a separate structure,
>> matching the style of the generic entry code.
>>
>> No functional changes.
> As far as I understand and checked, we used the two fields
> in an exclusive fashion, so there is indeed no functional change.
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> [...]
>> diff --git a/arch/arm64/kernel/entry-common.c
>> b/arch/arm64/kernel/entry-common.c
>> index 8e798f46ad28..97e0741abde1 100644
>> --- a/arch/arm64/kernel/entry-common.c
>> +++ b/arch/arm64/kernel/entry-common.c
>> [...]
>> @@ -475,73 +497,81 @@ UNHANDLED(el1t, 64, error)
>>   static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>>   {
>>       unsigned long far = read_sysreg(far_el1);
>> +    arm64_irqentry_state_t state;
>>   -    enter_from_kernel_mode(regs);
>> +    state = enter_from_kernel_mode(regs);
> Nit: There is some inconsistencies with some functions splitting state's
> definition
> and declaration (like el1_abort here), while some others do it on the
> same line
> (el1_undef() below for example).
> In some cases it is welcome as the entry function is called after some
> other work,
> but here for example it doesn't seem to be beneficial ?

Both methods can keep the modifications to `enter_from_kernel_mode()` on
the same line as the original code, which will facilitate code review.

I think it is also fine to do it on the same line here, which can reduce
one line code, which method is better may be a matter of personal opinion.

>>       local_daif_inherit(regs);
>>       do_mem_abort(far, esr, regs);
>>       local_daif_mask();
>> -    exit_to_kernel_mode(regs);
>> +    exit_to_kernel_mode(regs, state);
>>   }
>>     static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
>>   {
>>       unsigned long far = read_sysreg(far_el1);
>> +    arm64_irqentry_state_t state;
>>   -    enter_from_kernel_mode(regs);
>> +    state = enter_from_kernel_mode(regs);
>>       local_daif_inherit(regs);
>>       do_sp_pc_abort(far, esr, regs);
>>       local_daif_mask();
>> -    exit_to_kernel_mode(regs);
>> +    exit_to_kernel_mode(regs, state);
>>   }
>>     static void noinstr el1_undef(struct pt_regs *regs, unsigned long
>> esr)
>>   {
>> -    enter_from_kernel_mode(regs);
>> +    arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
>> +
>>       local_daif_inherit(regs);
>>       do_el1_undef(regs, esr);
>>       local_daif_mask();
>> -    exit_to_kernel_mode(regs);
>> +    exit_to_kernel_mode(regs, state);
>>   }
>>
>> [...]
> Other than the small nit:
> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> 

