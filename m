Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE79C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VW/r+Xskypu97YYD6KF6jc5zwux2QZnn2gKuuTUWqVE=; b=vBEYlT3sl7VkcvDYFnPAgCHlIw
	kXQhTEIms027lnDiRf4ClLDCFgbS54vLqlJgk20a6CcD8/TRWoflcD0x1NQXe8f6fedsbiEZXxAh7
	n7xqpxJiAD49rl7y7L9IpYHUkMxz/WZeDv4qcVP4hpJPm+UWSvUluNMqSxtLRNpgEmOg5Lxk2Ri+U
	gYq5aXkjSNQWAXuja6uMj6OmNPKQFdL7ir/F20mGCJ3XtTPyB6Kdxy+c4tl7p0/cmZ4yz7AbPM8HF
	9wBt8W83lsgw92vQy9qUOymOUky+6oi36FXm/+WMyJ4KGBmvdDON5nhHeuYtATXZV1hrryKUttFhF
	N+SGtgJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lqo-0000000GFZA-3LQZ;
	Fri, 18 Apr 2025 13:33:50 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5loq-0000000GFAy-3db2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:31:50 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so73309a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983107; x=1745587907; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW/r+Xskypu97YYD6KF6jc5zwux2QZnn2gKuuTUWqVE=;
        b=JsCPcV+P2DCypotZ6ebxcGoJHQAgcSEwoarH7v38nsFzgLTWldpIguK2uZ1AZ/F4qs
         E/5dmw0bWk3hw9Cx0h1fb9pWwDs5BiquY0+0aws2RmZJej/lBnouKhlzl7mQhuQH2Ic+
         OqXvk0gtuH1PDdFh9M5VLHs0bwzeMlzYgzA1NuF09vuALJMKbL29efFdtg3jrs+A8zEq
         jaDL3cACllHsneHK9J/qpuzD+Af9zyz2BnTanQMVWo7SizqA/iSO9B2k0Nyx8BufMycP
         ubz11FJqrR/C1lTwEfeSorQgF3Gy1fGsi+9sE7V+lXQUD+TV7M6QtProChhSBN8gutmA
         Zoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983107; x=1745587907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VW/r+Xskypu97YYD6KF6jc5zwux2QZnn2gKuuTUWqVE=;
        b=R8LyU+Oyk3rpyFdYZUfgVyuS7qkJIlluieJ/+UBjLwuoCbYl0sXzan2gv85B+EPcxs
         KUxDK+bjqKWA/HrxIhoxTdzlaqohpgXU2vc5w7GgsqfVPmlxa6H+JgS06yWo1PtJ+ll7
         uQ6ob0QW3R0FiFQTnhdYqUgJPzaT1LjqWeASPEEg5UMGo0olIvsyw8MwXS9BXQwNm3Gr
         /pQ2kEgH1YervUG4KdoKx960TC7+sd5sa49fbMg7v0EyE9HyKT+gd8T7Jfv1M7YMB/6M
         vlPxJn4iFI4g+DGTliNL6pp7Lm/yzjbTzxiFKfGUoM8aqJB9qS21DKBxP5Vs47N5oDeI
         WUgw==
X-Forwarded-Encrypted: i=1; AJvYcCVEmeSyOxpw8oJqanIR8DcREfkFHQfzCv8/Jp1hptFk/zdDhpA8gP/kqVpgfJ8ORU5ReYtGlXRIC6EQGxU5Xyzr@lists.infradead.org
X-Gm-Message-State: AOJu0Yww0lbJM4I4jEtc3Ffbey2arFxTXKglbuWamTii+I4s0mdDIfD1
	APnO4Zxu4ZSBH0jWVh3sYekxuNPybNEZOrmehdM60IpdJ+KlZl8cxE7lHBwvNfZEIGAMgU6l9St
	2lmXdA89LGAAL54kbbI/WieMugis=
X-Gm-Gg: ASbGnctRW54SwDn+8wuNy4iy7bJEuu7Av6jJZE2IE949pI4ouuAy5x9JwyBSSPhatTj
	g7AC2j7EaK9h/cm6KRwYEVlX/9Az4ng+jBdwaN/1DHIaEo4hCIXW09krD3Mti4WOg/Q/KIRjp9l
	8AyOOH4Cc9kc5ktKFGsl3D
X-Google-Smtp-Source: AGHT+IE+R7I4dVbYwOWf8/dydNM3ras0vM8Hcd1dtJhxh5iLeMMP4/GOg7s0W+7aCQ1EW35HU9YjtmFodyE+MqjWPmY=
X-Received: by 2002:a17:906:e208:b0:acb:85f2:f032 with SMTP id
 a640c23a62f3a-acb85f31115mr5753166b.13.1744983106327; Fri, 18 Apr 2025
 06:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250410063754.5483-1-linux.amoon@gmail.com> <20250410063754.5483-2-linux.amoon@gmail.com>
 <aAIIH7H1oQH8cf-6@mai.linaro.org>
In-Reply-To: <aAIIH7H1oQH8cf-6@mai.linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Apr 2025 19:01:29 +0530
X-Gm-Features: ATxdqUEh1pZaqB8ipWBIif6O9726dyogwx9y_IR39XM-ncpaQF8skGDo78Oz4mw
Message-ID: <CANAwSgS_OnEv=r7S4CetLkW4vo-QdFAKTbqRK9H-Q0dq5VDYLA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] drivers/thermal/exynos: Refactor clk_sec
 initialization inside SOC-specific case
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
X-CRM114-CacheID: sfid-20250418_063148_909529_E301D480 
X-CRM114-Status: GOOD (  31.97  )
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

On Fri, 18 Apr 2025 at 13:36, Daniel Lezcano <daniel.lezcano@linaro.org> wr=
ote:
>
> On Thu, Apr 10, 2025 at 12:07:48PM +0530, Anand Moon wrote:
> > Refactor the initialization of the clk_sec clock to be inside the
> > SOC_ARCH_EXYNOS5420_TRIMINFO case. It ensures that the clk_sec clock
> > is only initialized for the specified SOC and not for other SOCs,
> > thereby simplifying the code. The clk_sec clock is used by the TMU
> > for GPU on the Exynos 542x platform.
> >
> > Removed redundant IS_ERR() checks for the clk_sec clock since error
> > handling is already managed internally by clk_unprepare() functions.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v5: None
> > v4: Fix the aligment of code clk for clk_prepare in proper if/else bloc=
k.
> >     update the commit for clk_sec used.
> >     checked to goto clean up all the clks are proper.
> >     drop IS_ERR() check for clk_sec.
> > v3: improve the commit message.
> > ---
> >  drivers/thermal/samsung/exynos_tmu.c | 37 ++++++++++++++--------------
> >  1 file changed, 18 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/sam=
sung/exynos_tmu.c
> > index 47a99b3c5395..3657920de000 100644
> > --- a/drivers/thermal/samsung/exynos_tmu.c
> > +++ b/drivers/thermal/samsung/exynos_tmu.c
> > @@ -1037,29 +1037,30 @@ static int exynos_tmu_probe(struct platform_dev=
ice *pdev)
> >               return ret;
> >
> >       data->clk =3D devm_clk_get(dev, "tmu_apbif");
> > -     if (IS_ERR(data->clk))
> > +     if (IS_ERR(data->clk)) {
> >               return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to =
get clock\n");
>
> As this branch returns, the else block can be removed.
>
>         if (IS_ERR(data->clk))
>                 return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to =
get clock\n");
>
>         ret =3D clk_prepare(data->clk);
>         if (ret) {
>                 ...
>         }
>
Earlier I got this review comment on this.
[0] https://patchwork.kernel.org/project/linux-samsung-soc/patch/2025021619=
5850.5352-2-linux.amoon@gmail.com/
I will try to fix this in next vrsion.

> May be worth to group both calls with devm_clk_get_enabled()

Earlier, I attempted to change the clock ABI, but it didn't work.

[1] https://lore.kernel.org/all/20220515064126.1424-2-linux.amoon@gmail.com=
/
If you're okay with changing this, I'll update it in the next version.

> > -
> > -     data->clk_sec =3D devm_clk_get(dev, "tmu_triminfo_apbif");
> > -     if (IS_ERR(data->clk_sec)) {
> > -             if (data->soc =3D=3D SOC_ARCH_EXYNOS5420_TRIMINFO)
> > -                     return dev_err_probe(dev, PTR_ERR(data->clk_sec),
> > -                                          "Failed to get triminfo cloc=
k\n");
> >       } else {
> > -             ret =3D clk_prepare(data->clk_sec);
> > +             ret =3D clk_prepare(data->clk);
> >               if (ret) {
> >                       dev_err(dev, "Failed to get clock\n");
> >                       return ret;
> >               }
> >       }
> >
> > -     ret =3D clk_prepare(data->clk);
> > -     if (ret) {
> > -             dev_err(dev, "Failed to get clock\n");
> > -             goto err_clk_sec;
> > -     }
> > -
> >       switch (data->soc) {
> > +     case SOC_ARCH_EXYNOS5420_TRIMINFO:
> > +             data->clk_sec =3D devm_clk_get(dev, "tmu_triminfo_apbif")=
;
> > +             if (IS_ERR(data->clk_sec)) {
> > +                     ret =3D dev_err_probe(dev, PTR_ERR(data->clk_sec)=
,
> > +                                         "Failed to get clk_sec clock\=
n");
> > +                     goto err_clk;
> > +             }
> > +             ret =3D clk_prepare(data->clk_sec);
>
> Same comment, devm_clk_get_enabled()
If you're okay with changing this, I'll update it in the next version.
>
> > +             if (ret) {
> > +                     dev_err(dev, "Failed to prepare clk_sec clock\n")=
;
> > +                     goto err_clk_sec;
> > +             }
> > +             break;
> >       case SOC_ARCH_EXYNOS5433:
> >       case SOC_ARCH_EXYNOS7:
> >               data->sclk =3D devm_clk_get(dev, "tmu_sclk");
> > @@ -1112,11 +1113,10 @@ static int exynos_tmu_probe(struct platform_dev=
ice *pdev)
> >
> >  err_sclk:
> >       clk_disable_unprepare(data->sclk);
> > +err_clk_sec:
> > +     clk_unprepare(data->clk_sec);
> >  err_clk:
> >       clk_unprepare(data->clk);
> > -err_clk_sec:
> > -     if (!IS_ERR(data->clk_sec))
> > -             clk_unprepare(data->clk_sec);
>
> With devm_ variant those labels should go away
Correct.

Thanks
-Anand
>
> >       return ret;
> >  }
> >
> > @@ -1128,8 +1128,7 @@ static void exynos_tmu_remove(struct platform_dev=
ice *pdev)
> >
> >       clk_disable_unprepare(data->sclk);
> >       clk_unprepare(data->clk);
> > -     if (!IS_ERR(data->clk_sec))
> > -             clk_unprepare(data->clk_sec);
> > +     clk_unprepare(data->clk_sec);
> >  }
> >
> >  #ifdef CONFIG_PM_SLEEP
> > --
> > 2.49.0
> >
>
> --
>
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

