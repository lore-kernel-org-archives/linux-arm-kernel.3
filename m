Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D8FC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqaiH3/8gwogQlQcVPAl0be7CAknXLZAcjJ8p31U84s=; b=YtU/vwvrM9pLcdl2j2y5W0AHLE
	FNLIh+d3NKdWMwt/vig3S2M+cbrIh7PEb9M30KJrzoFASNiudcEPydKo2mtmhJKqatLNGkiLgdcch
	567TWBQsv7E46hUT3uw4OCUccnmaDa78TV+W7uM3Nv5sdM0yMql64EHvt/YG5/LdMOtFS1cEaqM6F
	0IZc5ddqwwfqH0Dbr4X7MOHewHcNMGnjM7sNwJXhdCRNX79ylOICf9rdlB3YAfzLMFwhwOjhgyVTP
	yy0YmA+DCiw2nIbj4mSykmC5gmy9+xdc4OMJ9NYH306vAVYJ4yNO8ymn0SRINV9ENOVNOBrGPvSww
	F39SdxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHn4-00000002LTf-2QQf;
	Mon, 27 Jul 2026 09:38:30 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHn0-00000002LTJ-33VZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:38:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eqaiH3/8gwogQlQcVPAl0be7CAknXLZAcjJ8p31U84s=;
	b=ROZKl1oE8jinXqesNLdqQKCfOo/NBj8u0+BLYgKThiJLP3HkX0LLBuv9DN/Bp3HGtiP/K0Kf8
	smVPUru0I6nPAKJ2fHO8YGjKfVDJwJTSRF0eeHJ6S3sBx/fo1vTXBe9jtG1tudUJmFL+vBJVnrY
	OFVjwg94iTpaUhHg/0jr9lo=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4h7tZQ64hHz1cyph;
	Mon, 27 Jul 2026 17:28:46 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 379C64057C;
	Mon, 27 Jul 2026 17:38:11 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 27 Jul 2026 17:38:10 +0800
Message-ID: <864b868e-04b5-4187-9b93-72d476390906@huawei.com>
Date: Mon, 27 Jul 2026 17:38:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: ptrace: keep ARM_ORIG_r0 consistent with ARM_r0
 after ptrace writes
To: Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>
CC: <oleg@redhat.com>, <wade_farnsworth@mentor.com>, <will@kernel.org>,
	<stevenrwalter@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260725091452.1875627-1-ruanjinjie@huawei.com>
 <amSFfCPV2jWfhGq0@shell.armlinux.org.uk>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <amSFfCPV2jWfhGq0@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_023827_428588_C3DD7AE5 
X-CRM114-Status: GOOD (  26.40  )
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



在 2026/7/25 17:44, Russell King 写道:
> On Sat, Jul 25, 2026 at 05:14:52PM +0800, Jinjie Ruan wrote:
>> When ptrace modifies r0 during a syscall-entry stop via PTRACE_SETREGS or
>> PTRACE_POKEUSR, ARM_ORIG_r0 is not updated.  This causes seccomp filters
>> and tracepoints to read stale arguments, which disagree with the actual
>> value dispatched by the kernel.  This is particularly critical for the
>> SECCOMP_RET_TRACE re-evaluation path.
>>
>> Fix it by synchronizing ARM_ORIG_r0 after every arch-level ptrace register
>> write.  The update safely skips syscall-exit stops (where r0 holds the
>> return value) and NO_SYSCALL states to avoid corrupting non-syscall
>> contexts. And use ARM_ORIG_r0 in audit_syscall_entry to fix data
>> inconsistency with seccomp/tracepoints
> 
> ARM_ORIG_r0 is intentionally not always the same as ARM_r0, just as

Hi Russell,

+Cc Kees.

In my view, the fundamental issue here is not that orig_r0 must be
consistent with r0, or that orig_ax must be consistent with eax, but
rather that the parameters or system call numbers used by seccomp,
audit, and tracepoint during system call execution are consistent
(reflecting modifications made by ptrace).

After checking the x86 implementation based on your suggestions, I still
think there is a slight issue with the arm32 implementation. In my
rudimentary understanding, the differences are as follows:

On x86, orig_ax is used uniformly everywhere on syscall entry path as
below, therefore, I think the code related to x86 32-bit is not problematic:

do_int80_emulation()
    -> regs->orig_ax = regs->ax & GENMASK(31, 0) // backup syscall
number to orig_ax
    -> syscall_32_enter()
        -> regs->orig_ax
    -> nr = syscall_enter_from_user_mode_work() // return orig_ax which
may have been modified by ptrace
        -> __secure_computing()
           -> syscall_get_nr() -> regs->orig_ax
        -> trace_syscall_enter()
           -> syscall_get_nr() -> regs->orig_ax
        -> syscall_enter_audit()
           -> syscall_get_nr() -> regs->orig_ax
    -> do_syscall_32_irqs_on() // Use orig_ax as the system call number
to execute the system call. This is consistent with seccomp, audit, and
tracepoint.

But on arm32, the usage of orig_r0 and r0 is not consistent at the
system call entry point.

-> str r0, [sp, #S_OLD_R0] // backup r0 to ARM_ORIG_r0.
__sys_trace
   -> syscall_trace_enter()
      -> secure_computing()
         -> syscall_get_arguments() -> regs->ARM_ORIG_r0
      -> trace_sys_enter()
         -> syscall_get_arguments() -> regs->ARM_ORIG_r0
      -> audit_syscall_entry()
         -> regs->ARM_r0
         ^^^^^^^^^^^^^^^
   -> use r0 to invoke_syscall()
         ^^^^

Based on a fix patch by Kees six years ago, I understand that system
call parameters are similar to system call numbers. If ptrace or seccomp
modifies the system call parameters, then at that time, the tracing and
auditing mechanisms also need to be able to see this change.

I understand that the semantics of seccomp and trace/audit are intended
to reflect the latest relevant data of system calls that are "actually
executed".

Link: https://lkml.org/lkml/2020/9/11/1282

> orig_eax is not always the same as eax in x86. These exist to allow
> syscall restart as ARM_r0 / eax will be overwritten when a syscall
> returns. I don't see arch/x86/kernel/ptrace.c::putreg32() needing
> this kind of fixup, so why does ARM?
> 
> ARM_ORIG_r0 is set to the value of ARM_r0 when a syscall is entered,

Yes, that's true.

> otherwise it is set to ~0 as for other exception cases, the value is
> meaningless (there is no syscall restart in that path.)
> 
> If one changes both ARM_ORIG_r0 and ARM_r0 during the syscall exit
> path to e.g. -ERESTARTSYS and then raises a signal against the user
> program, then is it not possible that do_signal() to then see that
> case, and as regs->ARM_ORIG_r0 would now also contain -ERESTARTSYS,
> call the syscall with the first argument set to -ERESTARTSYS rather
> than the user's actual value?

We should not modify orig r0 on the system call exit path ; instead, we
should modify r0 to change the return value.

Best regards,
Jinjie

> 
> Userspace has full access to both ARM_r0 and ARM_ORIG_r0, and can
> decide what it wants to do in the same way that userspace has
> access to eax and orig_eax on x86.
> 
> Please check how this is handled on x86.
> 


