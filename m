Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59807C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiowPURGN4de6Iry0e1Jc5BJ/71dYd20vAslI7Guwu8=; b=Balp6NzFNN8fSJ
	mzbJ4PNZxtVddYEKyY4vQj34jM5LKzbMEtO7wpR995r9VG7ALjFB/Tc6S8awVfoSSVmCPIAhgpnBQ
	IGnd9vVu+2MdqnGcqGJTuT2Gx1q7qna3gsJh6DfJ5IDjKhTo2oWaCqSGeJTteEWKzkwWaA7c+FgOg
	gUwY21+km38kp3LazY91pNVZpV6PzOupZoHpbmTVHFLUlJ452ofjLuD/5sLFsWzsWoHRFxufAGR9V
	TCUA+tKPb5z97v556VuiAYRUBjmnce5BJkbV4TVVEBpDYdE89ih1ebSPD4bVPatvMk1J0B5pV9LDt
	Duvs+VkkcP5/WIih+NKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80YF-0000000Ew1T-04Sp;
	Thu, 24 Apr 2025 17:39:55 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80WN-0000000Evfq-1G3v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 17:38:00 +0000
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549963b5551so1289950e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 10:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516275; x=1746121075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CiowPURGN4de6Iry0e1Jc5BJ/71dYd20vAslI7Guwu8=;
        b=MVch1VnlU0pGAbfe8D/e2ikZvl4MzySeD01C7Q6JiHUDgFqDycdmQBMp7CPoqmHiZ8
         cHpbLxRLCHqDTTtU6kO9TsvIeUELw7+Rut5RJqevNTMBp/B3dfvzbaZiZ48t0eXK1n/b
         xc3/eTnPcAszWMPVxq/79DOOzwe43QSzdvqNVy52IogZLO0JYXff2sVozjYxp8skhck7
         6QbgtrjqaDs2ghySjEHNfZRhtq/IAHIGj3A670NPc2O1R+3Vp4hgEkb7wgypc2n+AMdR
         9GsCJjtP5UUTDw7wX6XpLTGBDfx4SPgL97df786bD4r4rIaemCZEUcfQp5dwA89F7owx
         WsMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCqXWq+VIW8Otpq08vTL+HsXynqxlEJrbdYqG2nVYenJaQbBPCJpuFckNqTQeBBune47CTJNeOnBWlv3WLP8UG@lists.infradead.org
X-Gm-Message-State: AOJu0YzN7jV2v029tyWOBx6kgSJSxw4uVR/6Cvx1+znv7FF2qd0+lepc
	GvT9aIkUpaSuu4oxnTfI+kLqNU2kuZA4xE+jpC5zwQxUDGwPYNd8+nya1Vyn
X-Gm-Gg: ASbGncvcmdkqgDP1z4sonnox0uumU4j6ijxNtRO4jvynY4P4hikwlZpVZbOODBFHvAK
	Em2OowYog3Vt+ChFU+ltMvABepoASu9HnSsOuDXCmngoExlcm7Wj9gS84BhJcZc8lzm+YJRxib/
	IGrXzHxuWKSTJDQ8FTYDVx9ivQ4f6dOHGT3m10pfAe0IYT+OAYI42RveI3rutShOWfqNvLwA95V
	cLItmqDH6w+nBktvNN7mijYHJQW09vhHjRR9yWbphGLVMg18LKBBqlASLligSLKqfzFbvVSQFLP
	phEyWJRz78Y+tKYVEuQn6ejdxU70MRYEmx4MEAa3tk9EVs48vqakAyz3qULh2guzQM1ufeWTVe7
	EZ6UiBDVZ
X-Google-Smtp-Source: AGHT+IH67uBQObatQ70D9tRygGNWI3d3oc/Vio2bx7in9vcTcYBGk+BjmtTvDCCN7pNiNUcdGPZY6g==
X-Received: by 2002:a05:6512:124b:b0:54b:f33:cc16 with SMTP id 2adb3069b0e04-54e7c3f27b3mr1332258e87.16.1745516274715;
        Thu, 24 Apr 2025 10:37:54 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9e958sm303455e87.125.2025.04.24.10.37.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 10:37:54 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30beedb99c9so12586941fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 10:37:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfJQ+EhT9swPlGdY3G57kjyDQTfRi/5e4ba/S/JyoJCAkUXYBJIqUEFcLAGn4I1w4+fdHJNEN0mwJc8EnZBDSy@lists.infradead.org
X-Received: by 2002:a2e:a9a0:0:b0:30d:b49d:7fb7 with SMTP id
 38308e7fff4ca-3179e5e518fmr13777371fa.16.1745516274006; Thu, 24 Apr 2025
 10:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250416224839.9840-1-andre.przywara@arm.com> <20250416224839.9840-2-andre.przywara@arm.com>
 <CAPDyKFop9gAUq3kG4-hs358y=N48rLQSvJaRveXo_ebVTf8gEg@mail.gmail.com>
In-Reply-To: <CAPDyKFop9gAUq3kG4-hs358y=N48rLQSvJaRveXo_ebVTf8gEg@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 01:37:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v66w-tD=--zwDBOG8qJbwBR=s9mJ32c65W88P1eazDKLhQ@mail.gmail.com>
X-Gm-Features: ATxdqUHvL4W44GNl5WKefwtfRdBLLoloQmPwAjVhg3bD1KPveNWGmCRztikltk4
Message-ID: <CAGb2v66w-tD=--zwDBOG8qJbwBR=s9mJ32c65W88P1eazDKLhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Philippe Simons <simons.philippe@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103759_337855_C3464BC3 
X-CRM114-Status: GOOD (  22.63  )
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

On Fri, Apr 25, 2025 at 12:58=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
>
> On Thu, 17 Apr 2025 at 00:49, Andre Przywara <andre.przywara@arm.com> wro=
te:
> >
> > The Allwinner H6 and some later SoCs contain some bits in the PRCM (Pow=
er
> > Reset Clock Management) block that control some power domains.
> > Those power domains include the one for the GPU, the PLLs and some
> > analogue circuits.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> Applied for next by amending the example according to ChenYu's comment, t=
hanks!
>
> Note this patch is also available on the immutable dt branch, for SoC
> maintainers to pull.

Thanks! I don't think there's a need if it's just the YAML files though.
As long as everything comes together in linux-next, folks are happy.


ChenYu

> Kind regards
> Uffe
>
>
>
> > ---
> >  .../power/allwinner,sun50i-h6-prcm-ppu.yaml   | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/power/allwinner,s=
un50i-h6-prcm-ppu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/power/allwinner,sun50i-h=
6-prcm-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun50i-=
h6-prcm-ppu.yaml
> > new file mode 100644
> > index 0000000000000..7eaff9baf7268
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-=
ppu.yaml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/power/allwinner,sun50i-h6-prcm-ppu.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner SoCs PRCM power domain controller
> > +
> > +maintainers:
> > +  - Andre Przywara <andre.przywara@arm.com>
> > +
> > +description:
> > +  The Allwinner Power Reset Clock Management (PRCM) unit contains bits=
 to
> > +  control a few power domains.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - allwinner,sun50i-h6-prcm-ppu
> > +      - allwinner,sun50i-h616-prcm-ppu
> > +      - allwinner,sun55i-a523-prcm-ppu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#power-domain-cells':
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#power-domain-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    prcm_ppu: power-controller@7010210 {
> > +        compatible =3D "allwinner,sun50i-h616-prcm-ppu";
> > +        reg =3D <0x07010250 0x10>;
> > +        #power-domain-cells =3D <1>;
> > +    };
> > --
> > 2.46.3
> >
>

