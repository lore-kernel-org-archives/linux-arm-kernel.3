Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08915CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 18:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13jSlO/Bke3l/ttAN8PKkd7+UKw2pFrdG+76r30guJ8=; b=D6/RwAhqJTta4m
	gKqRqylVfaFrzpyfqxckv9ggYTTZmqHWXdvTcWXGbPvjnP8MTx46P+ZHW/oJbL4yyUsfGtJEFw9ij
	dTutuhz7sUX3aQZ+9rWLaTi82C3TMMNgbqgPbjQB+NlsCOsQrfVNZtR3916qn/hQahVGWmaSc2Cb/
	avABPlBjFjmXII8EU5MNOfJfD9wEGIp2OtuLyNRLjLuq8CSTd99i0JG1WFvYimCdpJCEivfLGymjH
	o+UWwMTWnnJC2NFQaeQR81V740NOcjX0x8ke1gl7+a0KYOZNBIlwx92BkXKFflASFNTcePP2oYXC+
	d40EA5nK9Z7jjxQTsXUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM8z8-0000000BNuG-345F;
	Sun, 10 May 2026 18:34:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM8z5-0000000BNtR-1xPe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 18:34:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F91E444EF
	for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 18:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53031C2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 18:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778438074;
	bh=rCvvuIRJS+zFWu0wK8pstHfaQ1AMphYIDSQl2Y+byqE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=s4lpHipVlmcEzZSCYYGHdus6oKBjZlz13HekGY9aVDqJ7LAMeEDcfAuwwPHdAWGFq
	 jNFHg/OwBZNrITo8ruAaz7f4Kwd33A19ifMDJytC11YRCZGzgueM31RwWoW01VRMJ7
	 LnxHPM0A+InaVfuPTmhUe19cjZYxszuxMXbNbyq3CppwEmrePzL789ll2kSZ1jcR/d
	 67rxMQxKTOS1QVfE/jcYzQtRyhp3Aqgvzoa/CaiAGJXkN0chM3yWJMX0p9CmnMEESd
	 ybqA3zFYUSQc524Us2prndplbV/4FqMI0QH19DSBwlToKtEqAtrkCHN9kftuJ4LGWh
	 dqM73k2p9nn5Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3938cc204a7so29097761fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 11:34:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9lWmQKoSeW+g6DW85sAHPUxxc7bOIdvZBIY9vXJSqCJq+G7L/3DO8pqjBnR0NzRa2zzFR8YTe8BmVO2NFygL/Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzoR/Mmcjaz7vZ7yg2Q2LKzG0DsffGYrZfkrjgBz6oplJv8ldu7
	xa58CfeAFxql5vsUV5QY/kVkj3KZcg6ASW/V+7t9JvryS2PIazNEsJpO25tqJnuh7nQSYO+y72l
	/tsGFhkAnlCxm7QrZCmvMZDPO+OCJp4A=
X-Received: by 2002:a2e:a273:0:b0:38c:de21:3e14 with SMTP id
 38308e7fff4ca-393c41c97demr52554991fa.19.1778438072557; Sun, 10 May 2026
 11:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl> <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-3-4f6b0f4000fb@mmpsystems.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 11 May 2026 02:34:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v64k2SvoGjNGsB=mQdc5U75mPJUJMZASqiF=DDN5QCNt8A@mail.gmail.com>
X-Gm-Features: AVHnY4KOBMpyIY8koIw1JHFB7GLvF9QtogbHPVXZ-IY03YwC_1iRGcw45u_wThM
Message-ID: <CAGb2v64k2SvoGjNGsB=mQdc5U75mPJUJMZASqiF=DDN5QCNt8A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: a523: add gpadc node
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maksim Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_113435_579337_8510430D 
X-CRM114-Status: GOOD (  15.74  )
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

On Sun, May 10, 2026 at 9:02=E2=80=AFPM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Describe high speed timer block on Allwinner D1S-T113.
>
> Tested on Radxa Cubie A5E:
> - 2 connected channels are showing voltages in agreement with
>   schematics.
>         BOOT-SEL-ADC ~500mV
>         BOM-ADC ~1800mV
> - 3rd channel exposed on 40pin header is showing correct voltages when
>   connected to known voltage source.
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 5afa8d92acbf..f6c5cae5b23a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -340,6 +340,18 @@ ledc: led-controller@2008000 {
>                         status =3D "disabled";
>                 };
>
> +               gpadc: adc@2009000 {
> +                       compatible =3D "allwinner,sun55i-a523-gpadc",
> +                                    "allwinner,sun20i-d1-gpadc";
> +                       reg =3D <0x2009000 0x400>;
> +                       clocks =3D <&ccu CLK_BUS_GPADC0>, <&ccu CLK_GPADC=
0>;
> +                       clock-names =3D "bus", "mod";
> +                       resets =3D <&ccu RST_BUS_GPADC0>;
> +                       interrupts =3D <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +                       status =3D "disabled";
> +                       #io-channel-cells =3D <1>;

status should always be the last property.

> +               };
> +
>                 wdt: watchdog@2050000 {
>                         compatible =3D "allwinner,sun55i-a523-wdt";
>                         reg =3D <0x2050000 0x20>;
>
> --
> 2.43.0
>
>

