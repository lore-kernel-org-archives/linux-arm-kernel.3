Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EA3FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsO26hIfpoJ3PS5dIknQJBcgNBNhtT03BHLQPa/RWgA=; b=B7Ec/PiYGh/FN/
	lVsz7QskeXYqOYBM681xX1o/lawXhWimytc4lcqqjXtui+0ECZ9vu8h3DuOOnxQuJB1vP0VlOflEt
	gRkJNne+SG7+pHBinxVZ9EW43T71kYKixr3ACJYFtfazjtzt6IQ8HAW4WnGciZo8XZmm1ONv+3qSv
	AhlGkTGkBoBn9ZcqRf3/uT2Y1XqvEreAipr5fq1Nw9u0s0XPOrhpczPpLiGOAsBVEzPsNFPNxFfUz
	PvJzfAaZuKRr1z7mXtSu/j4NpuATLoo3ByjfBP6BefatKm0gY55nx0Vc9SfJHit3l5m8/Ofizgr3X
	FfaAYQl87y1AiX3KIFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGCH-0000000GOet-25jj;
	Tue, 05 May 2026 13:52:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGCF-0000000GOeX-11LO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:52:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECEC94421C
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 13:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95164C2BCFC
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777989142;
	bh=6WUyA/qRgZjRqG7xyPEggP/5P7ASanStlVdGCtJyGlk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Mh4fgJSL/M9UVKE2p3qiUr85OTWLf+7fGrk5/gmvziXiJS1/BdZI75bGGx46Zw+Vh
	 PKPYK28Dl3uz8jmmUval4JwgkcbUFpNOTMpWEXSqte7B40/S8bycBwBkvIncxIEdxT
	 Zyb7gDv9nwMIS976bz5EDFXkS7vnPYUusg24/SHk7/0Cl6ffTOosF/scP3X+cYufZ9
	 vm+ubSeF8g/anZeUu6Duin2gdr9+ePv8lbBEw1Bbt5rSdEw7TMv2e7V9H9tMXfTzDE
	 JjmQIZUgBtZsw+WCszAniTifd9E0Z9VAvuyIOIp5sPtkGcV06qiJUZP+He/lXe5zA+
	 FHUtsYpeJfQ+w==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38dd9f11a09so44251421fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/1HcEw6nd8KarUP6ZMPx+PQIU0Jk2oyu3w/3dXGn+uL2l2yYaDLqH0goMBujFtIiyZf+aBbv/BAjTvw7uS73Kk@lists.infradead.org
X-Gm-Message-State: AOJu0YyZn269KXt0Xm9W957Y4kzJ+7oK4xwrRgYvgAGY7dYCjH66IEaD
	Tf3hZ+RqJBzBTxD7xMI5TC8Aq78fb0qup5cIUEGEVVYmQiYjHsMuao66Wf40jz+b2MgG9ABoPEi
	MaSwtjetmHn2Bh6FHboDrtb0RpUImryw=
X-Received: by 2002:a2e:bc0d:0:b0:385:9b50:91a8 with SMTP id
 38308e7fff4ca-3937856d91emr70254841fa.15.1777989140911; Tue, 05 May 2026
 06:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260504050245.646078-1-iuncuim@gmail.com> <20260504050245.646078-2-iuncuim@gmail.com>
In-Reply-To: <20260504050245.646078-2-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 21:52:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v67fmm82JGhRnNyFfDCwVX4XJkO1fY=jxu_1Ham9mO-bRQ@mail.gmail.com>
X-Gm-Features: AVHnY4LeTOBFKJ13FSl9wZl-RNp_nx4OHYevq6vt_0g-2EC1v07ZOx7WmI5wb_o
Message-ID: <CAGb2v67fmm82JGhRnNyFfDCwVX4XJkO1fY=jxu_1Ham9mO-bRQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_065223_324336_47BB7469 
X-CRM114-Status: GOOD (  20.89  )
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

Hi,

Just some nitpicks.

On Mon, May 4, 2026 at 1:03=E2=80=AFPM Mikhail Kalashnikov <iuncuim@gmail.c=
om> wrote:
>
> Add dt-bindings description of the thermal sensors in the A523 processor.

Add an empty line to separate the "what" from the context.

> The controllers require activation of the additional frequency of the
> associated gpadc controller, so a mod clock property required.
>
> The calibration data is split into two cells that are in different areas
> of nvmem. Both controllers require access to both memory cell, so a new
> property nvmem-cells has been added. To maintain backward compatibility,
> the name of the old cell remains the same and the new nvmem-cell-names is
> called calibration-second-part

Missing a period here. Also might be better to explicitly say that the
calibration data for both controllers are scattered in these two cells
at different offsets, hence the need for different compatible strings.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 54 +++++++++++++++++--
>  1 file changed, 51 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a8=
3t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83=
t-ths.yaml
> index 3e61689f6..6020413c3 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.=
yaml
> @@ -24,6 +24,8 @@ properties:
>        - allwinner,sun50i-h5-ths
>        - allwinner,sun50i-h6-ths
>        - allwinner,sun50i-h616-ths
> +      - allwinner,sun55i-a523-ths0
> +      - allwinner,sun55i-a523-ths1
>
>    clocks:
>      minItems: 1
> @@ -47,11 +49,16 @@ properties:
>      maxItems: 1
>
>    nvmem-cells:
> -    maxItems: 1
> -    description: Calibration data for thermal sensors
> +    minItems: 1
> +    items:
> +      - description: Calibration data for thermal sensors
> +      - description: Additional cell in case of separate calibration dat=
a
>
>    nvmem-cell-names:
> -    const: calibration
> +    minItems: 1
> +    items:
> +      - const: calibration
> +      - const: calibration-second-part
>
>    allwinner,sram:
>      maxItems: 1
> @@ -107,6 +114,7 @@ allOf:
>              enum:
>                - allwinner,sun8i-h3-ths
>                - allwinner,sun20i-d1-ths
> +              - allwinner,sun55i-a523-ths0
>
>      then:
>        properties:
> @@ -132,6 +140,29 @@ allOf:
>          - clock-names
>          - resets
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun55i-a523-ths0
> +              - allwinner,sun55i-a523-ths1
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        nvmem-cells:
> +          minItems: 2
> +        nvmem-cell-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        nvmem-cells:
> +          maxItems: 1
> +        nvmem-cell-names:
> +          items:
> +            - const: calibration
> +
>  required:
>    - compatible
>    - reg
> @@ -176,4 +207,21 @@ examples:
>          #thermal-sensor-cells =3D <1>;
>      };
>
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sun55i-a523-ccu.h>
> +    #include <dt-bindings/reset/sun55i-a523-ccu.h>
> +
> +    thermal-sensor@2009400 {
> +      compatible =3D "allwinner,sun55i-a523-ths1";
> +      reg =3D <0x02009400 0x400>;
> +      interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks =3D <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
> +      clock-names =3D "bus", "mod";
> +      resets =3D <&ccu RST_BUS_THS>;
> +      nvmem-cells =3D <&ths_calibration0>, <&ths_calibration1>;
> +      nvmem-cell-names =3D "calibration",
> +             "calibration-second-part";
> +      #thermal-sensor-cells =3D <1>;
> +    };
>  ...
> --
> 2.54.0
>

