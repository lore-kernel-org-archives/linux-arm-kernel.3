Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90511D31A32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9weBqObxH8DPoWd4EEXh1inSDulmXc6nULjQD6fasTg=; b=UBFxLzXyP5bPSrsc1A4jEHBmSU
	2Sg6mP1VeCuz9vhXqM58agUatr8Twe8pv0ivA7HvqmYlm+ZTx1551WCDrPnRDKwmpynt0PsDCJqoZ
	1UPaYAzrob84aNygKIyoi2LZmKttN1pESClyOErXCZ1khJOIPh066l3o+6Bi9/GBNtbO+s1Z7hK+B
	Jz++TmWr0Yu5kx20hcm/mN6TyGWXGle9aI6Y+HPd5mp8k8jNSw3+4ksJuNtS790jCGjQTmniAD6Jp
	m8uET2lXTJjf/rFUXMDwPqiygutNUKEzjAPJnwvJZ+s1Hf0K29wzKnEDpi1yt96V8RB56t9vD5W9I
	Spp8tiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx8j-00000008XPv-0avU;
	Wed, 14 Jan 2026 09:26:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx8f-00000008XNs-1rGx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 09:26:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47ee0291921so9338775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768382761; x=1768987561; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9weBqObxH8DPoWd4EEXh1inSDulmXc6nULjQD6fasTg=;
        b=y2U8tyYh7NLjMB6mgQ+a5gjUGoAAuW7cEGrD7odSnIzXeDHzJExqWyCbvuQtTf5EhU
         e4oNy0CSBtnHWdb25lusBB+t6gvXIrxcN+Nlen9fTXWMNNP3Lt7k3YzMmgUC4LwtlZ6B
         zDsk7rt55R096fVBeavKe4RBpTAyKoJTpB+kbtqWSfvx2WUo5ov/+sSHO+syOWTnq5gR
         RrlT9KM1l6ZR5mIl0omao1IGLMBD+HNvwuQYtLtHDYRSB4+hSsCBK7iC1qsy4PYlkm61
         c3EyjfeO8wAxxupBfzXyOgnECRceeYHwR6H6mt1EFjWU4jgvG9WphBDnDvtTYFrrDiS1
         wKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382761; x=1768987561;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9weBqObxH8DPoWd4EEXh1inSDulmXc6nULjQD6fasTg=;
        b=KpiBeEDdMpb+Mfh8V9Jv3T9fs4xbgiWLj+5sgQ2NMr3/xpBHAPAoeeD8PqzSfvkgVE
         n6GOK5Rb6xNnW0O5feWYP+2LubB2vSdN0i3FpGnfe4OLli5Vee/VYA9GMiuSPOwcKz52
         WmWjj361X4Sr6I3nZWZJoi2v2Ai73rpT8X+lEoTJ/HgeeWs50NmgEGL02Jq4OclULWdO
         lpfIRFidXaLVRSpLI4mQt4QH/4LUbFWn5OMprw3v5RZFlptmpoQzEV9zrYdV3QOWZLQq
         EAVdsW3aACUXAgFoZngyS1uQxUwLdktIdNyiUP5qg5K6vh2XrajMQNAYXCudFi+gN27s
         3LUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF7rZS+qVn1kzC1+ivWpW6j2rFf8FRoPOdsWbPpfk2hEwQUTKwa0MH8RiNKbdDvIcDHeWQ4P61zFAZBFkUS4/G@lists.infradead.org
X-Gm-Message-State: AOJu0YzmLnN04vyNYX+DSO16esYJ18P+pWqpqKJRDsCiXhKS/LJPqBMj
	0PYVY6mosroP9F7G/pXi/kHfUknWafwtb+dh0vCQMnqn7veEermUsMFSg+0XeiEKDpo=
X-Gm-Gg: AY/fxX7ppOqLtTzHLsxieGlYD+820VOlMdQTTAMshznyt4p6BQNQ++bSTTeW3FmE6K7
	l6h1MogGTIo5qzx4EL2I/szOYZvzJSi0CxO8AZoW5d4bdhCZgz06mVkyE62NaDJMZgv7roShhGF
	bw3EIk6/xxDJD+4DEdBsl9LiYIVGuV/3RodCAwopTBUzHKJu/6X5ogXRVdyaeKxbockOoO791tE
	4/6D7EdW2FSjBDR9218gl+v0zmhjwL4HkOt40unWDP7Qg2r5tx8Mz7/AbKKKdPBh3GCOl9F7Qh5
	SBRwIa6k27n1KvSVj3Ytql0VoxARwQUlWXDOzze3N18AA2RPcKSwKAoRc/8LtIyPIJ0xiD4FgWQ
	ee6N1y6j3AFOxJCIm8RiiKMTc1WB04keNbe4S10Zf6Tm+yoR1tlcnD23HhJznvlW3jcRxGGaA26
	/ZBmhuscdCZo9TCdkWHSZn
X-Received: by 2002:a05:600c:3555:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-47ee33a1b80mr22290985e9.27.1768382761437;
        Wed, 14 Jan 2026 01:26:01 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:db84:c9f1:21bc:dca1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee573e2eesm18698295e9.15.2026.01.14.01.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:26:00 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Chuan Liu <chuan.liu@amlogic.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Xianwei Zhao <xianwei.zhao@amlogic.com>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/8] clk: amlogic: Add A5 clock peripherals
 controller driver
In-Reply-To: <20260108-a5-clk-v5-5-9a69fc1ef00a@amlogic.com> (Chuan Liu via's
	message of "Thu, 08 Jan 2026 14:08:19 +0800")
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
	<20260108-a5-clk-v5-5-9a69fc1ef00a@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 14 Jan 2026 10:25:59 +0100
Message-ID: <1jecnsr1eg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012606_315414_DB4074F3 
X-CRM114-Status: GOOD (  12.97  )
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

On jeu. 08 janv. 2026 at 14:08, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> +static struct clk_regmap a5_rtc_clk = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = RTC_CTRL,
> +		.mask = 0x3,
> +		.shift = 0,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "rtc_clk",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = a5_rtc_clk_parents,
> +		.num_parents = ARRAY_SIZE(a5_rtc_clk_parents),
> +		.flags = CLK_SET_RATE_NO_REPARENT,
> +	},
> +};
> +
> +#define A5_PCLK(_name, _reg, _bit, _pdata, _flags)			\
> +struct clk_regmap a5_##_name = {					\
> +	.data = &(struct clk_regmap_gate_data) {			\
> +		.offset = (_reg),					\
> +		.bit_idx = (_bit),					\
> +	},								\
> +	.hw.init = &(struct clk_init_data) {				\
> +		.name = #_name,						\
> +		.ops = &clk_regmap_gate_ops,				\
> +		.parent_data = (_pdata),				\
> +		.num_parents = 1,					\
> +		.flags = (_flags),					\
> +	},								\
> +}

I wonder why I bothered reviewing v4 ... 

> +
> +static const struct clk_parent_data a5_sys_pclk_parents = { .fw_name = "sysclk" };
> +
> +#define A5_SYS_PCLK(_name, _reg, _bit, _flags) \
> +	A5_PCLK(_name, _reg, _bit, &a5_sys_pclk_parents, _flags)
> +
> +static A5_SYS_PCLK(sys_reset_ctrl,	SYS_CLK_EN0_REG0, 1, 0);
> +static A5_SYS_PCLK(sys_pwr_ctrl,	SYS_CLK_EN0_REG0, 3, 0);
> +static A5_SYS_PCLK(sys_pad_ctrl,	SYS_CLK_EN0_REG0, 4, 0);
> +static A5_SYS_PCLK(sys_ctrl,		SYS_CLK_EN0_REG0, 5, 0);
> +static A5_SYS_PCLK(sys_ts_pll,		SYS_CLK_EN0_REG0, 6, 0);
> +
>

[...]

> +
> +static struct clk_regmap a5_gen = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = GEN_CLK_CTRL,
> +		.bit_idx = 11,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gen",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a5_gen_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +#define A5_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
> +	MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
> +
> +#define A5_COMP_DIV(_name, _reg, _shift, _width) \
> +	MESON_COMP_DIV(a5_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
> +
> +#define A5_COMP_GATE(_name, _reg, _bit, _iflags) \
> +	MESON_COMP_GATE(a5_, _name, _reg, _bit, CLK_SET_RATE_PARENT | (_iflags))
> +

At the top. like C3 and T7

> +static const struct clk_parent_data a5_saradc_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .fw_name = "sysclk" }
> +};
> +
> +static A5_COMP_SEL(saradc, SAR_CLK_CTRL0, 9, 0x3, a5_saradc_parents, NULL);
> +static A5_COMP_DIV(saradc, SAR_CLK_CTRL0, 0, 8);
> +static A5_COMP_GATE(saradc, SAR_CLK_CTRL0, 8, 0);
> +
> +static const struct clk_parent_data a5_pwm_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .hw = &a5_rtc_clk.hw },
> +	{ .fw_name = "fdiv4" },
> +	{ .fw_name = "fdiv3" }
> +};
> +
> +static A5_COMP_SEL(pwm_a, PWM_CLK_AB_CTRL, 9, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_a, PWM_CLK_AB_CTRL, 0, 8);
> +static A5_COMP_GATE(pwm_a, PWM_CLK_AB_CTRL, 8, 0);
> +
> +static A5_COMP_SEL(pwm_b, PWM_CLK_AB_CTRL, 25, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_b, PWM_CLK_AB_CTRL, 16, 8);
> +static A5_COMP_GATE(pwm_b, PWM_CLK_AB_CTRL, 24, 0);
> +
> +static A5_COMP_SEL(pwm_c, PWM_CLK_CD_CTRL, 9, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_c, PWM_CLK_CD_CTRL, 0, 8);
> +static A5_COMP_GATE(pwm_c, PWM_CLK_CD_CTRL, 8, 0);
> +
> +static A5_COMP_SEL(pwm_d, PWM_CLK_CD_CTRL, 25, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_d, PWM_CLK_CD_CTRL, 16, 8);
> +static A5_COMP_GATE(pwm_d, PWM_CLK_CD_CTRL, 24, 0);
> +
> +static A5_COMP_SEL(pwm_e, PWM_CLK_EF_CTRL, 9, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_e, PWM_CLK_EF_CTRL, 0, 8);
> +static A5_COMP_GATE(pwm_e, PWM_CLK_EF_CTRL, 8, 0);
> +
> +static A5_COMP_SEL(pwm_f, PWM_CLK_EF_CTRL, 25, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_f, PWM_CLK_EF_CTRL, 16, 8);
> +static A5_COMP_GATE(pwm_f, PWM_CLK_EF_CTRL, 24, 0);
> +
> +static A5_COMP_SEL(pwm_g, PWM_CLK_GH_CTRL, 9, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_g, PWM_CLK_GH_CTRL, 0, 8);
> +static A5_COMP_GATE(pwm_g, PWM_CLK_GH_CTRL, 8, 0);
> +
> +static A5_COMP_SEL(pwm_h, PWM_CLK_GH_CTRL, 25, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_h, PWM_CLK_GH_CTRL, 16, 8);
> +static A5_COMP_GATE(pwm_h, PWM_CLK_GH_CTRL, 24, 0);
> +
> +/*
> + * NOTE: Channel 7 is gp1, because gp1 is designed for DSU, so spicc does not
> + * support this source in the driver.
> + */
> +static const struct clk_parent_data a5_spicc_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .fw_name = "sysclk" },
> +	{ .fw_name = "fdiv4" },
> +	{ .fw_name = "fdiv3" },
> +	{ .fw_name = "fdiv2" },
> +	{ .fw_name = "fdiv5" },
> +	{ .fw_name = "fdiv7" }
> +};
> +
> +static A5_COMP_SEL(spicc_0, SPICC_CLK_CTRL, 7, 0x7, a5_spicc_parents, NULL);
> +static A5_COMP_DIV(spicc_0, SPICC_CLK_CTRL, 0, 6);
> +static A5_COMP_GATE(spicc_0, SPICC_CLK_CTRL, 6, 0);
> +
> +static A5_COMP_SEL(spicc_1, SPICC_CLK_CTRL, 23, 0x7, a5_spicc_parents, NULL);
> +static A5_COMP_DIV(spicc_1, SPICC_CLK_CTRL, 16, 6);
> +static A5_COMP_GATE(spicc_1, SPICC_CLK_CTRL, 22, 0);
> +
> +static const struct clk_parent_data a5_sd_emmc_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .fw_name = "fdiv2" },
> +	{ .fw_name = "fdiv3" },
> +	{ .fw_name = "hifi" },
> +	{ .fw_name = "fdiv2p5" },
> +	{ .fw_name = "mpll2" },
> +	{ .fw_name = "mpll3" },
> +	{ .fw_name = "gp0" }
> +};
> +
> +static A5_COMP_SEL(sd_emmc_a, SD_EMMC_CLK_CTRL, 9, 0x7, a5_sd_emmc_parents,
> +		   NULL);
> +static A5_COMP_DIV(sd_emmc_a, SD_EMMC_CLK_CTRL, 0, 7);
> +static A5_COMP_GATE(sd_emmc_a, SD_EMMC_CLK_CTRL, 7, 0);
> +
> +static A5_COMP_SEL(sd_emmc_c, NAND_CLK_CTRL, 9, 0x7, a5_sd_emmc_parents,
> +		   NULL);
> +static A5_COMP_DIV(sd_emmc_c, NAND_CLK_CTRL, 0, 7);
> +static A5_COMP_GATE(sd_emmc_c, NAND_CLK_CTRL, 7, 0);
> +
> +static struct clk_regmap a5_ts_div = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = TS_CLK_CTRL,
> +		.shift = 0,
> +		.width = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ts_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "oscin",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a5_ts = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = TS_CLK_CTRL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ts",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a5_ts_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_fixed_factor a5_eth_125m_div = {
> +	.mult = 1,
> +	.div = 8,
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "eth_125m_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "fdiv2",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a5_eth_125m = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = ETH_CLK_CTRL,
> +		.bit_idx = 7,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "eth_125m",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a5_eth_125m_div.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a5_eth_rmii_div = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = ETH_CLK_CTRL,
> +		.shift = 0,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "eth_rmii_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "fdiv2",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a5_eth_rmii = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = ETH_CLK_CTRL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "eth_rmii",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a5_eth_rmii_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +/* Channel 6 is gp1 dedicated to the DSU. */
> +static u32 a5_dspa_parents_val_table[] = { 0, 1, 2, 3, 4, 5, 7};
> +
> +static const struct clk_parent_data a5_dspa_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .fw_name = "fdiv2p5" },
> +	{ .fw_name = "fdiv3" },
> +	{ .fw_name = "rtc" },  /* rtc_pll */
> +	{ .fw_name = "hifi" },
> +	{ .fw_name = "fdiv4" },
> +	{ .hw = &a5_rtc_clk.hw }
> +};
> +
> +static A5_COMP_SEL(dspa_0, DSPA_CLK_CTRL0, 10, 0x7, a5_dspa_parents,
> +		   a5_dspa_parents_val_table);
> +static A5_COMP_DIV(dspa_0, DSPA_CLK_CTRL0, 0, 10);
> +static A5_COMP_GATE(dspa_0, DSPA_CLK_CTRL0, 13, 0);
> +
> +static A5_COMP_SEL(dspa_1, DSPA_CLK_CTRL0, 26, 0x7, a5_dspa_parents,
> +		   a5_dspa_parents_val_table);
> +static A5_COMP_DIV(dspa_1, DSPA_CLK_CTRL0, 16, 10);
> +static A5_COMP_GATE(dspa_1, DSPA_CLK_CTRL0, 29, 0);
> +
> +static struct clk_regmap a5_dspa = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = DSPA_CLK_CTRL0,
> +		.mask = 0x1,
> +		.shift = 15,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "dspa",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a5_dspa_0.hw,
> +			&a5_dspa_1.hw
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +/* Channel 6 is gp1 dedicated to the DSU. */
> +static u32 a5_nna_parents_val_table[] = { 0, 1, 2, 3, 4, 5, 7};
> +
> +static const struct clk_parent_data a5_nna_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .fw_name = "fdiv2p5" },
> +	{ .fw_name = "fdiv4" },
> +	{ .fw_name = "fdiv3" },
> +	{ .fw_name = "fdiv5" },
> +	{ .fw_name = "fdiv2" },
> +	{ .fw_name = "hifi" }
> +};
> +
> +static A5_COMP_SEL(nna_core, NNA_CLK_CNTL, 9, 0x7, a5_nna_parents,
> +		   a5_nna_parents_val_table);
> +static A5_COMP_DIV(nna_core, NNA_CLK_CNTL, 0, 7);
> +static A5_COMP_GATE(nna_core, NNA_CLK_CNTL, 8, 0);
> +
> +static A5_COMP_SEL(nna_axi, NNA_CLK_CNTL, 25, 0x7, a5_nna_parents,
> +		   a5_nna_parents_val_table);
> +static A5_COMP_DIV(nna_axi, NNA_CLK_CNTL, 16, 7);
> +static A5_COMP_GATE(nna_axi, NNA_CLK_CNTL, 24, 0);
> +
> +static struct clk_hw *a5_peripherals_hw_clks[] = {
> +	[CLKID_RTC_DUALDIV_CLKIN]	= &a5_rtc_dualdiv_clkin.hw,
> +	[CLKID_RTC_DUALDIV]		= &a5_rtc_dualdiv.hw,
> +	[CLKID_RTC_DUALDIV_SEL]		= &a5_rtc_dualdiv_sel.hw,
> +	[CLKID_RTC_DUALDIV_CLKOUT]	= &a5_rtc_dualdiv_clkout.hw,
> +	[CLKID_RTC_CLK]			= &a5_rtc_clk.hw,
> +	[CLKID_SYS_RESET_CTRL]		= &a5_sys_reset_ctrl.hw,
> +	[CLKID_SYS_PWR_CTRL]		= &a5_sys_pwr_ctrl.hw,
> +	[CLKID_SYS_PAD_CTRL]		= &a5_sys_pad_ctrl.hw,
> +	[CLKID_SYS_CTRL]		= &a5_sys_ctrl.hw,
> +	[CLKID_SYS_TS_PLL]		= &a5_sys_ts_pll.hw,
> +	[CLKID_SYS_DEV_ARB]		= &a5_sys_dev_arb.hw,
> +	[CLKID_SYS_MAILBOX]		= &a5_sys_mailbox.hw,
> +	[CLKID_SYS_JTAG_CTRL]		= &a5_sys_jtag_ctrl.hw,
> +	[CLKID_SYS_IR_CTRL]		= &a5_sys_ir_ctrl.hw,
> +	[CLKID_SYS_MSR_CLK]		= &a5_sys_msr_clk.hw,
> +	[CLKID_SYS_ROM]			= &a5_sys_rom.hw,
> +	[CLKID_SYS_CPU_ARB]		= &a5_sys_cpu_apb.hw,
> +	[CLKID_SYS_RSA]			= &a5_sys_rsa.hw,
> +	[CLKID_SYS_SARADC]		= &a5_sys_saradc.hw,
> +	[CLKID_SYS_STARTUP]		= &a5_sys_startup.hw,
> +	[CLKID_SYS_SECURE]		= &a5_sys_secure.hw,
> +	[CLKID_SYS_SPIFC]		= &a5_sys_spifc.hw,
> +	[CLKID_SYS_DSPA]		= &a5_sys_dspa.hw,
> +	[CLKID_SYS_NNA]			= &a5_sys_nna.hw,
> +	[CLKID_SYS_ETH_MAC]		= &a5_sys_eth_mac.hw,
> +	[CLKID_SYS_RAMA]		= &a5_sys_rama.hw,
> +	[CLKID_SYS_RAMB]		= &a5_sys_ramb.hw,
> +	[CLKID_SYS_AUDIO_TOP]		= &a5_sys_audio_top.hw,
> +	[CLKID_SYS_AUDIO_VAD]		= &a5_sys_audio_vad.hw,
> +	[CLKID_SYS_USB]			= &a5_sys_usb.hw,
> +	[CLKID_SYS_SD_EMMC_A]		= &a5_sys_sd_emmc_a.hw,
> +	[CLKID_SYS_SD_EMMC_C]		= &a5_sys_sd_emmc_c.hw,
> +	[CLKID_SYS_PWM_AB]		= &a5_sys_pwm_ab.hw,
> +	[CLKID_SYS_PWM_CD]		= &a5_sys_pwm_cd.hw,
> +	[CLKID_SYS_PWM_EF]		= &a5_sys_pwm_ef.hw,
> +	[CLKID_SYS_PWM_GH]		= &a5_sys_pwm_gh.hw,
> +	[CLKID_SYS_SPICC_1]		= &a5_sys_spicc_1.hw,
> +	[CLKID_SYS_SPICC_0]		= &a5_sys_spicc_0.hw,
> +	[CLKID_SYS_UART_A]		= &a5_sys_uart_a.hw,
> +	[CLKID_SYS_UART_B]		= &a5_sys_uart_b.hw,
> +	[CLKID_SYS_UART_C]		= &a5_sys_uart_c.hw,
> +	[CLKID_SYS_UART_D]		= &a5_sys_uart_d.hw,
> +	[CLKID_SYS_UART_E]		= &a5_sys_uart_e.hw,
> +	[CLKID_SYS_I2C_M_A]		= &a5_sys_i2c_m_a.hw,
> +	[CLKID_SYS_I2C_M_B]		= &a5_sys_i2c_m_b.hw,
> +	[CLKID_SYS_I2C_M_C]		= &a5_sys_i2c_m_c.hw,
> +	[CLKID_SYS_I2C_M_D]		= &a5_sys_i2c_m_d.hw,
> +	[CLKID_SYS_RTC]			= &a5_sys_rtc.hw,
> +	[CLKID_AXI_AUDIO_VAD]		= &a5_axi_audio_vad.hw,
> +	[CLKID_AXI_AUDIO_TOP]		= &a5_axi_audio_top.hw,
> +	[CLKID_AXI_RAMB]		= &a5_axi_ramb.hw,
> +	[CLKID_AXI_RAMA]		= &a5_axi_rama.hw,
> +	[CLKID_AXI_NNA]			= &a5_axi_nna.hw,
> +	[CLKID_AXI_DEV1_DMC]		= &a5_axi_dev1_dmc.hw,
> +	[CLKID_AXI_DEV0_DMC]		= &a5_axi_dev0_dmc.hw,
> +	[CLKID_AXI_DSP_DMC]		= &a5_axi_dsp_dmc.hw,
> +	[CLKID_12_24M_IN]		= &a5_clk_12_24m_in.hw,
> +	[CLKID_12M_24M]			= &a5_clk_12_24m.hw,
> +	[CLKID_FCLK_25M_DIV]		= &a5_fclk_25m_div.hw,
> +	[CLKID_FCLK_25M]		= &a5_fclk_25m.hw,
> +	[CLKID_GEN_SEL]			= &a5_gen_sel.hw,
> +	[CLKID_GEN_DIV]			= &a5_gen_div.hw,
> +	[CLKID_GEN]			= &a5_gen.hw,
> +	[CLKID_SARADC_SEL]		= &a5_saradc_sel.hw,
> +	[CLKID_SARADC_DIV]		= &a5_saradc_div.hw,
> +	[CLKID_SARADC]			= &a5_saradc.hw,
> +	[CLKID_PWM_A_SEL]		= &a5_pwm_a_sel.hw,
> +	[CLKID_PWM_A_DIV]		= &a5_pwm_a_div.hw,
> +	[CLKID_PWM_A]			= &a5_pwm_a.hw,
> +	[CLKID_PWM_B_SEL]		= &a5_pwm_b_sel.hw,
> +	[CLKID_PWM_B_DIV]		= &a5_pwm_b_div.hw,
> +	[CLKID_PWM_B]			= &a5_pwm_b.hw,
> +	[CLKID_PWM_C_SEL]		= &a5_pwm_c_sel.hw,
> +	[CLKID_PWM_C_DIV]		= &a5_pwm_c_div.hw,
> +	[CLKID_PWM_C]			= &a5_pwm_c.hw,
> +	[CLKID_PWM_D_SEL]		= &a5_pwm_d_sel.hw,
> +	[CLKID_PWM_D_DIV]		= &a5_pwm_d_div.hw,
> +	[CLKID_PWM_D]			= &a5_pwm_d.hw,
> +	[CLKID_PWM_E_SEL]		= &a5_pwm_e_sel.hw,
> +	[CLKID_PWM_E_DIV]		= &a5_pwm_e_div.hw,
> +	[CLKID_PWM_E]			= &a5_pwm_e.hw,
> +	[CLKID_PWM_F_SEL]		= &a5_pwm_f_sel.hw,
> +	[CLKID_PWM_F_DIV]		= &a5_pwm_f_div.hw,
> +	[CLKID_PWM_F]			= &a5_pwm_f.hw,
> +	[CLKID_PWM_G_SEL]		= &a5_pwm_g_sel.hw,
> +	[CLKID_PWM_G_DIV]		= &a5_pwm_g_div.hw,
> +	[CLKID_PWM_G]			= &a5_pwm_g.hw,
> +	[CLKID_PWM_H_SEL]		= &a5_pwm_h_sel.hw,
> +	[CLKID_PWM_H_DIV]		= &a5_pwm_h_div.hw,
> +	[CLKID_PWM_H]			= &a5_pwm_h.hw,
> +	[CLKID_SPICC_0_SEL]		= &a5_spicc_0_sel.hw,
> +	[CLKID_SPICC_0_DIV]		= &a5_spicc_0_div.hw,
> +	[CLKID_SPICC_0]			= &a5_spicc_0.hw,
> +	[CLKID_SPICC_1_SEL]		= &a5_spicc_1_sel.hw,
> +	[CLKID_SPICC_1_DIV]		= &a5_spicc_1_div.hw,
> +	[CLKID_SPICC_1]			= &a5_spicc_1.hw,
> +	[CLKID_SD_EMMC_A_SEL]		= &a5_sd_emmc_a_sel.hw,
> +	[CLKID_SD_EMMC_A_DIV]		= &a5_sd_emmc_a_div.hw,
> +	[CLKID_SD_EMMC_A]		= &a5_sd_emmc_a.hw,
> +	[CLKID_SD_EMMC_C_SEL]		= &a5_sd_emmc_c_sel.hw,
> +	[CLKID_SD_EMMC_C_DIV]		= &a5_sd_emmc_c_div.hw,
> +	[CLKID_SD_EMMC_C]		= &a5_sd_emmc_c.hw,
> +	[CLKID_TS_DIV]			= &a5_ts_div.hw,
> +	[CLKID_TS]			= &a5_ts.hw,
> +	[CLKID_ETH_125M_DIV]		= &a5_eth_125m_div.hw,
> +	[CLKID_ETH_125M]		= &a5_eth_125m.hw,
> +	[CLKID_ETH_RMII_DIV]		= &a5_eth_rmii_div.hw,
> +	[CLKID_ETH_RMII]		= &a5_eth_rmii.hw,
> +	[CLKID_DSPA_0_SEL]		= &a5_dspa_0_sel.hw,
> +	[CLKID_DSPA_0_DIV]		= &a5_dspa_0_div.hw,
> +	[CLKID_DSPA_0]			= &a5_dspa_0.hw,
> +	[CLKID_DSPA_1_SEL]		= &a5_dspa_1_sel.hw,
> +	[CLKID_DSPA_1_DIV]		= &a5_dspa_1_div.hw,
> +	[CLKID_DSPA_1]			= &a5_dspa_1.hw,
> +	[CLKID_DSPA]			= &a5_dspa.hw,
> +	[CLKID_NNA_CORE_SEL]		= &a5_nna_core_sel.hw,
> +	[CLKID_NNA_CORE_DIV]		= &a5_nna_core_div.hw,
> +	[CLKID_NNA_CORE]		= &a5_nna_core.hw,
> +	[CLKID_NNA_AXI_SEL]		= &a5_nna_axi_sel.hw,
> +	[CLKID_NNA_AXI_DIV]		= &a5_nna_axi_div.hw,
> +	[CLKID_NNA_AXI]			= &a5_nna_axi.hw,
> +};
> +
> +static const struct meson_clkc_data a5_peripherals_clkc_data = {
> +	.hw_clks = {
> +		.hws = a5_peripherals_hw_clks,
> +		.num = ARRAY_SIZE(a5_peripherals_hw_clks),
> +	},
> +};
> +
> +static const struct of_device_id a5_peripherals_clkc_match_table[] = {
> +	{
> +		.compatible = "amlogic,a5-peripherals-clkc",
> +		.data = &a5_peripherals_clkc_data,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, a5_peripherals_clkc_match_table);
> +
> +static struct platform_driver a5_peripherals_clkc_driver = {
> +	.probe = meson_clkc_mmio_probe,
> +	.driver = {
> +		.name = "a5-peripherals-clkc",
> +		.of_match_table = a5_peripherals_clkc_match_table,
> +	},
> +};
> +module_platform_driver(a5_peripherals_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic A5 Peripherals Clock Controller driver");
> +MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("CLK_MESON");

-- 
Jerome

