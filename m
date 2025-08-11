Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7C7CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6RTMrZnaIbX1ueF7E5f+xh8fnO5JUrQL7kVXz9umlc=; b=Xwalgl0Vfjq5SD
	3WekL4A3k94mJog6pSDY9mF7fwDegWnNCMGTYYMU9ONkSoCQDzc4O8otLHCj/XozqEHkm82f6F5gh
	fadsjxbpo3946aPs2cfmEAewyoMSDuDpGZx/3vOJl8sZn5ZHSlKcxpbwVMJSAhDIBIGe6rR+Ia6rl
	SQbJBUIt0tS29FD4STUH1iJ7tK/ev7lMW9htVqPxrPQV+48/whEdHQDI12J8iU/m9q1C6otwvjyUC
	YmWxjBbOtXfaSqardXon8g5O0QQpWOh5ZZiPu+dSYt/GpKJ2mSUvrJo3fKHUP2lZt4PKJj0RQyE4O
	E9hrh+/vt1u82VbIE7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaah-000000099Nx-31hZ;
	Mon, 11 Aug 2025 22:02:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUyR-00000008Jlk-2cNm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 16:02:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDC66266C;
	Mon, 11 Aug 2025 09:01:59 -0700 (PDT)
Received: from [10.1.28.163] (e137867.arm.com [10.1.28.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0D163F738;
	Mon, 11 Aug 2025 09:02:03 -0700 (PDT)
Message-ID: <4b18c96b-116b-417d-ab98-eb81b80c9897@arm.com>
Date: Mon, 11 Aug 2025 17:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 2/7] arm64: entry: Refactor the entry and exit
 for exceptions from EL1
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-3-ruanjinjie@huawei.com>
 <df50cc99-027e-4182-ba4c-9837b354a062@arm.com>
 <6825c4c4-2c48-db3b-55e2-97922f25897f@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <6825c4c4-2c48-db3b-55e2-97922f25897f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_090211_749053_68494FD6 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: mark.rutland@arm.com, sstabellini@kernel.org, puranjay@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, liaochang1@huawei.com, oleg@redhat.com, kristina.martsenko@arm.com, linux-kernel@vger.kernel.org, broonie@kernel.org, chenl311@chinatelecom.cn, xen-devel@lists.xenproject.org, leitao@debian.org, ryan.roberts@arm.com, akpm@linux-foundation.org, mbenes@suse.cz, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 06/08/2025 03:49, Jinjie Ruan wrote:

> On 2025/8/5 23:06, Ada Couprie Diaz wrote:
>> Hi,
>>
>> On 29/07/2025 02:54, Jinjie Ruan wrote:
>>
>>> [...]
>>> diff --git a/arch/arm64/kernel/entry-common.c
>>> b/arch/arm64/kernel/entry-common.c
>>> index 8e798f46ad28..97e0741abde1 100644
>>> --- a/arch/arm64/kernel/entry-common.c
>>> +++ b/arch/arm64/kernel/entry-common.c
>>> [...]
>>> @@ -475,73 +497,81 @@ UNHANDLED(el1t, 64, error)
>>>    static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>>>    {
>>>        unsigned long far = read_sysreg(far_el1);
>>> +    arm64_irqentry_state_t state;
>>>    -    enter_from_kernel_mode(regs);
>>> +    state = enter_from_kernel_mode(regs);
>> Nit: There is some inconsistencies with some functions splitting state's
>> definition
>> and declaration (like el1_abort here), while some others do it on the
>> same line
>> (el1_undef() below for example).
>> In some cases it is welcome as the entry function is called after some
>> other work,
>> but here for example it doesn't seem to be beneficial ?
> Both methods can keep the modifications to `enter_from_kernel_mode()` on
> the same line as the original code, which will facilitate code review.
>
> I think it is also fine to do it on the same line here, which can reduce
> one line code, which method is better may be a matter of personal opinion.
Fair point !
Then, as mentioned previously, I'm happy to leave my Reviewed-By.
>>>        local_daif_inherit(regs);
>>>        do_mem_abort(far, esr, regs);
>>>        local_daif_mask();
>>> -    exit_to_kernel_mode(regs);
>>> +    exit_to_kernel_mode(regs, state);
>>>    }
>>>      static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
>>>    {
>>>        unsigned long far = read_sysreg(far_el1);
>>> +    arm64_irqentry_state_t state;
>>>    -    enter_from_kernel_mode(regs);
>>> +    state = enter_from_kernel_mode(regs);
>>>        local_daif_inherit(regs);
>>>        do_sp_pc_abort(far, esr, regs);
>>>        local_daif_mask();
>>> -    exit_to_kernel_mode(regs);
>>> +    exit_to_kernel_mode(regs, state);
>>>    }
>>>      static void noinstr el1_undef(struct pt_regs *regs, unsigned long
>>> esr)
>>>    {
>>> -    enter_from_kernel_mode(regs);
>>> +    arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
>>> +
>>>        local_daif_inherit(regs);
>>>        do_el1_undef(regs, esr);
>>>        local_daif_mask();
>>> -    exit_to_kernel_mode(regs);
>>> +    exit_to_kernel_mode(regs, state);
>>>    }
>>>
>>> [...]
>> Other than the small nit:
>> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

