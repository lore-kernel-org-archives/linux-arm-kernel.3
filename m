Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832FCCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZ6rxnhh7QouGGcSBJApcqvcuY+RYoCVy1LFm/ChHAI=; b=UuFt/1TkLru45WZIA23juYkIHO
	p6BJHAFvV8Pc1zhAOLLh6oEPL+0IS1eS9xcyVX40boMwCTVcQucWjE88Tqu+GZjMZtRFQfbC8ioda
	43nFK32FogTRvrMYM4BiDmWRum4Ky6CjLCBnOhFrSTrbx0jUNEzR0D3ipeZ+wdGXOe0NC5b1BYxbn
	j+e3r7loE1/0efXhbLU9qww0zm1sDr1sMwft/TVWleti01CIYa7cQViWqxX2tYyQgsoAVCDKo3dB2
	A+NsXXNSNTy9mauAFNyMUpfGdyKA0M0TRwKFysKi5KDe7rzeim+deTXSDTe41zk+7/lKn8+ZuSl9Q
	iIWWd98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytxg-0000000Cek4-2IAf;
	Wed, 17 Sep 2025 15:20:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytxf-0000000CejS-3aJa
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 15:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tZ6rxnhh7QouGGcSBJApcqvcuY+RYoCVy1LFm/ChHAI=; b=ZQ/zvYk+mh+VWspk94oDq76qIf
	/QjCR+yY3+LbF65u0R314uefaKSt3S0cfp3OVz7ltbMbX1Z5yFssX+LfYfM9EJiMnUusFhG9wK6Nd
	pxJZZ3sDWxC6Bi5L295OzVoz++viPb0ntIrDJ/9R2eYypG8p788uXxn6jeTUbfH0Jycyojj/wwQQs
	z1BybmNFZfSoKtlEUtQOfWRW1WJyYNTxNb9F6YK+Q1gRGaBpIHhF9ImX1MhR/FDBca24pxjLw0QW6
	lMGm9JaUhop15LM5qcl/aCaZVt0iunjE1iuprOyH/TCRweKPv8W6c4/TaSnNeHyHwzDjPWGsRWEoE
	jjJO6dgA==;
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytxc-00000007QJ0-3IDU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:20:46 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-758a28587e5so3833713a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122443; x=1758727243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZ6rxnhh7QouGGcSBJApcqvcuY+RYoCVy1LFm/ChHAI=;
        b=OPp1i7llNuo4JSs98FAWlkz9zBlMVBF5wPPi/XdMyvrW78O1IhzWXMGaEYEbn7WsdD
         P/kg1UzKJB+ZgJz0rSKt98DwdWeC199MXlphYRaSy+dlMmM1zUPdCu+uTd4wIo/B9VSw
         u/U3ZH3xbDc2pXSmGvDcWhiLURT0eyZ2pcY8nUx97PmrnjPwoDhdoxefchFn+kBvyL2K
         DDuvjIlq7cXBvi09dxgefCnaWsLbilfKjYCLF0Ns1+pwy6EEkdJg8lyA62ccoBpeR8Yt
         Hr4/0nfwN/loxtLhXKwMyWCgcousc0Eie2IazpJASYmvUAYfcnSd+0rcJq8je2mqpUFt
         hl1A==
X-Forwarded-Encrypted: i=1; AJvYcCU4SwLjtAXNkaDSUi2/9nUzyVLArzHBXRSdtMxRO1BKepjvrkg8wHbLy6oWh+lwosd1+YL1KnEE3jmy8qhZIZOu@lists.infradead.org
X-Gm-Message-State: AOJu0YxM8CWC7CCRyL830k1mSVpONkJporLDExsU9QhY4XHd1khuIL+P
	UkfrXId/8tBy1L7DspQDqHakOYokMyQXZszxZldcANXHdKiUPPoDASqoQUFp3yCbsLc=
X-Gm-Gg: ASbGncvA/Tm3gqD3GvxQxQ109Wk5LPfrqpjR2h24Fq7NWnEITTk80ubWdE7+rsW0hhX
	ZIhp3Foo8P8QTZACziBpbEy+xLK6FNkXycZPv/vDtkJ+hMipc3tqBKOAuKxgSGzHC4yLu10Gl5g
	vvdeU47xmrt2uEVo567uljvgZesEPsLOFHNV0BhE1KxUqh1jsovO9FEk3hYnMJK9tTRAAjz+uYZ
	L9uwJpo+JCFEwI8Md1lRWdz5rza6krPGPkAtce4aCu1X6t/09I//BXNfi7C/+efGqkHAUB8anUx
	wuIJeGsfx2wPO60o2D9ZUqhAVQzlbnbK5JSbHr07guMfn+JhHaBZUxd5cnEsWYhWCDAEBBvH4qt
	+juJvc/cZCXd4naj+AA1yGs1DWBp8MWn9k4fFq7Hq7wxORRfhrF52ZRCuh712
X-Google-Smtp-Source: AGHT+IHXwtcRb5aeJz+4MTyFH5x65Xm78n1Qno4d/70vAvQiFlc9NPX8EwX9rev/jyrOcHIRK0dpmQ==
X-Received: by 2002:a05:6808:18a5:b0:437:e1b0:e969 with SMTP id 5614622812f47-43d50d736b3mr1068095b6e.40.1758122442687;
        Wed, 17 Sep 2025 08:20:42 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b82a7264asm4400574b6e.21.2025.09.17.08.20.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:20:42 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-758a28587e5so3833675a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:20:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsrhWJSVfmzSzlMZ0cE2F5dZkwdycVBDNtkSbQZ0qKze58mIrcnlNoU28hKs7F7fW/chwlSxFeCz7LrNXqssPk@lists.infradead.org
X-Received: by 2002:a05:6102:4414:b0:4e6:ddd0:96ff with SMTP id
 ada2fe7eead31-56d63efa012mr900359137.16.1758122046543; Wed, 17 Sep 2025
 08:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com> <877bxxabmr.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877bxxabmr.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Sep 2025 17:13:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaoBP1ZtJqc7rfqLXGETXpVYNcFfJf5xFBFSHG9mSB8Q@mail.gmail.com>
X-Gm-Features: AS18NWDAtmJ2xaoQuGRsAt7Kwia2BPFHIJLsHQkXMzPf_Sxvg99Y761td_EKCiw
Message-ID: <CAMuHMdUaoBP1ZtJqc7rfqLXGETXpVYNcFfJf5xFBFSHG9mSB8Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: Add R8A78000 X5H DTs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>, 
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Leo Yan <leo.yan@linux.dev>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Namhyung Kim <namhyung@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Will Deacon <will@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_162044_950818_325FF0E8 
X-CRM114-Status: GOOD (  25.10  )
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

Hi Morimoto-san,

On Wed, 17 Sept 2025 at 07:31, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Hai Pham <hai.pham.ud@renesas.com>
>
> Add initial DT support for R8A78000 (R-Car X5H) SoC.
>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Minh Le <minh.le.aj@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for the update!

> index 0000000000000..6445f05de0563
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -0,0 +1,755 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the R-Car X5H (R8A78000) SoC
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible = "renesas,r8a78000";
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       cpus {

> +               a720_0: cpu@0 {
> +                       compatible = "arm,cortex-a720ae";
> +                       reg = <0x0 0x0>;
> +                       device_type = "cpu";
> +                       next-level-cache = <&L2_CA720_0>;
> +
> +                       L2_CA720_0: cache-controller {

As reported before, the cache nodes should be outside the CPU nodes.

"make dtbs_check" would have reminded you:

    arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cpu@0
(arm,cortex-a720ae): Unevaluated properties are not allowed
('cache-controller' was unexpected)
            from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#

> +                               compatible = "cache";
> +                               cache-level = <2>;

Missing "cache-unified".

"make dtbs_check":

    arm64/boot/dts/renesas/r8a78000-ironhide.dtb: cache-controller
(cache): 'cache-unified' is a required property
            from schema $id: http://devicetree.org/schemas/cache.yaml#

> +                               next-level-cache = <&L3_CA720_0>;
> +                       };

> +               };

> +       soc: soc {
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;

Marc asked to move interrupt-parent to the top, i.e. one level up...

> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               timer {

... and please keep the timer node outside the soc node.

"make dtbs_check":

    arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: soc
(simple-bus): timer: 'ranges' is a required property
            from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

> +                       compatible = "arm,armv8-timer";
> +                       interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +                                    <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
> +               };

> +               scif0: serial@c0700000 {
> +                       compatible = "renesas,scif-r8a78000", "renesas,scif";

Missing "renesas,rcar-gen5-scif".

"make dtbs_check":

    arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0700000
(renesas,scif-r8a78000): compatible: 'oneOf' conditional failed, one
must be fixed:
            ...
            ['renesas,scif-r8a78000', 'renesas,scif'] is too short
            ...
            'renesas,rcar-gen5-scif' was expected
            ...
            from schema $id:
http://devicetree.org/schemas/serial/renesas,scif.yaml#

> +                       reg = <0 0xc0700000 0 0x40>;
> +                       interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       status = "disabled";
> +               };

> +               hscif0: serial@c0710000 {
> +                       compatible = "renesas,hscif-r8a78000", "renesas,hscif";

Missing "renesas,rcar-gen5-hscif".

"make dtbs_check":

arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000
(renesas,hscif-r8a78000): compatible: 'oneOf' conditional failed, one
must be fixed:
        ['renesas,hscif-r8a78000', 'renesas,hscif'] is too short
        ...
        'renesas,rcar-gen5-hscif' was expected
        from schema $id:
http://devicetree.org/schemas/serial/renesas,hscif.yaml#

> +                       reg = <0 0xc0710000 0 0x60>;
> +                       interrupts = <GIC_SPI 4078 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

