Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5833EC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 02:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIyz0TyYX+Z3NqBUdZDf3ZSHxoRX7/bXEgMDfSI548Y=; b=A66hhts1WAwdJFmdlXNWW79iWn
	yD4Iok958Nd2oo38TmnzumfSAhlqWWJqdP/z7AN3BlFdTgAuKbPLWMU1MFl+qS1PlWM2LZbJb6G75
	uGfsbj6jWd97r5UKDwe1KqkM8DlSj9ZVDdrl5Bvu/K/w+CvUK/pRn3/K9vMU5oEXJ4pxK0MagEpRM
	yg58lgS4xeamFvs+T2yQaZg0ViQ6sag6jeMrF5Rc0HKR5ERfaNc0QtYMXBcp4vHiMhuS3N5lGVvNY
	fsyzHr+5JsQTa7hvtt4vFUPPH7+HbYPd2EZ4bZcr92xiRzwMbXkbou8XhbTjYwmFNtYLiVYM7Cl/0
	aI0MwAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzBX-0000000DOE6-44yO;
	Fri, 27 Jun 2025 02:51:27 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUz9D-0000000DNuk-0y5R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 02:49:04 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-553b82f3767so1742558e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 19:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750992540; x=1751597340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIyz0TyYX+Z3NqBUdZDf3ZSHxoRX7/bXEgMDfSI548Y=;
        b=OJn2LmL50WIuad0hrEaAiQeauyBljgdp7zo2HvgyHOvtahNmWzCo0QGpb/jtCZmKpC
         sMitrlbthMYH7IFwXjWDK/Vc1465cnqyZAQLTrParyhP61sSMZVeqSx2V5nDjJQoO7kC
         d3aUvmKkIM9jfkISIUg1U+IMWdesZ5e7fWnn8QqD84Xe1czAbWWyLkkLGeCd0TKll8gS
         uo2w2RvNOyF+XdW+fX90IA2HnqnKMD/mQLfGyhx56sIlQv4qo0OU9SIaaaqRD1EklCYw
         EO4u5RucM5N+SaXxeb8fM1M1gOA1+KFJMX/9GSk3Mkv3ECwLJtXD0fSjl7++bHEtVuoM
         82ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750992540; x=1751597340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIyz0TyYX+Z3NqBUdZDf3ZSHxoRX7/bXEgMDfSI548Y=;
        b=HoleAxJsnC3uId3SxB69oqDkfpTAmV5RTu1PLSpauJ5o5Y5BlGKadejLlFDCA1RzUq
         1/tcVwWN6KTX9eeTy3SRy4uvhvVzpVUbSJa4uGfVr15y3pO1d+22P/Bv3fXMhwTPhy/P
         slsqBFq3wPl99uXIO329P9PKtpgglZmhieYzfQrjA0Ie6jOcM77F1nCKXwp1BrJI3gIg
         sEyapM9yhpdN+iJs++Vd/onhiXsa0RlfG19ANRXY12Ig/Lb2+mDhyBzr8Bnjrz+Gv0Sq
         GPwCrgnliY72WMtqUMcUbQ6vw6SZn7praLAy1585afx3wjVNL6dnh4wGv48inme2J6NE
         wPew==
X-Forwarded-Encrypted: i=1; AJvYcCUNLi2wA/A0PLu03OqteEbcTMkCfP0rAcIDHyIUh2SHnJ6h2R1hKY8AsjSY+82rS5xltGm1Oxj+aAYw3US4kDLe@lists.infradead.org
X-Gm-Message-State: AOJu0Yxopm0FiLDnm3WiZcpcfTj4pT8X3AbjL6W9aSfL/YHLZY4YhDgp
	LXZ0tTPcsik9K34UiaqAzSlCCCFbSGgKi0S3fudmsMt4DvyG2oH/NtZgPk86Tv72v9anQsn4JfO
	wBVotmgEiFceyX0xEfk9J1I7xtKHnAUG9GhxPJI4=
X-Gm-Gg: ASbGncuYetYRu1gSkrxVDzWSDkV1iQgc0t+TRTrpz2zgy4NfEf4gEMt3J29+cWwKVRT
	qK7WE+RxH5N7u1EUWD76RUSlKvPktcJPh1nMglFVp8HLbSrIQ7KtmaUqMFlHbDIu9FMyN+KdBmn
	eDmxxZXSNq4E+CfgFSPFEt8ebybf039SP8UEG6RmFL/H0bCKBf+pymr3Cdddvb/t39ciQyHvzy
X-Google-Smtp-Source: AGHT+IEzF/swD5xaOdJR7lMJjb1yXBvdw4JiGquGN0u5dPeY58LAcd6ntfOPW/1JZJGrYX4JaKsPUJ8VGHh+iWR50cE=
X-Received: by 2002:a05:6512:4007:b0:553:5283:980f with SMTP id
 2adb3069b0e04-5550ba29ed0mr628392e87.51.1750992540108; Thu, 26 Jun 2025
 19:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250627022837.3331827-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250627022837.3331827-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 19:48:48 -0700
X-Gm-Features: Ac12FXwf59eyhe3NIP1HlmImClaDAHzqNeVDRK7bbuvKnPBO5OcLJhb39G9nTn8
Message-ID: <CANDhNCorm58L9CqHyNORgfk=++HkCttmyCkM23Pn8rXV7cF41Q@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] sched/deadline: Fix dl_server runtime calculation formula
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
X-CRM114-CacheID: sfid-20250626_194903_287491_5C933602 
X-CRM114-Status: GOOD (  36.11  )
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

On Thu, Jun 26, 2025 at 7:28=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
> In our testing with 6.12 based kernel on a big.LITTLE system, we were
> seeing instances of RT tasks being blocked from running on the LITTLE
> cpus for multiple seconds of time, apparently by the dl_server. This
> far exceeds the default configured 50ms per second runtime.
>
> This is due to the fair dl_server runtime calculation being scaled
> for frequency & capacity of the cpu.
>
> Consider the following case under a Big.LITTLE architecture:
> Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> scale-invariance defined as below:
> Frequency scale-invariance: 100
> Capacity scale-invariance: 50
> First by Frequency scale-invariance,
> the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,812
> Then by capacity scale-invariance,
> it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
> So it will scaled to 238,418 ns.
>
> This smaller "accounted runtime" value is what ends up being
> subtracted against the fair-server's runtime for the current period.
> Thus after 50ms of real time, we've only accounted ~238us against the
> fair servers runtime. This 209:1 ratio in this example means that on
> the smaller cpu the fair server is allowed to continue running,
> blocking RT tasks, for over 10 seconds before it exhausts its supposed
> 50ms of runtime.  And on other hardware configurations it can be even
> worse.
>
> For the fair deadline_server, to prevent realtime tasks from being
> unexpectedly delayed, we really do want to use fixed time, and not
> scaled time for smaller capacity/frequency cpus. So remove the scaling
> from the fair server's accounting to fix this.
>

Thanks again for revising the commit message, this version is easier
(for me at least) to follow.


> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index ad45a8fea245..96a21f38fcc3 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
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

As I mentioned earlier, I still don't see this conditional as making a
lot of sense, as I don't believe there is time when this function
would be called and (!rq->fair_server.dl_server) would be true.
And even if there were, I'm not sure it makes sense to scale the time
interval based on the fair_server.dl_server flag.

From a separate discussion, you highlighted that it might be useful
once we have multiple dl_server types, which may want scaled
accounting, but I think in that case we should use an explicit flag
instead of the dl_server bit to denote if the accounting should be
scaled or not.

So, since your patch is a fix for a pretty bad bug, I think it should
be focused on fixing the issue in the simplest and clearest way for
the existing code, and not be too worried about integrating with
future changes that haven't landed.

Then, as those future changes land, we can see how best to generalize
the decision to scale or not scale the accounting on a dl_server.

That said, the conditional is a bit of a moot point, since I don't
think we'll actually hit it, and I'm motivated to get the bug you are
fixing resolved, so I wouldn't object if this went in as-is, but it
seems like it would be much cleaner to just drop that conditional as
you did in the original version of this patch.

Thanks so much again for your iterating on this change here! I really
appreciate your efforts to both find this issue as well as to get it
fixed!
-john

