Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD48D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWleGVTcU4sEtfSJ61HVe7cEUyV/RVLM4/faNlUypZc=; b=Dy7DUx4Pi4/0/XFiRM9zPUgKYf
	hLDC3wY0dCWzcQ3oSU04xvGsL75vF2GX4UXJCL9hJHB0pbYGn5HkEmMQDwb84rbapaFTPUHCHvN5j
	G/cRxoIGCe1Jjxem8xS+hbHgcNJMATgs0/be4eunMyi+BuEuXWRG8hFa6XB5rDDMJNG/Q4bHzJfHT
	QNtKA1/8KBFT3EeZwXE9+7XU0hnBKUe43/izhGkks0r6H2jwxYjFOyGh5jnm2vv8ysVD3xYqhFM8k
	9HgF90xI894rTKEGFNFrfPpBr1LCsNZtpa9Or5RAHpL+UCqTLFr8PH4WhmOK2brub1Ph5+K/0GIZX
	R1xuEJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0yp-00000003IyE-2Oq5;
	Mon, 01 Dec 2025 10:18:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0yn-00000003Ixr-0dNo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:18:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49C01FEC;
	Mon,  1 Dec 2025 02:17:52 -0800 (PST)
Received: from [10.57.43.170] (unknown [10.57.43.170])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D606E3F73B;
	Mon,  1 Dec 2025 02:17:54 -0800 (PST)
Message-ID: <65c7307b-1f4e-4ae7-8bcf-8bfd9a9186fb@arm.com>
Date: Mon, 1 Dec 2025 11:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/12] arm64: entry: Convert to generic entry
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 charlie@rivosinc.com, akpm@linux-foundation.org, ldv@strace.io,
 macro@orcam.me.uk, deller@gmx.de, mark.rutland@arm.com, efault@gmx.de,
 song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251126071446.3234218-1-ruanjinjie@huawei.com>
 <20251126071446.3234218-12-ruanjinjie@huawei.com>
 <c6cf8755-34d0-468d-99c4-ac6d266f9efb@arm.com>
 <bfdd914c-4c3a-9af7-d530-f57f3532c3d5@huawei.com>
 <8c55c2a1-995e-44a1-8d48-b7d794f5176f@arm.com>
 <0e65df65-c454-df7f-0685-42e9c0f0f9e3@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <0e65df65-c454-df7f-0685-42e9c0f0f9e3@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_021801_311261_1216B394 
X-CRM114-Status: GOOD (  15.69  )
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

On 29/11/2025 02:23, Jinjie Ruan wrote:
>>>>>  #define TIF_UPROBE		5	/* uprobe breakpoint or singlestep */
>>>>>  #define TIF_MTE_ASYNC_FAULT	6	/* MTE Asynchronous Tag Check Fault */
>>>>>  #define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>>>>> -#define TIF_SYSCALL_TRACE	8	/* syscall trace active */
>>>>> -#define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
>>>>> -#define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
>>>>> -#define TIF_SECCOMP		11	/* syscall secure computing */
>>>>> -#define TIF_SYSCALL_EMU		12	/* syscall emulation active */
>>>>> +#define TIF_SECCOMP		11      /* syscall secure computing */
>>>>> +#define TIF_SYSCALL_EMU		12      /* syscall emulation active */
>>>> These seem to have reappeared in v8 for some reason?
>>> v8 add "ARCH_SYSCALL_WORK_EXIT" to be defined as "SECCOMP | SYSCALL_EMU"
>>>   to keep the arm64 behaviour unchanged as mentioned in v7.
>> Ah then that is where the issue is, I missed that: surely switching to
>> generic entry means that we are using SYSCALL_WORK_BIT_* rather than
>> TIF_* for all these flags?
> I think they may be the same thing as you mentioned in v7，neither
> SYSCALL_WORK_EXIT nor report_single_step() excluded SYSCALL_EMU, maybe
> we should clarify them for arm64 together in a separate patch.

These two might indeed be related. On second thoughts, while waiting for
more knowledgeable arm64 reviewers, I would suggest aligning arm64 with
the generic entry. Which means...

> 1、"The generic report_single_step() always returns false if SYSCALL_EMU
> is set."

... replicating this behaviour on arm64 (in a separate patch), and...

> 2、"
>      > -void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
>      > -{
>      > -	unsigned long flags = read_thread_flags();
>      > -
>      > -	rseq_syscall(regs);
>      > -
>      > -	if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
>
>      I believe switching to the generic function introduces a change
>      here: syscall_exit_work() is only called if a flag in
> SYSCALL_WORK_EXIT is set, and this set does not include SYSCALL_EMU and
>     SECCOMP. Practically this means that audit_syscall_exit() will no
>     longer be called if only SECCOMP and/or SYSCALL_EMU is set.
>
>    It doesn't feel like a major behaviour change, but it should be
>    pointed out."

... replicating this on arm64 as well, i.e. introducing a separate set
of flags for syscall exit. This should be a patch of its own, as it
isn't directly related to the report_single_step() behaviour (especially
since it concerns SECCOMP as well). It would also be an occasion to get
rid of has_syscall_work(), in preparation to the move to generic entry.

- Kevin

