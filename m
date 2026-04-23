Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AB7F589C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBoOCn6MiDkjwqqV0dZhBM0Mdu5029Jkm3x6gtbaC2A=; b=UTqFOa3CpFRHDDpcbirwen7QPm
	AlLSoZCguGsiSliYwRtMf7F5NCXp1/j5knZqvpduG/OP1WIqJG8bOLGPEx3BiEsEsDS15TL7kmWLv
	Dr1w99OYhJggsgRctNrhVXnOG+8YPKV2uvrMDFcEAtVgUqGg0zkhSvfIyIxXskQd8/Uv6doaWHoJY
	s6Ke4rfH7ZwO3qpwbkQLXbRzvTeFtmJxxdPpTHVQCyBERZ/OqPS455sNyJI8WN48QaeNMAUE3kaOK
	3CTIWY7ViteCUVZSdeqr6PLKQ2cez48ijTpymiMOs7nGIBKaXh3DRThsW8GGR3p8lOc38Ev4rm191
	URA+jU4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFte7-0000000Bhzi-0aLl;
	Thu, 23 Apr 2026 12:59:07 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFte3-0000000BhyB-1Ro7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:59:04 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-38e12c67a6fso65693391fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 05:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776949141; cv=none;
        d=google.com; s=arc-20240605;
        b=CuxaLZ2SWD1E37ahvvD/C0E1NlxYVNhwcdhwTYA66q7hJO+iROC+wASrjJ2Apby3xL
         rxb8yII3GcNTXDbvahMsKQFPWY59TbwK8bP1sxZ4+6lOSM/64NuWSy+r0/45ZadHL+LW
         fXAqI+PPRh2kX0A88kWKUD3SC+7f+HIFg8dutOVYBqScJKn5t09vA6S0Cu/lTolhwD60
         lorkVwmPNO3JRVvFScbjQr6YKq0U5geYE8xV4c4KwuzjYspjeiVYWvalebNgv2WDrUxZ
         WMH91MM/c9xnMX1LHfhYv18Ht+dKbt85Qf/cznxKg5iR8mLvsjB6J8piyLC7KHZJ5pOW
         L6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EBoOCn6MiDkjwqqV0dZhBM0Mdu5029Jkm3x6gtbaC2A=;
        fh=IptLfyiH4nVmfuwAn6QbPFYQmH5O+aSBj7evK+xS4ng=;
        b=dUU8zJLziFnQVfq3BFPSru44cg2MaRtVhx9Ce9SkreKcMwfO2QMYprdvzPRDY3vWn2
         zxEQp6weM0k1n25jroo9nB7moGqGPrIZMFtnhAj5/+tbA+z0WyyWpvfHSJu+StjS5FhQ
         4EwIzBdCycyPF6+NTJLeIRGRfckvcw//x0bdDvoX5YfMLsBElqL1SgiDKnNa+RkersAs
         67jsrBGgCByXe55ZekFSm3uXCm9ucbYqb9R9oCjrLmXjkGRmJN39IE609EU70Xi02IaH
         XhPM0/NsjjwOE9c7y/EcLToysgw5DCSUxkKOV1KQS07HQKHtf+gDWV4hFPpEKLhY5XLc
         FNHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776949141; x=1777553941; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBoOCn6MiDkjwqqV0dZhBM0Mdu5029Jkm3x6gtbaC2A=;
        b=bePYKwjEyi489pSM28z+W4KrzpFuVsVZQDePCF0arb7mIoIxTg/XE7gTsioX3pec40
         P1zEQW9RUWJdTQfV+3L/yZCPlbR5hwGw+E40eu/TnjkIjpSgeQ3S01rqZhIb/p4T9uJ2
         WXJL06MsoCO4PFIOXTmELKrjJ+cHIbaWNCwfXzGDC/7aYM0eJziPQXoOKbNpeiz+sJs/
         Mm9wWbwqC7+4ibBQ7yDmBeKdp6hLk2fj6LDBv82UQ6BNIF0rJNkRnMxFfPrRucMBpIO+
         +vJkUBfBl5LFrAxPbXBovy1a4pHwps3LryrO1v4Anqq4l0FDMI9+z+fs4MH5jCQCY3pS
         HmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949141; x=1777553941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EBoOCn6MiDkjwqqV0dZhBM0Mdu5029Jkm3x6gtbaC2A=;
        b=TyMsOiEquf+Fl54J9BVTnfqbFm5+Ns6SxXc4WE9+cyvOsaV24fFs3Al/wJaB6nzoe6
         nz3+35tCLopM137paCtBuG2AY4LsHcg7TJOinnZmZnG3N0TbJVJRP12dYahRSuNIiCpv
         TVrgJ2zZKoZnIFbpmBsM7s6B5f/pJwv+AWMMbifGTJWmQHWhLmdRxWky539P6+Xss3lf
         DcdHyh2mtbcUBVxucX0UK8fdEWuNiZqLE/wgY9QBIb2YA2acGTEN/sbHpwvlsDP8zNYU
         AoPSZWUR4IMlDiVaNZB4mZcqJyPgh96x8xsPpWM7ripkY9ON6YFJ+jkJ7JYd5iCwxwqD
         gLqw==
X-Forwarded-Encrypted: i=1; AFNElJ9LWflgrQHy+YMo6x4BDEm2AqTtKg/f5IgeOjOWN9kbA5HbQLDtKLkhBi+sP7PjtHaknrZWcY9vJBDHJEWuiUid@lists.infradead.org
X-Gm-Message-State: AOJu0YwPF5lClTieN2mZhZD6/RCg/sSgFOH6McAy+HV+qFigw9rH8pyk
	XT0HbGUnlQXSrBqEzaqVXcjRilZks1wZmx5Ml/jskKchkaxVLQtAgGRTmt2RiPxW2t34XQmREU8
	P2Q2QBKxeuPu99UMS1Hsh3FFEdJVdF0YHBEqeJjSV
X-Gm-Gg: AeBDievzFCh+JPXhWdnUnvvVj9UFmaVKiMwu3iZ+OxU7nCjVO+jhX4hb5Y+8Z6LbteD
	votHhdMyjr5c3TRkIfxyul5BnUioeXrzTZzB9o6QRGmtCE9UyPs4IXc0evxIYklXZZHr3db8/J7
	UEGaZtAsv3k5Odon1M7qsOwggjmXBgT44GLLtI/oMnihObvJxDQiCLVi1UzW06Mvab8ctFVskON
	kby7DN4eyTF6oN/Hryh2k/nxCk6wGkp1/TykhN/TnI5jg4BF9S382kzVC61Ng+jhQkjve6/NEpv
	2oABFwgSNwv/bJgu38+6Ia6iqA2zndFnevaQZ1PpibTwWrZl7EBiremNZX9GBJxRG2tQi+AkoxA
	h2cEySwxvEXQQF54=
X-Received: by 2002:a05:651c:4209:b0:38e:d870:1db5 with SMTP id
 38308e7fff4ca-38ed8701e80mr69433801fa.7.1776949140643; Thu, 23 Apr 2026
 05:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com> <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <1e839a25-d15f-40d3-ad6a-20469fb6137c@efficios.com> <CACT4Y+bMH+q2C7Xg9oHRP5ZbmvLpMpYzrdAd7B6XoXYc8=22sQ@mail.gmail.com>
 <84e0a8f6-c24c-469a-82a4-e82e33b764b4@efficios.com>
In-Reply-To: <84e0a8f6-c24c-469a-82a4-e82e33b764b4@efficios.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 23 Apr 2026 14:58:48 +0200
X-Gm-Features: AQROBzBMZhPIR5gRUuR2Cv8QJN7ZCnPb8ovR-0L9yVQuuYL1RfgenAYTSh02Kxg
Message-ID: <CACT4Y+aSvv-n4gknRm8D=pLGsnh7PU3f5MTJSq4tTPqUWn80+A@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, 
	Mathias Stearn <mathias@mongodb.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>, Michael Jeanson <mjeanson@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_055903_428213_FBD5D3C7 
X-CRM114-Status: GOOD (  39.10  )
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

On Thu, 23 Apr 2026 at 14:53, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2026-04-23 08:36, Dmitry Vyukov wrote:
> > On Thu, 23 Apr 2026 at 14:29, Mathieu Desnoyers
> > <mathieu.desnoyers@efficios.com> wrote:
> >>
> >> On 2026-04-23 01:53, Dmitry Vyukov wrote:
> >> [...]
> >>> +linux-man
> >>>
> >>> This part of the rseq man page needs to be fixed as well I think. The
> >>> kernel no longer reliably provides clearing of rseq_cs on preemption,
> >>> right?
> >>>
> >>> https://git.kernel.org/pub/scm/libs/librseq/librseq.git/tree/doc/man/=
rseq.2#n241
> >>
> >> I'm maintaining this manual page in librseq.
> >>
> >>>
> >>> "and set to NULL by the kernel when it restarts an assembly
> >>> instruction sequence block,
> >>> as well as when the kernel detects that it is preempting or deliverin=
g
> >>> a signal outside of the range targeted by the rseq_cs."
> >>
> >> I think you got two things confused here.
> >>
> >> 1) There is currently a bug on arm64 where it fails to honor the
> >>      rseq ABI contract wrt critical section abort. AFAIU there is a
> >>      fix proposed for this.
> >>
> >> 2) Thomas relaxed the implementation of cpu_id_start field updates
> >>      so it only stores to the rseq area when the current cpu actually
> >>      changes (migration).
> >>
> >> So AFAIU the statement in the man page is still fine. It's just arm64
> >> that needs fixing.
> >
> >
> > My understanding was that due to the ev->user_irq check here:
> >
> > +static __always_inline void rseq_sched_switch_event(struct task_struct=
 *t)
> > ...
> > +               bool raise =3D (ev->user_irq | ev->ids_changed) & ev->h=
as_rseq;
> > +
> > +               if (raise) {
> > +                       ev->sched_switch =3D true;
> > +                       rseq_raise_notify_resume(t);
> > +               }
> >
> > There won't be any rseq-related processing for threads preempted in
> > syscalls, which means that rseq_cs won't be NULLed for threads
> > preempted inside of syscalls.
>
> Let's see if I understand your concern correctly. Scenario:
>
> A thread is within a rseq critical section. It exits the critical
> section without clearing the rseq_cs pointer, expecting the kernel
> to lazily clear the rseq_cs pointer eventually when it detects that
> it's not nested on top of the userspace critical section anymore.
> It then calls a system call _outside_ of the rseq critical section,
> but with rseq_cs pointer set. Based on the rseq man page wording,
> it would then expect the preemption within the system call to guarantee
> clearing that that pointer.

Yes, this is the scenario I had in mind.

> Here is the relevant comment block in the man page:
>
>                       Updated by user-space, which sets the address of  t=
he  cur=E2=80=90
>                       rently active rseq_cs at the beginning of assembly =
instruc=E2=80=90
>                       tion sequence block, and set to NULL by the kernel =
when  it
>                       restarts an assembly instruction sequence block, as=
 well as
> >>>>>>>>>
>                       when the kernel detects that it is preempting or de=
livering
>                       a  signal  outside  of  the  range targeted by the =
rseq_cs.
> >>>>>>>>>
>                            ^^^ this
>
> The whole point about lazy-clearing of rseq_cs is that it _may_ happen wh=
en
> the kernel preempts or delivers a signal (or at any point really), but it=
's
> just an optimization.
>
> Updating the manual page with this wording would match the intent:
>
>                       Updated by user-space, which sets the address of  t=
he  cur=E2=80=90
>                       rently active rseq_cs at the beginning of assembly =
instruc=E2=80=90
>                       tion sequence block, and set to NULL by the kernel =
when  it
>                       restarts an assembly instruction sequence block. Ma=
y be set
>                       to NULL by the kernel when it detects that the curr=
ent
>                       instruction pointer is outside of the range targete=
d by
>                       the rseq_cs.
>                       Also needs to be set to NULL by user-space before  =
reclaim=E2=80=90
>                       ing memory that contains the targeted struct rseq_c=
s.
>
> Thoughts ?
>
> Thanks,
>
> Mathieu
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com

