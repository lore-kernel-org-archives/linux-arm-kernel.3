Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E97AC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWvHiMHTgOAPIc8uIv9IBhWsaldOSguvhvdROMsWe0g=; b=TepKRLKEAMUUNiW0vyvUPX7QAV
	Aybbd80SsrNnDwP+NZT9VHhtS1SWihY3Ml0J7+MMPZxX4Hunayhu/f0rAeFqzY6njiJJe69fFjcPl
	2NR+ix/MhKnlG+z4NOqAclKv8Ijb57HPnljGwYw3sw0ddDUEHRPh9b9EiSxLS7CTtFNYRgm1MSNI/
	vf+Q9oyTTaJnIkNOwAaj2Hd9JJBY5mgVML09DEODjhEadH5cQqsKOR6v15eaLGTAB/xMUw8MFdhlG
	EacSD8Lgy4ZE0WbWZuukedNpB9PP0dl22tlng6avc17rCakgvviWJMVYlVYag8+LViiZ+g/7Yr6NN
	EtV8fdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRym3-0000000BGSX-125o;
	Wed, 18 Jun 2025 19:48:43 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyjg-0000000BFpO-1wLB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 19:46:17 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso4651349e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 12:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750275975; x=1750880775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWvHiMHTgOAPIc8uIv9IBhWsaldOSguvhvdROMsWe0g=;
        b=T7/VFxB976Q52PxiFGbzNPKoNb5I6jCNGVg2m9jl1ucdBWmgkflkvE3yDuRR5Pani1
         K1tbPOGuXoO4l2UEYm2fgrWWWUV03SYU3Qq7+zpfJT/puInnutbn/7BuPx11jefrtpye
         qDn0xkxC0GL/EaJN32x78TvuN0Ry1/n9VzNXfP5NwZxXX+DGMHmSvBn9GUUpZ5zxqSxy
         BkpcuP1gSXJ92XCCrldTw/ON49QyxZ4jRdfcOtccy2wCtiO30/JN8hXJelOrc6IgphTL
         t7z9Zu/lzsgHnxdw1/zpKlPBPO8rBRGNs2seMoeR/tK+kpry0NlEW5iaKPE0IN03jbFc
         fAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750275975; x=1750880775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWvHiMHTgOAPIc8uIv9IBhWsaldOSguvhvdROMsWe0g=;
        b=UUAZ//fhAtgn56BXxDdeDE/NKruMCEoa6znAvyhLABoGE98SFsVZtIXosLzxkv76/b
         LDn/gr0wa+XQKPFmKu+QwljGWZRUh/hNX59YPUM9Jx+GaU1JtUS4jYKecU5azDwFGCwf
         LkWuSivwG+HylfEI/LqY5m1TpdyXU83QBOGy7J1GLKM1PyOB+ug6N+yqbAPXl7OI1o6v
         PqQTjzRTuCFrUxPWTRl4yG3RU/3/7KjumlQ2RtW38vaTETTeCrlAulevX2Qq+Qoy21aq
         kRHPqJt0SB+WfRXJMZv92c8/2KrJM1qgDDSOCpIA+lB6JbIv+kK6Tb95VfKzw0MhnP7c
         kXHw==
X-Forwarded-Encrypted: i=1; AJvYcCXU8E+2H4RmISDO3W5qTehHCw60FOqVgYeV/FyLxNvGP2uXIyS6ssDypt8j2+cnXvPu67ix2V2U3VXSSjftst0N@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5gaT51+gQI1lmFahhhPZtOtWcdJ3D2NkN2mV+K43tzMxZSmKp
	4FMzeMy+bFhsDc8MN/42CniY5WVgcmfO0nW66UnStPxBVsjvtf3gJin2b0A7cmsrxnE27JBTC3+
	Qqo6lmr7lUsLL/Ib0qnrAiXN2z+bxeBWHtY9cbx4=
X-Gm-Gg: ASbGncu23+SEcsRTSUhJm5jNbNfq9xnARudoComfU++FMDgCIgQ8FIPpqhYTfB9y8Kt
	X4UWpb2+SzIp9UpggCm/CGr3mCXTj/i67bYT99YaJ+c7XI+F8kdWPMmntd7N4pzegYLg9yu3w5B
	Oeg3e5HtUwtBlnLGfh1VAKK0xTLrlB3UVVGShGga/2xw3CArNMZcpSNcnNPGRuo6bwL0qZIGAI
X-Google-Smtp-Source: AGHT+IHPdx+3fxpJ0DR6n/XRBFuiyzE1w1ppJxiNw05htrhFVe3cOLpbgxBnZwtM5kwSo/F27oMBBGKVd1F/n0eZfpg=
X-Received: by 2002:a05:6512:2314:b0:553:a60d:6898 with SMTP id
 2adb3069b0e04-553b6f2bc6emr4879979e87.45.1750275974437; Wed, 18 Jun 2025
 12:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
 <CANDhNCrUtLCU86hNk4qyfbqn9eXsmbzgzJCxYmXGRCko0r=VbQ@mail.gmail.com> <bbb9a1f3b796e8d7bd0010bf0f4862d67368516a.camel@mediatek.com>
In-Reply-To: <bbb9a1f3b796e8d7bd0010bf0f4862d67368516a.camel@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 18 Jun 2025 12:46:03 -0700
X-Gm-Features: AX0GCFuASm5Kk-lAqXK-5L46ROAuwfALSQP_c8yuQf0EFiqFxlNrc_DV2E-CP5M
Message-ID: <CANDhNCoT0WDZ4A-OAN5=qu1wuvOdM5F=1skQsS0gnGTZsntinA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] sched/deadline: Fix dl_server runtime calculation formula
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
X-CRM114-CacheID: sfid-20250618_124616_526227_E8355547 
X-CRM114-Status: GOOD (  32.19  )
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

On Tue, Jun 17, 2025 at 8:41=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
> Thanks for cleaner code suggestion, how about this?
>
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index f68a158d01e9..3ccffdf4dec6 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1505,7 +1505,7 @@ static void update_curr_dl_se(struct rq *rq,
> struct sched_dl_entity *dl_se, s64
>                 return;
>
>         scaled_delta_exec =3D delta_exec;
> -       if (!dl_se->dl_server)
> +       if (!dl_server(dl_se))
>                 scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se,
> delta_exec);
>
>         dl_se->runtime -=3D scaled_delta_exec;

This bit above looks good to me.

> @@ -1614,12 +1614,13 @@ static void update_curr_dl_se(struct rq *rq,
> struct sched_dl_entity *dl_se, s64
>  void dl_server_update_idle_time(struct rq *rq, struct task_struct *p)
>  {
>         s64 delta_exec, scaled_delta_exec;
> +       struct sched_dl_entity *dl_se =3D &rq->fair_server;
>
> -       if (!rq->fair_server.dl_defer)
> +       if (!dl_se->dl_defer)
>                 return;
>
>         /* no need to discount more */
> -       if (rq->fair_server.runtime < 0)
> +       if (dl_se->runtime < 0)
>                 return;
>
>         delta_exec =3D rq_clock_task(rq) - p->se.exec_start;
> @@ -1627,14 +1628,14 @@ void dl_server_update_idle_time(struct rq *rq,
> struct task_struct *p)
>                 return;
>
>         scaled_delta_exec =3D delta_exec;
> -       if (!rq->fair_server.dl_server)
> -               scaled_delta_exec =3D dl_scaled_delta_exec(rq, &rq-
> >fair_server, delta_exec);
> +       if (!dl_server(dl_se))
> +               scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se,
> delta_exec);
>
> -       rq->fair_server.runtime -=3D scaled_delta_exec;
> +       dl_se->runtime -=3D scaled_delta_exec;
>
> -       if (rq->fair_server.runtime < 0) {
> -               rq->fair_server.dl_defer_running =3D 0;
> -               rq->fair_server.runtime =3D 0;
> +       if (dl_se->runtime < 0) {
> +               dl_se->dl_defer_running =3D 0;
> +               dl_se->runtime =3D 0;
>         }

Apologies if I'm confused, or my feedback added confusion, but I'm not
sure I see this chunk as a readability improvement, right off.

The indirection of rq->fair_server to a stack local dl_se makes it
less obvious what is being acted upon (might be confused for the dl_se
of the task ptr passed in).
Further, the dl_server() check is confusing as I think we're only
considering dl_servers here (the existing fair_server and potentially
future servers added), right?

I think your original logic for this function of just dropping the
scaled_delta_exec for the rq->fair_server.runtime addition makes the
most sense.

When we have additional dl_servers to handle here, I think we can
refactor/abstract out this logic as makes most sense when they arrive.


>         p->se.exec_start =3D rq_clock_task(rq);
>
> If it's ok, should I split it into two separate patches
> 1.Fix dl_server runtime calculation formula
> 2.cleaner code patch
>
> or just submit it as a single patch?

Others can correct me, but I think just a single fix makes sense.


> > I'm a little confused on the conditional here. Is
> > fair_server.dl_server ever not true (after the first call to
> > dl_server_start())?
> >
> For now, it's true.
>
> But based on our previous discussion,
> use the dl_server flag to identify and handle a 'fixed time' type of
> isolation.
> This approach makes it easier to extend and allows multiple servers to
> configure it as needed.

So from my read of the previous thread, it sounded like the
dl_server() check in update_curr_dl_se() is good for now, as there's
only the fair_server, but when other servers arrive we may need to
have a configurable bit on the server to determine if we scale or not.
For dl_server_update_idle_time(), I think each future dl_server will
need to be handled individually (and the code likely refactored to do
that cleanly), but I think its premature to try to handle that now, so
I'd just keep the original simpliciation for that patch.

thanks!
-john

