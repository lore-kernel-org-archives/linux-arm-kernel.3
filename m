Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C337FC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 07:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHbaLa1p4qZyPhPEnTq8y5p/uCoZ0EF+Ce12DX6d5ec=; b=k9VGTGri3nrLeYFCq8RzAxO/vF
	YSkJqnl1yQ7hpUH1kzHg057mqv089s6DNI2GrtVq0wcwfAgJl+3O/yNio4I1K5lhosaYsqLP6v4yK
	melKgfTwuMn1cV9RUTud/sxl/o/wOM1i3NZmuK92S8Z+z1JElJ3cRxKH+3RKNTd9p99oDoF/Zhs0L
	l4QRWPKRN6JPW1NuNOm1pFHNDEAwNjlKsd4Z/rBYarmCu3rXWAamMKQyxPxJ0U527Zy2M3Hu4J6/b
	ZnknR2Xm8mQs74qWv1KsiBu3PpOL0qrJf7AD8PX0R6c1dvnSspiCNoIRk8Tk4Bj0oqAsuOC8WUsjR
	fbJG6YuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujYDg-0000000ETYZ-3s2a;
	Wed, 06 Aug 2025 07:05:52 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujY79-0000000ESIM-35sA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 06:59:09 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bxgxp47LNz14MD9;
	Wed,  6 Aug 2025 14:54:06 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C2CAE140155;
	Wed,  6 Aug 2025 14:59:02 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 6 Aug 2025 14:59:01 +0800
Message-ID: <8972d8b9-ced3-f207-9c00-91b544d8ecc8@huawei.com>
Date: Wed, 6 Aug 2025 14:59:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v7 7/7] arm64: entry: Switch to generic IRQ entry
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
 <20250729015456.3411143-8-ruanjinjie@huawei.com>
 <fb0b7a92-09e8-41b2-9ae7-09fb9b453961@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <fb0b7a92-09e8-41b2-9ae7-09fb9b453961@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_235908_094801_DD5E932D 
X-CRM114-Status: GOOD (  40.85  )
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



On 2025/8/5 23:07, Ada Couprie Diaz wrote:
> Hi Jinjie,
> 
> The code changes look good to me, just a small missing clean up I believe.
> 
> On 29/07/2025 02:54, Jinjie Ruan wrote:
> 
>> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
>> to use the generic entry infrastructure from kernel/entry/*.
>> The generic entry makes maintainers' work easier and codes
>> more elegant.
>>
>> Switch arm64 to generic IRQ entry first, which removed duplicate 100+
>> LOC. The next patch serise will switch to generic entry completely later.
>> Switch to generic entry in two steps according to Mark's suggestion
>> will make it easier to review.
> 
> I think the commit message could be clearer, especially since now this
> series
> only moves arm64 to generic IRQ entry and not the complete generic entry.
> 
> What do you think of something like below ? It repeats a bit less and I
> think
> it helps understanding what is going on in this specific commit, as you
> already
> have details on the larger plans in the cover.
> 
>     Currently, x86, Riscv and Loongarch use the generic entry code,
> which makes
>     maintainer's work easier and code more elegant.
>     Start converting arm64 to use the generic entry infrastructure
>     from kernel/entry/* by switching it to generic IRQ entry, which
> removes 100+
>     lines of duplicate code.
>     arm64 will completely switch to generic entry in a later series.
> 

Yes, this is more concise and accurate, and make the motivation more
clearer.

>> The changes are below:
>>   - Remove *enter_from/exit_to_kernel_mode(), and wrap with generic
>>     irqentry_enter/exit(). Also remove *enter_from/exit_to_user_mode(),
>>     and wrap with generic enter_from/exit_to_user_mode() because they
>>     are exactly the same so far.
> Nit : "so far" can be removed
>>   - Remove arm64_enter/exit_nmi() and use generic
>> irqentry_nmi_enter/exit()
>>     because they're exactly the same, so the temporary arm64 version
>>     irqentry_state can also be removed.
>>
>>   - Remove PREEMPT_DYNAMIC code, as generic entry do the same thing
>>     if arm64 implement arch_irqentry_exit_need_resched().
> This feels unrelated, given that the part that needs
> `arch_irqentry_exit_need_resched()`
> is called whether or not PREEMPT_DYNAMIC is enabled ?

Yes, the language here needs to be reorganized in conjunction with your
comments from the fifth patch.

> 
> Given my comments on patch 5, I feel that the commit message should mention
> explicitly the implementation of `arch_irqentry_exit_need_resched()` and
> why,
> even though it was already mentioned in patch 5.
> (This is what I was referencing in patch 5 : as I feel it's useful to
> mention again
> the reasons when implementing it, it doesn't feel too out of place to
> introduce
> the generic part at the same time. But again, I might be wrong here.)
> 
> Then you can have another point explaining that
> `raw_irqentry_exit_cond_resched()`
> and the PREEMPT_DYNAMIC code is removed because they are identical to the
> generic entry code, similarly to your other points.
>> Tested ok with following test cases on Qemu virt platform:
>>   - Perf tests.
>>   - Different `dynamic preempt` mode switch.
>>   - Pseudo NMI tests.
>>   - Stress-ng CPU stress test.
>>   - MTE test case in
>> Documentation/arch/arm64/memory-tagging-extension.rst
>>     and all test cases in tools/testing/selftests/arm64/mte/*.
> Nit : I'm not sure if the commit message is the best place for this,
> given you
> already gave some details in the cover ?
> But I don't have much experience here, so I'll leave it up to you and
> others !

Yes, this can be removed as the cover letter already has it.

>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> [...]
>> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
>> index db3f972f8cd9..1110eeb21f57 100644
>> --- a/arch/arm64/kernel/signal.c
>> +++ b/arch/arm64/kernel/signal.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/cache.h>
>>   #include <linux/compat.h>
>>   #include <linux/errno.h>
>> +#include <linux/irq-entry-common.h>
>>   #include <linux/kernel.h>
>>   #include <linux/signal.h>
>>   #include <linux/freezer.h>
>> @@ -1576,7 +1577,7 @@ static void handle_signal(struct ksignal *ksig,
>> struct pt_regs *regs)
>>    * the kernel can handle, and then we build all the user-level
>> signal handling
>>    * stack-frames in one go after that.
>>    */
>> -void do_signal(struct pt_regs *regs)
>> +void arch_do_signal_or_restart(struct pt_regs *regs)
> Given that `do_signal(struct pt_regs *regs)` is defined in
> `arch/arm64/include/asm/exception.h`,
> and that there remains no users of `do_signal()`, I think it should be
> removed there.

Good catch! I'll remove it.

> 
> Thanks,
> Ada
> 

