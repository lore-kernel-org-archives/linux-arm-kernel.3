Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F96C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HXCFU9YonjJhyDLHpnnxPkRURBU3+SLjAkNFJPgsSI=; b=PrdSS3HygTPcio1a8ah61Y/jU3
	QNmNQ73vhLk8jvgWyZ8IR9B6pWPOPDzYa/ukRODQ/OXfnB6RSYDn4ezvjVeH+6DJGRcFzre77cgSi
	nqWdaiWFWB5710BCeJ7/k0iSlCn33jLbBTz9DBRJ1wcJjqiT09q624hox77e3G2bS1io1UR8tx31e
	JCG8Zzw7IWPvZfb1qjDIgIBxVXwg76srg34wX1IsfZUuxhAZOCZKblIYFVhxJzd6OYxMtWy1T3v5b
	EU737gePZxB+o2izzLWrdJSt6UEU3rYb5lwwUzHdcgIMJoKkrSabB1X+cSqmujk5ZTN6HDctlbmez
	E4XVqwvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MxI-00000009IcE-0C7U;
	Thu, 03 Apr 2025 15:58:12 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MvT-00000009IVZ-0c45
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 15:56:20 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6ff1e375a47so11474597b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743695777; x=1744300577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HXCFU9YonjJhyDLHpnnxPkRURBU3+SLjAkNFJPgsSI=;
        b=y/REPer8BIbMmeqWPPNiqQ8xzUrhZK76uBAPk3qdRmOaYU/cbpNpRtPH8tA7TB7SIl
         XzpMZT2T6ECyexolHzgoowqcyRqiCu5v8AnucDyuhMoBpkLQ6iDqcKYs8si6OlwznH65
         DKZOGcp1e/3B48MOk5W2cQXM6uT7XSeLmagUBeqlMkRvP/sDR5Xyk6itgZ/+mcQJzm0Z
         Bt6m4noL+yJD8i/TY2Zd39+hksrrPgnVVdSs1Dahwx5Zq+8eTnLnsxeLJkc6uhfm6v0u
         cpwz9dmWJav+cA2aQBKu545p6s+uBxsKi8Y0ar2dM0ue2lI343ELmMoGxgqd1kydVpji
         HiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743695777; x=1744300577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HXCFU9YonjJhyDLHpnnxPkRURBU3+SLjAkNFJPgsSI=;
        b=k2XBpXxOwLGCtJOMPrUMnL84igpf12s99L+n/uEXmStKUWfRW0Xvma0oNqv8fA/wjI
         diMjbCfk6hjySXSO8uLIzQmp0M37b6QwLsgw8jgc8OeBxlduGH64QlRg+leE/hf+gGcC
         i7OsDffc4nxiIrrZL7mkJz38hCVFUGIX3oGNgzgA4uWqm+tAygi78aCVVF4yW/jKicAQ
         0pMlE2ru5KZEGLz9kGMmAthKd7KcFUpxHlaeGv/mKdpYRGvDkElsWii7f/Jsx7Kdme51
         rbqVJdAKT4HWruw1Ak+PRUNrtcaPERvAqyKnBy8HU7WmYZM/+6xngICb79DAmo76NbJC
         P/jg==
X-Forwarded-Encrypted: i=1; AJvYcCVp+KYCkRoEGVq4lq8pA6VgYnuvtqEJyzc+ascvuWT0PlVZse0YDgjaWPuViGfIqNDO/pcivZLo39Ls3/eVLv3/@lists.infradead.org
X-Gm-Message-State: AOJu0YwbEFbOBdfa1LogtLrSGN6rp5TBP+9AgdLXCMIDq5xzzs48vuna
	D9a2J+sqGpHhOM+5RqpwafZ2nAuXpzjdc9BlNGwMLUcbptrafTiZjgyGwm/kP8v/C7rY0yImhtX
	0zbxTEKRlrPwvLTiVaIen3G3T32yHKuwcLeO5mw==
X-Gm-Gg: ASbGncspIPIomQ1XKngzFXgCWkcRDHaVPIxP/6HT6LohD6Oxqylvrl2s1zn2F/nKagw
	3Y57lBfam8xBwb2UNQ488Xy+G36U5RyKKth3YcIJyrAzXZtwEbbpW0MCUdT026GZA/d8mJrNRB3
	Mo4AYUGE7Mo4DLB0sLLqvObjdUDz97m8q3ToCSSQ==
X-Google-Smtp-Source: AGHT+IFtup6lzCCDcgglb/vouYIF02tq5aB9fUksxAEAz4mtg2896UBjPrAGsh8END8a/G1BpCJH1h+ZLmjMPi7nqts=
X-Received: by 2002:a05:690c:4807:b0:6fd:41e1:83d8 with SMTP id
 00721157ae682-703d0790885mr56680357b3.6.1743695777536; Thu, 03 Apr 2025
 08:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250402120613.1116711-1-ulf.hansson@linaro.org> <20250403080815.jsdoydcczkeuvmy6@lcpd911>
In-Reply-To: <20250403080815.jsdoydcczkeuvmy6@lcpd911>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Apr 2025 17:55:41 +0200
X-Gm-Features: ATxdqUE_uiMj0ReQyXslvnN9euZTVAjRRAl_6-w9vMIxjplB4kuU0aE6cNyzWdE
Message-ID: <CAPDyKFrgYVMvaBf13ksdJ6Zr6bvLo1Jmz8yLiyg_43hs65STVQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Reset genpd->states to avoid freeing
 invalid data
To: Dhruva Gole <d-gole@ti.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_085619_219952_8E1C7860 
X-CRM114-Status: GOOD (  26.58  )
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

On Thu, 3 Apr 2025 at 10:08, Dhruva Gole <d-gole@ti.com> wrote:
>
> On Apr 02, 2025 at 14:06:13 +0200, Ulf Hansson wrote:
> > If genpd_alloc_data() allocates data for the default power-states for t=
he
> > genpd, let's make sure to also reset the pointer in the error path. Thi=
s
> > makes sure a genpd provider driver doesn't end up trying to free the da=
ta
> > again, but using an invalid pointer.
>
> I maybe missing something but if kfree works similar to [1]GNU free() won=
't
> it make the genpd->states NULL anyway? Have you actually seen scenarios
> where the genpd->states is remaining non-NULL even after kfree?

Yes. kfree() doesn't reset the pointer to the data.

>
> [1]
> https://www.gnu.org/software/libc/manual/html_node/Freeing-after-Malloc.h=
tml#:~:text=3DThe%20free%20function%20deallocates%20the%20block%20of%20memo=
ry%20pointed%20at%20by%20ptr%20.&text=3DOccasionally%2C%20free%20can%20actu=
ally%20return,malloc%20to%20reuse%20the%20space.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/pmdomain/core.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index 9b2f28b34bb5..c179464047fe 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -2229,8 +2229,10 @@ static int genpd_alloc_data(struct generic_pm_do=
main *genpd)
> >       return 0;
> >  put:
> >       put_device(&genpd->dev);
> > -     if (genpd->free_states =3D=3D genpd_free_default_power_state)
> > +     if (genpd->free_states =3D=3D genpd_free_default_power_state) {
> >               kfree(genpd->states);
> > +             genpd->states =3D NULL;
>
> Also the coding convention for kfree in other places in pmdomains
> doesn't seem to follow this practise either...

Right. I am not suggesting changing them all. Only this one, as it's a
special case and an error path.

genpd->states may be allocated by both the genpd provider driver and
internally by genpd via pm_genpd_init(), hence we need to be a bit
more careful.

>
> $> rg -A1 kfree drivers/pmdomain
>
> Is this something we're planning to start following in pmdomains from
> now on?

As I said, this is a special case.

>
> > +     }
> >  free:
> >       if (genpd_is_cpu_domain(genpd))
> >               free_cpumask_var(genpd->cpus);
> > --
> > 2.43.0
> >
> >

Kind regards
Uffe

