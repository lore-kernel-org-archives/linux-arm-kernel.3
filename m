Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8290AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjzKe68KszeGBalKiITt7UFDZHe2rbRtyPnG3dABayc=; b=rOLKYB8LnT16uW4/Cia4VBCK1P
	dEb8K0ZhOx4JO879b7pfLykG6nOrpALAMxNuxPqme4nVd0QahB8Dr678oBWY7+LyUXLoKTXGY5l/t
	zkT1dtXdBbhadfecZ0janxfk15m+zaYs44fZ9VF5g/ClNozPSHhBJHG0iit2PJ9jlboU7YXc5tU8v
	IhgGN1WHaEgjr+WPjXXI9L4eREVmML+tXHOsDCQJJ29sQhqIzj4dG9uddOYqDZPh8TCenAOnWw12I
	pfa3ccb0Rc7ObFUSM0DZCSjJNWjL1DyWjw8hbvLUViYE0Yyw+m6zNCfMKx1DBlhHzHRnAWdAEx8ZL
	VSQeiEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUiG-00000009uRE-434K;
	Tue, 18 Feb 2025 21:01:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUDs-00000009m2Y-3f0s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:29:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38f286b5281so2895015f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 12:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739910579; x=1740515379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjzKe68KszeGBalKiITt7UFDZHe2rbRtyPnG3dABayc=;
        b=ID/GZN2OzdqRwJtgOeISdAMiSyY5BEE4NrZkaLoq4zeq3x1e1rEdmk0kmvRx14L5Wk
         ERz8y5DzSfc4esfbcmSS14fvoK2sdWWIRcuXfu593MSzlIF1LS7+QFCmp7RU0PQ82fzg
         bF3ejwKnZKWe4bpZgON84wuPmeLzFF6gN+VWcnZSGkwmzAxtYczxTB9QZcc0ilandlKw
         DHSTwGw41CscoJQATyV535ZPxb4oiRJ3MSBeWD4Qj7gXPIoFV7ofUAYs/OXsT5V7JWF6
         Dp1ntqJLXNFI+30xWf1XpAyQD8Cp24ZndjimDA49uWwroSVmusEYVAVPctR7M1q3Dq8I
         UtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739910579; x=1740515379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjzKe68KszeGBalKiITt7UFDZHe2rbRtyPnG3dABayc=;
        b=t6lt4azK7AuDV1iWzEHalE0V8NAzeE5O/mdZrcvFuabYUSyc9vqOa0uIGaA4ePQWez
         MsSL0PuQssWh5qC69L370z7s/sbjrVcg/aPiNREpboGrfq9Dpx+Avs9sTu3991mCHiKp
         1On2F4oRZj77YPqV2p07y0aumhP5qHEgif+V3RcG1lKfsuhiAAl1RYnXLbAfKtYWYBB9
         MsW0vNv7q2hDnYhWNLypVQTFUux5fS/dHEf5ckgHci12KcXlB2c+v4c1Iaqodx5aLNMw
         MF2TV7lgMW3qqlcg52lssyLE6gxERlKyOztqRUV4R8yqAnz0Qx1u2dtW0v8fu37tRJbq
         24Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWjDZc4wAmnEQhtoWGWeLR1AsTm81fvxVzQ4t6AuTqDRx9VjZCeAW4HgW/3KEfVfyF1xo8VqTb+l4oaOVgpyiQw@lists.infradead.org
X-Gm-Message-State: AOJu0YyXE8+IyGIcoMO8ZkYGM9yC9OVr1ZMqbZCy/cw62alba+ssxeGk
	pBYeSj0tNNAZMZC4NfxqMQcLu1QPlU/V0AiVdMP34mhPqF4q++6m
X-Gm-Gg: ASbGnctu7Zo9thYw9McpKlB1HlsCzphQoUcQmT/CGNhize72Da05g+Q0PJVFberwBAB
	+dSWrqCw3ypRdAJ3vTO16dzfbZG/CNkvmLJjuENahTjK4Hh4CoV41FxcE2Z4QFH8h2N3UYdxW99
	KcFSeKsYLKfkfNCQ/Sq8Ac66J4+h+Tlikd6Wm1ZBlNGXiwysiWNISAiUmGmDm6B8xUBEOdWR4QJ
	yGuOLt0HRQ3U0NesrJC6Ator3XcosRokJZdt/yglxuKK/vPBOi02PLgSqPShf0zhFjjAe4d80Jr
	6ozb6efv2aTmxXTltFbahBylm/ep6TUjXuX2b9PTIS9Ko69UnWgH3ZacXF6mMqnXGMM=
X-Google-Smtp-Source: AGHT+IGFZQdwRCcDyN6MklzsVuExi442JwSaJur4Z7WeMPqhRjBlV4K4yUGnpTqPPMSpQeIwBBw7qA==
X-Received: by 2002:a05:6000:1569:b0:38f:5057:57f6 with SMTP id ffacd0b85a97d-38f505758c1mr4329515f8f.27.1739910578982;
        Tue, 18 Feb 2025 12:29:38 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4118sm16332176f8f.18.2025.02.18.12.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 12:29:38 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/15] clk: sunxi-ng: a523: add reset lines
Date: Tue, 18 Feb 2025 21:29:37 +0100
Message-ID: <15399016.tv2OnDr8pf@jernej-laptop>
In-Reply-To: <20250214125359.5204-14-andre.przywara@arm.com>
References: <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-14-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_122940_917716_5EE2C626 
X-CRM114-Status: GOOD (  19.26  )
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

Dne petek, 14. februar 2025 ob 13:53:57 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Allwinner SoCs do not contain a separate reset controller, instead the
> reset lines for the various devices are integrated into the "BGR" (Bus
> Gate / Reset) registers, for each device group: one for all UARTs, one
> for all SPI interfaces, and so on.
> The Allwinner CCU driver also doubles as a reset provider, and since the
> reset lines are indeed just single bits in those BGR register, we can
> represent them easily in an array of structs, just containing the
> register offset and the bit number.
>=20
> Add the location of the reset bits for all devices in the A523/T527
> SoCs, using the existing sunxi CCU infrastructure.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 83 ++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index fbed9b2b3b2f9..d57565f07a112 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -1475,11 +1475,94 @@ static struct clk_hw_onecell_data sun55i_a523_hw_=
clks =3D {
>  	},
>  };
> =20
> +static struct ccu_reset_map sun55i_a523_ccu_resets[] =3D {
> +	[RST_MBUS]		=3D { 0x540, BIT(30) },
> +	[RST_BUS_NSI]		=3D { 0x54c, BIT(16) },
> +	[RST_BUS_DE]		=3D { 0x60c, BIT(16) },
> +	[RST_BUS_DI]		=3D { 0x62c, BIT(16) },
> +	[RST_BUS_G2D]		=3D { 0x63c, BIT(16) },
> +	[RST_BUS_SYS]		=3D { 0x64c, BIT(16) },
> +	[RST_BUS_GPU]		=3D { 0x67c, BIT(16) },
> +	[RST_BUS_CE]		=3D { 0x68c, BIT(16) },
> +	[RST_BUS_SYS_CE]	=3D { 0x68c, BIT(17) },
> +	[RST_BUS_VE]		=3D { 0x69c, BIT(16) },
> +	[RST_BUS_DMA]		=3D { 0x70c, BIT(16) },
> +	[RST_BUS_MSGBOX]	=3D { 0x71c, BIT(16) },
> +	[RST_BUS_SPINLOCK]	=3D { 0x72c, BIT(16) },
> +	[RST_BUS_CPUXTIMER]	=3D { 0x74c, BIT(16) },
> +	[RST_BUS_DBG]		=3D { 0x78c, BIT(16) },
> +	[RST_BUS_PWM0]		=3D { 0x7ac, BIT(16) },
> +	[RST_BUS_PWM1]		=3D { 0x7ac, BIT(17) },
> +	[RST_BUS_DRAM]		=3D { 0x80c, BIT(16) },
> +	[RST_BUS_NAND]		=3D { 0x82c, BIT(16) },
> +	[RST_BUS_MMC0]		=3D { 0x84c, BIT(16) },
> +	[RST_BUS_MMC1]		=3D { 0x84c, BIT(17) },
> +	[RST_BUS_MMC2]		=3D { 0x84c, BIT(18) },
> +	[RST_BUS_SYSDAP]	=3D { 0x88c, BIT(16) },
> +	[RST_BUS_UART0]		=3D { 0x90c, BIT(16) },
> +	[RST_BUS_UART1]		=3D { 0x90c, BIT(17) },
> +	[RST_BUS_UART2]		=3D { 0x90c, BIT(18) },
> +	[RST_BUS_UART3]		=3D { 0x90c, BIT(19) },
> +	[RST_BUS_UART4]		=3D { 0x90c, BIT(20) },
> +	[RST_BUS_UART5]		=3D { 0x90c, BIT(21) },
> +	[RST_BUS_UART6]		=3D { 0x90c, BIT(22) },
> +	[RST_BUS_UART7]		=3D { 0x90c, BIT(23) },
> +	[RST_BUS_I2C0]		=3D { 0x91c, BIT(16) },
> +	[RST_BUS_I2C1]		=3D { 0x91c, BIT(17) },
> +	[RST_BUS_I2C2]		=3D { 0x91c, BIT(18) },
> +	[RST_BUS_I2C3]		=3D { 0x91c, BIT(19) },
> +	[RST_BUS_I2C4]		=3D { 0x91c, BIT(20) },
> +	[RST_BUS_I2C5]		=3D { 0x91c, BIT(21) },
> +	[RST_BUS_CAN]		=3D { 0x92c, BIT(16) },
> +	[RST_BUS_SPI0]		=3D { 0x96c, BIT(16) },
> +	[RST_BUS_SPI1]		=3D { 0x96c, BIT(17) },
> +	[RST_BUS_SPI2]		=3D { 0x96c, BIT(18) },
> +	[RST_BUS_SPIFC]		=3D { 0x96c, BIT(19) },
> +	[RST_BUS_EMAC0]		=3D { 0x97c, BIT(16) },
> +	[RST_BUS_EMAC1]		=3D { 0x98c, BIT(16) | BIT(17) },	/* GMAC1-AXI */

GMAC AXI reset should be separate.

> +	[RST_BUS_IR_RX]		=3D { 0x99c, BIT(16) },
> +	[RST_BUS_IR_TX]		=3D { 0x9cc, BIT(16) },
> +	[RST_BUS_GPADC0]	=3D { 0x9ec, BIT(16) },
> +	[RST_BUS_GPADC1]	=3D { 0x9ec, BIT(17) },
> +	[RST_BUS_THS]		=3D { 0x9fc, BIT(16) },
> +	[RST_USB_PHY0]		=3D { 0xa70, BIT(30) },
> +	[RST_USB_PHY1]		=3D { 0xa74, BIT(30) },
> +	[RST_BUS_OHCI0]		=3D { 0xa8c, BIT(16) },
> +	[RST_BUS_OHCI1]		=3D { 0xa8c, BIT(17) },
> +	[RST_BUS_EHCI0]		=3D { 0xa8c, BIT(20) },
> +	[RST_BUS_EHCI1]		=3D { 0xa8c, BIT(21) },
> +	[RST_BUS_OTG]		=3D { 0xa8c, BIT(24) },
> +	[RST_BUS_3]		=3D { 0xa8c, BIT(25) },	/* BSP + register */
> +	[RST_BUS_LRADC]		=3D { 0xa9c, BIT(16) },
> +	[RST_BUS_PCIE_USB3]	=3D { 0xaac, BIT(16) },
> +	[RST_BUS_DPSS_TOP]	=3D { 0xabc, BIT(16) },

Docs say that there is extra display top reset at 0xacc.

Best regards,
Jernej

> +	[RST_BUS_HDMI_MAIN]	=3D { 0xb1c, BIT(16) },
> +	[RST_BUS_HDMI_SUB]	=3D { 0xb1c, BIT(17) },
> +	[RST_BUS_MIPI_DSI0]	=3D { 0xb4c, BIT(16) },
> +	[RST_BUS_MIPI_DSI1]	=3D { 0xb4c, BIT(17) },
> +	[RST_BUS_TCON_LCD0]	=3D { 0xb7c, BIT(16) },
> +	[RST_BUS_TCON_LCD1]	=3D { 0xb7c, BIT(17) },
> +	[RST_BUS_TCON_LCD2]	=3D { 0xb7c, BIT(18) },
> +	[RST_BUS_TCON_TV0]	=3D { 0xb9c, BIT(16) },
> +	[RST_BUS_TCON_TV1]	=3D { 0xb9c, BIT(17) },
> +	[RST_BUS_LVDS0]		=3D { 0xbac, BIT(16) },
> +	[RST_BUS_LVDS1]		=3D { 0xbac, BIT(17) },
> +	[RST_BUS_EDP]		=3D { 0xbbc, BIT(16) },
> +	[RST_BUS_VIDEO_OUT0]	=3D { 0xbcc, BIT(16) },
> +	[RST_BUS_VIDEO_OUT1]	=3D { 0xbcc, BIT(17) },
> +	[RST_BUS_LEDC]		=3D { 0xbfc, BIT(16) },
> +	[RST_BUS_CSI]		=3D { 0xc1c, BIT(16) },
> +	[RST_BUS_ISP]		=3D { 0xc2c, BIT(16) },	/* BSP + register */
> +};
> +
>  static const struct sunxi_ccu_desc sun55i_a523_ccu_desc =3D {
>  	.ccu_clks	=3D sun55i_a523_ccu_clks,
>  	.num_ccu_clks	=3D ARRAY_SIZE(sun55i_a523_ccu_clks),
> =20
>  	.hw_clks	=3D &sun55i_a523_hw_clks,
> +
> +	.resets		=3D sun55i_a523_ccu_resets,
> +	.num_resets	=3D ARRAY_SIZE(sun55i_a523_ccu_resets),
>  };
> =20
>  static const u32 pll_regs[] =3D {
>=20





