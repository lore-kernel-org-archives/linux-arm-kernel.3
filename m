Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EC5C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyFAvHnWoYMGsKstM+kT9VyU5glSveY29/SkjUzLsmk=; b=Nr3Ko4AFV2BuIzx1yRcT5Mp7mU
	WWf9MN1nppjuT0Py59oQ9rY8dCSK7el8y+yMj2WO8cs3lDwNtXXPbbMMaRobVlvRknDqhv9/nxY9s
	uebX4Z4mh8DJHdjJzG3aTnfgw/sgUkGGLdaSxulSioHlZNfsZByBoxm0MEfhqpQDE3v+lNH3QUmnF
	6n9pxPm8In9z3lO02lFpFoDYBNnuw++2JUS5lu85Lng//YAt+RSXy37SZ/46rhFk43HeUohAlHzn/
	FgDftS/5lCgfPbF62YDxfHkwxQ+anw9+adpr6XWpEx/StftrMleDk93nzpBCmKDxe0zTFK1BuRQtM
	muvwXCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkU88-00000009kNC-1DAH;
	Tue, 18 Feb 2025 20:23:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTgw-00000009f5e-1ENg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:55:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4398e839cd4so854035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 11:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739908537; x=1740513337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyFAvHnWoYMGsKstM+kT9VyU5glSveY29/SkjUzLsmk=;
        b=MVgjM9gNCil6Jryno6sUmSz+MgsINqONQQDe/yn99z0xn0M9MkKIkZhblHyToldvsp
         sMFyrBV+2E0R/L7ob03NAhxwABHnuTlvbINhZU+THFjTXCUy4VM2jCxe2QkKHVIdwgCq
         KZFYBcQ+sq7fBrTQ3QaYNzQ6DozOPOvqCp4AbJJfyHVp3CrrH4Xvw9j/ZhaU9bY8FSfD
         esM9qiljj2YVNSPm1jXWBLea6cxTNRvMCFXgwuXarh51++ozReJYAkPvFkkODv3M2ObQ
         k71HupZUb/yQh0EiGU5JYkDiy5Hu1sqOlAlfWZlSW0RWLeeDJZ7nnN5auGU7vkMlUUqr
         UDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739908537; x=1740513337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyFAvHnWoYMGsKstM+kT9VyU5glSveY29/SkjUzLsmk=;
        b=ZAlKkGYIV/QP4AsffZ8JK/KgFelRsfKnGced/1pUpPzSmHGOIZWxEZkkQ4HxWPlAwr
         dw4H9fpUzjDR/M3MAmgKXFsnIbzaieYNkXvJTgLTnYpaX7wkz1ZGQkSw92QPqZRKGnwQ
         x8S3aW6qcmG5RRUABPiYcQa64x6DjBPAY9wC2eTNXm/buW0S4NmsX+6++9W2t7Ni8pxu
         4CuKPFu94+71NbxJllFJribd9sLHPClXHFMU0JX/DzAM/yqrK2h+kaCuv6a9VNZFqarp
         j6ho/ePjBReIpgivck2xNN5N7Y4qYkNwTiH7Z6LZrdt4ILRDo3+HfHIvwFHKZ+jX8CIv
         sNyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuJE+eM4COIjbrm4hF/AYPPkpnPcOLUzYkcOtnrhFmMsHFKRj9skoCb290+RsoKuIZjawFfua8+b8pZVtVt5UG@lists.infradead.org
X-Gm-Message-State: AOJu0YxonFr8fdcWZzmnXXVXsD1ME0OsGdz2wydlJiAjVYD9Cs0LQysY
	tcan0pjAWpCfrjzAkj2MfA3IC5Gm2i+ZFlDUOV7hsrr+RMs9JQ/G
X-Gm-Gg: ASbGnct9RTc1bBb/HdPTzkJWjyz9dc1rqLvwlxCALn9i/4pf/1SDei89vfdR6rGzi/v
	L0/6OGhcKDD/rRqwm2WeYhqs0ITUmMxR45BPXcdtj2FeUipiTmwEh0R3wGrMDV7MM6JlZUv+JhY
	MV7VsNl5QNca5FSeXcqvAPRkpvISKkmqzuYWon+FxMvAVuBfityq0fBRkLf0rSI9jPollpU0c0V
	NykZ5fjaBfttFzKl2/imiigD91BY7XPqxUEqVo/qlaQHSdzbI5ioZFz+NzaXeT0Y/5FdIMVj2gz
	qdJbQc8nmdPVKpYOZoF4bnjB/aSzsK/tr8hvriGkLdopiPbfko6Pw6SZvHuZOpNIFvc=
X-Google-Smtp-Source: AGHT+IGGYoucYTPiZvi9obRT6/pb2zsR/EsexoK2OOZKBRfsRgBHInK++vwyne9vU9LtGD0j5Deg3g==
X-Received: by 2002:a05:600c:1c08:b0:439:98fd:a4b6 with SMTP id 5b1f17b1804b1-43999b70c96mr10501245e9.15.1739908536452;
        Tue, 18 Feb 2025 11:55:36 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25a0fe5esm16019373f8f.99.2025.02.18.11.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:55:36 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/15] clk: sunxi-ng: a523: remaining mod clocks
Date: Tue, 18 Feb 2025 20:55:34 +0100
Message-ID: <47026132.fMDQidcC6G@jernej-laptop>
In-Reply-To: <20250214125359.5204-12-andre.przywara@arm.com>
References: <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-12-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_115538_337926_A6A27681 
X-CRM114-Status: GOOD (  19.67  )
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

Dne petek, 14. februar 2025 ob 13:53:55 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Add the remaining mod clocks, driving various parts of the SoC: the "LEDC"
> LED controller, the "CSI" camera interface, the "ISP" image processor,
> the DSP clock, and the "fanout" clocks, which allow to put clock signals
> on external pins.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 190 +++++++++++++++++++++++++
>  1 file changed, 190 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 59cc31f89ae77..6a4340f1fd041 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -354,6 +354,7 @@ static SUNXI_CCU_M_DATA_WITH_MUX(apb0_clk, "apb0", ah=
b_apb0_parents, 0x520,
>  				 0, 5,		/* M */
>  				 24, 2,	/* mux */
>  				 0);
> +static const struct clk_hw *apb0_hws[] =3D { &apb0_clk.common.hw };
> =20
>  static const struct clk_parent_data apb1_parents[] =3D {
>  	{ .fw_name =3D "hosc" },
> @@ -832,6 +833,153 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(edp_clk, "edp",=
 edp_parents, 0xbb0,
>  				    BIT(31),	/* gate */
>  				    0);
> =20
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ledc_clk, "ledc", ir_tx_ledc_paren=
ts,
> +				      0xbf0,
> +				      0, 4,	/* M */
> +				      24, 1,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +
> +static const struct clk_hw *csi_top_parents[] =3D {
> +	&pll_periph0_300M_clk.hw,
> +	&pll_periph0_400M_clk.hw,
> +	&pll_periph0_480M_clk.common.hw,
> +	&pll_video3_4x_clk.common.hw,
> +	&pll_video3_3x_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(csi_top_clk, "csi-top", csi_top_pare=
nts,
> +				    0xc04,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static const struct clk_parent_data csi_mclk_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .hw =3D &pll_video3_4x_clk.common.hw },
> +	{ .hw =3D &pll_video0_4x_clk.common.hw },
> +	{ .hw =3D &pll_video1_4x_clk.common.hw },
> +	{ .hw =3D &pll_video2_4x_clk.common.hw },
> +};
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(csi_mclk0_clk, "csi-mclk0",
> +				       csi_mclk_parents, 0xc08,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);

Missing dual div flag for csi-mclk clocks.

> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(csi_mclk1_clk, "csi-mclk1",
> +				       csi_mclk_parents, 0xc0c,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(csi_mclk2_clk, "csi-mclk2",
> +				       csi_mclk_parents, 0xc10,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(csi_mclk3_clk, "csi-mclk3",
> +				       csi_mclk_parents, 0xc14,
> +				       0, 5,	/* M */
> +				       8, 5,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static const struct clk_hw *isp_parents[] =3D {
> +	&pll_periph0_300M_clk.hw,
> +	&pll_periph0_400M_clk.hw,
> +	&pll_video2_4x_clk.common.hw,
> +	&pll_video3_4x_clk.common.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(isp_clk, "isp", isp_parents, 0xc20,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static const struct clk_parent_data dsp_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .fw_name =3D "losc" },
> +	{ .fw_name =3D "iosc" },
> +	{ .hw =3D &pll_periph0_2x_clk.common.hw },
> +	{ .hw =3D &pll_periph0_400M_clk.hw, },

Last one should be pll_periph0_480M_clk.

> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(dsp_clk, "dsp", dsp_parents, 0xc70,
> +				      0, 5,	/* M */
> +				      24, 3,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +
> +static SUNXI_CCU_GATE_DATA(fanout_24M_clk, "fanout-24M", osc24M,
> +			   0xf30, BIT(0), 0);
> +static SUNXI_CCU_GATE_DATA_WITH_PREDIV(fanout_12M_clk, "fanout-12M", osc=
24M,
> +				       0xf30, BIT(1), 2, 0);
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_16M_clk, "fanout-16M",
> +				      pll_periph0_480M_hws,
> +				      0xf30, BIT(2), 30, 0);
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_25M_clk, "fanout-25M",
> +				      pll_periph0_2x_hws,
> +				      0xf30, BIT(3), 48, 0);
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_50M_clk, "fanout-50M",
> +				      pll_periph0_2x_hws,
> +				      0xf30, BIT(4), 24, 0);
> +
> +/* These clocks have a second divider that is not modelled and forced to=
 0. */

Any specific reason for that?

Best regards,
Jernej

> +#define SUN55I_A523_FANOUT_27M_REG	0xf34
> +static const struct clk_hw *fanout_27M_parents[] =3D {
> +	&pll_video0_4x_clk.common.hw,
> +	&pll_video1_4x_clk.common.hw,
> +	&pll_video2_4x_clk.common.hw,
> +	&pll_video3_4x_clk.common.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(fanout_27M_clk, "fanout-27M",
> +				    fanout_27M_parents, 0xf34,
> +				    0, 5,	/* M */
> +				    24, 2,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +#define SUN55I_A523_FANOUT_PCLK_REG	0xf38
> +static SUNXI_CCU_M_HWS_WITH_GATE(fanout_pclk_clk, "fanout-pclk", apb0_hw=
s,
> +				 0xf38,
> +				 0, 5,		/* M */
> +				 BIT(31),	/* gate */
> +				 0);
> +
> +static const struct clk_parent_data fanout_parents[] =3D {
> +	{ .fw_name =3D "osc32k-out" },
> +	{ .hw =3D &fanout_12M_clk.common.hw, },
> +	{ .hw =3D &fanout_16M_clk.common.hw, },
> +	{ .hw =3D &fanout_24M_clk.common.hw, },
> +	{ .hw =3D &fanout_25M_clk.common.hw, },
> +	{ .hw =3D &fanout_27M_clk.common.hw, },
> +	{ .hw =3D &fanout_pclk_clk.common.hw, },
> +	{ .hw =3D &fanout_50M_clk.common.hw, },
> +};
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout0_clk, "fanout0", fanout_paren=
ts,
> +				    0xf3c,
> +				    0, 3,	/* mux */
> +				    BIT(21),	/* gate */
> +				    0);
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout1_clk, "fanout1", fanout_paren=
ts,
> +				    0xf3c,
> +				    3, 3,	/* mux */
> +				    BIT(22),	/* gate */
> +				    0);
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout2_clk, "fanout2", fanout_paren=
ts,
> +				    0xf3c,
> +				    6, 3,	/* mux */
> +				    BIT(23),	/* gate */
> +				    0);
> +
>  /*
>   * Contains all clocks that are controlled by a hardware register. They
>   * have a (sunxi) .common member, which needs to be initialised by the c=
ommon
> @@ -904,6 +1052,23 @@ static struct ccu_common *sun55i_a523_ccu_clks[] =
=3D {
>  	&tcon_tv0_clk.common,
>  	&tcon_tv1_clk.common,
>  	&edp_clk.common,
> +	&ledc_clk.common,
> +	&csi_top_clk.common,
> +	&csi_mclk0_clk.common,
> +	&csi_mclk1_clk.common,
> +	&csi_mclk2_clk.common,
> +	&csi_mclk3_clk.common,
> +	&isp_clk.common,
> +	&dsp_clk.common,
> +	&fanout_24M_clk.common,
> +	&fanout_12M_clk.common,
> +	&fanout_16M_clk.common,
> +	&fanout_25M_clk.common,
> +	&fanout_27M_clk.common,
> +	&fanout_pclk_clk.common,
> +	&fanout0_clk.common,
> +	&fanout1_clk.common,
> +	&fanout2_clk.common,
>  };
> =20
>  static struct clk_hw_onecell_data sun55i_a523_hw_clks =3D {
> @@ -997,6 +1162,23 @@ static struct clk_hw_onecell_data sun55i_a523_hw_cl=
ks =3D {
>  		[CLK_TCON_TV0]		=3D &tcon_tv0_clk.common.hw,
>  		[CLK_TCON_TV1]		=3D &tcon_tv1_clk.common.hw,
>  		[CLK_EDP]		=3D &edp_clk.common.hw,
> +		[CLK_LEDC]		=3D &ledc_clk.common.hw,
> +		[CLK_CSI_TOP]		=3D &csi_top_clk.common.hw,
> +		[CLK_CSI_MCLK0]		=3D &csi_mclk0_clk.common.hw,
> +		[CLK_CSI_MCLK1]		=3D &csi_mclk1_clk.common.hw,
> +		[CLK_CSI_MCLK2]		=3D &csi_mclk2_clk.common.hw,
> +		[CLK_CSI_MCLK3]		=3D &csi_mclk3_clk.common.hw,
> +		[CLK_ISP]		=3D &isp_clk.common.hw,
> +		[CLK_DSP]		=3D &dsp_clk.common.hw,
> +		[CLK_FANOUT_24M]	=3D &fanout_24M_clk.common.hw,
> +		[CLK_FANOUT_12M]	=3D &fanout_12M_clk.common.hw,
> +		[CLK_FANOUT_16M]	=3D &fanout_16M_clk.common.hw,
> +		[CLK_FANOUT_25M]	=3D &fanout_25M_clk.common.hw,
> +		[CLK_FANOUT_27M]	=3D &fanout_27M_clk.common.hw,
> +		[CLK_FANOUT_PCLK]	=3D &fanout_pclk_clk.common.hw,
> +		[CLK_FANOUT0]		=3D &fanout0_clk.common.hw,
> +		[CLK_FANOUT1]		=3D &fanout1_clk.common.hw,
> +		[CLK_FANOUT2]		=3D &fanout2_clk.common.hw,
>  	},
>  };
> =20
> @@ -1048,6 +1230,14 @@ static int sun55i_a523_ccu_probe(struct platform_d=
evice *pdev)
>  	val &=3D ~(BIT(1) | BIT(0));
>  	writel(val, reg + SUN55I_A523_PLL_AUDIO0_REG);
> =20
> +	/* Force fanout factors N to 0. */
> +	val =3D readl(reg + SUN55I_A523_FANOUT_27M_REG);
> +	val &=3D ~GENMASK(12, 8);
> +	writel(val, reg + SUN55I_A523_FANOUT_27M_REG);
> +	val =3D readl(reg + SUN55I_A523_FANOUT_PCLK_REG);
> +	val &=3D ~GENMASK(9, 5);
> +	writel(val, reg + SUN55I_A523_FANOUT_PCLK_REG);
> +
>  	ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun55i_a523_ccu_desc);
>  	if (ret)
>  		return ret;
>=20





