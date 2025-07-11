Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE25C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KH5AFNkQfuVWbiRBmKTQngI4D6xLZ6iRLprTVywV+pY=; b=Yl7WkiqwbS721xguxQdzpNmhth
	wvpHHQJgjA1uIgQLQJNC9pAlwkPPZpLsmDwLg3O1MgDi0lur0qWWox75L/Vxu/S/Bg3R4T9yBTiP+
	T0bqVPZYl1VeX+eefyRG7XqQKLN1vegAN6vfFk8uZQ9uBD1kUBIwsRHq2FHi3C14eEhnRotTEFUyU
	MRL+5IYG4725N/RiydhmPGdAwKmryuOL4+SLJx+ErlLoVWEwlcg67CUysySfczDTxDfTuSyO3mVtl
	SGO+bSCA15vkA84ouveC+nlY1ASK6CrAeISp2zeI+T7W6y4ujFKpbqMX4gNji+P+VlNl2UtW3q8Ju
	joY+ud0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGtH-0000000FKVC-2Hwz;
	Fri, 11 Jul 2025 16:46:27 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGCy-0000000FDg9-3dRV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:02:46 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-70e3c6b88dbso16785237b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 09:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1752249764; x=1752854564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH5AFNkQfuVWbiRBmKTQngI4D6xLZ6iRLprTVywV+pY=;
        b=hGE1BheoJS5dO/N0Wuh/d245BgXrsQHZgfmasPY15ZeFOgFpVEiE7LT2cYAF2c4GkN
         qOZtOMynskL33u+toUMCWEiepHUea9y1glkfywGKxB023OHMdFnBP/2UA/SyROQL7sTD
         z4qob8EsG28G++bIoK5Je/88HNUz+k4N1FsRiLGtv5+z2Xmg+tIaW5aiomHBn73J5cnw
         PROT/JlATbFhGUUPSxXVI5JzVEdq8H2NJ/v0rjgMWJnh9HQSJneIzjPZlHsMGaIZQ7qQ
         8S/r+D/ODgj4Qq3+yjeFHipDdf0/nxBJ8lsYq5vJyPsi/jFiBZUMgq5vD0jwIINqykqx
         uw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752249764; x=1752854564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KH5AFNkQfuVWbiRBmKTQngI4D6xLZ6iRLprTVywV+pY=;
        b=AB7lckx9AMnBX1/oD2w8RiKXgeSbZ3Ehk1IVnKZF/7yc9vqDAm1Fxrc7oqbIRzRNfJ
         /hqj01pCVkOGT8wjodsbkh9wym1IqoqT6RKdd+yGkID5dQVcTvnzo79F1EZB25kUJLbn
         4MBKZ36q6bKNFeSUQk0oyJM2otHwTt2YT3vLFAqar7aPzPRyYk+i8e3SucqRPkZwUn7g
         WD33z0gIve8nrhJbvqFvLVfoVGnk8+qlgPVVOIIih2JLwed9bvlkpDBvuQjUdvHRwQwJ
         mIyR99OTv9XeqGYrjtvKe0ZdwXEqO3zufIVulA4Zs0FEDsbZyrmuJ64FKzvwMhr8vgDm
         ouiw==
X-Forwarded-Encrypted: i=1; AJvYcCXiERH6Sryie2f2DljJT6pmb122eaUx/B5D7ky0sj1j0Ipt74Te/RCCbBwRUSFWV0y97DadY7L9/RhnsXMQQbIa@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqc7d0LIC4/mNWTwmaVtKzAYcNubJ5tDSSk2edvIUk/DiomXRg
	Hn9iJpveLpL0krrsUSSSt1JifGKpcLRVj7TK5VsuhETEZ2qN9aoYBz5auL6eA+2HXDx1/ycvJe9
	7iQDWJ98RZg==
X-Gm-Gg: ASbGnctWQOhyXlMnha5B4EK72V+jL4wTh+47IUwEFr8XebxW0pek9DoJawJTQXtxqoY
	P54S7sAnt9OuIDWOy4W99eZymWNwC3m0Nlgy189Huhm2n0SogGmyZqW0OmHpF0Ua5mXz1pcqmeU
	HCingzPjQZQc9/WA1Mn97m41LwGuvPClfk465QmEGx15VyKtAdXhEM/0I+EzkJPBl4jfCJjIChi
	Pec3+rSZYHmUYY/7XKJYCdR5ofbhkGvqzRom62uRlOVOsxX8GtV937dZu1/0pqWyIjjuLBZEdzc
	72XkFNu0YDRtF43QwuMQWI0HvgreQiZ+XEnQkIThfVkV+81D4sNpwYAGFvj08Sg9bjpdaBsfMQy
	v2JNKBhu5bT1KY0TB289Yigy3I4qWay1l7ksidtdG/ANcYNTQKb9AAV+unO1Mt3sgXg==
X-Google-Smtp-Source: AGHT+IF692e0QaW4172k2YZ8PSwEKqPioABQ2oIq55rUNDDdw6U28b4baK1IphaobbA8znzW3GtwWw==
X-Received: by 2002:a05:690c:ec6:b0:70d:fe09:9b18 with SMTP id 00721157ae682-717d5c373a9mr70751497b3.2.1752249763690;
        Fri, 11 Jul 2025 09:02:43 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c5d73ae5sm8003827b3.46.2025.07.11.09.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 09:02:42 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e3c6b88dbso16784887b3.0;
        Fri, 11 Jul 2025 09:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDXmCT5WN0caM6J8b9MKdJm/6bn3FuSO8Kkiy2y02gmWFxo98j2gSU+1zmJwjshppSp40GrJ9cRqvVfiyNLMk=@lists.infradead.org, AJvYcCWmzpB+epPGFF15zP7CveVzsq80G4j5bxHqMlK7Mt+VZtGTwACu8h+JmHddA+9KML1/q9Iu6fngZrxry5t0pxYL@lists.infradead.org
X-Received: by 2002:a05:690c:b91:b0:6fb:1c5a:80ea with SMTP id
 00721157ae682-717d5f06565mr68541397b3.32.1752249762154; Fri, 11 Jul 2025
 09:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-6-dc16cfe6fe4e@tomeuvizoso.net> <a8c3df16-a460-49bb-ba4e-1a07135d24e5@arm.com>
In-Reply-To: <a8c3df16-a460-49bb-ba4e-1a07135d24e5@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 11 Jul 2025 18:02:29 +0200
X-Gmail-Original-Message-ID: <CAAObsKCinmbFwRqWTOCB3uoH0YLUm3wkvQ7GUhtESzHnAieGxw@mail.gmail.com>
X-Gm-Features: Ac12FXxOOfjV90DXXXBg685kI3y2UMTJtFOhXoVtyQciGpdKZH7V2bdydsxAp7M
Message-ID: <CAAObsKCinmbFwRqWTOCB3uoH0YLUm3wkvQ7GUhtESzHnAieGxw@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: Robin Murphy <robin.murphy@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_090244_913897_0CF954C2 
X-CRM114-Status: GOOD (  32.14  )
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

On Tue, Jun 24, 2025 at 3:27=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2025-06-06 7:28 am, Tomeu Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >    IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > v3:
> > - Split register block in its constituent subblocks, and only require
> >    the ones that the kernel would ever use (Nicolas Frattaroli)
> > - Group supplies (Rob Herring)
> > - Explain the way in which the top core is special (Rob Herring)
> >
> > v4:
> > - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowsk=
i)
> > - Remove unneeded items: (Krzysztof Kozlowski)
> > - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> > - Add reg-names to list of required properties (Krzysztof Kozlowski)
> > - Fix example (Krzysztof Kozlowski)
> >
> > v5:
> > - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> > - Streamline compatible property (Krzysztof Kozlowski)
> >
> > v6:
> > - Remove mention to NVDLA, as the hardware is only incidentally related
> >    (Kever Yang)
> > - Mark pclk and npu clocks as required by all clocks (Rob Herring)
> >
> > v7:
> > - Remove allOf section, not needed now that all nodes require 4 clocks
> >    (Heiko St=C3=BCbner)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >   .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 118 ++++++++++++=
+++++++++
> >   1 file changed, 118 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0588c085a723a34f4fa30a9=
680ea948d960b092f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,118 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks.
> > +
> > +  There is to be a node per each core in the NPU. In Rockchip's design=
 there
> > +  will be one core that is special because it is able to redistribute =
work to
> > +  the other cores by forwarding register writes and sharing data. This=
 special
> > +  core is called the top core and should have the compatible string th=
at
> > +  corresponds to top cores.
>
> Say a future SoC, for scaling reasons, puts down two or more whole NPUs
> rather than just increasing the number of sub-cores in one? How is a DT
> consumer then going to know which "cores" are associated with which "top
> cores"? I think at the very least they want phandles in one direction or
> the other, but if there is a real functional hierarchy then I'd be
> strongly tempted to have the "core" nodes as children of their "top
> core", particularly since "forwarding register writes" sounds absolutely
> like something which could justify being represented as a "bus" in the
> DT sense.

Actually, I experimented with having the three cores as completely
independent units and things just work with how resources are
referenced in the DT nodes.

So I'm just having a top-level node per core with the same compatible.

Thanks,

Tomeu

> Thanks,
> Robin.
>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3588-rknn-core-top
> > +      - rockchip,rk3588-rknn-core
> > +
> > +  reg:
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    items:
> > +      - const: pc
> > +      - const: cna
> > +      - const: core
> > +
> > +  clocks:
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  npu-supply: true
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: srst_a
> > +      - const: srst_h
> > +
> > +  sram-supply: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - iommus
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +  - npu-supply
> > +  - sram-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/rk3588-power.h>
> > +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> > +
> > +    bus {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      npu@fdab0000 {
> > +        compatible =3D "rockchip,rk3588-rknn-core-top";
> > +        reg =3D <0x0 0xfdab0000 0x0 0x1000>,
> > +              <0x0 0xfdab1000 0x0 0x1000>,
> > +              <0x0 0xfdab3000 0x0 0x1000>;
> > +        reg-names =3D "pc", "cna", "core";
> > +        assigned-clocks =3D <&scmi_clk SCMI_CLK_NPU>;
> > +        assigned-clock-rates =3D <200000000>;
> > +        clocks =3D <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
> > +                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
> > +        clock-names =3D "aclk", "hclk", "npu", "pclk";
> > +        interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        iommus =3D <&rknn_mmu_top>;
> > +        npu-supply =3D <&vdd_npu_s0>;
> > +        power-domains =3D <&power RK3588_PD_NPUTOP>;
> > +        resets =3D <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
> > +        reset-names =3D "srst_a", "srst_h";
> > +        sram-supply =3D <&vdd_npu_mem_s0>;
> > +      };
> > +    };
> > +...
> >
>

