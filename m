Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EAAE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 18:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXX5Ad6lE4eM3SpWZXXZtn5YXTRNU+kz7ZHFBHa7LgY=; b=dv8QfobJK2UrwnJfk8dPuRUnx0
	Ug++1ITwETJJ/echA95iR6b4Dr5MDdYaKqP+7j3ER33GCKy+fwEkZLkC2pXliNSoWlQWbLUo2t6/H
	pyWp2f732McTKr3FAYn9VtLcUSfZUc1mHIBQDb9M9AzCHPGUmrC61NkOmk4Y7l8hJipyQkVynHhPf
	Habk6HLoVxI4AKGZ7XeLKXyAyqjKiRx25N6jr48u/Io/ueIQmgc0tzAqCPW7xgsDPAQ1qUaBZf+pm
	/MxBe94Tk0Fw9S+ltdx1Q72Ixp872KIft+E496TJZ/E5PUGsCdYiGcfz1wdbSpm+r/heZO6JI4+WM
	uhJmV2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslvz-0000000ACr2-05pG;
	Wed, 18 Feb 2026 18:05:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslvu-0000000ACqA-11LK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 18:05:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4806bf39419so8524245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 10:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771437952; x=1772042752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXX5Ad6lE4eM3SpWZXXZtn5YXTRNU+kz7ZHFBHa7LgY=;
        b=NFHY2JmlEhXKIeb2xH5EIJY3mfVmMFs9XnUMALVUi/WbAGIiQVBTK+0ZutGTYvernB
         baP3qHFJT6Kb7uQxwz4/iHh6kdclLl0OpWX+HcSLQhifX0ftZ9MI3R84zf/NWiZvOlw9
         Ldvv+v3d9G1PeShNvAt3T9W+zb0XKlzLWSx5PTS6wFjyI3JrRobX4CEvAu/GqmKxEWa8
         OXclenEtjjhhfELZDwTVriGOpikKYivzENXP9srwEd+CFS2G+xIgH/BjgCBfv8NARhnl
         TCgvdN7JbJU/00FDznUJZw7uX7jlIuDTBoEO3f+8yht4a/l+mcB7Px+X/nsg5pB0LpIw
         Ry0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771437952; x=1772042752;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXX5Ad6lE4eM3SpWZXXZtn5YXTRNU+kz7ZHFBHa7LgY=;
        b=bqtWTANIQW1b30qiQI86Hwf3DhSI4gl6k9gKBHjOxXnLH8YtfF7pAAF4GHW/HZG41B
         gQ32sfdES+wBBLWotwdEBT+i9wYLBgvwB1m6DpiKgcPpkqNmKoIelp5bflxlsoQZTu7e
         s9+NrkDee8Ga5KnUNsZxe6o5nfyZswnjU6tro33H6pcmTsjaaTo23a/mQqx8nLoXZ9KE
         kWV31oUhrQdgcL70aOCSafBLwwSxyvncKKMC7nQ6Oea6YokgE50tHnCIgHX3i/OpowT2
         etTXJoIwElTOiKxp48l46fK1BcpNaDagicSxifFyNxMXbrtr/ePQdNmhuuwD76S1nMdj
         yPew==
X-Forwarded-Encrypted: i=1; AJvYcCVIyVmWBNjzIzx8yVlUFn0eQbsicY99d4JGbc/H5/5Y+6hKYNZenlErJyKUHmIF3oqIhxcmhLuTBKyKdDv0XRnN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrz05VOsjjZiILP7CVgimgc/0Kk1CNPoeK4AXjAL6j62KNAEfG
	fLT5lg3YyF9idzzOGwo+ROFqjRohDhFLNpQkOTnESlcRQXNq67k8SqoX2rgqmkgljLvULrw91g2
	w0GRR
X-Gm-Gg: AZuq6aJSLOONrWFo0VkVyGbMVwLc+Wz/a1ywFGGjohjzmp7Oe0y0iNQKHpIgaiZKert
	/fQwEkQeSsslObzwuov8iE0CNDGlb6by+cQckP9BAjTQNoy7eoz2b9Z3HIqlBZ32M5i2tlEbWHF
	H86Nj+IWc1m0rSGuhnKpAousXqhLJji6vod0XJyUNsw2GvIG7EIzqOa87bix1ni7X5kj6oC1z33
	1zeJfd1q11XfcECizXqvTvzWh4HMITv/5tE9SZeGxQUsrpL8iBMarojmWT/UG3O1C0HW5hTAdqn
	rM/Wt4bf5dVCLuJi8X5Mp94/08C3DR0vS2AwYjcBVBCUrqCT8xT7OTMxGKZFunMz3c9iyd+Tael
	fPP8jUAby+UYwVYgJMm+2yNepAaOFDN9W9Xr8gAeh4/oLGtYh0vI4kPDgJ/G8Bla5OPdM82413E
	ZfFXnvVpQEMjSBGVqbz0Cm+w==
X-Received: by 2002:a05:600c:3b15:b0:47d:333d:99c with SMTP id 5b1f17b1804b1-48398cc6196mr51541025e9.18.1771437951849;
        Wed, 18 Feb 2026 10:05:51 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-483801ff9b3sm317029295e9.13.2026.02.18.10.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:05:51 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] drivers: clk: meson: Add Amlogic T7 fix pll support
In-Reply-To: <20260218101709.35450-1-linux-kernel-dev@aliel.fr> (Ronald
	Claveau's message of "Wed, 18 Feb 2026 11:17:06 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 19:05:49 +0100
Message-ID: <1j4ine6i6a.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_100554_505042_F4F909AB 
X-CRM114-Status: GOOD (  19.30  )
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

On mer. 18 f=C3=A9vr. 2026 at 11:17, Ronald Claveau <linux-kernel-dev@aliel=
.fr> wrote:

> Add PLL for the clock controller of the Amlogic T7 SoC family.
>

As Krzysztof pointed out, a series like this needs a cover letter to explain
what you are trying to acheive overall, and proper threading.

The description above is too vague.

> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  drivers/clk/meson/t7-pll.c | 257 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 257 insertions(+)
>
> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
> index 0a622f45fa36..3dd3aca50b7c 100644
> --- a/drivers/clk/meson/t7-pll.c
> +++ b/drivers/clk/meson/t7-pll.c
> @@ -71,6 +71,15 @@
>  #define MCLK_PLL_CNTL4		0x10
>  #define MCLK_PLL_STS		0x14
>=20=20
> +#define FPLL_CTRL0		0x00
> +#define FPLL_CTRL1		0x04
> +#define FPLL_CTRL2		0x08
> +#define FPLL_CTRL3		0x0c
> +#define FPLL_CTRL4		0x10
> +#define FPLL_CTRL5		0x14
> +#define FPLL_CTRL6		0x18
> +#define FPLL_STS		0x1c

The PLL you are adding is described in the datasheet as the MPLL. FPLL
is nowhere to be found. Prefer using names that relate to the
documentation.

If you must make a name up, you need to have a very good reason and to
explain it.

Still from the public documentation, this PLL belong in the same device as
MPLL0, MPLL1, etc ... BUT, I remember correctly the T7 initial
submission, the fixed PLL and fdivs are supposed to be provided through
SCMI clocks. Have you checked that ?

> +
>  static const struct pll_mult_range t7_media_pll_mult_range =3D {
>  	.min =3D 125,
>  	.max =3D 250,
> @@ -1047,6 +1056,253 @@ static const struct meson_clkc_data t7_mclk_data =
=3D {
>  	},
>  };
>=20=20
> +static struct clk_regmap t7_fpll_dco =3D {
> +	.data =3D &(struct meson_clk_pll_data){
> +		.en =3D {
> +			.reg_off =3D FPLL_CTRL0,
> +			.shift   =3D 28,
> +			.width   =3D 1,
> +		},
> +		.m =3D {
> +			.reg_off =3D FPLL_CTRL0,
> +			.shift   =3D 0,
> +			.width   =3D 8,
> +		},
> +		.n =3D {
> +			.reg_off =3D FPLL_CTRL0,
> +			.shift   =3D 10,
> +			.width   =3D 5,
> +		},
> +		.frac =3D {
> +			.reg_off =3D FPLL_CTRL1,
> +			.shift   =3D 0,
> +			.width   =3D 17,
> +		},
> +		.l =3D {
> +			.reg_off =3D FPLL_CTRL0,
> +			.shift   =3D 31,
> +			.width   =3D 1,
> +		},
> +		.rst =3D {
> +			.reg_off =3D FPLL_CTRL0,
> +			.shift   =3D 29,
> +			.width   =3D 1,
> +		},
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fpll_dco",
> +		.ops =3D &meson_clk_pll_ro_ops,
> +		.parent_data =3D &(const struct clk_parent_data) {
> +			.fw_name =3D "xtal",
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fpll =3D {
> +	.data =3D &(struct clk_regmap_div_data){
> +		.offset =3D FPLL_CTRL0,
> +		.shift =3D 16,
> +		.width =3D 2,
> +		.flags =3D CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fpll",
> +		.ops =3D &clk_regmap_divider_ro_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fpll_dco.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv2_div =3D {
> +	.mult =3D 1,
> +	.div =3D 2,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv2_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) { &t7_fpll.hw },
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv2 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 24,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv2",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv2_div.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv2p5_div =3D {
> +	.mult =3D 2,
> +	.div =3D 5,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv2p5_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fpll.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv2p5 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 25,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv2p5",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv2p5_div.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv3_div =3D {
> +	.mult =3D 1,
> +	.div =3D 3,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv3_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) { &t7_fpll.hw },
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv3 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 20,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv3",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv3_div.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv4_div =3D {
> +	.mult =3D 1,
> +	.div =3D 4,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv4_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) { &t7_fpll.hw },
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv4 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 21,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv4",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv4_div.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv5_div =3D {
> +	.mult =3D 1,
> +	.div =3D 5,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv5_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) { &t7_fpll.hw },
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv5 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 22,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv5",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv5_div.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv7_div =3D {
> +	.mult =3D 1,
> +	.div =3D 7,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv7_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) { &t7_fpll.hw },
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv7 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 23,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv7",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv7_div.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_hw *t7_fpll_hw_clks[] =3D {
> +	[CLKID_FPLL_DCO]	=3D &t7_fpll_dco.hw,
> +	[CLKID_FPLL]		=3D &t7_fpll.hw,
> +	[CLKID_FDIV2_DIV]	=3D &t7_fdiv2_div.hw,
> +	[CLKID_FDIV2]		=3D &t7_fdiv2.hw,
> +	[CLKID_FDIV2P5_DIV]	=3D &t7_fdiv2p5_div.hw,
> +	[CLKID_FDIV2P5]		=3D &t7_fdiv2p5.hw,
> +	[CLKID_FDIV3_DIV]	=3D &t7_fdiv3_div.hw,
> +	[CLKID_FDIV3]		=3D &t7_fdiv3.hw,
> +	[CLKID_FDIV4_DIV]	=3D &t7_fdiv4_div.hw,
> +	[CLKID_FDIV4]		=3D &t7_fdiv4.hw,
> +	[CLKID_FDIV5_DIV]	=3D &t7_fdiv5_div.hw,
> +	[CLKID_FDIV5]		=3D &t7_fdiv5.hw,
> +	[CLKID_FDIV7_DIV]	=3D &t7_fdiv7_div.hw,
> +	[CLKID_FDIV7]		=3D &t7_fdiv7.hw,
> +};
> +
> +static const struct meson_clkc_data t7_fpll_data =3D {
> +	.hw_clks =3D {
> +		.hws =3D t7_fpll_hw_clks,
> +		.num =3D ARRAY_SIZE(t7_fpll_hw_clks),
> +	},
> +};
> +
>  static const struct of_device_id t7_pll_clkc_match_table[] =3D {
>  	{ .compatible =3D "amlogic,t7-gp0-pll",	.data =3D &t7_gp0_data, },
>  	{ .compatible =3D "amlogic,t7-gp1-pll",	.data =3D &t7_gp1_data, },
> @@ -1055,6 +1311,7 @@ static const struct of_device_id t7_pll_clkc_match_=
table[] =3D {
>  	{ .compatible =3D "amlogic,t7-mpll",	.data =3D &t7_mpll_data, },
>  	{ .compatible =3D "amlogic,t7-hdmi-pll",	.data =3D &t7_hdmi_data, },
>  	{ .compatible =3D "amlogic,t7-mclk-pll",	.data =3D &t7_mclk_data, },
> +	{ .compatible =3D "amlogic,t7-fpll",	.data =3D &t7_fpll_data, },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, t7_pll_clkc_match_table);

--=20
Jerome

