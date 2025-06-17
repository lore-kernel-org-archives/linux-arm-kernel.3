Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC02C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 21:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJBYievKNfCEHacHMV9ZIC+ridMvs+KwmtxKpRY2HrU=; b=TVEuLeVmo5FjzonTZQ1Nvmeg35
	g0KFjL5xQ4p7tKJs7JayKZUIckmSGwG3tEMBfE0nKg37B4QRa7rjyqa+YKf+92ovHAIHl0uDbZiX8
	0sprXyy9+iAm+5ZAcxRjMhK1AVLoL7dKmdEjb/UNck/Uaz21dPLj2yFKY7z/tdS1oKK5DBkz1Iwwf
	XLXvV+fOS7VON5PD1QSSUZyb5Gkzf2o6XNYF0Yc1vXAiRoKKyE92RIqom2OurT6f2LCWHQzQZMUVL
	jrc7kaqxF6a3oLOZLhsam5dA1tMpyNPP6eYeW5AEdMhU0MZjID6GTBjp3lvgAySYI90Lp3M/9fMMK
	W6z94ZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdVq-00000008Ou6-0G2d;
	Tue, 17 Jun 2025 21:06:34 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRdRt-00000008OXA-3kh9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 21:02:31 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54b10594812so6381447e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750194147; x=1750798947; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJBYievKNfCEHacHMV9ZIC+ridMvs+KwmtxKpRY2HrU=;
        b=PpJWVs2chJdjaEyvp5ywsiePDEX1ILuBG/uUzol6Q9LC/CvFeqMRPC5qZneBIEKFyl
         9vUJ59t05NKYuYM88Vh8cCWsrR683CXIvXSPo1ZXT8vBG8oNFEQau8Epnkzp6ud9LIfB
         6ZTJGNXQ364+0uJZjn/oWzNb1zOzO70t+RuygSTqUd5nFsk1BQhMBGo7T/GhZM3q1+0E
         KunS1hu2vYgumIVSQR3zJ/oXCfTWzWWv+c4Tgn9hLIe9OlmfEHn9pvQHBrUGRQ7jdNP9
         8kd3O6Nq71p91qmQWFKhK4r6A3yGXSd6o9ibeXG7Le+nPuF4Eueex7SRsqCovT5qQ1J+
         tXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194147; x=1750798947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJBYievKNfCEHacHMV9ZIC+ridMvs+KwmtxKpRY2HrU=;
        b=hHBSBevmMxecD/7hPYn1sPojjIkYmRIzJ8liGrbILPsN742AGEfV51mE8fBD++eATs
         svwAGSwt4IzqCiZB6zrcv6cHSUI1z0WU6Gbaod59fvaZ3c3RMvWGBiFO8HWPF6GfCNxv
         AjIx76yKL3+iSuf5lwsTsHbdNrnNVhY4RQk9jzygL4/n/B5HjdLuHrdrT10Ek4kFzXwF
         jPwvUJdDfKq7YTmKH8ezNYriDjmSq8A5Dc2SRlXCrOP+KxJmnB7bRvzuyR9gSeYAxrDq
         /2QsUu7d8ltuy1oWIPPqrTGUAZVDX16vQ3b3UhKADhWfN9KTcxkJm1gDVucBC/ow1jie
         iGUA==
X-Forwarded-Encrypted: i=1; AJvYcCX4waTRqCYh9c8p5rvv/hR4tkcFDbOqsMSFwP0APnoaJgdM6+5xC8stmdlDidvwEzkonSkzvr3ZNlkjzsTulGhc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5zGXjgnqhhwCro3uo7k/WnnMkmKMrcFKbR4j2qU8k+B7/nmWt
	FJHLTb8J8aciruQaVC6bIAjl85cdrPV4J0CF/T0zcVgG4J8G3e0CS2oAsnMb1u/h/5ENci19R7N
	TN3CUu3ItxZwQn8LiJIurl5qQTQU0f+ATsjwWFcE=
X-Gm-Gg: ASbGncuymxZhaIvLIg5r3HN1N2sxM19/xMQ/r2nJ7NmKY80g7Ofx4qUuwZyLl5gyRLU
	xsw7CR1qBznG0n/F+/ifDfeO0cGsEA0vZSw8vzbBK9nryg4S1OzxsNS823frb7YtSc1roWXYfd3
	RyjgA8lIv5/Zg1fd9xHqi6qkw+1BzN1aZWz9fZy4KIpWkQvC1x/p7jI7hQ5PSnKVAt9gvBSWo=
X-Google-Smtp-Source: AGHT+IF7sTQYGGBwCF4kAUzw/HchYbiway7musm8Os50fNb5cA76yIicDTBJe181wiAxG4715hg2/8AO/GJeuaxl92c=
X-Received: by 2002:ac2:4c41:0:b0:553:37e7:867b with SMTP id
 2adb3069b0e04-553b6ee8899mr4611437e87.31.1750194147074; Tue, 17 Jun 2025
 14:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 17 Jun 2025 14:02:14 -0700
X-Gm-Features: AX0GCFtWGhwas8ObpV8SSgSSLy0WEYla_bnrUoClImFq7kWv5WAqODjqVFnEkwI
Message-ID: <CANDhNCrUtLCU86hNk4qyfbqn9eXsmbzgzJCxYmXGRCko0r=VbQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250617_140229_929133_8FD2BA7B 
X-CRM114-Status: GOOD (  25.31  )
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

On Tue, Jun 17, 2025 at 8:54=E2=80=AFAM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
>
> From: kuyo chang <kuyo.chang@mediatek.com>
>
> [Symptom]
> The calculation formula for dl_server runtime is based on
> Frequency/capacity scale-invariance.
> This will cause excessive RT latency (expect absolute time).
>
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
>
> [Solution]
> The runtime for dl_server should be fixed time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the dl_server.

Thanks again for iterating on this patch! I've got a few minor nits below.

> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
>
> v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediat=
ek.com/
>
> ---
>  kernel/sched/deadline.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..f68a158d01e9 100644
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
> +       if (!dl_se->dl_server)
> +               scaled_delta_exec =3D dl_scaled_delta_exec(rq, dl_se, del=
ta_exec);

Just a nit, but would
    if (!dl_server(dl_se))

be a little cleaner/consistent with other readers?

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
>
>         rq->fair_server.runtime -=3D scaled_delta_exec;

I'm a little confused on the conditional here. Is
fair_server.dl_server ever not true (after the first call to
dl_server_start())?

Also, in the discussion on your first version, it seemed there might
be a need for different servers to have different requirements, but it
seemed like fair_server would always not want to be scaled.

thanks
-john

