Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EB3C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 07:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VG5l7SfPcKK6/6t3G2WmFhWSimMvFLN8Yd0KqXyORW4=; b=fNWk0m6ZRFGIOn5T2c3ZeNk5py
	NZriWWnnwi7q+IpCpXYdy+VN9ebYHOqlA6nN1yQ2NWrxI/8AtbASGjRex2AG6OIQf4iPcpjTpDoiW
	14vcwETlsodcHQzHfcqCXslAXsFQfYhxLrjPifsOurzSJDV373i5JDuwRUHYAyJcfKnwwrAIm3Bde
	HAhUcvloQIXpcP66fZAHlz3UTcrusrh7Kf+jBY/aww1sa5gWog+SyFvJ1nTnMV8Nw+kmC28d/USLI
	rb7n0J/p318PtbsaQvPovLqY+WfvTD2aERQK4IoA1eLLlEPAnCP4CPug1UDWnDDgYvHPKlqz0LWbB
	Lg8NeSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terLl-0000000El6o-3vAN;
	Mon, 03 Feb 2025 07:58:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1terKO-0000000Ekj0-37Wy;
	Mon, 03 Feb 2025 07:57:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF5E4A40C61;
	Mon,  3 Feb 2025 07:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AE8C4CEE2;
	Mon,  3 Feb 2025 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738569427;
	bh=5kJGuiN/HJ5xJyJ8CV/kCat9j7iBCMcYyia9cYykokw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mH1VjjzFMznyc23SuohffVCndcU3q/YdzYR/SqCthoRVEnF6c5vo/uyAJD4itxzmg
	 AN8S1mOgDCwqjsS1IblK7xZE+IbZ4isReC2oRPp4S5ECn9tVDV+kuLpbVk+jDHR1q8
	 PDXYM8hmJ6B9vMirBDkMETCUHP9yIYAeJoOFyX7yKNhKMaZL2zHqa7N0j1SnfP0TUo
	 Ay1dvF6uilNs/NFgm8T705/fLAp51TEyS4Nay6Jxl6fvxUXl54ekqsNnmhaNbif2PH
	 /fB60l1Zix7lnVrxmUUwFAJaFNVoMb6/foIbVFBeXGj7VlsV9cx8t4u4MVzmEhPcTk
	 gV3AAAwX7rxZA==
Date: Mon, 3 Feb 2025 08:57:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Vivek Gautam <gautam.vivek@samsung.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>, Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 03/33] dt-bindings: clock: document exynos7870 clock
 driver CMU bindings
Message-ID: <20250203-congenial-transparent-horse-cc5d4b@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250202190924.15036-1-kauschluss@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202190924.15036-1-kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_235708_912472_032E1B25 
X-CRM114-Status: GOOD (  10.09  )
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

On Mon, Feb 03, 2025 at 12:39:24AM +0530, Kaustabh Chakraborty wrote:

Subject - drop driver. Bindings are about hardware. This applies to all
your bindings patches

> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: gout_mif_cmu_mfcmscl_mfc
> +            - const: gout_mif_cmu_mfcmscl_mscl
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos7870-cmu-peri
> +

Drop blank line

> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_PERI bus clock (from CMU_MIF)
> +            - description: SPI0 clock (from CMU_MIF)
> +            - description: SPI1 clock (from CMU_MIF)
> +            - description: SPI2 clock (from CMU_MIF)
> +            - description: SPI3 clock (from CMU_MIF)
> +            - description: SPI4 clock (from CMU_MIF)
> +            - description: UART0 clock (from CMU_MIF)
> +            - description: UART1 clock (from CMU_MIF)
> +            - description: UART2 clock (from CMU_MIF)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: gout_mif_cmu_peri_bus
> +            - const: gout_mif_cmu_peri_spi0
> +            - const: gout_mif_cmu_peri_spi1
> +            - const: gout_mif_cmu_peri_spi2
> +            - const: gout_mif_cmu_peri_spi3
> +            - const: gout_mif_cmu_peri_spi4
> +            - const: gout_mif_cmu_peri_uart0
> +            - const: gout_mif_cmu_peri_uart1
> +            - const: gout_mif_cmu_peri_uart2
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - reg

required block is just after properties.

> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock controller node for CMU_PERI

Drop

> +  - |
> +    #include <dt-bindings/clock/exynos7870.h>
> +
> +    cmu_peri: clock-controller@101F0000 {

Lowercase hex

> +      compatible = "samsung,exynos7870-cmu-peri";
> +      reg = <0x101f0000 0x1000>;
> +      #clock-cells = <1>;
> +
> +      clock-names = "oscclk",
> +                    "gout_mif_cmu_peri_bus",
> +                    "gout_mif_cmu_peri_spi0",
> +                    "gout_mif_cmu_peri_spi1",
> +                    "gout_mif_cmu_peri_spi2",
> +                    "gout_mif_cmu_peri_spi3",
> +                    "gout_mif_cmu_peri_spi4",
> +                    "gout_mif_cmu_peri_uart0",
> +                    "gout_mif_cmu_peri_uart1",
> +                    "gout_mif_cmu_peri_uart2";
> +      clocks = <&oscclk>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_BUS>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI0>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI1>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI2>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI3>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI4>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART0>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART1>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART2>;
> +    };
> +
> +...
> -- 
> 2.48.1
> 

