Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F1FCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4TN7y6CxrOIqx+q54syJk+llreroUtut6yYsrR32uE=; b=oYjob8dkkghyEmYI4hsELSAcuO
	VmZFX2hVHAyVnB4g4tIU1tirdtNgO741AygNHxr+31oZ6C9wmWCkIXdiE1/65AO5Y5M2st45L6br1
	s0iy/h17ov7SWZ0pfD7EL3y4WTaKouwjkzVPGQQteDlS4KjhvLrRo5rninpZD516sL0KSKsIVe2k+
	bTA8utN02PMhcVNPTFUtUamOygHmuRJUxyaobbdidH+ePiGQERDJVj6vfJcGC3/F+R9/hmK3Tskh+
	Ss1TnF4wSVCaFnbrJmu3yntRGAbIEBSUzJMluBwGy5zPNWF2rsAkhbgfwPSbSKG17C0Xis6xQyZR3
	fFgEZgJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiqZ-0000000FwPE-1tel;
	Tue, 28 Oct 2025 12:30:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiqX-0000000FwOm-15Lo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 12:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F07048E1C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 12:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73936C19425
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 12:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761654640;
	bh=FUJwnKqupuATzqa/yUkbLMKYSmrcPHWiju1XCYAtVvU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IN9IXmlpfWmyQMe+4yoJTRjrGkXONjtInjRNNGwLDljJ1Ic7/ddFwvqAuTWuBxGEf
	 ggNv4arOeC36FTqSclS7agsLn0giGAlgy3711NOxA7QnriWNWG0jBFLFs9N5h4BZGw
	 Q8c+lbqvJ6pAW0kKUoegNkJhQkV8aLUg35ip0R31lA0L+fU9zQfaSwQjysXPIvBTEI
	 3RGk17q9uhF2ESP/I0/Ie5Dm/p5vDSh3YZTnUEYOO0p2nt4xh+HbjTSvfGCK5tFXHS
	 m7IOMOESNFONZnvFolxLiDeuUIdGtz94/CWxElVzIK1hkjq/Yf6lT+t5faKd6ehqUp
	 6HDN0JNqG/u5Q==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3c9a42d6349so7833659fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 05:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXGtYJhugO5DH3/76LjZglNAIel64jKfeZkvD1P22lwSDRYSrJKVYIJ+88ZJGBx9RHVFurEXQKKp16pU7fS9h7@lists.infradead.org
X-Gm-Message-State: AOJu0YxnqWCbXTf3Cj48rxcnsI1TV17vY9hddRX+oKpoKtjYTXZCVWrt
	8pTFJGanHeL8+1UNF2GgznpjPFkGX8dV0/jifMDn5H39nQlUC+qw1exSyGvu/5L+J+NPAXd9Zql
	FR9KdYR7JWyFY4mSqm/YNRDV0yqUXfII=
X-Google-Smtp-Source: AGHT+IF4/+n4/HUbYzvmzntYRGMqRLoTUquPBb05pAoL2nb4JIDivDwVJlZRViGR0xOD6wLtOHPmiqYRVXII1LbUhvo=
X-Received: by 2002:a05:6870:a188:b0:3d2:f6c1:1744 with SMTP id
 586e51a60fabf-3d5d9554f00mr1276006fac.28.1761654639396; Tue, 28 Oct 2025
 05:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251028053136.692462-1-ankur.a.arora@oracle.com> <20251028053136.692462-8-ankur.a.arora@oracle.com>
In-Reply-To: <20251028053136.692462-8-ankur.a.arora@oracle.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 28 Oct 2025 13:30:28 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hSvzHfsE4nrEW-Ey0dnJ+m=dSU-f1RywGNU0Xyi3jXtQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmK2EK_uRWSBm9YaeD6TrkAr4FPkjdGF2gNL1N7yUrOkz2AUZHQBAURvQI
Message-ID: <CAJZ5v0hSvzHfsE4nrEW-Ey0dnJ+m=dSU-f1RywGNU0Xyi3jXtQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v7 7/7] cpuidle/poll_state: Poll via smp_cond_load_relaxed_timeout()
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org, 
	peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com, 
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org, 
	daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com, 
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_053041_340218_250D4025 
X-CRM114-Status: GOOD (  25.87  )
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

On Tue, Oct 28, 2025 at 6:32=E2=80=AFAM Ankur Arora <ankur.a.arora@oracle.c=
om> wrote:
>
> The inner loop in poll_idle() polls over the thread_info flags,
> waiting to see if the thread has TIF_NEED_RESCHED set. The loop
> exits once the condition is met, or if the poll time limit has
> been exceeded.
>
> To minimize the number of instructions executed in each iteration,
> the time check is done only intermittently (once every
> POLL_IDLE_RELAX_COUNT iterations). In addition, each loop iteration
> executes cpu_relax() which on certain platforms provides a hint to
> the pipeline that the loop busy-waits, allowing the processor to
> reduce power consumption.
>
> This is close to what smp_cond_load_relaxed_timeout() provides. So,
> restructure the loop and fold the loop condition and the timeout check
> in smp_cond_load_relaxed_timeout().

Well, it is close, but is it close enough?

> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  drivers/cpuidle/poll_state.c | 29 ++++++++---------------------
>  1 file changed, 8 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/cpuidle/poll_state.c b/drivers/cpuidle/poll_state.c
> index 9b6d90a72601..dc7f4b424fec 100644
> --- a/drivers/cpuidle/poll_state.c
> +++ b/drivers/cpuidle/poll_state.c
> @@ -8,35 +8,22 @@
>  #include <linux/sched/clock.h>
>  #include <linux/sched/idle.h>
>
> -#define POLL_IDLE_RELAX_COUNT  200
> -
>  static int __cpuidle poll_idle(struct cpuidle_device *dev,
>                                struct cpuidle_driver *drv, int index)
>  {
> -       u64 time_start;
> -
> -       time_start =3D local_clock_noinstr();
> +       u64 time_end;
> +       u32 flags =3D 0;
>
>         dev->poll_time_limit =3D false;
>
> +       time_end =3D local_clock_noinstr() + cpuidle_poll_time(drv, dev);

Is there any particular reason for doing this unconditionally?  If
not, then it looks like an arbitrary unrelated change to me.

> +
>         raw_local_irq_enable();
>         if (!current_set_polling_and_test()) {
> -               unsigned int loop_count =3D 0;
> -               u64 limit;
> -
> -               limit =3D cpuidle_poll_time(drv, dev);
> -
> -               while (!need_resched()) {
> -                       cpu_relax();
> -                       if (loop_count++ < POLL_IDLE_RELAX_COUNT)
> -                               continue;
> -
> -                       loop_count =3D 0;
> -                       if (local_clock_noinstr() - time_start > limit) {
> -                               dev->poll_time_limit =3D true;
> -                               break;
> -                       }
> -               }
> +               flags =3D smp_cond_load_relaxed_timeout(&current_thread_i=
nfo()->flags,
> +                                                     (VAL & _TIF_NEED_RE=
SCHED),
> +                                                     (local_clock_noinst=
r() >=3D time_end));

So my understanding of this is that it reduces duplication with some
other places doing similar things.  Fair enough.

However, since there is "timeout" in the name, I'd expect it to take
the timeout as an argument.

> +               dev->poll_time_limit =3D !(flags & _TIF_NEED_RESCHED);
>         }
>         raw_local_irq_disable();
>
> --

