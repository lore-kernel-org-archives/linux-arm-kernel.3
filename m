Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185DDCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlcR8Fwn5ADV0f3lvSmAv3ffA1ULrZcSZjdY6wWbXb4=; b=BznCLpRMaCpX9K
	de9TXWtZTCI9fO8iZyQGhpHWn72Ib2i4t0j8kt7jyArO37wHV1QRK+ZWR7xBihmjiyrnURCjsnBJx
	wEPl9hZvLMqcfpH8IYDUmErmtWuUqiLDoFCOrb/cFjIrIydG6QSgc3CimbjaQltqLFwUxS/GTRzuA
	yn2H1St4V5hlNl80ykbiCue7Cg8ZIuRUGMpW4dnukFwu5KRPtMTLFS7wDvAnVIf41u9X/mIhVhcq/
	c2FbUKZ09gYESNJ9NZSJX1OzZqnkUEiCh1A7UqJHefYcMvmLugzOWDdl3IrT6Daifi51G2PHeE/dc
	j8hZ9utl00XVvTsttzRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXar-00000008q0Y-3lvh;
	Mon, 11 Aug 2025 18:50:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUyl-00000008JrJ-3Fgg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 16:02:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0293A267F;
	Mon, 11 Aug 2025 09:02:23 -0700 (PDT)
Received: from [10.1.28.163] (e137867.arm.com [10.1.28.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 271C53F738;
	Mon, 11 Aug 2025 09:02:26 -0700 (PDT)
Message-ID: <ced13246-4c00-4837-9d8a-1d140eb0bcb3@arm.com>
Date: Mon, 11 Aug 2025 17:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 5/7] arm64: entry: Refactor
 preempt_schedule_irq() check code
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-6-ruanjinjie@huawei.com>
 <44fd646c-4e31-4ca6-9e22-f715ad19e0d7@arm.com>
 <bedb35be-100b-95fb-64e4-b38edd3cd327@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <bedb35be-100b-95fb-64e4-b38edd3cd327@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_090231_854734_7529E56D 
X-CRM114-Status: GOOD (  18.95  )
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

On 06/08/2025 07:39, Jinjie Ruan wrote:

> On 2025/8/5 23:06, Ada Couprie Diaz wrote:
>> Hi Jinjie,
>>
>> On 29/07/2025 02:54, Jinjie Ruan wrote:
>>> ARM64 requires an additional check whether to reschedule on return
>>> from interrupt. So add arch_irqentry_exit_need_resched() as the default
>>> NOP implementation and hook it up into the need_resched() condition in
>>> raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
>>> the architecture specific version for switching over to
>>> the generic entry code.
>>> [...]
>> I've had some trouble reviewing this patch : on the one hand because
>> I didn't notice `arch_irqentry_exit_need_resched()` was added in
>> the common entry code, which is on me !
>> On the other hand, I felt that the patch itself was a bit disconnected :
>> we add `arch_irqentry_exit_need_resched()` in the common entry code,
>> with a default NOP, but in the same function we add to arm64,
>> while mentioning that this is for arm64's additional checks,
>> which we only implement in patch 7.
> Yes, it does.
>
>> Would it make sense to move the `arch_irqentry_exit_need_resched()`
>> part of the patch to patch 7, so that the introduction and
>> arch-specific implementation appear together ?
>> To me it seems easier to wrap my head around, as it would look like
>> "Move arm64 to generic entry, but it does additional checks : add a new
>> arch-specific function controlling re-scheduling, defaulting to true,
>> and implement it for arm64". I feel it could help making patch 7's
>> commit message clearer as well.
>>
>>  From what I gathered on the archive `arch_irqentry_exit_need_resched()`
>> being added here was suggested previously, so others might not have the
>> same opinion.
> Yes, introduce `arch_irqentry_exit_need_resched()` here may help
> understand the patch's refactoring purpose.
I can see that as well.
I shared my opinion in case it could be useful, but as I mentioned
in my reply to the cover : it's not a big issue and I'm happy for
`arch_irqentry_exit_need_resched()` to be implemented here if that
makes more sense !
>> Maybe improving the commit message and comment for this would be enough
>> as well, as per my suggestions above.
> Thank you! I'll improve the commit message and comment.
>
My pleasure !
Ada

