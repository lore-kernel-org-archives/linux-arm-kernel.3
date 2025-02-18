Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B37BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jl7U1zRTmSliSaba3R9gS9qlysQX6pYP+zWE+Yu6Uvk=; b=UIAf+4UzGJ1EHYiAE2ug6RTn+k
	zT1atyV7d0L13WM+qHz7OKoPiihyXf3kV9oacP+VseJxWVX/V8tp7UvXM+eEPnmg3FXhd0snDFldk
	VbOKxTeH3ynxytgLkDsOZNiLh8XVPTiMGazRGUIzPTTHvlO9Y1K4qDrgjBw34M7gWhtHeRk0S/Q+3
	m8yWFzs5O7YREGWDHhFxWFOfjrjhHzkK2OBBK6FPsj5SPOHiJK3zaPapr0DYjEuOyHkWpsxcjFoBM
	nysiFa03nYr0Jn7tgNM2wzqA8HPWnI/dIBHax/DLcv+qqsdIFsHPZgV9cIriKzfquDsZt+EEd0dmS
	/Ba4u7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkU2L-00000009jDR-2Ljh;
	Tue, 18 Feb 2025 20:17:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTUZ-00000009ciB-3cFM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:42:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso65900235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 11:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739907770; x=1740512570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jl7U1zRTmSliSaba3R9gS9qlysQX6pYP+zWE+Yu6Uvk=;
        b=MdGtzjqerN4r8tmIokyFpQSdJWjPD0YIEITAftlYvr8y3nTlDHwHqI3fTyiAqHbGy5
         stbBiyn8hZX6F5wvaS8rSmOE+cnh2qmmHwlMLF4zeOoVWGo9gnL5aKPkLZendnx7acf8
         JkgXqtXq8HRnmnUR34+0Jvqvz6JAjB8Vt67Cr3iu64+yMDC+fVmxvykJoYaWZX9VMjgd
         Iy3KEbrUsfDA2pBteQjssR16NWmW/fZnLnu4esPvSbZeC5e8wKRhNL1iUilgmu4Yr+y1
         zqZIIcL1Mz3odJ59kd60ru6srYV3ISDVAY0cIG6gcp6AQRAkjo7LDRJ7Ibvn9OywOpCe
         8WPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907770; x=1740512570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jl7U1zRTmSliSaba3R9gS9qlysQX6pYP+zWE+Yu6Uvk=;
        b=lflwCjpYCUrVlaqo2zBW7yFQAUYSvpltjDSysTddrtYZ2iBmpwlB9ocTT/MewU5myt
         agELvBH2vLp175Cis3KP27yP4uG8EjOeEqVeH17741RljsZr2mViTN2oFHjJq3IOOJdB
         HL+Ieik56moY27+hJu8tAE9bFRGAqyxN8BfusKlb4/lQyWbKJdz4y39faWeYF7b0mfGv
         vAlQra6rMA8mH9I7dv07BniFIVSpKaJG5kzj62O9vTYoj7/oaSCoWl4Z9E+8Pnhy9Ymq
         SOYCQ8jOeHbci2jH7z9vkIrqVlb0hbtOukTLVrXCTMo3kINX8mGCyv5AmM89eaDcS40v
         G8fg==
X-Forwarded-Encrypted: i=1; AJvYcCU/qgyFH8RsTtlDuBvBomSL3AoEV9Lbm4JJb6FECt4+lzqqUqvo0pkMHfV0jKrHG+JsD0psK7Ce33vwnR8AGuGi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7h+DImxwsht0ecxsPWx3DNLqOJhWOnFxU1mfB4TsvTZ8e2QbU
	b73CU14TdJkgWKxd9fa0FkPAIrVaH48a/FcvqMIdTvBS4SDz6lVy
X-Gm-Gg: ASbGncuoysngWExkgV4gcqoas9/RzGGPYEp5eTL4RItKJhoIA9lhob2zWUz4wN8OWo0
	bf0JjwXX1qxpJaSdPhAH6vgxCCOUt0BbV7HUHs32E3klk2R2VNB5F5FTgcVnG57L1qdIA6vVR6z
	DAQWQOCjoH8HaJLAVxlymE7dhuUBRLbpQAzbmfnW3WwCPrccsqDG1PByNp9pWFCVwdUflV5FhpU
	L6SuA2vlQNuIqZDBcoh5DEdrWzFjDtp1sYhlMUd7Ca/lLt5QWUdNV5Nn4GZ7Aop3rPIioMiSFqE
	vpY5wjhCZ48DSzLOITSpRRe2q0C6QUWY5j5WegsOB0sRhA779B9LpFze7QEfw9Kk63c=
X-Google-Smtp-Source: AGHT+IGUZTP9Mx+RmuM36MdYWx5EMbKHtaqxdPPdwHgNaovkF0uIkKf3zl23uWEwqGtbHZ3m2biocA==
X-Received: by 2002:a05:6000:1785:b0:38d:d6ef:f8 with SMTP id ffacd0b85a97d-38f33f38d23mr16417610f8f.30.1739907770231;
        Tue, 18 Feb 2025 11:42:50 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398937341csm54963525e9.24.2025.02.18.11.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:42:49 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/15] clk: sunxi-ng: a523: add interface mod clocks
Date: Tue, 18 Feb 2025 20:42:48 +0100
Message-ID: <2641802.Lt9SDvczpP@jernej-laptop>
In-Reply-To: <20250214125359.5204-10-andre.przywara@arm.com>
References: <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-10-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_114251_933000_EAFC867C 
X-CRM114-Status: GOOD (  15.92  )
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

Dne petek, 14. februar 2025 ob 13:53:53 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Add the clocks driving what the user manual summarises under "interface"
> devices: raw NAND flash, MMC, SPI, EMAC, "IR" infrared, and the "GPADC"
> general purpose analogue/digital converter.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 160 +++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index b68c44bce825f..14d13fb16dfbb 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -113,6 +113,9 @@ static CLK_FIXED_FACTOR_HWS(pll_periph0_150M_clk, "pl=
l-periph0-150M",
>  			    pll_periph0_2x_hws, 8, 1, 0);
>  static CLK_FIXED_FACTOR_HWS(pll_periph0_160M_clk, "pll-periph0-160M",
>  			    pll_periph0_480M_hws, 3, 1, 0);
> +static const struct clk_hw *pll_periph0_150M_hws[] =3D {
> +	&pll_periph0_150M_clk.hw
> +};
> =20
>  #define SUN55I_A523_PLL_PERIPH1_REG	0x028
>  static struct ccu_nm pll_periph1_4x_clk =3D {
> @@ -537,6 +540,133 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(dram_clk, "dram=
", dram_parents, 0x800,
>  static CLK_FIXED_FACTOR_HW(mbus_clk, "mbus",
>  			   &dram_clk.common.hw, 4, 1, 0);
> =20
> +static const struct clk_parent_data nand_mmc_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_periph0_400M_clk.hw },
> +	{ .hw =3D &pll_periph0_300M_clk.hw },
> +	{ .hw =3D &pll_periph1_400M_clk.hw },
> +	{ .hw =3D &pll_periph1_300M_clk.hw },
> +};
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(nand0_clk, "nand0", nand_mmc_paren=
ts,
> +				    0x810,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(nand1_clk, "nand1", nand_mmc_paren=
ts,
> +				    0x814,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc0_clk, "mmc0", nand_mmc_par=
ents,
> +					   0x830,
> +					   0, 5,	/* M */
> +					   8, 5,	/* P */
> +					   24, 3,	/* mux */
> +					   BIT(31),	/* gate */
> +					   2,		/* post div */
> +					   0, CCU_FEATURE_DUAL_DIV);
> +
> +static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc1_clk, "mmc1", nand_mmc_par=
ents,
> +					   0x834,
> +					   0, 5,	/* M */
> +					   8, 5,	/* P */
> +					   24, 3,	/* mux */
> +					   BIT(31),	/* gate */
> +					   2,		/* post div */
> +					   0, CCU_FEATURE_DUAL_DIV);
> +
> +static const struct clk_parent_data mmc2_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_periph0_800M_clk.common.hw },
> +	{ .hw =3D &pll_periph0_600M_clk.hw },
> +	{ .hw =3D &pll_periph1_800M_clk.common.hw },
> +	{ .hw =3D &pll_periph1_600M_clk.hw },
> +};
> +
> +static SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(mmc2_clk, "mmc2", mmc2_parents,
> +					   0x838,
> +					   0, 5,	/* M */
> +					   8, 5,	/* P */
> +					   24, 3,	/* mux */
> +					   BIT(31),	/* gate */
> +					   2,		/* post div */
> +					   0, CCU_FEATURE_DUAL_DIV);
> +
> +static const struct clk_parent_data spi_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_periph0_300M_clk.hw },
> +	{ .hw =3D &pll_periph0_200M_clk.hw },
> +	{ .hw =3D &pll_periph1_300M_clk.hw },
> +	{ .hw =3D &pll_periph1_200M_clk.hw },
> +};
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi0_clk, "spi0", spi_parents, 0x=
940,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi1_clk, "spi1", spi_parents, 0x=
944,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi2_clk, "spi2", spi_parents, 0x=
948,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spifc_clk, "spifc", nand_mmc_pare=
nts,
> +				       0x950,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);

Missing CCU_FEATURE_DUAL_DIV flag.

Best regards,
Jernej

> +
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac0_25M_clk, "emac0-25M",
> +				      pll_periph0_150M_hws,
> +				      0x970, BIT(31) | BIT(30), 6, 0);
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac1_25M_clk, "emac1-25M",
> +				      pll_periph0_150M_hws,
> +				      0x974, BIT(31) | BIT(30), 6, 0);
> +
> +static const struct clk_parent_data ir_rx_parents[] =3D {
> +	{ .fw_name =3D "losc" },
> +	{ .fw_name =3D "hosc" },
> +};
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ir_rx_clk, "ir-rx", ir_rx_parents,=
 0x990,
> +				      0, 5,	/* M */
> +				      24, 1,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +static const struct clk_parent_data ir_tx_ledc_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_periph1_600M_clk.hw },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ir_tx_clk, "ir-tx", ir_tx_ledc_par=
ents,
> +				      0x9c0,
> +				      0, 5,	/* M */
> +				      24, 1,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +
> +static SUNXI_CCU_M_WITH_GATE(gpadc0_clk, "gpadc0", "hosc", 0x9e0,
> +				 0, 5,		/* M */
> +				 BIT(31),	/* gate */
> +				 0);
> +static SUNXI_CCU_M_WITH_GATE(gpadc1_clk, "gpadc1", "hosc", 0x9e4,
> +				 0, 5,		/* M */
> +				 BIT(31),	/* gate */
> +				 0);
> +
>  static const struct clk_parent_data losc_hosc_parents[] =3D {
>  	{ .fw_name =3D "hosc" },
>  	{ .fw_name =3D "losc" },
> @@ -693,6 +823,21 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =3D=
 {
>  	&hstimer5_clk.common,
>  	&iommu_clk.common,
>  	&dram_clk.common,
> +	&nand0_clk.common,
> +	&nand1_clk.common,
> +	&mmc0_clk.common,
> +	&mmc1_clk.common,
> +	&mmc2_clk.common,
> +	&spi0_clk.common,
> +	&spi1_clk.common,
> +	&spi2_clk.common,
> +	&spifc_clk.common,
> +	&emac0_25M_clk.common,
> +	&emac1_25M_clk.common,
> +	&ir_rx_clk.common,
> +	&ir_tx_clk.common,
> +	&gpadc0_clk.common,
> +	&gpadc1_clk.common,
>  	&pcie_aux_clk.common,
>  	&hdmi_24M_clk.common,
>  	&hdmi_cec_32k_clk.common,
> @@ -767,6 +912,21 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clk=
s =3D {
>  		[CLK_HSTIMER5]		=3D &hstimer5_clk.common.hw,
>  		[CLK_IOMMU]		=3D &iommu_clk.common.hw,
>  		[CLK_DRAM]		=3D &dram_clk.common.hw,
> +		[CLK_NAND0]		=3D &nand0_clk.common.hw,
> +		[CLK_NAND1]		=3D &nand1_clk.common.hw,
> +		[CLK_MMC0]		=3D &mmc0_clk.common.hw,
> +		[CLK_MMC1]		=3D &mmc1_clk.common.hw,
> +		[CLK_MMC2]		=3D &mmc2_clk.common.hw,
> +		[CLK_SPI0]		=3D &spi0_clk.common.hw,
> +		[CLK_SPI1]		=3D &spi1_clk.common.hw,
> +		[CLK_SPI2]		=3D &spi2_clk.common.hw,
> +		[CLK_SPIFC]		=3D &spifc_clk.common.hw,
> +		[CLK_EMAC0_25M]		=3D &emac0_25M_clk.common.hw,
> +		[CLK_EMAC1_25M]		=3D &emac1_25M_clk.common.hw,
> +		[CLK_IR_RX]		=3D &ir_rx_clk.common.hw,
> +		[CLK_IR_TX]		=3D &ir_tx_clk.common.hw,
> +		[CLK_GPADC0]		=3D &gpadc0_clk.common.hw,
> +		[CLK_GPADC1]		=3D &gpadc1_clk.common.hw,
>  		[CLK_PCIE_AUX]		=3D &pcie_aux_clk.common.hw,
>  		[CLK_HDMI_24M]		=3D &hdmi_24M_clk.common.hw,
>  		[CLK_HDMI_CEC_32K]	=3D &hdmi_cec_32k_clk.common.hw,
>=20





