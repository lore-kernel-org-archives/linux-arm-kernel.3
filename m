Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58E1C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 08:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9F3teZ9TgBfVNf9k6Vvix665LbfdBdROKI9u4D2JIok=; b=iI5FtlSLGrlyxN
	Mfb/UBc2aYZCHVCnXrE+LXSQG5UOlLKRh3EzD0Cn15K637yDHm72E4xVJOZiusPVL7yF76AdUO5JW
	hO6weTRaxlSAbIGWUg6jI7Oxd6D83/krjDr3/Ab/yUz/fw43zFMvsIn/Dlxaym/Rpo6PQpgQ2EowJ
	dQPKtRzUTc4PkxI7eIBPKAGRBvb8Plf7PoH7JEU3GDvpfCHjZGAcKlLarO9igzCtfrXtsrU2eQGXX
	FT21DpW7VOAhucywIXuJUns2nyv6AuGggq1EHtUXm/5nmPebumouKn7cMf3pA6nyrjxmFX6zJo6BJ
	Kdv1GYofnCYn4vGlAOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthhI-0000000DamK-0vYJ;
	Tue, 11 Aug 2026 08:18:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthhF-0000000Dalo-0xER
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 08:18:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C9CD1516;
	Tue, 11 Aug 2026 01:18:48 -0700 (PDT)
Received: from [10.57.68.120] (unknown [10.57.68.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29D8D3F673;
	Tue, 11 Aug 2026 01:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786436332; bh=8moHjI7fKAAhoK29cxA112fLWHn5wifKLAir2LIKSfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=narF+GyVC4Q/fzrghTVc+nyDaF4Y3IUB9PAV3VRo16QzW01jXryrMz8PTQeO9v4oJ
	 7he4UtXllLggJeyA51FxrTAOlInIjDuFJ3LFnSlTemt+hCNhL5jzU1G2T1YuKat4Je
	 6fBTi078tPfkd/QULMqTbHJUQ4PEY9L/zaHjc0Bs=
Message-ID: <e2325b50-882c-4948-ae0c-d84a39e50331@arm.com>
Date: Tue, 11 Aug 2026 09:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: entry: PSTATE_I_SET is leaking on pseudo NMI
 mode
To: Jinjie Ruan <ruanjinjie@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Breno Leitao <leitao@debian.org>
References: <20260807-arm64_fix-v1-1-d069ccf9d71b@debian.org>
 <anXkO8YpoadRzm07@J2N7QTR9R3> <0c47125b-6a5e-41c9-b31c-d78643cbe6bd@arm.com>
 <7b16d183-86d5-481e-b212-977ad0598ac7@huawei.com>
 <3e5f1532-ea17-4994-8cd0-5ce1d42e9049@arm.com>
 <77080aa8-7df1-43f0-8c82-1096db05f745@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <77080aa8-7df1-43f0-8c82-1096db05f745@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_011853_331215_20A1E607 
X-CRM114-Status: GOOD (  20.41  )
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
Cc: rmikey@meta.com, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, kernel-team@meta.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 8/11/26 03:47, Jinjie Ruan wrote:
> 
> 在 2026/8/10 21:04, Vladimir Murzin 写道:
>> On 8/10/26 13:44, Jinjie Ruan wrote:
>>>> Agreed on the need for a clearer explanation.
>>>>
>>>> Perhaps local_irq_disable() isn't the right API here, and we should
>>>> use local_daif_restore(DAIF_PROCCTX_NOIRQ) instead?
>>> The local_irq_disable() here is pair with the local_irq_enable() in
>>> preempt_schedule_irq(). So I think it is not correct to replace them
>>> separately.
>>>
>>> The pseudo NMI does not consider how to do local_irq_disable() /enable()
>>> when the interrupt is masked by the DAIF.I bit as I reported before.
>> Unless I missed anything local_daif_restore(DAIF_PROCCTX_NOIRQ) would
>> clear DAIF.{IF} and set PMR to GIC_PRIO_IRQOFF which is the state we
> Hi, Vladimir,
> 
> Yes, local_daif_restore(DAIF_PROCCTX_NOIRQ) does indeed clear the
> DAIF.IF bit and then set the PMR to IRQOFF.
> 
> But there is a side effect that will clear the DAIF.{DA} bit. This will
> cause `arch_irqentry_exit_need_resched()` to bypass the DAIF check.
> Originally, it could not be preempted, but after this fix, it becomes
> preemptible.
> 
> As the below comment said, If DAIF.{DA} is set, we may be handling an
> NMI or debug context, and preemption should not occur.
> 

Yes, indeed, it is why in my other reply I added

"if we believe it is OK to downgrade the inherited context"

... and it seems it is not OK.

Cheers
Vladimir

> 30 static inline bool arch_irqentry_exit_need_resched(void)
>  31 {
>  32 >-------/*
>  33 >------- * DAIF.DA are cleared at the start of IRQ/FIQ handling, and
> when GIC
>  34 >------- * priority masking is used the GIC irqchip driver will
> clear DAIF.IF
>  35 >------- * using gic_arch_enable_irqs() for normal IRQs. If anything
> is set in
>  36 >------- * DAIF we must have handled an NMI, so skip preemption.
>  37 >------- */
>  38 >-------if (system_uses_irq_prio_masking() && read_sysreg(daif))
>  39 >------->-------return false;
> 
> Best regards,
> Jinjie
> 
>> expect from local_irq_disable() so we can do local_irq_{en,dis}able()
>> later on.
>>
>> Cheers
>> Vladimir
>>


