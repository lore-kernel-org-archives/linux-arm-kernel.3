Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A243C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 03:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEAcyQxjxEddEf75aHlB/SZ9GV/mTO73qRXKgW1f4Hc=; b=x/rs6wJClklxN9
	Q7GpPlX7gb2XeC22CmrsXnc6gaG4tpcWFNJqXLJ9gYd5JnK9I8MiG/dTfzYQQLJEsA5b4nYO+Dn4C
	ryESMU/kOxr798o+cUl9ClF0z2CQQ06+vcav6MDY58Vs5gwonRJfUg/v7G58p3D/VqfghOBF1B5IG
	QweTGdMo7309BpZ+S/VsybxoT6EQkf5tW0nz5PpQtiPfxQFCKGmlA8sBSLntML+oNfNkv9K2kPqs8
	oYYKsgZencScYH9yaJusHH8VquGimhibFMqm089bwNS7OKi4UavTa8q2VK6yt9M1Gotba9VEk1PZ+
	Hq6Mm8F0BfV5l4dNvIsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Fjx-0000000Bb3W-1xXs;
	Thu, 17 Apr 2025 03:16:37 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Fi6-0000000BaoD-1M1R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 03:14:44 +0000
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so2958611fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 20:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744859674; x=1745464474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lEAcyQxjxEddEf75aHlB/SZ9GV/mTO73qRXKgW1f4Hc=;
        b=sskGSinwJH4mdLkNV2Rz8cXjAFYxjGhj3Jc5+6wHIkAUMj2u/LApgzT/Wan73Ji+mc
         ihlv/P9HV+PY1AGkkdmP7OkTISMojh+yMJ8BgFKnta/iLCj0uZEF/FOHpCfy4t7C/Yi8
         WeJRvI8kywdST9RzhVFh3S2fu27OHub3os8KQKmX1Q/8M+jdyo9srPPCmFw6I1Ek9htY
         W3wQpc+MMU6ZVOdfNE1fjdlSxi4zFHDc2nqOPzDJVag1YXXDH05MDUNMuoKLq8+e7dg6
         VfGfJ27nfJ+XVANJKLrKfs3TL7eRsYDFNXuHsUb9/XVX78bScv26YspTdZ8knWJPjAi7
         sH5w==
X-Forwarded-Encrypted: i=1; AJvYcCXnZbv4nHBOPNE8dIk6T1lPp2S4h7ZHT4yPP8dVhpjcgi3SZBioa2mv8OdUEKwshdU2liV81HErql2IagOec7l7@lists.infradead.org
X-Gm-Message-State: AOJu0YzX1Yr1ySF9GwqCcbYXmUDeUUrgLkm58249U2H6neyOBZ1x+CN8
	tSLIZ5414sAqo9OfQLoR5NRGgW5qwBRqkQIxc6/ULoGP1Bcnf2K3HC+KwmzW
X-Gm-Gg: ASbGncvMUuQiI9JloIUWkvxtdjvFtyswOmOV0iZN0RaXaMEx6+qiD1FZRmcTp4pFQ52
	OGMOog8rAoCy67i7tkRiQpHf0y5NQGHUpYXBcxcMAzdJHzNP7Dok2K5TbuCY4IyOpcNDbKbqaBG
	hCrx3V8Db0n1YOJJddGKW2bIDoKGmIXT+cXombO/chYs/GNGKjsNlynSFr+Rk4LSw8kU/lRVvEn
	A+UrIuW22YsrajvrElF4YNeRMCjPdq1yDUU1dM158+C5gQFFCIRToHiafNnOxafMeiU8SGNEONG
	ZXxuUp3308/0Yl0fkNDnTdPOWPugmQvpnp+gQ1++J4wDkL3yr8/Bb1LXz583/mROGxPbljyOeQ=
	=
X-Google-Smtp-Source: AGHT+IFeS6As7Zzfrr6GVyNLxt/GN53oBBurBvaRwTvbozRcJsBv/Lat0NMB2FVF3dKrJuIChjYZuA==
X-Received: by 2002:a05:651c:30c2:b0:30c:3099:13d0 with SMTP id 38308e7fff4ca-3107f6ce071mr16267581fa.21.1744859674311;
        Wed, 16 Apr 2025 20:14:34 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31081468ef3sm2713651fa.49.2025.04.16.20.14.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 20:14:33 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so2958141fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 20:14:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2L4U2g2EW2eY04uPRZdCB/nqrZlpYu9L8KFcyvCDhFxnRP+hNCTzJn6nynkCCjD7EL+lushSL0O0ChNWOXV6F@lists.infradead.org
X-Received: by 2002:a05:651c:30c2:b0:30c:3099:13d0 with SMTP id
 38308e7fff4ca-3107f6ce071mr16267491fa.21.1744859673381; Wed, 16 Apr 2025
 20:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250416224839.9840-1-andre.przywara@arm.com> <20250416224839.9840-2-andre.przywara@arm.com>
In-Reply-To: <20250416224839.9840-2-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 17 Apr 2025 11:14:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v67-wqA4A1=NKee0JNEW2+SABdixN0H-HBg8aJjGZjKdJw@mail.gmail.com>
X-Gm-Features: ATxdqUHs7z3ZrbeWhMV3p3pM4JurppAfWHNtXUVUqdTkjloev5549-NL7E-N6XA
Message-ID: <CAGb2v67-wqA4A1=NKee0JNEW2+SABdixN0H-HBg8aJjGZjKdJw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_201442_390116_0C63981F 
X-CRM114-Status: GOOD (  16.96  )
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

On Thu, Apr 17, 2025 at 6:49=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner H6 and some later SoCs contain some bits in the PRCM (Power
> Reset Clock Management) block that control some power domains.
> Those power domains include the one for the GPU, the PLLs and some
> analogue circuits.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../power/allwinner,sun50i-h6-prcm-ppu.yaml   | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun=
50i-h6-prcm-ppu.yaml
>
> diff --git a/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-=
prcm-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6=
-prcm-ppu.yaml
> new file mode 100644
> index 0000000000000..7eaff9baf7268
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-pp=
u.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/allwinner,sun50i-h6-prcm-ppu.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner SoCs PRCM power domain controller
> +
> +maintainers:
> +  - Andre Przywara <andre.przywara@arm.com>
> +
> +description:
> +  The Allwinner Power Reset Clock Management (PRCM) unit contains bits t=
o
> +  control a few power domains.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - allwinner,sun50i-h6-prcm-ppu
> +      - allwinner,sun50i-h616-prcm-ppu
> +      - allwinner,sun55i-a523-prcm-ppu
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    prcm_ppu: power-controller@7010210 {

This doesn't match the address below.

ChenYu

> +        compatible =3D "allwinner,sun50i-h616-prcm-ppu";
> +        reg =3D <0x07010250 0x10>;
> +        #power-domain-cells =3D <1>;
> +    };
> --
> 2.46.3
>

