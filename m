Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D882AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ce0Iojs0+k2m2RSW3PbBmfWHM5i1B7bJFJvEZLMItU=; b=Dc8oLCAO08EPTimOOZTX5fQVFU
	3ekpZGa049zsDnSA40OPwjPxRY64IFZfF6Dzdg8VF75js3Q8Uc7+ZeFsIDI6etH5cGrsCD3F5f8EU
	XWbl3wk2319EFli/d747484qnqXmWQbUjHjjJsu2Zm6do6NfC4KfkmpAz8+oU/bneVCsyOAdLprZc
	7kBVeDxk/EtIJTOXLHoiMS5jnSh+TPKMthDMXJZGSx5SgRVUbwgQvRyu00xqMR5rdqjpetB3GoTrP
	ZaW4ozsMmkILjmecSah2NbXNkkqbtmsM9DI9qaSxm6tHO+1h6n/utEFFzE6I+8dXMFzi+Z9UINumu
	Wkb9z24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSwd-0000000BKAZ-0yvH;
	Wed, 11 Jun 2025 21:25:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQTP-0000000AtxS-11LW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 18:46:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3331A519ED
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 18:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9064EC4CEF2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 18:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749667613;
	bh=a4l2CHrqJdsjNmKQhyuxmXX7as3MmuRLONCmwbTJ5xI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t0ZCRbT1V5dmuVIwMEY9Ikzau3JW5DTjSIcQWfl6CCIP87Ji0l2zK3B6HCh3gymN7
	 jDUyYPuxEIBn9qTDHXStZiBkJagm967Oj+i55Aqpa+TX1NlmUlavLLlAf8sjiPJvKe
	 NBM4l8Hzc4DEonxtEfiHYFqKY3cu2KGo2OlT1S4MrxoZ7vyS1S97Nr/AVf58OiAxuA
	 0LaWzAOOMHcOYDvzMXxHmJZcu+yq7P2z/vWuJ7SCNlJ8QsFGMaZyf7gLrgsjbQhqCF
	 r+JYi/KJDrfZd5hMkhB1oeMgDcEDsfJl63raHKXYcU/iWtBsbD4nYI7i4vnHXFw/O+
	 IM9W77M9NfHPA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade326e366dso21288466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:46:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3xQprAvLKl1xeGoow9iIz0MGQEzuBTcHJXdAH0StRWa+1qJ2UzWl5uVFglDJzsY7ci378FDGNoVwRmI1DBp1Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0o0BhI1j7Ys8lB6ih+w+6zlCcm65JwHYnWTvLX4RM+BQyEm0g
	GFMXgiHRJqOQkLsIGuxzGZSIkBRQVzH1QRoSC7SCWWemjIiUzgL5jbnmgUAeih4aCrVIXn0ZP2c
	K03HLjSv6ccow33COXa4ij3+8sSB0Vg==
X-Google-Smtp-Source: AGHT+IEtiYLqZxPX6vg79k1l4PJrPl4a356jYKlMYVrfSiN34x4GAKFDsw4RbXmE6kLrUUCaPNybODY9V3P09GFhmaM=
X-Received: by 2002:a17:906:6a14:b0:ad8:99cc:774c with SMTP id
 a640c23a62f3a-adea9456cdfmr18086266b.58.1749667612085; Wed, 11 Jun 2025
 11:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com> <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
In-Reply-To: <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 11 Jun 2025 13:46:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
X-Gm-Features: AX0GCFsOeaA5WdIXO14g7zVwNMaCmTI9osasLBHNTNRqJq2RE6YUF5IFXoLClZA
Message-ID: <CAL_JsqLsE8JqHHEFPpNpDug0KtAPrZ54KwQ+M9=-r0vAzg4d0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_114655_417145_E30E5A80 
X-CRM114-Status: GOOD (  21.91  )
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

On Wed, Jun 11, 2025 at 12:32=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add bindings for the GPU present in Apple SoCs
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/apple,agx.yaml | 95 ++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  MAINTAINERS                                          |  1 +
>  2 files changed, 96 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/apple,agx.yaml b/Docum=
entation/devicetree/bindings/gpu/apple,agx.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..23df3ebd689b1e885eb99ca57=
3343fe7f2d09dc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/apple,agx.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/apple,agx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SoC GPU
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: apple,agx-g13g
> +      - items:
> +          - enum:
> +              - apple,agx-g13s
> +              - apple,agx-g13c
> +              - apple,agx-g13d
> +          - const: apple,agx-g13x

I'm assuming the 'x' is a wildcard. The preferred thing to do make one
of the 3 actual devices the fallback. Typically, the oldest one is
used.

> +      - items:
> +          - const: apple,agx-g14g

This and the 1st entry can be a single enum.

> +  reg:
> +    items:
> +      - description: ASC coprocessor control
> +      - description: GPU block MMIO registers

Seems odd that the main GPU registers are not first in the list, but
either way is fine.

> +
> +  reg-names:
> +    items:
> +      - const: asc
> +      - const: sgx
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  memory-region:
> +    items:
> +      - description: Region containing GPU MMU TTBs
> +      - description: Region containing GPU MMU page tables
> +      - description:
> +          Region containing a shared handoff structure for VM
> +          management coordination
> +      - description: Driver-opaque calibration blob
> +      - description: Calibration blob
> +      - description: Shared global variables with GPU firmware
> +
> +  memory-region-names:
> +    items:
> +      - const: ttbs
> +      - const: pagetables
> +      - const: handoff
> +      - const: hw-cal-a
> +      - const: hw-cal-b
> +      - const: globals
> +
> +  apple,firmware-compat:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 3
> +    description:
> +      MacOS version the current firmware is paired with, used to pick
> +      the version of firmware ABI to be used.
> +      Bootloader will overwrite this
> +
> +required:
> +  - compatible
> +  - reg
> +  - mboxes
> +  - memory-region
> +  - apple,firmware-compat
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/apple-aic.h>
> +    gpu@6400000 {
> +        compatible =3D "apple,agx-g13g";
> +        reg =3D <0x6400000 0x40000>,
> +              <0x4000000 0x1000000>;
> +        reg-names =3D "asc", "sgx";
> +        mboxes =3D <&agx_mbox>;
> +        power-domains =3D <&ps_gfx>;
> +        memory-region =3D <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>=
,
> +                        <&gpu_hw_cal_a>, <&gpu_hw_cal_b>, <&gpu_globals>=
;
> +        memory-region-names =3D "ttbs", "pagetables", "handoff",
> +                              "hw-cal-a", "hw-cal-b", "globals";
> +
> +        apple,firmware-compat =3D <0 0 0>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa163f9fe8fe3f04bf66426f9a894409..2a32c9c4ee355a1109a3e2031=
ea3663c39cc8c68 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2331,6 +2331,7 @@ F:        Documentation/devicetree/bindings/arm/app=
le/*
>  F:     Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:     Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.y=
aml
>  F:     Documentation/devicetree/bindings/dma/apple,admac.yaml
> +F:     Documentation/devicetree/bindings/gpu/apple,agx.yaml
>  F:     Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:     Documentation/devicetree/bindings/input/touchscreen/apple,z2-mult=
itouch.yaml
>  F:     Documentation/devicetree/bindings/interrupt-controller/apple,*
>
> --
> 2.49.0
>
>

