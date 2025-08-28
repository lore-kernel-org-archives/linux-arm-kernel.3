Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F52CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80lLDHpN3Csbhaqn6OlMNPOii5Ix4huABuj8mVbmyWk=; b=jDfWWfW3lSPaA//6tBAT47kLkE
	O3nbIC01P6t20LEAPvRvuNV68hfRzqdKzcGDWuAV03EJltNxGokOSrTmFCC1WAzgg0YrxV/h+m2Tl
	NJ0s7lhWY/4Wlu4I039HEHEgv2olG4cmlwiIM4Kkn3VYWhfJzsQfkl0hKFkKbKgCVrcsOYSeizmU5
	AicbPOQvIM7hLBDFVo1XgbrH7JsyBxDQBYPItQuLFz4Mnbl4cY7jJvKvE48YQ/Vf7ixoqgih5EDlQ
	vJpr6pn+DwUp/KgNw1+vo8VVfBGGQN/dDxhV1epvSkyoniBWb5r8oF46mlSP1DJVrI4bNuJKSuAYi
	YoO7Gy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgOl-00000002Tqk-0Ydh;
	Thu, 28 Aug 2025 17:26:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcgK-00000001k55-1OMn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C02AB601BB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 13:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76732C4CEF8
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756387727;
	bh=DfHHBD/rVjjrqh5NmASHX+RFHIrOFeXwQ0K0sXIKM0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=swzObivgRxQ1txTRZOLUVqeNZa30HWFK/E0loDw51gF1fYkBfgiRHVViLErwUbGe4
	 tah2ih40TeRH5TbGU+fURSCilcEw5fk41YCdMnlDI0U8Jpcam/U9UCHfEqIlzTGREW
	 3v8+EbjwRBduKZzUn/PyAKWN2kLXYqbKyQfbp9ISsuVdl/eaB8rluloH/3teYGMe9n
	 1e1sURGOAzbO/5ASZVMVH+OAr/GiWXRBcnKRsUM+V9W0D76ONMZAfLCyV8izrF7hEP
	 yvMMk0HtP087rudOTF4ljFhubq3lh0QsfCPEzSJt5qPximNFO9taD7TmHaRgKixx41
	 FqYxNmc/mB/Mw==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afe775db944so302136766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3EpLKF39rc/uVB7MaeITjJGX+/OYThxl7PlU7+COe5nkDSfO2s/sePkv6U0qMqPCXhdHNb0J1ztgmuJsTmdzk@lists.infradead.org
X-Gm-Message-State: AOJu0YwIm9fJItH+RB3/83jxierYXEaGlB33QEG03GaZPkm+tDoo41c4
	ujxdn3qxNDQeCiHtvnmihYGPR8LoMyAaGQHYknr5i6WZiaQZDgbddswikIR/oVDo17lRaysQ1o/
	6Bbg3ZZJcKQq8fJwN3LxtOJKrIaIcFw==
X-Google-Smtp-Source: AGHT+IFgWx3EjxiuyoE9wirR/dDT7Hm9AlZ1rldwPD7NWFyqMumFqslPy2Yia23VX1xN9hg0OQGKXYTedeYDgzaTElM=
X-Received: by 2002:a17:907:1c1c:b0:af9:a381:aee1 with SMTP id
 a640c23a62f3a-afeafecae85mr812402766b.0.1756387726034; Thu, 28 Aug 2025
 06:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756104334.git.christophe.leroy@csgroup.eu> <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
In-Reply-To: <17636607f2beac3b64c87b3bec035fa27ce8d195.1756104334.git.christophe.leroy@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Thu, 28 Aug 2025 08:28:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
X-Gm-Features: Ac12FXxDhqNf1LWnckP7L04gabZFe5TqvyzgYXr11IYk9xaITt-kXXAUX9A3-yw
Message-ID: <CAL_JsqKFvVQTVXV8mWX0z1=hd3nLDzLXq-0G_0bshMCvQ5kVvA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 25, 2025 at 2:20=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.

Why do you need to know this? The ones that have interrupts will be
referenced by an 'interrupts' property somewhere.

> Here is an exemple for port B of mpc8323 which has IRQs for

typo

> GPIOs PB7, PB9, PB25 and PB27.
>
>         qe_pio_b: gpio-controller@1418 {
>                 compatible =3D "fsl,mpc8323-qe-pario-bank";
>                 reg =3D <0x1418 0x18>;
>                 interrupts =3D <4 5 6 7>;
>                 interrupt-parent =3D <&qepic>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 fsl,qe-gpio-irq-mask =3D <0x01400050>;
>         };

You are missing #interrupt-cells and interrupt-controller properties.

With multiple new properties, this should be converted to schema first.

>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.t=
xt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> index 09b1b05fa677..829fe9a3d70c 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> @@ -32,6 +32,15 @@ Required properties:
>    "fsl,mpc8323-qe-pario-bank".
>  - reg : offset to the register set and its length.
>  - gpio-controller : node to identify gpio controllers.
> +Optional properties:
> +- fsl,qe-gpio-irq-mask : For banks having interrupt capability this item=
 tells
> +  which ports have an associated interrupt (ports are listed in the same=
 order
> +  as in QE ports registers)
> +- interrupts : This property provides the list of interrupt for each GPI=
O having
> +  one as described by the fsl,cpm1-gpio-irq-mask property. There should =
be as
> +  many interrupts as number of ones in the mask property. The first inte=
rrupt in
> +  the list corresponds to the most significant bit of the mask.
> +- interrupt-parent : Parent for the above interrupt property.
>
>  Example:
>         qe_pio_a: gpio-controller@1400 {
> @@ -42,6 +51,16 @@ Example:
>                 gpio-controller;
>           };
>
> +       qe_pio_b: gpio-controller@1418 {
> +               #gpio-cells =3D <2>;
> +               compatible =3D "fsl,mpc8323-qe-pario-bank";
> +               reg =3D <0x1418 0x18>;
> +               interrupts =3D <4 5 6 7>;
> +               fsl,qe-gpio-irq-mask =3D <0x01400050>;
> +               interrupt-parent =3D <&qepic>;
> +               gpio-controller;
> +         };
> +
>         qe_pio_e: gpio-controller@1460 {
>                 #gpio-cells =3D <2>;
>                 compatible =3D "fsl,mpc8360-qe-pario-bank",
> --
> 2.49.0
>

