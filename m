Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374C7C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07uegK3I4MlPqYMvRtRYTb9gbGlLPScNbHHawzZqfdw=; b=uTy6Q7gD76dGpw
	vsouOq+Mzc6pyRp5G571TmPamrWambopxC1jUzNc3Oz5nzhnGEdxKe1MAriQGDzITD3/8qFcRJC0C
	x3rEY9eWarzktj5S6e4dDPdxK8Ak0/QMwX9GeyYtu5Wv5X2r6Cslc4W39YAaj+Dv44J8XSKylLhtI
	DNo95ijNVcIzqtdH2gX8tbbzWlgQW1rpRd0JK4MPQ67VWnPSjW8UzWgHyl+Vfw/IthglMYl/j8bzA
	c1X36aBI5xLR7SPyfnVFdT8ITpFpchtZjr2x54iyyZXEbJUSHB0vM3TUfR69jYqP93lp9eVI7jWkK
	VIfqFE4XtUcEhwCVGhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxRF-0000000EqOj-1TbI;
	Thu, 23 Jul 2026 17:42:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxRE-0000000EqOW-1ltT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:42:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA70C42E1A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF041F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784828547;
	bh=07uegK3I4MlPqYMvRtRYTb9gbGlLPScNbHHawzZqfdw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Ip4J6RF16Uye1Tw8+z96bCAEAeThKJ7KqSePeGmcropPHJcQR+EFKC136aLXj+i30
	 Wev9FzBXyDD3QulpM1UdYB0lIEW4N7Xj7rP7vUeVEypUQ79ptgNcvHhwIMwEk1c/WH
	 eiUYGwe+xCLY9otxhumjOGTAySXYnYhWR+4pO0FKyIzd8fuFK7Fx5wvFTNBpK40KA5
	 hMUCefALjsagYU9C7/jjfspKiQqJcTiQL4vuVnpcUS9gCCUTlSfUbIBgGH1e4SFtT5
	 OFmlhsWXf/rbEylypLAHwgDuqeS3rM/yTL7yKnpmRIu2a+WvbEVcWVrGoPlXigLy31
	 qnegr+JxrCTHQ==
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-497e6956acfso486560b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:42:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqC9G1X6Pz0T3Rkqd061XcS2MH73dBM5D/mLbcRHNMPvHpE/LPUpUPYJ4l8O6l9HnH2oAn9GcvYLVhgqff3XUBc@lists.infradead.org
X-Gm-Message-State: AOJu0YwcLDGXVOzDnXTsRNTFxINh7R4cq7EGspogZE0PH5RTzq6x8EjC
	Zz/t7+MNbtBkfabMzOe7podxVpKOash/OP2yN94gQDy3WNsRa++F4HXlMKASBCAmLpF3z66RNii
	l4wvZZF2E9BoseGQAXFlsL069a1Tq86M=
X-Received: by 2002:a05:6808:3190:b0:495:ca1b:7865 with SMTP id
 5614622812f47-4ab3842194fmr1564489b6e.11.1784828539225; Thu, 23 Jul 2026
 10:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260722233604.3001063-1-utilityemal77@gmail.com> <20260722233604.3001063-5-utilityemal77@gmail.com>
In-Reply-To: <20260722233604.3001063-5-utilityemal77@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 24 Jul 2026 01:42:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v65zjkXyyrK5U62QsWEWSgG+9zuEKAi-Ekxd5OehBVXTWg@mail.gmail.com>
X-Gm-Features: AUfX_my2HTBZkhl39VV1Ephb61n1qX3oao7Ket2MbKBRA-ze570sxZ63vDegmvs
Message-ID: <CAGb2v65zjkXyyrK5U62QsWEWSgG+9zuEKAi-Ekxd5OehBVXTWg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: allwinner: a523: enable IR on the
 Avaota A1
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2026 at 7:36=E2=80=AFAM Justin Suess <utilityemal77@gmail.c=
om> wrote:
>
> From: Andre Przywara <andre.przywara@arm.com>
>
> The Avaota A1 board has an IR receiver chip on the PCB (next to the
> Ethernet jacks), wired to the PI8 pin on the SoC.
>
> Add the pin description to the PIO DT node, and enable the CIR receiver
> in the main power domain.
>
> Tested on the board with evtest and some random TV remote control.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

You need to add your own Signed-off-by, since you are resending other
people's work.

ChenYu


> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 7 +++++++
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index c2de662140ce..219fd76a4710 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
>                                 bias-disable;
>                         };
>
> +                       /omit-if-no-ref/
> +                       ir_rx_pin: ir-rx-pin {
> +                               pins =3D "PI8";
> +                               allwinner,pinmux =3D <3>;
> +                               function =3D "cir_rx";
> +                       };
> +

This hunk should be in the .dtsi patch. And there are two pin mux
possibilities for ir-rx. Please name it accordingly, like "ir-rx-pi-pin".

ChenYu

>                         /omit-if-no-ref/
>                         ledc_ph_pin: ledc-ph-pin {
>                                 pins =3D "PH19";
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/ar=
ch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index 474354fbfcec..994f1e4f0ce7 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -100,6 +100,12 @@ &gpu {
>         status =3D "okay";
>  };
>
> +&ir {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&ir_rx_pin>;
> +       status =3D "okay";
> +};
> +
>  &ledc {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&ledc_ph_pin>;
> --
> 2.54.0
>

