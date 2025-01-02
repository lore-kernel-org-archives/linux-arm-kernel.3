Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C0EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 21:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9zQ6BfG3c9Wlj7b/dVFQJvkgkqVpLbCApoy2Cv2VU4=; b=aRPNguye3lk+SXmPBfVVf45xps
	LNEeZmyo/uqE1tkQv0xCRPbDYbiHReLb+n71oaB/FhlJNRTjlh7KwSJenx51Q/4dhilbtggRAzL2S
	e4V9NZn/Ok3fU3cO176/l9y6XWOc6/i5zg9UwPDnvxlRQRUP6aK/Q8NfjRZDQiJnVFCdrjrs/43mn
	FCapRysd9ZNRI3Ov2EmJcHBSAzlilkIhXVX7JgbOVTtsK0Hu79dteOw5kBU6Dio0vMsJhxp6jr5uh
	W6aF6RV3BXSupaRzyf73Kz4fijPWV31TOupVOzmWhh+6NBNv/hLYE/dG85IC/ck0MhlUYdQR6LBO0
	Q0krIZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSmr-0000000BVsU-0jfe;
	Thu, 02 Jan 2025 21:31:25 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSlb-0000000BVgf-3OTU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 21:30:08 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54252789365so4968655e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 13:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735853405; x=1736458205; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9zQ6BfG3c9Wlj7b/dVFQJvkgkqVpLbCApoy2Cv2VU4=;
        b=BcMan4cCukHskC63jYuRxx8+25x2nM55V778yxxkKAaKYvBcOSqCO2FpbD8jGk82i3
         Qi9rC2PX3csGxnnAY+Dyewxbve9GxBfkHbNODdHCcWzc0q/6JalPcF7sUOVP6xzMk8vv
         gTtLcMvE9C4hbjx+W1yFiQHIPPbZirvxOkxWV32CKHr8zNwTiikhuCgyumJ49pUJ1KBv
         6WASSQCaS+bTgtvOsuUHkRTpxcDR0G146Ccqup5lJnRBlLZVbgIZ7/JRAhuMUML0+4P+
         ULhgn08/wEsQsMvpJCfGw9SZCrzXunaLgVM8uOuG+69MoFceV6wIlJcBghl8QBNR4EvI
         cQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735853405; x=1736458205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9zQ6BfG3c9Wlj7b/dVFQJvkgkqVpLbCApoy2Cv2VU4=;
        b=nukt11Tlq3B4YoUQb0H6/Yxh/QtHlY2PukWkwFNN90oyaRNRr+gp2qbmPkscwNhASI
         FkWf36h8ZxvMBsT4xElYmzl8qqeZjRufZsI8DGAQx8AqIh/MiT2xO4WOIXLxPPGAwItG
         OxOnDDe8d2G7xmru5cps6d6t1aFFe67pFJKEcNFwH+6E7tZgD9FT1GFn3NQghDXbvkrn
         Tcsbm4+FcqGUxTXqy8jq92VjTURKfImDqBiD/q2MIHMYlxCymC0tkjDpRUeWkY+PQ+3A
         2DgZ5XIvlAX9JDc/IFuUOC7vNzndIgJmY9WjHk+toTM1rxfcXtpHwfEPbJD0e2BUcG9/
         03ag==
X-Forwarded-Encrypted: i=1; AJvYcCVO76m5L/sx+tNiUmmpSIX81xnMbKYXPPIFMRKi2q7+ZES92KuKitbz+fQvM74iSxKeUaYI+XO/aiikAhZpGLGl@lists.infradead.org
X-Gm-Message-State: AOJu0YxZwAfdKjzFMsILOI+d6YiEQa88bSIv4G4eYtkbawlOY3vcDWSq
	5XywRd6xxBG9EQNLy2l5mVX34ilCLVvhoPiPCB+cxw3u7Ux7RI17
X-Gm-Gg: ASbGncujHrPIEX7/W/fk3Nq+mJbwiqScfxBAmVWiAiVwRrzLSAJwQJx8l0B3Kz5W8Ab
	TN1SB25emo++qAB4dkcI5JwUM5x8hxp8k/blu7Hn8WEANRQAHNU73ggvPlt3P/YviqWCEQhzAz7
	3MDcRrJPCccUxJCJiVip9z9Hfh9Ig0SiZoTv9c0uheVrypcPzuRKqYVvTYG01N+hURbfx2TuZDY
	Zo53nc1RkguxtP5XsmYx3th0luNRspLfZNQvB7Lwplxmbbg9sXGIT8AMAw=
X-Google-Smtp-Source: AGHT+IES1THUTYBi5UphHsm2PEf2/oPPiDWnuTb10lOxgKrUggS6Mf74jKiF5I5s+fQbGGOmg3NojA==
X-Received: by 2002:a05:6512:1241:b0:53f:f074:801c with SMTP id 2adb3069b0e04-5422958eaaemr15433404e87.41.1735853404760;
        Thu, 02 Jan 2025 13:30:04 -0800 (PST)
Received: from [10.8.0.2] ([130.61.158.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542236001e1sm4007494e87.88.2025.01.02.13.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 13:30:04 -0800 (PST)
Message-ID: <1fcfc835-64aa-48d0-87db-8de14913f3a4@gmail.com>
Date: Thu, 2 Jan 2025 23:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] arm64: dts: exynos: exynos8895-dreamlte: enable
 support for microSD storage
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102205846.223955-6-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <20250102205846.223955-6-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_133007_872453_DFE3887C 
X-CRM114-Status: GOOD (  22.13  )
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

Hi Ivaylo,

On 1/2/25 10:58 PM, Ivaylo Ivanov wrote:
> Enable MMC for the Samsung Galaxy S8, used as external microSD card
> storage. Since the main PMIC is currently not supported, assume the
> required regulators are enabled by the previous bootloader.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>   .../boot/dts/exynos/exynos8895-dreamlte.dts   | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
> index 3a376ab2b..11aed89a3 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
> @@ -16,6 +16,10 @@ / {
>   	compatible = "samsung,dreamlte", "samsung,exynos8895";
>   	chassis-type = "handset";
>   
> +	aliases {
> +		mmc0 = &mmc;
> +	};
> +
>   	chosen {
>   		#address-cells = <2>;
>   		#size-cells = <1>;
> @@ -89,12 +93,47 @@ wink-key {
>   			wakeup-source;
>   		};
>   	};
> +
> +	reg_sd_vmmc: regulator-1 {
> +		compatible = "regulator-fixed";
> +		gpio = <&gpb1 1 GPIO_ACTIVE_HIGH>;
> +		regulator-name = "sdcard-vmmc";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +	};

This regulator was described in downstream, but it doesn't look like it 
exists on schematics. It could be different revisions having different 
hardware, of course, but for me it looks like it's redundant. (on 
schematics VMMC (Vdd for the card) is powered by S2MPS17 LDO29, and 
VQMMC (logic level) is powered by S2MPS17 LDO2).

I believe we should check if this hw exists by perhaps checking if 
manually changing GPIO output value changes the card behavior, and if it 
doesn't, it should be safe to drop it.

>   };
>   
>   &oscclk {
>   	clock-frequency = <26000000>;
>   };
>   
> +&mmc {
> +	assigned-clocks = <&cmu_top CLK_MOUT_CMU_FSYS1_MMC_CARD>;
> +	assigned-clock-parents = <&cmu_top CLK_FOUT_SHARED4_PLL>;
To clarify, as proven by testing, this exists because with default (on 
reset) mux MOUT_CMU_FSYS1_MMC_CARD configuration, the card doesn't show 
up, so the parent is manually set to SHARED4 PLL. With this in mind, 
maybe it makes more sense to put this into SoC dtsi, since it can't 
possibly be board-specific?
> +
> +	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus1 &sd2_bus4>;
> +	pinctrl-names = "default";
> +
> +	bus-width = <4>;
> +	card-detect-delay = <200>;
> +	cd-gpios = <&gpa1 5 GPIO_ACTIVE_LOW>;
Missing pinctrl for card detect pin?
> +	clock-frequency = <50000000>;
> +	disable-wp;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +
> +	/* TODO: Update once PMIC is implemented */
> +	vmmc-supply = <&reg_sd_vmmc>;
> +
> +	samsung,dw-mshc-ciu-div = <3>;
> +	samsung,dw-mshc-ddr-timing = <1 2>;
> +	samsung,dw-mshc-sdr-timing = <0 3>;
> +
> +	status = "okay";
> +};
> +
>   &pinctrl_alive {
>   	key_power: key-power-pins {
>   		samsung,pins = "gpa2-4";


- Markuss


