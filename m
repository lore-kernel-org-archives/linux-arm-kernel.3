Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C313DCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 18:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txxIdOoeWeaAiGuZiR6t0rYvGrj6SIbmcf/oRGefeOo=; b=HAQKeLJDXAOhfxvS0u9+x7qH4B
	YCFfNOMzM4pAyqA7xiRKvjStCippda7JQOS01rMzUc1b/SUEJVTjBtzMmTrJT+CRNqawdokyOA42y
	lt66gva2kg6nmc2QEfu34vb9dnD0Q/VhiQwL1JTSmUgWD6SrVxhL6kD6oscxwdpSFvf7u7wA3blcz
	iROPjPOijksUHFJBGJE2xRL5QCl0nru/+GalqiX6it091rp6bVlYmUPuXBvurQbTxD+uAX85pGbWf
	TEzbLs7jsAO1FhhhOST4g21AW9ctgbQy4wYcSF/bJsGJEnLHgNbeswMTUJ7K4rat9ed3W+PTCh/13
	lg5ErqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBIN-00000002TFp-1mki;
	Wed, 29 Oct 2025 18:53:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBIK-00000002TF8-20Vu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 18:53:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CB47445DA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 18:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2ABC116B1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761763995;
	bh=P1fpBKLpz3NhAHV8OSXmDOMSQKs45JoWLRgxhe1ZXi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=om5GOMGN4jz2H6VEosyifBY2fP9P2ZUxOzCaRZL+HWT0ktMU1vscRxWze4AnqmN8g
	 U1PMJjoZkfd0gW1nqZKC/4AS3EJyhpT1K5fqsr9qPURuI6TSh5IKlZMIDmFkrfz2io
	 lKsCwZumZaNJ+iVnccVNxAso/e1ludjC5D8+WgjeoXlSbcosCg+xn0eoC3C9uegr/y
	 k4Hwo6K7QY68O8So1EonT0CeW5fABtEVwMaIi7LO9LkOh31l//qWPkMSV4jaZ6wOEQ
	 CvAoxXEZwRlB4ud0b57tRWmXsQWCKq7c2kOIMG8Lzh9SQkguTQDCgf/u2KUV7ZENpw
	 McpI/YV3EyWQQ==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7c531445439so49153a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:53:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVstquDlP2Au7C4KdAKNeczGS+ksfr2bTiduvHJDYuOqME6kJ64b5BITONEw99DsXfEBlFMMGJvWz+AqT5IHTc5@lists.infradead.org
X-Gm-Message-State: AOJu0YzrgaroPX0kuXQSXkr4FVGrqfA0ocJJH7DOO2E6/usdLgf0H+qD
	MttB+0K1+Cm8HrODLjSu66fuX1CCXiN6s0rzyo6ThN6NOz8M1cTq8trAEQ5DlLpLsXvUv+jcW2j
	Llzjnd5qikMlZmcetxfMuex13ES+hVyM=
X-Google-Smtp-Source: AGHT+IHqLr30NAl5M0UDPxgOiX509nO1xreEttv2Ja7V2VTnyLfOfv1uaRlgWgHZXMApbjkmBIuGTq5OSxr3Ncgi/MM=
X-Received: by 2002:a05:6808:148c:b0:441:cf96:934f with SMTP id
 5614622812f47-44f7a89144cmr1770625b6e.47.1761763994437; Wed, 29 Oct 2025
 11:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251028053136.692462-1-ankur.a.arora@oracle.com>
 <20251028053136.692462-8-ankur.a.arora@oracle.com> <CAJZ5v0hSvzHfsE4nrEW-Ey0dnJ+m=dSU-f1RywGNU0Xyi3jXtQ@mail.gmail.com>
 <87ms5ajp4c.fsf@oracle.com>
In-Reply-To: <87ms5ajp4c.fsf@oracle.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Oct 2025 19:53:03 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hQ7G9jvOv9VtRmsCKahBpUcPJMMOe07k_2mqsvggWcWg@mail.gmail.com>
X-Gm-Features: AWmQ_bk7-QDWwa1cDV85f7xAgSvOSsXB0uuTzMcOx_--MTMmqkafGtIfA3jK8No
Message-ID: <CAJZ5v0hQ7G9jvOv9VtRmsCKahBpUcPJMMOe07k_2mqsvggWcWg@mail.gmail.com>
Subject: Re: [RESEND PATCH v7 7/7] cpuidle/poll_state: Poll via smp_cond_load_relaxed_timeout()
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de, 
	catalin.marinas@arm.com, will@kernel.org, peterz@infradead.org, 
	akpm@linux-foundation.org, mark.rutland@arm.com, harisokn@amazon.com, 
	cl@gentwo.org, ast@kernel.org, daniel.lezcano@linaro.org, memxor@gmail.com, 
	zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com, 
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_115316_556716_C22A8CA4 
X-CRM114-Status: GOOD (  36.24  )
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

On Wed, Oct 29, 2025 at 5:42=E2=80=AFAM Ankur Arora <ankur.a.arora@oracle.c=
om> wrote:
>
>
> Rafael J. Wysocki <rafael@kernel.org> writes:
>
> > On Tue, Oct 28, 2025 at 6:32=E2=80=AFAM Ankur Arora <ankur.a.arora@orac=
le.com> wrote:
> >>
> >> The inner loop in poll_idle() polls over the thread_info flags,
> >> waiting to see if the thread has TIF_NEED_RESCHED set. The loop
> >> exits once the condition is met, or if the poll time limit has
> >> been exceeded.
> >>
> >> To minimize the number of instructions executed in each iteration,
> >> the time check is done only intermittently (once every
> >> POLL_IDLE_RELAX_COUNT iterations). In addition, each loop iteration
> >> executes cpu_relax() which on certain platforms provides a hint to
> >> the pipeline that the loop busy-waits, allowing the processor to
> >> reduce power consumption.
> >>
> >> This is close to what smp_cond_load_relaxed_timeout() provides. So,
> >> restructure the loop and fold the loop condition and the timeout check
> >> in smp_cond_load_relaxed_timeout().
> >
> > Well, it is close, but is it close enough?
>
> I guess that's the question.
>
> >> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> >> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> >> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> >> ---
> >>  drivers/cpuidle/poll_state.c | 29 ++++++++---------------------
> >>  1 file changed, 8 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/drivers/cpuidle/poll_state.c b/drivers/cpuidle/poll_state=
.c
> >> index 9b6d90a72601..dc7f4b424fec 100644
> >> --- a/drivers/cpuidle/poll_state.c
> >> +++ b/drivers/cpuidle/poll_state.c
> >> @@ -8,35 +8,22 @@
> >>  #include <linux/sched/clock.h>
> >>  #include <linux/sched/idle.h>
> >>
> >> -#define POLL_IDLE_RELAX_COUNT  200
> >> -
> >>  static int __cpuidle poll_idle(struct cpuidle_device *dev,
> >>                                struct cpuidle_driver *drv, int index)
> >>  {
> >> -       u64 time_start;
> >> -
> >> -       time_start =3D local_clock_noinstr();
> >> +       u64 time_end;
> >> +       u32 flags =3D 0;
> >>
> >>         dev->poll_time_limit =3D false;
> >>
> >> +       time_end =3D local_clock_noinstr() + cpuidle_poll_time(drv, de=
v);
> >
> > Is there any particular reason for doing this unconditionally?  If
> > not, then it looks like an arbitrary unrelated change to me.
>
> Agreed. Will fix.
>
> >> +
> >>         raw_local_irq_enable();
> >>         if (!current_set_polling_and_test()) {
> >> -               unsigned int loop_count =3D 0;
> >> -               u64 limit;
> >> -
> >> -               limit =3D cpuidle_poll_time(drv, dev);
> >> -
> >> -               while (!need_resched()) {
> >> -                       cpu_relax();
> >> -                       if (loop_count++ < POLL_IDLE_RELAX_COUNT)
> >> -                               continue;
> >> -
> >> -                       loop_count =3D 0;
> >> -                       if (local_clock_noinstr() - time_start > limit=
) {
> >> -                               dev->poll_time_limit =3D true;
> >> -                               break;
> >> -                       }
> >> -               }
> >> +               flags =3D smp_cond_load_relaxed_timeout(&current_threa=
d_info()->flags,
> >> +                                                     (VAL & _TIF_NEED=
_RESCHED),
> >> +                                                     (local_clock_noi=
nstr() >=3D time_end));
> >
> > So my understanding of this is that it reduces duplication with some
> > other places doing similar things.  Fair enough.
> >
> > However, since there is "timeout" in the name, I'd expect it to take
> > the timeout as an argument.
>
> The early versions did have a timeout but that complicated the
> implementation significantly. And the current users poll_idle(),
> rqspinlock don't need a precise timeout.
>
> smp_cond_load_relaxed_timed(), smp_cond_load_relaxed_timecheck()?
>
> The problem with all suffixes I can think of is that it makes the
> interface itself nonobvious.
>
> Possibly something with the sense of bail out might work.

It basically has two conditions, one of which is checked in every step
of the internal loop and the other one is checked every
SMP_TIMEOUT_POLL_COUNT steps of it.  That isn't particularly
straightforward IMV.

Honestly, I prefer the existing code.  It is much easier to follow and
I don't see why the new code would be better.  Sorry.

