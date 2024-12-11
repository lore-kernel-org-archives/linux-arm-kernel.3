Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE1BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPj/BPEUjCTbTNbQyMrIM316Wmjv6S1W3Jo0zGaEmZ4=; b=V34RqfPHydBwhQ
	0/T/p29aeQK3hhsUpavFWKR0jkGHo+6XKW4vYPNVWWQ7XsSqpU7UT71u1u0akmFnwtYgudWpFfqct
	imsQP799nXeEvKyFPnPrMaqGXQ5wVuW8cvKqce/BPNzJ66dsiR3lYi3H8U/nUGERml4EUmpmWll4d
	e0NXao06J7Ce0a+vVcqDFIh5287UEgJL+knGxlTG3PYKeYmqsSYoKmQA1CiFhj+sn6RAoWv5olzPS
	iQDxde6byWgCRgGKZG0stD7AU8XdVKz4JBQr1qEs+zH9+Vm4ydV508JJSAfRgTp+4ZNB0tszcoKPK
	9RbeHnFSXPI1b4IwNSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJMq-0000000EUJF-2n74;
	Wed, 11 Dec 2024 09:50:52 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJLG-0000000ETtL-03BN;
	Wed, 11 Dec 2024 09:49:15 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-540254357c8so1863612e87.1;
        Wed, 11 Dec 2024 01:49:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733910549; x=1734515349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hPj/BPEUjCTbTNbQyMrIM316Wmjv6S1W3Jo0zGaEmZ4=;
        b=iSigVK1PIpWIooZ/REZi+hYRqZ9778PJF89Kmg7U8W5JVHASgPAT4FafZPNNhRr8jp
         /QCz92G8jZFx0zgpBWOAtIE7RsfrJaaCVo+U3dZ21nNjnWZ+USBTdkgdwEfVW8nTmTXG
         OB9DpFJNIZd0Wc4GNAE8b6T6JtYx/Qi2DpJTDtgDbBvRZvZA3VvMGWyOoh8VQZDkMO6h
         S8QIaJFbXnI+W6L3TQ6359H8keE72ApYlTYOKtSKkriMQ0DlTskG+BjErJaWn22Rt/SJ
         Ci5zrlU4O0UZmmmtWO13JuKP1HyvryzZYhmXTh03J+oHBYHHmkPHZt7afhSu5d79YNrO
         RWYA==
X-Forwarded-Encrypted: i=1; AJvYcCViMcfN9loTbiVqSh5avPxeePaxtl0elVyzXNoxeqTwsTzECRYzAQG3fiwnvsSf7USR/06dI+uzG2fQUcRv7hs=@lists.infradead.org, AJvYcCWwSAtYU+EGxJHPG9Dkhy5CLlkPx7MR+3ytXmr+ENB3lnuLIWfgzqTIxHXN+IJPcUtY/EZV8F31ms7UqlsS9ZFtjQ==@lists.infradead.org, AJvYcCWzntbmqeo30bUVWBUogmnNZr0Lok1IJbIQc91/iGTJdP5QtuIiMlMt4jYYNubTTAj6pbRsmopsfGwnh1Gq6gs=@lists.infradead.org, AJvYcCXglcO7IvZzUmb6uBb8bx2ZJcBplv8DhIyqSvSVAYgaBwOXl8w/+fXLRJlcpBkL96Yo1WkaFw36Jq/wogfP@lists.infradead.org
X-Gm-Message-State: AOJu0YzXQ6jnABhBZQyTmSaMPwGkkZcWn9qYVXjGwxAgAho5dLQgOmQi
	hnEjDAzLZYfuHq7HRs+PfCocZNXKbEQdy1q+SqGk4Xrhm0Hpw/Tv0ShjlG6T
X-Gm-Gg: ASbGncsnCJ09NM6xFkFNMxWXJa7fLv4JuH2/rGI9Vq3jnCVhLVl9pkaurw9Tim/ci/e
	QVcXB9cTEt8UnOfshiv73XKLktsXU13babjbx7ryd0B9HRcFSoB2saYCZMj7PMBdiaR9yjDa+cc
	w39sYb7Z0ogzS6Tbc5jubhDRYaDJA1pzdsmGtLLI48U704kB0lARqjkehRNbbcqWMV3g4Q8GWDh
	FcQfJy6WUSv8x3B6ADxuaSlM3kYx/fyjNEqH+JsDoPBtLHw+NBX8Oyu/DyxYpQ5wrl2crxiY5WW
	ou0g94qPpO0=
X-Google-Smtp-Source: AGHT+IEE6CN7a/VdIb5c4yO2NCR+qW7E1rQUDAurQTsH54VHzUAz9cQ5xA3lsAPi0L3yTtTBShCxvQ==
X-Received: by 2002:a05:6512:3b26:b0:540:2549:bd36 with SMTP id 2adb3069b0e04-5402a5d7815mr668437e87.4.1733910548958;
        Wed, 11 Dec 2024 01:49:08 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54015c39127sm1251013e87.150.2024.12.11.01.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 01:49:07 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30229d5b229so24266271fa.0;
        Wed, 11 Dec 2024 01:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrORuxM0PsYp9zR6+i2UK1RqL3wEkxi/i7vBonZK77987HIogp4KK9xB4RuOOolFWvsNMc1SM3P0MeYFbzlRI=@lists.infradead.org, AJvYcCXW7xqRgwqjfOkjgt8RFgMioPC1lM/Cu8ihJqA/NhJ62sWhtqWpTQqyHOqUpUVD9mhPCnidVPBwiiQ9lLE2@lists.infradead.org, AJvYcCXrdZTWT2XWYxm8FgFlCrQxARUfJn5NdJ8B+56HL/Qdtp78a/Sy1xAN6pRAx2q4sUUJBj74XUXGf7O9MxU+KatOKQ==@lists.infradead.org, AJvYcCXrw58s+p+M+7GaQtX8TiKCyY5sOR+AL4cyaGK1UxOZfkRif0E8soDYaUeqLzl6ef7WHP11vKE957tIWnMZH40=@lists.infradead.org
X-Received: by 2002:a05:651c:556:b0:300:3a15:8f1f with SMTP id
 38308e7fff4ca-30240d5d82amr7824591fa.32.1733910547069; Wed, 11 Dec 2024
 01:49:07 -0800 (PST)
MIME-Version: 1.0
References: <20241211092509.34342-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241211092509.34342-1-krzysztof.kozlowski@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 11 Dec 2024 17:48:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v64bGgum7L2Fcg=FBru7ousCJgSyew7kr7VvYhM+ok_dKA@mail.gmail.com>
Message-ID: <CAGb2v64bGgum7L2Fcg=FBru7ousCJgSyew7kr7VvYhM+ok_dKA@mail.gmail.com>
Subject: Re: [RESEND PATCH] media: dt-bindings: trivial white-space and
 example cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ming Qian <ming.qian@nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>, Shijie Qin <shijie.qin@nxp.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Emil Velikov <emil.velikov@collabora.com>, 
	Del Regno <angelogioacchino.delregno@somainline.org>, 
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_014914_053883_BC4E379F 
X-CRM114-Status: GOOD (  17.22  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2024 at 5:25=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Minor cleanups without funcitonal impact:
>  - There should not be an empty blank line after SPDX tag,
>  - Convention is to indent DTS examples in coding style with 2- or
>    4-space indentation (4 is preferred),
>  - Drop unused labels in DTS examples.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Resending second time, because I missed previous Rob's review.
>
> I added now also Bryan's and Heiko's reviews from last resend.
> ---
>  .../media/allwinner,sun50i-h6-vpu-g2.yaml     |  1 -

FWIW,

Acked-by: Chen-Yu Tsai <wens@csie.org>

>  .../bindings/media/amlogic,meson-ir-tx.yaml   |  1 -
>  .../bindings/media/amphion,vpu.yaml           |  1 -
>  .../bindings/media/fsl,imx6ull-pxp.yaml       |  1 -
>  .../media/mediatek,vcodec-decoder.yaml        |  1 -
>  .../media/mediatek,vcodec-encoder.yaml        |  1 -
>  .../media/mediatek,vcodec-subdev-decoder.yaml |  1 -
>  .../media/microchip,sama5d4-vdec.yaml         | 17 ++++----
>  .../bindings/media/nxp,imx8mq-vpu.yaml        | 41 +++++++++----------
>  .../bindings/media/qcom,msm8916-camss.yaml    |  1 -
>  .../bindings/media/qcom,msm8996-camss.yaml    |  1 -
>  .../bindings/media/qcom,sdm660-camss.yaml     |  1 -
>  .../bindings/media/qcom,sdm845-camss.yaml     |  1 -
>  .../bindings/media/qcom,sm8250-camss.yaml     |  1 -
>  .../bindings/media/rockchip,rk3568-vepu.yaml  |  1 -
>  .../bindings/media/rockchip-vpu.yaml          | 29 +++++++------
>  16 files changed, 42 insertions(+), 58 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-=
vpu-g2.yaml b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-v=
pu-g2.yaml
> index a4f06bbdfe49..8ba5177ac631 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.=
yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.=
yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/allwinner,sun50i-h6-vpu-g2.yaml=
#
> diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.=
yaml b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
> index 377acce93423..6da8a6aded23 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,meson-ir-tx.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/amlogic,meson-ir-tx.yaml#
> diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/D=
ocumentation/devicetree/bindings/media/amphion,vpu.yaml
> index 9801de3ed84e..5a920d9e78c7 100644
> --- a/Documentation/devicetree/bindings/media/amphion,vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/amphion,vpu.yaml#
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml=
 b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> index 84a5e894ace4..3f47744459aa 100644
> --- a/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> +++ b/Documentation/devicetree/bindings/media/fsl,imx6ull-pxp.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/fsl,imx6ull-pxp.yaml#
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-deco=
der.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.=
yaml
> index b401c67e3ba0..d726d141a434 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yam=
l
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yam=
l
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-enco=
der.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.=
yaml
> index b45743d0a9ec..110e8f5f1f9e 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yam=
l
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yam=
l
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-s=
ubdev-decoder.yaml
> index a500a585c692..5865e6f0be89 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/mediatek,vcodec-subdev-decoder.=
yaml#
> diff --git a/Documentation/devicetree/bindings/media/microchip,sama5d4-vd=
ec.yaml b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.ya=
ml
> index 59b805ca47c5..ede086d55add 100644
> --- a/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/microchip,sama5d4-vdec.yaml#
> @@ -36,12 +35,12 @@ additionalProperties: false
>
>  examples:
>    - |
> -        #include <dt-bindings/clock/at91.h>
> -        #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
>
> -        vdec0: vdec@300000 {
> -                compatible =3D "microchip,sama5d4-vdec";
> -                reg =3D <0x00300000 0x100000>;
> -                interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 4>;
> -                clocks =3D <&pmc PMC_TYPE_PERIPHERAL 19>;
> -        };
> +    vdec@300000 {
> +        compatible =3D "microchip,sama5d4-vdec";
> +        reg =3D <0x00300000 0x100000>;
> +        interrupts =3D <19 IRQ_TYPE_LEVEL_HIGH 4>;
> +        clocks =3D <&pmc PMC_TYPE_PERIPHERAL 19>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml =
b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 3d58f02b0c5d..19528262810a 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/nxp,imx8mq-vpu.yaml#
> @@ -44,26 +43,26 @@ additionalProperties: false
>
>  examples:
>    - |
> -        #include <dt-bindings/clock/imx8mq-clock.h>
> -        #include <dt-bindings/power/imx8mq-power.h>
> -        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/power/imx8mq-power.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> -        vpu_g1: video-codec@38300000 {
> -                compatible =3D "nxp,imx8mq-vpu-g1";
> -                reg =3D <0x38300000 0x10000>;
> -                interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks =3D <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
> -                power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
> -        };
> +    video-codec@38300000 {
> +        compatible =3D "nxp,imx8mq-vpu-g1";
> +        reg =3D <0x38300000 0x10000>;
> +        interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clk IMX8MQ_CLK_VPU_G1_ROOT>;
> +        power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G1>;
> +    };
>    - |
> -        #include <dt-bindings/clock/imx8mq-clock.h>
> -        #include <dt-bindings/power/imx8mq-power.h>
> -        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/power/imx8mq-power.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> -        vpu_g2: video-codec@38300000 {
> -                compatible =3D "nxp,imx8mq-vpu-g2";
> -                reg =3D <0x38310000 0x10000>;
> -                interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> -                clocks =3D <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> -                power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
> -        };
> +    video-codec@38300000 {
> +        compatible =3D "nxp,imx8mq-vpu-g2";
> +        reg =3D <0x38310000 0x10000>;
> +        interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
> +        power-domains =3D <&vpu_blk_ctrl IMX8MQ_VPUBLK_PD_G2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.y=
aml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> index 9cc0a968a401..3469a43f00d4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.y=
aml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> index 5cb0e337ea6e..644646de338a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> index 584106e275f6..68d8670557f5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index d32daaef1b50..289494f561e5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index 06db2c1e6079..a372d991e652 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/qcom,sm8250-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu=
.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> index 947ad699cc5e..d246f5d38427 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/rockchip,rk3568-vepu.yaml#
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/=
Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> index 719aeb2dc593..8c2501634080 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
> @@ -92,18 +91,18 @@ additionalProperties: false
>
>  examples:
>    - |
> -        #include <dt-bindings/clock/rk3288-cru.h>
> -        #include <dt-bindings/interrupt-controller/arm-gic.h>
> -        #include <dt-bindings/power/rk3288-power.h>
> +    #include <dt-bindings/clock/rk3288-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3288-power.h>
>
> -        vpu: video-codec@ff9a0000 {
> -                compatible =3D "rockchip,rk3288-vpu";
> -                reg =3D <0xff9a0000 0x800>;
> -                interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> -                             <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> -                interrupt-names =3D "vepu", "vdpu";
> -                clocks =3D <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
> -                clock-names =3D "aclk", "hclk";
> -                power-domains =3D <&power RK3288_PD_VIDEO>;
> -                iommus =3D <&vpu_mmu>;
> -        };
> +    video-codec@ff9a0000 {
> +        compatible =3D "rockchip,rk3288-vpu";
> +        reg =3D <0xff9a0000 0x800>;
> +        interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names =3D "vepu", "vdpu";
> +        clocks =3D <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
> +        clock-names =3D "aclk", "hclk";
> +        power-domains =3D <&power RK3288_PD_VIDEO>;
> +        iommus =3D <&vpu_mmu>;
> +    };
> --
> 2.43.0
>
>

