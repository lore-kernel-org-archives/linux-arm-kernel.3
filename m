Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDFECD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiN95M/W3RKJE3egtZ7DgExVN40C9ma45InA4oM+ByQ=; b=vNBMEEGmeVJdgJsHRe/ZBNr3ru
	HMIZexQcK9u6NHZGnMcz9iEahzxlo/0na2lujY+v/0X/jToKXXxu0TTXeguvOEb/3QJJ6ouOsizYe
	WsdADLHEsyIBxMeucfOKLxV4xIwwcNQW41C1uQOSVtOItyQHMaCd8EGdQiCbMgxjA9mrXtA3RYz08
	2UceDQPr0t8uE75LTF69MuKNEPAL4DkXBMOSUPY2m/Zt2iGrqyGEMtM1FHQ62VYwc0P/fBRGqELhc
	ilSIX0a9yplCTFWbIV357lTpWOnjRwEARg9EnvPMjWR0NVITN6612WQD9C5+nOu080cPXtPNyz1FB
	5Xpdy4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5Kd-0000000AxUf-1VWl;
	Sun, 10 May 2026 14:40:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM5KY-0000000AxTU-1Q1N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 14:40:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso39779125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778424028; x=1779028828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiN95M/W3RKJE3egtZ7DgExVN40C9ma45InA4oM+ByQ=;
        b=oydInLzDTZbY1V0T0ppPzAHqopDstxaV6BkluAUMKTN6RbHnABICvJzgwMT0EZU/Lb
         aS8RzGo0l2o9SVLQ6Hvcn2lL2ngPazPyomAaz1DsBSB2RUs6zmRhfXwclV5ToFXxRilp
         JBMnqKE1K2iznNYPSWmajj3drje+/xdCB1npuWPgbnToHO0ExmUCUTvnfJZ47rprYVs5
         EuYIdAC1E+GCjeKUIIotqlrNuW1CYs2FBsAdI+YuO5vko3DHBT7XREqY7XK5SoprFDEU
         cX8O7C/R6q3kD0CGDzpii4fnQ774i0W3/gxbnZFoGEC2pCn94oQagfX43zRIPQ+k6yV7
         8DXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778424028; x=1779028828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hiN95M/W3RKJE3egtZ7DgExVN40C9ma45InA4oM+ByQ=;
        b=EDmwXlytsF0ABpedZOGP6aNM0hGtloEa6XhK7DcpcNPm7UN1jPDHGhhfx+K2zxUdOz
         8mOnZRNysOnixnfsHTYSjACHOzXBE5ymVixQTbP0v9n5qdelxINLU+y0+0zwDYDPjXA4
         uSi87gAf/OMFpuVkGNxwrUSENprxVF49cJ+UXrAWdCdsReezBJhmKBI7H6pPfSXrgOwo
         3azZNvZ6dZ6vEQQVv7lsu3Hbon1yb4Qzl1qrWhkohhxObiwKm804WcNpkbC3xFtfQDZG
         8bEyofgVVzXn28a/dZbbsi/ckAkicGGhGCpUiWTsXt5PHTfghgP/dd4ltD2ePA5ijVzL
         3Lmw==
X-Forwarded-Encrypted: i=1; AFNElJ96vW/85dyZvZ1thjTZd5jnhobXrQPWWg57u11m9UdrO+/ijUBReqiLADqkhrl0eBJuTyz+CeD9ZL/F3c006xzK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz4uWMbtwU9ffL2bYviD/laMmYldHwYjnfnZ+dSvDixWKnA86Q
	Daf2hzgLbI+GPPq1wAKf5+w0Wm/SOxSjyooeCpWqu8C1RhSLqEhqzpCY
X-Gm-Gg: Acq92OGUE30O4vjq5C2nKp7dlTHq6FzeB5S9bmasWm87jomCoFuQwDR5RqjXmvP8yhb
	SOyXMVyiHwVTp8RoMvjNxBW9Kzt1elKS/XgTwbQVjupj7eXRTEbnEAN7ffHbZOvM/R/jP7GKhdz
	Ry8KM6DloIlhO24nKDTZLIZSULF9fwh7GC4XOhQXHv/IsrT8XLscIdghTu6hk1Rr4qTaSEqyPIq
	12PV7/pCtWGWw148N0e6Ce9A7ZPgwauBjj854Mfz0iCY/3nRbDqM/rTCx3Q9lK8kngEZHJy0ud9
	XJkfNjaVSl77HmJHBAY6Myx1Ynapu7wJ4lgze9rW3ifvQ7dcMf3ckoD0oy7m4KKg1hj4jZbM63U
	99dux5KeD3Ep3VN2b5ZqG2fs2q4Ehj0754Ln73AOerCeQG+XfGNFAa1azvPP7UfZMvDHZu34xyJ
	o/Pc2/nCbybKcH7/C9f4fyXjCkqsM2zucKswjbLlBwFzMHtT0VhtH0PMen6JzwUvgMF1OrLPhMw
	MueBYqp
X-Received: by 2002:a05:600c:4512:b0:489:284:44ab with SMTP id 5b1f17b1804b1-48e51e1deedmr319196545e9.12.1778424028175;
        Sun, 10 May 2026 07:40:28 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db09943sm44844115e9.19.2026.05.10.07.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 07:40:27 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner A523
Date: Sun, 10 May 2026 16:40:26 +0200
Message-ID: <5JZHjuPfR4qv95vQhkLpDg@gmail.com>
In-Reply-To: <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
References: <20260510-sunxi-a523-gpadc-v1-0-4f6b0f4000fb@mmpsystems.pl>
 <20260510-sunxi-a523-gpadc-v1-1-4f6b0f4000fb@mmpsystems.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_074030_424123_497E9180 
X-CRM114-Status: GOOD (  14.91  )
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

Dne nedelja, 10. maj 2026 ob 14:57:22 Srednjeevropski poletni =C4=8Das je M=
ichal Piekos napisal(a):
> Add support for the GPADC for the Allwinner A523. It differs from the
> D1/T113s/R329/T507 by having two clocks.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml         | 37 ++++++++++++++++=
+++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d=
1-gpadc.yaml
> index da605a051b94..89da96cd705f 100644
> --- a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc=
=2Eyaml
> @@ -17,6 +17,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun50i-h616-gpadc
> +              - allwinner,sun55i-a523-gpadc

It shouldn't be combined if it has different number of clocks.

Best regards,
Jernej

>            - const: allwinner,sun20i-d1-gpadc
> =20
>    "#io-channel-cells":
> @@ -29,7 +30,12 @@ properties:
>      const: 0
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> =20
>    interrupts:
>      maxItems: 1
> @@ -40,6 +46,35 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - const: allwinner,sun55i-a523-gpadc
> +            - const: allwinner,sun20i-d1-gpadc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - description: Bus clock
> +            - description: Module clock
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - const: bus
> +            - const: mod
> +      required:
> +        - clock-names
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names: false
> +
>  patternProperties:
>    "^channel@[0-9a-f]+$":
>      $ref: adc.yaml
>=20
>=20





