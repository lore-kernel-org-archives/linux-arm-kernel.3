Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA448C36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 22:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b51iP35KFG1CIl36iu8PXktEtqpi3MNuLw8E+xpgKP4=; b=ab3da1+bgB2wKApFIWFTFYFSlP
	abC9yTdnYCdVHGy7bhnMxBgQqefSeCX9vzXtlYq2Cz+CgIO1Ccew8gxkw09s0ffVxq+ThTs50Sedm
	Zto9mHo8Xi5ehVloml1OC11Yytu75M/JTGTvzuMhOJmB5ujSDxMDPljMoxM6/mTU37eLG2r26QFY1
	Q2quD+UAasqLKdfrtvruAP8wWhumwSz0R6Ax73SS3fkS0jI/BeidExvmDFs+eiScKwq9G9Feb0rJR
	FaqUFF9vEo5XyVgsW2T+a/5xYf6wVBG2f6kK+yprKhkOIvNyK/jbuvomias9+BNmTlic+uuwYeBp4
	1I4znAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvO5t-0000000DK2n-1YVx;
	Thu, 20 Mar 2025 22:10:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvO4A-0000000DJlz-3oAh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 22:08:44 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-390cf7458f5so999059f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 15:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742508521; x=1743113321; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b51iP35KFG1CIl36iu8PXktEtqpi3MNuLw8E+xpgKP4=;
        b=EvCMlVIW94Qz+kBu2jX6GxC18mIl4VDNbQjz6IMDl3nIO4fDCisb+XDJIXP+BZmd9i
         3wDt+6uyZoEO+9/HWh+LVBrCiJaBpAkguxdyTRfYWMj99BfRvHjOYLoVxQP3Ak/7+QCX
         LajHanwOmvDQvJAZ2GPlNDQBRtnosYaujw7NNgDQMRV0ODVRG+7xNMX+EjbRodbhqTHI
         otaPcBl/tRqy6C/Wuux+uzmVXP4iumT6iH68RcEQAlkUABtuV/qM+3aJyt++m0GC9k2s
         Ff2iLx0FQCZY/x+N+Qsj11d11HeVxGLSRQdCUm29XJUGjc6LOlbJ1jFbZWp+V2FQVfF4
         sLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742508521; x=1743113321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b51iP35KFG1CIl36iu8PXktEtqpi3MNuLw8E+xpgKP4=;
        b=SU4PJ/dtMsAGuG9CAeZwH+QNj7TjLG3DL+r8lkkrWSWWDve7R3TA+b1Sk5AxiAprFh
         sO4KZorKZcmFDm0mgoZK4WzLAV6kz0Mw/vqqK8Lvy59ZZdBX4viM1HLYaNQJHObij5r2
         VU0wx1tZOooIFqgNkFCIdwfntrpKiNn4QeeLU9DpkIEXzoL45aCNOBXRaCM2SiTzQkt+
         CaXuufmlckgtQr43vRHHYgNYdEqf+c+/q+a2GO4iMIrZAboBwdDIGmJIaAa4UuLWynai
         mz1fySWjm1X4OK3ShAA8CIIf7BsD3Uq/8db+jqFki6ZiHPvsCKK2Uioc8gux/TX+2LSK
         p8aw==
X-Forwarded-Encrypted: i=1; AJvYcCXCpO2w108mAn3kjWarZnQ1KGEfPU1t7l8XXU6qvbxK00Zj292pO93yn+o5+AeNXnugTOgDahXSvSsxLQAv91b1@lists.infradead.org
X-Gm-Message-State: AOJu0YzPCX+7Y1avvzuvNPFJoIzrPLAmhENIX6FF6zDyB/1vnS+GZ5s0
	s+1kThL84ubhEdh4QyZYhTtd9wsXswzeHRd0GGN07sfT3jeNRvc69u43D46QFKY=
X-Gm-Gg: ASbGncv2gs+cXK+kM+e9WrIug+RQCIOy9QnZoQWVoVH46DR24McKLCIEOJVIWUbojdX
	8gPByRG0tr9a1GnrgZSHzIzeIlj//1Eiv7smAaIUaOelwSNicqSC/65XUGM1P2oM1aQevvnbCdq
	gKHmt331+SDledC77K28l2GE8c82g38oTOvZw3B16BXtf2sQz/GhUGV6T4P6sl4uphu/7hKHQaB
	jjLUCdoJbWUa8XWsT/+ri1qZ32EhcQI62sQTxg389T263fquZF8g/kykZxiU+D58nQToTPamWB/
	f3krmOiqh72JQ0wjDMaLHP+hfASqQ3MALv45G8Mh5ewT/klIKL95jE+ha2vM9hLpsSZxMPsrF6T
	5NHfLARol1g==
X-Google-Smtp-Source: AGHT+IG6cZVwmLEZurTazZCr7atPJy2iNnHxLpGHe6xlII+3K7WFRsUslXpp2g67TeBOVTtPbGFAyQ==
X-Received: by 2002:a05:6000:400e:b0:391:2a9a:4796 with SMTP id ffacd0b85a97d-3997f901786mr1265282f8f.18.1742508521013;
        Thu, 20 Mar 2025 15:08:41 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a50c1sm692749f8f.38.2025.03.20.15.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 15:08:39 -0700 (PDT)
Message-ID: <54c588be-d630-4901-8885-a042b477f168@linaro.org>
Date: Thu, 20 Mar 2025 22:08:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100-qcp: Add power control
 and sideband signals for PCIe3
To: Wenbin Yao <quic_wenbyao@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
 sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <w7mbnqG7DHPCH6hVoSu4E2p8pV7Rw6uvurlK-CUxF7TYQ53fFyagxmLUCmCTfG0DOUgIQn7GdppXgBlq8Gyv9Q==@protonmail.internalid>
 <20250320055502.274849-4-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250320055502.274849-4-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_150842_952337_4B41BC2A 
X-CRM114-Status: GOOD (  16.11  )
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

On 20/03/2025 05:55, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add perst, wake and clkreq sideband signals and required regulators in
> PCIe3 controller and PHY device tree node. Describe the voltage rails of
> the x8 PCI slots for PCIe3 port.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 119 ++++++++++++++++++++++
>   1 file changed, 119 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> index 28086a2bc..9cd313802 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> @@ -318,6 +318,48 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
>   		regulator-boot-on;
>   	};
> 
> +	vreg_pcie_12v: regulator-pcie_12v {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_PCIE_12V";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +
> +		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pcie_x8_12v>;
> +	};
> +
> +	vreg_pcie_3v3_aux: regulator-pcie_3v3_aux {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_PCIE_3P3_AUX";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmc8380_3_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pm_sde7_aux_3p3_en>;
> +	};
> +
> +	vreg_pcie_3v3: regulator-pcie_3v3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_PCIE_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pmc8380_3_gpios 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pm_sde7_main_3p3_en>;
> +};
> +
>   	usb-1-ss0-sbu-mux {
>   		compatible = "onnn,fsusb42", "gpio-sbu-mux";
> 
> @@ -907,6 +949,60 @@ &mdss_dp3_phy {
>   	status = "okay";
>   };
> 
> +&pm8550ve_8_gpios {
> +	pcie_x8_12v: pcie-12v-default-state {
> +		pins = "gpio8";
> +		function = "normal";
> +		output-enable;
> +		output-high;
> +		bias-pull-down;
> +		power-source = <0>;
> +	};
> +};
> +
> +&pmc8380_3_gpios {
> +	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
> +		pins = "gpio8";
> +		function = "normal";
> +		output-enable;
> +		output-high;
> +		bias-pull-down;
> +		power-source = <0>;
> +	};
> +
> +	pm_sde7_main_3p3_en: pcie-main-3p3-default-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		output-enable;
> +		output-high;
> +		bias-pull-down;
> +		power-source = <0>;
> +	};
> +};
> +
> +&pcie3 {
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie3_default>;
> +	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&pcie3_phy {
> +	vdda-phy-supply = <&vreg_l3j_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +	vdda-qref-supply = <&vreg_l3c_0p8>;
> +
> +	status = "okay";
> +};
> +
> +&pcie3port {
> +	vpcie12v-supply = <&vreg_pcie_12v>;
> +	vpcie3v3-supply = <&vreg_pcie_3v3>;
> +	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
> +};
> +
>   &pcie4 {
>   	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
>   	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> @@ -1118,6 +1214,29 @@ nvme_reg_en: nvme-reg-en-state {
>   		bias-disable;
>   	};
> 
> +	pcie3_default: pcie3-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio144";
> +			function = "pcie3_clk";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio143";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		wake-n-pins {
> +		       pins = "gpio145";
> +		       function = "gpio";
> +		       drive-strength = <2>;
> +		       bias-pull-up;
> +		};
> +	};
> +
>   	pcie4_default: pcie4-default-state {
>   		clkreq-n-pins {
>   			pins = "gpio147";
> --
> 2.34.1
> 
> 

Recommend breaking this patch into at least two patches @ the and

-> Add power control
-> Add sideband signals

if your patch title requires an and its usually a good indicator of a 
place to break that patch into different parts.

---
bod

