Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C441C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 03:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3i5QRO+5MfhCKu77ANJ3jBdCFtUPuCB3IIfNSEzuAM=; b=wmSwe031ou1+1T1iWhK3A+iOzk
	MAYildBL4Shz1QoyStjpx/xsoFPuvU5/9jWHtbtH11nF4TtXxsur3xVA7YXa+zAKp3K4ZIUjFR0SJ
	FROShtCiNMafmiv49hxwDLT2X06Xq0CKHtoxotG5ww4En+mMUYSpbLSaLWWHGtfSYCqjep2UV8bi6
	bzAkca00hha3R8RyahzVmT7B2TwypBjRNsMFxY/yb6HBupiyHkL9xKtybo1hYxodH3bb1zEad/dBW
	jpOJDPu7T9reOAIc9E5Jp55do9x86an/50T4d/aU4hZShEK9t1TDH+PK5+pN75/jXijnovgfGnmI4
	YpPiVG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujVEl-0000000EG0Y-1ydX;
	Wed, 06 Aug 2025 03:54:47 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujVAP-0000000EFjZ-3O57
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 03:50:19 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-8821c8a14bdso1846439f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 20:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754452217; x=1755057017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3i5QRO+5MfhCKu77ANJ3jBdCFtUPuCB3IIfNSEzuAM=;
        b=SnylszGDzmueNAfzHwVnUE3bJAl/SjEEo0S+tGhJq+ucFTkMvoJWqM7Q3mRX3JB/e6
         a3lkkkFsyFx8tNPnuI02t6fAu7ezhcwHUYYw5r/l4tKqxH7qgHzZ2ReXahwNnkKdzX8t
         BNBI5ICSW1DvZ4Vb//+mfMWSQmt1y5fJVUjQbBzmeX65Nn+IsIhjaZzfQlwGpPwgXNWv
         E0vvR//JjRAos0YzLGKBle5U994WO73l5BF1B1sBsfpzX2RrCQZ3Y2397vO8ZuxomaF8
         ptnjAFv7rLVhEj57m/uxmdwiT/EYDyjjtUkzF+bePN6zUD9m+5jad25wSmmKDYYKaVS2
         D7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754452217; x=1755057017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3i5QRO+5MfhCKu77ANJ3jBdCFtUPuCB3IIfNSEzuAM=;
        b=efSTlCox11vxmEN5atqnOEiW2QH0jot6lH2RpZ7Meig3g72r/m3yeESX4x1OzvBREF
         bSNRuZ1cYP2a++0pUCpLN0kEGaclP9kN1hLOcUMeK0N95tsDkHGW9RLECK4xGGIp6JCx
         CVALDJ1AipWKm7BeQhOHwj+7tOxDg3L8zkS+MpCBgyUUEMlLyPwg0r1E1EyKse8Xmt/T
         VVRrSRvhDqMO8Ho1pFKKJMqGLtNk8gg+EXQiH5upQBsj8hwAI0fL2FQONda/Mkapyo/7
         k4HbnQcpLEqQzgqyKiWozd5BjIVcsBeRqfW7lBTlonjYSaBJfikQEvwIqoR5eCXF0N3j
         UFug==
X-Forwarded-Encrypted: i=1; AJvYcCWHQXw+C90A8icHrHqWz4zOa8xpvmIRcxGEw74jq7ZzDRCYAuSjCXbAz0KxdbWuTLwwRlUjjgFzwjzlCSfaEHVi@lists.infradead.org
X-Gm-Message-State: AOJu0YyyW6ENTLUvEAfSkNHcaeKMvkkc8uWBhAXLXrRumASOX7VaQpD/
	6XfKb4jRwPd1MkvUGMXfL8qBtQamWsDecgnGYjDPkz1HjL6N9Xbc3NgpUxZmLHu8t0EgJSo66eq
	y4ME88C5dNl4T//i+qWjUXwWPJ1ehzBQ=
X-Gm-Gg: ASbGncvoMmT6HZxday8JXf6/47aFtcZA2co4aTBdc+C4X7DphcVeDpdnl6+c+qgWAB6
	WYccNhzJSuvim1NI5EULPbJHE57q3b0LQ/0MfHyeazdgl3N3/5ru5y2K/FjIMoZqcAk6tgzRXYg
	vvli98w2TfGhbiQZq8ZZQuQC5SdjfhRGJuZ5MAw3b2kHvyxpLfkh2Kah062nWOk5smtdTEqhmqq
	ux1jgQ=
X-Google-Smtp-Source: AGHT+IFCQESUgdKuGOqs444QSzygbhrbLJwY9iG/XD2Q5CtWib3hxKckGgR3Hyw/Y4VQLjfx/NuyfuaWMxWrok5dFkc=
X-Received: by 2002:a05:6602:2b07:b0:881:7e3a:4a37 with SMTP id
 ca18e2360f4ac-8819f065f0bmr265326839f.6.1754452216814; Tue, 05 Aug 2025
 20:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-7-shengjiu.wang@nxp.com> <1932645.tdWV9SEqCh@steina-w>
In-Reply-To: <1932645.tdWV9SEqCh@steina-w>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 Aug 2025 11:49:57 +0800
X-Gm-Features: Ac12FXyh9zIEFgIR4jwpAfqlHLcCdIoWysUI9X5TL5LXhlIGHinLI0hUpNeMIog
Message-ID: <CAA+D8AM7hEcyVaZF7MHN-jY_NOS+cdhrXGdTXeQ48-WV=bnLMA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp: Add hdmi parallel audio
 interface node
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_205017_850425_0CB09311 
X-CRM114-Status: GOOD (  18.21  )
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

On Tue, Aug 5, 2025 at 3:10=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Montag, 4. August 2025, 12:47:22 CEST schrieb Shengjiu Wang:
> > The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> > Audio Subsystem to the HDMI TX Controller.
> >
> > Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai devic=
e.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 28 +++++++++++++++++++-
>
> Please separate commits for SoC and board files. Thanks

Ok.

Best regards
Shengjiu Wang
>
> Best regards,
> Alexander
>
> >  2 files changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/=
boot/dts/freescale/imx8mp-evk.dts
> > index c0cc5611048e..cc9351a5bd65 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -442,6 +442,10 @@ &flexcan2 {
> >       status =3D "disabled";/* can2 pin conflict with pdm */
> >  };
> >
> > +&hdmi_pai {
> > +     status =3D "okay";
> > +};
> > +
> >  &hdmi_pvi {
> >       status =3D "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index 841d155685ee..00d8474bd1b1 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -2066,7 +2066,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
> >
> >                       hdmi_pvi: display-bridge@32fc4000 {
> >                               compatible =3D "fsl,imx8mp-hdmi-pvi";
> > -                             reg =3D <0x32fc4000 0x1000>;
> > +                             reg =3D <0x32fc4000 0x800>;
> >                               interrupt-parent =3D <&irqsteer_hdmi>;
> >                               interrupts =3D <12>;
> >                               power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PVI>;
> > @@ -2092,6 +2092,24 @@ pvi_to_hdmi_tx: endpoint {
> >                               };
> >                       };
> >
> > +                     hdmi_pai: audio-bridge@32fc4800 {
> > +                             compatible =3D "fsl,imx8mp-hdmi-pai";
> > +                             reg =3D <0x32fc4800 0x800>;
> > +                             interrupt-parent =3D <&irqsteer_hdmi>;
> > +                             interrupts =3D <14>;
> > +                             clocks =3D <&clk IMX8MP_CLK_HDMI_APB>;
> > +                             clock-names =3D "apb";
> > +                             power-domains =3D <&hdmi_blk_ctrl IMX8MP_=
HDMIBLK_PD_PAI>;
> > +                             status =3D "disabled";
> > +
> > +                             port {
> > +
> > +                                     pai_to_hdmi_tx: endpoint {
> > +                                             remote-endpoint =3D <&hdm=
i_tx_from_pai>;
> > +                                     };
> > +                             };
> > +                     };
> > +
> >                       lcdif3: display-controller@32fc6000 {
> >                               compatible =3D "fsl,imx8mp-lcdif";
> >                               reg =3D <0x32fc6000 0x1000>;
> > @@ -2143,6 +2161,14 @@ port@1 {
> >                                               reg =3D <1>;
> >                                               /* Point endpoint to the =
HDMI connector */
> >                                       };
> > +
> > +                                     port@2 {
> > +                                             reg =3D <2>;
> > +
> > +                                             hdmi_tx_from_pai: endpoin=
t {
> > +                                                     remote-endpoint =
=3D <&pai_to_hdmi_tx>;
> > +                                             };
> > +                                     };
> >                               };
> >                       };
> >
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

