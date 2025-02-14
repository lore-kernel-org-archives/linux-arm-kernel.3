Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC7FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 03:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KUmqiD0vNdiHaufVBA6PmE/rnFodVBnR1hs+8TLdrY=; b=wg+JCmjY9cQUrj/i61z7OsvVts
	q1nqcPwFknDAlKPGfiNLyNpEpQrntNro3KXD3ie8sXk1A68Rv42w6zlwdG6iRUle5Kv38gMXo+/RW
	t8LpuIW4xOgXPMMsyshkvPlhAFCWmi9ANLub2l4pECmBTjpxccdQxzSUTIPsrHjMiwLncMaTtQEOG
	TxSRpGAZhC548rVV9VyipY7XoAKGbgpzFL+doTdC3syMfp55A7xRRYUbhi4+eRJAhJR9E5QQGpG7R
	+aSV/9vevSdso2fLqiYOXgCcdl5C7zj+tF1Vf2Gx81vb/pLrHpPtHEZoVrHfooBb0cetVYjR8ReXq
	OYTBuI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tim7q-0000000DSLZ-2KXO;
	Fri, 14 Feb 2025 03:12:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tilZu-0000000DMww-2lgK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:37:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38dcc6bfbccso864882f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 18:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739500636; x=1740105436; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KUmqiD0vNdiHaufVBA6PmE/rnFodVBnR1hs+8TLdrY=;
        b=NPOahevbTYHne/Xk5QJk72XWey/S++1THYNAm6fNiasGe5lywVmJ0pMKosL/kcbvPV
         UpnJRDNP0Kn9iWPn0Ov7ylXbbHXh/sT2hZiG3U6bJFpiZkszvHWsbY8pxdPLyzVxXwkd
         ztx3Cm3GgKSVP1QWs7/4vl3gLtQ9lF3OfMaPRxzCUWIHrCblvmdJjGWHlbTYBwvzDeyY
         uLVnom5xCQ0wtCCLZqEh5KA0Xw1UPcnCXtzonBum/c6e5GLGR3g+ttZzzO2jpr77TrSY
         vQ2L1E8ntpEBamaCk30KFlcNTiVNy++aQX4ikuhU2Yx1Nn3HZpxWn9T9sjANSBoEMu4Z
         /PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739500636; x=1740105436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KUmqiD0vNdiHaufVBA6PmE/rnFodVBnR1hs+8TLdrY=;
        b=Fcak2um240AveFjdQ8nxtTr4S+rNf9+EjCcRxgKQejfipW5P15O54h+oj9SYXfVwKZ
         zky25wQ4+1bN0gD3pebdNamCRCuQiZCSjfAFGe/fpLxFtW2hO/h9XLeYD6HwN31i7H3d
         Zou9+APBenzcImfYUbJ3Y2sB+1sFzQyHs3D3kIeKqSfHUGhLvxXTrOmxCjOkz0idOY0J
         UKpBNrX5565RsUPptjUNxpyDiGVzp+A2BYPDjMWeMtPeIlEOACpzDXZpAjVYumhNbhxs
         IEqRTmfjzCb5nMErT+IKB3Xs1ZpV6ME49fkvR+KxMvU5tKwjIzDy6ahoAkSW+BdLdMXw
         9PIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV62Fkqg2Y4TUemGfT/+oAoabeDADsgnHPNqbLgB9gvmA5NDkNA1P2kMdl9ccMA5DBT5x/X/EUCnVekyjj7VZ+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7RPJ5Du4R7pyO6gYZ0Aszg1Lo8Dnblc12dfPgky8SDBqEUdSn
	oI56b7f27F78YTgAPivnCx6LytuDEu18A+kAZRe+IyfvauUPXhmqY3D/Bj/P3iQeg7+qXdQHOsd
	RtMkFLkvxyfTIrJBNC/20KIKP6Xc=
X-Gm-Gg: ASbGnctRYCaugecpFf3QoZtq9rb17v+LnWX/T6qRuP3/mJJfGxGTHzUO4nvXp1KRa03
	m2uBSUdb5dWjJirE1E7IE1mosDWj6Fqpdyvz9gRlGVdFQV+Gj3ViRomt0xUwjo+rN2VOvl4kcsX
	TTxNX1q7NzAdRQ9Np1Rm2ey+4qzka2
X-Google-Smtp-Source: AGHT+IHbDo/fX7dZyCThXH5BKcjz9Xs70T8ip54fyvB/3H4hdbGg+vKDIfh44X0cIwHgkovmTrEsFSfteHMVNJ83hSM=
X-Received: by 2002:a5d:5885:0:b0:38f:27d3:1b47 with SMTP id
 ffacd0b85a97d-38f27d31d5amr4439990f8f.6.1739500636196; Thu, 13 Feb 2025
 18:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250210093840.GE10324@noisy.programming.kicks-ass.net>
 <20250210104931.GE31462@noisy.programming.kicks-ass.net> <CAADnVQ+3wu0WB2pXs4cccxfkbTb3TK8Z+act5egytiON+qN9tA@mail.gmail.com>
 <20250211104352.GC29593@noisy.programming.kicks-ass.net> <CAADnVQJ=81PE19JWeNjq6aNOy+GM-wo6n7WU9StX1b6kevqCUw@mail.gmail.com>
 <20250213095918.GB28068@noisy.programming.kicks-ass.net>
In-Reply-To: <20250213095918.GB28068@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 13 Feb 2025 18:37:05 -0800
X-Gm-Features: AWEUYZmb51D9-czVRbQRGCCzdB1QJHDgqGqO6urdXV_3TSHcf8DS2TLvXtiC-iM
Message-ID: <CAADnVQJJbi-52mP6BivyAudWSk95f1mgGQXWnjD-H37b7_AtLw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250213_183718_708108_19464AEA 
X-CRM114-Status: GOOD (  52.24  )
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

On Thu, Feb 13, 2025 at 1:59=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Tue, Feb 11, 2025 at 10:33:00AM -0800, Alexei Starovoitov wrote:
>
> > Ohh. No unpriv here.
> > Since spectre was discovered unpriv bpf died.
> > BPF_UNPRIV_DEFAULT_OFF=3Dy was the default for distros and
> > all hyperscalers for quite some time.
>
> Ah, okay. Time to remove the option then?

Good point. Indeed.
Will accept the patch if anyone has cycles to prep it, test it.

> > > So much details not clear to me and not explained either :/
> >
> > Yes. The plan is to "kill" bpf prog when it misbehaves.
> > But this is orthogonal to this res_spin_lock set which is
> > a building block.
> >
> > > Right, but it might have already modified things, how are you going t=
o
> > > recover from that?
> >
> > Tracking resources acquisition and release by the bpf prog
> > is a normal verifier job.
> > When bpf prog does bpf_rcu_read_lock() the verifier makes sure
> > that all execution paths from there on have bpf_rcu_read_unlock()
> > before program reaches the exit.
> > Same thing with locks.
>
> Ah, okay, this wasn't stated anywhere. This is rather crucial
> information.

This is kinda verifier 101. I don't think it needs to be in the log.

> > We definitely don't want to bpf core to keep track of acquired resource=
s.
> > That just doesn't scale.
> > There could be rcu_read_locks, all kinds of refcounted objects,
> > locks taken, and so on.
> > The verifier makes sure that the program does the release no matter
> > what the execution path.
> > That's how it scales.
> > On my devserver I have 152 bpf programs running.
> > All of them keep acquiring and releasing resources (locks, sockets,
> > memory) million times a second.
> > The verifier checks that each prog is doing its job individually.
>
> Well, this patch set tracks the held lock stack -- which is required in
> order to do the deadlock thing after all.

Right, but the held lock set is per-cpu global and not exhaustive.
It cannot detect 3-lock circles _by design_.
We rely on timeout for extreme cases.

> > The bpf infra does static checks only.
> > The core doesn't track objects at run-time.
> > The only exceptions are map elements.
> > bpf prog might store an acquired object in a map.
> > Only in that case bpf infra will free that object when it frees
> > the whole map.
> > But that doesn't apply to short lived things like RCU CS and
> > locks. Those cannot last long. They must complete within single
> > execution of the prog.
>
> Right. Held lock stack is like that.

They're not equivalent and not used for correctness.
See patch 26 and res_spin_lock_test_held_lock_max() selftest
that was added specifically to overwhelm:

+struct rqspinlock_held {
+   int cnt;
+   void *locks[RES_NR_HELD];
+};

It's an impossible case in reality, but the res_spin_lock
code should be prepared for extreme cases like that.

Just like existing qspinlock has 4 percpu qnodes and
test-and-set fallback in case "if (unlikely(idx >=3D MAX_NODES))"
line qspinlock.c:413.
Can it happen in practice ? Probably never.
But the code has to be ready to handle it.

> > > > That was a conscious trade-off. Deadlocks are not normal.
> > >
> > > I really do think you should assume they are normal, unpriv and all
> > > that.
> >
> > No unpriv and no, we don't want deadlocks to be considered normal
> > by bpf users. They need to hear "fix your broken prog" message loud
> > and clear. Patch 14 splat is a step in that direction.
> > Currently it's only for in-kernel res_spin_lock() usage
> > (like in bpf hashtab). Eventually we will deliver the message to users
> > without polluting dmesg. Still debating the actual mechanism.
>
> OK; how is the user supposed to handle locking two hash buckets? Does
> the BPF prog create some global lock to serialize the multi bucket case?

Not following.
Are you talking about patch 19 where we convert per-bucket
raw_spinlock_t in bpf hashmap to rqspinlock_t ?
Only one bucket lock is held at a time by map update code,
but due to reentrance and crazy kprobes in the wrong places
two bucket locks of a single map can be held on the same cpu.

bpf_prog_A -> bpf_map_update -> res_spin_lock(bucket_A)
  -> kprobe or tracepoint
    -> bpf_prob_B -> bpf_map_update -> res_spin_lock(bucket_B)

and that's why we currently have:
if (__this_cpu_inc_return(*(htab->map_locked[hash])) ...
    return -EBUSY;

.. workaround to prevent the most obvious AA deadlock,
but it's not enough.
People were able to hit ABBA.
Note, raw_spin_lock today (and res_spin_lock after patch 19) is
used by proper kernel code in kernel/bpf/hashtab.c.
bpf prog just calls bpf_map_update() which is a normal
helper call from the verifier point of view.
It doesn't know whether there are locks inside or not.

bpf_ktime_get_ns() helper is similar.
The verifier knows that it's safe from NMI,
but what kinds of locks inside it doesn't care.

> Anyway, I wonder. Since the verifier tracks all this, it can determine
> lock order for the prog. Can't it do what lockdep does and maintain lock
> order graph of all loaded BPF programs?
>
> This is load-time overhead, rather than runtime.

I wish it was possible. Locks are dynamic. They protect
dynamically allocated objects, so the order cannot be statically
verified. We pushed the limit of static analysis a lot.
Maybe too much.
For example,
the verifier can statically validate the following code:
        struct node_data *n, *m, *o;
        struct bpf_rb_node *res, *res2;

        // here we allocate an object of type known to the verifier
        n =3D bpf_obj_new(typeof(*n));
        if (!n)
                return 1;
        n->key =3D 41;
        n->data =3D 42;

        // here the verifier knows that glock spin_lock
        // protect rbtree groot
        bpf_spin_lock(&glock);

        // here it checks that the lock is held and type of
        // objects in rbtree matches the type of 'n'
        bpf_rbtree_add(&groot, &n->node, less);
        bpf_spin_unlock(&glock);

and all kinds of other more complex stuff,
but it is not enough to cover necessary algorithms.

Here is an example from real code that shows
why we cannot verify two held locks:

struct bpf_vqueue {
        struct bpf_spin_lock lock;
        int credit;
        unsigned long long lasttime;
        unsigned int rate;
};

struct {
        __uint(type, BPF_MAP_TYPE_HASH);
        __uint(max_entries, ...);
        __type(key, int);
        __type(value, struct bpf_vqueue);
} vqueue SEC(".maps");

        q =3D bpf_map_lookup_elem(&vqueue, &key);
        if (!q)
                goto err;
        curtime =3D bpf_ktime_get_ns();
        bpf_spin_lock(&q->lock);
        q->lasttime =3D curtime;
        q->credit -=3D ...;
        credit =3D q->credit;
        bpf_spin_unlock(&q->lock);

the above is safe, but if there are two lookups:

q1 =3D bpf_map_lookup_elem(&vqueue, &key1);
q2 =3D bpf_map_lookup_elem(&vqueue, &key2);

both will point to two different locks,
and since the key is dynamic there is no way to know
the order of q1->lock vs q2->lock.
So we allow only one lock at a time with
bare minimal operations while holding the lock,
but it's not enough to do any meaningful work.

The top feature request is to allow calls
while holding locks (currently they're disallowed,
like above bpf_ktime_get_ns() cannot be done
while holding the lock)
and allow grabbing more than one lock.
That's what res_spin_lock() is achieving.

Having said all that I think the discussion is diverging into
all-thing-bpf instead of focusing on res_spin_lock.

Just to make it clear... there is a patch 18:

 F: kernel/bpf/
 F: kernel/trace/bpf_trace.c
 F: lib/buildid.c
+F: arch/*/include/asm/rqspinlock.h
+F: include/asm-generic/rqspinlock.h
+F: kernel/locking/rqspinlock.c
 F: lib/test_bpf.c
 F: net/bpf/

that adds maintainer entries to BPF scope.

We're not asking locking experts to maintain this new res_spin_lock.
It's not a generic kernel infra.
It will only be used by bpf infra and by bpf progs.
We will maintain it and we will fix whatever bugs
we introduce.

We can place it in kernel/bpf/rqspinlock.c
to make things more obvious,
but kernel/locking/ feels a bit cleaner.

We're not asking to review patches 14 and higher.
They are presented for completeness.
(patch 17 was out-of-order. It will be moved sooner. Sorry about that)

But welcome feedback for patches 1-13.
Like the way you spotted broken smp_cond_load_acquire()
on arm64 due to WFE.
That was a great catch. We really appreciate it.

