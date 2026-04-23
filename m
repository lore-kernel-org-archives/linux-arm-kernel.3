Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB47BF99368
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axjtZr7MIWi9WvuvT/qFBnFbDHBg+cjaNqhmst1f4XE=; b=lMTBdjNleB+clfQbN4HZEBp4TG
	WquNioCckv/JqqeyYpouGXeQ7udssXWwPGa+SjxVk79+K3d5CpPE4vLdEaV72yh4g+Ob2N5qc88Vd
	RAqGGbawwSAy69vdPIQhNL4WlztUpwC4AosBWeeJOS3Hp0Ibn9oYY+FXAaHua5DCjSphcgSmsUQWJ
	4NZm+gm3Lzput9SDPz3cz4qV22NxWlPnjJCh93NE2mS5aexJMxM6gz/D63kP/QqCmoIvAaHLkYFK+
	F7ufL9TKMg0f7FEb1oOEmOBQfpVDv5c9gdM9BrREaYKnjBN/UzKu8Hx9HlkuxL1x9d7OfHU0XuK6s
	F7Ul7OlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrSz-0000000BUeT-3K3d;
	Thu, 23 Apr 2026 10:39:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrSw-0000000BUe4-1Adk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 10:39:27 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b886fc047d5so1159008666b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 03:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776940763; cv=none;
        d=google.com; s=arc-20240605;
        b=JVs+i7SXZpAERoHEHBRdyKz0B5QQGL4Ii/o2Nut4EGM/iS2MjY3AP/IU2W0Q46PUYT
         3nYG4V9Bk3lseKIRfXI0TzHUr/xOW9rSZaOJdrYJL1n88wkJamfCXtMZ0CgJfURJjY1y
         fq1obezDiZRdkSLz51EwVP4IIg6h8deyDMDnHzSv2YqrGABNTR0F98X8eCYwK45skl4J
         shtsNj4WbLIo+pJXOVN52qewAywCBbjT37ljHYHlISE0o2oHnvC82vs47dns/rm57jUo
         OZYOhUQ2WSpvhiG6GaTnaOdTH4P7ldeSzYZoSfnQiN2aDUM3pDSTnNSLq5MYc3gpwGyn
         DedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axjtZr7MIWi9WvuvT/qFBnFbDHBg+cjaNqhmst1f4XE=;
        fh=/EvoogfNn6Mx+FpWqsg2YE/rx92vbhLsTAlmCh9qY0c=;
        b=Ci1ZoyKDju/MwDuXfLM9TjxW/DS5lZCva4dPpmjN3xJNaKL/FNqvo0Env89NQkC3uB
         3gbqmqp3bDVSZiOx3XOcQOA+kN6xlFgLHPvtSy5ryYsEyQzDEJqURyZDuq6YbRG0eovO
         QQZYpaychSJi/CI7q0cutOdCFsXwa5vP+tx4kAiFtw3Jy7GcX7l/bjTYq16Klta90+Fi
         ksqMFdkjGrnpeF/qg7NjKh8+MY1daiOvFNNsWy3aEO6SQX8j87uKX1ktBASNaUPkjKd2
         K38iLL0Dy7Lq6s0S/ENJRKyO/NfYckfqxBuL5wGouUs/kWqrCDDNTymSt3vJbMdzfVhh
         nJLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1776940763; x=1777545563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axjtZr7MIWi9WvuvT/qFBnFbDHBg+cjaNqhmst1f4XE=;
        b=djq7saj14YGK5BL7mJgNGbybNL9JbgHv+PEEGABis8Y1gPRlLZinGjY7psGaEnWknU
         05HNTTBf2AWVxPolImX11m6k9bWKIb0gj3jjymqkAAf9YDNDi6dDGXqw0ifjYBRWY9Lr
         ZQxU6UvCDL6cGIIyqM2Kwt+H74JYLkxLZn5Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776940763; x=1777545563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=axjtZr7MIWi9WvuvT/qFBnFbDHBg+cjaNqhmst1f4XE=;
        b=aCgplIZGOg1xVJoEAEyMwnwzqJCa1VOWSPqsHPrtRmJbCVjrAUIIq1aNfie4nb3BSH
         4F/iiddPbgD9X4JFK0MJWwgX+7prrG4FYqaOdAG98iyf2CLetrvnkeWrS7DqnIIp/4P2
         H6TkxzRXMvoxC6ucOHqxnRs53hNIA7xuBN0+m7SXh7z90rWsNfiUnnWnV6KoLvnXh+ao
         EtGMKul168OeMI27Wlk4eULWt57zOKEmXNmpjy9MZGBM3jtuNHh1o3DoTmilHN1uVAJx
         sViPBDJ/cHQTHvwP05djLzLaI5lgnuIaFLkiRSLUxNXWssD1ftfc6OeWzd4a8eUy02go
         MRLg==
X-Forwarded-Encrypted: i=1; AFNElJ8+zkszspdZl4e9Wvn4nrsF4tubUIDD8Ja4IstuL1fRwpUUBtXI/uTT5ZdNK0mkjd8RgR55POuNqtb/mW71REK0@lists.infradead.org
X-Gm-Message-State: AOJu0YxiUrokjpyNqm4jTwXBnbwI/bhGumw8jJw4nt2z1vqk8qyH/JKR
	mcZPtLtG0bqddDs00mli2gXB+KYGe8XVvO67huvIQthnxE2MiwgAZyJJoIn+LY3V1MwABiW/pLq
	hnVFAIvBeW8dScNh3Z3PlI5xgO01Lca9aYHLGWUH8/w==
X-Gm-Gg: AeBDiet80rHKXkW/Ge/bMpTGV1xiGSeBE9uZYekVrWYct0CZPme6QBxQTKgroZxRyIE
	+P1DPVGSgM1f/3mjmQVec+L564Se885hmXNxbSEIatV+lSM9EnwvmoZcWOobt6v9cMPAw6e628l
	IIgNv+gIDIMs/j84bUoeVeuxe0IpPJjgwLEwcO2uXms8CGORtxx446iig42yQl5q/nVg1+/hi6z
	mkgGtic7ukhzj4Ek2mHrowycgP5A34X/D6Jt/wzl8N64TyLNJ/f/lLxQLCma57bE+pq/BGn6M2G
	hWriLd5QDKOHBEsY
X-Received: by 2002:a17:907:97cb:b0:ba6:7e1e:778a with SMTP id
 a640c23a62f3a-ba67e1e78edmr989960466b.1.1776940763204; Thu, 23 Apr 2026
 03:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net> <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
In-Reply-To: <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
From: Mathias Stearn <mathias@mongodb.com>
Date: Thu, 23 Apr 2026 12:38:56 +0200
X-Gm-Features: AQROBzDLZqpaRWt1enscGE22sx01XrMi4DwyHGjG6mzxtk-KQGkjwLXmTDGeCv8
Message-ID: <CAHnCjA0zt93wp2jAs6QX3eN+BtR8Xb3iZROzs48xZ3GNrzXOfg@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_033926_405516_79750989 
X-CRM114-Status: GOOD (  37.52  )
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

On Wed, Apr 22, 2026 at 3:13=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Apr 22, 2026 at 02:56:47PM +0200, Peter Zijlstra wrote:
> > On Wed, Apr 22, 2026 at 11:50:26AM +0200, Mathias Stearn wrote:
> >
> > > Additionally, it breaks tcmalloc specifically by failing to overwrite
> > > the cpu_id_start field at points where it was relied on for
> > > correctness.
> >
> > This specific behaviour was documented as being wrong and running with
> > DEBUG_RSEQ would have flagged it.
> >
> > The tcmalloc issue has been contentious for a long time. The tcmalloc
> > folks relied on something that was documented to be wrong. It has been
> > reported to the tcmalloc people many years ago and if you were to run
> > tcmalloc on most any kernel (very much including 6.19) with
> > DEBUG_RSEQ=3Dy, it would have yelled.
> >
> > The tcmalloc people didn't care. There was a proposal for an RSEQ
> > extension for what they need, and they didn't care. All this should be
> > in their bugzilla or whatever.
> >
> > The RSEQ rework improved performance significantly for everyone, and
> > kept all the documented behaviour (+- arm64 bug). Tcmalloc got screwed
> > over because they relied on implementation behaviour that was
> > specifically documented to be broken. And they didn't care. Google was
> > very much aware of this. And hasn't lifted a finger to remedy it.
>
> Also: https://lore.kernel.org/all/874io5andc.ffs@tglx/

(Sorry for the resend to folks who got this already - I got an alert
that it was rejected by the mailinglists because it contained html so
attempting to resend as plain text)

I won't claim that tcmalloc _should_ be abusing cpu_id_start as it is.
I agree that it seems questionable at best. However, I will strongly
disagree with the following comment in that message:

> What it not longer does is updating the
> CPU number for the preemption case on the same CPU
> because that's just a massive waste of CPU cycles.

I don't think it will cost _any_ cycles to implement what I proposed.
And it especially should have no impact from just enabling rseq on a
thread as glibc now does. It should only result in different
instructions being executed when the program actually _uses_ rseq by
setting the rseq_cs variable to a non-null pointer. I will repeat the
proposal with a bit more commentary in case you missed some of the
details that make it free:

Any time a critical section might be aborted (migration, preemption,
signal delivery, and membarrier IPI), the kernel _already_ must check
the rseq_cs field to see if the thread is in a critical section [and
if it is null because the program isn't using rseq critical sections,
no further action is taken]. This is documented as nulling the pointer
after (I assume to make later checks cheaper) [if this changed, then
it *is* a change in _documented behavior_, not just an implementation
detail]. It would be sufficient for tcmalloc's internal usage if every
time the kernel nulled out rseq_cs, it also wrote the cpu id to
cpu_id_start. [This is one additional store to a cacheline you are
already writing to so it should be ~free on modern OoO CPUs and cheap
on others. There might be a small cost to loading the current cpu, but
since nothing depends on that other than the store, I still expect it
to be ~free]

To make this more concrete, I am proposing adding

unsafe_put_user((u32)task_cpu(t), &t->rseq.usrptr->cpu_id_start, efault);

after each place where you currently do

unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);

in rseq_update_user_cs. Is that something that you would expect to
cause a performance issue?

Again, I'm not claiming that it is "good" that this needs to be done.
But it does seem like a small price to pay to keep existing binaries
working on new kernels. Quoting the first paragraph of
https://docs.kernel.org/admin-guide/reporting-regressions.html:

> =E2=80=9CWe don=E2=80=99t cause regressions=E2=80=9D is the first rule of=
 Linux kernel development; Linux founder and lead developer Linus Torvalds =
established it himself and ensures it=E2=80=99s obeyed.

I don't see anything on that page that says it doesn't count as a
regression if the userspace program "relied on implementation
behaviour that was specifically documented to be broken".

