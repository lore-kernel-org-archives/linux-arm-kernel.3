Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C30EC28B25
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 23:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+UgNGYMxKBoWdnHD2tZkPFUsiCnBV2hAn5RvxjP0iU=; b=wbjzezWi087nuRr1t1lln42kK1
	UUKZQFAqM7F3fXUbKQgOPFdELRk9i3hj9ZgEjW6aBS4QXoJDDi1i3LvxsExFOyv3fxxj7pePBEp0v
	CCMkGTyNPPShYrBgTmqydbMFvTwyAOwmvYZSjbBjZg99TrKRwLDEu3tHORRW5TjqBjgWphkBNaj0h
	IkL+SLd1BGh/2WNrlQ6WUCAgO3e2Pw2tXBH7ZjgseG33B4Y8Um5T3vx3W/tzBGL0JZSbV3hQcWQIY
	IBHDguMWTMGdryP/wehPaiEktcZ324q4OyvqasRdx9GoAFMGXI+iquhm5fJD60qtbiv2Jnamvc7hr
	AZtjupmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpy0n-00000009bVd-2ydR;
	Wed, 05 Mar 2025 23:18:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwpy-00000009Qry-3MKU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 22:03:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15F405C5960
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Mar 2025 22:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98208C4CEE0
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Mar 2025 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741212213;
	bh=AuZX0k4J+y7Fl597Q3qYcQ62dP5uV+mEmKMcR183I8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E3uZLot++NoX1QuGeuB1ywM0iMCW9BY/dUHozSIe6YeMEaBBo+FNkou2slG2sTT16
	 XtrSbn+LHOsUMWCEzOHVMk/oCWHRZO24VGEOekKZ/IO4Qj3b5fcToUZlUNQuZ63kRf
	 MyUm91vjFKVTt7r+PVskaiE3V1lw/mj3eKe8/E24pUVs6adZU1yFry+LBff+QEL//E
	 mtszwk2/AhusFbB8SaPR0qD1gCmH4Ihz6V7odZyhSCI4M3fboFZzGezcE8bdAkFXN2
	 Bkp8vKGFq+015ojJivNycoBbiys1th1vAPplXsmmpiCYTDy94q1ggXBpHyaq9lNKGD
	 bYdv1twsOaJnw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e4bed34bccso10437401a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 14:03:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdtMM0s9aTelmtNO8Xm6hNDBQRr1fn0hAP9/QNkS9RzJrUIJrhi7msCdv7nVDhS/CzD2+7XnTaPhr4OI/uX2fB@lists.infradead.org
X-Gm-Message-State: AOJu0YzInxff+IrshR9HeEAzg909An3wph5/Wjy1F4wLPSlDoniOc7Jv
	pZTf8XjSwSPg37qe0/ZsvJLV889Mga+lpCPNOnVvJOnWTWMzfTnmPcCEgb41vGxe9V1ffmORScc
	s69O1uxsmMBLiq1EuLD3GbRLg7Q==
X-Google-Smtp-Source: AGHT+IEgVRtlsezpX5b++OEHsLeJ5YfSiDLhg2WTfyj9apRylNyWIq49BTWXdchR23XeZP/6kY22w/WIpF8duYPGXC8=
X-Received: by 2002:a05:6402:278c:b0:5e4:cbee:234c with SMTP id
 4fb4d7f45d1cf-5e59f37da3amr3722807a12.10.1741212212066; Wed, 05 Mar 2025
 14:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20250305-spmi-v1-0-c98f561fa99f@gmail.com> <20250305-spmi-v1-1-c98f561fa99f@gmail.com>
In-Reply-To: <20250305-spmi-v1-1-c98f561fa99f@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 5 Mar 2025 16:03:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJU0AqQcVNTJqrHTAu7wDP4bbLC8vPHP-XvdojuS8nDiQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrZJb27R_ZaDMQImLR-ewtli_PZor_H4oY5_eu3nzcS9Zd_Cj-X6G4QAXw
Message-ID: <CAL_JsqJU0AqQcVNTJqrHTAu7wDP4bbLC8vPHP-XvdojuS8nDiQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add Apple SPMI controller
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_140334_926366_69A73081 
X-CRM114-Status: GOOD (  17.13  )
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

On Wed, Mar 5, 2025 at 2:26=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add bindings for the SPMI controller present on most Apple SoCs
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../devicetree/bindings/spmi/apple,spmi.yaml       | 56 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 57 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Doc=
umentation/devicetree/bindings/spmi/apple,spmi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6404af8adec52f4631200c489=
56f4c1695e88a39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/apple,spmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SPMI controller
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description: A SPMI controller present on most Apple SoCs
> +
> +allOf:
> +  - $ref: spmi.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-spmi
> +          - apple,t6000-spmi
> +          - apple,t8112-spmi
> +      - const: apple,spmi
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "pmu@[0-9a-f]$":

Typically 'pmic' is the name used here. However, you should just drop
this because spmi.yaml already defines child node structure.

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +    type: object
> +
> +    description:
> +      PMIC properties, which are specific to the used SPMI PMIC device(s=
).
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi@920a1300 {
> +        compatible =3D "apple,t6000-spmi", "apple,spmi";
> +        reg =3D <0x920a1300 0x100>;
> +        #address-cells =3D <2>;
> +        #size-cells =3D <0>;
> +
> +        pmu@f {
> +            reg =3D <0xf SPMI_USID>;
> +            /* PMIC-specific properties */
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e0736dc2ee0e33544fa373a4978b7dae18c040c..271ff8110df83c2d4fe7fbbff=
fc0a72259460bc5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2236,6 +2236,7 @@ F:        Documentation/devicetree/bindings/pci/app=
le,pcie.yaml
>  F:     Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  F:     Documentation/devicetree/bindings/power/apple*
>  F:     Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> +F:     Documentation/devicetree/bindings/spmi/apple,spmi.yaml
>  F:     Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>  F:     arch/arm64/boot/dts/apple/
>  F:     drivers/bluetooth/hci_bcm4377.c
>
> --
> 2.48.1
>
>

