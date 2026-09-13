Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49819C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 07:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hs7PCl8ZdlMvhgHWX0PHVYVp8DWBXv1h24H33tOaVTY=; b=QJ7SomBLa04iVcC/AWoVv+Nc+V
	QjdG0M9GFEFJMjiJPxwReW7oIA+Mko/PJXyyUXBIDwNxBDOREizneg8jXAIVgjYmyYPT2qSHWlTo0
	reZ9tVjUzkT8un4NJaTzozIYtJ6ejGk2/TK+qqc30n1fxVMHRx6t60TTk0tGdZGVhYwnzrF2+XJ2z
	ZyfGR/vfVD1JmLnj+eL9V8E26uVQFTOXeNyxUEoTl99PwzrAjAYFPJkqImWr/RAvOOwbNEITK910K
	nj8p3W+jnMcHoPbq74lbFh1/wbmXY5N01DGrT2bSKPTtqllL/3wCnjqhB33vL3m4FIDdQEDnRtGJo
	Vsrd7EkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5eQ5-00000001U3H-2WHG;
	Sun, 13 Sep 2026 07:14:33 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5eQ3-00000001U2u-3LAB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 07:14:33 +0000
Received: by mail-yx2-x11.google.com with SMTP id 00721157ae682-85d46e4cdcdso7810387b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 00:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789283670; cv=none;
        d=google.com; s=arc-20260327;
        b=Z10O1VEMfXUiiYtigRFpTclmcckoGO8BDI2NEZwZCqWYvhO9NgQWb6nHZNkO3+M9oX
         bNqH4SNmP1l8h2mfKS4Z3Mq2zerERWgy1Bc0D4E77L1sjS7hLDRUqNg0BBHDaDFcOddB
         CXvNSjla3sRRZpLkXOkru7csy2UPHVuMLj/YPTFV24fspX6mlG2vBHQ/BNieFopHDZez
         u0Vbom9sAGjjh6C3q6dI+5x2i8RWLgnCbZgGmSSj4BOufHaZAUL1QuykZKBPOcydoc62
         D4OTJt3nzQfl0+TVLmYvxnHMWZHHzKZbxtRJMyL3uzINbVoFdTXM3gf+bmj/Xx2Qwffz
         c4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hs7PCl8ZdlMvhgHWX0PHVYVp8DWBXv1h24H33tOaVTY=;
        fh=LGB9CVrUD9Hx/kYxPcRcX0NJM4OkcC+OfDFkF9XhWXE=;
        b=oaXRmzffegvhLq00Avbp2vAAV8HC8wzmlNsMCzZBHhYgGqcZF9jcAW8FxF8fb8ojGY
         d4C/d7SwDu3XhgUa+saPzv0XGPsKD1ym807Hv44WpJ6OKCuzJSnLuAdkZfWt9GTFBpWB
         xla++Y+H5/ro7pXPH1pnQ7gN3JIwSU7AUURqdxa5Todw/0Gksl1heju86MQ4kLCnjfVd
         CZQC45Z/5YW8ETv+FBcoDEDtfbNCVyzh0Viq94r4Oy85GvL8V0XDG6S/Kn/ydjOHS0TE
         nT7VbEtvCLRmW6pYLspBCvrW9vMB4JdIvWwE9TV7VjWKSol3euv7otimkzl3zfSd3X92
         W5VA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789283670; x=1789888470; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hs7PCl8ZdlMvhgHWX0PHVYVp8DWBXv1h24H33tOaVTY=;
        b=i//DLB7BB9V8UNKDX9kAauBrNImhcHubLzSDMRgYlO2s4ik+heQDbgrBDygRayZLHk
         Q7cCZi5kYBIxyVvML2JuksSnM44xMGXgPAIDZ1FkXdLIvaOs3miUCpx+FBmFtvLN+N9X
         JQ5/nO4eVKwPoUEhJJowjdSd2b9LyeZgaYxY9GS/o+W/mKAe2QsT0Cu0BAbcflMqZlRn
         5dfXbZXcEKC8wxTm77Ju1yZuCo7htvbZeNPITIzRA0TmeqYF6KCC3GXkHvOmGQQqgFm8
         tXDOB1KGSagvCWHLxTgCaLAPzDQVXB+7IgblwdTLiNxxz63bFJWCdpsoOHbqzixEw5MI
         a4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789283670; x=1789888470;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs7PCl8ZdlMvhgHWX0PHVYVp8DWBXv1h24H33tOaVTY=;
        b=KYpRsZwbdp9wSpDEcJusP+bdW+YW+k3xvOpmtm3NUPvQ+ymiL1FefQiuCZzr1ZslCM
         5D/xoPCHcC1EHJ6Lxys9dz2q0Uu7h7UCWiRSC3REQ5ce5R/oAt0EaKlKwomD/j6toodB
         7jmNv5ZzI2Xic+FFsRrd7hso12ZF4kwE94Tou8uWTSP29IEJZWih1fo8mH1RfGNnlAAq
         U4xL45q4TgO3xxiFgG+kIB9NfmqV9vAHv3w+Td/v+XtQb+sMBaBn2QIOcNo+BiAFBNMA
         x62ja2ULzQOZx4cnRN8hdPkgPg290BwdKwpzKzOv59ZF9QI9QmBS9AD/oZxPPR1u0pxR
         SNMg==
X-Forwarded-Encrypted: i=1; AKwUvBwU1YeJWsvqbnqsvNDczkYer2Sg1m1mkzmV+mWks5Q5/VUzqgH/Xgtsjqg+VGYkhXgE8oXcJxxS4Wcjxx37QkQP@lists.infradead.org
X-Gm-Message-State: AFuF++kXuIlMr8IVofFqx00ndfWlGUMMxPBRTiLMKfNKaAAxMXBKUdG8
	RJK0ErGNL+gEDrkSekYIad8O2xDBnRG1xWafdc826y2bbYtalD+POa3+RaQ71pLPr1LV7vR87Ix
	4HVqSXAhgom954XvFFcIqez5ANgP8Dlg=
X-Gm-Gg: AYBFou0BrmMk49szzBB2DZUj+3iMGMClqSC4bW5ZqP9KEHS8m0ZyD6YUny22z+g4RyO
	K+eLY/R/60ffxt5djMPlCiTWbc4rkjF0JQPeERW+VcAKRfPPOa9QlhcBM09Cys2n7TEfaJTO8hu
	xLUJBILGg/9WCCcT0H9Zg5DN02FDvS0UKv4WTeOauLjZjVt7nIGzaxz2//B/yutYx4gKlIBdsIv
	2aWLc7xLSOwiN49mB/MXh+xDdHiI9IdFbxyer1sNvXy+VYS+9Vg6hgkptnqiKwLxmP/rKWPeig2
	2G+4ksTnzQa7WwYN7cYB/L5YizTHtydmw1IvGQBh1qCnbE0wN0NZThiWpxTP8d5EWa7O0Iy+IBh
	RbxRzMHtE55CO
X-Received: by 2002:a05:690c:e3cd:b0:87f:a9c6:470b with SMTP id
 00721157ae682-884ae7afba1mr42342687b3.2.1789283670033; Sun, 13 Sep 2026
 00:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 13 Sep 2026 15:13:54 +0800
X-Gm-Features: AcwNN1UspbNtkItJTCvCtD3l6jewbKb17CHUZA9TTmeWwkQ5AKSxYWpYJfiUJCk
Message-ID: <CALOAHbAE1Lq=EZE=HpNJS3dxm_sVDmjWxNm5m0ugerwWr9RN6g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 00/15] rcu-tasks: let preemption outside
 trampolines be a quiescent state
To: Josef Bacik <josef@toxicpanda.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Andy Lutomirski <luto@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_001431_864366_8FCB1277 
X-CRM114-Status: GOOD (  25.08  )
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

On Sat, Sep 12, 2026 at 2:54=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> v1: https://lore.kernel.org/all/20260910-b4-rcu-tasks-preempt-qs-v1-0-d44=
69f4cc101@toxicpanda.com/
>
> v1->v2:
> - Only walk the kprobe hash while the optimizer is actually waiting (Sash=
iko).
> - Re-check the kprobe jump window at every QS decision instead of once at
>   preemption time (AI review).
> - Updated Documentation/RCU for the new rule (AI review).
> - Added 14/15 and 15/15 to address Paul's comments.
> - Added a comment in trace_recursion.h per Steve.
> - No change for the arm64 ftrace_static_tramp_end report, the Kconfig
>   dependency already covers it (Sashiko).
> - Re-ran the x86-64 QEMU tests, still 0.2-0.3s and clean.
>
> --- Original email ---
>
> Tasks RCU only treats a voluntary context switch, usermode or idle as a
> quiescent state, because a preempted task may be sitting in a trampoline
> that is about to be freed. That was a fine trade when PREEMPT_NONE
> servers compiled Tasks RCU away and PREEMPT desktops rarely ran
> long-lived in-kernel loops. PREEMPT_LAZY changes both halves at once:
> Tasks RCU is now real on server configs, and cond_resched() is a no-op,
> so a CPU-bound kthread or kworker only ever loses the CPU by being
> preempted, which is exactly the event Tasks RCU refuses to count.
>
> The way this showed up for us was a cgroup writeback worker draining a
> very large cgwb for around eleven minutes on an arm64 box. Nothing wrong
> with that on its own, but a BPF program detach on another CPU went
> bpf_trampoline_update() -> ftrace_shutdown() -> synchronize_rcu_tasks()
> while holding trampoline_mutex, forty-odd tasks piled up behind the
> mutex, and the hung task detector panicked the machine. The kprobe jump
> optimizer is worse in principle: it does synchronize_rcu_tasks() under
> kprobe_mutex, text_mutex and cpus_read_lock(), so one long-running
> kthread can stall static key updates and CPU hotplug for its whole run.
> The current answer is to find each such loop and add
> cond_resched_tasks_rcu_qs() to it, which is the kind of annotation
> PREEMPT_LAZY was supposed to let us stop writing.

Hello Josef,

Thanks for the great work!

We've run into exactly the same issue on our production servers
running the 6.18.y stable kernel:

[   84.393333] INFO: task bpf-thp:10274 blocked for more than 28 seconds.
[   84.393880]       Not tainted 6.18.44-3 #3.infra
[   84.394214] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[   84.394759] task:bpf-thp      state:D stack:0     pid:10274
tgid:10274 ppid:10266  task_flags:0x400100 flags:0x00080001
[   84.394764] Call Trace:
[   84.394765]  <TASK>
[   84.394767]  __schedule+0x2c1/0x6f0
[   84.394772]  schedule+0x2a/0xb0
[   84.394775]  schedule_preempt_disabled+0x15/0x30
[   84.394777]  __mutex_lock.constprop.0+0x3a2/0x9c0
[   84.394781]  __mutex_lock_slowpath+0x13/0x20
[   84.394784]  mutex_lock+0x37/0x50
[   84.394786]  bpf_trampoline_get+0x2a/0x80
[   84.394791]  check_attach_btf_id+0x32c/0x3d0
[   84.394796]  ? __pfx_mem_cgroup_css_offline+0x10/0x10
[   84.394800]  bpf_check+0x4d6/0xf20
[   84.394804]  bpf_prog_load+0x4d7/0xb00
[   84.394808]  ? avc_has_perm+0x42/0xd0
[   84.394811]  __sys_bpf+0x729/0xd50
[   84.394815]  __x64_sys_bpf+0x1a/0x30
[   84.394816]  x64_sys_call+0x19e1/0x2190
[   84.394820]  do_syscall_64+0x67/0xe10
[   84.394823]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   84.394825] RIP: 0033:0x7f2aa7e3ee5d
[   84.394831] RSP: 002b:00007ffd2b3e2a88 EFLAGS: 00000246 ORIG_RAX:
0000000000000141
[   84.394834] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007f2aa7e=
3ee5d
[   84.394835] RDX: 0000000000000094 RSI: 00007ffd2b3e2b10 RDI: 00000000000=
00005
[   84.394837] RBP: 0000000000000094 R08: 00007ffd2b3e2c30 R09: 00000000000=
00018
[   84.394838] R10: 0000000000000070 R11: 0000000000000246 R12: 00007ffd2b3=
e2b10
[   84.394840] R13: 00007ffd2b3e2b10 R14: 0000000000000005 R15: 00000000215=
804c0
[   84.394843]  </TASK>
[   84.394848] INFO: task bpf-thp:10274 is blocked on a mutex likely
owned by task kworker/1:1:80.
[   84.395463] task:kworker/1:1     state:I stack:0     pid:80
tgid:80    ppid:2      task_flags:0x4208060 flags:0x00080000
[   84.395468] Workqueue: events bpf_link_put_deferred
[   84.395474] Call Trace:
[   84.395475]  <TASK>
[   84.395477]  __schedule+0x2c1/0x6f0
[   84.395482]  schedule+0x2a/0xb0
[   84.395485]  schedule_timeout+0xea/0x100
[   84.395488]  ? trace_hardirqs_off+0x30/0x90
[   84.395492]  ? trace_hardirqs_on+0x2b/0xa0
[   84.395494]  __wait_for_common+0x94/0x1b0
[   84.395498]  ? __pfx_schedule_timeout+0x10/0x10
[   84.395502]  wait_for_completion_state+0x21/0x40
[   84.395505]  __wait_rcu_gp+0x135/0x140
[   84.395510]  ? 0xffffffffc03fed00
[   84.395514]  synchronize_rcu_tasks+0x56/0xb0
[   84.395517]  ? __pfx_call_rcu_tasks+0x10/0x10
[   84.395521]  ? __pfx_wakeme_after_rcu+0x10/0x10
[   84.395525]  ftrace_shutdown.part.0+0xd8/0x1f0
[   84.395530]  ? 0xffffffffc03fed00
[   84.395533]  unregister_ftrace_function+0x47/0x150
[   84.395537]  ? 0xffffffffc03fed00
[   84.395539]  unregister_ftrace_direct+0x49/0xc0
[   84.395542]  bpf_trampoline_update+0x448/0x4e0
[   84.395545]  ? __radix_tree_delete+0x84/0x100
[   84.395547]  bpf_trampoline_unlink_prog+0x8f/0x150
[   84.395550]  bpf_tracing_link_release+0x1a/0x50
[   84.395553]  bpf_link_free+0x57/0xd0
[   84.395555]  bpf_link_put_deferred+0x12/0x20
[   84.395558]  process_one_work+0x1b3/0x400
[   84.395561]  worker_thread+0x1a3/0x310
[   84.395564]  kthread+0x107/0x240
[   84.395567]  ? trace_hardirqs_on+0x2b/0xa0
[   84.395569]  ? __pfx_worker_thread+0x10/0x10
[   84.395571]  ? _raw_spin_unlock_irq+0x11/0x30
[   84.395574]  ? __pfx_kthread+0x10/0x10
[   84.395577]  ret_from_fork+0x10d/0x150
[   84.395580]  ? __pfx_kthread+0x10/0x10
[   84.395583]  ret_from_fork_asm+0x1a/0x30
[   84.395588]  </TASK>
[   93.199020] rcu_tasks_wait_gp: rcu_tasks grace period number 1
(since boot) is 40249 jiffies old.

We eventually traced the root cause to a problematic BPF program
looping inside do_check() in the BPF verifier, and we've worked around
it with the following change:

--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -20411,8 +20411,7 @@ static int do_check(struct bpf_verifier_env *env)
                if (signal_pending(current))
                        return -EAGAIN;

-               if (need_resched())
-                       cond_resched();
+               cond_resched_tasks_rcu_qs();

                if (env->log.level & BPF_LOG_LEVEL2 && do_print_state) {
                        verbose(env, "\nfrom %d to %d%s:",

We've also observed random Tasks RCU stalls caused by kcompactd, but
since they don't result in hung tasks, we haven't applied a workaround
for those yet.

Hopefully we can come up with a generic solution for these Tasks RCU stalls=
.

[...]

--=20
Regards
Yafang

