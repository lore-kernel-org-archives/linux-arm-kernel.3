Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252D7CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHsRz99QxqhJR42GxPR0C5SqA0MXdWaHE+3pyj9VXHc=; b=QpmFq1H7gPhbn2cCH2jWM2WqNt
	bzwNv/Pu5LTowxG4MlPpyzrhqhEnu62Pj54b5vnaUVkNr9WN+mhFLlGuviq40ML8x4D2+FPxJZOjV
	xtXwYDQYtKhMS4k8YcqhRn60fPEqHfZ5UMpGAu0zBKehfw51QNMPEFYYXE9LoNVASv2QqSMjW1D1+
	IC6/2WSI1PR0owBYU3uWGm1rkJPVGdpvb6TwFRFH4Yb0sSGGtKPHs/vx1TuHCA9+WtYVEwx4vdVHT
	9vyNVvwMzT3JWni6nNct0T4PvODjLXHQ8zzpzZSLBahS/mIdqc7V/EQvwsYCG2gig9TUKi4OlYehm
	LdPb1Osg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSpQ-0000000E62R-45mM;
	Mon, 11 May 2026 15:45:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSpO-0000000E615-2H2w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778514353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IHsRz99QxqhJR42GxPR0C5SqA0MXdWaHE+3pyj9VXHc=;
	b=NVYO+SGA3hFnMsd57g6xSgIl2sM1Tlgu0n24eJ0L33xqTRI4ll3ZifYsJ0+s3MGfKoHrC4
	FJ9Hicg0r8pEDMQj1b1rmsVyGGUahDbFaUlx1ipwrAyM3I7D8U8cUYqdwzJcqBUZkh9sym
	INmgby7sww1cA7MctG5jY2dPN64DGDg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-V2Ad8yIGMleODli7RsC_EA-1; Mon, 11 May 2026 11:45:51 -0400
X-MC-Unique: V2Ad8yIGMleODli7RsC_EA-1
X-Mimecast-MFC-AGG-ID: V2Ad8yIGMleODli7RsC_EA_1778514350
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8f461b583acso812605585a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514350; x=1779119150;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IHsRz99QxqhJR42GxPR0C5SqA0MXdWaHE+3pyj9VXHc=;
        b=c8KOXeXO3AcR0CLZl3z8OzQEFqNh4O7paehXmQcXjRVhDboUoNI7fT8XBzG5Kp8NNB
         xX1z1HijUeP72kMZdJBrdDcsgqCD4iJMH+YlmqmS9dvT9D0KuLdY/dwJLmpNWzEh/gn/
         OHtRczKdUv3cEn4adHkaM0+qP0s/Aen1KWZAWOkAfAYTL9LWBBqfLE4SnPsYXKApVcU+
         mVr96nz4PrfGGVIHt0yNs5wiH/GZvnIRBwyYT5/MaXNTABFatvZwfQ74inyr10etszwG
         HqqUFakrH3aQrZFq2PmY8CArw3mLZ1JvT9t6CZIwOo5X5x/9FKhGgia0wG3BC4KVR0aK
         wEwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jmiIS4UaZZdlE/2vUv8lF/p1aYQ4xK8Dlhjs9yDwwGyWNRUMJ8tWRHnCy9B8wng0xVoNHumEMvz9YckNwdqq8@lists.infradead.org
X-Gm-Message-State: AOJu0YxlbmlbKfz3yxFGB8jws4mnIiA1QiGQJroNjtJf6FZ45/D6VIg9
	YjMRBYkgwTzSsDwTWouJuwJNWbRBrRjUWSQWjbqQ3odBkc9m+I9IK4BPSfZ58Wr+rw6mahYY2Ui
	eKTaXeyz4PHY14n7Eoh4c6WI+UbFsNYrYlZ6sWojTIj/7NJ/TVAj+6CSgb5mUXVe7o/R5BXQYYc
	T8
X-Gm-Gg: Acq92OGkj+dORyXk9KL2NyZWBoV76X+X0zthQyROn9Z93hUpSpnqOh6RoUS6OmacZ3a
	Zxz2p39spPdvkQt924rk3/Dn6kU3CXmdEr0ErSLzbldQajqMFeFRPWd5qFy5dZNmyVLNpBIKkr2
	XdkSmapC9j0lKm0L7eZO70OwwX3BpP5z7mdoHgWwymVWOL7tXQe4DztaDOmumsD6LNAOOZY4HEU
	ro8O0UMEOSJixZIV/1YtfmVT+NDjmfa0cowy+FB/ltVgKNVBuiHLIiey0Z43xLplGKgzsIgASqL
	vmwBXr4Zpd9X1bHFuRfb6MSSEBFVJT0duXUT0ffKdDLfF9ZZvzO7QGFssUHDxGecc8Zb2KDQlYJ
	vOk6E3JwLnzpjmstOdS1X8YijNXkVL9iLo9wey5igOViarJNj16qO6gKN
X-Received: by 2002:a05:620a:408c:b0:909:b197:4692 with SMTP id af79cd13be357-909b197494emr1310055485a.62.1778514350580;
        Mon, 11 May 2026 08:45:50 -0700 (PDT)
X-Received: by 2002:a05:620a:408c:b0:909:b197:4692 with SMTP id af79cd13be357-909b197494emr1310049585a.62.1778514350047;
        Mon, 11 May 2026 08:45:50 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b9772b87sm1051002085a.5.2026.05.11.08.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:45:49 -0700 (PDT)
Date: Mon, 11 May 2026 11:45:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/10] clk: amlogic: Add A9 AO clock controller driver
Message-ID: <agH5q01HHszGc6ud@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-10-41cb4071b7c9@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260511-b4-a9_clk-v1-10-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l4qqC8OLcgnvBjd-Amx9XsImCauQMcZJ-u-YqUsoo6Y_1778514350
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_084554_655521_FA7E6CC4 
X-CRM114-Status: GOOD (  23.56  )
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

Hi Jian,

On Mon, May 11, 2026 at 08:47:32PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

I'll only flag new things that I spot here that weren't mentioned in
the other patches I reviewed in this series.

> ---
>  drivers/clk/meson/Makefile   |   2 +-
>  drivers/clk/meson/a9-aoclk.c | 494 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 495 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 2b5b67b14efc..91af609ce815 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -20,7 +20,7 @@ obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>  obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>  obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_A9_PLL) += a9-pll.o
> -obj-$(CONFIG_COMMON_CLK_A9_PERIPHERALS) += a9-peripherals.o
> +obj-$(CONFIG_COMMON_CLK_A9_PERIPHERALS) += a9-peripherals.o a9-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>  obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
> new file mode 100644
> index 000000000000..3c42eaf585d2
> --- /dev/null
> +++ b/drivers/clk/meson/a9-aoclk.c
> @@ -0,0 +1,494 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
> +#include "clk-regmap.h"
> +#include "clk-dualdiv.h"
> +#include "meson-clkc-utils.h"
> +
> +#define AO_OSCIN_CTRL			0x00
> +#define AO_SYS_CLK0			0x04
> +#define AO_PWM_CLK_A_CTRL		0x1c
> +#define AO_PWM_CLK_B_CTRL		0x20
> +#define AO_PWM_CLK_C_CTRL		0x24
> +#define AO_PWM_CLK_D_CTRL		0x28
> +#define AO_PWM_CLK_E_CTRL		0x2c
> +#define AO_PWM_CLK_F_CTRL		0x30
> +#define AO_PWM_CLK_G_CTRL		0x34
> +#define AO_CEC_CTRL0			0x38
> +#define AO_CEC_CTRL1			0x3c
> +#define AO_RTC_BY_OSCIN_CTRL0		0x50
> +#define AO_RTC_BY_OSCIN_CTRL1		0x54
> +
> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
> +	MESON_COMP_SEL(a9_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
> +
> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
> +	MESON_COMP_DIV(a9_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
> +
> +#define A9_COMP_GATE(_name, _reg, _bit) \
> +	MESON_COMP_GATE(a9_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
> +
> +static struct clk_regmap a9_ao_xtal_in = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_OSCIN_CTRL,
> +		.bit_idx = 3,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ao_xtal_in",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "xtal",
> +		},
> +		.num_parents = 1,
> +		/*
> +		 * It may be ao_sys's parent clock, its child clocks mark
> +		 * CLK_IS_CRITICAL, So mark CLK_IS_CRITICAL for it.
> +		 */
> +		.flags = CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_xtal = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_OSCIN_CTRL,
> +		.mask = 0x1,
> +		.shift = 0,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ao_xtal",
> +		.ops = &clk_regmap_mux_ops,
> +		/* ext_32k is from external PAD, do not automatically reparent */
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .hw = &a9_ao_xtal_in.hw },
> +			{ .fw_name = "ext_32k", },
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_NO_REPARENT,
> +	},
> +};
> +
> +static struct clk_regmap a9_ao_sys = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_OSCIN_CTRL,
> +		.mask = 0x1,
> +		.shift = 1,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "ao_sys",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .hw = &a9_ao_xtal.hw },
> +			{ .fw_name = "sys", },
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_PARENT_GATE,
> +	},
> +};
> +
> +static const struct clk_parent_data a9_ao_pclk_parents = { .hw = &a9_ao_sys.hw };
> +
> +#define A9_AO_PCLK(_name, _bit, _flags)		       \
> +	MESON_PCLK(a9_ao_sys_##_name, AO_SYS_CLK0, _bit, \
> +		   &a9_ao_pclk_parents, _flags)
> +
> +/*
> + * A9 integrates a low-power microprocessor (Always-on CPU: AOCPU). Some AO sys
> + * clocks control the AOCPU modules. Mark the AOCPU-related clocks with
> + * CLK_IS_CRITICAL to avoid them being disabled and impacting AOCPU functionality.
> + * AOCPU-related clocks list:
> + * - clktree
> + * - rst_ctrl
> + * - pad
> + * - irq
> + * - pwrctrl
> + * - aocpu
> + * - sram
> + */
> +static A9_AO_PCLK(i2c3,		0,	0);
> +static A9_AO_PCLK(rtc_reg,	1,	0);
> +static A9_AO_PCLK(clktree,	2,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(rst_ctrl,	3,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(pad,		4,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(rtc_dig,	5,	0);
> +static A9_AO_PCLK(irq,		6,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(pwrctrl,	7,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(pwm_a,	8,	0);
> +static A9_AO_PCLK(pwm_b,	9,	0);
> +static A9_AO_PCLK(pwm_c,	10,	0);
> +static A9_AO_PCLK(pwm_d,	11,	0);
> +static A9_AO_PCLK(pwm_e,	12,	0);
> +static A9_AO_PCLK(pwm_f,	13,	0);
> +static A9_AO_PCLK(pwm_g,	14,	0);
> +static A9_AO_PCLK(i2c_a,	15,	0);
> +static A9_AO_PCLK(i2c_b,	16,	0);
> +static A9_AO_PCLK(i2c_c,	17,	0);
> +static A9_AO_PCLK(i2c_d,	18,	0);
> +static A9_AO_PCLK(sed,		19,	0);
> +static A9_AO_PCLK(ir_ctrl,	20,	0);
> +static A9_AO_PCLK(uart_b,	21,	0);
> +static A9_AO_PCLK(uart_c,	22,	0);
> +static A9_AO_PCLK(uart_d,	23,	0);
> +static A9_AO_PCLK(uart_e,	24,	0);
> +static A9_AO_PCLK(spisg_0,	25,	0);
> +static A9_AO_PCLK(rtc_secure,	26,	0);
> +static A9_AO_PCLK(cec,		27,	0);
> +static A9_AO_PCLK(aocpu,	28,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(sram,		29,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(spisg_1,	30,	0);
> +static A9_AO_PCLK(spisg_2,	31,	0);
> +
> +static const struct clk_parent_data a9_ao_pwm_parents[] = {
> +	{ .hw = &a9_ao_xtal.hw },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv3", }
> +};
> +
> +static A9_COMP_SEL(ao_pwm_a, AO_PWM_CLK_A_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_a, AO_PWM_CLK_A_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_a, AO_PWM_CLK_A_CTRL, 8);
> +
> +static A9_COMP_SEL(ao_pwm_b, AO_PWM_CLK_B_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_b, AO_PWM_CLK_B_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_b, AO_PWM_CLK_A_CTRL, 8);

Should this be AO_PWM_CLK_B_CTRL ?

> +
> +static A9_COMP_SEL(ao_pwm_c, AO_PWM_CLK_C_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_c, AO_PWM_CLK_C_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_c, AO_PWM_CLK_C_CTRL, 8);
> +
> +static A9_COMP_SEL(ao_pwm_d, AO_PWM_CLK_D_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_d, AO_PWM_CLK_D_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_d, AO_PWM_CLK_D_CTRL, 8);
> +
> +static A9_COMP_SEL(ao_pwm_e, AO_PWM_CLK_E_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_e, AO_PWM_CLK_E_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_e, AO_PWM_CLK_E_CTRL, 8);
> +
> +static A9_COMP_SEL(ao_pwm_f, AO_PWM_CLK_F_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_f, AO_PWM_CLK_F_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_f, AO_PWM_CLK_F_CTRL, 8);
> +
> +static A9_COMP_SEL(ao_pwm_g, AO_PWM_CLK_G_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(ao_pwm_g, AO_PWM_CLK_G_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_g, AO_PWM_CLK_G_CTRL, 8);
> +
> +static struct clk_regmap a9_ao_rtc_dualdiv_in = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_RTC_BY_OSCIN_CTRL0,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ao_rtc_duandiv_in",

s/duandiv/dualdiv/ ?

Brian


