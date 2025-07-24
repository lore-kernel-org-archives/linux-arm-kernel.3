Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FD8C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5e9GdrSiAi3W0NjEw2xl5ZtcP+fIQMWi0aeCbO+XdI=; b=pevMXJ0gvT74Mz
	txA2x8Ij7H910LzJtMPTC/adyX4w5ZbqoJe7py/Pn3u+XaoQFmQkJw5QVjxFhUeKQ8o+T7BGJcVoD
	LnrGdlxB90AxsIu75vRWkoLnaBUcVrgrElK5BzmdEH33Q5OAdT5Fpm9hjMJBSSgoKcjIBEKcPQk6t
	bsNrRI51qNNQ+3tAzdg0Nt73Rgj1wMFSwyklo/xDnRz50nzkTTa+fHa9Wsk4QcMJkW5ZhYA4jeoNv
	toTLVEA8yV/Kb7UU8rNxpx7lN+DrLaJUjMtxJf4ScCSaQVeXsUvaLK48XEJOYDqfL3r8clP0Nua5k
	IQfXW2GLzLF9bwSGgHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0o5-00000008DlQ-2GQ4;
	Thu, 24 Jul 2025 18:36:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezr8-000000088ur-3adj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 17:35:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22E3B1A00;
	Thu, 24 Jul 2025 10:35:37 -0700 (PDT)
Received: from [10.57.3.78] (unknown [10.57.3.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A0823F6A8;
	Thu, 24 Jul 2025 10:35:41 -0700 (PDT)
Message-ID: <4c1c3566-5a58-4363-87ad-0bb4441edeba@arm.com>
Date: Thu, 24 Jul 2025 18:35:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(),
 call_on_irq_stack()
To: Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>
References: <20250718142814.133329-1-ada.coupriediaz@arm.com>
 <82AA504A-E3D8-479E-A625-306004E1850F@amazon.com>
 <aH-sSqC177IM-nbi@willie-the-truck>
 <CAMj1kXGv8cV=kfDBw=29NUX6rYtSUPJJ9HUXVNK+7R8aB5b0wg@mail.gmail.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <CAMj1kXGv8cV=kfDBw=29NUX6rYtSUPJJ9HUXVNK+7R8aB5b0wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_103546_990779_655239C5 
X-CRM114-Status: GOOD (  26.36  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, "Prundeanu, Cristian" <cpru@amazon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 23/07/2025 02:20, Ard Biesheuvel wrote:

> (cc Sami again)
>
> On Wed, 23 Jul 2025 at 01:20, Will Deacon <will@kernel.org> wrote:
>> On Mon, Jul 21, 2025 at 09:42:23PM +0000, Prundeanu, Cristian wrote:
>>> On Fri, Jul 18, 2025 at 03:28:14PM +0100, Ada Couprie Diaz wrote:
>>>
>>>> Completely mask DAIF in `cpu_switch_to()` and restore it when returning.
>>>> Do the same in `call_on_irq_stack()`, but restore and mask around
>>>> the branch.
>>>> Mask DAIF even if CONFIG_SHADOW_CALL_STACK is not enabled for consistency
>>>> of behaviour between all configurations.
>>>>
>>>> Introduce and use an assembly macro for saving and masking DAIF,
>>>> as the existing one saves but only masks IF.
>>>>
>>>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>>> Reported-by: Cristian Prundeanu <cpru@amazon.com>
>>>> Fixes: 59b37fe52f49955791a460752c37145f1afdcad1 ("arm64: Stash shadow stack pointer in the task struct on interrupt")
>>> Confirming this fixes the spontaneous reboot previously observed when
>>> enabling both pseudo-NMI (irqchip.gicv3_pseudo_nmi=1) and shadow call
>>> stack (CONFIG_SHADOW_CALL_STACK=y). Tested both on kernel 6.16-rc7 and
>>> legacy kernel 6.8 where the issue was initially observed.
>>>
>>> Tested-by: Cristian Prundeanu <cpru@amazon.com>
>> Ah, I hadn't appreciated from the cover letter that this was fixing a
>> real issue seen in the field. It all sounded a bit theoretical (but more
>> likely with pNMI).

I can see how : I detailed the mechanism but not really mentioned either
a reproducer or the originally observed issues, on top of mentioning pNMI
after all the "possible but unlikely" explanation. That's my bad !
I'll probably lead with the observed issues rather than the explanation
of their reason in the future.

>> I'll pick it up as a fix so we can land it in v6.16.
>>
>> Ard -- maybe we can rework this in future along the lines that you
>> suggest but, from what Mark was saying offline, there may be problems
>> beyond the SCS that need addressing too if we decide to leave IRQs
>> enabled.
>>
> That is fine with me - the change looks alright, it's just that the
> wall of text implicates the shadow call stack (and the commit in
> question) in particular, even though (per Mark), the actual issues
> being addressed here are more intricate and not limited to the shadow
> call stack at all. E.g., the fact that call_on_irq_stack() may
> re-enter up until the point where SP is assigned could have other
> implications, which were present before that particular commit made
> things even worse.
To be honest, that was indeed my understanding of the issue
and how I approached it. Given offline discussions, there's other things
that having interrupts masked seems to help/fix. Knowing that now
I agree that the commit message is not great.
> But if masking DAIF is needed in any case, it make sense of course to
> rely on it to fix those issues too - I just think it might be better
> to get rid of scs_save in call_on_irq_stack() anyway.
I think that makes sense, and with interrupts masked would probably
prevent the issue you mentioned in the other thread if I understand 
correctly.

Thanks all, sorry for the confusion of the commit message.
Ada

