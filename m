Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CA0C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 19:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64vjjGgKkyej47wZkg9Q8gzWkXdomxA9oEZPcwE0Oo0=; b=4QYfQUFSwbo+KpZXvDMvnupsB2
	UO2dVKG7s8OoJB+BlYWAS8Dn76p0JBISimVtCUnS+rsKmc8jrZ0qvaybk+efQ3k1E7QzDaW11KxKV
	hwVNbe7DGycswo6f/84rHfrlopyQNIvw9phpDDDTDD1g9BPslRnl2xsyyNPPz/f5H2kQwtFwmMTtu
	eThF4qlNrw+EJkRenXseeo1cFXKgGyjpGGXwpPfl5lW3ltiMSDltQ+286Is916Q57Y5pZSpXXhOS9
	dNtaRKeNc8RmoZwTu4I0XkVR/iDx5Ro5DaySUWcKrEr4VGbv6hlJcJ440Y5HNp6KTv22dsvkfJyzB
	KyXMyKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWM0-00000009RIT-1dqB;
	Wed, 26 Mar 2025 19:23:56 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWJg-00000009R0X-2WF8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 19:21:34 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-523d8c024dfso94277e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 12:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743016891; x=1743621691; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64vjjGgKkyej47wZkg9Q8gzWkXdomxA9oEZPcwE0Oo0=;
        b=appNKcUzAt7RYP1IOFLmnLM3GYuEig2XCZKfR0T3Bo2pk6bkY4VSB65iIgpFHCN0O1
         9lDc63JaARBGWVX6WCGdk2iRzh+5FXivbrMamypy8sn/+SsG6OMkJrJJbb3m3gof960S
         TZzZ8jsOsSS2wJMTXiUZENzoimdYcyvFGitTUM6WSXivU0PI3ust2vdkAS6ICeKQHvyG
         r9Fx5Foh7n+SAACK4BJjvZzRH0YCudHhIDyslw9xPvbswIUsuiQ0Z1/WUPPCdXp0RRox
         HMxsskx+r7Ofn6aLW+QsTke1hYZ3W7P1IrUnH2ce8WvdGjBir2WxYd6I0spVipGN46+S
         a7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743016891; x=1743621691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64vjjGgKkyej47wZkg9Q8gzWkXdomxA9oEZPcwE0Oo0=;
        b=htgfUts7uYOtelXoLCHA1/N2kxrnT/Pmb07G+cuXrUZRErXYxc/lW/CgRHgAOZ9yFu
         oLpDKXzklICr2cJ4Vkhj1qYJIevn27/QRdgCxrQKMyoJmrb5y3b1eFXpq0N26rUgZHhX
         wqLnFs9AaXrpgiIt93UI1sfwfpvtTb+sirk1IGCePcJijUKTZF2LU/RSMr1JlpVzE6WB
         iWIB7/l7X5pNIXcm7uAmYaB3V3oZywoPbyaNdC+qGV1+A3HZcgIcNRbVwqICfCM3i6gJ
         mdDLwcA8ORNKLdZvTI0xd2i+RambyaIEdO2jENcCsQRfvaGmNB5tO3dFcCK2gAP7JzHo
         gLow==
X-Forwarded-Encrypted: i=1; AJvYcCWdurfMMoGqiTys8lAZPegX07w5mTGyqsYdjrntBJvo7GJTuO74JdEvAoWGu1NsP9kldvBNB0EA0cGiFKnrNfAL@lists.infradead.org
X-Gm-Message-State: AOJu0YyFjqzCb67JQY23zq6xAPWBLfeL/nRlDgKPK1Qt/4AC5v5QNZnT
	pPb0yuVbVthco8c6P1K1VyYYkGCy8j6NeNb56dNLU5ZZ7OEOYRBHUyyOq9iP9SYyS7na6HETjFW
	N/qVHrB8j6OKe1R7H2Y0Ackfjs/k=
X-Gm-Gg: ASbGncu7PdqbZotE/+ZnNLRDFiUoA5SWCu8BAx5LwtrhBCTc3YlYj8o0lDQ5k3crBGZ
	rgYgndCkD4vXDFsIybc41bes5RxwpQhF8U3jxu3UybfaM+sV2suNAIVj2bThYvhquj000DG1Hsj
	XqNV96tbetnJ9sWYEe8P0PlDHSmEoKHS4BpnJAA2o=
X-Google-Smtp-Source: AGHT+IEMDUu/kTsNu1CbItYSDxUZeO1gxYDQkWcrekLYRRg2eqkHhtGCeqXHHIbGy6v6eIHaPx/Rv/onzgSKYSV/BuA=
X-Received: by 2002:a05:6122:660c:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-52600a8ada4mr1173468e0c.9.1743016890983; Wed, 26 Mar 2025
 12:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <174301523991.2716417.14351851624098585706.robh@kernel.org>
In-Reply-To: <174301523991.2716417.14351851624098585706.robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Mar 2025 19:21:03 +0000
X-Gm-Features: AQ5f1Jp6yjmSyKSnpYoXWKYVnLBzGIWh9gTSXr8OSv020P_GOH986D8KqbvLGlA
Message-ID: <CA+V-a8tBGdAFoUW1Dt2wZTeQBcVts-CGc9DgC24uvtFSfoUFeA@mail.gmail.com>
Subject: Re: [PATCH 00/15] Add support for Renesas RZ/V2N SoC and EVK
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, 
	Will Deacon <will@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Jiri Slaby <jirislaby@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_122132_661705_0DA2BFAD 
X-CRM114-Status: GOOD (  34.66  )
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

Hi Rob,

On Wed, Mar 26, 2025 at 7:11=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 26 Mar 2025 14:39:30 +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > This patch series adds initial support for the Renesas RZ/V2N (R9A09G05=
6)
> > SoC and its evaluation board (EVK). The Renesas RZ/V2N is a vision AI
> > microprocessor (MPU) designed for power-efficient AI inference and
> > real-time vision processing. It features Renesas' proprietary AI
> > accelerator (DRP-AI3), delivering up to 15 TOPS AI performance, making
> > it ideal for applications such as Driver Monitoring Systems (DMS),
> > industrial monitoring cameras, and mobile robots.
> >
> > Key features of the RZ/V2N SoC:
> >   Processing Power:
> >     - Quad Arm Cortex-A55 cores at 1.8GHz for high-performance computin=
g
> >     - Single Arm Cortex-M33 core at 200MHz for real-time processing
> >     - 1.5MB on-chip SRAM for fast data access
> >     - LPDDR4/LPDDR4X memory interface for high-speed RAM access
> >
> >   AI and Vision Processing:
> >     - DRP-AI3 accelerator for low-power, high-efficiency AI inference
> >     - Arm Mali-C55 ISP (optional) for image signal processing
> >     - Dual MIPI CSI-2 camera interfaces for multi-camera support
> >
> >   High-Speed Interfaces:
> >     - PCIe Gen3 (2-lane) 1ch for external device expansion
> >     - USB 3.2 (Gen2) 1ch (Host-only) for high-speed data transfer
> >     - USB 2.0 (Host/Function) 1ch for legacy connectivity
> >     - Gigabit Ethernet (2 channels) for network communication
> >
> >   Industrial and Automotive Features:
> >     - 6x CAN FD channels for automotive and industrial networking
> >     - 24-channel ADC for sensor data acquisition
> >
> > LINK: https://tinyurl.com/renesas-rz-v2n-soc
> >
> > The series introduces:
> > - Device tree bindings for various subsystems (SYS, SCIF, SDHI, CPG, pi=
nctrl).
> > - RZ/V2N SoC identification support.
> > - Clock and pinctrl driver updates for RZ/V2N.
> > - Initial DTSI and device tree for the RZ/V2N SoC and EVK.
> > - Enabling RZ/V2N SoC support in `arm64 defconfig`.
> >
> > These patches have been tested on the RZ/V2N EVK with v6.14,
> > logs can be found here https://pastebin.com/8i3jgVby
> >
> > Cheers,
> > Prabhakar
> >
> > Lad Prabhakar (15):
> >   dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants
> >   dt-bindings: soc: renesas: Document RZ/V2N EVK board
> >   soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
> >   dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
> >   soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
> >   dt-bindings: serial: renesas: Document RZ/V2N SCIF
> >   dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support
> >   dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
> >   clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part numbe=
r
> >   clk: renesas: rzv2h: Add support for RZ/V2N SoC
> >   dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
> >   pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
> >   arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
> >   arm64: dts: renesas: Add initial device tree for RZ/V2N EVK
> >   arm64: defconfig: Enable Renesas RZ/V2N SoC
> >
> >  .../bindings/clock/renesas,rzv2h-cpg.yaml     |   5 +-
> >  .../devicetree/bindings/mmc/renesas,sdhi.yaml |   4 +-
> >  .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +
> >  .../bindings/serial/renesas,scif.yaml         |   1 +
> >  .../soc/renesas/renesas,r9a09g057-sys.yaml    |   1 +
> >  .../bindings/soc/renesas/renesas.yaml         |  15 +
> >  arch/arm64/boot/dts/renesas/Makefile          |   2 +
> >  arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 264 ++++++++++++++++++
> >  .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 115 ++++++++
> >  arch/arm64/configs/defconfig                  |   1 +
> >  drivers/clk/renesas/Kconfig                   |   5 +
> >  drivers/clk/renesas/Makefile                  |   1 +
> >  drivers/clk/renesas/r9a09g056-cpg.c           | 152 ++++++++++
> >  drivers/clk/renesas/rzv2h-cpg.c               |  18 +-
> >  drivers/clk/renesas/rzv2h-cpg.h               |   1 +
> >  drivers/pinctrl/renesas/Kconfig               |   1 +
> >  drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  36 ++-
> >  drivers/soc/renesas/Kconfig                   |  10 +
> >  drivers/soc/renesas/Makefile                  |   1 +
> >  drivers/soc/renesas/r9a09g056-sys.c           | 107 +++++++
> >  drivers/soc/renesas/rz-sysc.c                 |   3 +
> >  drivers/soc/renesas/rz-sysc.h                 |   1 +
> >  .../dt-bindings/clock/renesas,r9a09g056-cpg.h |  24 ++
> >  .../pinctrl/renesas,r9a09g056-pinctrl.h       |  30 ++
> >  24 files changed, 790 insertions(+), 10 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> >  create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.=
dts
> >  create mode 100644 drivers/clk/renesas/r9a09g056-cpg.c
> >  create mode 100644 drivers/soc/renesas/r9a09g056-sys.c
> >  create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h
> >  create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g056-pinct=
rl.h
> >
> > --
> > 2.49.0
> >
> >
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/next-20250326 (best guess, 15/18 blobs matched)
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/renesas=
/' for 20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com:
>
> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000:=
 'interrupt-controller' is a required property
>         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rz=
g2l-pinctrl.yaml#
> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000:=
 '#interrupt-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rz=
g2l-pinctrl.yaml#
>
>
As mentioned in patch 13/15 [0] the above warnings are expected this
is because as part of the initial support, the ICU has not been added
yet. The interrupt-related properties will be added to the pinctrl
node along with ICU support.

[0] https://lore.kernel.org/all/20250326143945.82142-14-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

Cheers,
Prabhakar

