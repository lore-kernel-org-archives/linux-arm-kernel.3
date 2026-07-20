Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0EDC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 03:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0z6sh/KJ9O1KI6wSAtg1ENxH1VHZOrj/P++2HlNnhM=; b=HfGPwz7lFpiUeysROnsyU9trkw
	GSsEz102Z6beYR8u8wiNFXhKOu8VMuSM4xdZnNveHM+ugsuIa+VkBIAauE3WnPLA5gqsPg70KEuFb
	cq9VSZ/2TtVhjzd4KRMIq6Kfo3Id6K6ZzWgrCVQasD9VYKHZSrLZc80QsGauQ29LxyiSKKDNVqAbN
	FJZQcLnPbyt2DCa0pn5oSqldJuuRVijBG4+yjZGQIHoH1wxW6RUs5KXgHBMWqEHrogVBR+6TvNLED
	yKcQjzJfUvAxyxlDL8RmJoiVr6lwL0GJ9txPeI60RsLpY5icY9eptcYS47c2E+9MZdDomA5DyqgTm
	j+4jMNSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlf02-00000005nf6-0Eqj;
	Mon, 20 Jul 2026 03:49:02 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlezy-00000005neA-3GqK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 03:49:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=v0z6sh/KJ9O1KI6wSAtg1ENxH1VHZOrj/P++2HlNnhM=;
	b=RPEYKD29ppO4dwOtM21x+1TLwwPAiYBYn27HvNxVHEm6ixpwON7UXYdP4sYEYXs3Vj/qpVY6C
	qRej3WfZ2nl0LsDWbWaquBizM9+VJs3ahY3SyJij3Bh4ROHrNbDl9HCw3p8qsKbEunbunN18Myb
	8Wzq01DiTmd8/EqlEtRWPqk=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4h3R8S70GjzLlTV;
	Mon, 20 Jul 2026 11:39:20 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 45EEF40586;
	Mon, 20 Jul 2026 11:48:42 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Jul 2026 11:48:41 +0800
Message-ID: <8d3d3ea7-b250-4022-8ed7-6d438b43a518@huawei.com>
Date: Mon, 20 Jul 2026 11:48:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <kernel-team@android.com>,
	<linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Yiqi Sun <sunyiqixm@gmail.com>
References: <20260716120640.6590-1-will@kernel.org>
 <178420908877.33796.2351583216856259313.b4-ty@kernel.org>
 <alpsSRyTU_mquZyA@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <alpsSRyTU_mquZyA@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_204859_135652_B57F3B7B 
X-CRM114-Status: GOOD (  30.22  )
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



On 7/18/2026 1:54 AM, Will Deacon wrote:
> On Thu, Jul 16, 2026 at 05:48:01PM +0100, Will Deacon wrote:
>> On Thu, 16 Jul 2026 13:06:39 +0100, Will Deacon wrote:
>>> When seccomp support was originally added to arm64 in a1ae65b21941
>>> ("arm64: add seccomp support"), seccomp was erroneously called _before_
>>> the ptrace syscall-enter-stop and therefore the tracer could trivially
>>> manipulate the syscall register state after the seccomp check had
>>> passed. This was subsequently fixed in a5cd110cb836 ("arm64/ptrace: run
>>> seccomp after ptrace") by moving the seccomp check after the tracer has
>>> run. Unfortunately, a decade later, that fix has been reported to be
>>> incomplete.
>>>
>>> [...]
>>
>> Applied to arm64 (for-next/fixes), thanks!
>>
>> [1/1] arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
>>       https://git.kernel.org/arm64/c/e057b9477232
> 
> Bah, I've had to revert this. I think Sashiko makes a good point here
> that the seccomp interaction is still broken when the filter is
> re-evaluated after the tracer stop, because that all happens inside
> secure_computing() so we don't get a chance to update 'orig_x0':
> 
> https://sashiko.dev/#/patchset/20260716120640.6590-1-will@kernel.org
> 

Hi Will,

Yes, I also think the point raised by Sashiko is meaningful.

After reviewing the relevant code, I believe that the issue Sashiko
pointed out regarding the compat task also exists.

My confusion is that on arm64 compat mode, both audit and trace use
orig_x0, but the first parameter used for executing system calls is
regs->reg[0]. If x0 is modified at the system call entry point in ptrace
but orig_x0 is not modified, or if orig_x0 is modified but x0 is not,
then the first parameter for audit and the actual system call being
executed will be out of sync. Could there be any issues here? Is it the
responsibility of ptrace to ensure that orig_x0 and x0 are synchronized
at the system call entry point on arm64 compat mode?

Whether it is ptrace or the kernel, ensuring that orig_x0 and x0 are
synchronized at the entry point of a system call, I believe it is
reasonable to use orig_x0 as the first parameter of the system call
execution and pre-set an error code in advance, as this way orig_x0
always retains the latest value of x0.

diff --git a/arch/arm64/include/asm/syscall_wrapper.h
b/arch/arm64/include/asm/syscall_wrapper.h
index abb57bc54305..6b13d7c8ad95 100644
--- a/arch/arm64/include/asm/syscall_wrapper.h
+++ b/arch/arm64/include/asm/syscall_wrapper.h
@@ -12,7 +12,7 @@

 #define SC_ARM64_REGS_TO_ARGS(x, ...)                          \
        __MAP(x,__SC_ARGS                                       \
-             ,,regs->regs[0],,regs->regs[1],,regs->regs[2]     \
+             ,,regs->orig_x0,,regs->regs[1],,regs->regs[2]     \
              ,,regs->regs[3],,regs->regs[4],,regs->regs[5])

 #ifdef CONFIG_COMPAT
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 2535cae9413d..a978bab59924 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -62,6 +62,7 @@ static __always_inline void el0_svc_common(struct
pt_regs *regs, int scno, int s
        unsigned long work;

        regs->orig_x0 = regs->regs[0];
+       syscall_set_return_value(current, regs, -ENOSYS, 0);
        regs->syscallno = scno;

        /*
@@ -94,23 +95,6 @@ static __always_inline void el0_svc_common(struct
pt_regs *regs, int scno, int s

        work = READ_ONCE(current_thread_info()->syscall_work);
        if (unlikely(work & SYSCALL_WORK_ENTER)) {
-               /*
-                * The de-facto standard way to skip a system call using
ptrace
-                * is to set the system call to -1 (NO_SYSCALL) and set
x0 to a
-                * suitable error code for consumption by userspace.
However,
-                * this cannot be distinguished from a user-issued
syscall(-1)
-                * and so we must set x0 to -ENOSYS here in case the
tracer doesn't
-                * issue the skip and we fall into trace_exit with x0
preserved.
-                *
-                * This is slightly odd because it also means that if a
tracer
-                * sets the system call number to -1 but does not
initialise x0,
-                * then x0 will be preserved for all system calls apart
from a
-                * user-issued syscall(-1). However, requesting a skip
and not
-                * setting the return value is unlikely to do anything
sensible
-                * anyway.
-                */
-               if (scno == NO_SYSCALL)
-                       syscall_set_return_value(current, regs, -ENOSYS, 0);
                if (!syscall_trace_enter(regs, work, scno))
                        goto trace_exit;


> I've got a v3 that takes a different approach, so I'll send that out
> shortly. Jinjie, thanks for sending the selftests, but maybe we can
> extend them to cover the loophole above as wel?

I will update the test cases to cover the corner case it pointed out.

Best regards,
Jinjie

> 
> Will


