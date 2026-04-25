Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2ECFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 09:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wapJKygwc4klFKfqa2WJNsS/+mhmurZxaEHjleDcRwM=; b=1b8Io2yLUdkFFUfkIIRb6U7y7W
	0eGquJuNEknGYuB/JkVT6+0rxqzu7okMon1rBk2KGvQm6AICOzrFiLbT4mDnx92rZKyus7n1DVLFN
	pj1laX52xlgUbqNBsuv0cE3HsLjLGgV3JeGpsgqgWELtuOw/C7IGzPVH4luX707EOtSqJQKZsqXbo
	YSS7QbXF7WB2iI64zdHlLMddC+GTh85ktsFOncTSUqkUL+JgLowAck3en+znofXVEhbT8XTfiTNSx
	jn2IHcyney9RzE+2AnvEzERP4ZvakYlBsHx2Ici6IEaQEcMOjJqSBLlhSJ61xOmh5jJouFeA0D8Cn
	bmOKkjzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZml-0000000EK7f-2Geb;
	Sat, 25 Apr 2026 09:58:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZmk-0000000EK7Z-0hIe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 09:58:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52B7F60052;
	Sat, 25 Apr 2026 09:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CA4C2BCB0;
	Sat, 25 Apr 2026 09:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777111129;
	bh=aazaLXG8kSAJ5nNWCvS05sFQTG0KWyaoWFm3XFwT0qE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBUxTg39e9CZyczDYRqwGcgbPCh/BoMhGud0fopjSmq4R2Afd5tLXFscbvNuxc3hd
	 1OV0C6BGTSDPHkWYJE7ERJAfMnapL6dRWD2lqxi3XWY2MkyViqdc7WbG7H33RO0xlu
	 2zLYvjj5NMWbn3I75KSbOWy9V7HMIutompkR+h+pWBpA10Aoxae9TOmk4C+bTEMsPQ
	 Qy4rdeCl2uAWGDcJVxRGxJ0MhNKvLtlgGaR57v1jUrScs1SwIbwlPqeWqRaZJKSNYG
	 HIzrAWwdodtzkQlLWtI1zcwxZ2xccx/PO+CHK9smSdmYa2+U+K3MJaLJ4XeLzm/bXe
	 dh7MqIUdG1IPw==
Date: Sat, 25 Apr 2026 11:58:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Douglas Anderson <dianders@chromium.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH 5/5] ARM: dts: exynos: Add display support for
 exynos5250-manta
Message-ID: <20260425-eccentric-amiable-fossa-fa1cae@quoll>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
 <20260423-manta-display-v1-5-196f80c5673a@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423-manta-display-v1-5-196f80c5673a@timmermann.space>
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

On Thu, Apr 23, 2026 at 11:14:41PM +0200, Lukas Timmermann wrote:
> Adds the necessary entries for panel and backlight as
> well as the fimd controller.
> 
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  arch/arm/boot/dts/samsung/exynos5250-manta.dts | 99 ++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/samsung/exynos5250-manta.dts b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> index 76d3657eb22f..eb97a28ff4e3 100644
> --- a/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> +++ b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
> @@ -25,6 +25,29 @@ aliases {
>  		mmc1 = &mmc_1; /* WiFi */
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 0 1000000 0>;
> +
> +		brightness-levels = <2 255>; /* TODO */
> +		num-interpolated-steps = <254>; /* TODO */
> +		default-brightness-level = <102>; /* TODO */
> +		post-pwm-on-delay-ms = <97>; /* TODO */
> +
> +		power-supply = <&backlight_reg>;
> +		enable-gpios = <&gpg0 5 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&led_bl_reset &pwm0_out>;
> +		pinctrl-names = "default";
> +	};
> +
> +	backlight_reg: regulator-backlight {
> +		compatible = "regulator-fixed";
> +		regulator-name = "APS_EN_18V";
> +		pinctrl-0 = <&aps_en_18v>;
> +		pinctrl-names = "default";

No enable GPIO? No voltage?

> +	};
> +
>  	/* Voltage source unknown */
>  	bmp180_vdda_reg: regulator-bmp180-vdda {
>  		compatible = "regulator-fixed";
> @@ -105,6 +128,28 @@ multi-led {
>  		leds = <&status_red>, <&status_green>, <&status_blue>, <&status_white>;
>  	};
>  
> +	panel {
> +		compatible = "samsung,ltl101dl02-002";
> +
> +		backlight = <&backlight>;
> +		power-supply = <&panel_reg>;
> +		enable-gpios = <&gph1 7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&lcd_en>;
> +		pinctrl-names = "default";
> +		no-hpd;
> +
> +		port {
> +			panel: endpoint {
> +				remote-endpoint = <&dp_out>;
> +			};
> +		};
> +	};
> +
> +	panel_reg: regulator-panel {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LCD_EN";

That's incomplete. You should have at least voltage.

> +	};
> +
>  	pwrseq: mmc1-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  
> @@ -146,10 +191,36 @@ &cpu1 {
>  	cpu-supply = <&buck2_reg>;
>  };
>  
> +&dp {
> +	status = "okay";
> +
> +	samsung,color-space = <0>;
> +	samsung,color-depth = <1>;
> +	samsung,link-rate = <0x0a>;
> +	samsung,lane-count = <4>;
> +	samsung,dynamic-range = <0>;
> +	samsung,ycbcr-coeff = <0>;
> +
> +	ports {
> +		port {
> +			dp_out: endpoint {
> +				remote-endpoint = <&panel>;
> +			};
> +		};
> +	};
> +};
> +
>  &ehci {
>  	status = "disabled";
>  };
>  
> +&fimd {
> +	status = "okay";
> +
> +	assigned-clocks = <&clock CLK_MOUT_FIMD1>, <&clock CLK_MOUT_VPLL>;
> +	assigned-clock-parents = <&clock CLK_MOUT_VPLL>;
> +};
> +
>  &i2c_1 {
>  	status = "okay";
>  
> @@ -396,6 +467,12 @@ ldo25_reg: LDO25 {
>  	};
>  };
>  
> +&mali {
> +	status = "okay";
> +
> +	mali-supply = <&buck4_reg>;
> +};
> +
>  &mixer {
>  	status = "okay";
>  };
> @@ -489,6 +566,14 @@ wlan_irq: wlan-irq-pins {
>  };
>  
>  &pinctrl_1 {
> +	aps_en_18v: aps-en-18v-pins {
> +		samsung,pins = "gph1-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>; /* TODO */

TODO why? IOW, what are you missing here? Was this tested?

TODO note can stay, but I would prefer to see short comment explaining
why.


Best regards,
Krzysztof


