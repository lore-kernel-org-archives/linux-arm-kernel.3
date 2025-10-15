Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27ECCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbGZO2JzBM3C8yY+OgT+lQXCHpnKxv2MA/NXQz9rs8k=; b=KNpkQRbZsXc6CjKwMryk8HYqXX
	OgBYcgSafjWeq5IUAmm57J+2EQQejrpi/yGqJZos1xohwuCl7erwBtpoa80Bv7yN2vUNFCmdjiCiz
	rL+E2q62JH9kB4zlWhOsL3BgbjSQ7DRK06Wys4SaWkKxhlmzsRplU7T4yPjDGGlOgE1Y8Agget7at
	MtW01734xXV6I6h8KiMAsSeobfaN13vezWzVT83IEY2kGzQnuhShWDFh/2en/kbbS9O3tmuVv7o0t
	lGk5plfafiXJ5WkzGw+iC6DUipgq1U3jbGrHo3IjjSMMJc+yiquSA9W164IpICAK+dR/0gojqRIuD
	l2YWCj8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96gs-00000002fRz-3OJC;
	Wed, 15 Oct 2025 18:57:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96gr-00000002fRo-13hg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fbGZO2JzBM3C8yY+OgT+lQXCHpnKxv2MA/NXQz9rs8k=; b=dZVzg0crOxMkFyQAyB8PSBlIYw
	f13WcOO8gZBCRkekvKDW7W9tatgR1svLOUZg3UwrtKKrFrF7ZnQ2eXLA+HfOKNN6KbcKoJLNgi/XF
	qVGThU08zz36IUWkTWF5FkdnzMbiHTa/xoAaLqlGVBgq9wOnKsBb2WF1S34cjRsJKisq++QTPCiZH
	0bUJrk0uxGALr9IE5JLlxwarfcUXNyBUP2V13yQBFvnKMVaF6NqW3r9sloYNLwAbJI6+RejWCw52p
	86Yf7M0TK1gIzQONWAW3lQjXkOvIFnZNeIKP6MlE2rVOJmLywHbgMtLUullG92FeoqifTvAp8ggd4
	V6o3RkIA==;
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96gc-000000069Wj-2wqK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:57:32 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-582067563fcso1147511e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 11:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760554640; x=1761159440; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbGZO2JzBM3C8yY+OgT+lQXCHpnKxv2MA/NXQz9rs8k=;
        b=ql5QTMaEM05yN+pk5jQWNUdPgY/dUbAFMzs2o5TATSwQytWuaIPx8AJA01NzIvclHI
         T3ynCxZ98OEWHoGg5UGrQDMGMW+suyWJ2R9Zl8SL1ao3c573cGjRHByhYPD4BzhOME6+
         t/P+MNvuILIm5AqZ5nNWiSlIUX2Nycq7lEpEkevwcqH1bwNwV2t5X1MF/P4rICm/7sPb
         0m4QqaaPLW/7fP1YpExHCUcoYWzwkmJpG7nyukJbhcys3/Fv6IWGhW4DdK8jnAooXBYm
         5GJJr1VUyrS6AJDoRyLTZ92P7/aGqQoYzp45Sd3RYYo3ooHGUZRN/wAAIsYYN66h912u
         7atQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760554640; x=1761159440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbGZO2JzBM3C8yY+OgT+lQXCHpnKxv2MA/NXQz9rs8k=;
        b=MnLCFq/mzxXU03+68TjZ0X4JY11SwgM1wUEhiQoQOZrafCHleYrCuc8h0vtm+8jS82
         uqBcS/XI/vpDIoV7wWuBYx/Oli/2KEf884LzuDwMDHGFXV2cHkHGpPl8UjdoZF4uI53q
         DNjX8XYdVSP6+zk1cGOeJhQ16w66laLloQRp4MG4dRn82wG24+nVZtIYzBfYM3xS4jf3
         3WVqOtCp1enxriHtVwkH3tbBSvXa7RNEAB13abUiLQJfEYi6AguCLLD0tzUVOCVmrATl
         MXbbWryQ40ZXLnSlWXEqL0Iz3rPBhKxtFKsR48an6zxcOrkTpeedl+PqedHqFmQsJT5C
         n4iQ==
X-Gm-Message-State: AOJu0Yw3tpKmXxls8OxsiDDPUDtM1ZeOrbBuMjTJcKeXNUoAuL0cgbCO
	89QVfnpmrwA5LDw1icKx25y4gYoMzC13WCgM10/IFm00xMTekR7PTXLjmIHPLMeZ3ns=
X-Gm-Gg: ASbGnctyo7ev91bo+X3pdvLmNmW3OxlpWuCzr+RVWQPrPT+3iXVWX3qd0KDt7Bfdxoh
	t18sHB5cSCNAeLN/4og5WCDr8gmxPHXd4Nl75WiVBDME+D5ds3RjshYroQR3U6XTGqLZdIjwahu
	gdEk2zus+Y5GhGAWD+iFlTGKKnin6Df2WxYTe/LH3vl5wt/Rpesj7U3DetAuPykH1xB8uL2im2W
	vZiS+amzRA8GWZ+NjzVMx3oyOugE+8iGmLkDBki8fhv3qY80Lqh7BgY2Rf5hDbCo3T6BETFDQog
	1EEwCbNFDDG+iP2cCROROvMfeVEQWkQsxOX7gcWCkJWDAsxFqkCNc8qMCldgayDE9BYuQVe/fO6
	3uJNJk+ivBREb8x9LJfZfOBWZmba4QUwIrq2XW0NdNKvFIm4tQNPKQwE1D6XECV79fhy6itlqsX
	Zte6N8LDhdrQO2D8+DO3StwJL8GKsTN0aYQcxU5tqyyxh1cKgLD6wCzJFQrZnv6Bw4+C/xoA==
X-Google-Smtp-Source: AGHT+IFyiRTaSwsEIiGfhDM9ts2EzTtk0FkdwXLTAfK+ZuWckcwevLUv7QKNU/w7vv2dJ6g6w2mcFg==
X-Received: by 2002:a05:6512:2c03:b0:585:229a:22 with SMTP id 2adb3069b0e04-5906d8b20e0mr4959112e87.3.1760554639869;
        Wed, 15 Oct 2025 11:57:19 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f8c85sm6423982e87.32.2025.10.15.11.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 11:57:18 -0700 (PDT)
Message-ID: <90cb8d1b-ebed-434e-9efd-9357e10a6ee0@linaro.org>
Date: Wed, 15 Oct 2025 21:57:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
Content-Language: ru-RU
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 quic_nihalkum@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_195725_163009_435235E6 
X-CRM114-Status: GOOD (  14.63  )
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

On 10/15/25 16:13, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains 3 Camera Control Interface (CCI). Compared
> to lemans, the key difference is in SDA/SCL GPIO assignments and number
> of CCIs.
> 
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 303 ++++++++++++++++++++++++++
>   1 file changed, 303 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 75fafbcea845..8f2b5f40ce14 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -4769,6 +4769,117 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac13000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
> +			pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";

Please remove empty lines between individual properties above and in two
other introduced device tree nodes.

> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac14000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac14000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>;
> +			clock-names = "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
> +			pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci1_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci2: cci@ac15000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac15000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 651 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_2_CLK>;
> +			clock-names = "cpas_ahb",
> +				      "cci";
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
> +			pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci2_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci2_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>   		camss: isp@ac78000 {
>   			compatible = "qcom,qcs8300-camss";
>   
> @@ -5063,6 +5174,198 @@ tlmm: pinctrl@f100000 {
>   			#interrupt-cells = <2>;
>   			wakeup-parent = <&pdc>;
>   
> +			cci0_i2c0_default: cci0-0-default-state {

I'd suggest to rename cciX_i2cY_* to cciX_Y_* to shorten the labels,
also it will match device tree nodes. Here "i2c" suffix brings no
valuable information.

Please reference to lemans.dtsi and sm8550.dtsi examples.

> +				sda-pins {
> +					pins = "gpio57";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio58";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci0_i2c0_sleep: cci0-0-sleep-state {
> +				sda-pins {
> +					pins = "gpio57";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio58";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci0_i2c1_default: cci0-1-default-state {
> +				sda-pins {
> +					pins = "gpio29";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio30";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci0_i2c1_sleep: cci0-1-sleep-state {
> +				sda-pins {
> +					pins = "gpio29";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio30";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_i2c0_default: cci1-0-default-state {
> +				sda-pins {
> +					pins = "gpio59";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio60";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci1_i2c0_sleep: cci1-0-sleep-state {
> +				sda-pins {
> +					pins = "gpio59";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio60";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_i2c1_default: cci1-1-default-state {
> +				sda-pins {
> +					pins = "gpio31";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio32";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci1_i2c1_sleep: cci1-1-sleep-state {
> +				sda-pins {
> +					pins = "gpio31";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio32";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci2_i2c0_default: cci2-0-default-state {
> +				sda-pins {
> +					pins = "gpio61";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio62";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci2_i2c0_sleep: cci2-0-sleep-state {
> +				sda-pins {
> +					pins = "gpio61";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio62";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci2_i2c1_default: cci2-1-default-state {
> +				sda-pins {
> +					pins = "gpio54";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio55";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;
> +				};
> +			};
> +
> +			cci2_i2c1_sleep: cci2-1-sleep-state {
> +				sda-pins {
> +					pins = "gpio54";
> +					function = "cci_i2c_sda";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				scl-pins {
> +					pins = "gpio55";
> +					function = "cci_i2c_scl";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>   			hs0_mi2s_active: hs0-mi2s-active-state {
>   				pins = "gpio106", "gpio107", "gpio108", "gpio109";
>   				function = "hs0_mi2s";

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

