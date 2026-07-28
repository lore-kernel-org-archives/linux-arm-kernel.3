Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A034C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oe9UV20xRbrU+lzvVnG9jZANXjcjtMpLhecIgsxtCo=; b=3DzpC8XA/HhycY
	DVP/7n2C0j98htCkU/kIilHTC/r81eYWh6OOX/gl6jzfNLw0gDoKAzFWPJAA+UQJyE1m3uTX9e0ie
	Dw2gEw/1wVURz1FQ4j4sLM2JhGmC2ZNvmxLg/krrdJQP/YovWatETS8uaXLa09Oy5gUwB7YTmwn4G
	sayW6ZH/4vTr1z1LtneRArv5iz5I26UC5dfY8DfP6CvRn6YHUTtTAksP7xzBuMm46oG/aCUQusuLC
	KxhEC25gzPkqrdveujElt+Omakly+KBs0KrDPvOPpeWfS+pR02jx32tyNhqr1ktNGdF565VUP64gG
	rJjIqeWFEUNP2KrYdaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolCK-00000005teP-1H5B;
	Tue, 28 Jul 2026 17:02:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolCJ-00000005teF-1ps6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 17:02:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0643D43B47
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 17:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEC81F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785258150;
	bh=9oe9UV20xRbrU+lzvVnG9jZANXjcjtMpLhecIgsxtCo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=b82WnSCrWCjiiRXWQJ4BHNCDM9WM11Q5bzIpvuitixDRsOOf1B7FPKsDBcU0VdAd5
	 TNiFDU/KSlDAXVW6gvISaXu3kH0Vx5NECZHXyxUxarrtY6UNnIQI6Q4sgEsq3JSywu
	 ZsD+Ll1k5N52fgTMdiPOZIKAZzdI//FDAYmNvZWByV9jEUWq7GlPkW7gK3MucckXme
	 3VY4SI8yceU6m9fkMhogBCeEz91BxJZAy7g7SCzBjw7WxbAzxqrsClkUEjrBq/f/DV
	 T1/tIwLr3SfGEEooRAODTmQnVy6kLkBnxXW8PnMNsUxXHnDUNa59TWAIWoM40VW1H5
	 mhH4NRgl56wKw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c83acb86eso35989731fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 10:02:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrASboGx78KUPce85Oxc3s9TIK//SKoBqjhkE+ImjKYsHG7A5OOk/rBTCrhX2wf/lp1YEJPx+IByPu8mAvO9uAy@lists.infradead.org
X-Gm-Message-State: AOJu0YwyMrrw2mrFVfY8fJOf5FaKC1mIxCfZk/c+xG47/Qj9PdocoZaJ
	qbEfXbjroUMA/A4QAz53cuTnF8gjzDRgjJDqwy4diGei14w/pUQtDb9tnNGYykg5qyLnlsT1C0i
	R1RVMnNUW5RxyRKRaLwBLK7AmQSILew0=
X-Received: by 2002:a05:651c:b09:b0:39e:e995:1685 with SMTP id
 38308e7fff4ca-39f51e523a5mr6555341fa.38.1785258149154; Tue, 28 Jul 2026
 10:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com> <20260719211319.982285-5-juanmanuellopezcarrillo@gmail.com>
In-Reply-To: <20260719211319.982285-5-juanmanuellopezcarrillo@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 29 Jul 2026 01:02:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v65gfLhY3qipJrcuE51CJ2WV=oNSbFDu7QP-6VFKF3v_WA@mail.gmail.com>
X-Gm-Features: AUfX_mxwEoOQfPBDHt1Bhhdm8fNwHOj6ohky5Q9xhsCCChtpmB1_uNVjxEEhUG4
Message-ID: <CAGb2v65gfLhY3qipJrcuE51CJ2WV=oNSbFDu7QP-6VFKF3v_WA@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: allwinner: t527-orangepi-4a: add GPU
 OPP table
To: =?UTF-8?Q?Juan_Manuel_L=C3=B3pez_Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Brian Masney <bmasney@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

On Mon, Jul 20, 2026 at 5:13=E2=80=AFAM Juan Manuel L=C3=B3pez Carrillo
<juanmanuellopezcarrillo@gmail.com> wrote:
>
> Add the Mali-G57 operating points from the vendor BSP universal table
> (150/200/300/400/600 MHz) so panfrost devfreq can scale the GPU
> instead of running at the boot clock.
>
> All operating points use 920 mV: the BSP table specifies 900 mV for
> every universal OPP, but on this board the GPU rail (AXP717 DCDC2,
> vdd-gpu-sys) is a fixed 920 mV supply, so the OPP voltage states the
> actual rail value and voltage transitions are no-ops.  The higher
> speed-bin points of the BSP (648-792 MHz) are not included: they are
> gated by a SID efuse bin and need pll-gpu as a live parent.
>
> Depends on the sun55i-a523 GPU clock divider fix (the OPP rates are
> only produced correctly with the cycle-masking divider model);
> validated on hardware with the Mali cycle counter: 149/199/300/399/597
> MHz measured under load, thermal-emulation throttling included.
>
> Signed-off-by: Juan Manuel L=C3=B3pez Carrillo <juanmanuellopezcarrillo@g=
mail.com>
> ---
>  .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> index 055be86e5..0fd73a1bb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> @@ -30,6 +30,35 @@ ext_osc32k: ext-osc32k-clk {
>                 clock-output-names =3D "ext_osc32k";
>         };
>
> +       gpu_opp_table: opp-table-gpu {

The table should be in the .dtsi file. The OPP table reflects the
requirements of the SoC, not the board. Any board specific adjustments
are done later.

> +               compatible =3D "operating-points-v2";
> +
> +               opp-150000000 {
> +                       opp-hz =3D /bits/ 64 <150000000>;
> +                       opp-microvolt =3D <920000>;

Please use the <min nominal max> variant to specify a voltage range.
The minimum and nominal voltages should be the one from the BSP table.
You can set the maximum arbitrarily, but 920 mV should be fine to cover
this board.

> +               };
> +
> +               opp-200000000 {
> +                       opp-hz =3D /bits/ 64 <200000000>;
> +                       opp-microvolt =3D <920000>;
> +               };
> +
> +               opp-300000000 {
> +                       opp-hz =3D /bits/ 64 <300000000>;
> +                       opp-microvolt =3D <920000>;
> +               };
> +
> +               opp-400000000 {
> +                       opp-hz =3D /bits/ 64 <400000000>;
> +                       opp-microvolt =3D <920000>;
> +               };
> +
> +               opp-600000000 {
> +                       opp-hz =3D /bits/ 64 <600000000>;
> +                       opp-microvolt =3D <920000>;
> +               };
> +       };
> +
>         leds {
>                 compatible =3D "gpio-leds";
>
> @@ -116,6 +145,7 @@ &gmac1 {
>
>  &gpu {
>         mali-supply =3D <&reg_dcdc2>;
> +       operating-points-v2 =3D <&gpu_opp_table>;

Same here. This should be in the .dtsi file. It should be fine to add it
right now since all boards have the supply added.


ChenYu

>         status =3D "okay";
>  };
>
> --
> 2.47.3
>

