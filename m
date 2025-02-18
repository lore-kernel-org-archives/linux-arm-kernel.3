Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0226CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0O7shOkTYYhzpBdc0RT+E/zz0YqOfNDEdfZfpbbnbE=; b=YlGT/OYaL39C3RFqNhRuQOHmJH
	wknD5YjAA7++3VqljNTXbPHR/LLqY8s1KCwNxUgQcgOJkIlAyShkTBfZ4XlieUHVB81VAjWx7UJnG
	qy8aVNmLFQrfc9qRO2rwSb11z7979sbGswcbzepj8Vd049Wq2ieO+4YditDIAy10+XkmVacKJsF9X
	XSZ2HIK9MZcI31OgD/G9jivK+sl8Z7rpb+nD0X4Lzpbr60mkAaliYPitmo0fNYlC0bqZwUZ6jfiyG
	N/fl7e3CBetsrNYxHXpco9YHAq6T5XROC/wMuB8Gt4kFxPXF2XTgv0byuEeDO2dYskRxXKIpwhyiR
	LupRhAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTuW-00000009hWR-0tAO;
	Tue, 18 Feb 2025 20:09:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTEo-00000009ZAi-2MSL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:26:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so41036355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 11:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739906793; x=1740511593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0O7shOkTYYhzpBdc0RT+E/zz0YqOfNDEdfZfpbbnbE=;
        b=EgTKGs7PB+Ij9kN6rJc5pBeaHgX9VZi+VuLwYc45wtMsLuymRmy9zDjjDYGWn3gaMi
         N60rbHGhZ364SNEUZiyOnUyNyrfop9A0WB2EBlTDWWuUd6fsBPTJRa6ey4OBbJ7KKQWH
         60+t5vHbQ1kPOoYSpd9JkavEzkPI+gc8yFre6aV/9hF01OfLTzkNl8KpLq26mVxsrnsR
         hPoydz3q5Ukvz2vHq2fspZ0jM/B1nege8+L0HSZLORaE+/ihfV4xt4n6MUg9dfs+zPFu
         alwFGHpBq8wWIk2Dr+juEnyCm8AsXdcnwZ9XtD9+5r9zAH1tXRG++GY4q3K/aPz5Bg+g
         DB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739906793; x=1740511593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0O7shOkTYYhzpBdc0RT+E/zz0YqOfNDEdfZfpbbnbE=;
        b=eZDZ5oWkAp/nNAZShvEfO0W0NUJYmQEzscFcwDPVZwQe8gRCJ/NiQsixC43ygeWUgM
         8rK4gxLnJ8foJXjMCp+FkIj0jV2GIbxtJZ4ve+WSR4ap+qpnU5i4Vz5ppUWaDkK0ruJY
         2jqaUuET0hQObXbqA3FNXOfxNXkvsX+kjuQ+prHNoTSYBxsaM3PdUrPRjFZFsGhDd5C6
         6wWNTdB1jo907Rzp16lPghTiXTnIU0GHU+8AdUJylkGjFC5H6qdcV3pZ9YdT6j13G6/G
         MJ7GaBLDd5/ujuf2lEvmWp0PDwexilwzzmIvO9MLyGGWu+1meFPYa3UBgP987eibHVAg
         BNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/Ppa2eCbeDOFbaybVgdX242yIbP0BX/XS1DI/0NlCl9QHMSqc82qhoPeTXnD0z6T691tXaS9wXIMFJKOUDQdh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtl8J/G2qKdpJFi5ZGZZr45WCjFra6Kso7bMq1xHIF4F3kkmSe
	g1nQIG9n5GYroOUXFkhtVlQX2JlI20vUYOkXC92kzJsbMlNSCj23
X-Gm-Gg: ASbGnctikF8LswfrAA2bGX3zBbHRICxRfI5t9erEVWNVgmPyeZlbyht6H1MU+TQB++r
	N3cheGnKpbnxHG6ixTAFR9n/8YQbZPbkFK6D/rW2E98vx2xmBZ4LnoVq1PHxqFbIv2EM4Wrrhfg
	OD5Siu6uVb7/3O0WE9AQGaii/MI+HNAq4UmQlmfvRA7/pbFBs43MonHXi1OPKEE/7VR+le4rlRs
	vZHdk1ak2BCPw95CIvM3quwIB29UmmPTzRUbGDRgQ3pdAkKp7/5wsAJ4PseCZp3I1GGzTBk+jRS
	xTHDAp9eIG77OnYPupA5mmcf2vou5ghl5iEO3101cem46RExx1HgVTcLo/fF06etmI8=
X-Google-Smtp-Source: AGHT+IE8P6Bf5j6JNMDNPPmdiyOQzARFL3KZEbRWk3stCaeMLQwc8p5C2vnHoL6JXmbjGbMJBisPYA==
X-Received: by 2002:a05:600c:511a:b0:439:643a:c8c4 with SMTP id 5b1f17b1804b1-4396e7527cfmr125859015e9.22.1739906792544;
        Tue, 18 Feb 2025 11:26:32 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439922141a5sm35844685e9.2.2025.02.18.11.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:26:32 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/15] clk: sunxi-ng: a523: add video mod clocks
Date: Tue, 18 Feb 2025 20:26:31 +0100
Message-ID: <9406479.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20250214125359.5204-8-andre.przywara@arm.com>
References: <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-8-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_112634_604506_579B6148 
X-CRM114-Status: GOOD (  20.51  )
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

Dne petek, 14. februar 2025 ob 13:53:51 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Add the clocks driving the various video subsystems of the SoC: the "DE"
> display engine, the "DI" deinterlacer, the "G2D" 2D graphics system, the
> Mali "GPU", the "VE" video engine, its associated IOMMU, as well as the
> clocks for the various video output drivers (HDMI, DP, LCDs).
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 219 +++++++++++++++++++++++++
>  1 file changed, 219 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 59f45e7c0904b..0ef1fd71a1ca5 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -364,6 +364,192 @@ static SUNXI_CCU_M_DATA_WITH_MUX(apb1_clk, "apb1", =
apb1_parents, 0x524,
>  				 24, 3,		/* mux */
>  				 0);
> =20
> +
> +/***********************************************************************=
***
> + *                          mod clocks                                  =
  *
> + ***********************************************************************=
***/
> +
> +static const struct clk_hw *de_parents[] =3D {
> +	&pll_periph0_300M_clk.hw,
> +	&pll_periph0_400M_clk.hw,
> +	&pll_video3_4x_clk.common.hw,
> +	&pll_video3_3x_clk.hw,
> +};
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(de_clk, "de", de_parents, 0x600,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
> +static const struct clk_hw *di_parents[] =3D {
> +	&pll_periph0_300M_clk.hw,
> +	&pll_periph0_400M_clk.hw,
> +	&pll_video0_4x_clk.common.hw,
> +	&pll_video1_4x_clk.common.hw,
> +};
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(di_clk, "di", di_parents, 0x620,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
> +static const struct clk_hw *g2d_parents[] =3D {
> +	&pll_periph0_400M_clk.hw,
> +	&pll_periph0_300M_clk.hw,
> +	&pll_video0_4x_clk.common.hw,
> +	&pll_video1_4x_clk.common.hw,
> +};
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(g2d_clk, "g2d", g2d_parents, 0x630,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static const struct clk_hw *gpu_parents[] =3D {
> +	&pll_gpu_clk.common.hw,
> +	&pll_periph0_800M_clk.common.hw,
> +	&pll_periph0_600M_clk.hw,
> +	&pll_periph0_400M_clk.hw,
> +	&pll_periph0_300M_clk.hw,
> +	&pll_periph0_200M_clk.hw,
> +};
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
> +				    0, 4,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);

GPU clock should have CLK_SET_RATE_FLAG.

> +
> +static const struct clk_hw *ve_parents[] =3D {
> +	&pll_ve_clk.common.hw,
> +	&pll_periph0_480M_clk.common.hw,
> +	&pll_periph0_400M_clk.hw,
> +	&pll_periph0_300M_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(ve_clk, "ve", ve_parents, 0x690,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
> +static const struct clk_parent_data iommu_parents[] =3D {
> +	{ .hw =3D &pll_periph0_600M_clk.hw },
> +	{ .hw =3D &pll_ddr0_clk.common.hw },
> +	{ .hw =3D &pll_periph0_480M_clk.common.hw },
> +	{ .hw =3D &pll_periph0_400M_clk.hw },
> +	{ .hw =3D &pll_periph0_150M_clk.hw },
> +	{ .fw_name =3D "hosc" },
> +};
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(iommu_clk, "iommu", iommu_parents,=
 0x7b0,
> +				      0, 5,	/* M */
> +				      24, 3,	/* mux */
> +				      BIT(31),	/* gate */
> +				      CLK_SET_RATE_PARENT);

This won't work. IOMMU clock has also update bit, which must be set to actu=
ally
apply the new value, same as DDR clock.

> +
> +static SUNXI_CCU_GATE_DATA(hdmi_24M_clk, "hdmi-24M", osc24M, 0xb04, BIT(=
31), 0);
> +
> +/* TODO: add mux between 32kOSC and PERIPH0/18750 */

Not sure what this TODO means.

> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(hdmi_cec_32k_clk, "hdmi-cec-32k",
> +				      pll_periph0_2x_hws,
> +				      0xb10, BIT(30), 36621, 0);
> +
> +static const struct clk_parent_data hdmi_cec_parents[] =3D {
> +	{ .fw_name =3D "losc" },
> +	{ .hw =3D &hdmi_cec_32k_clk.common.hw },
> +};
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(hdmi_cec_clk, "hdmi-cec", hdmi_cec_p=
arents,
> +				    0xb10,
> +				    24, 1,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static const struct clk_parent_data mipi_dsi_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_periph0_200M_clk.hw },
> +	{ .hw =3D &pll_periph0_150M_clk.hw },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(mipi_dsi0_clk, "mipi-dsi0",
> +				      mipi_dsi_parents, 0xb24,
> +				      0, 5,	/* M */
> +				      24, 3,	/* mux */
> +				      BIT(31),	/* gate */
> +				      CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(mipi_dsi1_clk, "mipi-dsi1",
> +				      mipi_dsi_parents, 0xb28,
> +				      0, 5,	/* M */
> +				      24, 3,	/* mux */
> +				      BIT(31),	/* gate */
> +				      CLK_SET_RATE_PARENT);
> +
> +static const struct clk_hw *tcon_parents[] =3D {
> +	&pll_video0_4x_clk.common.hw,
> +	&pll_video1_4x_clk.common.hw,
> +	&pll_video2_4x_clk.common.hw,
> +	&pll_video3_4x_clk.common.hw,
> +	&pll_periph0_2x_clk.common.hw,
> +	&pll_video0_3x_clk.hw,
> +	&pll_video1_3x_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(tcon_lcd0_clk, "tcon-lcd0", tcon_par=
ents,
> +				    0xb60,
> +				    0,  5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(tcon_lcd1_clk, "tcon-lcd1", tcon_par=
ents,
> +				    0xb64,
> +				    0,  5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);

Missing tcon-lcd2 - see T527 manual.

> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(combophy_dsi0_clk, "combophy-dsi0",
> +				    tcon_parents, 0xb6c,
> +				    0,  5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(combophy_dsi1_clk, "combophy-dsi1",
> +				    tcon_parents, 0xb70,
> +				    0,  5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(tcon_tv0_clk, "tcon-tv0", tcon_paren=
ts,
> +				    0xb80,
> +				    0, 4,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(tcon_tv1_clk, "tcon-tv1", tcon_paren=
ts,
> +				    0xb84,
> +				    0, 4,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);

TCON TV0-1 parents are subset of others, according to T527 manual.

> +
> +static const struct clk_hw *edp_parents[] =3D {
> +	&pll_video0_4x_clk.common.hw,
> +	&pll_video1_4x_clk.common.hw,
> +	&pll_video2_4x_clk.common.hw,
> +	&pll_video3_4x_clk.common.hw,
> +	&pll_periph0_2x_clk.common.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(edp_clk, "edp", edp_parents, 0xbb0,
> +				    0, 4,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +

Missing CLK_SET_RATE_PARENT flag.

Best regards,
Jernej

>  /*
>   * Contains all clocks that are controlled by a hardware register. They
>   * have a (sunxi) .common member, which needs to be initialised by the c=
ommon
> @@ -394,6 +580,22 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =3D=
 {
>  	&ahb_clk.common,
>  	&apb0_clk.common,
>  	&apb1_clk.common,
> +	&de_clk.common,
> +	&di_clk.common,
> +	&g2d_clk.common,
> +	&gpu_clk.common,
> +	&ve_clk.common,
> +	&iommu_clk.common,
> +	&hdmi_24M_clk.common,
> +	&hdmi_cec_32k_clk.common,
> +	&hdmi_cec_clk.common,
> +	&mipi_dsi0_clk.common,
> +	&mipi_dsi1_clk.common,
> +	&tcon_lcd0_clk.common,
> +	&tcon_lcd1_clk.common,
> +	&tcon_tv0_clk.common,
> +	&tcon_tv1_clk.common,
> +	&edp_clk.common,
>  };
> =20
>  static struct clk_hw_onecell_data sun55i_a523_hw_clks =3D {
> @@ -442,6 +644,23 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clk=
s =3D {
>  		[CLK_AHB]		=3D &ahb_clk.common.hw,
>  		[CLK_APB0]		=3D &apb0_clk.common.hw,
>  		[CLK_APB1]		=3D &apb1_clk.common.hw,
> +		[CLK_DE]		=3D &de_clk.common.hw,
> +		[CLK_DI]		=3D &di_clk.common.hw,
> +		[CLK_G2D]		=3D &g2d_clk.common.hw,
> +		[CLK_GPU]		=3D &gpu_clk.common.hw,
> +		[CLK_VE]		=3D &ve_clk.common.hw,
> +		[CLK_HDMI_24M]		=3D &hdmi_24M_clk.common.hw,
> +		[CLK_HDMI_CEC_32K]	=3D &hdmi_cec_32k_clk.common.hw,
> +		[CLK_HDMI_CEC]		=3D &hdmi_cec_clk.common.hw,
> +		[CLK_MIPI_DSI0]		=3D &mipi_dsi0_clk.common.hw,
> +		[CLK_MIPI_DSI1]		=3D &mipi_dsi1_clk.common.hw,
> +		[CLK_TCON_LCD0]		=3D &tcon_lcd0_clk.common.hw,
> +		[CLK_TCON_LCD1]		=3D &tcon_lcd1_clk.common.hw,
> +		[CLK_COMBOPHY_DSI0]	=3D &combophy_dsi0_clk.common.hw,
> +		[CLK_COMBOPHY_DSI1]	=3D &combophy_dsi1_clk.common.hw,
> +		[CLK_TCON_TV0]		=3D &tcon_tv0_clk.common.hw,
> +		[CLK_TCON_TV1]		=3D &tcon_tv1_clk.common.hw,
> +		[CLK_EDP]		=3D &edp_clk.common.hw,
>  	},
>  };
> =20
>=20





