Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B73CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyNm+tCozG9qC/jzXWhOIDRR2bJgq3G4UbsBRU7rbeo=; b=qjMeVtPm/NslQKqNNqGxgcg8PW
	v5akAoyN5kEmdw5K8tLbJjDre8awHj3LNeqf4MU5tGmSgVKnJeqLvDO8oeNSf8zsoNn8NKEZm5Fhg
	GhBVAN1Xc7J/lc8+pbE60U+k3eki9iSfJK4AfGZ+CLdq8IK1/0dZCcUu3xZbraUGTAfya6Fn3gt5T
	ZEnrH1ZQ7rTARvxjOPDLTsd5cW6mVVVVNftddGPZk5Z9GPR9dC0rgBw330uoJOOzzvFzVlyRIm1Xw
	r8X1frMPLZpctgPCzQ0Ln0dp03ujNcR1jlepGlTI1aahuC9e/1YQeXGtLXYAzlgRF9fp9frlqWmb3
	RgrdHckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyNw-00000007hMq-0UYu;
	Fri, 12 Sep 2025 07:39:56 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyNt-00000007hLt-20HI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:39:54 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-336dc57f3f2so14213201fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 00:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757662791; x=1758267591; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyNm+tCozG9qC/jzXWhOIDRR2bJgq3G4UbsBRU7rbeo=;
        b=mWgoTSFvzuFeJBefP1MiB1l949ZjNsLNGrO7ZWdbTB/EM6FlqSlkL8Dwx8t9qAaS2k
         UPg0YtS+O2IXbATpGiLZxGgY3LAyI9HDs6dsOriYU7oXxfEfg11a6NSF5AaDlVVT1jfX
         53owEauU77T0sGaW2E5pbv1wX03Q+Dnh7MeGt8MHWTpfVNGIGxB7FdOZ4vrZ+31Qcn8X
         sFfCYA4Mi+GAvR3vCmGjYbDLiaIN37mSC7nqcRGYaBcPHrvHolMnQXKQ3aDA/ZtvmW3H
         9m6j7nqOZakX+aKMKRsHEoTpCPGKVoW7uO0zLJ46Su2I7yb6VlupPwjp+ZgW91Oi0hps
         RCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662791; x=1758267591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyNm+tCozG9qC/jzXWhOIDRR2bJgq3G4UbsBRU7rbeo=;
        b=m2+MBlbLsptDrwgwYoPDK97aSvdrFniZwp2XXpW/vTfH7clKQbliNm2QwTjk+GeUo7
         wYhVu1wNxzGzAPlvow8no1y4rEXSw76OdT0D7nDMZd5XhkfNt1kSuCnArGPq4+4YFOPC
         eZXds4n2AkyOCcoyNbH1ON9C3F96dzJQvvX5CbZ1vRyEanojjUGANRoHKE7IyIdWFjj2
         wCI4TmVW8PFE8RyRZiPleJd+4+rhdRUI8tB0KdVU9WbrtVZdMMvyMzHkZJvN6HXJqjYB
         SFF554mBCRMRS9v17MKaYSn3HwJsP8PQEhWpdhKul61TfeHwnmCTT7Fi8an6MI/MqlzZ
         PFLw==
X-Forwarded-Encrypted: i=1; AJvYcCWi26ynsGl1GeWABsZ6NV//5RrJK0BoRO2PfF4g/kJU6dRNfL4ukloI6qGx8ORrMmGl4H0l8m5ML/9A9VC+JAeb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2SHX/cUmJSmFMNLQN8n4x1lNbX1vV7uhmDV6pgHTWHG+T8e37
	GO/8N/GT6TMdv0IFJTpzD4sALNqOEXHZw+xn8dC51VsjeUuDhjBVjw+8HZjrgzaf2wDXUNVTkjz
	UMevFM5uU/NeqrYl7zO0FcixfrLDATTmwWyAhE1Szeg==
X-Gm-Gg: ASbGncvCDtw6XY1DuBJebHkaMJplJW0xdx8qB+MMPiD9cAXeCF0lUQ+NGCcdMsQRvWz
	gAWZx4uE9gIH7GOGtyvAsNk/JDeirjSg3pFUrPTJpYMqRgGKdw/IYzZ4sFVqPJulKkxBX902Snt
	ALFWAETFkTMAC59Uza2qZfti8DCsg6f/m15MefD2wxzu+c38UA3dnQI0fC/WXyUMYGTpIsU24Av
	4WajVGSeKLkywGr3w==
X-Google-Smtp-Source: AGHT+IFXhI72vA/Xl1/pwftRCAsBnAJuIIqpKbZ1iyqRFZv+GhkiusAWIrKwOOg8AJLBaWAuYGw0FY79HwX8vz25qic=
X-Received: by 2002:a05:651c:20cb:10b0:336:cf86:d40c with SMTP id
 38308e7fff4ca-35140baca49mr3560901fa.39.1757662791293; Fri, 12 Sep 2025
 00:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250912060650.2180691-1-gary.yang@cixtech.com> <20250912060650.2180691-3-gary.yang@cixtech.com>
In-Reply-To: <20250912060650.2180691-3-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 09:39:39 +0200
X-Gm-Features: Ac12FXwf3MTYvZ4rNhkqF-Rzzb6ggnJzjTZergFSHBamVYSApC1yF4VRUAQLrOE
Message-ID: <CACRpkdZKW9Pn4qJ_Fq=-VFk4KJLmoBqsNooU8bhLE1K4F7STtQ@mail.gmail.com>
Subject: Re: [v2 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_003953_557450_5993A14D 
X-CRM114-Status: GOOD (  17.77  )
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

Hi Gary,

thanks for your patch!

Overall this is starting to look good.

Please make the bindings patch 1/3 because we usually put the bindings
first.

Some comments below!

On Fri, Sep 12, 2025 at 8:06=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> The pin-controller is used to control the Soc pins.
> There are two pin-controllers on Cix Sky1 platform.
> One is used under S0 state, the other is used under
> S5 state.
>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
(...)
> +# Client device subnode's properties
> +patternProperties:
> +  'pins$':
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      '(^pins|pins?$)':
> +        type: object
> +        additionalProperties: false
> +        description:
> +          A pinctrl node should contain at least one subnodes representi=
ng the
> +          pinctrl groups available on the machine. Each subnode will lis=
t the
> +          pins it needs, and how they should be configured, with regard =
to muxer
> +          configuration, pullups, and drive strength.

I'm not sure the binding maintainers want this info here, if the same is in=
side
pincfg-node.yaml, I would just skip it.

> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, an=
d are
> +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfunc.=
h directly.

No reference to arch/arm64 in the bindings please. Just
drop this.

The bindings are used by U-Boot and FreeBSD as well so these
developers will be confused by any Linux-specific references.

> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            description:
> +              Can support 15 levels, from DS_LEVEL1 to DS_LEVEL15.
> +              See arch/arm64/boot/dts/cix/sky1-pinfunc.h for valid argum=
ents.

Same thing.

> +
> +        required:
> +          - pinmux
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node
> +  - |
> +    #define CIX_PAD_GPIO012_FUNC_GPIO012 (11 << 8 | 0x0)
> +    #define DS_LEVEL4 (4)
> +    iomuxc: pinctrl@4170000 {
> +        compatible =3D "cix,sky1-iomuxc";
> +        reg =3D <0x4170000 0x1000>;
> +
> +        wifi_vbat_gpio: wifi-vbat-gpio-pins {
> +            pins-wifi-vbat-gpio {
> +                pinmux =3D <CIX_PAD_GPIO012_FUNC_GPIO012>;
> +                bias-pull-up;
> +                drive-strength =3D <DS_LEVEL4>;
> +           };
> +        };
> +    };

This looks good to me, I don't know if the bindings maintainers have
opinions on the placement of defines in examples.

Yours,
Linus Walleij

