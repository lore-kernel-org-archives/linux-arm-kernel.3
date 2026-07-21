Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7B0C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XzIw7gZRttLMSyjjTDa5uCrHYP0E7vjE31XbWW5ny4=; b=QDuJ8U4uITMmTQ
	B3MBdo9wf0Kot1TS9mV9uu2uLgbu7A5C8ojegIn1K6nrnnGL6/QWafTKGsNSqrEJv73lx2LLxjGSh
	L6OWL0ryVsqTGOlwa16tz/2nb/ffhYXxwQ/XpN8PJuRAD5+6kb+k7hkhk7YitNDX12MSAlKhGanlZ
	vt2GumhYw5aP0h75C1SZLX4k3bYLvVCl0I4SUctxfh9yuDREPqrVNgFVJcxPqiERspoSCD3UcY1H7
	uEoRpHtelqWCqHPHD22+0z4Ocbq5uFw67pTPGZRvd3BHvXOsUBN/cNBIsgz+0YnIHI2wDBzeuf+RX
	sZsqPo77znvosSzCLNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6hc-00000008yCa-3jRi;
	Tue, 21 Jul 2026 09:23:52 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6hZ-00000008yBa-2dU5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:23:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8XzIw7gZRttLMSyjjTDa5uCrHYP0E7vjE31XbWW5ny4=;
	b=3yo5xc/mSw5KaZCHUE1kDcQbJK/3R42b0Z5+IWLerLM5ObcWveJLPHtuAKwL1gRM/QBHGa5Bs
	q0aYE4MqVHufVJ50Mf0FP8QC7yoeuz0c/TA9pguWMSY4eKbHqlIg9ZrwNL9wSRgR8IQPflktVXv
	ahhzzZ0UJNxQ4aFdvHeeYKo=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h4BXM26S6znTbk;
	Tue, 21 Jul 2026 17:14:11 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2569A4055B;
	Tue, 21 Jul 2026 17:23:43 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Jul 2026 17:23:41 +0800
Message-ID: <8a1c8c38-e89b-4e22-9b46-aa53b0ed30f8@huawei.com>
Date: Tue, 21 Jul 2026 17:23:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 15/15] arm64: vdso: Expose sigreturn address on vdso
 to the kernel
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
 <20260721081858.1169276-16-ruanjinjie@huawei.com>
 <20260721104810-0a8ab042-2705-43e8-90d2-74e221f3fab5@linutronix.de>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260721104810-0a8ab042-2705-43e8-90d2-74e221f3fab5@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_022350_294005_1FDA4E84 
X-CRM114-Status: GOOD (  14.77  )
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, will@kernel.org, peterz@infradead.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linux-mm@kvack.org, linusw@kernel.org, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/21/2026 4:51 PM, Thomas Weißschuh wrote:
> On Tue, Jul 21, 2026 at 04:18:58PM +0800, Jinjie Ruan wrote:
>> Syscall User Dispatch (SUD) must not intercept the signal trampoline
>> code, otherwise returning from a signal with a locked selector may
>> cause infinite recursion into the signal handler.
>>
>> Provide an arm64 implementation of arch_syscall_is_vdso_sigreturn()
>> to exclude these sigreturn syscalls from dispatch.
>>
>> For native 64-bit tasks, check whether the current PC matches the 'svc #0'
>> instruction inside the vDSO sigreturn trampoline (defined in
>> arch/arm64/kernel/vdso/sigreturn.S as below).
>>
>> 	SYM_CODE_START(__kernel_rt_sigreturn)
>> 		mov     x8, #__NR_rt_sigreturn
>> 		svc     #0
>> 	SYM_CODE_END(__kernel_rt_sigreturn)
> 
> With the new label this code snippet here shouldnt be needed anymore.

You're right, the code itself is already clear.

> 
>> For COMPAT tasks, verify that the instruction falls within the dedicated
>> 'sigpage' range, since compat signal handlers use this architecture-
>> specific page (not the vDSO) for their return trampoline. This prevents
>> SUD from incorrectly dispatching syscalls issued during signal return.
>>
>> Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Suggested-by: kemal <kmal@cock.li>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/Kconfig                 |  1 +
>>  arch/arm64/include/asm/elf.h       |  1 +
>>  arch/arm64/kernel/vdso.c           | 16 ++++++++++++++++
>>  arch/arm64/kernel/vdso/sigreturn.S |  1 +
>>  arch/arm64/kernel/vdso/vdso.lds.S  |  1 +
>>  5 files changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index aea686dce3d5..a41d2b593899 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -86,6 +86,7 @@ config ARM64
>>  	select ARCH_SUPPORTS_SCHED_SMT
>>  	select ARCH_SUPPORTS_SCHED_CLUSTER
>>  	select ARCH_SUPPORTS_SCHED_MC
>> +	select ARCH_SUPPORTS_SYSCALL_USER_DISPATCH
> 
> From the subject and description I would not have expected this to be in here.
> Split into its own patch?

If ARCH_SUPPORTS_SYSCALL_USER_DISPATCH is not implemented, then it seems
pointless to implement arch_syscall_is_vdso_sigreturn() separately, or
perhaps we should revise the title to indicate support for SUD on arm64?

> 
>>  	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>>  	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
>>  	select ARCH_WANT_DEFAULT_BPF_JIT
> 
> (...)
> 
> For the rest:
> 
> Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Thanks for the review.

> 
> 
> Thomas


