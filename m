Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422C7C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 02:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywYub6wAD+jWjHOKqOLf/FFBRh9k7vGnHg3v0LBqTPs=; b=Ps3Yi9Je+qKpum
	h1RVIzbB8IDMJ4N/v+g4A1o0mp2OdiJWC3+BmxnwMMN0GT4BtW3FlYWtZGe3n4Jk+r3FbTb+BwCio
	evPzsMC0WfITP/NL85WZTp1a4lWYifvp16hr+Tu2dQJtthjqe9OirrvP62YHSxH2AviIk1VggjD87
	igSUwDZZO309wzIDBrj3AKRjQnhL2Fhw/ouZWonfBrx3GkO3NgkUQTudEsKI2VNlm1R/trronIkKA
	oSRpO+1QPUREx3MP6OQz4NaxEffSoAieM7+lFkcWLgSxa5qIhKXliYwJMQn4lHUA45ybE55xHLCd/
	7pZx13X5akqWhv8lOXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmieJ-0000000DB4e-14JV;
	Thu, 23 Jul 2026 01:54:59 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmieD-0000000DB45-1hvc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 01:54:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ywYub6wAD+jWjHOKqOLf/FFBRh9k7vGnHg3v0LBqTPs=;
	b=Hp2fr+eL8d+7nGr2HKuNoE+794wuVsTucWVzdE40kbsCKHajUrBfqnINVC44taxA3OM1+ccnH
	0CNp+pxpyQZhw9sbuJeW4heLU1u9qQ8Vx4+VvWGD0Grb0n15LCa7e0Y0QbIb4AOjvHHPdy8J3KK
	HAyZ7GPZQBBpASoLXjmfgbY=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h5DTS50dqz1T4MQ;
	Thu, 23 Jul 2026 09:45:16 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 436894057F;
	Thu, 23 Jul 2026 09:54:38 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Jul 2026 09:54:36 +0800
Message-ID: <5a200b28-d970-462b-ab49-ccb6bbe6c94c@huawei.com>
Date: Thu, 23 Jul 2026 09:54:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 15/15] arm64: vdso: Expose sigreturn address on vdso
 to the kernel
To: Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linusw@kernel.org>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
 <20260721081858.1169276-16-ruanjinjie@huawei.com>
 <CAD++jL=Ou_HF5VchexnjUf9qwzrz0xgY+NhA5gZhOwiwdxUi-g@mail.gmail.com>
 <amEJkyKFvVOkiGao@J2N7QTR9R3>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <amEJkyKFvVOkiGao@J2N7QTR9R3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_185454_092316_637456CD 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: thuth@redhat.com, wad@chromium.org, anshuman.khandual@arm.com, kees@kernel.org, catalin.marinas@arm.com, yeoreum.yun@arm.com, kevin.brodsky@arm.com, linux-kernel@vger.kernel.org, oleg@redhat.com, luto@amacapital.net, pengcan@kylinos.cn, peterz@infradead.org, broonie@kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, ryan.roberts@arm.com, will@kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/7/23 2:18, Mark Rutland 写道:
> On Tue, Jul 21, 2026 at 10:55:03AM +0200, Linus Walleij wrote:
>> On Tue, Jul 21, 2026 at 10:19 AM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
>>> Syscall User Dispatch (SUD) must not intercept the signal trampoline
>>> code, otherwise returning from a signal with a locked selector may
>>> cause infinite recursion into the signal handler.
>>>
>>> Provide an arm64 implementation of arch_syscall_is_vdso_sigreturn()
>>> to exclude these sigreturn syscalls from dispatch.
>>>
>>> For native 64-bit tasks, check whether the current PC matches the 'svc #0'
>>> instruction inside the vDSO sigreturn trampoline (defined in
>>> arch/arm64/kernel/vdso/sigreturn.S as below).
>>>
>>>         SYM_CODE_START(__kernel_rt_sigreturn)
>>>                 mov     x8, #__NR_rt_sigreturn
>>>                 svc     #0
>>>         SYM_CODE_END(__kernel_rt_sigreturn)
>>>
>>> For COMPAT tasks, verify that the instruction falls within the dedicated
>>> 'sigpage' range, since compat signal handlers use this architecture-
>>> specific page (not the vDSO) for their return trampoline. This prevents
>>> SUD from incorrectly dispatching syscalls issued during signal return.
>>>
>>> Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>> Suggested-by: kemal <kmal@cock.li>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>
>> I'm a bit scared about SUD.
>>
>> Certainly we can merge patches 1-14 first and iron out
>> any trouble related to that and split this off so a separate
>> series to be applied lated?
> 
> I had already asked Jinie to drop SUD back in v14, and he had agreed:
> 
>   https://lore.kernel.org/lkml/akegeU59jSK9t7FX@J2N7QTR9R3/
>   https://lore.kernel.org/lkml/3ac6d4be-7c57-44c2-80a0-408e2c6f8136@huawei.com/
> 
> Jinjie, please drop this for now, as we had _already_ agreed.

Ah, sorry about that.I will drop this SUD patch in the next revision.

> 
> I will look over the rest of the series soon.

Thank you! I look forward to your review and feedback on the rest of the
patches.

Thanks,
Jinjie
> 
> Mark.
> 


