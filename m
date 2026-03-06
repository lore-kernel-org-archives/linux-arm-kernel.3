Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E00FCB608
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/Bpufq2xekGRgCcsd2+UGC/FPMgrs977MI+bXws1l0=; b=WjHFWSOgUQBpyXAnRQhrA9GbAB
	bvA0mlQ47CcUEpZb3QNy0YbfiJWGow/UZm4uEL4AQqKRKu+maKF+qPPbXwJ83CP6yGQ1s0usMOR4u
	jDwUlJu8CXBk3Rzv2ibXkzW2ZBJNfQ1ICXciJe7Tni0nHz1vJZcyEnc32GuqyBttPmemk5yQMt20v
	XjWcrA2H4JGoW5YzP8r/lmBJtlTpaIgV8kgmNPGOUtIHPCWMM1LpU+Dvq1q2XUL7tkpzYlAinHaXp
	iCmQi5mQVqq4j6rClGGeHvZHglRuarAFGFQUtA/5mXkiXDUdbCZnHVKdREhnJ5JchR0U8k0ZHbXhP
	Sup/1B7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWf3-00000003z2R-2fws;
	Fri, 06 Mar 2026 15:00:17 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWf0-00000003z1p-1spi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 15:00:15 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-94d5f90c8b6so5428927241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 07:00:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772809213; cv=none;
        d=google.com; s=arc-20240605;
        b=B3wtp7a8s/VhoyiLGvwkBGLsmgHkCt8AnrtxiIajYLaP0Fb6Nnh9cbQh33f9nf9rrg
         +wUkic9kI0+awHCYDAgAs1pyqZmMfM8arNZuW5fjy4RuJzjQwNa66ZFjeMngp3A8EXvM
         SKKWQrye7J+sHVq/rioGWvb4FASkRsZJ6V3QRdxflCdd2ucyLMOTgMNxe/RNlxz+PjIx
         VJv88msHCvXKB8bIwNg3CvlLqzSWTsSCRk8EddfdBr3LoUxQYgCbfky6lr0s7POFDtc7
         g/tE5S6reJlhdv/qSD9nMRug77PIBm9VL9PkXXAaYsEiobD8I+uBN3TIFitExwHqlofs
         ReHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J/Bpufq2xekGRgCcsd2+UGC/FPMgrs977MI+bXws1l0=;
        fh=pQCtcSzJljL8tTdPpfFBaWhq+Lbc7kNpqrM6zLCijp0=;
        b=LIi9kMnUmWYHnkMMZmu7SnwKGVyFdqubTM+Eg9AwcXV1XH/58Y1gYzUmopHau1GLDW
         rWFdDqTcbXz9sbMfKo2Yu0cJgeYYZlzxJMwtyGDP2eOAemrkGQqQFLOmMeb6s2AYVVby
         tCIEea05apqKiXNvgH82PDf9ic9LGo4ihZIebz5l1Y5SSYXbfqVZ0k+Yocd8I+0Vd2vT
         ZPGbdEZABJZQ0PZ8syMd6GWP4b2DeKWlnAqTUp2xy76132cNzqPbocA+y7KkMMOSdHW5
         YihKe/c5rfjfbCUkfJCa79ivB0hCALzx0aBRQjLXHg5Bv943gyBnm0HtzGVU4XSH5hw4
         nsHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772809213; x=1773414013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/Bpufq2xekGRgCcsd2+UGC/FPMgrs977MI+bXws1l0=;
        b=T+8iZYdtr+UZksA0xHr/QMxwtbodGHqJL3dQyRzofo4CFgEkgpC7Ijuh4LbYyIyQrj
         R2KWeiirxUhO6N5ORS56XuYyb7wkTbHqOYJxGd3xVBXY5WmDi43Y0Ayjf+QtdsPf+lKg
         ry6Gk7ZKCxnCvYGwq2yYqo3RBIEoXmXtNJZN0UrlkElWsln29ucdbwuYitfYbyp3AX4q
         pKnm5+dheob4RqnNXepL7fQI5x+eNWwm+36HgxG90N7EqoWXFbR73TlEeho3u7Jv20nn
         9f4iGOpgAjIT82M1xm5uIERRii8GAQuAEyvN4Q9bo7HwYKMrfn4WWt6hkmoXUmo7TgDK
         UCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809213; x=1773414013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J/Bpufq2xekGRgCcsd2+UGC/FPMgrs977MI+bXws1l0=;
        b=xCFWuVp4fBTiKPfMpcLwFMNW04Q3lG6AY+ikBXp0QHbzMq99A44nuG8TcPQv+YPi9t
         YI/iImyBlklx7DcqU5maJT6YJjDBJyvxmFoTY233cAkkdTOPjPWzwQQiiN5AXfoWe8ZO
         WTXUCEy6H2GFE6vOak37ob067d0ATk+4Wjhw1Swf3SIDc3EdO68jiNV6c2a7/KYF8YUu
         3r+G7igpEVQ+73m/fFpBAsf8cdFOXV2sx/gsaDeyukI1qfJL+6AmUG9vLQj2DnC+WiLf
         BFFAtYUvPYSCx4Ug1cHa7OvanPGBmm5sdmMX/YKslsRv8jdDXJ4E79P0scu1zEDcmQx4
         Ag5w==
X-Forwarded-Encrypted: i=1; AJvYcCXC8RysY+1sB5Rh5uGYBapLPb6p5alQGFu9qVhWshDDfZ4nPhQAu6/dsRF3eP1OtsrW1hud1EcFM+ddn6mFTfAm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7w85CfhsFNgo+SMRcSDG5VD3zcj1VkV1UkQOqvGdAT/ZFXaTc
	aJMiq1X6cRaQDP9Hbz8eHH+jGHb/YOc8SSIvrDULZlC6ZaNXti6HxEM+bO8gAc7oBZmpJWyIWR/
	qHw0FaM3r/0NCcsOCW5ayt3fAByc1dtf/wGK+ipOPFg==
X-Gm-Gg: ATEYQzxe6nwc+porj9RKiov8ZaScKG5kWcbtcJjPMtdx0mVhn4ujMhjgzsO8xiOl5RG
	J0pvtGyykQLvobBTSuetW/QjyI1yaEret1nKpG72Zuwb9rtszicS6exWFjwWmJ9mRoz2HvlflvJ
	aYdaUZUJQLMHxlSbam96kcf99TKpE+6i+J93oTh8Drp6LZ4Obv6EoM46ad3fBLKgjZhrkj7+AsR
	W9dN61HfoizYW6CM0e0t7eSuGYJm2VjnP7aK2g1wG3frf1B5fAWZmebwJbIagnFjEf09VSXDs6P
	z7dwvBrc/w5jf8rdfKM2PY9hvexQCqeRjGgie4TAGg==
X-Received: by 2002:a05:6102:4194:b0:5ff:b8d8:b40b with SMTP id
 ada2fe7eead31-5ffe5f5af96mr976076137.11.1772809211966; Fri, 06 Mar 2026
 07:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-3-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-3-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 14:59:55 +0000
X-Gm-Features: AaiRm52iLKW20Iji1D2QiNvWLmb7shRdq2i6p-ERiHTNgGNSGFd7-_UUwIqk2YY
Message-ID: <CADrjBPoN65zKrgZ-Hm7exbPK6-7DMSwUKjZ-zvkg_GG3fhn-jQ@mail.gmail.com>
Subject: Re: [PATCH v7 03/10] dt-bindings: soc: samsung: exynos-pmu: move
 gs101-pmu into separate binding
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_070014_507919_5DC4AFAF 
X-CRM114-Status: GOOD (  21.00  )
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

On Fri, 6 Mar 2026 at 10:29, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The gs101-pmu binding is going to acquire various additional (pattern)
> properties that don't apply to other PMUs supported by this binding.
>
> To enable this, move google,gs101-pmu into a separate binding.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> v7:
> - drop invalid tested-by tag (Krzysztof)
>
> v4:
> - update since 'syscon' was removed from gs101-pmu compatibles
> - update since 'select:' was removed from google,gs101-pmu.yaml
>
> v3:
> - use additionalProperties, not unevaluatedProperties
> - fix path in $id (Rob)
> - drop comment around 'select' (Rob)
> ---
>  .../bindings/soc/google/google,gs101-pmu.yaml      | 56 ++++++++++++++++=
++++++
>  .../bindings/soc/samsung/exynos-pmu.yaml           | 20 --------
>  MAINTAINERS                                        |  1 +
>  3 files changed, 57 insertions(+), 20 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pm=
u.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> new file mode 100644
> index 000000000000..a06bd8ec3c20
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 Power Management Unit (PMU)
> +
> +maintainers:
> +  - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: google,gs101-pmu
> +
> +  reg:
> +    maxItems: 1
> +
> +  reboot-mode:
> +    $ref: /schemas/power/reset/syscon-reboot-mode.yaml
> +    type: object
> +    description:
> +      Reboot mode to alter bootloader behavior for the next boot
> +
> +  syscon-poweroff:
> +    $ref: /schemas/power/reset/syscon-poweroff.yaml#
> +    type: object
> +    description:
> +      Node for power off method
> +
> +  syscon-reboot:
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
> +    type: object
> +    description:
> +      Node for reboot method
> +
> +  google,pmu-intr-gen-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to PMU interrupt generation interface.
> +
> +required:
> +  - compatible
> +  - reg
> +  - google,pmu-intr-gen-syscon
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    system-controller@17460000 {
> +        compatible =3D "google,gs101-pmu";
> +        reg =3D <0x17460000 0x10000>;
> +
> +        google,pmu-intr-gen-syscon =3D <&pmu_intr_gen>;
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 76ce7e98c10f..09368dbb6de6 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -12,8 +12,6 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> -      - enum:
> -          - google,gs101-pmu
>        - items:
>            - enum:
>                - samsung,exynos3250-pmu
> @@ -110,11 +108,6 @@ properties:
>      description:
>        Node for reboot method
>
> -  google,pmu-intr-gen-syscon:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description:
> -      Phandle to PMU interrupt generation interface.
> -
>  required:
>    - compatible
>    - reg
> @@ -176,19 +169,6 @@ allOf:
>        properties:
>          dp-phy: false
>
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - google,gs101-pmu
> -    then:
> -      required:
> -        - google,pmu-intr-gen-syscon
> -    else:
> -      properties:
> -        google,pmu-intr-gen-syscon: false
> -
>  examples:
>    - |
>      #include <dt-bindings/clock/exynos5250.h>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 611fa8fb9f8f..6a00d97ccd09 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10884,6 +10884,7 @@ C:      irc://irc.oftc.net/pixel6-kernel-dev
>  F:     Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>  F:     Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
>  F:     Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.y=
aml
> +F:     Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yam=
l
>  F:     Documentation/devicetree/bindings/soc/google/google,gs101-pmu-int=
r-gen.yaml
>  F:     Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
>  F:     arch/arm64/boot/dts/exynos/google/
>
> --
> 2.53.0.473.g4a7958ca14-goog
>

