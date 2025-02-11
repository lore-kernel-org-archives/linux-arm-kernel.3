Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2BAC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 21:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aoM+M8pSk0Ix5jG8X2hGpDY8nMbcc5X1J6eK+jsQdQ=; b=NW/5jX1XKDKznh2JnqsjD/6M+y
	vcsHY38OcrgS7gGmriJzmxeHNecdK6nyrbR8yZKhQK4v+PGDNENgkq78a96Cz1Sw8lqAZUvSvTpSb
	kPz4e0IcKltXMy8/YW5tulUSWJxUBqxwGhEHLf/2LEUHLsU2uGb1Cbb3BDRyCix6rbE0SQEify+v0
	4cQFsfPW2DTkM0pY1f3jUwgPL9JLRDEWiLDIFf7IZcxnZ0ZmJqrtGZGxGvbphsNT51FkgumayAUcu
	XwSACIu+X1TU5C1HqOlvmuBXWCnjN82CwXrPkdZUebKxVaV53UTagJC6wlWHHnUWB8utokpwCuAz7
	GranvH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxQ1-00000005HH6-3Wgj;
	Tue, 11 Feb 2025 21:03:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thxOc-00000005H2a-1Por;
	Tue, 11 Feb 2025 21:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0EC9A40CB9;
	Tue, 11 Feb 2025 21:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45A9C4CEDD;
	Tue, 11 Feb 2025 21:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739307737;
	bh=/JBVR8JEl9TEmCiDsvRcSlGqcBPClnJL1SJndMkvM+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cTpg1UHyaclMHHy7WUsDfK0vtCdJ4sxVAjvyT/Kf2C/YRuh0AfE+JNHiNvRI1lZJC
	 TV0TIyzFjUIO5UGxQ5rxOZQG4smvWmX4CB61CvBfjXINYEIiuby6EvO8RWSvV2PI6l
	 dCbD/3YM7e6TuTQsXzKLHsLE8k8IP33nl02ro8fs+BvNI/wRAWt1Di/SmH0KgHZYi4
	 46qeiMkw/z5iMxSJ8lYsIpTfM8ELJo0c2rGjVVyiFXQtFxPEASpCiOYRYbA3oysKLJ
	 oqRUK9clhoEaMn52/I9jgoe7bLEpTJvaoJOr5U3U701GbPx6lIg4D/7QA3K0uZhTUU
	 nbFxtcYIY6sWg==
Date: Tue, 11 Feb 2025 15:02:15 -0600
From: Rob Herring <robh@kernel.org>
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 03/10] dt-bindings: clock: sunxi-ng: add compatibles
 for V853
Message-ID: <20250211210215.GA1160917-robh@kernel.org>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
 <20250205125225.1152849-4-szemzo.andras@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205125225.1152849-4-szemzo.andras@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_130218_516928_132F1258 
X-CRM114-Status: GOOD (  19.15  )
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

On Wed, Feb 05, 2025 at 01:52:18PM +0100, Andras Szemzo wrote:
> V853 has 2 CCUs, add compatible strings for it.
> 
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
> ---
>  .../clock/allwinner,sun4i-a10-ccu.yaml        |   3 +
>  .../clock/allwinner,sun8i-v853-ccu.h          | 132 ++++++++++++++++++
>  .../clock/allwinner,sun8i-v853-r-ccu.h        |  16 +++
>  .../reset/allwinner,sun8i-v853-ccu.h          |  60 ++++++++
>  .../reset/allwinner,sun8i-v853-r-ccu.h        |  14 ++
>  5 files changed, 225 insertions(+)
>  create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
>  create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
>  create mode 100644 include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
> index 1690b9d99c3d..9369d62284ed 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
> @@ -33,6 +33,8 @@ properties:
>        - allwinner,sun8i-r40-ccu
>        - allwinner,sun8i-v3-ccu
>        - allwinner,sun8i-v3s-ccu
> +      - allwinner,sun8i-v853-ccu
> +      - allwinner,sun8i-v853-r-ccu

Please explain the difference between these in the commit message.

>        - allwinner,sun9i-a80-ccu
>        - allwinner,sun20i-d1-ccu
>        - allwinner,sun20i-d1-r-ccu
> @@ -103,6 +105,7 @@ else:
>        compatible:
>          enum:
>            - allwinner,sun20i-d1-ccu
> +          - allwinner,sun8i-v853-ccu
>            - allwinner,sun50i-a100-ccu
>            - allwinner,sun50i-h6-ccu
>            - allwinner,sun50i-h616-ccu
> diff --git a/include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h b/include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
> new file mode 100644
> index 000000000000..cf56c168e1cd
> --- /dev/null
> +++ b/include/dt-bindings/clock/allwinner,sun8i-v853-ccu.h
> @@ -0,0 +1,132 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license.

> +/*
> + * Copyright (C) 2024 Andras Szemzo <szemzo.andras@gmail.com.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V85X_CCU_H_
> +#define _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V85X_CCU_H_
> +
> +#define CLK_OSC12M		0
> +#define CLK_PLL_CPU		1
> +#define CLK_PLL_DDR		2
> +#define CLK_PLL_PERIPH_4X	3
> +#define CLK_PLL_PERIPH_2X	4
> +#define CLK_PLL_PERIPH_800M	5
> +#define CLK_PLL_PERIPH_480M	6
> +#define CLK_PLL_PERIPH_600M	7
> +#define CLK_PLL_PERIPH_400M	8
> +#define CLK_PLL_PERIPH_300M	9
> +#define CLK_PLL_PERIPH_200M	10
> +#define CLK_PLL_PERIPH_160M	11
> +#define CLK_PLL_PERIPH_150M	12
> +#define CLK_PLL_VIDEO_4X	13
> +#define CLK_PLL_VIDEO_2X	14
> +#define CLK_PLL_VIDEO_1X	15
> +#define CLK_PLL_CSI_4X		16
> +#define CLK_PLL_AUDIO_DIV2	17
> +#define CLK_PLL_AUDIO_DIV5	18
> +#define CLK_PLL_AUDIO_4X	19
> +#define CLK_PLL_AUDIO_1X	20
> +#define CLK_PLL_NPU_4X		21
> +#define CLK_CPU			22
> +#define CLK_CPU_AXI		23
> +#define CLK_CPU_APB		24
> +#define CLK_AHB			25
> +#define CLK_APB0		26
> +#define CLK_APB1		27
> +#define CLK_MBUS		28
> +#define CLK_DE			29
> +#define CLK_BUS_DE		30
> +#define CLK_G2D			31
> +#define CLK_BUS_G2D		32
> +#define CLK_CE			33
> +#define CLK_BUS_CE		34
> +#define CLK_VE			35
> +#define CLK_BUS_VE		36
> +#define CLK_NPU			37
> +#define CLK_BUS_NPU		38
> +#define CLK_BUS_DMA		39
> +#define CLK_BUS_MSGBOX0		40
> +#define CLK_BUS_MSGBOX1		41
> +#define CLK_BUS_SPINLOCK	42
> +#define CLK_BUS_HSTIMER		43
> +#define CLK_AVS			44
> +#define CLK_BUS_DBG		45
> +#define CLK_BUS_PWM		46
> +#define CLK_BUS_IOMMU		47
> +#define CLK_DRAM		48
> +#define CLK_MBUS_DMA		49
> +#define CLK_MBUS_VE		50
> +#define CLK_MBUS_CE		51
> +#define CLK_MBUS_CSI		52
> +#define CLK_MBUS_ISP		53
> +#define CLK_MBUS_G2D		54
> +#define CLK_BUS_DRAM		55
> +#define CLK_MMC0		56
> +#define CLK_MMC1		57
> +#define CLK_MMC2		58
> +#define CLK_BUS_MMC0		59
> +#define CLK_BUS_MMC1		60
> +#define CLK_BUS_MMC2		61
> +#define CLK_BUS_UART0		62
> +#define CLK_BUS_UART1		63
> +#define CLK_BUS_UART2		64
> +#define CLK_BUS_UART3		65
> +#define CLK_BUS_I2C0		66
> +#define CLK_BUS_I2C1		67
> +#define CLK_BUS_I2C2		68
> +#define CLK_BUS_I2C3		69
> +#define CLK_BUS_I2C4		70
> +#define CLK_SPI0		71
> +#define CLK_SPI1		72
> +#define CLK_SPI2		73
> +#define CLK_SPI3		74
> +#define CLK_BUS_SPI0		75
> +#define CLK_BUS_SPI1		76
> +#define CLK_BUS_SPI2		77
> +#define CLK_BUS_SPI3		78
> +#define CLK_SPIF		79
> +#define CLK_BUS_SPIF		80
> +#define CLK_EMAC_25M		81
> +#define CLK_BUS_EMAC		82
> +#define CLK_BUS_GPADC		83
> +#define CLK_BUS_THS		84
> +#define CLK_I2S0		85
> +#define CLK_I2S1		86
> +#define CLK_BUS_I2S0		87
> +#define CLK_BUS_I2S1		88
> +#define CLK_DMIC		89
> +#define CLK_BUS_DMIC		90
> +#define CLK_AUDIO_CODEC_DAC	91
> +#define CLK_AUDIO_CODEC_ADC	92
> +#define CLK_BUS_AUDIO_CODEC	93
> +#define CLK_USB_OHCI		94
> +#define CLK_BUS_OHCI		95
> +#define CLK_BUS_EHCI		96
> +#define CLK_BUS_OTG		97
> +#define CLK_BUS_DPSS_TOP	98
> +#define CLK_MIPI_DSI		99
> +#define CLK_BUS_MIPI_DSI	100
> +#define CLK_TCON_LCD		101
> +#define CLK_BUS_TCON_LCD	102
> +#define CLK_CSI_TOP		103
> +#define CLK_CSI_MCLK0		104
> +#define CLK_CSI_MCLK1		105
> +#define CLK_CSI_MCLK2		106
> +#define CLK_BUS_CSI		107
> +#define CLK_BUS_WIEGAND		108
> +#define CLK_RISCV		109
> +#define CLK_RISCV_AXI		110
> +#define CLK_RISCV_CORE_GATE	111
> +#define CLK_RISCV_CFG_GATE	112
> +#define CLK_FANOUT_24M		113
> +#define CLK_FANOUT_12M		114
> +#define CLK_FANOUT_16M		115
> +#define CLK_FANOUT_25M		116
> +#define CLK_FANOUT_27M		117
> +#define CLK_FANOUT_PCLK		118
> +#define CLK_FANOUT0		119
> +#define CLK_FANOUT1		120
> +#define CLK_FANOUT2		121
> +
> +#endif
> diff --git a/include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h b/include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
> new file mode 100644
> index 000000000000..48fe598b7bd8
> --- /dev/null
> +++ b/include/dt-bindings/clock/allwinner,sun8i-v853-r-ccu.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Andras Szemzo <szemzo.andras@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V853_R_CCU_H_
> +#define _DT_BINDINGS_CLK_ALLWINNER_SUN8I_V853_R_CCU_H_
> +
> +#define CLK_R_AHB		0
> +#define CLK_R_APB0		1
> +#define CLK_BUS_R_TWD		2
> +#define CLK_BUS_R_PPU		3
> +#define CLK_BUS_R_RTC		4
> +#define CLK_BUS_R_CPUCFG	5
> +
> +#endif
> diff --git a/include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h b/include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
> new file mode 100644
> index 000000000000..e258117518aa
> --- /dev/null
> +++ b/include/dt-bindings/reset/allwinner,sun8i-v853-ccu.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2024 Andras Szemzo <szemzo.andras@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RST_ALLWINNER_SUN8I_V85X_CCU_H_
> +#define _DT_BINDINGS_RST_ALLWINNER_SUN8I_V85X_CCU_H_
> +
> +#define RST_MBUS		0
> +#define RST_BUS_DE		1
> +#define RST_BUS_G2D		2
> +#define RST_BUS_CE		3
> +#define RST_BUS_VE		4
> +#define RST_BUS_NPU		5
> +#define RST_BUS_DMA		6
> +#define RST_BUS_MSGBOX0		7
> +#define RST_BUS_MSGBOX1		8
> +#define RST_BUS_SPINLOCK	9
> +#define RST_BUS_HSTIMER		10
> +#define RST_BUS_DBG		11
> +#define RST_BUS_PWM		12
> +#define RST_BUS_DRAM		13
> +#define RST_BUS_MMC0		14
> +#define RST_BUS_MMC1		15
> +#define RST_BUS_MMC2		16
> +#define RST_BUS_UART0		17
> +#define RST_BUS_UART1		18
> +#define RST_BUS_UART2		19
> +#define RST_BUS_UART3		20
> +#define RST_BUS_I2C0		21
> +#define RST_BUS_I2C1		22
> +#define RST_BUS_I2C2		23
> +#define RST_BUS_I2C3		24
> +#define RST_BUS_I2C4		25
> +#define RST_BUS_SPI0		26
> +#define RST_BUS_SPI1		27
> +#define RST_BUS_SPI2		28
> +#define RST_BUS_SPI3		29
> +#define RST_BUS_SPIF		30
> +#define RST_BUS_EMAC		31
> +#define RST_BUS_GPADC		32
> +#define RST_BUS_THS		33
> +#define RST_BUS_I2S0		34
> +#define RST_BUS_I2S1		35
> +#define RST_BUS_DMIC		36
> +#define RST_BUS_AUDIO_CODEC	37
> +#define RST_USB_PHY		38
> +#define RST_BUS_OHCI		39
> +#define RST_BUS_EHCI		40
> +#define RST_BUS_OTG		41
> +#define RST_BUS_DPSS_TOP	42
> +#define RST_BUS_MIPI_DSI	43
> +#define RST_BUS_TCON_LCD	44
> +#define RST_BUS_CSI		45
> +#define RST_BUS_WIEGAND		46
> +#define RST_RISCV_SYS_APB	47
> +#define RST_RISCV_SOFT		48
> +#define RST_RISCV_CFG		49
> +
> +#endif
> diff --git a/include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h b/include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
> new file mode 100644
> index 000000000000..57629d635115
> --- /dev/null
> +++ b/include/dt-bindings/reset/allwinner,sun8i-v853-r-ccu.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2025 Andras Szemzo <szemzo.andras@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RST_ALLWINNER_SUN8I_V853_R_CCU_H_
> +#define _DT_BINDINGS_RST_ALLWINNER_SUN8I_V853_R_CCU_H_
> +
> +#define RST_BUS_R_TWD		0
> +#define RST_BUS_R_PPU		1
> +#define RST_BUS_R_RTC		2
> +#define RST_BUS_R_CPUCFG	3
> +
> +#endif
> -- 
> 2.39.5
> 

