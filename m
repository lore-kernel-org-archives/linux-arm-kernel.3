Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C97AC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gRRVw/AYria41MhrePKHErpkPl6lNG66+LegsVr3z4=; b=V1aPoHvbaj8SV1ByWsZiWjy0b+
	/2NDz5o7DQfOcC8OrgLjw8Fw7wtI4ku9COwGyycfKsphOXoWohvS8pyHG16grVns4WyPp0DYG4VBA
	GGeVrc3SDsMGPKqTB3W4yswYiWbRQP+SkMjrWIaI3pJsgn1ebWVe6utpCEcLY8NNeVpcfYqee+UqE
	5B60QGz53lFdtJyGVePExw9HgFvE2Rm8ARdefSUAMXYhXgCI4cU//b+r83zLq+WvXgFO4jJz3Ip7x
	OhE0fI9G7G4M3sT2DHNI/tFY0q69vsBryP7ty+7BlWfdm7F/pHeSfVGi9DE0XzTYnlt4AwddhIDo8
	Rt0jMnZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUZZ-00000009rcZ-2ozK;
	Tue, 18 Feb 2025 20:52:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTMU-00000009bH3-1yTB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:34:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso86368f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 11:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739907269; x=1740512069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gRRVw/AYria41MhrePKHErpkPl6lNG66+LegsVr3z4=;
        b=PgwfcLNEzSZZNzhHNfQM7c0B39cGuLg6KTfes4Brs7SdsNeQ1Haf23ICMj7k87f6dz
         PFVjecnJG1y7H2vBMy+NWJapGPHx5QycHLCZxwA1WXyLLrovqGUSuNG1hJ44EHgV+PaZ
         iSTK/0aQxLTjbzp9+aQaZ50LPDWO+SKYAITedGlaMnd4m+j70mQ2PAIiGnrKy8WTn+Lx
         LasMy2dH8oJoWE9uHussGZfz3I/fb1vgLnNCCAlPl6IZRs1/ndrE5bobhNKABSkRonQB
         SvzZkFYFyt8rHOXw7W6pGvZSHlKRXAAaC1Cf3OM6CFo94aGezHwccLx6nhsUDgL+pGcf
         c6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907269; x=1740512069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gRRVw/AYria41MhrePKHErpkPl6lNG66+LegsVr3z4=;
        b=TB6zODZaxxa3fL+ZQx205EYdZ9Qr4vp2s3oanFGFhb0LMGwp5MFrQZ4oyhGlC/dsAK
         4XtljKnjoRmz/C3kVROqwdRYvtbh/vKQz0gz0Ukrbcb/MFZRYIk0FjODwoHYHQH5zxeL
         68tkmUJsISxy1ksQWLoyxEmAzs5G1i/SJA3MLs4vvuEZYBrgqfczXO9F6aof8iEk74Nc
         DZ0m2FoiyQgp0bH5jlftVww8uzOgrQcegTR9ZvOTcKG0PPS9YKO6cV8gKhqaZhDe6UDu
         lEc105+PJtCC5PtX9Ov5FPaJASwAPPmnV1aJIHSfT4/xxM+8BP+l5mkx7b217GZ+K8rW
         VE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAd+WGdKHJayjMzXcssrec0fb/dTs3ZbRBm+PwPrWyHgZJ6jS+i1+vyg4C+SDEfKorEdKeehTPBw32bpxnAmBS@lists.infradead.org
X-Gm-Message-State: AOJu0YxZzrNSow2APncRJBqz7OgS1Jp/kc9wDHycKcvljMJNFHgkOFdy
	HaA3w2hgU1a8DdYLlZRyI/LhiXF3w9hKehrUX1rstJPhnIwyipCM
X-Gm-Gg: ASbGnctQ5O+lWRGWcFNHziUIOuQWwfb7iSS+lnHmW8Og11bwENECX/FR+f47dV8rIGS
	V7SBoAVxYkgZlb+uIgp55CZ6z79UtvgC7a32vGUGmQv/Rm1TYBDLmAn+OT9xtoJWpVm4+505m4+
	LGdhaH8nTiBPXWUt6CuiZRDoTaDW7LghBorEBcIUuWplYmzssEXnI19+SLLPKeOXP+1mcc73ecH
	mPF4dxkkATpVh9WaOTxGpRKwMRprrnMff9y8NbCacre3NXNbeH/sCNiOIacSFul7L9T+i85wddu
	IUbQhQK6J7ksDxPFFloQyqJGA7hg6r7U4jhkt68L3dID7AWWYz+9NK31rYpOIG/fVZA=
X-Google-Smtp-Source: AGHT+IGHKwaqjonh642GsOxeyKxdsH5z+YsnUDWLjShcZ4A8R92dFADuYUyWrKyixAcIuk0C7ZZGNw==
X-Received: by 2002:a05:6000:1fa7:b0:38f:3ec3:4801 with SMTP id ffacd0b85a97d-38f57d94f86mr1020714f8f.25.1739907268627;
        Tue, 18 Feb 2025 11:34:28 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f85c2sm16339601f8f.91.2025.02.18.11.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:34:28 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/15] clk: sunxi-ng: a523: add system mod clocks
Date: Tue, 18 Feb 2025 20:34:27 +0100
Message-ID: <2013031.usQuhbGJ8B@jernej-laptop>
In-Reply-To: <20250214125359.5204-9-andre.przywara@arm.com>
References: <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113430_509893_AAE58287 
X-CRM114-Status: GOOD (  16.91  )
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

Dne petek, 14. februar 2025 ob 13:53:52 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Add the clocks driving some core system related subsystems of the SoC:
> the "CE" crypto engine, the high speed timers, the DRAM and the associated
> MBUS clock, and the PCIe clock.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 119 +++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 0ef1fd71a1ca5..b68c44bce825f 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -423,6 +423,18 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(gpu_clk, "gpu", =
gpu_parents, 0x670,
>  				    BIT(31),	/* gate */
>  				    0);
> =20
> +static const struct clk_parent_data ce_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_periph0_480M_clk.common.hw },
> +	{ .hw =3D &pll_periph0_400M_clk.hw },
> +	{ .hw =3D &pll_periph0_300M_clk.hw },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ce_clk, "ce", ce_parents, 0x680,
> +				       0, 5,	/* M */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
>  static const struct clk_hw *ve_parents[] =3D {
>  	&pll_ve_clk.common.hw,
>  	&pll_periph0_480M_clk.common.hw,
> @@ -435,6 +447,65 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(ve_clk, "ve", ve=
_parents, 0x690,
>  				    BIT(31),	/* gate */
>  				    CLK_SET_RATE_PARENT);
> =20
> +static const struct clk_parent_data hstimer_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .fw_name =3D "iosc" },
> +	{ .fw_name =3D "losc" },
> +	{ .hw =3D &pll_periph0_200M_clk.hw },
> +};
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> +				       hstimer_parents, 0x730,
> +				       0, 0,	/* M */
> +				       0, 3,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       CLK_SET_RATE_PARENT);

CLK_SET_RATE_PARENT doesn't make much sense for fixed clocks.

> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer1_clk, "hstimer1",
> +				       hstimer_parents,
> +				       0x734,
> +				       0, 0,	/* M */
> +				       0, 3,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer2_clk, "hstimer2",
> +				       hstimer_parents,
> +				       0x738,
> +				       0, 0,	/* M */
> +				       0, 3,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer3_clk, "hstimer3",
> +				       hstimer_parents,
> +				       0x73c,
> +				       0, 0,	/* M */
> +				       0, 3,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer4_clk, "hstimer4",
> +				       hstimer_parents,
> +				       0x740,
> +				       0, 0,	/* M */
> +				       0, 3,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer5_clk, "hstimer5",
> +				       hstimer_parents,
> +				       0x744,
> +				       0, 0,	/* M */
> +				       0, 3,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       CLK_SET_RATE_PARENT);
> +
>  static const struct clk_parent_data iommu_parents[] =3D {
>  	{ .hw =3D &pll_periph0_600M_clk.hw },
>  	{ .hw =3D &pll_ddr0_clk.common.hw },
> @@ -450,6 +521,34 @@ static SUNXI_CCU_M_DATA_WITH_MUX_GATE(iommu_clk, "io=
mmu", iommu_parents, 0x7b0,
>  				      BIT(31),	/* gate */
>  				      CLK_SET_RATE_PARENT);
> =20
> +static const struct clk_hw *dram_parents[] =3D {
> +	&pll_ddr0_clk.common.hw,
> +	&pll_periph0_600M_clk.hw,
> +	&pll_periph0_480M_clk.common.hw,
> +	&pll_periph0_400M_clk.hw,
> +	&pll_periph0_150M_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(dram_clk, "dram", dram_parents, 0x80=
0,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_IS_CRITICAL);

Same comment as for IOMMU clock. Update bit is needed to actually apply con=
figuration.

Best regards,
Jernej

> +
> +static CLK_FIXED_FACTOR_HW(mbus_clk, "mbus",
> +			   &dram_clk.common.hw, 4, 1, 0);
> +
> +static const struct clk_parent_data losc_hosc_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .fw_name =3D "losc" },
> +};
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(pcie_aux_clk, "pcie-aux",
> +				      losc_hosc_parents, 0xaa0,
> +				      0, 5,	/* M */
> +				      24, 1,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +
>  static SUNXI_CCU_GATE_DATA(hdmi_24M_clk, "hdmi-24M", osc24M, 0xb04, BIT(=
31), 0);
> =20
>  /* TODO: add mux between 32kOSC and PERIPH0/18750 */
> @@ -584,8 +683,17 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =3D=
 {
>  	&di_clk.common,
>  	&g2d_clk.common,
>  	&gpu_clk.common,
> +	&ce_clk.common,
>  	&ve_clk.common,
> +	&hstimer0_clk.common,
> +	&hstimer1_clk.common,
> +	&hstimer2_clk.common,
> +	&hstimer3_clk.common,
> +	&hstimer4_clk.common,
> +	&hstimer5_clk.common,
>  	&iommu_clk.common,
> +	&dram_clk.common,
> +	&pcie_aux_clk.common,
>  	&hdmi_24M_clk.common,
>  	&hdmi_cec_32k_clk.common,
>  	&hdmi_cec_clk.common,
> @@ -644,11 +752,22 @@ static struct clk_hw_onecell_data sun55i_a523_hw_cl=
ks =3D {
>  		[CLK_AHB]		=3D &ahb_clk.common.hw,
>  		[CLK_APB0]		=3D &apb0_clk.common.hw,
>  		[CLK_APB1]		=3D &apb1_clk.common.hw,
> +		[CLK_MBUS]		=3D &mbus_clk.hw,
>  		[CLK_DE]		=3D &de_clk.common.hw,
>  		[CLK_DI]		=3D &di_clk.common.hw,
>  		[CLK_G2D]		=3D &g2d_clk.common.hw,
>  		[CLK_GPU]		=3D &gpu_clk.common.hw,
> +		[CLK_CE]		=3D &ce_clk.common.hw,
>  		[CLK_VE]		=3D &ve_clk.common.hw,
> +		[CLK_HSTIMER0]		=3D &hstimer0_clk.common.hw,
> +		[CLK_HSTIMER1]		=3D &hstimer1_clk.common.hw,
> +		[CLK_HSTIMER2]		=3D &hstimer2_clk.common.hw,
> +		[CLK_HSTIMER3]		=3D &hstimer3_clk.common.hw,
> +		[CLK_HSTIMER4]		=3D &hstimer4_clk.common.hw,
> +		[CLK_HSTIMER5]		=3D &hstimer5_clk.common.hw,
> +		[CLK_IOMMU]		=3D &iommu_clk.common.hw,
> +		[CLK_DRAM]		=3D &dram_clk.common.hw,
> +		[CLK_PCIE_AUX]		=3D &pcie_aux_clk.common.hw,
>  		[CLK_HDMI_24M]		=3D &hdmi_24M_clk.common.hw,
>  		[CLK_HDMI_CEC_32K]	=3D &hdmi_cec_32k_clk.common.hw,
>  		[CLK_HDMI_CEC]		=3D &hdmi_cec_clk.common.hw,
>=20





