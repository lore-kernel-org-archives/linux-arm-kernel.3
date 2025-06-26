Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D93C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 05:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ixr34CRuFwoG6PvhFrZURvWLjuli1tb6auMPGQGYXo=; b=z0Gc9wcBAyuoFIV6Yv/S2mysZG
	nDFigzdqeQ/aljQN3mlJA1veauIkgU1zn/6Veq9EvRN3IVVAaIrGfmzmAyJ+pLHAtE6VHLrgZJA59
	mvtqMWQzk1OK2TLJyBmtF3OBTgwh5wi0cwQ0n6CVNQMjXvqivUruSpgrzDNa7YuKHqOsoWLrr6I0g
	nLdvsSpmsS1y+gDjrPr45ZHuEvRAmp/+1gMl19/NqBPcEjW7IdCbXnIRK8bxzsOwie+sbSB3qlqmn
	u+TJYQGOUdF9fYs1F2wC43VVnLRa7pfIw9jj5yG+Cu9Vg7pMFoPiFHfQR11jJ5iChHzkObgAONIr3
	XPWz1Xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUf9A-0000000Adwy-2Fap;
	Thu, 26 Jun 2025 05:27:40 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUf6s-0000000AdpN-0h3G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 05:25:19 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553b5165cf5so764639e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 22:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750915515; x=1751520315; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ixr34CRuFwoG6PvhFrZURvWLjuli1tb6auMPGQGYXo=;
        b=atk6fUsbVy++somcLdOiovx8fN4lg7VLJi1F+Jnbww1hZzueJYR5fad7wcKtnK6e9i
         lgqWzMYttlgeL2FqRbeV1IfuN1v7Xj/LLjFXlW/+ap87BpfFHWNirAS4+/25z6fA5807
         6Ep92MPkrD03VkwZzsFxItuvaQ/Rtfv5V4FheryU+ZDFOpO2+resa3TtI83xuJ16Lvju
         7ouD5xZrR12zTgdp5BUAP+BiZnAMzKdqJ5nmlQvqkb+WezinZiihCMKv6Cx9v4Kr1D/X
         Q2wW/w6EiZli+2N2zdsHI13sQPpQzee9seRgn3f9IonNB2Uqtce1f0CyB/2jFMZC3e4E
         aO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750915515; x=1751520315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ixr34CRuFwoG6PvhFrZURvWLjuli1tb6auMPGQGYXo=;
        b=KtJKA88H2Z8rNWjxL6pGa3D15E0RFWBdBc2QfQrULSiInRAOxOKGhG7+C3T+EvyRh4
         f0Bup9ZF8YeodGkU1sH/f0HaEq48tFN/dIr7WFuoIjk61cjRzJJN/gYIOIomie1K8Hy4
         txmWmAUTXoyWWxwVEfZ05YvuMBaWI1AN8nAtYKdMvQYhK7M42F0kQWvCmk8IiN6Qax1x
         vh6z6elojLHuvc2Vux8l6ukYFDJrV9GOn+21NBc/ofgIsVp1LcnwPf0fccS4NVck4Rug
         eBetX4pFpZyEZxyKg/LEMsozpcR1ZCVWyIXMwBJJ6et1OzHecNrI9oSukX6wF2+KF0eM
         g3SA==
X-Forwarded-Encrypted: i=1; AJvYcCWww9QCHXvWFaNtqlptvyFApZQdxljZNGujEFbaKle3nkrLcql/8LVKlAimKt4Ox5IuOLUKnizMYu06y69LW21q@lists.infradead.org
X-Gm-Message-State: AOJu0Yye6avTWV8NsUGYnGXc2NLs3ezSox4Cin3rSkU9aG9G/vWzgJdw
	vnyIO4pUXDMWcfGFY/s6IkUxALQli2lLo3oi2jaiW5VNtLp83DRStqXpRBLk87ZT/U8Qq9B4f2I
	O8bDrPeBlaSUIyePmay8Fbp0s+r63CGU0kSzLSaI=
X-Gm-Gg: ASbGncukexfzrJ2OzBj5itXTiFtChJHbXaGvrVb6xaUiiTPi8NmIvVLpXqywdm2xqvT
	yQ4bmykwNzlblEDOt+xk9FALd/x96K0Dk+pF/nzr8NjwVqe4UnX+KBqdum8B2dU2+ybAxtOIfBv
	nBGbqw9HOfHFBYzqN7tR/SObp8tcSdKYtYqe4Q3GDAlT5wZQEUzXHEzwyYSu9+kCNdFFIwazH5
X-Google-Smtp-Source: AGHT+IGodguDEXCNroFB1rkVwfUyXnwlhYIj4o/5DqnlD+lqXFzy5P/tRol06d9uCArjELEt3Fyvfk5CURCo3xl53cU=
X-Received: by 2002:a05:6512:2c85:b0:553:2edd:a7e0 with SMTP id
 2adb3069b0e04-555028b2014mr893010e87.16.1750915515243; Wed, 25 Jun 2025
 22:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250626030746.2245365-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250626030746.2245365-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 25 Jun 2025 22:25:03 -0700
X-Gm-Features: Ac12FXyLVy8PiJFpc0O5wjSoIq1ZDfueOIQeT5UYqek1YBjnhVpxXNtpqkY_jhA
Message-ID: <CANDhNCpNZd+s9+ZXU=+4t3CyV=7weFsbWQEx2=M9yphx6szt8Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] sched/deadline: Fix dl_server runtime calculation formula
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_222518_241732_51B7653D 
X-CRM114-Status: GOOD (  33.76  )
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

On Wed, Jun 25, 2025 at 8:08=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
> [Symptom]
> The calculation formula for dl_server runtime is based on
> Frequency/capacity scale-invariance.
> This will cause excessive RT latency (expect absolute time).

I appreciate your symptom/analysis/solution markers, but they are a
little unconventional for commit messages, so you might consider
dropping them.

Further, you're explaining the cause of the problem before you
describe what you were seeing.

I might suggest rewording as:
"In our testing with 6.12 based kernel on a big.LITTLE system, we were
seeing instances of RT tasks being blocked from running on the LITTLE
cpus for multiple seconds of time, apparently by the dl_server. This
far exceeds the default configured 50ms per second runtime."

Then you can get into the analysis where you can state as you had above:
"This is due to the fair dl_server runtime calculation being scaled
for frequency & capacity of the cpu"

> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
>
> Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> scale-invariance defined as below:
>
> Frequency scale-invariance: 100
> Capacity scale-invariance: 50
> First by Frequency scale-invariance,
> the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,812
> Then by capacity scale-invariance,
> it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
>
> So it will scaled to 238,418 ns.

This part is all good, but you might want to make it more clear why
the smaller scaled "runtime" value here results in longer delays for
RT tasks.
ie:

This smaller "accounted runtime" value is what ends up being
subtracted against the fair-server's runtime for the current period.
Thus after 50ms of real time, we've only accounted ~238us against the
fair servers runtime. This 209:1 ratio in this example means that on
the smaller cpu the fair server is allowed to continue running,
blocking RT tasks, for over 10 seconds before it exhausts its supposed
50ms of runtime.  And on other hardware configurations it can be even
worse.

> [Solution]
> The runtime for dl_server should be fixed time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the dl_server.

I think this can be stated more simply as:
"For the fair deadline_server, to prevent realtime tasks from being
unexpectedly delayed, we really do want to use fixed time, and not
scaled time for smaller capacity/frequency cpus. So remove the scaling
from the fair server's accounting to fix this."

> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Suggested-by: John Stultz <jstultz@google.com>
> Tested-by: John Stultz <jstultz@google.com>
>
> v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediat=
ek.com/
> v2: https://lore.kernel.org/all/20250617155355.1479777-1-kuyo.chang@media=
tek.com/

Please add a "---" line above the version data so it doesn't get added
to the commit history.

> Change-Id: Iaaa1ec78f405586c22ba56230ef1143206daa2d0

Also no Change-Ids in upstream targeted commits.
./scripts/checkpatch.pl should warn you about this, and its a good
idea in general to run that before submitting.

> ---
>  kernel/sched/deadline.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..96a21f38fcc3 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1504,7 +1504,9 @@ static void update_curr_dl_se(struct rq *rq, struct=
 sched_dl_entity *dl_se, s64
>         if (dl_entity_is_special(dl_se))
>                 return;
>
> -       scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se, delta_exec)=
;
> +       scaled_delta_exec =3D delta_exec;
> +       if (!dl_server(dl_se))
> +               scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se, del=
ta_exec);
>
>         dl_se->runtime -=3D scaled_delta_exec;
>
> @@ -1624,7 +1626,9 @@ void dl_server_update_idle_time(struct rq *rq, stru=
ct task_struct *p)
>         if (delta_exec < 0)
>                 return;
>
> -       scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq->fair_server, =
delta_exec);
> +       scaled_delta_exec =3D delta_exec;
> +       if (!rq->fair_server.dl_server)
> +               scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq->fair_=
server, delta_exec);

I still feel like these lines don't make much sense, and it seems like
they could be dropped.  When is (!rq->fair_server.dl_server) true?

>         rq->fair_server.runtime -=3D scaled_delta_exec;
>
> --

Thanks so much again for finding this issue and resubmitting this
patch! I really do want to see this land quickly as it addresses a
pretty big issue.
-john

