Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F9BC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpA2PXfRpOJbaaK0SH+c8CYSnNBcwfbqMo3lhHO2XBI=; b=IIjLo51PqWhhsr
	VM3w+aKOiHUxytp/m00ftp3oCuW8RvmRB27gfvq0MQNpe9WA0hmpG2n9bt+32QyqB8+A0+6XvbXRu
	Tmh8sx2dVflro6lEZOXK6XC9pNsMz3YX4ZN+IbCbB/9ZTV00primhXoQwxCWz2HXNV7kT0ftdiS6k
	80OHDtB5zp3l3jVRB7cez7ETDPGMVshmo0pYMdAuOFwrZ7hk6I8T6gJQpcvmRgq16rj1RBudAHfmY
	4aLaIWejznd9dv8H9dMVKXWOjoQft46QOuwsurp/bSIAo1GnWGVfvqCPqHopi4AK9JavMdRvFqJ/2
	IpCmv9svPMzf3l9E0wbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDY7-0000000F0er-036U;
	Mon, 29 Jun 2026 15:05:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDY3-0000000F0dP-2GeR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:05:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 349E7266C;
	Mon, 29 Jun 2026 08:05:16 -0700 (PDT)
Received: from [10.2.213.21] (unknown [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 311743F673;
	Mon, 29 Jun 2026 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782745520; bh=g7i7gbZ29g+wCfIF3bFzAqB/Tk8+PHLffqDIOwH/gH8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J24S3iJ1WWJTZsIDd1syQGddMMcQKpOP9AJcvVZB+pTn+jr6wRrvejwjNiO96WzBE
	 dFUfrRJjuIbOhTrQ/t0+0QyIL1XQFoqgSkStgwMsq0Ax+mCumea7StT3pAXS4QE8Vw
	 ipdNNX30hRZS5DQiVK3wyIVY/Dbk00fwXkKQJ5dA=
Message-ID: <2260831d-6fa2-421c-8107-d04a60de4058@arm.com>
Date: Mon, 29 Jun 2026 16:05:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 08/11] arm64/ptrace: Define and use
 _TIF_SYSCALL_EXIT_WORK
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-9-ruanjinjie@huawei.com>
 <073a55f2-54ff-4770-8457-bef164261a87@arm.com>
 <a1f5cfdc-ea1c-421c-a5bb-675406ca3311@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <a1f5cfdc-ea1c-421c-a5bb-675406ca3311@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_080523_653657_5EF5E51F 
X-CRM114-Status: GOOD (  21.94  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, will@kernel.org, kees@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, linux-kernel@vger.kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, linusw@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 25/06/2026 12:41, Jinjie Ruan wrote:
> On 6/24/2026 10:53 PM, Ada Couprie Diaz wrote:
>> On 11/05/2026 10:21, Jinjie Ruan wrote:
>>> Introduce _TIF_SYSCALL_EXIT_WORK to filter out entry-only flags
>>> during the syscall exit path. This aligns arm64 with the generic
>>> entry framework's SYSCALL_WORK_EXIT semantics.
>>>
>>> [Rationale]
>>> The current syscall exit path uses _TIF_SYSCALL_WORK to decide whether
>>> to invoke syscall_exit_work(). However, _TIF_SYSCALL_WORK includes
>>> flags that are only relevant during syscall entry:
>>>
>>> 1. _TIF_SECCOMP: Seccomp filtering (__secure_computing) only runs
>>>     on entry. There is no seccomp callback for syscall exit.
>>>
>>> 2. _TIF_SYSCALL_EMU: In PTRACE_SYSEMU mode, the syscall is
>>>     intercepted and skipped on entry. Since the syscall is never
>>>     executed, reporting a syscall exit stop is unnecessary.
>>>
>>> [Changes]
>>> - Define _TIF_SYSCALL_EXIT_WORK: A new mask containing only flags
>>>     requiring exit processing: _TIF_SYSCALL_TRACE, _TIF_SYSCALL_AUDIT,
>>>     and _TIF_SYSCALL_TRACEPOINT.
>>>
>>> - Update exit path: Use _TIF_SYSCALL_EXIT_WORK in
>>>     syscall_exit_to_user_mode_work() to avoid redundant calls to
>>>     audit and ptrace reporting when only entry-flags are set.
>>>
>>> - Cleanup: Remove the has_syscall_work() helper as it is no longer
>>>     needed. Direct flag comparison is now used to distinguish between
>>>     entry and exit work requirements.
>>>
>>> [Impact]
>>> audit_syscall_exit() and report_syscall_exit() will no longer be
>>> triggered for seccomp-only or emu-only syscalls. This matches the
>>> generic entry behavior and improves efficiency by skipping unnecessary
>>> exit processing.
>>>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> Definitely not related to this series, but it feels like this brings us
>> quite close to being able to switch to generic TIF flags as well :
>> only TIF_FOREIGN_PSTATE and TIF_MTE_ASYNC_FAULT
>> would need to be moved to the upper 16 bits,
>> with TIF_RESTORE_SIGMASK and TIF_MEMDIE freeing two slots there.
>>
>> Not sure how important the bit number changes would be and if any
>> of the extra generic bits require any arch support (TIF_POLLING_NRFLAG,
>> TIF_USER_RETURN_NOTIFY, TIF_RSEQ, TIF_HRTIMER_REARM)...
>>
>> But again, just thinking out loud !
> Hi Ada,
>
> You have incredible foresight! You are absolutely right that this series
> lays the perfect groundwork for switching arm64 to generic TIF flags
> (HAVE_GENERIC_TIF_BITS).
>
> I am happy to share that I have already implemented exactly what you
> described—including migrating the architecture-specific flags to the
> upper 16 bits and enabling the generic TIF infrastructure—in a separate,
> dedicated patch series.
>
> You can find the implementation and discussion here:
>
> https://lore.kernel.org/all/20260320104222.1381274-1-ruanjinjie@huawei.com/
>
> Since that series directly builds on top of the cleanups and
> infrastructure introduced here, I plan to actively push it forward right
> after we get this core generic entry conversion landed.
>
> Thanks again for looking so far ahead and validating the direction!
>
> Best regards,
> Jinjie

Hi Jinjie,

Oh, neat, I evidently missed this series ;
glad you confirmed I was on the right track !

I am looking forward to seeing both those works merged then :)

Kind regards,
Ada


