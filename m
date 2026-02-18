Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148B8E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 18:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljQ1E1/F1vX5ElaoR98ZDeHZ74Gy13PXjEW6i38QL6o=; b=Ktq1rhx+5E1Iye4yANZngpkrXb
	zL+1x/K+KibgGA8xdfp81mf2q5PuzRAQqcJXnoIwRbVu01n08cg97KbrP9KcNPXNmCkWab3rruZt3
	mVg3e//AneO7ylBmnryCfvoKfTo3H5AciaEFc2GlfSJGFwoe79d9wpgajr65BHkXVmvwxTOsHAIsy
	uHhma7lkGf9lsKW+Nm1HLl7qNzC/dgfiztm4V86iDGQmopmEhJ8Yw4qKmTi/BQQRfn0rvInUaLg5N
	WrUXGUjlJ6nY5+FVsXSHdaUj5c9ZkMwDsRv7ZSC273J+IPInBZGqnDc3oEiCK1V2/HtLrzm86lLlc
	2MZ9K99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmJe-0000000AFaQ-04wO;
	Wed, 18 Feb 2026 18:30:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmJZ-0000000AFYv-0alG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 18:30:22 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4362507f0bcso136557f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 10:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771439419; x=1772044219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljQ1E1/F1vX5ElaoR98ZDeHZ74Gy13PXjEW6i38QL6o=;
        b=rwsGQfNsxckNPxXed9bbDNvoeb5pn+v5+Q7r71jt0ORvY94FFRZlKc8vPESmG3/QxO
         v3+3SeYMX3bLeOxT2DuJfZP4kgcAHWL1on03TDcZY5QFxahtFjE7COnnWRLq16PtYPnG
         tAgqW/TWo95Zm1QZWBwRg7AaFEtS43rDGq9dBNKcqk4yQOHQ7uMi9AcmURPvxIP02+G1
         VVLPs7jKV8MoYt0yXeYy85KMvfxsVtV8ll0EPvhbWYV9h0EKu534K324v5ExLS+8Vu79
         fPTBRWGIpzKbESn8zYBlsPPRBIos1mwn0bJIyvLSAsqhBJPUOXSB0+AAuElZZ+xgb1Zp
         D4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771439419; x=1772044219;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljQ1E1/F1vX5ElaoR98ZDeHZ74Gy13PXjEW6i38QL6o=;
        b=S1Xg3ViPzzgZLD+HGs9XPzQnsmkBCBTSl9T27doXYGiVqk0doknZ8O0Og2C+GBv0JQ
         l0OQoyk9b6tVvC5O0TbI4PMecU+y6gRvFqqIx2wa/1ru3jjBVSr/HT/SzlNDAksKrdud
         KWtdVSRh1GLecUsJjHy8nymXqDWw8JWQMnj7Sl0s7m1I+U/rzMcyEgMBN8bPZf0sg7Oy
         1owFiX6LNcTqdx79pogShdlYErTCPNMIwm3C3pv3j8pMxVtzTptfLuoyIU6WBfKlXWz8
         Qz/HbMdgvm7SXimL2bNxshvmkR10ZrTQT1MoCFNqdDfpdkoOQchQ85ihAtW7ioGYc+Jl
         U0fg==
X-Forwarded-Encrypted: i=1; AJvYcCVFosZjtpCO26qRVepkPycyQlcUnU4mYMEHSYNo2jXYO82rNP7Z/FT4pKbJxEImuV+EyAFm+U0hcfHU/wf5EAWR@lists.infradead.org
X-Gm-Message-State: AOJu0YzUzcUnWdWqbZuNUvskSEu18RJsP7+mtE6gpbdvmzP4in5AwvJH
	S2zu2yumGc0KNsKLwFnpElmWGJztRpAMZMg3dG5Cn6Hlic59HymAInXvL5pxgQ6hQ00=
X-Gm-Gg: AZuq6aKozyDjnnUhaUBeRW/Sn3Sz0/Ak06LeQfv1CwV/4kHvzsKricrZ5bvPhWTFDcL
	myxVRoxvqM33YaazVmsKqaZzuEPihSVod1xhR/F55EO2CYQnbk3jGV9DzNL8LH539Ct4n/a31uo
	+Cq/FQrL8/gQJjkkVCpi9sYT8EfFE7X+IU2qiJA5WXEysA8XV8a21gnRORl19OC3goW8xJiNL3T
	qu1g8uUfxlZYNvdqWan/uXntyYtiwvKSuFWHEocsVPy9KHXZvukW8rj0f3Zvanifih7etp/Tz2N
	cj9o2KqFTdLvXf82vJV/suXg7K2Je8ogQLhYRqW7wJyKnHK2s/lmTZP1v/l6npiioI07gSTh8TY
	wL2XvAUTGFlSyYWUtQZ0kknfYBNAd7hq4QC4yLl1MKfM0FUJgt50Mob4wa4FVI++S1zN9uhOpQG
	H5vWnC+LA90WuSYHVFt2PXcg==
X-Received: by 2002:a05:6000:400d:b0:436:e875:7911 with SMTP id ffacd0b85a97d-43958be4a76mr5368651f8f.4.1771439419072;
        Wed, 18 Feb 2026 10:30:19 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43796a6b563sm43048552f8f.12.2026.02.18.10.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:30:18 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] drivers: clk: meson: Add Amlogic T7 sys pll support
In-Reply-To: <20260218110018.36348-1-linux-kernel-dev@aliel.fr> (Ronald
	Claveau's message of "Wed, 18 Feb 2026 12:00:15 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
	<20260218110018.36348-1-linux-kernel-dev@aliel.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 19:30:17 +0100
Message-ID: <1jjyw96h1i.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_103021_223413_B7EE4896 
X-CRM114-Status: GOOD (  15.26  )
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

On mer. 18 f=C3=A9vr. 2026 at 12:00, Ronald Claveau <linux-kernel-dev@aliel=
.fr> wrote:

> Add SYS PLL for the clock controller of the Amlogic T7 SoC family.

Like the FDIVs, I think this is provided by SCMI.

Check include/dt-bindings/clock/amlogic,t7-scmi.h

>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  drivers/clk/meson/t7-peripherals.c | 134 ++++++++++++++++++++++++++++-
>  1 file changed, 131 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-pe=
ripherals.c
> index 214db7850d86..de206473f3a7 100644
> --- a/drivers/clk/meson/t7-peripherals.c
> +++ b/drivers/clk/meson/t7-peripherals.c
> @@ -176,6 +176,127 @@ static struct clk_regmap t7_rtc =3D {
>  	},
>  };
>=20=20
> +static u32 t7_sys_parents_val_table[] =3D { 0, 1, 2, 3, 4, 5, 7 };
> +static const struct clk_parent_data t7_sys_parents[] =3D {
> +	{ .fw_name =3D "xtal", },
> +	{ .fw_name =3D "fdiv2", },
> +	{ .fw_name =3D "fdiv3", },
> +	{ .fw_name =3D "fdiv4", },
> +	{ .fw_name =3D "fdiv5", },
> +	{ .fw_name =3D "axi_clk_frcpu", },
> +	{ .hw =3D &t7_rtc.hw },
> +};
> +
> +static struct clk_regmap t7_sys_a_sel =3D {
> +	.data =3D &(struct clk_regmap_mux_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.mask =3D 0x7,
> +		.shift =3D 10,
> +		.table =3D t7_sys_parents_val_table,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_a_sel",
> +		.ops =3D &clk_regmap_mux_ops,
> +		.parent_data =3D t7_sys_parents,
> +		.num_parents =3D ARRAY_SIZE(t7_sys_parents),
> +	},
> +};
> +
> +static struct clk_regmap t7_sys_a_div =3D {
> +	.data =3D &(struct clk_regmap_div_data){
> +	.offset =3D SYS_CLK_CTRL0,
> +		.shift =3D 0,
> +		.width =3D 10,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_a_div",
> +		.ops =3D &clk_regmap_divider_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_sys_a_sel.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap t7_sys_a =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.bit_idx =3D 13,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_a",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_sys_a_div.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_sys_b_sel =3D {
> +	.data =3D &(struct clk_regmap_mux_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.mask =3D 0x7,
> +		.shift =3D 26,
> +		.table =3D t7_sys_parents_val_table,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_b_sel",
> +		.ops =3D &clk_regmap_mux_ops,
> +		.parent_data =3D t7_sys_parents,
> +		.num_parents =3D ARRAY_SIZE(t7_sys_parents),
> +	},
> +};
> +
> +static struct clk_regmap t7_sys_b_div =3D {
> +	.data =3D &(struct clk_regmap_div_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.shift =3D 16,
> +		.width =3D 10,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_b_div",
> +		.ops =3D &clk_regmap_divider_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_sys_b_sel.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_sys_b =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.bit_idx =3D 29,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_b",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_sys_b_div.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_sys =3D {
> +	.data =3D &(struct clk_regmap_mux_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.mask =3D 0x1,
> +		.shift =3D 15,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_clk",
> +		.ops =3D &clk_regmap_mux_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_sys_a.hw,
> +			&t7_sys_b.hw,
> +		},
> +		.num_parents =3D 2,
> +	},
> +};
> +
>  static struct clk_regmap t7_ceca_dualdiv_in =3D {
>  	.data =3D &(struct clk_regmap_gate_data){
>  		.offset =3D CECA_CTRL0,
> @@ -824,7 +945,7 @@ static T7_COMP_GATE(sd_emmc_c, NAND_CLK_CTRL, 7, 0);
>=20=20
>  static const struct clk_parent_data t7_spicc_parents[] =3D {
>  	{ .fw_name =3D "xtal", },
> -	{ .fw_name =3D "sys", },
> +	{ .hw =3D &t7_sys.hw },
>  	{ .fw_name =3D "fdiv4", },
>  	{ .fw_name =3D "fdiv3", },
>  	{ .fw_name =3D "fdiv2", },
> @@ -859,7 +980,7 @@ static T7_COMP_GATE(spicc5, SPICC_CLK_CTRL2, 22, 0);
>=20=20
>  static const struct clk_parent_data t7_saradc_parents[] =3D {
>  	{ .fw_name =3D "xtal" },
> -	{ .fw_name =3D "sys" },
> +	{ .hw =3D &t7_sys.hw },
>  };
>=20=20
>  static T7_COMP_SEL(saradc, SAR_CLK_CTRL0, 9, 0x1, t7_saradc_parents);
> @@ -929,7 +1050,7 @@ static T7_COMP_SEL(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 25,=
 0x3, t7_pwm_parents);
>  static T7_COMP_DIV(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 16, 8);
>  static T7_COMP_GATE(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 24, 0);
>=20=20
> -static const struct clk_parent_data t7_sys_pclk_parents =3D { .fw_name =
=3D "sys" };
> +static const struct clk_parent_data t7_sys_pclk_parents =3D { .hw =3D &t=
7_sys.hw };
>=20=20
>  #define T7_SYS_PCLK(_name, _reg, _bit, _flags) \
>  	MESON_PCLK(t7_##_name, _reg, _bit, &t7_sys_pclk_parents, _flags)
> @@ -1161,6 +1282,13 @@ static struct clk_hw *t7_peripherals_hw_clks[] =3D=
 {
>  	[CLKID_PWM_AO_H_SEL]		=3D &t7_pwm_ao_h_sel.hw,
>  	[CLKID_PWM_AO_H_DIV]		=3D &t7_pwm_ao_h_div.hw,
>  	[CLKID_PWM_AO_H]		=3D &t7_pwm_ao_h.hw,
> +	[CLKID_SYS_A_SEL]		=3D &t7_sys_a_sel.hw,
> +	[CLKID_SYS_A_DIV]		=3D &t7_sys_a_div.hw,
> +	[CLKID_SYS_A]			=3D &t7_sys_a.hw,
> +	[CLKID_SYS_B_SEL]		=3D &t7_sys_b_sel.hw,
> +	[CLKID_SYS_B_DIV]		=3D &t7_sys_b_div.hw,
> +	[CLKID_SYS_B]			=3D &t7_sys_b.hw,
> +	[CLKID_SYS]				=3D &t7_sys.hw,
>  	[CLKID_SYS_DDR]			=3D &t7_sys_ddr.hw,
>  	[CLKID_SYS_DOS]			=3D &t7_sys_dos.hw,
>  	[CLKID_SYS_MIPI_DSI_A]		=3D &t7_sys_mipi_dsi_a.hw,

--=20
Jerome

