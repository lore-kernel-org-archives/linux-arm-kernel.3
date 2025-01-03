Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1301E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 22:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaCoas+Vc+1c7Es7FH+h6zL6DEJ/j6QeAWFTM53KwqI=; b=Ttbfhrbu93i7efxhko+rm10eOA
	Pk6ewKFiV6K1VPGRHJILN+IjT48FFC8O1b0QWfVXTyP0zTIjAs9EEdArIdMS+hv3tCdIbMIUuawFI
	H8Hi4eRA+NpI5KhGNm8KLxGgbxmYO956NEPIxFjmnuIiH0XG7h01ZLTUaZ/OuLj7pPN1jUV/lpaDv
	ehLuWkJ3QGoA/mKwBou7DcNGNfpC05fb5TZjXwPPJliifJvaXYbcATiyNVAj35/qxOHLvfnjzHl/y
	b2tUjqxTV9aPAGXg1PgTfzjOzfhONpKrXZylYA+oKeD7aiYZCsi50l+Vdk77RUaXo0Ilq+zdGKbSu
	+gE44nDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTq8p-0000000E7mB-0x1l;
	Fri, 03 Jan 2025 22:27:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTq7Z-0000000E7gn-0zLA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 22:26:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 548675C5F65
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jan 2025 22:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F21EC4CEDD
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jan 2025 22:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735943180;
	bh=IrLd8zArhralW9vTI3bFh+RNkr+IYx1dMXqSqZpYVIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RPCszWpOIcopr9Cu41ZYLMlo3hiNUKGdfCzWeXT9doLu7fxlDBuKCT1rt06RaYSKX
	 fZQosyqeugBHiLKeE8nAZDJ/tknLW78aTTv1QI4z3s81sWW9YuHo34TF+lHvzfspDJ
	 +c4kMjCYRmbcNYNsrhIdr0i59QAru2zD0rajCzxPPln2Z2klXoQ/EZRjkhIM9n0a7I
	 AjRmSbmwDoZsQrY8F/MN1FBPN2lrAtY2r9tbrVycOtPJsn6F2GLY0jRf2UKqV7p/nH
	 KuSu+vdMbygJrTCk1804DNZK2tHFjElDFmmmzlQ9Wf+ahxEprEhA5fq3eVsWDfB/ma
	 q/RbSboPu8ezQ==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e3983f8ff40so14219855276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 14:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjmVnBoXQZHI5nMVvbH3J27CoegRFrjVvmSEH9vm6s3wetscuI+K94SXGkqt6Mn7bsfofzx9MPDZ3g7DMT2djz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4xnZekqG6TXvto0x0eIC/RSSlR1oanP5a3X8QbC4fKVlwEs1Q
	iNdYr2E/nbNwINHTxxk+nCvdTw4sQzvuVN5dvU3eZgs7wvPj5ipTv/BG3b29ue4HvVufL9fNl6k
	1mO0kIqkQouIKm+FjUtIoI2bp/Q==
X-Google-Smtp-Source: AGHT+IG4bhFPDx0r1HgPvYRnqehBcgPYDey2wR5zN/peYPDzxcv0TZ2Hgm79zPa+tud+5BHpvQIwwtwisuOjI4duhx8=
X-Received: by 2002:a05:690c:6c08:b0:6ef:4a57:fc7c with SMTP id
 00721157ae682-6f3f8115430mr380359427b3.16.1735943179575; Fri, 03 Jan 2025
 14:26:19 -0800 (PST)
MIME-Version: 1.0
References: <20250103181623.1980433-1-vincenzo.frascino@arm.com> <20250103181623.1980433-3-vincenzo.frascino@arm.com>
In-Reply-To: <20250103181623.1980433-3-vincenzo.frascino@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 3 Jan 2025 16:26:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ9y92aHUYhD9_YX8GKvZC-GioWbMr+gjcQiMA_XQ0RaQ@mail.gmail.com>
Message-ID: <CAL_JsqJ9y92aHUYhD9_YX8GKvZC-GioWbMr+gjcQiMA_XQ0RaQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: morello: Add support for common functionalities
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_142621_363155_C6D2FB97 
X-CRM114-Status: GOOD (  14.52  )
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

On Fri, Jan 3, 2025 at 12:16=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:
>
> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA.
>
> The Morello Platform (soc) and the Fixed Virtual Platfom (fvp) share
> some functionalities that have conveniently been included in
> morello.dtsi to avoid duplication.

One more thing...

> +               i2c0: i2c@1c0f0000 {
> +                       compatible =3D "cdns,i2c-r1p14";
> +                       reg =3D <0x0 0x1c0f0000 0x0 0x1000>;
> +                       interrupts =3D <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&dpu_aclk>;
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       hdmi_tx: hdmi-transmitter@70 {
> +                               compatible =3D "nxp,tda998x";

It is odd that you add this node here, but don't enable i2c. If this
is shared with fvp, then enable i2c here. If it isn't, then move this
to the soc/sdb .dts.

I'd rather see the FVP dts now rather than later so we can review how
you split things. It's a little odd not being soc.dtsi and board.dts,
but that's fine I think.

> +                               reg =3D <0x70>;
> +                               video-ports =3D <0x234501>;
> +                               port {
> +                                       tda998x_0_input: endpoint {
> +                                               remote-endpoint =3D <&dp_=
pl0_out0>;
> +                                       };
> +                               };
> +                       };
> +               };

