Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2789C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 19:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTdyAEdwmG2Xhseb5nN+DvsL/03ZonxPNgdIwAd3G1I=; b=k9nOUfVcYHXSpXedwciEUAagGv
	SPQwmbGggUetDxJ+tWlDAaObi6ZfYA4o5U+RdXfy29WTMtZAuygYd745U0YpdH2DkN/iYaIXO7/EJ
	u4fo1zdttq7DKJjHHiUdeG7j5r8CNBljUm6r1gW+KtfBryKmcMQlDgbE2pF4lKJF3e7t7L/3XE4vc
	vNXyClRiaa7ZLWrJ1Jhcp+BQad1aLUUC64FzTQ/LiiTYkvmBXSyb//BVds64CuDoy2g/xlQjSZkj7
	/Erh/rPuxPwvsNVBWATWfSV2nEQmFNsLOJngc2Etk/AoLWk3GBiZ2mviaSG+blAl8BUTup1gW4Rdv
	n4xcwAFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjNPp-00000000biz-2Eei;
	Sat, 15 Feb 2025 19:01:25 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjNOM-00000000bYG-3P2Y;
	Sat, 15 Feb 2025 18:59:56 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-471d1af90a0so15916131cf.0;
        Sat, 15 Feb 2025 10:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739645992; x=1740250792; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTdyAEdwmG2Xhseb5nN+DvsL/03ZonxPNgdIwAd3G1I=;
        b=l4LKK5tO+enptTNUNniekP+eUVeFC2Y0YDi/gfj0fltqSZJ7DbrLBITyy+qh1sRXz5
         dJfpC8UZpqnkEGhDGJlht+uMJ9JwRrZo8gAI1gWCAIXczkgP/QHTBq+vEUE3MIcEDTbE
         1Bu+P41de72E41IeHLDndU0V2I3LbeVZeH0nddM1ITUX4RartE+LAEln3mBmCgZe5otY
         KBF643o/nbSWpxGSglIgS6o3okAW6jgdQfBmZTpWoXEYC/3WJpmHhaPUvc/OUqYb8kQ+
         VnpC2qbqC+5sJNcsD8jwjn9Qr+UjEUUe9Pi6pB6Bqc3lM53Eo2ImV9XUp9tkjJ20MnM2
         n0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739645992; x=1740250792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTdyAEdwmG2Xhseb5nN+DvsL/03ZonxPNgdIwAd3G1I=;
        b=JsfN85kz9R8IjXaqUhmjJXV09uzlxkv2R91Yaback7UnfP1ZlDf5WjFfpuD1aNgh/4
         7Yn4dzrLk+MVzDB8zKEKTNvpFBp1Y7tYJ4NRz48g1OPdqJrWTrqM7B7AwXSZzDwPaITS
         UIpAl+v2f7lq2M1/3oligx+Th9BiTb5CZ4neDSjCW5VamLk5aD3GuuRxj2unFB+PALsd
         tVxn2Rye+PbmIRZwMONoYpQDA7lCUh/97d3aitwBc49vSrRNhlXtXEIfhTklhU5Xj6MM
         qF6YvX1wQxhQlONMV7Nih2oyeNVxk0fjezESWl/YR2UvcsRird6MtvMACLhnBgMGH0t0
         iMGA==
X-Forwarded-Encrypted: i=1; AJvYcCVMR3Oh9bZ5Al1HPlZVReR3DKOIditTPhDL3fVgzkilqMCaYw4B0MuDeynZYmnWot51fWA1LfOKuesaVVvQSV54@lists.infradead.org, AJvYcCXQpIyjph9XTTNAXXvHCu5uRVTDqTbRulw8jimp8f3hs+fxkqnbV4nYQW9Q7VGDezuMoZWaHdf+r9+uQoJFaL8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqIq1cj63UBy3m4he+I4UJlL8i2I77PcapFyxrfZJnam+c+Pke
	NkXkwUVo2WTBgDZ3jVwA1YRWXm1FjgmnvBZa/UgoyaRa7n6TFwdDJxeYGIfITwCT81J0I5H4W7J
	bgmgTk9A+o17XdBo4efJcJI39/Io=
X-Gm-Gg: ASbGnct2KH4GvbkA2rTjEMkVOdHAPw+e8FDzEhfhv/MQtXgN84VkVZ+QGkT7jrfDWIz
	ZzktR4KAoJZhFGU6v5VEzUMvdiv6e8ArJgeq3h1zdLGr4dfrpfypxWbyGM8pXOWUSKlCr1pdlK0
	c=
X-Google-Smtp-Source: AGHT+IEsmXhJVdCVr8Bg6tahWwwvjf0aL4gfGKBNLDAW1xv9dvvbafCFVU91Pi/cY5fJ/ARik12lizAot8rgosoNp9g=
X-Received: by 2002:ac8:5988:0:b0:471:ae33:b35a with SMTP id
 d75a77b69052e-471dbea0cd0mr53875731cf.41.1739645991985; Sat, 15 Feb 2025
 10:59:51 -0800 (PST)
MIME-Version: 1.0
References: <20240617-rk-dts-additions-v5-0-c1f5f3267f1e@gmail.com>
 <20240617-rk-dts-additions-v5-7-c1f5f3267f1e@gmail.com> <d8ce8db2-1717-40f8-b53e-24cc71a758c9@cherry.de>
In-Reply-To: <d8ce8db2-1717-40f8-b53e-24cc71a758c9@cherry.de>
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 15 Feb 2025 21:59:44 +0300
X-Gm-Features: AWEUYZnvNTR7HkacV2LThVjtWGe7OZYAvU7_F4y9BXZkoo6KpcSWYw8wQ8OOOjY
Message-ID: <CABjd4Yw-r-ogfwcrph4K1wbkybS25gk6LFg8wpqLG27uWdybNA@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: rockchip: Add OPP data for CPU cores
 on RK3588j
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Dragan Simic <dsimic@manjaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_105954_862924_2D36DE7D 
X-CRM114-Status: GOOD (  31.87  )
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

Hi Quentin,

On Tue, Feb 11, 2025 at 7:32=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi all,
>
> On 6/17/24 8:28 PM, Alexey Charkov wrote:
> > RK3588j is the 'industrial' variant of RK3588, and it uses a different
> > set of OPPs both in terms of allowed frequencies and in terms of
> > applicable voltages at each frequency setpoint.
> >
> > Add the OPPs that apply to RK3588j (and apparently RK3588m too) to
> > enable dynamic CPU frequency scaling.
> >
> > OPP values are derived from Rockchip downstream sources [1] by taking
> > only those OPPs which have the highest frequency for a given voltage
> > level and dropping the rest (if they are included, the kernel complains
> > at boot time about them being inefficient)
> >
> > [1] https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734=
f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
> >
>
> Funny stuff actually. Rockchip have their own downstream cpufreq driver
> which autodetects at runtime the SoC variant and filter out OPPs based
> on that info. And this patch is based on those values and filters.
>
> However, they also decided that maybe this isn't the best way to do it
> and they decided to have an rk3588j.dtsi where they remove some of those
> OPPs instead of just updating the mask/filter in their base dtsi
> (rk3588s.dtsi downstream). See
> https://github.com/rockchip-linux/kernel/blob/604cec4004abe5a96c734f2fab7=
b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588j.dtsi

Funny stuff indeed! Judging by the comments in the file you
referenced, those higher OPP values constitute an 'overdrive' mode,
and apparently the chip shouldn't stay in those for prolonged periods
of time. However, I couldn't locate any dts file inside Rockchip
sources that would include this rk3588j.dtsi - so not sure if we
should follow what it says too zealously.

> So...
>
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >   arch/arm64/boot/dts/rockchip/rk3588j.dtsi | 108 +++++++++++++++++++++=
+++++++++
> >   1 file changed, 108 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi b/arch/arm64/boo=
t/dts/rockchip/rk3588j.dtsi
> > index 0bbeee399a63..b7e69553857b 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
> > @@ -5,3 +5,111 @@
> >    */
> >
> >   #include "rk3588-extra.dtsi"
> > +
> > +/ {
> > +     cluster0_opp_table: opp-table-cluster0 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-1416000000 {
> > +                     opp-hz =3D /bits/ 64 <1416000000>;
> > +                     opp-microvolt =3D <750000 750000 950000>;
> > +                     clock-latency-ns =3D <40000>;
> > +                     opp-suspend;
> > +             };
> > +             opp-1608000000 {
> > +                     opp-hz =3D /bits/ 64 <1608000000>;
> > +                     opp-microvolt =3D <887500 887500 950000>;
> > +                     clock-latency-ns =3D <40000>;
> > +             };
> > +             opp-1704000000 {
> > +                     opp-hz =3D /bits/ 64 <1704000000>;
> > +                     opp-microvolt =3D <937500 937500 950000>;
> > +                     clock-latency-ns =3D <40000>;
> > +             };
>
> None of those are valid according to Rockchip, we should have

Well, valid but more taxing on the hardware apparently.

>                 opp-1296000000 {
>                         opp-hz =3D /bits/ 64 <1296000000>;
>                         opp-microvolt =3D <750000 750000 950000>;
>                         clock-latency-ns =3D <40000>;
>                         opp-suspend;
>                 };
>
> instead?

I dropped this one because it uses a lower frequency but same voltage
as the 1.416 GHz one, thus being 'inefficient' as the thermal
subsystem says in the logs. It can be added back if we decide to
remove opp-1416000000.

> and...
>
> > +     };
> > +
> > +     cluster1_opp_table: opp-table-cluster1 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-1416000000 {
> > +                     opp-hz =3D /bits/ 64 <1416000000>;
> > +                     opp-microvolt =3D <750000 750000 950000>;
> > +                     clock-latency-ns =3D <40000>;
> > +             };
> > +             opp-1608000000 {
> > +                     opp-hz =3D /bits/ 64 <1608000000>;
> > +                     opp-microvolt =3D <787500 787500 950000>;
> > +                     clock-latency-ns =3D <40000>;
> > +             };
> > +             opp-1800000000 {
> > +                     opp-hz =3D /bits/ 64 <1800000000>;
> > +                     opp-microvolt =3D <875000 875000 950000>;
> > +                     clock-latency-ns =3D <40000>;
> > +             };
> > +             opp-2016000000 {
> > +                     opp-hz =3D /bits/ 64 <2016000000>;
> > +                     opp-microvolt =3D <950000 950000 950000>;
> > +                     clock-latency-ns =3D <40000>;
> > +             };
>
> opp-1800000000 and opp-2016000000 should be removed.
>
> and...
>
> > +     };
> > +
> > +     cluster2_opp_table: opp-table-cluster2 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-1416000000 {
> > +                     opp-hz =3D /bits/ 64 <1416000000>;
> > +                     opp-microvolt =3D <750000 750000 950000>;
> > +                     clock-latency-ns =3D <40000>;
> > +             };
> > +             opp-1608000000 {
> > +                     opp-hz =3D /bits/ 64 <1608000000>;
> > +                     opp-microvolt =3D <787500 787500 950000>;
> > +                     clock-latency-ns =3D <40000>;
> > +             };
> > +             opp-1800000000 {
> > +                     opp-hz =3D /bits/ 64 <1800000000>;
> > +                     opp-microvolt =3D <875000 875000 950000>;
> > +                     clock-latency-ns =3D <40000>;
> > +             };
> > +             opp-2016000000 {
> > +                     opp-hz =3D /bits/ 64 <2016000000>;
> > +                     opp-microvolt =3D <950000 950000 950000>;
> > +                     clock-latency-ns =3D <40000>;
> > +             };
>
> opp-1800000000 and opp-2016000000 should be removed as well.
>
> Did I misunderstand what Rockchip did here? Adding Kever in Cc at least
> for awareness on Rockchip side :)
>
> I guess another option could be to mark those above as
>
> turbo-mode;
>
> though no clue what this would entail. From a glance at cpufreq, it
> seems that for Rockchip since we use the default cpufreq-dt, it would
> mark those as unusable, so essentially a no-op, so better remove them
> entirely?

I believe the opp core just marks 'turbo-mode' opps as
CPUFREQ_BOOST_FREQ, and cpufreq-dt only passes that flag along to the
cpufreq core. But then to actually use those boost frequencies I would
guess the governor needs to somehow know the power/thermal constraints
of the chip?.. Don't know where that is defined.

Best,
Alexey

