Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87698CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 13:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lfVZp7HWqHjRqZVVhy7Ez9cx3BFg0k+dK3nLg7M60A=; b=nJ+huGd1rpPYcpHkcb5liR8lCc
	BpibKiIp5j4V5pIO5OX4566tD35bZLj4R0mAsqY9Drt/3RPqX03Ih3+Z1U0RjviogAdqJipUf4IYG
	X2UT2TLdVpVmvXgBu+4VAzc1g1RDic5z7XEY3mow0rqzdXWS031bgoUIiJjmzKspgFv+dO0VUZ7cu
	Mxs/dxqln6SSyz+CJyAlSQFughf8maDCW9RkBFJqWoOGNIbNY3dt/olRhOCHb7RwfdI6LKjRHqiWn
	GPTaEsvB5Cxa1vDQBPQQUXVDsAQkploSUHSx1CIHVw2JU0ceymzqiE/HLZFA2/vCumiKgPevd2uol
	/bYeOqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSav6-00000005nBA-28fU;
	Thu, 28 May 2026 13:37:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSav3-00000005nAN-3PRQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 13:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779975423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lfVZp7HWqHjRqZVVhy7Ez9cx3BFg0k+dK3nLg7M60A=;
	b=cahoY8diOEFlcA9rBirDgbFp0GO1d34JjR/xGEhpY4E0m3emdYc/lKL5odSzuh19QmJvKa
	hle45CJ+3FpsrTJew0ZOQbVMVMzFozMglUjOcwmkCmppSu+AYTnml4pn0+o5nnB1nFZVNM
	PJ5OJu1zbXNpthr+ocJAgoq44ZTImio=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-T7elkhutMya70lSmN3-11A-1; Thu, 28 May 2026 09:36:58 -0400
X-MC-Unique: T7elkhutMya70lSmN3-11A-1
X-Mimecast-MFC-AGG-ID: T7elkhutMya70lSmN3-11A_1779975417
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5a870f93c99so1065220e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 06:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975417; x=1780580217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/lfVZp7HWqHjRqZVVhy7Ez9cx3BFg0k+dK3nLg7M60A=;
        b=G5pxHBtNx62U7+TUQxbMTkDiD1JgjIRc4IykqzyBBftCH2s3W5ZjlmJpsTDxQdRiMB
         xH1vcuxvs+JFQJ1nZcZFOx1s+WyxveO0mHmrwHaVMcPgssaYwfvrWVh/ZZ723VQsOT/q
         KnjlHXCLYR1QhKFOH3XafYW2BrcDV/MT+aFiD16m2zgcazZP9qoeOqJMxag/eqxsFzmj
         G9bS9uiNxI9CWa7PT90J8RzJaFEVPdizJgP1fH6Q+IYxa+mjwDDA10ur6ijrwluQ/mf6
         zyu5T/gpXE6vY6x6EQdCDh3sBzVZqihKTQvCSVVDab3DWhMjfgU+S5ZqZGvutZq65vIv
         ZObQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yT9/NDDhphRj8zzddlR/BIWEz66b2XFDpZYuLNpzph0sI0kR0SH1JCV3JvSEH4GoY7+nLLeEtyOx94ftvWU3T@lists.infradead.org
X-Gm-Message-State: AOJu0YykDjkNTIKgz9VVw1QfFDurY4Id53hP8A7fwn43ndnUdkhfsH7j
	KEU9XnYM1E5wh0mQzZKjGc0f1IubmtVLxj/uQXGXWlXVN4MnQ1DhbidlTr7kZt6OLiNVtn5vxP3
	Ml0Ef/YO5SPo6zigcdr58KUM3yItzq5BCWn2ZrqkgO2bXw/ExjrvAlvP0cLiiYrsRVBrdxh+Xxs
	wqQhk3VEl5sf+igya/vtUtTF7c+VJAtG+EhTHWiFfuINaEow/TUSY=
X-Gm-Gg: Acq92OFQBJxkdn56sx05bosTReIElRrXaRnACNVjt/HSyYuSTqNM0dg/AAPmMDWoMc/
	JezK9PaU/SXUgMv4/QXVdCQNJqH0lSZ/KRWBPRPAX7ez8sdffhFsjWP30JEOtqgJahaSnkYrJk5
	2g50dMdoY02/KUx4wbDjyneden6MsPVwFxBlDWhtK+gm7IcafK/Il9zVppQb80bJimYnXgTfVDU
	01nY8nJIvzzFdI1
X-Received: by 2002:a05:651c:210b:b0:393:5904:7411 with SMTP id 38308e7fff4ca-3963aeeaf73mr5033001fa.3.1779975416801;
        Thu, 28 May 2026 06:36:56 -0700 (PDT)
X-Received: by 2002:a05:651c:210b:b0:393:5904:7411 with SMTP id
 38308e7fff4ca-3963aeeaf73mr5032791fa.3.1779975416222; Thu, 28 May 2026
 06:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260528083213.1399401-1-khristineandreea.barbulescu@oss.nxp.com> <20260528083213.1399401-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260528083213.1399401-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 28 May 2026 15:36:43 +0200
X-Gm-Features: AVHnY4JWVlWlJ0EWffurf2OBWBeheI9s2tuuUOn2kqYHXaCLBerPUHpYRJVoR8U
Message-ID: <CALE0LRs_8oT+sagUm95uXhfdf28iHO+f-Wwo0DrBp8DK_PaiJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: s32g: add PWM support for s32g2 and s32g3
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YUSwYV-aogrFrEFCFcF44xiZwTa0G15IaMUwETxN8vY_1779975417
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_063705_932394_0C5D5335 
X-CRM114-Status: GOOD (  18.64  )
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

Hi Khristine,

Thank you for the patch.

On Thu, May 28, 2026 at 10:32=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add PWM0 and PWM1 for S32G2 and S32G3 SoCs
>
> Issue: ALBSP-1959

You must remove the vendor-internal issue tracker reference before
submitting upstream.

> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
>  3 files changed, 133 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12de..907cf74e61f3 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -3,7 +3,7 @@
>   * NXP S32G2 SoC family
>   *
>   * Copyright (c) 2021 SUSE LLC
> - * Copyright 2017-2021, 2024-2025 NXP
> + * Copyright 2017-2021, 2024-2026 NXP

I see this is updated on every patch you recently submitted. While
this trivial conflict is easy to fix, it can be annoying. I suggest
creating a series with all the recent device-tree changes submitted
lately to facilitate the maintainers' work.

Other than the first comment I made, once that's fixed, you can add my:

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>

Thanks,
  Enric


>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -554,6 +554,19 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm0: pwm@401f4000 {
> +                       compatible =3D "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x401f4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 5>,
> +                                <&clks 6>,
> +                                <&clks 5>,
> +                                <&clks 5>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -717,6 +730,19 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm1: pwm@402e4000 {
> +                       compatible =3D "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x402e4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 7>,
> +                                <&clks 8>,
> +                                <&clks 7>,
> +                                <&clks 7>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g2-usdhc";
>                         reg =3D <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d..a4a9e21d1361 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2021-2025 NXP
> + * Copyright 2021-2026 NXP
>   *
>   * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>   *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> @@ -617,6 +617,20 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm0: pwm@401f4000 {
> +                       compatible =3D "nxp,s32g3-ftm-pwm",
> +                                    "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x401f4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 5>,
> +                                <&clks 6>,
> +                                <&clks 5>,
> +                                <&clks 5>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g3-swt", "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -792,6 +806,20 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm1: pwm@402e4000 {
> +                       compatible =3D "nxp,s32g3-ftm-pwm",
> +                                    "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x402e4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 7>,
> +                                <&clks 8>,
> +                                <&clks 7>,
> +                                <&clks 7>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g3-usdhc",
>                                      "nxp,s32g2-usdhc";
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-evb.dtsi
> index 803ff4531077..be7b645afa2d 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> @@ -245,6 +245,70 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       ftm0_pins: ftm0-pins {
> +               ftm0-grp0 {
> +                       pinmux =3D <0x2912>;
> +               };
> +
> +               ftm0-grp1 {
> +                       pinmux =3D <0x122>,
> +                                <0xb42>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm0-grp2 {
> +                       pinmux =3D <0xb13>,
> +                                <0xb53>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm0-grp3 {
> +                       pinmux =3D <0x2904>;
> +               };
> +
> +               ftm0-grp4 {
> +                       pinmux =3D <0x2925>;
> +               };
> +
> +               ftm0-grp5 {
> +                       pinmux =3D <0x2936>;
> +               };
> +       };
> +
> +       ftm1_pins: ftm1-pins {
> +               ftm1-grp0 {
> +                       pinmux =3D <0x1d3>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm1-grp1 {
> +                       pinmux =3D <0x29b4>;
> +               };
> +
> +               ftm1-grp2 {
> +                       pinmux =3D <0x29c3>;
> +               };
> +
> +               ftm1-grp3 {
> +                       pinmux =3D <0x1f4>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm1-grp4 {
> +                       pinmux =3D <0x202>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm1-grp5 {
> +                       pinmux =3D <0x29d2>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -293,6 +357,18 @@ &i2c4 {
>         status =3D "okay";
>  };
>
> +&pwm0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&ftm0_pins>;
> +       status =3D "okay";
> +};
> +
> +&pwm1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&ftm1_pins>;
> +       status =3D "okay";
> +};
> +
>  &spi1 {
>         pinctrl-0 =3D <&dspi1_pins>;
>         pinctrl-names =3D "default";
> --
> 2.34.1
>


