Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62300C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 04:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VretaU5v/1hLOHdXy1ltl2QWR/a5vZVhU8PtvFmcdBs=; b=YSExa6hFnQ3GeSo0pe8MH6A/5R
	JKrh0XJwc98e1+Hgel6HdeA4AyH+XFtYcrNTGVWDTd8N24w2GA21j4LUCAeUhFWJXecYPgX34qh+4
	aMWNt2YbORZGDZ/6B8B0IeC4/t7R5qUtpjfrgE4IrUJ+87VoJyH7QNVxUdQjsRPX3G+7M9+y8lS+x
	oApxWqpqWKQk2k+TbXDuHL6o3AhMeGcD+fBy5MhQi9we46d5B3QJNZRj7GGgr1k8pDGud7a/6uN1+
	E4IhhZ47kcj741pwLPKc6+3vb/0AsY+jU0HkG4/sG3Av5wM6uJOSd7P1PYlezTwnrqn8c7BMJzGp8
	ZtEHCRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpgOF-00000006xbY-1o2g;
	Wed, 05 Mar 2025 04:29:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfOr-00000006syO-3ZbN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 03:26:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso42836505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 19:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741145183; x=1741749983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VretaU5v/1hLOHdXy1ltl2QWR/a5vZVhU8PtvFmcdBs=;
        b=JKoUNDrW0YwJiBdA+yKWVxDPAmzH0Ro1ecqMrvBTIflTzfyQxLWnyyvtJiSI9VgatT
         OzG+ncSu7pRJQpq03BZNR7zRoTGomAesPYvn3kb+eIfyaKQVYIl5DqrtseVrlbH6iQgc
         t7ZlEWa8MU86m8LX/asm2a9oofmgHYna31U2t2/R5rlrqpwcc4QrAaluKTUZ0o/i6Yiy
         /j3dIav5WDMf6uNkYMHa/qkQ2DEY0aD/11tWSPQDjLklt0pJKx13c3qr31FWk5pFR19j
         GOZCQJnx9uPFKvsjMKy5tfJiOc22iTnaF2tF2d1EILvfrQq5LAW8HfRHcUXZAYML2lVj
         CS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741145183; x=1741749983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VretaU5v/1hLOHdXy1ltl2QWR/a5vZVhU8PtvFmcdBs=;
        b=Rhw6CEtdl/8PbXndTCgxmTvdDbq75smzGZJqmDhgNgxc9khPvOZGGieP+4GWlIOxjq
         FhcSluVF8P49h5XrLJ42jQVoNjw1VgPiWGyMk3p7meCsuYzrXnJj8CLOtI7FB/ZnkHHy
         ln+Y9crYbM9yTMMXMsSaYbW7gVkeKeOgvMHH1L4P6+ufEC/ltKRrx9G+oqpguBNu7N5I
         u6Tx7s6afavejrt6NqGhi+M0rE6yE8nYpSlnHoPIIu4GQ3gjXBWiMov0tz4/qmlGiScw
         BgpUJ5eulg9v2jHQTBShJ0c5ImKJlfzw/z7Vxf3ZEXjBwODlbJcnXX9HoQjCNMXqT3ec
         tbrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfSeLf5WdFa8Zi/JU8AVBxdEW8Noc+CzgkE5agKxJ12nmUr0dGP0GuaOqysl7xrsgrjBLOH+jt8JHxB5Eu1O7w@lists.infradead.org
X-Gm-Message-State: AOJu0YztgqUOitIQKxGa8BCC3o7KNIUrUCaMDIsPMfHjgtm/ah+3boSo
	wuXbir8Tf0mPyY5Vid0dmO3kf175CuHm0JKLIrJWvOmFsIrKxWBqQygipVr0QUidpHM+iMR7uH/
	T+qX41rm6pqn07T/x76ojwupFCes=
X-Gm-Gg: ASbGncutF2wJFKSebitVR+RUd0i7hx1ypFPHehKr5s6LnomruHVqPF9tWy9qS8RLVZ8
	V67yo72EmjYFRvn8cpxq3P6Ab8wtOL4Q052y4sstc+g0VOA80KIinBMtGngDEbDWGO9ci2IFT9x
	oWZaSjoFzlIASpLX2CPid2HQ81cEZPXAtlHaiZDEZ5yw==
X-Google-Smtp-Source: AGHT+IGzIMM7zQQRVkBbsNXSeTx6I8p3O2hYNgu0XDTLHu0kIfXx9/HT2hCa4nZS4sHy1z+ltogZRtDVFBUrzn8DqIU=
X-Received: by 2002:a05:6000:1a8e:b0:391:136c:1346 with SMTP id
 ffacd0b85a97d-3911f74bdfbmr773726f8f.19.1741145183408; Tue, 04 Mar 2025
 19:26:23 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250210093840.GE10324@noisy.programming.kicks-ass.net>
 <20250210104931.GE31462@noisy.programming.kicks-ass.net> <CAADnVQ+3wu0WB2pXs4cccxfkbTb3TK8Z+act5egytiON+qN9tA@mail.gmail.com>
 <20250211104352.GC29593@noisy.programming.kicks-ass.net> <CAADnVQJ=81PE19JWeNjq6aNOy+GM-wo6n7WU9StX1b6kevqCUw@mail.gmail.com>
 <20250213095918.GB28068@noisy.programming.kicks-ass.net> <CAADnVQJJbi-52mP6BivyAudWSk95f1mgGQXWnjD-H37b7_AtLw@mail.gmail.com>
 <20250304104648.GD11590@noisy.programming.kicks-ass.net>
In-Reply-To: <20250304104648.GD11590@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 4 Mar 2025 19:26:12 -0800
X-Gm-Features: AQ5f1Jqc1OcxFdpHXxviILWN5ATrQ8sjCyiJy-0TOJ3kpk8iy_sBSEBkr25uumA
Message-ID: <CAADnVQ+hR6WB9=WVP73uxhetAZMTugcT2z_N=89qhjFJPoWT=Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250304_192625_891231_D51AEED9 
X-CRM114-Status: GOOD (  37.03  )
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

On Tue, Mar 4, 2025 at 2:46=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
>
> Anyway; the situation I was thinking of was something along the lines
> of: you need data from 2 buckets, so you need to lock 2 buckets, but
> since hash-table, there is no sane order, so you need a 3rd lock to
> impose order.

Not quite. This is a typical request to allow locking two buckets
and solution to that is run-time lock address check.

> > q1 =3D bpf_map_lookup_elem(&vqueue, &key1);
> > q2 =3D bpf_map_lookup_elem(&vqueue, &key2);
> >
> > both will point to two different locks,
> > and since the key is dynamic there is no way to know
> > the order of q1->lock vs q2->lock.
>
> I still feel like I'm missing things, but while they are two dynamic
> locks, they are both locks of vqueue object. What lockdep does is
> classify locks by initialization site (by default). Same can be done
> here, classify per dynamic object.
>
> So verifier can know the above is invalid. Both locks are same class, so
> treat as A-A order (trivial case is where q1 and q2 are in fact the same
> object since the keys hash the same).

Sounds like you're saying that the verifier should reject
the case when two locks of the same class like q1->lock and q2->lock
need to be taken ?
But that is one of the use cases where people requested to allow
multiple locks.
The typical solution to this is to order locks by addresses at runtime.
And nf_conntrack_double_lock() in net/netfilter/nf_conntrack_core.c
does exactly that.

if (lock1 < lock2) {
  spin_lock(lock1);spin_lock(lock2);
} else {
  spin_lock(lock2);spin_lock(lock1);
}

> Now, going back to 3rd lock, if instead you write it like:
>
>   bpf_spin_lock(&glock);
>   q1 =3D bpf_map_lookup_elem(&vqueue, &key1);
>   q2 =3D bpf_map_lookup_elem(&vqueue, &key2);
>   ...
>   bpf_spin_unlock(&glock);
>
> then (assuming q1 !=3D q2) things are fine, since glock will serialize
> everybody taking two vqueue locks.
>
> And the above program snippet seems to imply maps are global state, so

Not quite. Some maps are global, but there are dynamic maps too.
That's what map-in-map is for.

> you can keep lock graph of maps, such that:
>
>   bpf_map_lookup_elem(&map-A, &key-A);
>   bpf_map_lookup_elem(&map-B, &key-B);
>
> vs
>
>   bpf_map_lookup_elem(&map-B, &key-B);
>   bpf_map_lookup_elem(&map-A, &key-A);
>
> trips AB-BA

If everything was static and _keys_ known statically too, then yes,
such analysis by the verifier would be possible.
But both maps and keys are dynamic.

Note, to make sure that the above example doesn't confuse people,
bpf_map_lookup_elem() lookup itself is completely lockless.
So nothing wrong with the above sequence as written.
Only when:
q1 =3D bpf_map_lookup_elem(&map-A, &key-A);
q2 =3D bpf_map_lookup_elem(&map-B, &key-B);
if (bpf_res_spin_lock(&q1->lock))
if (bpf_res_spin_lock(&q2->lock))

the deadlocks become a possibility.
Both maps and keys are only known at run-time.
So locking logic has to do run-time checks too.

> I am not at all sure how res_spin_lock is helping with the q1,q2 thing.
> That will trivially result in lock cycles.

Right and AA or ABBA will be instantly detected at run-time.

> And you said any program that would trigger deadlock is invalid.
> Therefore the q1,q2 example from above is still invalid and
> res_spin_lock has not helped.

res_spin_lock will do its job and will prevent a deadlock.
As we explained earlier such a program will be marked as broken
and will be detached/stopped by the bpf infra.
Also we're talking root privileges.
None of this is allowed in unpriv.

> > Just to make it clear... there is a patch 18:
> >
> >  F: kernel/bpf/
> >  F: kernel/trace/bpf_trace.c
> >  F: lib/buildid.c
> > +F: arch/*/include/asm/rqspinlock.h
> > +F: include/asm-generic/rqspinlock.h
> > +F: kernel/locking/rqspinlock.c
> >  F: lib/test_bpf.c
> >  F: net/bpf/
> >
> > that adds maintainer entries to BPF scope.
> >
> > We're not asking locking experts to maintain this new res_spin_lock.
> > It's not a generic kernel infra.
> > It will only be used by bpf infra and by bpf progs.
> > We will maintain it and we will fix whatever bugs
> > we introduce.
>
> While that is appreciated, the whole kernel is subject to the worst case
> behaviour of this thing. As such, I feel I need to care.

Not sure why you're trying to relitigate the years worth of
discussions around locks in the bpf community.
Static analysis of 2+ locks by the verifier is impossible.
Full lock graph cycle detection lockdep-style is too slow in run-time.
Hence res_spin_lock with AA, ABBA, and timeout as a last resort
is our solution to real reported bugs.

This res_spin_lock patchset fixes the following syzbot reports:

https://lore.kernel.org/bpf/675302fd.050a0220.2477f.0004.GAE@google.com
https://lore.kernel.org/bpf/000000000000b3e63e061eed3f6b@google.com
https://lore.kernel.org/bpf/CAPPBnEa1_pZ6W24+WwtcNFvTUHTHO7KUmzEbOcMqxp+m2o=
15qQ@mail.gmail.com
https://lore.kernel.org/bpf/CAPPBnEYm+9zduStsZaDnq93q1jPLqO-PiKX9jy0MuL8LCX=
mCrQ@mail.gmail.com
https://lore.kernel.org/lkml/000000000000adb08b061413919e@google.com

It fixes the real issues.
Some of them have hacky workarounds, some are not fixed yet.

More syzbot reports will be fixed in follow ups when we
adopt res_spin_lock in other parts of bpf infra.

Note, all of the above syzbot reports are _not_ using direct
locks inside the bpf programs. All of them hit proper kernel
spin_locks inside bpf infra (like inside map implementations and such).
The verifier cannot do anything. syzbot generated programs
are trivial. They do one bpf_map_update_elem() call or similar.
It's a combination of attaching to tricky tracepoints
like trace_contention_begin or deep inside bpf infra.
We already have these workarounds:
CFLAGS_REMOVE_percpu_freelist.o =3D $(CC_FLAGS_FTRACE)
CFLAGS_REMOVE_bpf_lru_list.o =3D $(CC_FLAGS_FTRACE)
CFLAGS_REMOVE_queue_stack_maps.o =3D $(CC_FLAGS_FTRACE)
CFLAGS_REMOVE_lpm_trie.o =3D $(CC_FLAGS_FTRACE)
CFLAGS_REMOVE_ringbuf.o =3D $(CC_FLAGS_FTRACE)
to prevent recursion anywhere in these files,
but it's helping only so much.

So please take a look at patches 1-18 and help us make
sure we implemented AA, ABBA, timeout logic without obvious bugs.
I think we did, but extra review would be great.

Thanks!

