Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E5CC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXZIWWM8mZYdiQktFqPI0+JPo4B/dX6RUUwchm1Zb5I=; b=uapEhswss+Y7otQRHOh7GD8lZ/
	8b/c4GhGItciiss+qMrcEbLMZgEe7Au5SKHUr9gnA+8xy+NXTkAA3ouMkK/H2VaPLta2n3uFTGVq6
	qq9DPEXsspduIaGcH3+ZQnJv/zb/9EEd3UMpxdbDMj07+J+2kJpTfaaO70Hp9ku8ScetsxkhT67sW
	S2PMAo3Fe67VJ3naEtY4NB4mgzTQ/dXlKu36Hyv4DkqRl6Zl1w5MNEGdqrbBiVmZbhOhrTT/rsS3f
	1ZpPsLVCot5XqIZQIpEE/TbJknU2f4w2HJYfl/vF3aYFCwCn+wYpc33GwhF+tF3jHE0o0z4TxK70Y
	GuTvBd0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lud-0000000GGOb-1fPj;
	Fri, 18 Apr 2025 13:37:47 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lpd-0000000GFN1-3aou
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:32:39 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso2831743a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983156; x=1745587956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXZIWWM8mZYdiQktFqPI0+JPo4B/dX6RUUwchm1Zb5I=;
        b=SC+eii9Yuy8/EHHTm5S62oFK8dM37AvWQLWdWc/OMJxKrzXyF01wGjA6jFFX7XmlV7
         E/Q7zMSj/lVggiyuEEXwPnZ4VBqU4JH7KiaNaDdJDbaAqO/3ZujvEX0rUkrVZDJTX3ys
         OCnHkG5t5kGASjiVEXdL4s9JXxI2DobDfB0K2sJepmwkhvaCIlExmgIu/DAnnHCmi6cw
         ajwc84TaJF7t7v5DGUxULNvNpCc227eUr0/fO3fNSQaMqsq9/7nh+n/tiGCl6E97ahdW
         BVKZHWnoN5JcHu9bQyHtejjgcMQUaghJCt9lcqYzoMVXiaPepGbCciDK1q7fM28SS7yl
         aUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983156; x=1745587956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXZIWWM8mZYdiQktFqPI0+JPo4B/dX6RUUwchm1Zb5I=;
        b=witS2hP9rUvJUVgQKm5AbAwostJzUGkZqpqrsbzh2H9ktrB1KUnynxb1ioF6vw550P
         LIbK/z5yPyYKAE7fdd/hIhyUKBGXpSJCtH/sjrT3ueEbeUf+fHczA14ZY2hf12VN72K2
         XdPKkS+M0m/HH2JOqobz/0QrSqKCVD3jfU36HIrkql2JsAJcPm/+EZnFUXuIhyQ0rdVt
         BIRtUEXVx5bqBnllmZyK8qZTJdz8DuCUw2xDnGY/NqB2XT0lRJokZxi8jMz7le8Qa5hD
         8p1OG222D57UUa5Xi6kreXrKhikr4E1Es+mNHI6db3KDlephyP2Gq3zVQgTw8VnzZ6xG
         qcHg==
X-Forwarded-Encrypted: i=1; AJvYcCWXd1PQHTAPpBX4KW/Ox4Y/Q7iVxSzGDB5uUYeC3m8C1FchqhPdk9TI38RO8klUFY19fqXT/E0z8MWYGWNRbe3C@lists.infradead.org
X-Gm-Message-State: AOJu0YypSsPvV9wI48jJ7LR+V+0zqtbJynPK3fPGmQivLfquMiKKFpYW
	zv/CCefzwkBrTaKrpa75emDalagfLWzvlVjK9tF12M38afRt4U+iUlvlnYBLGTkyczqR4lYev22
	GwVcM287PfPFwLhADtyE4VyRPy1s=
X-Gm-Gg: ASbGnct6sg2yXkEA64DAww30BWOg0lTHxOscoUYUXmyAYTURKQzHanGDiXlFsGLEfNw
	pyyNVx0YR6t7c8YnQvP8h1iRKe8hFKdA0Eupd7rnV0rlFOPCm3cVFQbdYP5PiqVOsxUoELXkQ/S
	ufbE1c1g+xjqZDiLNOKPFS
X-Google-Smtp-Source: AGHT+IEf1FP4PE+QPrL3TzSuKDCTAio1byV8qwIANyIcWwl3yMCy7oqqmZBQNjRLb7+OZ1bOcdJO2NJMrjzSMyIelCY=
X-Received: by 2002:a17:907:6090:b0:abf:4b6e:e107 with SMTP id
 a640c23a62f3a-acb74b52090mr242322666b.25.1744983155938; Fri, 18 Apr 2025
 06:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250410063754.5483-1-linux.amoon@gmail.com> <20250410063754.5483-4-linux.amoon@gmail.com>
 <aAILE01SjRR874jc@mai.linaro.org>
In-Reply-To: <aAILE01SjRR874jc@mai.linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Apr 2025 19:02:18 +0530
X-Gm-Features: ATxdqUHbJXVdHhwcS0IwraNdsY4dmTwIZsNctwmfdNkH6lfYcXleJugDkxPs4Aw
Message-ID: <CANAwSgRK5ONpBM35U7DG=wtHv9N-9kRpbveqyGsVORnJiS5mmg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drivers/thermal/exymos: Fixed the efuse min max
 value for exynos5422
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_063237_896956_0DEC2525 
X-CRM114-Status: GOOD (  24.28  )
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

Hi Daniel,

On Fri, 18 Apr 2025 at 13:49, Daniel Lezcano <daniel.lezcano@linaro.org> wr=
ote:
>
> On Thu, Apr 10, 2025 at 12:07:50PM +0530, Anand Moon wrote:
> > As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
> > if e-Fuse value is out of this range, then thermal sensor may not
> > sense thermal data properly. Refactors the efuse value
> > initialization logic within exynos_map_dt_data function by
> > replacing the nested if-else statements with a switch statement.
> > Ensures proper initialization of efuse values based on the SOC type.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>
> Same subject typo: s/exymos/exynos/

Thanks for your review comments.
Opps, I will fix this next version it got skipped.

>
> > ---
> > v5: None
> > v4: None
> > v3: Improve the logic to convert if/else to switch
> > ---
> >  drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/sam=
sung/exynos_tmu.c
> > index ac3b9d2c900c..a71cde0a4b17 100644
> > --- a/drivers/thermal/samsung/exynos_tmu.c
> > +++ b/drivers/thermal/samsung/exynos_tmu.c
> > @@ -899,12 +899,23 @@ static int exynos_map_dt_data(struct platform_dev=
ice *pdev)
> >               data->gain =3D 8;
> >               data->reference_voltage =3D 16;
> >               data->efuse_value =3D 55;
> > -             if (data->soc !=3D SOC_ARCH_EXYNOS5420 &&
> > -                 data->soc !=3D SOC_ARCH_EXYNOS5420_TRIMINFO)
> > +             data->max_efuse_value =3D 100;
> > +             switch (data->soc) {
> > +             case SOC_ARCH_EXYNOS3250:
> > +             case SOC_ARCH_EXYNOS4412:
> > +             case SOC_ARCH_EXYNOS5250:
> > +             case SOC_ARCH_EXYNOS5260:
> >                       data->min_efuse_value =3D 40;
> > -             else
> > +                     break;
> > +             case SOC_ARCH_EXYNOS5420:
> > +             case SOC_ARCH_EXYNOS5420_TRIMINFO:
> > +                     data->min_efuse_value =3D 16;
> > +                     data->max_efuse_value =3D 76;
> > +                     break;
> > +             default:
> >                       data->min_efuse_value =3D 0;
> > -             data->max_efuse_value =3D 100;
> > +                     break;
> > +             }
> >               break;
> >       case SOC_ARCH_EXYNOS5433:
> >               data->tmu_set_low_temp =3D exynos5433_tmu_set_low_temp;
>
> Thanks for taking care of cleaning up this portion of code. IMO, it would=
 be
> interesting to go a bit further in the house keeping by replacing this bi=
g
> switch with a set of structures stored as __init sections. The initializa=
tion
> finds the right structure and does a structure copy to 'data'.
>
> It is up to you to do this change or not.

I'll be sure to check this out.

Thanks
-Anand
>
> --
>
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

