Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E45C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 18:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DCgZcFjcvK8T5Cm6O3XFlGGk14rIXlqdnUMxG1OnmY=; b=lttvSnZDsRl/Qo+Ck1YsSgVerr
	lNZIxUkk9mXgmxLnTuMUocChbsoc9H6fPYNsIj93DdixN22xVTz5vU/yo1NPzOHsT/7eaZeHKb6Jr
	mv94UV4cpWwwWVJ3p5Uf04RdZEGu/spelEbB1CS7f9iz5u+z/nMGV2jrEjjvEtHYP47sk3SrnBrvq
	FnJ+uItSjt+XASFlyLSYxR1BzKzaq0mUHWUACI4lYQXCEcMr+7so8wlQxKzcLb+3P2DCWGLHRQjH+
	2CgLAgCgfgTl5eLDBUZDG+L4YWR5IdMUR6RuoXbo6S937CwuVGYUxaYqcSnWBQwj1Ay5DEI/YeUAL
	CXwmo/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0r2-00000008KOg-25Cc;
	Mon, 05 May 2025 18:47:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0nF-00000008JjJ-3d2x;
	Mon, 05 May 2025 18:43:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4FD7FA4C6B4;
	Mon,  5 May 2025 18:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B874C4CEF2;
	Mon,  5 May 2025 18:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746470636;
	bh=tF04Fns79sH1yaJ5H8T/Hh5MDrmddyRBb/f3XQX4pgQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uM5uAJcP15BVWhuXYww/5TrKz+DfcC4Wt8xaxG7HsFpPtzKQfbc6udt6k+YnHlgKN
	 5SN9QZm8uO3QVhWg9/l5fZtVkO1yL9OkEe8D12NEM6fEMA5lzBFAyQ0h/81PJ0S0hX
	 ihSnE9ZT/VhKnO1I0dLPoOtlu/z7Zg2HBZO2zymhVW2q/BTYfZFH/mlguYwIKWF6WY
	 FacKgX9MVq1Z5yaEvjXqujbOxlsyBEESK0LYZqNJFrbyKdb9/YWanCoAf9U2W6HEMO
	 xqGSvNKKruYaDI75hjoTYS5pbyG9jxSrx9nL/YGCQ1/tuzUYEI24eDhOMhmPBHzXxO
	 hP/CRbTUM54RQ==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac7bd86f637so1068684566b.1;
        Mon, 05 May 2025 11:43:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9f2Vxn2c911N0y08y0j3zh++8mSaYsccgvgImb/G7oCuSLgdfjVyRHnQ1gVN7PtLz62oXb/XrMxdFPmwy9zQ=@lists.infradead.org, AJvYcCV2LRaUeToBBNwz7AuxUcHPTVgmLUooRjxHRySB/bfW5DL27HQ4Ybi4RHD7tlZJQXyW3LNk/Ae2K5jFL0SK@lists.infradead.org, AJvYcCXOGUF08W3q78BQu3muRzs0pnBojNYhyFxrs7IdUQRV8MtQJqmGYN2gxS91mP1OtuOm+QVo6F/kSo1hZOVo1Qcm6A==@lists.infradead.org, AJvYcCXofEhXccm5NTAzddBW273UL/6rX3/MdC4ZhtzFP7a/Yidu/cXEcb19MphM6TJ7C9/8LmQqM1hmFeBkGzYx7IM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXmfU6QG/jgki6hNaS7Su2mNbkCMqvmU4MCnNu+bQGJre4ft+T
	0au2x1LpSRthuEZy3QaBGYN2lD3Lq78ClVC18Lbqowv69UPf2J96lM/c1bgLpGAFI/+ld+rAeKW
	PNiUUvCZ9iFsMW5qH6TIXQ+wRSQ==
X-Google-Smtp-Source: AGHT+IE07Ly6dyu8Y+aF9BlZdIf7+P37J2qLB07/RiqfMFZ0ipjDBLk74RTbDrbdYckFkuO0cf7wPwVCCZB9ROIhhI4=
X-Received: by 2002:a17:906:c144:b0:acb:2050:c105 with SMTP id
 a640c23a62f3a-ad1d2f5cadbmr46457866b.21.1746470634738; Mon, 05 May 2025
 11:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org> <20250410-dt-cpu-schema-v2-11-63d7dc9ddd0a@kernel.org>
In-Reply-To: <20250410-dt-cpu-schema-v2-11-63d7dc9ddd0a@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 May 2025 13:43:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLGHQ4YBqGGEdyirtgaBnJKRxOxOKTaQLv2jm-g8TNndA@mail.gmail.com>
X-Gm-Features: ATxdqUH6daJs7nOd8Y48rS3eP2-1poIs0MGdxfDe75Fd100QvIPr8Ytk27ZE1_w
Message-ID: <CAL_JsqLGHQ4YBqGGEdyirtgaBnJKRxOxOKTaQLv2jm-g8TNndA@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] arm64: dts: amlogic: Drop redundant CPU "clock-latency"
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_114358_051393_7A8F8948 
X-CRM114-Status: GOOD (  15.07  )
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

On Thu, Apr 10, 2025 at 10:50=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:
>
> The "clock-latency" property is part of the deprecated opp-v1 binding
> and is redundant if the opp-v2 table has equal or larger values in any
> "clock-latency-ns". Add any missing "clock-latency-ns" properties and
> remove "clock-latency".
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Ping!

>  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts             | 4 ----
>  arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts         | 4 ----
>  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts             | 4 ----
>  arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts               | 4 ----
>  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts            | 4 ----
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi                   | 1 +
>  arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts | 6 ------
>  arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi             | 2 ++
>  arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi      | 6 ------
>  arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi          | 6 ------
>  arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi       | 6 ------
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts    | 6 ------
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi            | 6 ------
>  arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts        | 6 ------
>  arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi             | 2 ++
>  arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi              | 6 ------
>  arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi              | 4 ----
>  arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi           | 4 ----
>  arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts        | 4 ----
>  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi             | 4 ----
>  arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts | 4 ----
>  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts              | 4 ----
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi                    | 1 +
>  23 files changed, 6 insertions(+), 92 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm=
64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> index 9aa36f17ffa2..d0a3b4b9229c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> @@ -267,28 +267,24 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu2 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu3 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &ethmac {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch=
/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> index 952b8d02e5c2..4353485c6f26 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> @@ -220,28 +220,24 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu2 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu3 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm=
64/boot/dts/amlogic/meson-g12a-sei510.dts
> index 52fbc5103e45..f39fcabc763f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -314,28 +314,24 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu2 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu3 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64=
/boot/dts/amlogic/meson-g12a-u200.dts
> index 5407049d2647..b5bf8ecc91e6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> @@ -407,28 +407,24 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu2 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu3 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &clkc_audio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/ar=
m64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index 01da83658ae3..5ab460a3e637 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -263,28 +263,24 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu2 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu3 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boo=
t/dts/amlogic/meson-g12a.dtsi
> index 543e70669df5..deee61dbe074 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -62,6 +62,7 @@ cpu_opp_table: opp-table {
>                 opp-1000000000 {
>                         opp-hz =3D /bits/ 64 <1000000000>;
>                         opp-microvolt =3D <731000>;
> +                       clock-latency-ns =3D <50000>;
>                 };
>
>                 opp-1200000000 {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dt=
s b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
> index adedc1340c78..415248931ab1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
> @@ -76,42 +76,36 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu100 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu101 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu102 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu103 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &pwm_ab {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm=
64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> index 8e9ad1e51d66..8ecb5bd125c1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> @@ -14,6 +14,7 @@ cpu_opp_table_0: opp-table-0 {
>                 opp-1000000000 {
>                         opp-hz =3D /bits/ 64 <1000000000>;
>                         opp-microvolt =3D <761000>;
> +                       clock-latency-ns =3D <50000>;
>                 };
>
>                 opp-1200000000 {
> @@ -54,6 +55,7 @@ cpub_opp_table_1: opp-table-1 {
>                 opp-1000000000 {
>                         opp-hz =3D /bits/ 64 <1000000000>;
>                         opp-microvolt =3D <731000>;
> +                       clock-latency-ns =3D <50000>;
>                 };
>
>                 opp-1200000000 {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/a=
rch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> index 92e8b26ecccc..39011b645128 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> @@ -155,42 +155,36 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu100 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu101 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu102 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu103 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &ext_mdio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/=
arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> index 54663c55a20e..1b08303c4282 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> @@ -263,42 +263,36 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu100 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu101 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu102 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu103 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &ethmac {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/ar=
ch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> index 48650bad230d..fc737499f207 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> @@ -51,42 +51,36 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu100 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu101 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu102 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu103 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &pwm_ab {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b=
/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> index e21831dfceee..d5938a4a6da3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> @@ -281,42 +281,36 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu100 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu101 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu102 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu103 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  /* RK817 only supports 12.5mV steps, round up the values */
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi b/arch/ar=
m64/boot/dts/amlogic/meson-g12b-odroid.dtsi
> index 7e8964bacfce..3298d59833b6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
> @@ -227,42 +227,36 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu100 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu101 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu102 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu103 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu_thermal {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arc=
h/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> index fc05ecf90714..1e5c6f984945 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> @@ -259,42 +259,36 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu100 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu101 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu102 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu103 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu_thermal {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm=
64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> index 44c23c984034..19cad93a6889 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> @@ -14,6 +14,7 @@ cpu_opp_table_0: opp-table-0 {
>                 opp-1000000000 {
>                         opp-hz =3D /bits/ 64 <1000000000>;
>                         opp-microvolt =3D <731000>;
> +                       clock-latency-ns =3D <50000>;
>                 };
>
>                 opp-1200000000 {
> @@ -59,6 +60,7 @@ cpub_opp_table_1: opp-table-1 {
>                 opp-1000000000 {
>                         opp-hz =3D /bits/ 64 <1000000000>;
>                         opp-microvolt =3D <771000>;
> +                       clock-latency-ns =3D <50000>;
>                 };
>
>                 opp-1200000000 {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm6=
4/boot/dts/amlogic/meson-g12b-w400.dtsi
> index a7a0fc264cdc..9b6d780eada7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> @@ -213,42 +213,36 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table_0>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu100 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu101 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu102 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu103 {
>         cpu-supply =3D <&vddcpu_a>;
>         operating-points-v2 =3D <&cpub_opp_table_1>;
>         clocks =3D <&clkc CLKID_CPUB_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi b/arch/arm6=
4/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> index a3463149db3d..9be3084b090d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> @@ -147,28 +147,24 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU1_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu2 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU2_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu3 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU3_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/a=
rm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> index 40db95f64636..538b35036954 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> @@ -185,28 +185,24 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU1_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu2 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU2_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu3 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU3_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &ext_mdio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arc=
h/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> index 5d75ad3f3e46..a3d9b66b6878 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> @@ -51,28 +51,24 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU1_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu2 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU2_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu3 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU3_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &pwm_AO_cd {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm=
64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index ad8d07883760..c4524eb4f099 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -250,28 +250,24 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU1_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu2 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU2_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu3 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU3_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &ext_mdio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dt=
s b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> index 537370db360f..5daadfb170b4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> @@ -64,26 +64,22 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU1_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu2 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU2_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu3 {
>         cpu-supply =3D <&vddcpu_b>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU3_CLK>;
> -       clock-latency =3D <50000>;
>  };
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm6=
4/boot/dts/amlogic/meson-sm1-sei610.dts
> index 37d7f64b6d5d..024d2eb8e6ee 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> @@ -359,28 +359,24 @@ &cpu0 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu1 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU1_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu2 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU2_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &cpu3 {
>         cpu-supply =3D <&vddcpu>;
>         operating-points-v2 =3D <&cpu_opp_table>;
>         clocks =3D <&clkc CLKID_CPU3_CLK>;
> -       clock-latency =3D <50000>;
>  };
>
>  &ethmac {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot=
/dts/amlogic/meson-sm1.dtsi
> index 97e4b52066dc..966ebb19cc55 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -100,6 +100,7 @@ cpu_opp_table: opp-table {
>                 opp-1000000000 {
>                         opp-hz =3D /bits/ 64 <1000000000>;
>                         opp-microvolt =3D <770000>;
> +                       clock-latency-ns =3D <50000>;
>                 };
>
>                 opp-1200000000 {
>
> --
> 2.47.2
>
>

