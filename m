Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E40CD41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNMq/kMMtrh+atZlu0wFrs1Lk9ZRC23XVxG/j940ZaM=; b=u7xjhPRyrLWdXjxOogmX0a1Li4
	JfITTwKIaMEY7qHQxMKq7QYpdnIbyBVERrCXDdrENYdktUkJtyTLUF1ZCTdXB2LgLSoP3baqgdGpO
	MAZ8xbAKO3gAVXkjZsQfp0s5tZ/NW8EBTweqQp81+uT4igMmzDfGL8e3zia2eaGiotd3m3EEmFFWW
	SJiDz+kwh0RBk42obZ9/iFacsUpf2AgMfryoWzBypZfuwh2KM4guSyniMk1iIC45BWtHKaP+z+CXZ
	y14tXrCg9pJ+8Tlq0PHVxmJ4GOPOnoXiiaG8yu7hsAoGN2JruKfj9E5ft/1bm2u/QNCFdpeUrogV7
	D0l+27Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6Uy-00000003VAL-1bRv;
	Mon, 15 Dec 2025 11:12:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6Uu-00000003V94-32zU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 11:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0691B438CC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 11:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9042C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 11:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765797130;
	bh=PfyeLEgI6Wzc6o2hbREqBJyP/hoLKlVKC4Tey8dRMWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U5dUn6aMhhp361U/Bl6qL2owrzeigHv1ROJwsataDh1i8Sj2gAIIkopdmGlMYY1yP
	 8FYHCab9Q7HyE68HrBG7PVfXuScO81YmfZyL7HeO2JrK/J9bGI2jU5FJ4kka4Znkrj
	 /wMRQlXTUODdBwYIz+rShGqKYQ1x/4/ydyEnAPZOHdUYggBFZ2RjZoZ1InOpaNhYJk
	 B9nfUnju8r/XzzucLGe+EJdGSxg8Bie0lh/zBt+aEqJCtIUJpwSIYgcZyoTyNfO037
	 gipU9WSH53VO/4CS90QhAobPMmFGByTj6thW3ypiFB9NsMZIYQc3jnOOPuPmEz0kzU
	 5f/gmvS2RZ5+w==
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-65791c35134so2110871eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 03:12:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrmKenECURMDZKXuM/5jm3zaHOULCzQoDg3kfFjYBMKDcq8G5ZVdBF3mW+c9xpnEPQoyPCUit6IqeLCxSQwQdc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0JkYE1WJSwUtFQT7Gr28nFGj/bSawlCn0dU4213TXK2kH5YGq
	DIQrbFZgsW3UZUSdyd8S5UXyOkIZpU6wCM0itmZCTyKuqn9wora/TzhqghtbYDJM4Vy3oVF+YJS
	t1IjzZfZp3Gp6RjX7jh3p4k5yh39PnTI=
X-Google-Smtp-Source: AGHT+IGZT1oNvB00Vs0bo+1zSzNBqfaw6T6Q5aS4m9jK/Kze3wHdZKUoJCgVLJBOELGz/mfBFrHcJOmixXKZ8YRAhzQ=
X-Received: by 2002:a05:6820:1623:b0:659:9a49:8ea8 with SMTP id
 006d021491bc7-65b4523bfd8mr5105858eaf.44.1765797130168; Mon, 15 Dec 2025
 03:12:10 -0800 (PST)
MIME-Version: 1.0
References: <20251215044919.460086-1-ankur.a.arora@oracle.com> <20251215044919.460086-13-ankur.a.arora@oracle.com>
In-Reply-To: <20251215044919.460086-13-ankur.a.arora@oracle.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 15 Dec 2025 12:11:59 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0imk5kdqunNGvK+6_BPh2_k89RPPC8B4MDDF1GLZrUhLQ@mail.gmail.com>
X-Gm-Features: AQt7F2rG4xuAbbsQmykYUcenlgwWyBYqZnb2M67LAaRf0_2PJQ6JaqpYbcxHgdI
Message-ID: <CAJZ5v0imk5kdqunNGvK+6_BPh2_k89RPPC8B4MDDF1GLZrUhLQ@mail.gmail.com>
Subject: Re: [PATCH v8 12/12] cpuidle/poll_state: Wait for need-resched via tif_need_resched_relaxed_wait()
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
X-CRM114-CacheID: sfid-20251215_031212_827457_1682EC46 
X-CRM114-Status: GOOD (  25.14  )
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

On Mon, Dec 15, 2025 at 5:55=E2=80=AFAM Ankur Arora <ankur.a.arora@oracle.c=
om> wrote:
>
> The inner loop in poll_idle() polls over the thread_info flags,
> waiting to see if the thread has TIF_NEED_RESCHED set. The loop
> exits once the condition is met, or if the poll time limit has
> been exceeded.
>
> To minimize the number of instructions executed in each iteration,
> the time check is rate-limited. In addition, each loop iteration
> executes cpu_relax() which on certain platforms provides a hint to
> the pipeline that the loop busy-waits, allowing the processor to
> reduce power consumption.
>
> Switch over to tif_need_resched_relaxed_wait() instead, since that
> provides exactly that.
>
> However, given that when running in idle we want to minimize our power
> consumption, continue to depend on CONFIG_ARCH_HAS_CPU_RELAX as that
> serves as an indicator that the platform supports an optimized version
> of tif_need_resched_relaxed_wait() (via
> smp_cond_load_acquire_timeout()).
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: linux-pm@vger.kernel.org
> Suggested-by: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>
> Notes:
>   - use tif_need_resched_relaxed_wait() instead of
>     smp_cond_load_relaxed_timeout()
>
>  drivers/cpuidle/poll_state.c | 27 +++++----------------------
>  1 file changed, 5 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/cpuidle/poll_state.c b/drivers/cpuidle/poll_state.c
> index c7524e4c522a..20136b3a08c2 100644
> --- a/drivers/cpuidle/poll_state.c
> +++ b/drivers/cpuidle/poll_state.c
> @@ -6,41 +6,24 @@
>  #include <linux/cpuidle.h>
>  #include <linux/export.h>
>  #include <linux/irqflags.h>
> -#include <linux/sched.h>
> -#include <linux/sched/clock.h>
>  #include <linux/sched/idle.h>
>  #include <linux/sprintf.h>
>  #include <linux/types.h>
>
> -#define POLL_IDLE_RELAX_COUNT  200
> -
>  static int __cpuidle poll_idle(struct cpuidle_device *dev,
>                                struct cpuidle_driver *drv, int index)
>  {
> -       u64 time_start;
> -
> -       time_start =3D local_clock_noinstr();
> -
>         dev->poll_time_limit =3D false;
>
>         raw_local_irq_enable();
>         if (!current_set_polling_and_test()) {
> -               unsigned int loop_count =3D 0;
> -               u64 limit;
> +               s64 limit;
> +               bool nr_set;

It doesn't look like the nr_set variable is really needed.

>
> -               limit =3D cpuidle_poll_time(drv, dev);
> +               limit =3D (s64)cpuidle_poll_time(drv, dev);

Is the explicit cast needed to suppress a warning?  If not, I'd drop it.

>
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
> +               nr_set =3D tif_need_resched_relaxed_wait(limit);
> +               dev->poll_time_limit =3D !nr_set;

This can be

dev->poll_time_limit =3D !tif_need_resched_relaxed_wait(limit);

>         }
>         raw_local_irq_disable();
>
> --

