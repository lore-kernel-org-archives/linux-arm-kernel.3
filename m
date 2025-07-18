Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2664C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vx0q77AoxjqthF4ccMdayGHHZsrST9CpwJM5Mt74LpI=; b=XgJG8J9AyE1Et/qCjVBsVzjnqs
	FleFvF8mtJgw9GxEoJv+5toPv4vUAinyBlhSMoFw6xjA9T7/Th7lGWh/U9cFzKOkXEdm6aOHeYbHs
	8rQ9m/K5f2rUN3yOvUdEPc9YwscqTxmG8IX7Yn40vG3G3lHZ8UDfvO02MVjahMswiApgtzzC5wRVG
	5TdpPf/61FdV2xoT6GtkNJQ42Dm3n0KTvgft4UVt5d0/sj6TWCgzaSxaaOOQUg64J45QA4HhJFrt+
	/TK2S4rVyhCBFJiHgiJ1ajklI0o51Tl3Hm3oOiujtQUZrVt8lPR8tE4cAu41gQH5VxxdBx9NrZXjw
	0n0OBVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgEP-0000000BziB-29MT;
	Fri, 18 Jul 2025 08:14:13 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg79-0000000ByOZ-1HUl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 08:06:44 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-879c49e8ac3so119911139f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 01:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752826002; x=1753430802; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vx0q77AoxjqthF4ccMdayGHHZsrST9CpwJM5Mt74LpI=;
        b=VuqjMsiHwLdJiVD+6gAuql2++4ycUTSYeJVvU+GRAw4EWheNcgEUOpD7t2EUhinpMO
         K6YyhUA7024DRQb4SqEOM1BIdCJji4qu/TkC7jwPDZVj+trZ5LCQnkHYbOh9rIUCSatT
         vqYi3i6eZ/Aaa+MlyX1UP6u2ZRAXuSrbuDF+BhcGCNHRQXTPgF6q0UJ4EXZCoiCZmanP
         omDVoD0/ekFfrzVX37dTg0qqRT/1PlLtvxUfe5fZ7GdtE2KtdyK9HNJKl49jJ4edJRK4
         NeWkd8fpTbRK8TlNA7yoNIisu+PxjDEToPjwMnQHbYdbiVXnYj13xbfbVyHKitdtvGe2
         MB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752826002; x=1753430802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vx0q77AoxjqthF4ccMdayGHHZsrST9CpwJM5Mt74LpI=;
        b=WgkQzoLzPrnZPWHJ4kttBgEqNgcdXwG3LOgFnHPshe4IzqKRVd4H0+OJbpAZybOzzT
         Bt/jyEEJ1/n5zrl/gM82rHjCl0i8pqvaworQu1bzXlQDkYA1t3mSE8wVmf6VNxexOChD
         nclAkZnVHKjsBkc6Tx7KImkWF3F1IUCsFHatxSm0BzfKsKqwHSQLllJey4Hb0xsZgsXj
         FqlNI9tF/SPrPqNuhoBlkWZkXGWdOkuN9XraI6GNUlLOnpQ/MPiauN6kCiwRqyqJb1TP
         +In/lFfJybSqlcgB5yQmPYZSAsFOCORB8wW2xosBH/XuaoPsgTv68oVCRxxi5nF1uHdR
         6W3A==
X-Forwarded-Encrypted: i=1; AJvYcCWESsvGgYgQUbdYVq5lbLv0egXazhMyle5TFGpcGArnU1lRNY51ot9SvhThgPJStunN3eLY9YA4EfJewqeCksSt@lists.infradead.org
X-Gm-Message-State: AOJu0YxYCjeW5gbHLrfJs80paVAP1QO2v4HxKVCc0sSfBstIDrh5S9SA
	YaHIoksSIJwv0A8sCc/rZ6EeX+M1C4LkoVBNwigkQDLlnXcKioLFvuzEEa9JncD2NtL8/dnEZDc
	+CPlJnxAP1a7RaFBzalIB9AFPv9mVfhY=
X-Gm-Gg: ASbGncudHWI5a1ZQbD6Q/JdsprpQLx6rH7nQY702UNfTox48ARgf/K0SFKJ94kFpyDb
	virhPu7t1FxZRQKgVx+jyNj+o+FYSqFMeRTOM5o1l5fEDOcEDhfGEydTMiV5lPHqnv4ZSrAhoRc
	yUB7Gj2KtC7J2bWp0T+lkGxqlcHEPizT7044T59TNvhRuNxQhAWCgeladZIe+9MWT9mmutgFqGu
	npV6cQ=
X-Google-Smtp-Source: AGHT+IE7GtvrLtIVr6iZFDN2EctnHvZOIyXlxWh6MzNugLEC1QoF3JNN0biXxaa1KHAjBcNYlASQWsOf7emqcbdQTgg=
X-Received: by 2002:a05:6602:6b07:b0:861:d8ca:3587 with SMTP id
 ca18e2360f4ac-879c29170cdmr1158031539f.4.1752826002287; Fri, 18 Jul 2025
 01:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250716061114.2405272-1-shengjiu.wang@nxp.com>
 <20250716061114.2405272-2-shengjiu.wang@nxp.com> <aHf6q9asHvmw2Zc8@lizhi-Precision-Tower-5810>
In-Reply-To: <aHf6q9asHvmw2Zc8@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 18 Jul 2025 16:06:30 +0800
X-Gm-Features: Ac12FXzO6DToRCzTYT9Ee12DWJJ77xXjVtDSkAwa86OZgA_lFa-sYoMhsihMh14
Message-ID: <CAA+D8AM_3zK5Gp0_OWzc9B-qJU9CNYvDynMH5_a-o8+4ShE6Mw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: imx8mm-evk: support more sample rates for
 wm8524 card
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_010643_348027_7A438018 
X-CRM114-Status: GOOD (  22.24  )
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

On Thu, Jul 17, 2025 at 3:17=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jul 16, 2025 at 02:11:12PM +0800, Shengjiu Wang wrote:
> > The wm8524 codec is connected to the SAI interface. There are two audio
> > plls on i.MX8MM, one pll can be the clock source of 44kHz series rates,
> > another pll can be clock source of 48kHz series rates.
> >
> > Add mclk-fs property for the clock ratio, remove 'clocks' property for
> > codec that doesn't need to handle clock enablement, add
> > 'system-clock-direction-out' for clock is from cpu dai.
>
> Can you provide the reason why need such change?

As commit
17cc308b1833 ASoC: wm8524: enable constraints when sysclk is configured.
make wm8524 release the constraint when codec's sysclk is not configured
so we can configure the cpu dai's sysclk to support more rates. previously =
it
only support 48k series rates, now it can support 44k series rates.

will add these info is commit message.

>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64=
/boot/dts/freescale/imx8mm-evk.dtsi
> > index 622caaa78eaf..ff7ca2075230 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> > @@ -147,6 +147,7 @@ sound-wm8524 {
> >               simple-audio-card,format =3D "i2s";
> >               simple-audio-card,frame-master =3D <&cpudai>;
> >               simple-audio-card,bitclock-master =3D <&cpudai>;
> > +             simple-audio-card,mclk-fs =3D <256>;
>
> what's measn 256? Do you need mention in commit message?

mclk-fs is the ratio to calculate the sysclk,  sysclk =3D mclk-fs * sample =
rate.
256 is a common ratio for audio.

will add these info in commit message.

best regards
Shengjiu Wang
>
> Frank
> >               simple-audio-card,widgets =3D
> >                       "Line", "Left Line Out Jack",
> >                       "Line", "Right Line Out Jack";
> > @@ -158,11 +159,11 @@ cpudai: simple-audio-card,cpu {
> >                       sound-dai =3D <&sai3>;
> >                       dai-tdm-slot-num =3D <2>;
> >                       dai-tdm-slot-width =3D <32>;
> > +                     system-clock-direction-out;
> >               };
> >
> >               simple-audio-card,codec {
> >                       sound-dai =3D <&wm8524>;
> > -                     clocks =3D <&clk IMX8MM_CLK_SAI3_ROOT>;
> >               };
> >       };
> >
> > @@ -570,9 +571,17 @@ &sai2 {
> >  &sai3 {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&pinctrl_sai3>;
> > -     assigned-clocks =3D <&clk IMX8MM_CLK_SAI3>;
> > -     assigned-clock-parents =3D <&clk IMX8MM_AUDIO_PLL1_OUT>;
> > -     assigned-clock-rates =3D <24576000>;
> > +     assigned-clocks =3D <&clk IMX8MM_AUDIO_PLL1>,
> > +                       <&clk IMX8MM_AUDIO_PLL2>,
> > +                       <&clk IMX8MM_CLK_SAI3>;
> > +     assigned-clock-parents =3D <0>, <0>, <&clk IMX8MM_AUDIO_PLL1_OUT>=
;
> > +     assigned-clock-rates =3D <393216000>, <361267200>, <24576000>;
> > +     fsl,sai-mclk-direction-output;
> > +     clocks =3D <&clk IMX8MM_CLK_SAI3_IPG>, <&clk IMX8MM_CLK_DUMMY>,
> > +             <&clk IMX8MM_CLK_SAI3_ROOT>, <&clk IMX8MM_CLK_DUMMY>,
> > +             <&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_AUDIO_PLL1_OUT>,
> > +             <&clk IMX8MM_AUDIO_PLL2_OUT>;
> > +     clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k=
", "pll11k";
> >       status =3D "okay";
> >  };
> >
> > --
> > 2.34.1
> >

