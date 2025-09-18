Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305B1CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAV6+U9ykOwvp8+2HatYYts2BEiZRGxqVQPDnpRww3U=; b=0rjHTddqSV/vvLEtmmSNBUn5PE
	mSeiApyRjyg7z2dx5V5n5nGNK8Mh5ZbGNpFo+QhrEjZCbO4K3/w7dVjJKlvrgZ/JlpQfSnpk10K4k
	iqd0P5/X4gmFbhwh2n8THJR43Q4h388Hx3wK0FOdnwb8VtIQoRsf8pbwFa4rRBYdV5ArW21pa7A92
	pt/PfIfe+2S4XXgg51swexcG56xRM2UpffMxxgnE8ll9ZB2tbno96wYuUNKi6GdkPvyKHLTMj/dyE
	T7I+Ok/1kvBz5jhp0gpVSM247ZwTS7isMtbpjaInPaX8BHIlRczpVEuziks4oQ83yX5LSyZ/QioJV
	Rw49By9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBRB-0000000GxNc-3RRQ;
	Thu, 18 Sep 2025 10:00:25 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBR8-0000000GxM2-4Arf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:00:24 +0000
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b61161c35cso11453141cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189621; x=1758794421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAV6+U9ykOwvp8+2HatYYts2BEiZRGxqVQPDnpRww3U=;
        b=Nu0SzQu5ah+X38NSz+Dsl1rpmDzVUL0ZzOf3YS8wL4zJ+b6P4GAE2tl43ml7/nFp8x
         J4UaqONf2LAwzWPJR2FRrWMc97ew78VhjdiASB6ZV8quYemipJDVtkjd8ZswFDCGJcKI
         ps3CdubCIZypvuHNWfDTYp1bIVZcGa4S1dq4WCjursoCqXbv7pUg9eTHQM7iIVWFZrmO
         R6D6YQGBdNueHaqXW8Azqov6ZBkdU6j5wUUlctANM/P2rNO9e9dcAeU0nmblGzWiJbuz
         75aLxtFjP7MhH27tqhy8O3KYgrSLQAUdUW2Aa/q0+0aYs3QD1VIIzjAeTlSBX2HVCGcz
         SbyA==
X-Forwarded-Encrypted: i=1; AJvYcCVwwQERikDIsybElyDTHrGhUSC31HSzDUXVX4d7i/4r9Im5kElcEqD472dYhqK3l1ZHzSMuwESf0U3WM1Do8pj5@lists.infradead.org
X-Gm-Message-State: AOJu0YwyuypBQgJaXHkNizMgMvAFBKl1xmv8E2kkdyLSp7Zd4zMZ3BPD
	e0i+4vapHENSuT+VOpAt/dcWzpHtPPzaNG/vcic9goNGCdoAcVRPUCU53gjWT8A1
X-Gm-Gg: ASbGncujSHzMsnLt9iahEUFZfow1JccS8oT8SF/AQLTef+Pe7ZR+Bhwjn3v9DWQPC56
	rPYUZ6G03JCALD24/Z7B8PrguQI/WI9ow9BSUDhYEx+mhDUyteTU2kuMAW7kW5uCf/vq3GRZKcn
	OzilXPJvtC19Uy+8k9s6zvQ4uDBfJKg+QpOV6mRoWNNZeSGffqzvcQKMlaTl/Xk8OYcMJtY1mYr
	9b9BnuQ4wm/X0zpPdCncELrkK5/LJtgOaZvO9kT+novOw47CnjXsfFTM2hAEdpKJ5yQDXbE8fdS
	efvskDQlMHOkpkXoXGDxH9Tb7Fd4eEv+Lvyd4gFDl8yco/2MMjSjaUWcCo5syJTm3gS+RKbj84q
	GGf49tx84xRHsG6Ttecd51xjMVSfmUTihXlR/329rYzomHqkg3xq0RHB4bZCCkoC//p4DwRA0e1
	So2XQgocc=
X-Google-Smtp-Source: AGHT+IFcBmK4OlTuU0z25T5WwIGO0pcfc3uOG3Zw0gcVBlgBChm9Y/YjOPwqSPlvo1bmLf30XlI0tA==
X-Received: by 2002:a05:622a:1f16:b0:4b5:ed9d:7bc5 with SMTP id d75a77b69052e-4ba66d15098mr65545531cf.19.1758189620207;
        Thu, 18 Sep 2025 03:00:20 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda86b3a3csm12007601cf.34.2025.09.18.03.00.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 03:00:19 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-80a6937c8c6so98060485a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:00:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWw51MhIvrgRU6MQvERsHo7Fw7LNh55TuQLi3qrQjHWilzhkJay2ku7EZyv83lwfXhBPRqSovHdupQU+qrJpEb8@lists.infradead.org
X-Received: by 2002:a05:6102:f96:b0:524:5653:81aa with SMTP id
 ada2fe7eead31-56d6a96ba24mr1974782137.27.1758189231483; Thu, 18 Sep 2025
 02:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com> <87ecs4nult.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ecs4nult.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Sep 2025 11:53:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6KkM4+0tDzxNLQhWzBMs02vx=DTQ95D_-u+YYAcNgRg@mail.gmail.com>
X-Gm-Features: AS18NWC_4v91tXzLLOBSlDGTfgVal7mv5u3w5QpZG0TVZ1CRDcwzHECf6Dh9qXk
Message-ID: <CAMuHMdU6KkM4+0tDzxNLQhWzBMs02vx=DTQ95D_-u+YYAcNgRg@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] arm64: dts: renesas: Add R8A78000 X5H DTs
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
X-CRM114-CacheID: sfid-20250918_030023_038995_F9127170 
X-CRM114-Status: GOOD (  25.31  )
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

On Thu, 18 Sept 2025 at 08:27, Kuninori Morimoto
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

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi

> +       extalr_clk: extalr-clk {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* clock-frequency must be set on board */
> +       };
> +
> +       /*
> +        * In the early phase, there is no clock control support,
> +        * so assume that the clocks are enabled by default.
> +        * Therefore, dummy clocks are used.
> +        */
> +       dummy_clk_sgasyncd4: dummy-clk-sgasyncd4 {

Please keep nodes sorted (alphabetically, by node name).

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <266660000>;
> +       };
> +
> +       dummy_clk_sgasyncd16: dummy-clk-sgasyncd16 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <66666000>;
> +       };

> +       soc: soc {
> +               compatible = "simple-bus";
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               prr: chipid@189e0044 {
> +                       compatible = "renesas,prr";
> +                       reg = <0 0x189e0044 0 4>;
> +               };
> +
> +               /*
> +                * The ARM GIC-720AE - View 1
> +                *
> +                * see
> +                *      r19uh0244ej0052-r-carx5h.pdf
> +                *      - attachments: 002_R-CarX5H_Address_Map_r0p51.xlsx
> +                *       - sheet [RT]
> +                *        - line 619
> +                */
> +               gic: interrupt-controller@39000000 {
> +                       compatible = "arm,gic-v3";
> +                       #interrupt-cells = <3>;
> +                       #address-cells = <0>;
> +                       interrupt-controller;
> +                       reg = <0 0x39000000 0 0x20000>,

The DT bindings say the first region should be GICD (no mention of
GICM), so shouldn't the size be 0x10000?
See Table 21.9 "GIC-720AE Base address".

> +                             <0 0x39080000 0 0x800000>;
> +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               scif0: serial@c0700000 {
> +                       compatible = "renesas,scif-r8a78000", "renesas,rcar-gen5-scif", "renesas,scif";

Some lines are getting a bit long, but that is not something I cannot
fix while applying...

> +                       reg = <0 0xc0700000 0 0x40>;
> +                       interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       status = "disabled";
> +               };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

