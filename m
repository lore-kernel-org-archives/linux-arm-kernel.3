Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1BAC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9n9xncSfJUqF3qhAWmrgAzO9fCiQaEXfBzNsshntNyI=; b=CKw/TMOci2nVPfvl4kpX2HRpCX
	44UFk0AU72WWcdAnX/CH2+KNc1VrG7gK+2Jt9DCAOTE15OLhsb8dUCi9lziydC1dp7A7AnUMOhwUd
	SeJy9b1KiUyfltZmnKMyYk3aWgcTWblR6mAyWEG9Rw6W5RHLtB/L8L3dloNrIe0bN6fSIl3TSwVmY
	hYrnSMICFIJYuiLLu+tfavIACORZp7hIr0+GQ/q6HysyMyQ2MA0bqakL/J0r0HiY1tzD70N9P+4tD
	WV9gFnu6/78HWJg/aI4KTkozTlhexv1pqtCn2Tw6d1dkLQmb7xkZ9cX19iKntgpxq4MP+TN/ANweU
	Z5R9afQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvEU-00000004tE3-0Lo8;
	Tue, 11 Feb 2025 18:43:42 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thv4M-00000004r8G-1cMo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 18:33:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso18735f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 10:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739298793; x=1739903593; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n9xncSfJUqF3qhAWmrgAzO9fCiQaEXfBzNsshntNyI=;
        b=Uwwgg3r2YCZs5EIAtLPU0uQa3ca4NIY80Tu6vJCSUKZh9IFX7EQIHimwqtBECBYKKG
         X++rZB+EIqeYr0JpXPUyUOwlrd6EvhG6rtTc+rll3+Fw+x7urWawmSQPkY+hRx93MECc
         ltNNiqqyuPQ22BJCg8iYgXCuBpWlKVpA7+ZCnPX1dvSO1LLA3AsEQHtBNoP+ZeiuacF7
         HEzCrrB8ufDGxfbJXxyjE7Vo3Uncfqx+a7fw/drlX1+xwVinC2yFXQgaQnh2MlJp8SsS
         rc2k+XVNjdNS9aO8DDVB4Iaj66y5mlkEayuXJnn3X+9wua1XUt+DKTdnarmwGxOk1Ey/
         573g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739298793; x=1739903593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9n9xncSfJUqF3qhAWmrgAzO9fCiQaEXfBzNsshntNyI=;
        b=xPtc9Ssnr7Vt2E/wv3wdDw8I1Qu4A1zC1d7CmgcIiyg2abazvV5EfrJLvHM8MjXl4c
         +B8HIG58NO4pJKHohv+ZdkipXiPVqsoNhyFPwgE/Kdv1vK+BfMjhewxhqqlaznU5u6t9
         ANJswpAfFXq4sNWk/9+jYl6d66rjduDBTrPmz+C80A/trPLlvd1+QCAQ8eFc3QvM4WGG
         ihXHJgU/K9pDhkyhW4ESf/OWSrfD2P/acjpTeeDJ2Vxfqzp4q7gL7hv7kCobpCca61oo
         Em7V/Zfj+XpDdYUjVm7V3uugcBfSMQLBX/v4TvTW2dK6VRZSCWHpsb0pCyk2rJ8Qvrzr
         3CrA==
X-Forwarded-Encrypted: i=1; AJvYcCUZOV4v3FDZGfp/Z1hbOoLh4DlbZDieU6YnRbINGfqzD6BuWPopP3vr+MMNKqtyFHRD537FYfIOISRw/fTMuvzz@lists.infradead.org
X-Gm-Message-State: AOJu0YyV/MIh8t2Rs94Q3ySBq7giivkN/Jm6XO0Me9afXl5CmiwXHT03
	vgBqUhMDVaYNEWy/YD4e4HOUb4rLMOabOQk26KfXb5ZzQvAFzNCHfJ6Lbm5B+UDTOb441k5ijlM
	9ey7ySzX4peJ2cXfRNBNkIqQzk4o=
X-Gm-Gg: ASbGncuIc+AJILPvqhs5dYZEvZIuqsU49czCmk7oPZRLvVL5bK5RgG01RKDEpWEs1GM
	sz7vIRnHfSrWTsGTKP9/QTqfUyAV7f6yuWciQShfl/QiDJVixAkP5eSJDFESoLaQOptThNF3PSu
	xnwa/VAEkfB/+9
X-Google-Smtp-Source: AGHT+IE22meWQEZbh6iCNZ83MxT8OPoGPC3rZhyxiT3FBfkUhRKZ2TeAUPawGwjn1n4PN4BAKXmRozRp3o6LVQYVSUA=
X-Received: by 2002:a05:6000:1541:b0:38d:e3da:8b4f with SMTP id
 ffacd0b85a97d-38dea15b478mr130562f8f.0.1739298792407; Tue, 11 Feb 2025
 10:33:12 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250210093840.GE10324@noisy.programming.kicks-ass.net>
 <20250210104931.GE31462@noisy.programming.kicks-ass.net> <CAADnVQ+3wu0WB2pXs4cccxfkbTb3TK8Z+act5egytiON+qN9tA@mail.gmail.com>
 <20250211104352.GC29593@noisy.programming.kicks-ass.net>
In-Reply-To: <20250211104352.GC29593@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 11 Feb 2025 10:33:00 -0800
X-Gm-Features: AWEUYZlc7wUdKqIC9UpU_G5Er__TqS_i5I1mQbNN7oKcsRHscpu2UHDdRRGMHAs
Message-ID: <CAADnVQJ=81PE19JWeNjq6aNOy+GM-wo6n7WU9StX1b6kevqCUw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 00/26] Resilient Queued Spin Lock
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_103314_431564_F83B24D4 
X-CRM114-Status: GOOD (  38.08  )
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

On Tue, Feb 11, 2025 at 2:44=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Feb 10, 2025 at 08:37:06PM -0800, Alexei Starovoitov wrote:
> > On Mon, Feb 10, 2025 at 2:49=E2=80=AFAM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > > >
> > > > Do you force unload the BPF program?
> >
> > Not yet. As you can imagine, cancelling bpf program is much
> > harder than sending sigkill to the user space process.
>
> So you are killing the user program? Because it wasn't at all clear what
> if anything is done when this failure case is tripped.

No. We're not killing the user process. bpf progs often run
when there is no owner process. They're just attached
somewhere and doing things.
Like XDP firewall will work just fine without any user space.

> > The prog needs to safely free all the resources it holds.
> > This work was ongoing for a couple years now with numerous discussions.
>
> Well, for you maybe, I'm new here. This is only the second submission,
> and really only the first one I got to mostly read.
>
> > > Even the simple AB-BA case,
> > >
> > >   CPU0          CPU1
> > >   lock-A        lock-B
> > >   lock-B        lock-A <-
> > >
> > > just having a random lock op return -ETIMO doesn't actually solve
> > > anything. Suppose CPU1's lock-A will time out; it will have to unwind
> > > and release lock-B before CPU0 can make progress.
> > >
> > > Worse, if CPU1 isn't quick enough to unwind and release B, then CPU0'=
s
> > > lock-B will also time out.
> > >
> > > At which point they'll both try again and you're stuck in the same
> > > place, no?
> >
> > Not really. You're missing that deadlock is not a normal case.
>
> Well, if this is unpriv user programs, you should most definitely
> consider them the normal case. Must assume user space is malicious.

Ohh. No unpriv here.
Since spectre was discovered unpriv bpf died.
BPF_UNPRIV_DEFAULT_OFF=3Dy was the default for distros and
all hyperscalers for quite some time.

> > As soon as we have cancellation logic working we will be "sigkilling"
> > prog where deadlock was detected.
>
> Ah, so that's the plan, but not yet included here? This means that every
> BPF program invocation must be 'cancellable'? What if kernel thread is
> hitting tracepoint or somesuch?
>
> So much details not clear to me and not explained either :/

Yes. The plan is to "kill" bpf prog when it misbehaves.
But this is orthogonal to this res_spin_lock set which is
a building block.

> Right, but it might have already modified things, how are you going to
> recover from that?

Tracking resources acquisition and release by the bpf prog
is a normal verifier job.
When bpf prog does bpf_rcu_read_lock() the verifier makes sure
that all execution paths from there on have bpf_rcu_read_unlock()
before program reaches the exit.
Same thing with locks.
If bpf_res_spin_lock() succeeds the verifier will make sure
there is matching bpf_res_spin_unlock().
If some resource was acquired before bpf_res_spin_lock() and
it returned -EDEADLK the verifier will not allow early return
without releasing all acquired resources.

> > Failing to grab res_spin_lock() is not a normal condition.
>
> If you're going to be exposing this to unpriv, I really do think you
> should assume it to be the normal case.

No unpriv for foreseeable future.

> > The prog has to implement a fallback path for it,
>
> But verifier must verify it is sane fallback, how can it do that?
>
> > > Given you *have* to unwind to make progress; why not move the entire
> > > thing to a wound-wait style lock? Then you also get rid of the whole
> > > timeout mess.
> >
> > We looked at things like ww_mutex_lock, but they don't fit.
> > wound-wait is for databases where deadlock is normal and expected.
> > The transaction has to be aborted and retried.
>
> Right, which to me sounds exactly like what you want for unpriv.
>
> Have the program structured such that it must acquire all locks before
> it does a modification / store -- and have the verifier enforce this.
> Then any lock failure can be handled by the bpf core, not the program
> itself. Core can unlock all previously acquired locks, and core can
> either re-attempt the program or 'skip' it after N failures.

We definitely don't want to bpf core to keep track of acquired resources.
That just doesn't scale.
There could be rcu_read_locks, all kinds of refcounted objects,
locks taken, and so on.
The verifier makes sure that the program does the release no matter
what the execution path.
That's how it scales.
On my devserver I have 152 bpf programs running.
All of them keep acquiring and releasing resources (locks, sockets,
memory) million times a second.
The verifier checks that each prog is doing its job individually.

> It does mean the bpf core needs to track the acquired locks -- which you
> already do,

We don't. The bpf infra does static checks only.
The core doesn't track objects at run-time.
The only exceptions are map elements.
bpf prog might store an acquired object in a map.
Only in that case bpf infra will free that object when it frees
the whole map.
But that doesn't apply to short lived things like RCU CS and
locks. Those cannot last long. They must complete within single
execution of the prog.

> > That was a conscious trade-off. Deadlocks are not normal.
>
> I really do think you should assume they are normal, unpriv and all
> that.

No unpriv and no, we don't want deadlocks to be considered normal
by bpf users. They need to hear "fix your broken prog" message loud
and clear. Patch 14 splat is a step in that direction.
Currently it's only for in-kernel res_spin_lock() usage
(like in bpf hashtab). Eventually we will deliver the message to users
without polluting dmesg. Still debating the actual mechanism.

