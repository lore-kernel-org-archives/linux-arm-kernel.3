Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46E0C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlkozp+bRjeQMwIC+OSYzGwx9bLAelORoAYDdM8sGNQ=; b=siEd+C5RXXBLhN
	TNiSZeEbDJbt8ww7XI6zRctCHe/rQZ/0uY5OduL95MtboPVZJa2eJksibitTQVobFSiYDD9LVbBN6
	bCCfSq1TSvihPcy+mp6Da/5gd/cIT+vzK1h0kfAw0xV7vbVqfugXdpjeBTUw4/uVXZOJoQh+FZdFw
	hEwSSmAR2lXmd/TMAoQnJ1gO3u/KxH/6TY+mHCKaYv9ia6IRkS+uv2T5IcHOvtxBzhaqCAbwiaU+d
	V6tZDxZgMMFASpFBQjQIrjXqP+3w1gZ1xvhRxCQlAe01PS8/6zCFxZWDEHeBUOoRVcYrbqplqY8pQ
	wGcHWFMRywG/CQlV3sLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkSu-0000000ETuQ-3p6x;
	Tue, 27 Jan 2026 14:54:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkSs-0000000ETu1-1KNM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:54:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7E6F1595;
	Tue, 27 Jan 2026 06:54:37 -0800 (PST)
Received: from [10.57.52.3] (unknown [10.57.52.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A14F3F632;
	Tue, 27 Jan 2026 06:54:38 -0800 (PST)
Message-ID: <666db2a4-6015-46ac-8eba-565beff8b0c1@arm.com>
Date: Tue, 27 Jan 2026 15:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/16] arm64/ptrace: Refactor
 syscall_trace_enter/exit()
To: Jinjie Ruan <ruanjinjie@huawei.com>, Will Deacon <will@kernel.org>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-5-ruanjinjie@huawei.com>
 <aXeZdh3CtznU8u6L@willie-the-truck>
 <4f07254d-b158-a1ce-69a7-4fa4b0f339c1@huawei.com>
 <532b42e2-3417-4e0f-af59-8c79521c34a3@arm.com>
 <a1f8a28e-84c3-dcf1-26d6-edbb37a5b750@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <a1f8a28e-84c3-dcf1-26d6-edbb37a5b750@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_065446_400956_0E307ED0 
X-CRM114-Status: GOOD (  12.75  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, richard.weiyang@gmail.com, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, tglx@linutronix.de, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, linux-kernel@vger.kernel.org, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 27/01/2026 12:02, Jinjie Ruan wrote:
>
> On 2026/1/27 17:43, Kevin Brodsky wrote:
>> On 27/01/2026 04:01, Jinjie Ruan wrote:
>>>> I understand that you're gradually making the arch code more similar to
>>>> the core code so that we can switch over to it, but I'm struggling to
>>>> understand why syscall_trace_enter() takes the 'syscall' argument.
>>>>
>>>> Even the core code just seems to use it as a local variable, which it
>>>> overrides before it ever uses it. What am I missing?
>>> Hi,
>>>
>>> You're absolutely right. The 'syscall' parameter is indeed treated as a
>>> local variable and gets overridden before any real use. Should we
>>> refactor to remove the parameter entirely in generic entry?
>> I noticed this as well, removing it from the generic function would make
>> sense. AFAICT that removal could be propagated quite far in fact:
>> syscall_enter_from_user_mode_work(), syscall_enter_from_user_mode(),
>> even arch implementation (do_syscall_64() on x86).
> Not really, it is the default return value of
> syscall_enter_from_user_mode_work() as below, so we only need to remove
> the parameter in syscall_trace_enter().
>
> static __always_inline long syscall_enter_from_user_mode_work(struct
> pt_regs *regs, long syscall)
> {
> 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>
>        if (work & SYSCALL_WORK_ENTER)
>             syscall = syscall_trace_enter(regs, work);
>
>       return syscall;
> }

You're right, hadn't realised the call to syscall_trace_enter() was
conditional.

- Kevin

