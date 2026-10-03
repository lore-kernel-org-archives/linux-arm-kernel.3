Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EECBCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 13:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R73yQ3jH6GvWRUmndkK++08QPLSVcxmoMOlppi3GsLA=; b=n3cLbCgQ+tcuoo
	WmGLUobMWoiUv/pUZAkUGUjud3Rx1r0h5pK5y7wRDPL05A9vcolyy5O/p481LSOGb4IzvrQVXd5UW
	QsM6RclVfTY/DtOK9QrQDZBOoM+M+D745z59b8ch9XGZIk2DPtwGNUmrqui2Ook3vXxxZ/X3Ynege
	VwlcztaZvOwU6GBCujvA5PqJqLLdSG41e0CekkVJ9YxQfFjPL5KbKmpfFOs5z8aUKCVc3oDfJeo9S
	Y2eEozYZH4/TyzgTo0OzfuK2YqfGmWa1s3H8AjbzlQWV2W9l0dkGbi+/JR25k0h8lccEFjbi9MkoJ
	jAhe8SdWd+JpfDRc5zKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCzwA-0000000DXsK-0ORC;
	Sat, 03 Oct 2026 13:38:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCzw9-0000000DXs8-0Xnu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 13:38:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEE3743E4F
	for <linux-arm-kernel@lists.infradead.org>; Sat,  3 Oct 2026 13:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926E21F008AB
	for <linux-arm-kernel@lists.infradead.org>; Sat,  3 Oct 2026 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791034680;
	bh=R73yQ3jH6GvWRUmndkK++08QPLSVcxmoMOlppi3GsLA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=gkmkDHPqUMMEtJPnPIOMYKgusfwkkGQEnExjtK270Y2aRbiYJ3J4owePAH7MtL6Rs
	 +pMqnV/CZm5MYSpNN7FmqXellpG1au572wfMvXsVpqxuzSTl8BIQaJmYIN6pmHxB2Q
	 pUsvROA1pc1L17BJPC4Gvm2lmigBOjO2SplnnyiNsXwdcW+Y3z43ZKYyBpPVT6TdoF
	 U+hdWghywMfDda2XiTxIG1e8dozBnHR3Iqcquh/ua1ak/G/1oC/9sB5OnR7VtyNHx/
	 6OImIsZsSatsjCyIyREHFrdadfKfdI4QrrbYGRRLBnMSvrzWdFQKxNSjaQ4nSvmeST
	 JwxnMPTbu497g==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso6376141fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 06:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwDJLCRsO+VBF+rmVvwxbJhCFgxiTPGQKboz6YbXwsbtmKlQfNFfP/+CtYeaK2cNRaQKjhfbag3a8pzNF50tM52@lists.infradead.org
X-Gm-Message-State: AFq9FYJg2p6oR9nt5SIhD/x+P7PvEWGT3rJbAdtY7mcwZLV376bpxQAz
	Cu3q7GjT6bqOgTV/KAcpHPPS1FuFEVJr2Yxo22D299PRSiSilnhoYlfKua49EB7AJmVe3VtuMD+
	IT6SRaaYrvRfdWY22cpoxg0mxNwv9Ifo=
X-Received: by 2002:a05:651c:b11:b0:3a7:7a0e:5703 with SMTP id
 38308e7fff4ca-3a87ed423a1mr16877761fa.2.1791034678614; Sat, 03 Oct 2026
 06:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 3 Oct 2026 21:37:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v66O7Ze=TiHO_5q=76QpU8ZXraFyV+HfO+_HpkTDr1U-nQ@mail.gmail.com>
X-Gm-Features: AclHuK8VXX-H-epbJc-LIAYuxq6Cwq5Gper5Df4uf2UiYK9NyxKckBCIfgbI7oY
Message-ID: <CAGb2v66O7Ze=TiHO_5q=76QpU8ZXraFyV+HfO+_HpkTDr1U-nQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU
 and PRCM
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Yixun Lan <dlan@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2026 at 1:27=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add support for the main CCU and the PRCM module (R-CCU) found in the
> Allwinner A733 SoC. The clock architecture is derived from the previous
> A523 design, with the MCU_CCU removed and the clock tree extended for
> the additional functional blocks found on the A733.
>
> The A733 introduces a "pll-ref" clock that normalizes the physical
> oscillator frequency, which can be 19.2MHz, 24MHz, or 26MHz, into a
> consistent 24MHz reference for the PLL clock tree.
>
> The peripheral, video, and DE PLLs provide multiple independently gated
> outputs with programmable dividers. Model these outputs as separate
> divider-and-gate child clocks. Also follow the documented hierarchy for
> the derived peripheral PLL outputs. The explicitly named PLL_AUDIO1 /2
> and /5 outputs are modeled as fixed-factor clocks, with their divider
> fields initialized accordingly.
>
> Also extend the sunxi-ng SDM (Sigma-Delta Modulation) support for the
> dual-pattern register layout used by the A733 PLLs. PLL_AUDIO0 uses the
> dual-pattern SDM support to synthesize its fractional output.
> PLL_AUDIO1 does not expose fractional rates, but its SDM controls are
> modeled so that stale settings left by firmware can be disabled when an
> integer rate is programmed.

Some of the clock controls, like the PLL and AHB/APB bus dividers, are
secure by default and need to be set to non-secure for Linux to be able
to use them properly. And there is also a TWD clock in the PRCM that the
user manual says is secure only.

Have you given any thought to this? If we end up having to convert to
SCMI or something to handle those clocks it's going to be a bit ugly.

And presumably things work now because the secure/non-secure access bit
isn't in effect right now because you aren't using secure boot? At least
this was a thing in the past...


Thanks
ChenYu


> The actual parents of a small number of bus gates are not documented in
> the user manual. Follow the vendor BSP and keep these gates parented to
> "hosc" until more complete hardware information is available.
>
> This series depends on the A523 single-divider clock fixes [1], which
> add feature support to the M-only clock macro used by the MBUS and DRAM0
> clocks. The prerequisite series has been applied to the
> sunxi/clk-for-7.4 branch.
>
> Link: https://patch.msgid.link/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@=
pigmoral.tech [1]
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
> Changes in v5:
> - Add the CLK_GIC binding ID, inserted after CLK_TRACE
> - Add the GIC clock and mark it critical
> - Fix the continuation line alignment of the trace clock
> - Mark ahb-cpus critical
> - Link to v4: https://patch.msgid.link/20260921-a733-clk-v4-0-9c184ebe9ac=
1@pigmoral.tech
>
> Changes in v4:
> - Model the MBUS and DRAM0 clocks as M-only clocks
> - Base the series on the A523 single-divider clock fixes
> - Link to v3: https://patch.msgid.link/20260905-a733-clk-v3-0-50f238f39c7=
8@pigmoral.tech
>
> Changes in v3:
> - Patch 1: Rename the clock/reset binding headers with the allwinner vend=
or
>   prefix, use BSD-2-Clause for their dual license, and reorder the bindin=
g
>   properties according to the preferred schema layout
> - Patches 1 and 4: Drop the undocumented 12X suffix from the video and DE
>   PLL core clock names and binding IDs
> - Patch 2: Require all PAT1 enable bits to be set when checking whether S=
DM
>   is enabled
> - Patch 4: Model the independently gated peripheral, video, and DE PLL
>   outputs as programmable-divider child clocks
> - Patch 4: Follow the documented hierarchy for the derived peripheral PLL
>   outputs
> - Patch 4: Model the explicitly named PLL_AUDIO1 /2 and /5 outputs as
>   fixed-factor clocks and initialize their divider fields accordingly
> - Patch 4: Model the PLL_AUDIO1 SDM controls so stale firmware settings a=
re
>   disabled when an integer rate is programmed
> - Patch 4: Add the missing module device table and remove an unused inclu=
de
> - Patch 6: Replace the MP helpers used by timer clocks, which have no M
>   divider, with the corresponding P-only helpers
> - Patch 7: Document the unresolved parents of bus gates kept on hosc and
>   fix the APB/AHB IOMMU1 system clock names
> - Patches 3 and 8: Make the reset maps const
> - Link to v2: https://patch.msgid.link/20260711-a733-clk-v2-0-974d188cbe0=
c@pigmoral.tech
>
> Changes in v2:
> - Rework the clocks property in DT bindings to source hosc directly from
>   the oscillator to adapt to the new RTC binding
> - Clean up the SDM dual-pattern helper macro and add the missing enable
>   parameter for pll-audio0
> - Number single-instance clocks with 0, e.g. GPU0, VE_ENC0/VE_DEC0,
>   DRAM0, NAND0, GPADC0, THS0, etc
> - Correct 8x PLL post-divider names to 12x for video and DE PLLs
>   (pll-videoX-12x, pll-de-12x)
> - Drop gic, cpu-peri, nsi clocks
> - Rename clocks: OWA -> SPDIF, USB_REF -> USB01_REF, HDMI_ESM -> HDCP_ESM=
,
>   PWMCTRL -> PWM
> - Mark bus-dram0, ahb-store and mbus-store critical to avoid DMA, MMC and
>   SPI NOR failures when unused clocks are disabled
> - Switch PRCM timer clocks to P-only helpers
> - Fix bus gate bit positions for UARTs and correct the sysdap register
>   address
> - Interleave bus clocks into function clocks
> - Link to v1: https://lore.kernel.org/r/20260310-a733-clk-v1-0-36b4e9b244=
57@pigmoral.tech
>
> ---
> Junhui Liu (8):
>       dt-bindings: clk: sun60i-a733-ccu: Add Allwinner A733 support
>       clk: sunxi-ng: sdm: Add dual patterns support
>       clk: sunxi-ng: a733: Add PRCM CCU
>       clk: sunxi-ng: a733: Add PLL clocks support
>       clk: sunxi-ng: a733: Add bus clocks support
>       clk: sunxi-ng: a733: Add mod clocks support
>       clk: sunxi-ng: a733: Add bus clock gates
>       clk: sunxi-ng: a733: Add reset lines
>
>  .../bindings/clock/allwinner,sun60i-a733-ccu.yaml  |  107 +
>  drivers/clk/sunxi-ng/Kconfig                       |   10 +
>  drivers/clk/sunxi-ng/Makefile                      |    4 +
>  drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c           |  273 +++
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c             | 2406 ++++++++++++++=
++++++
>  drivers/clk/sunxi-ng/ccu_sdm.c                     |   52 +-
>  drivers/clk/sunxi-ng/ccu_sdm.h                     |   29 +-
>  .../dt-bindings/clock/allwinner,sun60i-a733-ccu.h  |  291 +++
>  .../clock/allwinner,sun60i-a733-r-ccu.h            |   39 +
>  .../dt-bindings/reset/allwinner,sun60i-a733-ccu.h  |  129 ++
>  .../reset/allwinner,sun60i-a733-r-ccu.h            |   23 +
>  11 files changed, 3337 insertions(+), 26 deletions(-)
> ---
> base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
> change-id: 20260202-a733-clk-0d4fc00a9f9c
> prerequisite-message-id: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmo=
ral.tech>
> prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
> prerequisite-patch-id: 88f3a431e7c551a9fa732f062188f10fdd362eeb
> prerequisite-patch-id: 3e88bc873c909059d1199f82cda4013765e7a5e5
> prerequisite-patch-id: 0dbc27cd7417352319a0705a051dff35085e8922
>
> Best regards,
> --
> Junhui Liu <junhui.liu@pigmoral.tech>
>
>

