Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD18C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 02:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmH5dt7dkmT0sqR1VIsfV7vNMyQYFdcO4lpGZIrbck0=; b=2qgrL1i3fRb7mepDkxDyx4CXfH
	Xzj4NpsnLKILXRHOMMwy5HpQYqTfAPsFcpd8R0kP75TtPdZJsOs8WzFdTo7UJ0AO7OgF9tsJN/0Ks
	Sdtl0w+M+TJ7GlgsmkHbUwwXNMrA+SatY4uPsBU7WlEq1ChQvIeW5nutRCYmDMELqeIQGzHxvih9F
	tlXzRMKaLGTPK5XWaBOu06PxaAIyc/14+cHphJBo8vTg6KBINshYy7/R/Cr9SrlIfH0rqgk3oxS9a
	WCV3mjOKDrnwnyqHTCAYlcbbHhyAfbnJg7CA9eAjb8CQmq9VMlP2483L640sMnr8q6YgV1qdHNHJ6
	ox1erLUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKpP8-0000000Guou-3JAM;
	Fri, 30 May 2025 02:23:30 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKpN0-0000000Guay-3Og1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 02:21:19 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3dc83a8a4afso8961825ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 19:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748571677; x=1749176477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmH5dt7dkmT0sqR1VIsfV7vNMyQYFdcO4lpGZIrbck0=;
        b=GrdbNV697XJz7FXvpTLwHoec7o/qaSHG9deUPIEszAC/XV0e8l9kxNbeYbF3BzO7S4
         tTMVWomKktAcHIV1rudbmmDyni7m5YYgpFcmgWzU7/lsU1HKlYJzcXVKYFMAc/kxw/67
         xRy+7lbkAGP9Hl0huLzXiEusETPaMRQnSEdC62X762OTuHeTfX17ex4vSRYoSrSQvuNK
         8vKVsHyjVnWLX24lNki4f42fImJDLmaJMpEK5v4x89onaz6YQrduD3xctc6g+0sB0VqD
         padqxEiC3rZNhMiNi4tai2+pYyfUovGqz2GnbuLJ0NB98CgamdwN8VDN8GoS0OzlPXDX
         vveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748571677; x=1749176477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmH5dt7dkmT0sqR1VIsfV7vNMyQYFdcO4lpGZIrbck0=;
        b=HGyCXyxvY+YlCrOpzLBR6/bckQk6ee3U8WgsL0eXvA0ubit8KpbUalueczHYnXcItT
         wbyX1PXdicL/MevLLTJkT2Tq/Kee1Xla77dk69OJ27kp8P+GLD5edvVcpXv9Cz/1cn3f
         u8chpyl+WTrWzLAj0dEP+ND9Apos5eIZgA1YPjswkEDb4MNiKUE3oulnudhvzkOk+B4g
         auG3MFYCVTBlBlb1QnNu2kraNRnU8+E9Y+n46gU/gR5CfKKkzLGBrmPotTPWVoX0ztpB
         MzzVfJeqrdDD06zN6rRiSJNkndQx0Srjel9Cyj21Vi/+mC2DKwr69y9gQ0fgXZFJ/PNd
         lPNA==
X-Forwarded-Encrypted: i=1; AJvYcCXS4xAtZDjy3Zr5ToCkVoI1H0RaJpHVemeFTDHwJe/Lwob9ZVJaXsnDFBCK639IG3ZyuU4c9H/MIdW5vqM6EEz2@lists.infradead.org
X-Gm-Message-State: AOJu0YzyY74OAIdlzQHW/+7gg0Vj3tBU7CNXZP/bzFwwvQkw0FXSAkkN
	6913875Q3xs6r5utvN7YUDQ1i6CuOdV2WPsyeZJXsRqCXueAfPDBltkUNU0dG3VhrYn8WooUFti
	79v40PqTQiAlknuPHoid8Gh8rDyOskyA=
X-Gm-Gg: ASbGnctguCnVqaFiQ/lW8fIgndBRhUh3W7T/uil/0rYLYNlGOP2E2YgR6HViz3GKZAi
	ZaaKxvr7FwL/OkaPG183xb1lOVvkEj+NFxo5RkhzdoDWWxFs6hC947m518hh8kbtg9cbYBi2qfw
	ClZ4c1pwVhwmU/mK8/i+imePcVHENWT5OX
X-Google-Smtp-Source: AGHT+IF3V2Reg6jytvBoWQIFfYDbO3xHDMdxyQHBKHDQU6qnKv9QNLMNJun7za9/cXwvOQopUbNOEo2NaT5EoYkZ2lc=
X-Received: by 2002:a05:6e02:b27:b0:3dc:8a59:9d91 with SMTP id
 e9e14a558f8ab-3dd9a2f69b8mr15435425ab.5.1748571677153; Thu, 29 May 2025
 19:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250528015837.488376-1-shengjiu.wang@nxp.com>
 <20250528015837.488376-5-shengjiu.wang@nxp.com> <20250528083704.ne6wyoj6vcmy7azq@pengutronix.de>
In-Reply-To: <20250528083704.ne6wyoj6vcmy7azq@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 May 2025 10:21:03 +0800
X-Gm-Features: AX0GCFsoAsJ1BSh1zryHTek_C0ndoEf3QlabWsiqEfnyP_mssnH9rTINpQzDe4g
Message-ID: <CAA+D8AMDbenx8scnBZdABAxF8MaYsBRzxXZjgGhMRbCJ-1wwcw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: imx943-evk: add sound-wm8962 support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, carlos.song@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_192118_854757_50E6D55A 
X-CRM114-Status: GOOD (  21.95  )
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

On Wed, May 28, 2025 at 4:37=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Hi,
>
> On 25-05-28, Shengjiu Wang wrote:
> > Add WM8962 codec connected to SAI1 interface.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx943-evk.dts | 79 ++++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/=
boot/dts/freescale/imx943-evk.dts
> > index ff6e9ac5477f..da08aaa95904 100644
> > --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> > @@ -36,6 +36,15 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
> >               enable-active-high;
> >       };
> >
> > +     reg_audio_pwr: regulator-wm8962-pwr {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-name =3D "audio-pwr";
> > +             gpio =3D <&pcal6416_i2c3_u171 12 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> >       reserved-memory {
> >               ranges;
> >               #address-cells =3D <2>;
> > @@ -50,6 +59,21 @@ linux,cma {
> >               };
> >       };
> >
> > +     sound-wm8962 {
> > +             compatible =3D "fsl,imx-audio-wm8962";
>
> Out of curiosity did you considered making use of "audio-graph-card2"?
>
> The "fsl,imx-audio-wm8962" seems like a pretty simple sound card which
> could be added via the "audio-graph-card2" as well. Don't get me wrong,
> it's not wrong what you're doing here but making use of the generic
> sound card would be nice because it's very common to just copy'n'paste
> the audio integration from the corresponding evk.dts file.

Thanks for the suggestion.

WM8962 has a function .set_pll(), which hasn't been supported in
audio-graph-card2.  so we still use fsl,imx-audio-wm8962.

Best regards
Shengjiu Wang

>
> Regards,
>   Marco
>
> > +             audio-codec =3D <&wm8962>;
> > +             audio-cpu =3D <&sai1>;
> > +             audio-routing =3D "Headphone Jack", "HPOUTL",
> > +                     "Headphone Jack", "HPOUTR",
> > +                     "Ext Spk", "SPKOUTL",
> > +                     "Ext Spk", "SPKOUTR",
> > +                     "AMIC", "MICBIAS",
> > +                     "IN3R", "AMIC",
> > +                     "IN1R", "AMIC";
> > +             hp-det-gpio =3D <&pcal6416_i2c3_u48 14 GPIO_ACTIVE_HIGH>;
> > +             model =3D "wm8962-audio";
> > +     };
> > +
> >       memory@80000000 {
> >               reg =3D <0x0 0x80000000 0x0 0x80000000>;
> >               device_type =3D "memory";
> > @@ -103,6 +127,28 @@ i2c@4 {
> >                       reg =3D <4>;
> >                       #address-cells =3D <1>;
> >                       #size-cells =3D <0>;
> > +
> > +                     wm8962: codec@1a {
> > +                             compatible =3D "wlf,wm8962";
> > +                             reg =3D <0x1a>;
> > +                             clocks =3D <&scmi_clk IMX94_CLK_SAI1>;
> > +                             AVDD-supply =3D <&reg_audio_pwr>;
> > +                             CPVDD-supply =3D <&reg_audio_pwr>;
> > +                             DBVDD-supply =3D <&reg_audio_pwr>;
> > +                             DCVDD-supply =3D <&reg_audio_pwr>;
> > +                             gpio-cfg =3D <
> > +                                     0x0000 /* 0:Default */
> > +                                     0x0000 /* 1:Default */
> > +                                     0x0000 /* 2:FN_DMICCLK */
> > +                                     0x0000 /* 3:Default */
> > +                                     0x0000 /* 4:FN_DMICCDAT */
> > +                                     0x0000 /* 5:Default */
> > +                             >;
> > +                             MICVDD-supply =3D <&reg_audio_pwr>;
> > +                             PLLVDD-supply =3D <&reg_audio_pwr>;
> > +                             SPKVDD1-supply =3D <&reg_audio_pwr>;
> > +                             SPKVDD2-supply =3D <&reg_audio_pwr>;
> > +                     };
> >               };
> >
> >               i2c@5 {
> > @@ -128,6 +174,12 @@ pcal6416_i2c3_u171: gpio@21 {
> >                               reg =3D <0x21>;
> >                               #gpio-cells =3D <2>;
> >                               gpio-controller;
> > +
> > +                             audio-pwren-hog {
> > +                                     gpios =3D <12 GPIO_ACTIVE_HIGH>;
> > +                                     gpio-hog;
> > +                                     output-high;
> > +                             };
> >                       };
> >               };
> >
> > @@ -262,6 +314,23 @@ &lpuart1 {
> >       status =3D "okay";
> >  };
> >
> > +&sai1 {
> > +     assigned-clocks =3D <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
> > +                       <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
> > +                       <&scmi_clk IMX94_CLK_AUDIOPLL1>,
> > +                       <&scmi_clk IMX94_CLK_AUDIOPLL2>,
> > +                       <&scmi_clk IMX94_CLK_SAI1>;
> > +     assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> > +                              <&scmi_clk IMX94_CLK_AUDIOPLL1>;
> > +     assigned-clock-rates =3D <3932160000>,
> > +                            <3612672000>, <393216000>,
> > +                            <361267200>, <12288000>;
> > +     pinctrl-0 =3D <&pinctrl_sai1>;
> > +     pinctrl-names =3D "default";
> > +     fsl,sai-mclk-direction-output;
> > +     status =3D "okay";
> > +};
> > +
> >  &scmi_iomuxc {
> >
> >       pinctrl_ioexpander_int2: ioexpanderint2grp {
> > @@ -297,6 +366,16 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL          0x40000b9=
e
> >               >;
> >       };
> >
> > +     pinctrl_sai1: sai1grp {
> > +             fsl,pins =3D <
> > +                     IMX94_PAD_SAI1_TXFS__SAI1_TX_SYNC       0x31e
> > +                     IMX94_PAD_SAI1_TXC__SAI1_TX_BCLK        0x31e
> > +                     IMX94_PAD_SAI1_TXD0__SAI1_TX_DATA0      0x31e
> > +                     IMX94_PAD_SAI1_RXD0__SAI1_RX_DATA0      0x31e
> > +                     IMX94_PAD_I2C2_SDA__SAI1_MCLK           0x31e
> > +             >;
> > +     };
> > +
> >       pinctrl_uart1: uart1grp {
> >               fsl,pins =3D <
> >                       IMX94_PAD_UART1_TXD__LPUART1_TX         0x31e
> > --
> > 2.34.1
> >
> >
> >

