Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D190DC98321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 20:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0l+jl3PEeluCBsGioL2G68K7W+3gmkNVOtgi3VkNGno=; b=toke3uZjo4GimwXpuktDoQ6OJg
	yGxFoHzHX7Qxg+kuyWqGWB6iTybT2xhXIYJ3XuT5/AeRIcK0RktTdpV7XIi/ZxxN+8mVUPG4XltcS
	Tty0dE4Fh3RsI6ujZ898BSC6IVj0JbrRs+S64Xhy3rWnto+itzFTgf8fg5ziTeetOJ7Bz3yJOCjDW
	uYOv9tzee3nSvWAnHuBDx+FrAuZRFvSW4aSbGzYRz6PtfFadY2MAoeirgw+7gLvgeaRKIvSTvEmif
	eLHehY1eUrJt096htJOpBiHNgtDQHcmxsQKSAoAxXpBmohwMNrAKhRkMFREE3gLYAUkS0hkDooiSK
	/hzTSk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9po7-0000000C7PJ-3PRv;
	Thu, 24 Sep 2026 20:12:39 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9po4-0000000C7Oy-3Mww
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 20:12:38 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4c3304784so55091a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790280756; cv=none;
        d=google.com; s=arc-20260327;
        b=rxfcpdZdVuu6jDslc2g1ivzrKDz31Rtg0yOMWmtcGWNkqosQoUHwM06UY38iyn7/dS
         UvhwUp4rrCXPcZgl4ixQIZQjyjABxbYXrtARdFdDhlkPYQ64/y2cAvzSXjxBh/cA7MpB
         oRYymQ5+ZTEyUVTb0xY8e53P113NX0VpIWyfyJqWi3PIlayp/40TZeuc8/qDKxIaUSwk
         pH7bO1J4eueUUNKqe7EEfgVpqMHfFOOuWqNLeqKrHZQtEIluE94WD2r16LXYixERMTZ6
         4x2IVsK78nyTYCwCXcn6ne+IHn8Qrm9gZrisFAuxfe/Saq4AUtT+I3a2lOWmhDVKts09
         +DHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0l+jl3PEeluCBsGioL2G68K7W+3gmkNVOtgi3VkNGno=;
        fh=lCDkwph6vf+U2Sjfw8zb12/HrQkP0suGkVJeMLmmFIM=;
        b=ktnr0WGj8cej9IR6Bewfv1fHmpA0XfIHySMz/0IiicqgOwL3UHTXBuLHBHtzBbKH+f
         yPNxLow9pFLG0WvTAceSaWG9BcWyyPWgJFd0TVSReif3GffdsJMZPxSs8BO0n23yZoRp
         nvjpbydv92Kc0REng4VxCpG9C+LvaWqrsaoXwyp1t4p2oA/teiiBqZMDv/voqIOBVRXM
         MH/URF2erXd8C25PqLQp5T4Gb6GaULRYl93Ws2OYdjsgrHBfdpZk4EIgp27fado8qWE3
         iUJLIv//1UYOCbcE0u/VpHCOSWaFRKJH4j+X/19UBYwnlFPWwhwzKEgXkXevMCp7gLC0
         i29g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280756; x=1790885556; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0l+jl3PEeluCBsGioL2G68K7W+3gmkNVOtgi3VkNGno=;
        b=l4rxG/2AYsaYLb7Q1aAqrf+DQQpfnNA0D2xbHaXI+AT+j9KrJlnj2SG3Y/nsrYCBs+
         HbplHuSgShChUK4GS6gqlKt88NP6wL8pSRoky4DVHUGXFmyzBqTT+yrlk2OKMcMlco5q
         d1EaqM3jV1/yJLxUtb4tCJgQ/thSQRbiAvZSSDI1LIMJPDu+wLxqusnWRhoSmvtcWy0w
         NQfVD5W76PbJ/Fw4iRqAy/d4DQML4wLWzqPYhnx5UoYKRSuBKaJGpkNSsXcCQNkAa/T/
         i1UYUK7fOg/XhOKYoIwRuYTUAazO+Q9oW99BIwAuH/MrHZjXWItDs7MTZ64aUU0Zmxme
         JvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280756; x=1790885556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0l+jl3PEeluCBsGioL2G68K7W+3gmkNVOtgi3VkNGno=;
        b=uQhC4N/pwVQcux2gs7jg5WFUDBhpJskJMwTmtDFUgPfLSzs6osvboH6FQdBcZbac32
         690zpbC4CsL9NJT0DuyM3PyBkQ4g59NyhcvsYJEfHKuYJXjXpRF3ZPjDruKg9F0YGMmF
         8GvzxjJs3a4aW/3ja1ZBp7Wzq3McLm0dJrUAtQ8ArDvFHWNyo/FDaZU2ovjaXv+nytj7
         3ZolqBkvwuXtj3fZFzdE1ztQOWr3jIw5xtWtNrQAX2Sf9CQq5FRb8T60are158jLJk0f
         igegfMhpXubjlOZ5G2YpeZr/EKJ6cSb2ASCUGjJbafDjFK/KI6i5zYGmaIkIEiXGVZdX
         M7hw==
X-Forwarded-Encrypted: i=1; AKwUvByj0g2QZoHajjq6a5FnNZjNxkcZ0LMKlbz7R1vfFI7Cz3VzyWCclUrsgBrAcjoAsdiRjXHNSRVJpPn+Blu02gkX@lists.infradead.org
X-Gm-Message-State: AFuF++mUMdhKUAqsCkCXRZLLxdk+X/3MEpHmQ0wiFANOaYKj+N7hurO2
	6cU9VyNy4XxdVez2jYa5x2nbHyLpOveofpq57C1NQZN2YM/uX+hL7KAh5lFxRchIdbMHSEjeAKi
	bdpUOc00yFmQnKXbxy8lv+S1Jt9mM2kY=
X-Gm-Gg: AYBFou25eQ7E/N/b5TJQrCZCs7/x+8Bq6noeFiHHVEWXmzZEiqLIZRRr5iAetn7oP6w
	I44dWrMjmnSPO4WOGGy6/esPzG0AqnqRU0KDH8xPSxmudoIB6y6JzllLxhTbc6WCCUMLpAYGEyk
	ydYDhKYre+6KulPifemfR7gZXJlepdbThLYUzUUbXgxafoGos8dkvsWfq9MDghZiRmCKMKUExKw
	c6w+TTNWeJX4gGPPPHTgV65sFu/Cy/5SBVdOPFB5ZS2QWWy1TgfmZ8vIXw8Hi2AnTsZw0vos9dD
	nLwDuY6ch69NWSyApPwo3EWe4KzB1QH5ThpAmPwA0YIK0Hj0OsTtm+T1wkUBH2M5S+D/YBg=
X-Received: by 2002:a17:902:e94e:b0:2df:7e40:6f6c with SMTP id
 d9443c01a7336-2df7e407013mr31670965ad.46.1790280755626; Thu, 24 Sep 2026
 13:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260923201701.43391-1-pmazzini@gmail.com> <8871e921-f66c-475b-a489-560028eb2200@arm.com>
In-Reply-To: <8871e921-f66c-475b-a489-560028eb2200@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 24 Sep 2026 21:12:01 +0100
X-Gm-Features: AclHuK_-mnDGIb_ID5ajTTS6OK8_9vcC7qVQlZUU6wB7EYPhgJdDLHDg8SJ6_uQ
Message-ID: <CAAxh=jsb_SGxKEisYYcg-eSbzE2iOUwnvmGUww_rUdXW64E84g@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] dt-bindings: clock: add Allwinner B288 CCU
To: Andre Przywara <andre.przywara@arm.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_131236_877837_E8C88F0B 
X-CRM114-Status: GOOD (  37.52  )
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

Hi Andre,

thanks for the review.

> please add a cover letter

Done for v2.

> One problem in general is the lack of access to a manual [...]

The descriptions come from the BSP's clk-sun8iw10.{c,h}, cross-checked
against ccu-sun50i-a64.c - nine of the eleven PLLs are bit-identical -
and exercised on the device up to userspace.

> I am afraid you cannot push off the responsibility to other people

Copy-paste mistake, sorry. Moot now: folding both bindings into the
existing files removes those entries.

> why do you need a separate binding?

You're right, it's a strict subset; v2 just adds the compatible to
allwinner,sun4i-a10-ccu.yaml.

Thanks,
Pablo


On Thu, Sep 24, 2026 at 10:03=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> Hi Pablo,
>
> many thanks for sending this series, on a first glance this looks pretty
> good.
> As a general comment: please add a cover letter (git format-patch ...
> --cover-letter, then edit the generated file), and explain a bit about
> the background of this work. This would be a good place to briefly
> describe what the B288 is, how it's related to other SoCs, how you came
> to all this information, the firmware story, and the existing
> limitations of this port.
>
> One problem in general is the lack of access to a manual, I am not even
> sure we ever upstreamed SoC support without one. Especially the clock
> driver is quite tricky, we would love to compare the clock descriptions
> against some documentation.
>
> On 9/23/26 22:16, Pablo Mazzini wrote:
> > The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >   .../clock/allwinner,sun8i-b288-ccu.yaml       | 55 ++++++++++++
> >   include/dt-bindings/clock/sun8i-b288-ccu.h    | 90 ++++++++++++++++++=
+
> >   include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
> >   3 files changed, 190 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/clock/allwinner,=
sun8i-b288-ccu.yaml
> >   create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
> >   create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h
> >
> > diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-b2=
88-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-=
ccu.yaml
> > new file mode 100644
> > index 000000000000..22b59d5b652c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-b288-ccu.=
yaml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/allwinner,sun8i-b288-ccu.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner B288 Clock Control Unit
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Maxime Ripard <mripard@kernel.org>
>
> I am afraid you cannot push off the responsibility to other people,
> especially I think Maxime wouldn't be really interested any more ;-)
>
> Actually, why do you need a separate binding? Wouldn't it be enough to
> just add the compatible string to the existing
> allwinner,sun4i-a10-ccu.yaml file? This one here looks like a subset of
> this, and would blend in there easily.
>
> Cheers,
> Andre
>
> > +
> > +properties:
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  "#reset-cells":
> > +    const: 1
> > +
> > +  compatible:
> > +    const: allwinner,sun8i-b288-ccu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: High Frequency Oscillator
> > +      - description: Low Frequency Oscillator
> > +
> > +  clock-names:
> > +    items:
> > +      - const: hosc
> > +      - const: losc
> > +
> > +required:
> > +  - "#clock-cells"
> > +  - "#reset-cells"
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    ccu: clock-controller@1c20000 {
> > +        compatible =3D "allwinner,sun8i-b288-ccu";
> > +        reg =3D <0x01c20000 0x400>;
> > +        clocks =3D <&osc24M>, <&osc32k>;
> > +        clock-names =3D "hosc", "losc";
> > +        #clock-cells =3D <1>;
> > +        #reset-cells =3D <1>;
> > +    };
> > diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bi=
ndings/clock/sun8i-b288-ccu.h
> > new file mode 100644
> > index 000000000000..3dc1704d001e
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
> > @@ -0,0 +1,90 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > +#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
> > +#define _DT_BINDINGS_CLK_SUN8I_B288_H_
> > +
> > +#define CLK_PLL_CPUX 0
> > +#define CLK_PLL_AUDIO_BASE   1
> > +#define CLK_PLL_VIDEO0       2
> > +#define CLK_PLL_DDR0 3
> > +#define CLK_PLL_PERIPH0      4
> > +#define CLK_PLL_VIDEO1       5
> > +#define CLK_PLL_24M  6
> > +#define CLK_PLL_PERIPH1      7
> > +#define CLK_PLL_DE   8
> > +#define CLK_PLL_DDR1 9
> > +
> > +#define CLK_PLL_PERIPH0_2X   10
> > +#define CLK_PLL_PERIPH1_2X   11
> > +#define CLK_CPUX     12
> > +#define CLK_AXI      13
> > +#define CLK_CPUAPB   14
> > +#define CLK_AHB1     15
> > +#define CLK_APB1     16
> > +#define CLK_APB2     17
> > +
> > +#define CLK_NAND     18
> > +#define CLK_MMC0     19
> > +#define CLK_MMC1     20
> > +#define CLK_MMC2     21
> > +#define CLK_MMC3     22
> > +#define CLK_SPI0     23
> > +#define CLK_SPI1     24
> > +#define CLK_SPI2     25
> > +#define CLK_DRAM     26
> > +#define CLK_DE       27
> > +#define CLK_EE       28
> > +#define CLK_EDMA     29
> > +#define CLK_TCON0    30
> > +#define CLK_MBUS     31
> > +
> > +#define CLK_BUS_THS  32
> > +#define CLK_BUS_NAND 33
> > +#define CLK_BUS_SDMMC0_BUS   34
> > +#define CLK_BUS_SDMMC1_BUS   35
> > +#define CLK_BUS_SDMMC2_BUS   36
> > +#define CLK_BUS_SDMMC3_BUS   37
> > +#define CLK_BUS_SPI0 38
> > +#define CLK_BUS_SPI1 39
> > +#define CLK_BUS_SPI2 40
> > +#define CLK_BUS_I2S0 41
> > +#define CLK_BUS_I2S1 42
> > +#define CLK_BUS_SPDIF        43
> > +#define CLK_BUS_DSD  44
> > +#define CLK_BUS_DMIC 45
> > +#define CLK_BUS_USBOHCI0     46
> > +#define CLK_BUS_USBEHCI0     47
> > +#define CLK_BUS_USBOTG       48
> > +#define CLK_BUS_DE   49
> > +#define CLK_BUS_EE   50
> > +#define CLK_BUS_TCON0        51
> > +#define CLK_BUS_CSI_S        52
> > +#define CLK_BUS_CSI_M        53
> > +#define CLK_BUS_CSI_MISC     54
> > +#define CLK_BUS_ADDA 55
> > +#define CLK_BUS_SDRAM        56
> > +#define CLK_BUS_PSRAM        57
> > +#define CLK_BUS_DMA  58
> > +#define CLK_BUS_UART0        59
> > +#define CLK_BUS_UART1        60
> > +#define CLK_BUS_UART2        61
> > +#define CLK_BUS_UART3        62
> > +#define CLK_BUS_UART4        63
> > +#define CLK_BUS_UART5        64
> > +#define CLK_BUS_TWI0 65
> > +#define CLK_BUS_TWI1 66
> > +#define CLK_BUS_TWI2 67
> > +#define CLK_BUS_PIO  68
> > +#define CLK_BUS_GPADC        69
> > +#define CLK_BUS_KEYADC       70
> > +
> > +/*
> > + * mmc0 and mmc1 are v4p1x controllers driven in the old timing mode, =
which
> > + * needs the sample and output phase clocks. mmc2 and mmc3 are newer b=
locks
> > + * that do their own delay calibration and have none.
> > + */
> > +#define CLK_MMC0_SAMPLE      71
> > +#define CLK_MMC0_OUTPUT      72
> > +#define CLK_MMC1_SAMPLE      73
> > +#define CLK_MMC1_OUTPUT      74
> > +
> > +#endif
> > diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bi=
ndings/reset/sun8i-b288-ccu.h
> > new file mode 100644
> > index 000000000000..675145654548
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
> > @@ -0,0 +1,45 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > +#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
> > +#define _DT_BINDINGS_RST_SUN8I_B288_H_
> > +
> > +#define RST_BUS_THS  0
> > +#define RST_BUS_NAND 1
> > +#define RST_BUS_MMC0 2
> > +#define RST_BUS_MMC1 3
> > +#define RST_BUS_MMC2 4
> > +#define RST_BUS_MMC3 5
> > +#define RST_BUS_SPI0 6
> > +#define RST_BUS_SPI1 7
> > +#define RST_BUS_SPI2 8
> > +#define RST_BUS_I2S0 9
> > +#define RST_BUS_I2S1 10
> > +#define RST_BUS_SPDIF        11
> > +#define RST_BUS_DSD  12
> > +#define RST_BUS_DMIC 13
> > +#define RST_USBPHY0  14
> > +#define RST_BUS_OHCI0        15
> > +#define RST_BUS_EHCI0        16
> > +#define RST_BUS_OTG  17
> > +#define RST_BUS_DE   18
> > +#define RST_BUS_EE   19
> > +#define RST_BUS_TCON0        20
> > +#define RST_BUS_CSI  21
> > +#define RST_BUS_ADDA 22
> > +#define RST_BUS_WLAN 23
> > +#define RST_MBUS     24
> > +#define RST_BUS_DRAM 25
> > +#define RST_BUS_PSRAM        26
> > +#define RST_BUS_DMA  27
> > +#define RST_BUS_UART0        28
> > +#define RST_BUS_UART1        29
> > +#define RST_BUS_UART2        30
> > +#define RST_BUS_UART3        31
> > +#define RST_BUS_UART4        32
> > +#define RST_BUS_UART5        33
> > +#define RST_BUS_I2C0 34
> > +#define RST_BUS_I2C1 35
> > +#define RST_BUS_I2C2 36
> > +#define RST_BUS_GPADC        37
> > +#define RST_BUS_KEYADC       38
> > +
> > +#endif
>

