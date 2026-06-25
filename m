Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D3ECDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkWLmHbkx4otCWQO/Zs78Zixwt8poz7bHe/5QgJLMeE=; b=vzLSqurLp4Hlh/QNGBbQEtDGct
	Z6cFN14lF20ZoMqSilx6no86sNgw8VXnIO2tpVyCModE1QRPx7VUkj8HIGsV5xRIZGaQPQwlFwgKL
	pX/GqlcgmGOar7LKEhDGj56KlsiduYjuFZspOjHp8VE3xlJ7Ku6hMWAi0n1t8Mf4w7AT0VeKa3Mum
	y27kLniDE02BP8//pf6o00/C6S445gfD59w2ZXOvEdzjWP2pFMt/ZP3joFUezOkpBqpR6uLPDsHtK
	Zyj7ZtuFEnRr1ctx7JXgqYhptH8J14ClADyMroC+Z8OKeuUzFt8M0id3zZesBk6GvwYB6Gu2Gs3xp
	w0p0q0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciSh-0000000975P-1gpz;
	Thu, 25 Jun 2026 11:41:39 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciSe-0000000974w-01jU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:41:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SkWLmHbkx4otCWQO/Zs78Zixwt8poz7bHe/5QgJLMeE=;
	b=qzfReAgw0Yn+ib4NL6VZtl8ONzWYH0xtu9N6ZNGXRVUjxJ9lkuWCWthhARvq9FjgRwDqIFOBu
	nrvLtajkpIytfGJisK4Ni6cxjdScAhkQ2jCcKHKlxIyHnX0Fo4VRZ84dqOU2v/OUqhp8lHHf+tI
	XawJwYJ0FzxBeswpxWftfYY=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gmGqj3G3VzKmT0;
	Thu, 25 Jun 2026 19:32:17 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 00630402AB;
	Thu, 25 Jun 2026 19:41:26 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Jun 2026 19:41:24 +0800
Message-ID: <a1f5cfdc-ea1c-421c-a5bb-675406ca3311@huawei.com>
Date: Thu, 25 Jun 2026 19:41:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 08/11] arm64/ptrace: Define and use
 _TIF_SYSCALL_EXIT_WORK
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <mark.rutland@arm.com>,
	<yeoreum.yun@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<ldv@strace.io>, <thuth@redhat.com>, <james.morse@arm.com>,
	<song@kernel.org>, <anshuman.khandual@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-9-ruanjinjie@huawei.com>
 <073a55f2-54ff-4770-8457-bef164261a87@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <073a55f2-54ff-4770-8457-bef164261a87@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_044136_374594_07B55B53 
X-CRM114-Status: GOOD (  18.15  )
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



On 6/24/2026 10:53 PM, Ada Couprie Diaz wrote:
> On 11/05/2026 10:21, Jinjie Ruan wrote:
>> Introduce _TIF_SYSCALL_EXIT_WORK to filter out entry-only flags
>> during the syscall exit path. This aligns arm64 with the generic
>> entry framework's SYSCALL_WORK_EXIT semantics.
>>
>> [Rationale]
>> The current syscall exit path uses _TIF_SYSCALL_WORK to decide whether
>> to invoke syscall_exit_work(). However, _TIF_SYSCALL_WORK includes
>> flags that are only relevant during syscall entry:
>>
>> 1. _TIF_SECCOMP: Seccomp filtering (__secure_computing) only runs
>>    on entry. There is no seccomp callback for syscall exit.
>>
>> 2. _TIF_SYSCALL_EMU: In PTRACE_SYSEMU mode, the syscall is
>>    intercepted and skipped on entry. Since the syscall is never
>>    executed, reporting a syscall exit stop is unnecessary.
>>
>> [Changes]
>> - Define _TIF_SYSCALL_EXIT_WORK: A new mask containing only flags
>>    requiring exit processing: _TIF_SYSCALL_TRACE, _TIF_SYSCALL_AUDIT,
>>    and _TIF_SYSCALL_TRACEPOINT.
>>
>> - Update exit path: Use _TIF_SYSCALL_EXIT_WORK in
>>    syscall_exit_to_user_mode_work() to avoid redundant calls to
>>    audit and ptrace reporting when only entry-flags are set.
>>
>> - Cleanup: Remove the has_syscall_work() helper as it is no longer
>>    needed. Direct flag comparison is now used to distinguish between
>>    entry and exit work requirements.
>>
>> [Impact]
>> audit_syscall_exit() and report_syscall_exit() will no longer be
>> triggered for seccomp-only or emu-only syscalls. This matches the
>> generic entry behavior and improves efficiency by skipping unnecessary
>> exit processing.
>>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
> 
> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> Definitely not related to this series, but it feels like this brings us
> quite close to being able to switch to generic TIF flags as well :
> only TIF_FOREIGN_PSTATE and TIF_MTE_ASYNC_FAULT
> would need to be moved to the upper 16 bits,
> with TIF_RESTORE_SIGMASK and TIF_MEMDIE freeing two slots there.
> 
> Not sure how important the bit number changes would be and if any
> of the extra generic bits require any arch support (TIF_POLLING_NRFLAG,
> TIF_USER_RETURN_NOTIFY, TIF_RSEQ, TIF_HRTIMER_REARM)...
> 
> But again, just thinking out loud !

Hi Ada,

You have incredible foresight! You are absolutely right that this series
lays the perfect groundwork for switching arm64 to generic TIF flags
(HAVE_GENERIC_TIF_BITS).

I am happy to share that I have already implemented exactly what you
described—including migrating the architecture-specific flags to the
upper 16 bits and enabling the generic TIF infrastructure—in a separate,
dedicated patch series.

You can find the implementation and discussion here:

https://lore.kernel.org/all/20260320104222.1381274-1-ruanjinjie@huawei.com/

Since that series directly builds on top of the cleanups and
infrastructure introduced here, I plan to actively push it forward right
after we get this core generic entry conversion landed.

Thanks again for looking so far ahead and validating the direction!

Best regards,
Jinjie

> Thanks,
> Ada
> 
> 


