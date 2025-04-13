Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1EBC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 21:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVx7pId+fo+v9AziRU2Xhwn4igyBgC1HT4sAj9Df4U0=; b=wcFzk60J9HUdr+nCeel8AYU0x7
	RE55ksfnL9N1GaCyxvn6SSj5/SEtT6uhxzv/P0iwaO/CrtfBzLOAxi0yYpxtkxrDPgLmWBpzILhXq
	c/k+jivhcp8Gz3pbIxneut0fQxnUWIl3jAiuIQZZ12cDpLktsGAuzk+U9Hjkpiew/xJBGqe99jm7O
	+MN4ioaGPD2wbz2QjN2Y37/hhixDf6d0cykZgWKH4CDUaOPG9oniW5olf5WbmLneKO/ZpnV4H4t2i
	v2THSV7u74txaTP0kA2D3e6dCIsZjzq9tksTRaMy2qrbGzSJOMrryXfOB3AKktg+3J6nRY//AN6ur
	dkdXflYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44xJ-00000000Bl1-0XCc;
	Sun, 13 Apr 2025 21:33:33 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44vT-00000000Bbc-0bJG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 21:31:40 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-86d39be8c77so221466241.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 14:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744579898; x=1745184698; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVx7pId+fo+v9AziRU2Xhwn4igyBgC1HT4sAj9Df4U0=;
        b=AwfJk53KPKX3FBhUxl87NZf1J5fGglZx33Eyj0zHhfwGWRQ1eikIWSwizEEyVQglWB
         5lj9dtAh+qi3io5mdTz8ji74nGIA1z4LNC2Szbg9X5HBoeTrXc4QOG9LLJSkSRZ4aogY
         kjXu3cUBKUa8E1w6d8tEvthdf0zSdVKlfWVrVnYCwl6juZQBxVMU03zGWwmeMp0P2B4h
         x/aqEu/swgJu10Uukq+1kEPckoUfvy9P/+cULMHBNdOKzcAfcbLTwn8sXzqh/owlmbVw
         MuUOvAN+B1lz/e8q+KXjZHm0RCB0NQPYQkqNl3SAzVsoyqpHMkugsuiSjO9q255GPYen
         8RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744579898; x=1745184698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVx7pId+fo+v9AziRU2Xhwn4igyBgC1HT4sAj9Df4U0=;
        b=wzYOEan1PDcha1cCwFipj/6gbC9JB1cqWjIMcnf9wA9MClmXucaDmxNsqPEno5bnkt
         VIXY1Jr8FWey65a8Yuy5VTCdIV7M1m//nPGLyVBjd4RL0tohAJidL775QcxjBmj+bArP
         7QThu+Hrh9RtILn0knBGA+bL+niwCgk4ku2vE/tOQapIBQHT9Wk2XrGxMOtqhd2lFyX5
         CY3gRcIUJe3nHFcunOQ95iUhvyc6fBOL/zmB94FltRVLJCsINS1mAF7bNxYvDNYJepIj
         ottS5PVlDLPw1AW66n4Pr/e1tQwsaR9RJbmnqVTuPgGg1TLEyA28Ea/NMLTr1/4LlUpR
         PVlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl1B0V3GVPcgguW6YNUWvQ8fX3vshFFULUnWBlup9hdWoUYhYVdvuGnLeAhVh4qHMW04M78VSfMA1fsr0PSlPB@lists.infradead.org
X-Gm-Message-State: AOJu0YxZtMeGkBBURmBamE6hSdu30PN1JstOhmq1yr47+KGJ7OnSO4Sj
	/h7cvtJ5xTp8ll9zeQJFKefx+1xAJN83XDNKILyCXwIli7NIgEVPEsJ1v764J4QjVa6YNVkpkFB
	EayTxO6iX+sndPGmznvHVygcEDg==
X-Gm-Gg: ASbGncsUsB/iC/HWyAu0G4WeVM5nbHtbO5ADW2VQF0U1xbyIzEfYubbfEIqhVSX3y47
	CNCva2oicKYBxuE6DTDjnKsG5K/DdknfdfnTpC/brcWz9K/ivpPypoEuiUJiPkvgRlb13V9WshG
	BTWpa3vjL3gQ/nZEPveYye8QU=
X-Google-Smtp-Source: AGHT+IFllKurmSafw9kTIxLu4ahAC8hkWzQYIgTlQSqJgaGokd0Bp/EPGcbx+9emTi0vCWUUQt+rhYiuzmyqBQu3x3o=
X-Received: by 2002:a05:6102:511f:b0:4c1:966a:3c4e with SMTP id
 ada2fe7eead31-4c9e50a7c13mr2151657137.9.1744579897520; Sun, 13 Apr 2025
 14:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250412160518.1824538-1-chenyuan0y@gmail.com> <86bjt0l6q4.wl-maz@kernel.org>
In-Reply-To: <86bjt0l6q4.wl-maz@kernel.org>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Sun, 13 Apr 2025 16:31:26 -0500
X-Gm-Features: ATxdqUH1BeMQrQPrFwdsiZdU6msIr6wxehKc7O712r23xRkqjsP-yQUpqJTGusA
Message-ID: <CALGdzurneK24t3AF2z5U6CoxrGYMEWUzmPn8-Qp0tToKwQV8RA@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: apple-soc: Fix possible null pointer dereference
To: Marc Zyngier <maz@kernel.org>
Cc: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev, 
	rafael@kernel.org, viresh.kumar@linaro.org, marcan@marcan.st, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_143139_187911_5E0FEB26 
X-CRM114-Status: GOOD (  34.16  )
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

On Sun, Apr 13, 2025 at 5:02=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Sat, 12 Apr 2025 17:05:18 +0100,
> Chenyuan Yang <chenyuan0y@gmail.com> wrote:
> >
> > Check if policy is NULL before dereferencing it.
> >
> > This is similar to the commit cf7de25878a1
> > ("cppc_cpufreq: Fix possible null pointer dereference").
> >
>
> No, it's not similar. The patch you refer to actually introduces bugs
> by returning -ENODEV in functions that have an unsigned return type.
>
> > This is found by our static analysis tool KNighter.
>
> I'm surprised that your tool hasn't found the above, because it should
> be a pretty easy thing to do.
>
> Irrespective of this, it would be good to describe under which
> circumstances this can occur, because I can't see *how* this can
> trigger. The policy is directly provided by the core code and provide
> its association with a cpu, and is never NULL at the point of init.

Our tool currently identifies bug patterns by analyzing patches. For
example, in the similar function cppc_cpufreq_get_rate(),
a patch was applied to add a null check for the policy. Therefore, we
assume that a similar check should be implemented here

> And if it can trigger, why only fix this one particular case?
> Dereferences of policy are all over the map, and would be just as
> wrong.

It appears that similar checks are implemented in other areas=E2=80=94such =
as
in acpi-cpufreq.c, cppc_cpufreq.c, drivers/cpufreq/cpufreq_ondemand.c,
and drivers/cpufreq/cpufreq.c.
However, I'm not sure if apple_soc should adopt the same checking style.

> >
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control App=
le SoC CPU P-states")
> > ---
> >  drivers/cpufreq/apple-soc-cpufreq.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/appl=
e-soc-cpufreq.c
> > index 4994c86feb57..3de9bb2b0f22 100644
> > --- a/drivers/cpufreq/apple-soc-cpufreq.c
> > +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> > @@ -135,10 +135,14 @@ static const struct of_device_id apple_soc_cpufre=
q_of_match[] __maybe_unused =3D {
> >  static unsigned int apple_soc_cpufreq_get_rate(unsigned int cpu)
> >  {
> >       struct cpufreq_policy *policy =3D cpufreq_cpu_get_raw(cpu);
> > -     struct apple_cpu_priv *priv =3D policy->driver_data;
> > +     struct apple_cpu_priv *priv;
> >       struct cpufreq_frequency_table *p;
> >       unsigned int pstate;
> >
> > +     if (!policy)
> > +             return 0;
> > +     priv =3D policy->driver_data;
> > +
> >       if (priv->info->cur_pstate_mask) {
> >               u32 reg =3D readl_relaxed(priv->reg_base + APPLE_DVFS_STA=
TUS);
> >
>
> So while this is not wrong, I don't think this serves any real
> purpose.
>
> Thanks,
>
>         M.
>
> --

Thanks so much for your reply and comments!

-Chenyuan

