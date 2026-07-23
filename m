Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACBCC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 18:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+Q2l/9DglftLlxBwkGcRKOjRutm09rEufhy/DObvx0=; b=RDjvNQNA1QhxO1
	O3u/G1tIgEo3K2NjYjozdA3s2vwClrxPy25yFUzS9wzeqNs+t4YdJCoPpNji5YChkMroaFl6KOktB
	HfkIpLh78R/Se6KpCelgZ8dW/n2/y+xD8lcCXWiHxxc755K36SMirsvKFZO9xiHKTD/w9yxdQHW/y
	wLtlO+SBPc1vo6bEjahRfnCG5ObPGnAM0FMannrHLVuEGKSoXaWnW4xwaKa5aD1AqoaTLJX5lh8pl
	16WThU6y80TVPyVXYYtYxSEssYTMv2HljMVa8Ermdz3ZcqxwjksRfguQmBiVGMbVQ7Rcggp17Ur5X
	JAviU/UniQ7yyN841P9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxQS-0000000EqGl-0qmR;
	Thu, 23 Jul 2026 17:41:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmxQR-0000000EqGZ-1Frt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:41:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B6B2B4342E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B36B1F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784828498;
	bh=N+Q2l/9DglftLlxBwkGcRKOjRutm09rEufhy/DObvx0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=CvT2n3xNFNVg9kNzBQtu0K6H5skKlY/uwaPprwZvvJcrPHZaIEPTrLSc/Tq+W8jud
	 yMA33SOf0trvPX8OkjO1CWVQdf2gN//z42mkJWzUBS0ySiR3SX0PVbkzrLoXw/20Kw
	 UIAvZ8Y2a31KbIYrtEldqAvstOlY0kWBNq96JOYDOIfOyCwxSEF7o9KNalwCYaR50B
	 p9bwgZ7kcwUEWjK0WN6v1RtOeQDJqa4QSJjbX473H9XKtOEmg+rQxMprZMTW3LADeW
	 Lpa8QBnjMBiVK0Igmr9skGXOq3bPnOoHZLVi5se3Syv/P228Hezg/l9wLIxOd5vIy0
	 82VqNKmMRFd2w==
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e9d7464b71so420175a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqU100RPgZRPmLeFFLZpHc/moj3UGxnqK41LXHY0d/Qtx7GmNk68z78ZJj8W5fv6IcOA9Sj0mR5G5x+cLzoH2P9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd1s0iMoWJYernUX6oGpBAe0m2zHGv212SqYXZ4/4ee6GlxPtr
	GcMf0AX+Sh/u7BKBe/Lu2Oj99Ae8VMaD0Av6wZgJd787XJMnNuzxzXO3trmTPBTH1NktHjbCE+z
	niAjp8Pj1ih/LPSd5qKHOKp1SQGYB2qc=
X-Received: by 2002:a05:6808:180b:b0:496:daf:8709 with SMTP id
 5614622812f47-4ab352fcfd5mr1725016b6e.17.1784828490837; Thu, 23 Jul 2026
 10:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260722233604.3001063-1-utilityemal77@gmail.com> <20260722233604.3001063-3-utilityemal77@gmail.com>
In-Reply-To: <20260722233604.3001063-3-utilityemal77@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 24 Jul 2026 01:41:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v666_Kf8+zMukQ1CFydK61P-v-=gPg4Bqmr-QaL45i6Fyg@mail.gmail.com>
X-Gm-Features: AUfX_mxiGIwd1DR_-imghumxMZEIIVSDAtRpqxp4hP74t3UviUvfCAjTiBCIbkk
Message-ID: <CAGb2v666_Kf8+zMukQ1CFydK61P-v-=gPg4Bqmr-QaL45i6Fyg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: allwinner: a523: add IR receiver nodes
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
> The A523 has two CIR receivers, both compatible with the A31 CIR: one
> in the CPUX domain, clocked from the main CCU, and one in the RTC
> power domain, clocked from the R-CCU.
>
> Add nodes for both instances, disabled by default. Since the RX signal
> of each instance can be routed to more than one pin, boards with an IR
> receiver are expected to add the pinctrl properties next to where they
> enable the node. Keep the PL11 pin description in the dtsi, as boards
> commonly use that pin for the RTC domain instance.
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index ca6a16807049..c2de662140ce 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -327,6 +327,17 @@ ccu: clock-controller@2001000 {
>                         #reset-cells =3D <1>;
>                 };
>
> +               ir: ir@2005000 {
> +                       compatible =3D "allwinner,sun55i-a523-ir",
> +                                    "allwinner,sun6i-a31-ir";
> +                       reg =3D <0x02005000 0x400>;
> +                       interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_IR_RX>, <&ccu CLK_IR_RX>=
;
> +                       clock-names =3D "apb", "ir";
> +                       resets =3D <&ccu RST_BUS_IR_RX>;
> +                       status =3D "disabled";
> +               };
> +
>                 ledc: led-controller@2008000 {
>                         compatible =3D "allwinner,sun55i-a523-ledc",
>                                      "allwinner,sun50i-a100-ledc";
> @@ -927,6 +938,23 @@ r_i2c_pins: r-i2c-pins {
>                                 allwinner,pinmux =3D <2>;
>                                 function =3D "r_i2c0";
>                         };
> +

Please add /omit-if-no-ref/.

> +                       r_ir_rx_pin: r-ir-rx-pin {

There are two pin mux possibilities for r-ir-rx. Please name it accordingly=
,
like "r-ir-rx-pl-pin".

> +                               pins =3D "PL11";
> +                               allwinner,pinmux =3D <2>;
> +                               function =3D "s_cir_rx";
> +                       };
> +               };
> +
> +               r_ir: ir@7040000 {
> +                       compatible =3D "allwinner,sun55i-a523-ir",
> +                                    "allwinner,sun6i-a31-ir";
> +                       reg =3D <0x07040000 0x400>;
> +                       interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_=
R_IR_RX>;
> +                       clock-names =3D "apb", "ir";
> +                       resets =3D <&r_ccu RST_BUS_R_IR_RX>;
> +                       status =3D "disabled";
>                 };
>
>                 pck600: power-controller@7060000 {
> --
> 2.54.0
>

