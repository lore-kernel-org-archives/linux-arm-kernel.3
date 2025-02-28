Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5001FC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7oY7BYAEv4W8+02LYZ2YxpBYCsfW/J7/vInnek1u5o=; b=C3kxnDLn3G1nk3FSQd+RlTyN5r
	vG1YIfjMwS8CxjufiHmIiUSvE1dSpdZrYesdUZJHegNWnOv6/RqHiRnNdy0hXGNhHHVxNtDVaaVME
	AKZeGTJ7B2OORglfo14D7F6JDQCILkYKCyWotxlhHgA2EF5BfsGZfteA4wNvy3tQnLvrdslFEjY/S
	PWzlS8D6u8PDp0OQ0jofAkvaF5kHoh1mhs97IkKrvVVhkjtGVgz1wL1U3kiO8+W1Gjgr4mLBmO+Yy
	r3yyd6GOPeuqa/+zlpimY7io7KSXXbXs4hao7qKpbUzzTjJosrW5mI8dE1Ny1GXRXdWtf4F02oU47
	RmO/tQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Sm-0000000BVHa-3hXW;
	Fri, 28 Feb 2025 15:39:44 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to297-0000000BRFM-08qO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:19:26 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abf48293ad0so21733266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 07:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740755963; x=1741360763; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P7oY7BYAEv4W8+02LYZ2YxpBYCsfW/J7/vInnek1u5o=;
        b=As1f0xUIrRO9OtkHAHTTPztO9xleR/VSiDDNpaL/IZ6qZj7GvxuFHC5tAGo/J8a1tl
         JNS6VXv3LW+R6GhcEV+3JVsLM712q+fRWNJ/F/n9942Ts0WZSIcDJ4M5YIQhigYjdbiz
         cpQ4cPgW27UUel8KzSBeOrXAK119HRmuH0hh2U1MrkucqIGEjb1Sz77SWw4X9U6abRoL
         2q3S7pMa2LRvAOv/tC+tNYR5F5OI1StFJsBqC8QxorH7EZWYKerCfwHhT4r400gj65Z2
         ijMPQmBEwXWdC3hrO/40j12ydCdbTMiWi6QnJ0UfGJ3hHgqsD/qdGvC7vxTjwGPy0Svd
         ETVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755963; x=1741360763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7oY7BYAEv4W8+02LYZ2YxpBYCsfW/J7/vInnek1u5o=;
        b=aHJOg57A+zK3vpdE/8M69G+bVblR2QJtKrehG/AO/FxDPF+gwKE9Ecw49MgmrdFB/R
         7I2EDFfFRO5J3H/TROmXPAwWQQ/i8P+Ja4gTvT/J4GKdACLunia/HF9j8B7NmpmESQ1x
         PyXPorR8XF5hC0kqBiPTTKUkVrbUdr62KWHWK0Ex66YtIS9bfeLkHJOQqNpY3mcSBQqr
         QL5HAWBVu7k0fKgtaepWqU0NPXpV7fyz2bHO0NVUkq/h6PaXgloRkdHYTn7wm5sgpvM7
         e3F7xs7nnqgngDqvbAyhbs3Zv7VM54yunehF+YkWj+ROyPGAf+S+cRjQKDrchYrhbzYB
         IG9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0K2Sa+15NkgTAFKbv1ZOaAVpo4oLKExFG5BiUulyE7DK64cH2Vllv9F7ZIwjQRKsMK9j9YPrwU4PsOWwluqPZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxoAd34AW33IWNJpol66NLUeBpRDMkc7CbRW0HPoqwrJlmtd5ns
	q5AU9h3YccYr0wIEgSGWftfh6mhoURLbyZ4yZqGbftc6Kmi8MDWnENN8KCIjnLcoouwceYpRooA
	ZD1yzafI1yCWi1p8ARXnE9v8VJJE=
X-Gm-Gg: ASbGncuu15zW1ZCkkNd0QJiI0haD7fwXaPEafWjtfYjf4uwJAunVtY2LsV+1+uHH5Jv
	Jls0K7XdkEZGHMlZkIV4O4K8AutakKFvv4lI679YjvPSPofwrHOnQI/J3S7gf3HAJdMPThj4qGB
	4/dZhVolA=
X-Google-Smtp-Source: AGHT+IFtBraPIaQpBiymetsznsOvIzlEwuqrLSWFnfSvCpGcicRJBeGr4DA/338qPZgAwfUuoxlTMZWNYQWkG+jYe1A=
X-Received: by 2002:a17:906:f592:b0:ab7:d06d:b4bf with SMTP id
 a640c23a62f3a-abf265a3614mr422762466b.39.1740755962545; Fri, 28 Feb 2025
 07:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20250216195850.5352-1-linux.amoon@gmail.com> <20250216195850.5352-2-linux.amoon@gmail.com>
 <e101aff2-a08e-4fed-8e38-df1aea44d23e@arm.com>
In-Reply-To: <e101aff2-a08e-4fed-8e38-df1aea44d23e@arm.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 28 Feb 2025 20:49:04 +0530
X-Gm-Features: AQ5f1Jq85EQ9ba5HWSGuaxxOFszs6piXmm_ai8qdDjz-7jgZDC6Fo3Zgq3faa6E
Message-ID: <CANAwSgRq+EjR70kVnh8AYZ6ZTSzV0uVwuF9E+_mpdG-6je-a8Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drivers/thermal/exynos: Refactor clk_sec
 initialization inside SOC-specific case
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_071925_071873_12FEE556 
X-CRM114-Status: GOOD (  33.17  )
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

Hi Lukasz,

Thanks for your review comments

On Fri, 28 Feb 2025 at 20:07, Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Hi Anand,
>
> On 2/16/25 19:58, Anand Moon wrote:
> > Refactor the initialization of the clk_sec clock to be inside the
> > SOC_ARCH_EXYNOS5420_TRIMINFO case. It ensures that the clk_sec clock
> > is only initialized for the specified SOC and not for other SOCs,
> > thereby simplifying the code.
>
> So IIUC there was no need to init that clock for other types of SoCs...
> Do we know that for sure (e.g. from other TRMs)?
This clock (clk) is utilized for the Thermal Management Unit (TMU) and
the GPU in the Exynos 542x,
as specified in the user manual.
>
> If that was the case, then simplification here can go further, but after
> some fixes.
>
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v3: improve the commit message
> > ---
> >   drivers/thermal/samsung/exynos_tmu.c | 26 +++++++++++++-------------
> >   1 file changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> > index 47a99b3c5395..9c138772d380 100644
> > --- a/drivers/thermal/samsung/exynos_tmu.c
> > +++ b/drivers/thermal/samsung/exynos_tmu.c
> > @@ -1040,19 +1040,6 @@ static int exynos_tmu_probe(struct platform_device *pdev)
> >       if (IS_ERR(data->clk))
> >               return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
> >
> > -     data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
> > -     if (IS_ERR(data->clk_sec)) {
> > -             if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
> > -                     return dev_err_probe(dev, PTR_ERR(data->clk_sec),
> > -                                          "Failed to get triminfo clock\n");
> > -     } else {
> > -             ret = clk_prepare(data->clk_sec);
> > -             if (ret) {
> > -                     dev_err(dev, "Failed to get clock\n");
> > -                     return ret;
> > -             }
> > -     }
> > -
> >       ret = clk_prepare(data->clk);
>
> Here the data->clk is now used in different order.
Ok.
>
> >       if (ret) {
> >               dev_err(dev, "Failed to get clock\n");
> > @@ -1060,6 +1047,19 @@ static int exynos_tmu_probe(struct platform_device *pdev)
> >       }
> >
> >       switch (data->soc) {
> > +     case SOC_ARCH_EXYNOS5420_TRIMINFO:
> > +             data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
> > +             if (IS_ERR(data->clk_sec)) {
> > +                     return dev_err_probe(dev, PTR_ERR(data->clk_sec),
> > +                                          "Failed to get triminfo clock\n");
>
> Then here you shouldn't simply copy the old code. Now the data->clk
> is first, so should be 'clk_unprepare()' before return of the function.
>
> > +             } else {
>
> You can get rid of this 'else' above and still be safe in your
> refactoring.
>
> > +                     ret = clk_prepare(data->clk_sec);
> > +                     if (ret) {
> > +                             dev_err(dev, "Failed to get clock\n");
> > +                             return ret;
> > +                     }
>
> Here you can further simplify this to something like:
> -----------------------8<-------------------------------------
>
> +       case SOC_ARCH_EXYNOS5420_TRIMINFO:
> +               data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
> +               if (IS_ERR(data->clk_sec)) {
> +                       clk_unprepare(data->clk); ///// <----
> +                       return dev_err_probe(dev, PTR_ERR(data->clk_sec),
> +                                            "Failed to get triminfo clock\n");
> +               }
> +               ret = clk_prepare(data->clk_sec);
> +               if (ret) {
> +                       dev_err(dev, "Failed to get clock\n");
> +                       clk_unprepare(data->clk); ///// <----
> +                       return ret;
> +               }
> +
> +       break;
Ok
>
> --------------------------->8---------------------------------
>
> Or with better 'goto' flow.
>
> > +             }
> > +     break;
> >       case SOC_ARCH_EXYNOS5433:
> >       case SOC_ARCH_EXYNOS7:
> >               data->sclk = devm_clk_get(dev, "tmu_sclk");
>
>
> Also, you should revisit the 'goto' cleanup section at the bottom.
Thanks. I will recheck and update the code for the next version.
>
> Regards,
> Lukasz

Thanks
-Anand

