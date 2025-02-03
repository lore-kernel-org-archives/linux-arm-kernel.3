Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF032C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsZHrLNRAru9wyA76hL7eTkNNc8V3WAtjtpBsrrxZXk=; b=RbYwoLxz6ZMdmViZ0VpYb4EKT6
	G3ZQCzeW9u4w9mbF7gXTmWeuC7bT0S2MY/ff4wKl1sdRIKN9+b/Xeu+xFBZptPsA7FJ886fzpNQzN
	d7kvGfMhdKyAiL7l0ZxUneXv31dZuLAoeRSps+cx7ry3J9ktRiCeZcyY73W38pZPFaLSSe9Xalpik
	Gg+mLA5Ord3hP9EV3dSS3/JCSsF3VcV9uJClKHf3PY8R8NCf+6j7D44BHhaq4WzqPFRW6SSKwc5d3
	XHBkOv1qaGAT5JfJoc6dBG3cFFENwZfBUod5/cZ57LNaq+nmDnfhX5kOSflyLhT994ovXpVeOfMqQ
	pzN4EaeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1g3-0000000GMU5-13eT;
	Mon, 03 Feb 2025 19:00:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1OY-0000000GIgN-1WKS;
	Mon, 03 Feb 2025 18:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D127C5C6801;
	Mon,  3 Feb 2025 18:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6448EC4CEE6;
	Mon,  3 Feb 2025 18:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738608125;
	bh=Toyklm+XvaNto6avaLF3il6Lo9SG4Al2VivOzAWEhBA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CYjQPLwOuN4+buDEz8f0HDCp/ChYTLnHpGnFDX/gx1Eqa/xzO/ZaGilESvXSPBNvA
	 JXEOVDc/1vkCqufa9GPI/QjkOBrBdzCk7RvMwEc9SBcWBuVKe8bRscWfGK8TT0BKOM
	 ZDRKmC5bh8goUX6fizwaJMdhvacl4x/lzkl1GmC3jnRGbcRv2QxhITZnwMnMKCCUe9
	 Elap3n7RawYneilGzA3xnHciL1RrSQU1svdb6E0WMzIdgnAzSnkGmdToS7Ci5MCVwZ
	 YKK7aqjk5e/yijBuH6D2j4pE97htt+g8xenG3otLZ975UfPMiQY23ZL5pZjtSRQ2Hj
	 VZod7/n3yjHmQ==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7157cf352so427187266b.0;
        Mon, 03 Feb 2025 10:42:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNkNga/CgddGeU7oq5L1liuk9Ec7pVZ6ynpJLGFJQctQReDteJph3HoKMUAIZRLwZ3BfV1skwjxCdaR56eOAws@lists.infradead.org, AJvYcCUUSkj9lmPlUgeNjgi3AQyPirhI/Ag/bX6OGdophpApe06BH4tcbf7764uk7nQmCdXw5S5FHI+38aNvDNX7uF0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyiz8258zaITlhQQY+lnLo3ctDowq0tNsiOjMAgJc20Eup40lhf
	OCrzpSvuAg9uazB5iL9DBFzrTTUg+ZMu2lxKz23uabvwR37ycBrvbBkir2eJrlIGbBXVIC5V63e
	wN3ttPz3orQriizXUe7FsQ+ZQAA==
X-Google-Smtp-Source: AGHT+IE9kiXQvZ7ftsSHwBcr32yIQHGbZmyGPLoubj6dWwKrmaLAps8M+hQ064TtgpXxV9LCGeAqE2wAHEG3g5AEDTE=
X-Received: by 2002:a17:907:97cc:b0:ab3:992d:d98d with SMTP id
 a640c23a62f3a-ab7480e1706mr46330666b.0.1738608123925; Mon, 03 Feb 2025
 10:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org>
In-Reply-To: <20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 3 Feb 2025 12:41:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKTEpq_-cfMosSWntTbMM6d_y-BWMrXHmUaQ3=9u90fyw@mail.gmail.com>
X-Gm-Features: AWEUYZkGUgkQ4QDx_tXgQwyLVeliiYMhm3XTEfnUL1V8_26vM189Y0lS7Edpjfs
Message-ID: <CAL_JsqKTEpq_-cfMosSWntTbMM6d_y-BWMrXHmUaQ3=9u90fyw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Introduce more nodes to EN7581 SoC evaluation board
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_104206_488479_C3957514 
X-CRM114-Status: GOOD (  13.65  )
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

On Sat, Feb 1, 2025 at 8:40=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.org=
> wrote:
>
> Add the following nodes to EN7581 SoC and EN7581 evaluation board:
> - clock controller
> - rng controller
> - pinctrl
> - i2c controllers
> - spi nand controller
>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  arch/arm64/boot/dts/airoha/en7581-evb.dts |  8 +++
>  arch/arm64/boot/dts/airoha/en7581.dtsi    | 90 +++++++++++++++++++++++++=
++++++
>  2 files changed, 98 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/=
dts/airoha/en7581-evb.dts
> index cf58e43dd5b21dbf4f64e305a4b4a2daee100858..1126da4b795f5d5df9725ec4d=
75cd9353b011710 100644
> --- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
> +++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
> @@ -24,3 +24,11 @@ memory@80000000 {
>                 reg =3D <0x0 0x80000000 0x2 0x00000000>;
>         };
>  };
> +
> +&i2c0 {
> +       status =3D "okay";
> +};
> +
> +&snfi {
> +       status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts=
/airoha/en7581.dtsi
> index 55eb1762fb11364877695960f5a2d3e42caf8611..b1cf650efd78c6c20d19e7f18=
c204cf5862215c0 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -2,6 +2,7 @@
>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/en7523-clk.h>
>
>  / {
>         interrupt-parent =3D <&gic>;
> @@ -150,5 +151,94 @@ uart1: serial@1fbf0000 {
>                         interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
>                         clock-frequency =3D <1843200>;
>                 };
> +
> +               scuclk: clock-controller@1fa20000 {
> +                       compatible =3D "airoha,en7581-scu";
> +                       reg =3D <0x0 0x1fb00000 0x0 0x970>;
> +                       #clock-cells =3D <1>;
> +                       #reset-cells =3D <1>;
> +               };
> +
> +               rng@1faa1000 {
> +                       compatible =3D "airoha,en7581-trng";
> +                       reg =3D <0x0 0x1faa1000 0x0 0xc04>;
> +                       interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               system-controller@1fbf0200 {
> +                       compatible =3D "syscon", "simple-mfd";
> +                       reg =3D <0x0 0x1fbf0200 0x0 0xc0>;
> +
> +                       en7581_pinctrl: pinctrl {
> +                               compatible =3D "airoha,en7581-pinctrl";
> +
> +                               interrupt-parent =3D <&gic>;
> +                               interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL=
_HIGH>;
> +
> +                               gpio-controller;
> +                               #gpio-cells =3D <2>;
> +
> +                               interrupt-controller;
> +                               #interrupt-cells =3D <2>;
> +                       };
> +               };
> +
> +               i2cclock: i2cclock@0 {

clock-20000000 for node name.

A unit-address without 'reg' is not valid. Test this with W=3D1.


Rob

