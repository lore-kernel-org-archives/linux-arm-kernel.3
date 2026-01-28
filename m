Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADA2D3F076
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRRmzUcl3QCWzjfZvki5P1hK7gUe1445xJIOO0knKok=; b=P1Buw1QOKch9WP
	AQOWoyifClaIzJ2p3hSyqW4y4g8qdLV7PW9b0Qypnj0WTky+Y0kfHgEmYC0rR8s/y7EGZZRopj1m3
	aysaN1vBt/WyWVvw9nLyXV7fm1s4zsJiiDAiA/4EiQUhNe4jSsrDmU46ViARQlEYvuFVzAMW+c2Xg
	X68amF4qyqd10IsR8heSh7QdJKKV+YF02LkOll68SEB5v6IHQvr9QL6ua1TDMayVbVKh0wbga3xqp
	remLCibIjDBPTS6sA9BoajuCpoeXMm3GSdYqMWh/M31f2f4HXMQYEBmADzKnfqBdFRaVgyQ+gccLe
	O4MDjrAIyEvQ188zp3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6vQ-0000000GDKD-2WDb;
	Wed, 28 Jan 2026 14:53:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6vP-0000000GDJx-1SeP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 14:53:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SRRmzUcl3QCWzjfZvki5P1hK7gUe1445xJIOO0knKok=; b=UX3TK7zEotbIV3FbuS54ccHmQ3
	s7OgsUlKzDj8NQS/X7T7OWFQG9mcjNHnXzDpAtrlytJJGHURPHUcWCg++pBX66WdMow7WIiHPcmXL
	JjUDENYafqQ4EvaQOZc7AIBB8qZL4KsyWQZ6GSeIVvmhTlpNp2mNT1OLM8wxgtSfvhw/Dmx/nTgLu
	uDPX9gWPuMD45ELp5ZF0iulhUgLEh9gQKFUK9DCUXvtoh+y0PhhxcIUGI7Ceanjk67u6Q2Yc/P+QS
	RBR35T3pyoPlIsbir/Kn+sygRRm1GaU1g/gkUsyPlQtbpEOVz4sRtKGb1yT6b2sv6xCwWG6dqkt4e
	lBAyo3eg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6vL-00000008ltv-1YQk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:53:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 614011515;
	Wed, 28 Jan 2026 06:53:30 -0800 (PST)
Received: from [10.44.160.85] (e126510-lin.lund.arm.com [10.44.160.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 563313F73F;
	Wed, 28 Jan 2026 06:53:31 -0800 (PST)
Message-ID: <647fe97e-e8c1-464f-bbc7-39dac0bda6b2@arm.com>
Date: Wed, 28 Jan 2026 15:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/16] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
To: Jinjie Ruan <ruanjinjie@huawei.com>, Will Deacon <will@kernel.org>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-6-ruanjinjie@huawei.com>
 <aXe6W69Esd1NLEU8@willie-the-truck>
 <28e54f74-9b3d-4c3c-9172-ceb429e7fcbe@arm.com>
 <4891191c-d1c3-6985-c2ea-1b29deb8abe1@huawei.com>
 <0f6212c1-7034-42f4-ba77-10e9ec52a4f5@arm.com>
 <6ff5d366-3a2d-089b-5ac7-e40b81a8664c@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <6ff5d366-3a2d-089b-5ac7-e40b81a8664c@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_145339_602353_51F51ADB 
X-CRM114-Status: GOOD (  12.72  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, tglx@linutronix.de, richard.weiyang@gmail.com, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, linux-kernel@vger.kernel.org, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 28/01/2026 02:09, Jinjie Ruan wrote:
>
> On 2026/1/27 23:06, Kevin Brodsky wrote:
>> On 27/01/2026 12:34, Jinjie Ruan wrote:
>>>> [...]
>>>>
>>>>>  I'm also concerned that rseq_debug_update_user_cs()
>>>>> operates on instruction_pointer(regs) which is something that can be
>>>>> chaned by ptrace.
>>>> Isn't that true regardless of where rseq_syscall() is called on the
>>>> syscall exit path, though?
>>> My understanding is that if instruction_pointer(regs) is hijacked and
>>> modified via ptrace at the syscall exit (ptrace_report_syscall_exit()),
>>> this modification will not be observed by rseq. Specifically, in the
>>> generic entry syscall exit path, rseq_syscall() is unable to detect such
>>> a PC modification.
>> Good point. So concretely that means that currently on arm64, one could
>> make the rseq debug check pass/fail by using the syscall exit trap to
>> modify PC. OTOH this is impossible with generic entry because the rseq
>> check is performed first. I'm not sure this is a feature anyone has even
>> noticed, but it is a user-visible change indeed.
> After digging into the ptrace code, I found that ptrace does not modify
> instruction_pointer(regs) on the syscall exit path; it only changes the
> return value as below.
> Therefore, if my understanding is correct, Will's concern does not apply
> here.
>
> ptrace_set_syscall_info()
>   -> ptrace_set_syscall_info_exit()
>      -> syscall_set_return_value(child, regs, 0, rval)

I'm not following, how is that related to the call to
ptrace_report_syscall_exit()? That eventually results in a call to
ptrace_stop() (via ptrace_notify()), which synchronously causes the
tracee to sleep and allows the tracer to issue ptrace commands, e.g.
setting PC.

- Kevin

