Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DBFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPxPc5gSPfbsdKnAKMvHjWJ+7kwSju+xPbLU6ci9bXI=; b=jITy9hC5EaILTeuP6+WL8eXmGk
	qu7XVD3W5v5pQrln5BkEazuKpnEPUHUsNpoNmqvaSVRTeVpDBkFkxsSNda/Mx/JY5q/X+avt6u/AJ
	dXfdb2xyvvtnuQVm7UbXhnbOYU9JdIxn9Ly6191qjkLXanWBjtsOjGuwiaI73xhoYUnrzQykmkeuK
	WO/XVstXIrPdB4AQTlDUxfP3HEcCvBGcq1ckF5AZuei5XJVwmrrl0+d1WrX2LbyrxjybdcpnJliVK
	DAJC01Ba0gC0rczv6jXnJT4BPxLdb0+2Miw27KEBeiXwGYwZ+pcf8ymPWhE1tNKSYlN8mWfFKSmPI
	Os3i+fmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umap8-000000004MR-1YQD;
	Thu, 14 Aug 2025 16:29:06 +0000
Received: from mail-vs1-f54.google.com ([209.85.217.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umaDh-0000000HXL4-0LZd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 15:50:26 +0000
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-50f8b14cdb8so898910137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 08:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186624; x=1755791424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPxPc5gSPfbsdKnAKMvHjWJ+7kwSju+xPbLU6ci9bXI=;
        b=w7ZjMaUg7D7CfgPd00LTY1Y8pslGPlv2yvvHPBjamuuIz8Y3E9H6wLjMRIAQv2+sEf
         Ndkq6zaC6ymsgtQnijfnz6MZga1IcDQv4FaCJj2WO4jZYrYyeCNYlMxiUTqO9ecBD7g1
         gfTXzcXv3Uybc/S3NPfU/Cra68J1AQ3cyrL9XOmaD6iMGlyzAAY5ifDk4+0HEIkLqk0Y
         hR17Jv2MMrndVxAA9icZKil+MpeOovCOKw90PDPI3fNNQXIZfnFtKKi0/OcmQ9jJJA8p
         YI9SvL19m/yL00lYgKOeOfRqDwXYZsUX2T1cKuSURbsXGZlvw01MIYa9QJZ1wnlz9A9Z
         YSzw==
X-Forwarded-Encrypted: i=1; AJvYcCUijJFeYeyPpXlMi/XraKYk+vsALMRSZx67LY533ua8MYPP+idjYmVgifEMZmkYE1fKA5hjUKhRaPekuKzZ2yiw@lists.infradead.org
X-Gm-Message-State: AOJu0YwgfsK5Xg/JY2GbZgXUh4r+Eqf0tU0Z8ycyAGdC2nAU0Y9eNTjB
	cNW4lgsAImtPmNOPQtfLkmd1hg6tIgObaBkEweVf68ZYDL6v8U3TrEAn8pw0rmYT
X-Gm-Gg: ASbGnct1dfZ6uKgVy0CBdpnzxE3Xcswy3czPviJqKkAQzOmWylj5g8B2o9lg6WVvhG9
	RHnu1vRD9+UP+fZggqfKMTEONDwC27JXi7CLr7EwyRmpJBHUXm9495kJP+9DWASrYco4H/nCpND
	QcEgLuUi3gQUkdsHyanWOWhzuVfh8whDEHXFi75FlBQYWbwSYHC1+8eZL7vdnXGklDiKkTd0PUC
	gfFkRmhO7LJNpeire85QG7J5RyNqm8rbsOT+PQS5BMIKd2UMdtaSYyqBxsGgXQX0O8u/GHpec2h
	fTBxGKRVPVZ80j55XkVasvNrZL+hMhIknl95oWWqCftmfSnNd7uNySac3ip8Eljel5te7WWdzkD
	JimIm0sWXe36Z4A8J7BeX/joQQfNUOQDEMJyjnmQj7N0xxT1DnQ+D9tibQMit
X-Google-Smtp-Source: AGHT+IEzAStXcCbJvcxQ2UQu4cTrGP1Ol+yijw7/2bp5+ae61Ai8JqAd81L6LDxEl8ViNV9ORmRrig==
X-Received: by 2002:a05:6102:26c2:b0:4e9:968b:4409 with SMTP id ada2fe7eead31-50fe0828eecmr1670372137.17.1755186623614;
        Thu, 14 Aug 2025 08:50:23 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e0268c86dsm3072246241.1.2025.08.14.08.50.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:50:23 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-50f890e9054so670816137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 08:50:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3FSlc9qnU+DwqOdvJE2XEXvk+UljNxFsfbxud3xgsy2cGBWvtK6nQS8BbwvtoDDhmgQGKf6c3FqwwkVpGaFXt@lists.infradead.org
X-Received: by 2002:a05:6102:e09:b0:4fc:b033:cdc5 with SMTP id
 ada2fe7eead31-50fe9974df5mr1403773137.22.1755186623090; Thu, 14 Aug 2025
 08:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250625100330.7629-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdV3=c24KxO_Sbt50FGsFnNVYNnHAUhk-yoa+nM1f+7+kA@mail.gmail.com> <e1d465f7-43d7-471b-b8a7-7d24428bac4c@mailbox.org>
In-Reply-To: <e1d465f7-43d7-471b-b8a7-7d24428bac4c@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:50:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6naFbq-5LyuC4n+JRPTXGSSohKDTf95=MS_SMyHqfng@mail.gmail.com>
X-Gm-Features: Ac12FXzUlAeFho5ry-hkAttyLSDTpbx1Nmmf3I2qDfLxTUJAEpDknPJ7TslWclQ
Message-ID: <CAMuHMdX6naFbq-5LyuC4n+JRPTXGSSohKDTf95=MS_SMyHqfng@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Update thermal trip points
 on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_085025_137046_C9C10BBF 
X-CRM114-Status: GOOD (  28.70  )
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

Hi Marek,

On Wed, 6 Aug 2025 at 17:23, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 8/6/25 11:35 AM, Geert Uytterhoeven wrote:
> >> +/* THS sensor in SoC near CA76 cores does more progressive cooling. */
> >> +&sensor_thermal_ca76 {
> >> +       critical-action = "shutdown";
> >> +
> >> +       cooling-maps {
> >> +               /*
> >> +                * The cooling-device minimum and maximum parameters inversely
> >> +                * match opp-table-0 {} node entries in r8a779g0.dtsi, in other
> >> +                * words, 0 refers to 1.8 GHz OPP and 4 refers to 500 MHz OPP.
> >> +                * This is because they refer to cooling levels, where maximum
> >> +                * cooling level happens at 500 MHz OPP, when the CPU core is
> >> +                * running slowly and therefore generates least heat.
> >
> > That applies to cooling-device = <&a76_[0-3] ...>...
>
> Do you want me to add this line into the comment ?

I don't think that is really needed (see below)

> >> +                */
> >> +               map0 {
> >> +                       /* At 68C, inhibit 1.7 GHz and 1.8 GHz modes */
> >> +                       trip = <&sensor3_passive_low>;
> >> +                       cooling-device = <&a76_0 2 4>;
> >> +                       contribution = <128>;
> >> +               };
> >> +
> >> +               map1 {
> >> +                       /* At 72C, inhibit 1.5 GHz mode */
> >> +                       trip = <&sensor3_passive_mid>;
> >> +                       cooling-device = <&a76_0 3 4>;
> >> +                       contribution = <256>;
> >> +               };
> >> +
> >> +               map2 {
> >> +                       /* At 76C, start injecting idle states */
> >> +                       trip = <&sensor3_passive_hi>;
> >> +                       cooling-device = <&a76_0_thermal_idle 0 80>,
> >> +                                        <&a76_1_thermal_idle 0 80>,
> >> +                                        <&a76_2_thermal_idle 0 80>,
> >> +                                        <&a76_3_thermal_idle 0 80>;
> >
> > ... but what do "0 80" refer to? I couldn't find in the thermal-idle
> > bindings what exactly are the minimum and maximum cooling states here.
>
> The comments in drivers/thermal/cpuidle_cooling.c clarify that, it is
> the idle injection rate in percent, in this case the cooling can inject
> idle states up to 80% of time.

OK, so I will add "(0-80%)" to the idle states comment, and sort
the nodes while queuing in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

