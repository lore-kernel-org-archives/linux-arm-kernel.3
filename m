Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85467CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 11:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sP+U6vTOYVFeaddq3bndo5VJDBbsue1fF5yn9Hxp6Z8=; b=IuwQ07y71+9gBP
	JMLR0rsoHmfHa3Hjule8k0gNCr7Uj6DCxFXtsFQ1QTCf5+bCH2OxQCHedQCP7oWZ1Yr2Gc/0FxK68
	ZORwnSXSnfIL/xCKlJ9ZMAp/HlbCnzUHc+sVaUDExvCUrIES92Kx22oJElaQAfIkIK8CizUEq4Kpx
	mjHM9LLBmLzCAAjKroJFOzfLLW9H89IG2AzBBGZ1EF0zpGDUnFwC82Aif0ORWqAmmkisjsjHe0NiD
	jSaAt4zNoeiD56RzdNsUwb04TAwCHPnjYBFuvacKoc5YxxaKX2NhcV6gJglDIhbXtTjjGvgkZReos
	lF3o341R09ECWyFOrcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK0i-0000000EhEQ-1hZG;
	Sun, 04 Oct 2026 11:04:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK0g-0000000EhDr-27Bh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 11:04:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF45C43D44
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 11:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C432A1F0089E
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791111841;
	bh=sP+U6vTOYVFeaddq3bndo5VJDBbsue1fF5yn9Hxp6Z8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Wq47FrTZl87QqSe72Vw6iixqDzDAGVGWBG4ujf3ihu+oLVPRSKYEu4pliFc7Vnu4B
	 0CAFZ1R3dg8mMjq5nwRYczn8xSsmIdg0NTH4ZAuh4m5FlVzq/kzuJ5BYsdQntAmm+8
	 8ApZI6wnB0PbodOQ4hO68ZUjinVkDPBMHODWLypyPwwT3HPUqzxfMHYLAHtT/DTJGL
	 IEnpyIrsIzVRN8sIBrKl0+bVI8YL3wmqt6nFPh8pfP8qi9iILS/2BpWVAcxTCYT0WZ
	 YaEtzUPzXkLkZQg5Q3vcmXOPxQ4XcD2Ec50gSfqI4cb/ywjVFJ0RSER2Dd/gLQr5+Z
	 UJ1tYbAxQRntQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a97c689f0bso5438181fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 04:04:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxq3KgU07LjvUtbK0gNAabCGSL3dadIQqTQl97mKvGgDq7zQSTc4jTQEP7XQ55OBfb9YXnBe2dd9wBS6PL/Je78@lists.infradead.org
X-Gm-Message-State: AFq9FYLVApCOSW49Jt9rtirb1Gd4Z83W8C6m0RZ/qn2ppF1W8gOuhnkH
	XxGcHyY2YYeKqYE3PhEJFe4GjftaELI4/ByJz+dwo8ZvJth1dUpeACPLtZ49i8smorj6dBLYDRo
	0kT0NkMzYr537fI69n8BTVgGCefTquy8=
X-Received: by 2002:a05:651c:b06:b0:3a3:2a41:e329 with SMTP id
 38308e7fff4ca-3a974f2002fmr11552811fa.9.1791111839797; Sun, 04 Oct 2026
 04:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-7-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-7-11175b41cd2d@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 4 Oct 2026 13:03:46 +0200
X-Gmail-Original-Message-ID: <CAGb2v65Lqo7NiFhc2GYdfY7+jkC4Y+p6=Zy85HOFmXJzT0u1fg@mail.gmail.com>
X-Gm-Features: AclHuK-3Yak0ZaS0tUNz8C2FVnQs0VdN0bcI-ns1tG3C0FjgWxx3tVmNCyaYb4Y
Message-ID: <CAGb2v65Lqo7NiFhc2GYdfY7+jkC4Y+p6=Zy85HOFmXJzT0u1fg@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] clk: sunxi-ng: a733: Add bus clock gates
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
	Andre Przywara <andre.przywara@arm.com>
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

On Tue, Sep 29, 2026 at 7:28=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add the bus clock gates that control access to the devices' register
> interface on the Allwinner A733 SoC. These clocks are typically
> single-bit controls in the BGR registers, covering UARTs, SPI, I2C, and
> various multimedia engines. It also includes bus gates for system
> components like the IOMMU and MSI-lite interfaces.
>
> Also mark the ahb-store, mbus-store and ahb-cpus clocks as critical.
> Disabling either store gate breaks access to boot/storage devices such
> as MMC and SPI NOR, while gating ahb-cpus hangs any access to the CPUS
> power domain registers when unused clocks are disabled.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 492 +++++++++++++++++++++++++++=
+++++-
>  1 file changed, 491 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 1b2d4d36ec4c..b077e5d2f32c 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> @@ -4,6 +4,10 @@
>   * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
>   * Based on the A523 CCU driver:
>   *   Copyright (C) 2023-2024 Arm Ltd.
> + *
> + * TODO: The real parents of some bus gates, including its-pcie0-aclk,
> + * msi-lite, npu, ufs, sgpio, lpc and i2spcm, are not documented in the
> + * manual. For now, follow the vendor BSP, which keeps them on hosc.
>   */

[...]

> @@ -510,9 +522,118 @@ static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(mbus_clk=
, "mbus", mbus_parents, 0x588
>                                            BIT(31),     /* gate */
>                                            CLK_IS_CRITICAL,
>                                            CCU_FEATURE_UPDATE_BIT);
> +static const struct clk_hw *mbus_hws[] =3D { &mbus_clk.common.hw };
> +
> +static SUNXI_CCU_GATE_HWS(mbus_iommu0_sys_clk, "mbus-iommu0-sys", mbus_h=
ws, 0x58c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(apb_iommu0_sys_clk, "apb-iommu0-sys", apb0_hws=
, 0x58c, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_iommu0_sys_clk, "ahb-iommu0-sys", ahb_hws,=
 0x58c, BIT(2), 0);
> +
> +static SUNXI_CCU_GATE_DATA(bus_msi_lite0_clk, "bus-msi-lite0", hosc, 0x5=
94, BIT(0), 0);
> +static SUNXI_CCU_GATE_DATA(bus_msi_lite1_clk, "bus-msi-lite1", hosc, 0x5=
9c, BIT(0), 0);
> +static SUNXI_CCU_GATE_DATA(bus_msi_lite2_clk, "bus-msi-lite2", hosc, 0x5=
a4, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HWS(mbus_iommu1_sys_clk, "mbus-iommu1-sys", mbus_h=
ws, 0x5b4, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(apb_iommu1_sys_clk, "apb-iommu1-sys", apb0_hws=
, 0x5b4, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_iommu1_sys_clk, "ahb-iommu1-sys", ahb_hws,=
 0x5b4, BIT(2), 0);

> +static SUNXI_CCU_GATE_HWS(ahb_ve_dec_clk, "ahb-ve-dec", ahb_hws,
> +                         0x5c0, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_ve_enc_clk, "ahb-ve-enc", ahb_hws,
> +                         0x5c0, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_vid_in_clk, "ahb-vid-in", ahb_hws,
> +                         0x5c0, BIT(2), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_vid_cout0_clk, "ahb-vid-cout0", ahb_hws,
> +                         0x5c0, BIT(3), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_vid_cout1_clk, "ahb-vid-cout1", ahb_hws,
> +                         0x5c0, BIT(4), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_de_clk, "ahb-de", ahb_hws,
> +                         0x5c0, BIT(5), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_npu_clk, "ahb-npu", ahb_hws,
> +                         0x5c0, BIT(6), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_gpu0_clk, "ahb-gpu0", ahb_hws,
> +                         0x5c0, BIT(7), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_serdes_clk, "ahb-serdes", ahb_hws,
> +                         0x5c0, BIT(8), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_usb_sys_clk, "ahb-usb-sys", ahb_hws,
> +                         0x5c0, BIT(9), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
> +                         0x5c0, BIT(16), 0);
> +static SUNXI_CCU_GATE_HWS(ahb_store_clk, "ahb-store", ahb_hws,
> +                         0x5c0, BIT(24), CLK_IS_CRITICAL);
> +static SUNXI_CCU_GATE_HWS(ahb_cpus_clk, "ahb-cpus", ahb_hws,
> +                         0x5c0, BIT(28), CLK_IS_CRITICAL);

I suspect these refer to a AHB-AHB bridge for the various subsystems shown
in the memory map. That would explain why when the "ahb-store" clock is
gated, the storage bits stop working.

If that's the case, we should describe it as the parent of each storage
peripheral bus gate's parent. Same would go for the other types. I haven't
checked what the BSP does though.

> +static SUNXI_CCU_GATE_HWS(mbus_iommu0_clk, "mbus-iommu0", mbus_hws,
> +                         0x5e0, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_iommu1_clk, "mbus-iommu1", mbus_hws,
> +                         0x5e0, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_desys_clk, "mbus-desys", mbus_hws,
> +                         0x5e0, BIT(11), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_ve_enc0_gate_clk, "mbus-ve-enc0-gate", mb=
us_hws,
> +                         0x5e0, BIT(12), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_ve_dec0_gate_clk, "mbus-ve-dec0-gate", mb=
us_hws,
> +                         0x5e0, BIT(14), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_gpu0_clk, "mbus-gpu0", mbus_hws,
> +                         0x5e0, BIT(16), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_npu_clk, "mbus-npu", mbus_hws,
> +                         0x5e0, BIT(18), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_vid_in_clk, "mbus-vid-in", mbus_hws,
> +                         0x5e0, BIT(24), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_serdes_clk, "mbus-serdes", mbus_hws,
> +                         0x5e0, BIT(28), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_msi_lite0_clk, "mbus-msi-lite0", mbus_hws=
,
> +                         0x5e0, BIT(29), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_store_clk, "mbus-store", mbus_hws,
> +                         0x5e0, BIT(30), CLK_IS_CRITICAL);

Same thing for the MBUS clocks.

> +static SUNXI_CCU_GATE_HWS(mbus_msi_lite2_clk, "mbus-msi-lite2", mbus_hws=
,
> +                         0x5e0, BIT(31), 0);
> +
> +static SUNXI_CCU_GATE_HWS(mbus_dma0_clk, "mbus-dma0", mbus_hws,
> +                         0x5e4, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_ve_enc0_clk, "mbus-ve-enc0", mbus_hws,
> +                         0x5e4, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_ce_clk, "mbus-ce", mbus_hws,
> +                         0x5e4, BIT(2), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_dma1_clk, "mbus-dma1", mbus_hws,
> +                         0x5e4, BIT(3), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_nand_clk, "mbus-nand", mbus_hws,
> +                         0x5e4, BIT(5), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_csi_clk, "mbus-csi", mbus_hws,
> +                         0x5e4, BIT(8), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_isp_clk, "mbus-isp", mbus_hws,
> +                         0x5e4, BIT(9), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_gmac0_clk, "mbus-gmac0", mbus_hws,
> +                         0x5e4, BIT(11), 0);
> +/* Undocumented, taken from the vendor kernel. */
> +static SUNXI_CCU_GATE_HWS(mbus_gmac1_clk, "mbus-gmac1", mbus_hws,
> +                         0x5e4, BIT(12), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_ve_dec0_clk, "mbus-ve-dec0", mbus_hws,
> +                         0x5e4, BIT(18), 0);

[...]

The remaining definitions look correct (minus the vendor BSP ones which I
couldn't check at this time).

I didn't check the clock list additions.

Consider this

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


We can change the AHB / MBUS clock parents later if we do figure it out.


ChenYu

