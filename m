Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A63E8FDAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 18:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkmXeBL8ADatUdEdx6S6yo6By5LS0MdXDPNNFSAKnvA=; b=JwdibJVVMEBnQxVJYUsJIJ1tzo
	mfLMc+thyAMeXs8xKbbgvxAvZC+HYDFFEY+Ktg2ClWRtUaN9FAJOu01qSItxfCmwjf7tZwCPGs2Zr
	83qR3JBw7eCfXgO02BYEw/U6E3xhebwN92457rYEQc7xm3un3jaXTR2aZGkIrDfsyRs8R44F+B5V+
	wRqXqfFc9SWPZrlwWilA8Pm6SqJvwhbVrfwl1jxTmsyYeJRAoHgjQxDEBnA/c/jHysBG6zDRK7pe8
	pUzB5u23y0/JicvsqLrhOvKMeM5jEtODP9L7pQxUx5v0e2LkJWqYukVlHueqjH4nUVaXFRU1ivQ0f
	9k6WWnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZCEJ-00000001M6d-44Wr;
	Fri, 26 Dec 2025 18:07:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZCEH-00000001M5w-2EWH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 18:07:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE21944475
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 18:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2F3C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 18:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766772476;
	bh=Mo8DKiQXbP10FfBrG4jSD9A1fN4U7FZm/QO+xQpqVV4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sj8Ykdu3Z8gYuEOZSpZfrwpRaD0qg+avjRrmXpPCEaE5KuBdPEaiWo5cVLdXMFOIB
	 9vAyLQ25/BSc1JusmL2JztNMoApXaSCRXIkJGLO9m2Z8nGbpQd7wEU+dNMwfEWGEth
	 gYqYlSz0XBVzLtMrC9abdPt82RS9+ES7oqRjUcHpr9HQZy3K5Gk6EjNa0kHq9ohlEn
	 XIPXPGrA3sYNzMLs6Xn+GVfEGB3c3K+7gGWMgVFEXtC/M7HTc+A9mshE2H+EqS4yYi
	 n6xaFJNuFFpfw7QjOUsWwjGUYQXpvL6xMI/+WEKOisEhMqyBScG5UMSDE17rNMhvRs
	 QWthtXmQ/YAeA==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78d6a3c3b77so81394127b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 10:07:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDdqbjKjtXV7N7aIstAvO+okOwH8aONE1F/kH9ZEwOcIXegm+ZmnloIAo/Kaec9oBLVABU59pPBcEOB5vfCIKh@lists.infradead.org
X-Gm-Message-State: AOJu0YxIsKC9ZVr8I2HS/bFzmBrw0BEC7gIzeOB7goG4C+Umans51kRN
	zFSlMS+stUf8ssuvYqdW9U+Bgi9OtA1lOk0i/VG0Au3bwam3DH3a1i+ka/p9NH/3zuOKeY+GvPr
	L9V/tkmvBwd9iSr+vCddBp1VO0d4WZBY=
X-Google-Smtp-Source: AGHT+IHXFYYWTsvxkiAzCuYl1w+1gAwdOMQor8XIU2GYqR9g+iZUH2rKjwqFU6Vi/SZe0tIuniB4xtJv4Fw3RoZpxPI=
X-Received: by 2002:a05:690e:11c6:b0:641:f5bc:692a with SMTP id
 956f58d0204a3-646632c32fbmr22677636d50.35.1766772475962; Fri, 26 Dec 2025
 10:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com> <20251216112053.1927852-7-ye.zhang@rock-chips.com>
In-Reply-To: <20251216112053.1927852-7-ye.zhang@rock-chips.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 19:07:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
X-Gm-Features: AQt7F2oo9iVMDuNkiBl10i_Zvh5ka_JIKyMORrwHeD221KqqGenYfp36zyHsPm0
Message-ID: <CAD++jLntu4LY=VHOMSXeLKXOBD9MTNziv47B0qkDjxUa1xAsng@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: pinctrl: rockchip: Add RMIO
 controller binding
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_100757_682163_4C13C348 
X-CRM114-Status: GOOD (  19.05  )
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

Hi Ye,

thanks for your patch!

On Tue, Dec 16, 2025 at 3:50=E2=80=AFPM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:


> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml=
 b/Documentation/devicetree/bindings/pinctrl/rockchip,rmio.yaml

> +  rockchip,rmio-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node (GRF or PMU) containing the RMIO re=
gisters.
> +      This property is required if the RMIO registers are located in a d=
ifferent
> +      syscon than the parent pinctrl node.
> +
> +  rockchip,offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The offset of the RMIO configuration registers within the GRF.

Can't this just be a cell in the phandle?

> +  rockchip,pins-num:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The number of physical pins supported by this RMIO instance.
> +      Used for boundary checking and driver initialization.

Isn't this implicit from the compatible? Why is this different
between two device trees using the same compatible pin
controller? I don't get it, I think this should be a constant in the
code based on the compatible instead.

> +patternProperties:
> +  "^[a-z0-9-]+$":
> +    type: object
> +    description:
> +      Function node grouping multiple groups.
> +
> +    patternProperties:
> +      "^[a-z0-9-]+$":
> +        type: object
> +        description:
> +          Group node containing the pinmux configuration.
> +
> +        properties:
> +          rockchip,rmio:
> +            $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +            description:
> +              A list of pin-function pairs. The format is <pin_id functi=
on_id>.
> +            minItems: 1
> +            items:
> +              items:
> +                - description: RMIO Pin ID (0 to pins-num - 1)
> +                  minimum: 0
> +                  maximum: 31
> +                - description: Function ID
> +                  minimum: 0
> +                  maximum: 98

Please avoid these custom properties and just use the standard
"pinmux" property. I don't want any more opaque custom bindings
for functions and groups.

Reference Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
and use pinmux from there.

You can use some shifting and defines to shoehorn your config
into a single u32 and parse that in your driver; i.e. instead of
rockchip,rmio =3D <1, 2>;
use
pinmux =3D <1 << 8 | 2 << 0>;
these shifter numerals can come from defines.
In the driver shift & mask out the components you want.

e.g.;

> +            rmio-uart {
> +                rmio_pin27_uart1_tx: rmio-pin27-uart1-tx {
> +                    rockchip,rmio =3D <27 RMIO_UART1_TX>;

pinmux =3D <27 << 8 | RMIO_UART1_TX>;

> +++ b/include/dt-bindings/pinctrl/rockchip,rk3506-rmio.h

These number dumps are not appreciated inside the bindings
despite quite a few found their way in there.

Use something like
arch/*/dts/rockchip/rk3506-rmio-pins.dtsi
and include that into your device trees instead.

Yours,
Linus Walleij

