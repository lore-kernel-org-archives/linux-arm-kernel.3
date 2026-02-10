Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572ECEB26E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lxd3scP7jcsaagvw0zIVL4XPwjP50VBQ+j0ddfmbvk=; b=AYe5Y7iKQfALuuZDTY3itvb7zr
	/nuDwyoznXfNiDa8MNlHi/wXtLKxD91FpQ2EKE7+JIi+VJdbRJ0E4NQbqZyDJCX3XhQVhGNGWO8qx
	ifoF+/S9A9CF61P8Nidz6Z/PCN5uYLkTSTH/Kldb6Eeu55ULLXfbemp6O/AYmvxLoF/05U4jyN5P/
	hHB2dLcCnXQvzMC0zZxnPajaavY5gCfF6gnDndwXroD0FiDdITBw2HzVS6PwzHvD+SrSxc3xrhIya
	DzKJlgDg44qCDZHwXfangxZBBaxyBBSHeuiL1rcb89181/vGVUpcvyxPyW5Imq9Bv+/C4rt+czLeS
	aTh6JyVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpr23-0000000HHC7-38Ud;
	Tue, 10 Feb 2026 16:56:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpr22-0000000HHC0-3ZCY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 16:56:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3746560130
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 16:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19FFC116C6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770742568;
	bh=mp18oumLYcbeEo35CqspzfgW3GZ3+0epzStLxKYcz3Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dTwY86GRclL2KvfHFRfzZf6MITpa1VV8GvqjNdEc9tUxxPz33rlimMAE8P5KE3Tcu
	 PE+PgHII5MaTO3cxT+5zpIsJUsTR+Jo4nweVkMgv6jqkF2Gm3cHQdTXlOStIpIqMCj
	 /zbLKDJIPrXoQOpfLx8kKnyJ+OiwgFH6Ussce6dBIcyeEtAR24etvQJwcIo+XnEZq8
	 cPHM0heeuCEdBHtszwEdf/HOIVnf5gKu2mBLYEW9Dd/N7GRfDBAzSzJJHufB1wRSJn
	 p57dbyubp+8HRcp9rs8pEscTJu0rvaIyVDMXwoKGh0vmxNNBMM1zpUeL0EvxUrDvHU
	 WTvVbogH05jtA==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40429b1d8baso1876230fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 08:56:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXT+y/RaYJrrOSv+A2EsADNtZUj5QGYqXEGPzxqi0NxkWuaofTaU+PdacXgMJoLuZwm7+S4zAOVJXPzjOGNcfyi@lists.infradead.org
X-Gm-Message-State: AOJu0YxB5OXOlBC9YICV8VZY3ZhKIFagWmAY6T7AXwOTD93Ufq8JqaeV
	iKSEcSw9Oa4LwbhtREIQGDmOm2L5hRotXs4O9bJxqPrOVQEl2R8Psq/pKUBi6NLAHbYo5qv+qBS
	KBrgyq2oRwVe2fJA30ppXlh2iWFX5xPg=
X-Received: by 2002:a05:6870:e98e:b0:409:e025:a467 with SMTP id
 586e51a60fabf-40e66987163mr1394689fac.56.1770742568025; Tue, 10 Feb 2026
 08:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20260209023153.2661784-1-ankur.a.arora@oracle.com> <20260209023153.2661784-13-ankur.a.arora@oracle.com>
In-Reply-To: <20260209023153.2661784-13-ankur.a.arora@oracle.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 10 Feb 2026 17:55:57 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j_iXcbsOpkEFN=Qy0UMpa73eVfLLM42mNpx2E6JD1zHw@mail.gmail.com>
X-Gm-Features: AZwV_Qg8i5FSICt8qHIV10FqvRMrMFr7XqGHKA8IPhFnZEOVrYzwGdBhqyez9Dg
Message-ID: <CAJZ5v0j_iXcbsOpkEFN=Qy0UMpa73eVfLLM42mNpx2E6JD1zHw@mail.gmail.com>
Subject: Re: [PATCH v9 12/12] cpuidle/poll_state: Wait for need-resched via tif_need_resched_relaxed_wait()
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

On Mon, Feb 9, 2026 at 3:43=E2=80=AFAM Ankur Arora <ankur.a.arora@oracle.co=
m> wrote:
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
> However, since we want to minimize power consumption in idle, building
> of cpuidle/poll_state.c continues to depend on CONFIG_ARCH_HAS_CPU_RELAX
> as that serves as an indicator that the platform supports an optimized
> version of tif_need_resched_relaxed_wait() (via
> smp_cond_load_acquire_timeout()).
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: linux-pm@vger.kernel.org
> Suggested-by: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>

This is generally fine with me, of course depending on how
tif_need_resched_relaxed_wait() will work, so conditional on reaching
an agreement with the arch and scheduler folks feel free to add

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

to this one.

> ---
> Notes:
>   - get rid of unnecessary variable assignments, casts etc
>
>  drivers/cpuidle/poll_state.c | 21 +--------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
>
> diff --git a/drivers/cpuidle/poll_state.c b/drivers/cpuidle/poll_state.c
> index c7524e4c522a..7443b3e971ba 100644
> --- a/drivers/cpuidle/poll_state.c
> +++ b/drivers/cpuidle/poll_state.c
> @@ -6,41 +6,22 @@
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
>                 u64 limit;
>
>                 limit =3D cpuidle_poll_time(drv, dev);
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
> +               dev->poll_time_limit =3D !tif_need_resched_relaxed_wait(l=
imit);
>         }
>         raw_local_irq_disable();
>
> --

