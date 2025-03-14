Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FDFC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZpAgjGwH0utmNulKzYZy5inQOshYJyhiBsdybHGg9A=; b=XAuxTMV8lJ31fAB9gVr6tghDFp
	3f8fONvlMcArsosfy36fQaCk+Nw6q9Cw9sukShkmDcehaSfWATHADIHilRQU+z3ds95AKEIXGmEep
	U1KOOlvlpPoFRxVJBtkNxkZMrdjFoBl0mOXF+OHUtnsveOeu8ycCIFZSRRkd6BbkJ1YbnMHpmHPEu
	G9uuFWvTzQv++YCdU5qp7Zpf+n8gYmrPIbZOSSG8/41f6RKZ9aHeaJbTKMKpHfGJ1AVLB3LSID8nh
	X3bRa4ZRr1YjAlhjdFr1/8jHefe6msmjnObVJ6I+NUw3YetQPtsS5Mil4JWC6dLXekrHonEys6EDx
	+OpTkzlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lO-0000000DXVq-3hXB;
	Fri, 14 Mar 2025 08:51:30 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Ut-0000000DUrE-0QZH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:34:28 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5498c742661so2044123e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 01:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741941265; x=1742546065; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZpAgjGwH0utmNulKzYZy5inQOshYJyhiBsdybHGg9A=;
        b=m3fv8cVMuGTd01KXROFLRTUUtnPIBLstKklyZUIwXoQeMeecfW9ND0wLHG6o1bLUC7
         547yjnKEUvrVMLfEn8Vn922EADC/Mkr7XVwYcl39F39S/MA5klVdREmBb5/t+lcRtIXM
         dT3CBmGK/SE2/CZ3t4QGI0nxjz4g0fyyTX6eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941265; x=1742546065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZpAgjGwH0utmNulKzYZy5inQOshYJyhiBsdybHGg9A=;
        b=HVlKZVjmCyQ3VfhfIDu4CD/0GmpKeZhgrNS29l1HG/VMAFIs8X/TMEv2YlsZl0JM7e
         n7kNcX/XF6xkBE5G7B13PCCEY7bTsEwCyUGcFBaT+8Mh2g/sRJD+nZ4vWlEjTkRPAlXr
         xImmX+XRp/GAq8akSC7fnA2/GTSLy5OmBBvrAxjTV48qUNCpE40iGqtPybruJiTAPDYz
         opQnJyXHes0gWas4QoWsJgc9qsB6adFkJeDa0mkjhrTCeJBkUPft85O0Vf40uY7tYzEq
         S/rBltTjYpJ54n/13urbmL8+NV9kSDF16C6YE3T3RTmfEDztfTrKE7dLv+j4keE/u1Z7
         ziXA==
X-Forwarded-Encrypted: i=1; AJvYcCUrwhs3TRDTp3MS7Mavh1Z/B1KfQNAN3FfCqstdLGj58xk9igbzn5/r2NNXu5GxfSPR9tfM9nmogGrh7B5Ukhux@lists.infradead.org
X-Gm-Message-State: AOJu0YxFCyxcTbHPiYOt6P01JoZLlfvTnpiF8B58+W71veISxv0Rf2ZB
	FTcdIuM/Nj84r2aRtJz/AkZtvtonsXNlmOFwQYPWR7ogRzb0LWyzZOT7npdC6CVWK15v84atnPs
	gmE5/rYwhwiUdUIpfWDV5zY0/bugqQJ1zCsGD
X-Gm-Gg: ASbGncuvklmIHDigly/KQB7EGSjJk0dKHzpZYSFXMoQ5rm+SUBnBDVYml9KnHq8l/OA
	nQd4MAA5WARiXPKwCJ7rlRrOUBlqhf/yR0a/ca6C/CWdXlSLvYqGTC+5xext+LFssqYVNHAw7Fe
	NUI8wzHieK9zKWRH8PdmkO0v0d4rPAwOOxN0OP+RaagK7Ad6kN2SvPuWvqtscrK5M=
X-Google-Smtp-Source: AGHT+IFeG2vASJFBcUYON5CpB2pCpsn5Qni6S+429lhxSZT9jExopLARUFhUuvYTV/jamF8BmUY325TX1o31O/IfcCs=
X-Received: by 2002:a05:6512:1241:b0:549:5769:6adb with SMTP id
 2adb3069b0e04-549c38eabd5mr545062e87.5.1741941265129; Fri, 14 Mar 2025
 01:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250314073307.25092-1-Lu.Tang@mediatek.com> <20250314073307.25092-6-Lu.Tang@mediatek.com>
In-Reply-To: <20250314073307.25092-6-Lu.Tang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 14 Mar 2025 16:34:13 +0800
X-Gm-Features: AQ5f1JrxNwBtyEMHMU4cnPir_h2MVBk0naTrsiwIFPX2nky8qr1kDmNLCL6d8BU
Message-ID: <CAGXv+5GMgkCSthLgna-0DwyMbw5pOd-jLi_H2Gk+5U0sUsnAFQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: pmic: mediatek: Add pmic documents
To: "Lu.Tang" <Lu.Tang@mediatek.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Chen Zhong <chen.zhong@mediatek.com>, Sen Chu <shen.chu@mediatek.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_013427_162757_1F81F02E 
X-CRM114-Status: GOOD (  25.12  )
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

On Fri, Mar 14, 2025 at 4:03=E2=80=AFPM Lu.Tang <Lu.Tang@mediatek.com> wrot=
e:
>
> Add new pmic mfd and adc documents for mt8196
>
> Signed-off-by: Lu.Tang <Lu.Tang@mediatek.com>
> ---
>  .../iio/adc/mediatek,spmi-pmic-auxadc.yaml    |  31 ++++
>  .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
>  .../bindings/mfd/mediatek,mt6685.yaml         |  50 +++++
>  .../bindings/mfd/mediatek,spmi-pmic.yaml      | 173 ++++++++++++++++++
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
>  5 files changed, 256 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,sp=
mi-pmic-auxadc.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6685=
.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,spmi-p=
mic.yaml
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic=
-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic=
-auxadc.yaml
> new file mode 100644
> index 000000000000..250782ad7d01
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic-auxadc=
.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/mediatek,spmi-pmic-auxadc.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SPMI PMIC AUXADC
> +
> +maintainers:
> +  - Lu Tang <lu.tang@mediatek.com>
> +
> +description:
> +  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
> +  in some MediaTek PMICs, performing various PMIC related measurements
> +  such as battery and PMIC internal voltage regulators temperatures,
> +  other than voltages for various PMIC internal components.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6363-auxadc
> +      - mediatek,mt6373-auxadc
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - "#io-channel-cells"
> +
> +additionalProperties: false

This is simply a sub-function of the PMIC, and is really not tied to
whatever interface the PMIC uses. Please integrate this into the existing
binding:

    Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml

> diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.y=
aml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> index b95435bd6a9b..ce760039d4c2 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> @@ -31,6 +31,7 @@ properties:
>        - mediatek,mt6358-keys
>        - mediatek,mt6359-keys
>        - mediatek,mt6397-keys
> +      - mediatek,mt6363-keys
>
>    power-off-time-sec: true
>
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml
> new file mode 100644
> index 000000000000..d3276df8952b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,mt6685.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6685 Clock IC
> +
> +maintainers:
> +  - Lu Tang <lu.tang@mediatek.com>
> +
> +description: |
> +  MT6685 is a clock IC.
> +  Please see the sub-modules below for supported features.
> +
> +  MT6685 is a multifunction device with the following sub modules:
> +  - RTC
> +  - Clock
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6685
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    spmi {
> +        mfd@9 {
> +            compatible =3D "mediatek,mt6685";
> +            reg =3D <0x9 SPMI_USID>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yam=
l b/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml
> new file mode 100644
> index 000000000000..a8f1231623cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml
> @@ -0,0 +1,173 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mediatek,spmi-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SPMI PMICs multi-function device
> +
> +maintainers:
> +  - Lu Tang <lu.tang@mediatek.com>
> +
> +description: |
> +  Some Mediatek PMICs are interfaced to the chip via the SPMI (System Po=
wer
> +  Management Interface) bus.
> +
> +  The Mediatek SPMI series includes the MT6363, MT6373, MT6316 and other
> +  PMICs.Please see the sub-modules below for supported features.
> +
> +   MT6363/MT6373 is a multifunction device with the following sub module=
s:
> +  - Regulators
> +  - ADC
> +  - GPIO
> +  - Keys


> +   MT6316 is a multifunction device with the following sub modules:
> +  - Regulators

Then it is not multifunctional. Please move this to the MT6315
binding:

    Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml

Also, you have not covered regulator bindings in this series.


ChenYu

> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - mediatek,mt6363
> +          - mediatek,mt6373
> +          - mediatek,mt6316
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  regulators:
> +    type: object
> +    description:
> +      List of child nodes that specify the regulators.
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        oneOf:
> +          - enum:
> +              - mediatek,mt6363-regulator
> +              - mediatek,mt6373-regulator
> +              - mediatek,mt6316-regulator
> +
> +    required:
> +      - compatible
> +
> +  adc:
> +    type: object
> +    $ref: /schemas/iio/adc/mediatek,spmi-pmic-auxadc.yaml#
> +    unevaluatedProperties: false
> +
> +  keys:
> +    type: object
> +    $ref: /schemas/input/mediatek,pmic-keys.yaml
> +    unevaluatedProperties: false
> +    description:
> +      Power and Home keys.
> +
> +  pinctrl:
> +    type: object
> +    $ref: /schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +    unevaluatedProperties: false
> +    description:
> +      Pin controller
> +
> +required:
> +  - compatible
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    spmi {
> +        main_pmic: pmic@4 {
> +            compatible =3D "mediatek,mt6363";
> +            reg =3D <0x4 SPMI_USID>;
> +            interrupts =3D <0x4 IRQ_TYPE_NONE>;
> +            #address-cells =3D <0>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <2>;
> +
> +            mt6363keys: keys {
> +                compatible =3D "mediatek,mt6363-keys";
> +                mediatek,long-press-mode =3D <1>;
> +                power-off-time-sec =3D <0>;
> +
> +                power {
> +                    linux,keycodes =3D <116>;
> +                    wakeup-source;
> +                };
> +
> +                home {
> +                    linux,keycodes =3D <115>;
> +                };
> +            };
> +
> +            mt6363_pio: pinctrl {
> +                compatible =3D "mediatek,mt6363-pinctrl";
> +                gpio-controller;
> +                #gpio-cells =3D <2>;
> +            };
> +
> +            mt6363regulator: regulators {
> +                compatible =3D "mediatek,mt6363-regulator";
> +
> +                mt6363_vs2: vs2 {
> +                    regulator-name =3D "mt6363_vs2";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                    regulator-always-on;
> +                    regulator-allow-set-load;
> +                };
> +
> +                mt6363_vbuck1: vbuck1 {
> +                    regulator-name =3D "mt6363_vbuck1";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck2: vbuck2 {
> +                    regulator-name =3D "mt6363_vbuck2";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck3: vbuck3 {
> +                    regulator-name =3D "mt6363_vbuck3";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck4: vbuck4 {
> +                    regulator-name =3D "mt6363_vbuck4";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck5: vbuck5 {
> +                    regulator-name =3D "mt6363_vbuck5";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck6: vbuck6 {
> +                    regulator-name =3D "mt6363_vbuck6";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                mt6363_vbuck7: vbuck7 {
> +                    regulator-name =3D "mt6363_vbuck7";
> +                    regulator-allowed-modes =3D <0 1 2>;
> +                };
> +
> +                // ...
> +
> +                mt6363_isink_load: isink-load {
> +                    regulator-name =3D "mt6363_isink_load";
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinc=
trl.yaml
> index bccff08a5ba3..bf3ba58a7705 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.y=
aml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - mediatek,mt2701-pinctrl
>        - mediatek,mt2712-pinctrl
> +      - mediatek,mt6363-pinctrl
>        - mediatek,mt6397-pinctrl
>        - mediatek,mt7623-pinctrl
>        - mediatek,mt8127-pinctrl
> --
> 2.46.0
>
>

