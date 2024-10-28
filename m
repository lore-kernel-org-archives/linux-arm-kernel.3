Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6C9D3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1txbax2anf/FU/2wUye/OvBFVJa+xv11X9TALtaA18=; b=v3dgR8dh1HFmzy+mKdc7eOrPhd
	i1ZrQdlOMb33psd6bxTdD9QMVHsOKKW4kQyA/lwKJ4X6eqPBVJnLNHKRc5LFXznNrGAbS07zYZWxr
	WoWz7hjKvl9m/ZeweX66KxBbaTALKD9VIeFZ7D87zkLvHsiaIL4vJe6589YZg1/rJihnamPtiknGh
	JPeX+YJd6KX+rXcQgjotOhVnE7GV+qL6ZyNtWlE/UJIN/7GDRymAvrmSvVcBl1xYTt0BjsGQ9ImYH
	weAbOntuuSeJzQ+LDcYxpxS5nDcDF6avR4Yz65gj2MQs4hSMM6dUxdOxJHSBQWWsNAW3BZgg6rjzl
	lvPTnorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SDu-0000000BPev-2bnE;
	Mon, 28 Oct 2024 16:04:06 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RqB-0000000BLIt-3ZL1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:39:37 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so6902150e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730129973; x=1730734773; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1txbax2anf/FU/2wUye/OvBFVJa+xv11X9TALtaA18=;
        b=Xkxi7Ut7hKqswXRrDnBO0zheBWnIQIwexyfgwMS/RErblpA8ZnGsFwWuEzkTtgme4g
         tTSG7nZxQwezym2/gbfppHOqg9saJ6JyfZ2H853lJZSzFbrNPnUfftEo+Mnu2rur/xnI
         bjjfxAIYyGTkImQmjKuVjrUwWYPedBz4av3Pod3f6q018E7Us64krcnaLN4kcpIn4Nmn
         OeLUC6a1zj6eIlmA7J6JymvcDaB2qx7mIGwTdH+k0ygn1aeqHjJEyhCzK/4mN37jUlRM
         DMiNzxy8dPKwWNt31e6wX53FxzZJ3qDMccsAN9fGytNT1S8XGHEDOWZ8oO8gJh5TvS5+
         gBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730129973; x=1730734773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1txbax2anf/FU/2wUye/OvBFVJa+xv11X9TALtaA18=;
        b=HcQCGm9hpgrX7iSYMxJTPEjbUuuRHQi61O7TKsOWAI8dBhXz344K+73iVpeQ7SiT9S
         6LHPtvTsrOim6VpCGjDkDzCqtSpQaTO7JsuFdMcSt4K0wPYjQObLp3vkmmIFqjy/QjX1
         q/VrCiMFXVMz+E8giirerVMNCQhdEUAZpg6UEMANYGHBCQb1LQiLpQt1VuPW9XpKuFG1
         hFrxX+smMyLZkEQvpqxWLJtZ48AsV3XrIqb+rehxlaW9X4rI4OCjKBSdVAYHZNEuPAcC
         /BXWK6ZOrWBRaaKQzWZTXJX6UsmR7IQmMkVH1CzpSO9Wed7HKoXQEZyJNxnUsDkf2D8f
         6Gow==
X-Forwarded-Encrypted: i=1; AJvYcCX6B//cv9nkuuzoIrsnyWGsvC/hbDDjR3/OhAK8ON8HD12xFyAtaLisFrwzhtfMEC1R/ALlt05vjpUrFm/7RnPv@lists.infradead.org
X-Gm-Message-State: AOJu0YwYW4gJ7AxGCoG3VxQVSvZ/Me7QuTaV1VdUYlbmdTBkvQzRTFtM
	6RXHbKpKxXyD7N/6deYP1aJ+zYE5rMm47B+rfbAWNN++D5zB4PDmLF3xNx5rC/c=
X-Google-Smtp-Source: AGHT+IHyyRIHr8OLjFlezCBWy1i7uaYCwcnuB6xG6+YWBdjYuluL2KW9ciORdLVKXl6EVMW5IHAxGA==
X-Received: by 2002:a05:6512:3049:b0:53b:1fc6:3d18 with SMTP id 2adb3069b0e04-53b348da845mr5494533e87.26.1730129972972;
        Mon, 28 Oct 2024 08:39:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a52fsm1092723e87.27.2024.10.28.08.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 08:39:31 -0700 (PDT)
Date: Mon, 28 Oct 2024 17:39:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
Message-ID: <crcbzpxjnbceilqccbwr7uyak6z6zdwr7mhfcyaw6vvpcce6ko@zrojbtqi4st4>
References: <20241028-qcom_ipq_cmnpll-v5-0-339994b0388d@quicinc.com>
 <20241028-qcom_ipq_cmnpll-v5-4-339994b0388d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-qcom_ipq_cmnpll-v5-4-339994b0388d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_083935_924780_A77663A0 
X-CRM114-Status: GOOD (  24.58  )
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

On Mon, Oct 28, 2024 at 10:04:11PM +0800, Luo Jie wrote:
> The CMN PLL clock controller allows selection of an input clock rate
> from a defined set of input clock rates. It in-turn supplies fixed
> rate output clocks to the hardware blocks that provide the ethernet
> functions such as PPE (Packet Process Engine) and connected switch or
> PHY, and to GCC.
> 
> The reference clock of CMN PLL is routed from XO to the CMN PLL through
> the internal WiFi block.
> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)-->48 MHZ to CMN PLL.
> 
> The reference input clock from WiFi to CMN PLL is fully controlled by
> the bootstrap pins which select the XO frequency (48 MHZ or 96 MHZ).
> Based on this frequency, the divider in the internal Wi-Fi block is
> automatically configured by hardware (1 for 48 MHZ, 2 for 96 MHZ), to
> ensure output clock to CMN PLL is 48 MHZ.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 16 ++++++++++++++-
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 26 +++++++++++++++++++++++-
>  2 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> index 91e104b0f865..f026c2a9d0c0 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -3,7 +3,7 @@
>   * IPQ9574 RDP board common device tree source
>   *
>   * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  /dts-v1/;
> @@ -164,6 +164,20 @@ &usb3 {
>  	status = "okay";
>  };
>  
> +/*
> + * The bootstrap pins for the board select the XO clock frequency,
> + * which automatically enables the right dividers to ensure the
> + * reference clock output to CMNPLL is 48 MHZ.
> + */
> +&cmn_pll_ref_clk {
> +	clock-div = <1>;
> +	clock-mult = <1>;
> +};
> +
>  &xo_board_clk {
>  	clock-frequency = <24000000>;
>  };
> +
> +&xo_clk {
> +	clock-frequency = <48000000>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 14c7b3a78442..ad9cdb1f76db 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -3,10 +3,11 @@
>   * IPQ9574 SoC device tree source
>   *
>   * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <dt-bindings/clock/qcom,apss-ipq.h>
> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
>  #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>  #include <dt-bindings/interconnect/qcom,ipq9574.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -19,6 +20,12 @@ / {
>  	#size-cells = <2>;
>  
>  	clocks {
> +		cmn_pll_ref_clk: cmn-pll-ref-clk {
> +			compatible = "fixed-factor-clock";
> +			clocks = <&xo_clk>;
> +			#clock-cells = <0>;
> +		};
> +
>  		sleep_clk: sleep-clk {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
> @@ -28,6 +35,11 @@ xo_board_clk: xo-board-clk {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  		};
> +
> +		xo_clk: xo-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};

What is the difference between xo_clk and xo_board_clk? Are there two
different crystals?

>  	};
>  
>  	cpus {

-- 
With best wishes
Dmitry

