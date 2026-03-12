Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB655FED2FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvkQ2gOXPfEgvVdYXifa8peVJAvhJSw87S/AMCZBBQs=; b=jUGHjYj6Npnx9SB52FYcpcU/5x
	7CmJus1I9xWFiB8STPGjgRui8Ue3CGXZFQ5PPmcOUv7z1ZZNFDo+sXZ12hevw9tXLVR11zxzn/N+c
	mz8VDwbaUwninxL98mey7ARJdB4b2fn1Fo1SHf1xlAoVK6Bj9Nd0VllYzUZvRcN7kur1xiGYnMO1A
	g9eCU+OPWMmeB9fZGJZWo+LxM4LpBMqaAmU66WRBpvbonYboRcEYjgZJDs+QYSYqHNsSsB+LlTZXW
	kIo3d0CaiDV4HMdxSwnGTsxGukcCh7iO48TKA2hy+El6eYQvgxQd9zxHBrlkUlU7bkuJbNu8OqoqY
	uM6eY73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cfc-0000000Dnu5-2lDD;
	Thu, 12 Mar 2026 09:49:32 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cfZ-0000000Dnta-0Q8g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 09:49:30 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c73bbdc01b7so290088a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 02:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773308968; cv=none;
        d=google.com; s=arc-20240605;
        b=dYI8Pra/M1kmEDraxCPcZRQk1UQWpGnoONnmrrv33zPOA150oxAzmv7NR5cUJBAw5W
         nOvg3x1oqy1Yll6I5zZMaucO4vLiT0vzxESFo6S0+EXdzqhL+kvof0Oa2fA0DoBo4kGy
         YbU7D/g9xqUSM0FLHClR1OtxNJx1ITSGla/LPitXv0dPXMQQGJsk3CzPB2M3UaSBUfjE
         GYSlA9yQIgK8f+0vUdYwe5y37N47l/c2lDcvg2iQnaIiC3cbRHORckon343Q4BbhB2h4
         YVZgyGrm547VFFFl1ZsTMiAGB7udr8uetN3cO2wLGHjFy01GArVUSH7xV4Ehs0wazer0
         wEiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qvkQ2gOXPfEgvVdYXifa8peVJAvhJSw87S/AMCZBBQs=;
        fh=eX3XgTRC4cyxjIsaGoBugCsJTW/Rn46Ao7Z5XIFCo+0=;
        b=a8jDHeea2HlpFqchNA7nImRg6sppJ8B3sUqLzykhWmxbPsPqy3IKZRQPu69PSP9nLf
         t4ZF90TDSZ4I9tGAsRflMvBFgyT1TigndBwOn50MkjyNrDdPn1224Z9/UEm+aZNw/WBL
         2UHmtYZbPlKjxCO6ehlZvK62US5ewM8ggFuvJ5mc6fkGCRJ1cgbTKu0jcyOfhwZaEuuI
         WGPd8jNI//IddhrmFkvEA8VRCTeIpYFq9j96HyRHaKewSSBIBgZi+g9hXXMcQd7FXnDf
         Wp4v5WqH+/k612C09JmNnSqgPiQVfZeBbELj0bGsclwfwFjVXM2AayqLgv0zLRZM1v7Y
         yNjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773308968; x=1773913768; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvkQ2gOXPfEgvVdYXifa8peVJAvhJSw87S/AMCZBBQs=;
        b=Al6RFEC5BNkGunW3GUCDeV3dx3Z6ZeLiMTWVo468HqwUq0AFj6G55ZF+QIoefcOrHA
         IFOOICPG8+xfSI5+GAyh9c0JyJxHUDHCZnshK1OeiBuy3pzDKSvE40OfR3jO7w3FTE4U
         VT8dyxsX2pVWz1aUd3q7bfvJ4uArJqcruygBOAgUO6jFoPBvkrbTQD4YVaELmU+AHlZT
         SOa9rcFMdnSgz+muUX7Wa0SqW0MZ9dDTOhpRacs+TmTtk5mSeUqtIOlLo+IYcFAztQf5
         4XPZ77Kji6N50mVfVFNijm+TnJVCYR7McKC4Cc7e6BOmvT0QUYFk/1eh+kSwj91LG7J6
         0Nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773308968; x=1773913768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qvkQ2gOXPfEgvVdYXifa8peVJAvhJSw87S/AMCZBBQs=;
        b=NL+bEMGi9FkvxjGkgGWUd1Uv4a71/muXkIeO2YQkXJOZAOgdNbyLr0HaJ00DbQkksg
         fpxZqPq+1cF/G7UDR+ZCwp6m4utdu9SHx/QWT0/iwmNWem6OJdB9wThmRuNrvbF7HEGo
         x+Wuv6z0syStK9voPDbF1mFcj++S4YqUKKulXwtHIV7MTM+WX591vxJXwskr4by9cbh0
         cviq2AEclpNuh2rmFJGPgggVxoAZwRMaP5FwF+pZSkcMisTV6qG7wFxmq2mGxi3bo+Pq
         kn3qt9IAgNIyq5pj+mPhnfaWMAiVpkKYutnO+TvNpvY0SE8K9ubpfq365V+voPSfe0Bn
         qPWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrRLTaaD/UZ7ymVuUtYNtB9cjN5sRqOfdgIuXdqj3Sk5726bw8DCrrj//lUyHcePcj7GjPCeQBZf+Zfd7j7b1J@lists.infradead.org
X-Gm-Message-State: AOJu0YzIaBQ3HL7K7zFZlpMC0y6SfSJojmbtdX+p73lANRmyyq1gcGq6
	aA4xX+FOTAs0nUtofX94w6sZDFpHenXnATfC9ddjMe2kiUVBtTqvXhWqCYiVfJF5z9gZodRIp4H
	GuuCn0RjC5Knts3XfpBCmopLV676qq7A=
X-Gm-Gg: ATEYQzyuVdkHcZFQ2ptCXkbx52dAPup+h9P/kZRrsK90aF/2LkmgUfVD4bkQlyJAAmV
	0zJ/HZ7bnq7wW4XFf6MTU+uoRB3hZKx9T0LXrmteKZpj8XwH4sPC3PQReem+PYC0G4foCs/NfrF
	dgzQvqA2Br7WLdcC165LlRikMQp2zojKtPQfvte+9Qjps1PgsGiSjLdwN506ZYOCQW+6l216e2Z
	SvhzQ6zl8fj4aK7ejIme2xT3tkb+pBUIhoNllC31VYoeI2kjWU2EwDbAgXZE12MxSlULxSzgMGE
	zVPWjTc=
X-Received: by 2002:a17:902:db11:b0:2ae:572a:9f39 with SMTP id
 d9443c01a7336-2aeae7ae390mr54703625ad.18.1773308967815; Thu, 12 Mar 2026
 02:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
 <20260312034912.4007057-3-shengjiu.wang@nxp.com> <3918649.ElGaqSPkdT@steina-w>
In-Reply-To: <3918649.ElGaqSPkdT@steina-w>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Mar 2026 17:49:09 +0800
X-Gm-Features: AaiRm50CUazvc_T7zmj0XI6ARnrNtJthYpyJMVhYBvsd-m3gH044OghfQFK0Z8w
Message-ID: <CAA+D8AP=cobxaw=0CuM=J_Q+3LMtJoO-B5LvScQWqE-9NswKXA@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: imx952-evk: Add sound-wm8962 support
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_024929_149293_D0602627 
X-CRM114-Status: GOOD (  18.17  )
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

On Thu, Mar 12, 2026 at 5:45=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Donnerstag, 12. M=C3=A4rz 2026, 04:49:10 CET schrieb Shengjiu Wang:
> > Add wm8962 sound card. By connecting with ASRC1, the sound card support
> > sample rate conversion.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx952-evk.dts | 119 +++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/=
boot/dts/freescale/imx952-evk.dts
> > index 509704c23e89..ef0058b98573 100644
> > --- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
> > @@ -110,6 +110,15 @@ reg_vref_1v8: regulator-adc-vref {
> >               regulator-max-microvolt =3D <1800000>;
> >       };
> >
> > +     reg_audio_pwr: regulator-audio-pwr {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "audio-pwr";
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             gpio =3D <&i2c4_pcal6408 1 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> >       reg_usdhc2_vmmc: regulator-usdhc2 {
> >               compatible =3D "regulator-fixed";
> >               pinctrl-names =3D "default";
> > @@ -131,6 +140,51 @@ reg_usb_vbus: regulator-vbus {
> >               enable-active-high;
> >       };
> >
> > +     sound-wm8962 {
> > +             compatible =3D "fsl,imx-audio-wm8962";
> > +             audio-asrc =3D <&asrc1>;
> > +             audio-codec =3D <&wm8962>;
> > +             audio-cpu =3D <&sai3>;
> > +             audio-routing =3D "Headphone Jack", "HPOUTL",
> > +                             "Headphone Jack", "HPOUTR",
> > +                             "Ext Spk", "SPKOUTL",
> > +                             "Ext Spk", "SPKOUTR",
> > +                             "AMIC", "MICBIAS",
> > +                             "IN3R", "AMIC",
> > +                             "IN1R", "AMIC";
> > +             hp-det-gpio =3D <&gpio2 11 GPIO_ACTIVE_HIGH>;
> > +             model =3D "wm8962-audio";
> > +             pinctrl-0 =3D <&pinctrl_hp>;
> > +             pinctrl-names =3D "default";
> > +     };
> > +};
> > +
> > +&asrc1 {
> > +     assigned-clocks =3D <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL1>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2>,
> > +                       <&scmi_clk IMX952_CLK_ASRC1>;
> > +     assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> > +                              <&scmi_clk IMX952_CLK_AUDIOPLL1>;
> > +     assigned-clock-rates =3D <3932160000>, <3612672000>,
> > +                            <393216000>, <361267200>, <49152000>;
> > +     fsl,asrc-rate  =3D <48000>;
> > +     status =3D "okay";
> > +};
> > +
> > +&asrc2 {
> > +     assigned-clocks =3D <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL1>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2>,
> > +                       <&scmi_clk IMX952_CLK_ASRC2>;
> > +     assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> > +                              <&scmi_clk IMX952_CLK_AUDIOPLL1>;
> > +     assigned-clock-rates =3D <3932160000>, <3612672000>,
> > +                            <393216000>, <361267200>, <49152000>;
> > +     fsl,asrc-rate  =3D <48000>;
> > +     status =3D "okay";
>
> Is asrc2 actually required? AFAICS this is not referenced.

Yes. It can provide memory to memory interface to user space standalone.

Best regards
Shengjiu Wang

>
> Best regards,
> Alexander
>
> >  };
> >
> >  /* pin conflict with PDM */
> > @@ -185,6 +239,27 @@ &lpi2c4 {
> >       pinctrl-0 =3D <&pinctrl_lpi2c4>;
> >       status =3D "okay";
> >
> > +     wm8962: audio-codec@1a {
> > +             compatible =3D "wlf,wm8962";
> > +             reg =3D <0x1a>;
> > +             clocks =3D <&scmi_clk IMX952_CLK_SAI3>;
> > +             AVDD-supply =3D <&reg_audio_pwr>;
> > +             CPVDD-supply =3D <&reg_audio_pwr>;
> > +             DBVDD-supply =3D <&reg_audio_pwr>;
> > +             DCVDD-supply =3D <&reg_audio_pwr>;
> > +             gpio-cfg =3D < 0x0000 /* 0:Default */
> > +                     0x0000 /* 1:Default */
> > +                     0x0000 /* 2:FN_DMICCLK */
> > +                     0x0000 /* 3:Default */
> > +                     0x0000 /* 4:FN_DMICCDAT */
> > +                     0x0000 /* 5:Default */
> > +                     >;
> > +             MICVDD-supply =3D <&reg_audio_pwr>;
> > +             PLLVDD-supply =3D <&reg_audio_pwr>;
> > +             SPKVDD1-supply =3D <&reg_audio_pwr>;
> > +             SPKVDD2-supply =3D <&reg_audio_pwr>;
> > +     };
> > +
> >       i2c4_pcal6408: gpio@21 {
> >               compatible =3D "nxp,pcal6408";
> >               reg =3D <0x21>;
> > @@ -312,6 +387,24 @@ &lpspi7 {
> >       status =3D "okay";
> >  };
> >
> > +&sai3 {
> > +     assigned-clocks =3D <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL1>,
> > +                       <&scmi_clk IMX952_CLK_AUDIOPLL2>,
> > +                       <&scmi_clk IMX952_CLK_SAI3>;
> > +     assigned-clock-parents =3D <0>, <0>, <0>, <0>,
> > +                              <&scmi_clk IMX952_CLK_AUDIOPLL1>;
> > +     assigned-clock-rates =3D <3932160000>, <3612672000>,
> > +                            <393216000>, <361267200>, <12288000>;
> > +     pinctrl-0 =3D <&pinctrl_sai3>;
> > +     pinctrl-1 =3D <&pinctrl_sai3_sleep>;
> > +     pinctrl-names =3D "default", "sleep";
> > +     fsl,sai-amix-mode =3D "bypass";
> > +     fsl,sai-mclk-direction-output;
> > +     status =3D "okay";
> > +};
> > +
> >  &scmi_misc {
> >       nxp,ctrl-ids =3D <BRD_SM_CTRL_SD3_WAKE            1
> >                       BRD_SM_CTRL_M2E_WAKE            1
> > @@ -402,6 +495,12 @@ IMX952_PAD_GPIO_IO27__WAKEUPMIX_TOP_CAN2_RX       =
       0x39e
> >               >;
> >       };
> >
> > +     pinctrl_hp: hpgrp {
> > +             fsl,pins =3D <
> > +                     IMX952_PAD_GPIO_IO11__WAKEUPMIX_TOP_GPIO2_IO_11  =
       0x31e
> > +             >;
> > +     };
> > +
> >       pinctrl_lpi2c2: lpi2c2grp {
> >               fsl,pins =3D <
> >                       IMX952_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL       =
       0x40000b9e
> > @@ -476,6 +575,26 @@ IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7 0=
x31e
> >               >;
> >       };
> >
> > +     pinctrl_sai3: sai3grp {
> > +             fsl,pins =3D <
> > +                     IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_SAI3_MCLK    =
               0x31e
> > +                     IMX952_PAD_GPIO_IO16__WAKEUPMIX_TOP_AUDMIX_TDM_OU=
T_TXBCLK       0x31e
> > +                     IMX952_PAD_GPIO_IO26__WAKEUPMIX_TOP_AUDMIX_TDM_OU=
T_TXSYNC       0x31e
> > +                     IMX952_PAD_GPIO_IO20__WAKEUPMIX_TOP_SAI3_RX_DATA_=
0              0x31e
> > +                     IMX952_PAD_GPIO_IO21__WAKEUPMIX_TOP_AUDMIX_TDM_OU=
T_TXDATA       0x31e
> > +             >;
> > +     };
> > +
> > +     pinctrl_sai3_sleep: sai3sleepgrp {
> > +             fsl,pins =3D <
> > +                     IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_GPIO2_IO_17  =
       0x31e
> > +                     IMX952_PAD_GPIO_IO16__WAKEUPMIX_TOP_GPIO2_IO_16  =
       0x31e
> > +                     IMX952_PAD_GPIO_IO26__WAKEUPMIX_TOP_GPIO2_IO_26  =
       0x31e
> > +                     IMX952_PAD_GPIO_IO20__WAKEUPMIX_TOP_GPIO2_IO_20  =
       0x31e
> > +                     IMX952_PAD_GPIO_IO21__WAKEUPMIX_TOP_GPIO2_IO_21  =
       0x31e
> > +             >;
> > +     };
> > +
> >       pinctrl_tpm3: tpm3grp {
> >               fsl,pins =3D <
> >                       IMX952_PAD_GPIO_IO12__WAKEUPMIX_TOP_TPM3_CH2     =
       0x51e
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
>

