Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 03:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coAp1/S2xctKB85dnF1LBpH44XqeDN5nk5zahC+pQWY=; b=0tl1l+9lPjDXweOhXtCfiwXrh5
	qBihnJVsm5s7RlsdxS8OH88vx+GpqLp3ReprsY8eVP9fXOEzdBLPx/IiMrob94y/GL5NW7gGVFopa
	4k061ID0jm0JgmURf2daE7fp0eOZSMNcazXWuHT2VIzpR+m8WmZvBnqoNB6f3tqovHgZ78VdLegmP
	/eXYthFOrRJSAR0h+Whj6bOkoZHyJtQ2bnoSZP1RbRTrihAXoi2y/7nqMn4gsEhzxRF587YuDam5N
	PLEjjKEuELq90W4DtojXxZPYqKq5IpENgTNYbAn0eZ+CPrENz4+FESK/W8eth0uPuFBvmCXX1P/bJ
	2K9fknsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjThC-0000000Ao5u-2jBs;
	Tue, 14 Jul 2026 03:20:34 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjTh9-0000000Ao5G-33o8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 03:20:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=coAp1/S2xctKB85dnF1LBpH44XqeDN5nk5zahC+pQWY=;
	b=tIrx4yUIxEYsu4N8ddn/j7pDTEwMbaFJxFdcq5RdyqXXGkUSS5fEhiAMTYaRUOH+Zf6Z3KwZH
	OH4EwYcH3DnbYY5g8jhVD19gJiOV0mJUMBsfdq2zIGbKnSawdju+OkvEgFWVr4ahGgmCJjHnYK1
	Vlg28voFBLIuc57uky25vq4=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gzkpZ2vPdzKm52;
	Tue, 14 Jul 2026 11:11:02 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C1A740586;
	Tue, 14 Jul 2026 11:20:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Jul 2026 11:20:21 +0800
Message-ID: <1d55c62e-7c08-4b2b-a009-b770c5ac13bc@huawei.com>
Date: Tue, 14 Jul 2026 11:20:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: ptrace: use live x0 for seccomp and audit after
 ptrace
To: Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Yiqi Sun <sunyiqixm@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<rmk+kernel@armlinux.org.uk>, <kees@kernel.org>, <mark.rutland@arm.com>
References: <20260529065444.1336608-1-sunyiqixm@gmail.com>
 <2f435bab0d61d0bf8fbaa54203525aae8e8f5371.1782384161.git.sunyiqixm@gmail.com>
 <akJuljttiQoki3sq@willie-the-truck> <akP8-ddTn9bhIDEW@arm.com>
 <1610f167-1af0-4d20-877c-b362b9b49d94@huawei.com>
 <alTxBVLJmQ7-ZnSS@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <alTxBVLJmQ7-ZnSS@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_202032_396965_799DB591 
X-CRM114-Status: GOOD (  40.36  )
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



On 7/13/2026 10:07 PM, Will Deacon wrote:
> On Mon, Jul 13, 2026 at 03:49:18PM +0800, Jinjie Ruan wrote:
>> On 7/1/2026 1:29 AM, Catalin Marinas wrote:
>>> I think we need to keep orig_x0 as our original arg0 throughout the
>>> kernel and just fix the tracer path to sync it on the syscall entry. It
>>> doesn't unclutter the code but it shouldn't break the ABI either (unless
>>> someone relied on the ptrace change x0 and not being noticed by
>>> seccomp). Something like below:
>>>
>>> ----------------8<-----------------------------
>>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>>> index 4d08598e2891..cd21b301e154 100644
>>> --- a/arch/arm64/kernel/ptrace.c
>>> +++ b/arch/arm64/kernel/ptrace.c
>>> @@ -2417,6 +2417,18 @@ int syscall_trace_enter(struct pt_regs *regs)
>>>  		ret = report_syscall_entry(regs);
>>>  		if (ret || (flags & _TIF_SYSCALL_EMU))
>>>  			return NO_SYSCALL;
>>> +		/*
>>> +		 * Keep orig_x0 authoritative so that seccomp (via
>>> +		 * syscall_get_arguments()), audit and the restart path all
>>> +		 * see the same first argument the syscall is dispatched with,
>>> +		 * even if it has been updated by a tracer. Skip this for
>>> +		 * NO_SYSCALL (set either by the user or the tracer) as
>>> +		 * regs[0] holds the return value (see the comment in
>>> +		 * el0_svc_common()). For compat, orig_r0 is provided directly
>>> +		 * through GPR index 17.
>>> +		 */
>>> +		if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
>>> +			regs->orig_x0 = regs->regs[0];
>>
>> Can we place this fix in report_syscall_entry()? The generic entry
>> framework has already reserved the function
>> arch_ptrace_report_syscall_permit_entry() for architecture-specific
>> customization, so switching to it might be more convenient.
> 
> Hmm, your comment prompted me to look at this some more and now I'm
> unsure that the seccomp handling is correct, even with the fix above.

Hi Will,

It seems that this issue can be reproduced itself and Catalin's patch
can fix the original question.

Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>

I used DeepSeek to help write the following test method and script,
which can successfully reproduce the issue.

# Test Approach

The child process installs a seccomp BPF filter with the following rule:

If the first argument (fd) of write equals 2 → allow (SECCOMP_RET_ALLOW)

Otherwise → immediately kill the process (SECCOMP_RET_KILL)

The parent process traces the child using ptrace with PTRACE_SYSCALL. At
the syscall-enter stop, before seccomp runs, the parent modifies the
child’s x0 register from 2 to 1.

When execution continues:

If the bug is present: seccomp reads the argument from orig_x0, which
still holds the original value 2, so the filter allows the call.
However, the kernel dispatches write with the modified x0 = 1. The child
process writes data to stdout instead of being killed.

After the fix: seccomp sees the same argument as regs[0] (both are 1),
which does not satisfy the fd == 2 condition, and the child is killed by
SIGSYS.

By observing whether the child process is killed by SIGSYS, the presence
of the bug can be reliably determined.

# kernel debug patch

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4d08598e2891..d27e44395298 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2408,21 +2408,58 @@ static void report_syscall_exit(struct pt_regs
*regs)
        }
 }

+static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
+{
+       /*
+        * Keep orig_x0 authoritative so that seccomp (via
+        * syscall_get_arguments()), audit and the restart path all see
the same
+        * first argument the syscall is dispatched with, even if it has
been
+        * updated by a tracer. Skip this for NO_SYSCALL (set either by
the user
+        * or the tracer), as regs[0] holds the return value (see the
comment in
+        * el0_svc_common()) and can be unwound using syscall_rollback().
+        * For compat tasks, orig_r0 is provided directly through GPR
index 17.
+        */
+       if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
+               regs->orig_x0 = regs->regs[0];
+}
+
 int syscall_trace_enter(struct pt_regs *regs)
 {
        unsigned long flags = read_thread_flags();
        int ret;

+       if (regs->syscallno == 64)
+               printk("[DEBUG] Enter: syscallno=%d, orig_x0=0x%llx,
x0=0x%llx\n",
+                      regs->syscallno, regs->orig_x0, regs->regs[0]);
+
        if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
                ret = report_syscall_entry(regs);
                if (ret || (flags & _TIF_SYSCALL_EMU))
                        return NO_SYSCALL;
+
+               if (regs->syscallno == 64)
+                       printk("[DEBUG] After Ptrace: syscallno=%d,
orig_x0=0x%llx, x0=0x%llx\n",
+                              regs->syscallno, regs->orig_x0,
regs->regs[0]);
+
+               /*
+                * Ensure ptrace changes to x0 are visible to seccomp
+                * ptrace exits (SECCOMP_RET_TRACE).
+                */
+               update_syscall_orig_x0_after_ptrace(regs);
+
+               if (regs->syscallno == 64)
+                       printk("[DEBUG] After Ptrace update:
syscallno=%d, orig_x0=0x%llx, x0=0x%llx\n",
+                              regs->syscallno, regs->orig_x0,
regs->regs[0]);
        }

        /* Do the secure computing after ptrace; failures should be fast. */
        if (secure_computing() == -1)
                return NO_SYSCALL;

+       if (regs->syscallno == 64)
+               printk("[DEBUG] After Seccomp: syscallno=%d,
orig_x0=0x%llx, x0=0x%llx\n",
+                      regs->syscallno, regs->orig_x0, regs->regs[0]);
+
        if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
                trace_sys_enter(regs, regs->syscallno);

```

# Test results

## baseline (without update_syscall_orig_x0_after_ptrace()

    # ./bypass_seccomp_orig_x0
    [DEBUG] Enter: syscallno=64, orig_x0=0x2, x0=0x2
    [ptrace] syscall=64, x0=2 -> changed x0 to 1
    [DEBUG] After Ptrace: syscallno=64, orig_x0=0x2, x0=0x1
    [DEBUG] After Ptrace update: syscallno=64, orig_x0=0x2, x0=0x1
    [DEBUG] After Seccomp: syscallno=64, orig_x0=0x2, x0=0x1
    if you see this, bypass worked
    [ptrace] syscall=64, x0=31
    [ptrace] syscall=94, x0=0
    Child exited normally, bypass succeeded.

## After add update_syscall_orig_x0_after_ptrace() after ptrace

    # ./bypass_seccomp_orig_x0
    [DEBUG] Enter: syscallno=64, orig_x0=0x2, x0=0x2
    [ptrace] syscall=64, x0=2 -> changed x0 to 1
    [DEBUG] After Ptrace: syscallno=64, orig_x0=0x2, x0=0x1
    [DEBUG] After Ptrace update: syscallno=64, orig_x0=0x1, x0=0x1
    audit: type=1326 audit(1783997451.048:2): auid=4294967295 uid=0
gid=0 ses=4294967295 pid=232 comm="bypass_seccomp_"
exe="/mnt/bypass_seccomp_ori0
    [ptrace] syscall=64, x0=1
    Child killed by SIGSYS – seccomp correctly denied (bug fixed).

# Test program
cat bypass_seccomp_orig_x0.c

        #define _GNU_SOURCE
        #include <stdio.h>
        #include <stdlib.h>
        #include <unistd.h>
        #include <signal.h>
        #include <sys/ptrace.h>
        #include <sys/wait.h>
        #include <sys/syscall.h>
        #include <linux/filter.h>
        #include <linux/seccomp.h>
        #include <linux/audit.h>
        #include <sys/prctl.h>
        #include <errno.h>
        #include <sys/uio.h>
        #include <elf.h>

        // Equivalent definition of Arm64 user_regs_struct
        struct user_pt_regs {
            unsigned long long regs[31];
            unsigned long long sp;
            unsigned long long pc;
            unsigned long long pstate;
        };

        int main(void)
        {
            pid_t child = fork();
            if (child == 0) {
                /* ========== Child process ========== */
                if (ptrace(PTRACE_TRACEME, 0, NULL, NULL) == -1) {
                    perror("ptrace TRACEME");
                    exit(1);
                }
                raise(SIGSTOP);  // Wait for parent to be ready

                /*
                * Seccomp filter logic:
                * If the syscall is not write → allow
                * If it is write:
                *   - If the first argument (fd) == 2 → allow
                *   - Otherwise → kill the process
                */
                struct sock_filter filter[] = {
                    // [0] Load syscall number (nr, offset 0)
                    BPF_STMT(BPF_LD | BPF_W | BPF_ABS, 0),
                    // [1] If nr != __NR_write (64), jump to [5] (ALLOW)
                    BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_write, 0, 3),
                    // [2] Load low 32 bits of args[0] (offset 16)
                    BPF_STMT(BPF_LD | BPF_W | BPF_ABS, 16),
                    // [3] If args[0] == 2, jump to [5] (ALLOW), else
fall through to [4] (KILL)
                    BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 2, 1, 0),
                    // [4] Kill the process
                    BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
                    // [5] Allow execution
                    BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
                };
                struct sock_fprog prog = {
                    .len = sizeof(filter) / sizeof(filter[0]),
                    .filter = filter,
                };

                if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0) == -1) {
                    perror("prctl NO_NEW_PRIVS");
                    exit(1);
                }
                if (prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &prog) ==
-1) {
                    perror("seccomp");
                    exit(1);
                }

                /* Execute write(2, ...); parent will change x0 to 1 at
syscall entry */
                syscall(__NR_write, 2, "if you see this, bypass
worked\n", 31);
                _exit(0);
            }

            /* ========== Parent process ========== */
            int status;
            waitpid(child, &status, 0);  // Wait for SIGSTOP
            if (!WIFSTOPPED(status) || WSTOPSIG(status) != SIGSTOP) {
                fprintf(stderr, "unexpected stop\n");
                return 1;
            }

            ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_TRACESYSGOOD);
            ptrace(PTRACE_SYSCALL, child, 0, 0);

            int bypass = 0;
            while (1) {
                waitpid(child, &status, 0);

                if (WIFEXITED(status)) {
                    printf("Child exited normally, bypass succeeded.\n");
                    bypass = 1;
                    break;
                }
                if (WIFSIGNALED(status)) {
                    if (WTERMSIG(status) == SIGSYS)
                        printf("Child killed by SIGSYS – seccomp
correctly denied (bug fixed).\n");
                    else
                        printf("Child killed by signal %d\n",
WTERMSIG(status));
                    break;
                }
                if (WIFSTOPPED(status)) {
                    int sig = WSTOPSIG(status);
                    if (sig == (SIGTRAP | 0x80)) {  // syscall stop
                        struct user_pt_regs regs;
                        struct iovec iov = { .iov_base = &regs, .iov_len
= sizeof(regs) };
                        ptrace(PTRACE_GETREGSET, child, NT_PRSTATUS, &iov);

                        unsigned long long syscall_nr = regs.regs[8];
// x8 holds the syscall number
                        unsigned long long x0 = regs.regs[0];
                        printf("[ptrace] syscall=%lld, x0=%lld",
syscall_nr, x0);

                        // Only intervene at the entry of the write
syscall, and change x0 from 2 to 1
                        if (syscall_nr == __NR_write && x0 == 2) {
                            regs.regs[0] = 1;
                            ptrace(PTRACE_SETREGSET, child, NT_PRSTATUS,
&iov);
                            printf(" -> changed x0 to 1\n");
                        } else {
                            printf("\n");
                        }
                        ptrace(PTRACE_SYSCALL, child, 0, 0);
                    } else {
                        // Forward other signals to the child as-is
                        ptrace(PTRACE_SYSCALL, child, 0, sig);
                    }
                }
            }

            return bypass ? 1 : 0; // Return 1 indicates the
vulnerability exists (bypass succeeded)
    }

> 
> If the seccomp filters return SECCOMP_RET_TRACE, we'll do another ptrace
> exit but we won't re-sync orig_x0, so audit could see a stale value. So
> I think we might need something like the diff below, which looks like it
> might be a pain for the generic entry code.
> 
> Will
> 
> --->8
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 4d08598e2891..57e8c6714d44 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2408,6 +2408,21 @@ static void report_syscall_exit(struct pt_regs *regs)
>         }
>  }
>  
> +static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
> +{
> +       /*
> +        * Keep orig_x0 authoritative so that seccomp (via
> +        * syscall_get_arguments()), audit and the restart path all see the same
> +        * first argument the syscall is dispatched with, even if it has been
> +        * updated by a tracer. Skip this for NO_SYSCALL (set either by the user
> +        * or the tracer), as regs[0] holds the return value (see the comment in
> +        * el0_svc_common()) and can be unwound using syscall_rollback().
> +        * For compat tasks, orig_r0 is provided directly through GPR index 17.
> +        */
> +       if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
> +               regs->orig_x0 = regs->regs[0];
> +}
> +
>  int syscall_trace_enter(struct pt_regs *regs)
>  {
>         unsigned long flags = read_thread_flags();
> @@ -2417,12 +2432,21 @@ int syscall_trace_enter(struct pt_regs *regs)
>                 ret = report_syscall_entry(regs);
>                 if (ret || (flags & _TIF_SYSCALL_EMU))
>                         return NO_SYSCALL;
> +
> +               /*
> +                * Ensure ptrace changes to x0 are visible to seccomp
> +                * ptrace exits (SECCOMP_RET_TRACE).
> +                */
> +               update_syscall_orig_x0_after_ptrace(regs);
>         }
>  
>         /* Do the secure computing after ptrace; failures should be fast. */
>         if (secure_computing() == -1)
>                 return NO_SYSCALL;
>  
> +       /* Ensure seccomp updates to x0 are visible to audit. */
> +       update_syscall_orig_x0_after_ptrace(regs);
> +
>         if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
>                 trace_sys_enter(regs, regs->syscallno);
>  
> 


