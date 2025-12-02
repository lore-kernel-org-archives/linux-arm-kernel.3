Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA7AD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNSMC7M9xl88C1slHGyNkETiEDgHYTw4VftIhWKCaB8=; b=ARewmliVm0l8wWANXS1ns53Hgf
	KVrScxsfCeViJ2E/qz1SDHNHUuyaomRuTsUv1x1LOS6J8d5DgVlwiHkdptzUwjdnsOD6sm5ieYRJ/
	keyDBaCbWRCJdYH/zKXINuCKPdIkgTIyveRYcWzwSIuJMOpO/HdzQujq2tkPCeAKF5rauOG/nXjaY
	Yw8wyClrpUb9uYIMF4MVn5YUhhX8qsC3Xg5Sp+S2z1AevD4g8Lh3EI8Xb4Yu7qhYm5NeLEuNlx4fm
	hsEczd4z//YO3X3wIwnWRsb4UdtuxdTCpm53CMG7OIKm2H+olbZQMNsYxh8RDaFnL68PxHUXpfcpi
	Dz0XGDSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQuU-00000005TcI-1cfp;
	Tue, 02 Dec 2025 13:59:18 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQuR-00000005TbW-32Qj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:59:16 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-37bba981c5cso3793701fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 05:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764683953; x=1765288753; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNSMC7M9xl88C1slHGyNkETiEDgHYTw4VftIhWKCaB8=;
        b=Ezu2LHejVVZQxLhcM3xpy2sjeu3faiSEZDU+JuDHMyGT4smDZdcfpJQU4DFrGL+43t
         ftxmrw1wvFJwSfoYIMG2uipSTm0V28tLA4dZKUdezckUIJy0dphknhqzXYGRLoKK7vnb
         uqksJg+vAz/JRR5VUpb3ZkAlDzQtlKpmoExcTgvNp80IZ8iiK8MvR0yJomnIAm3f3keR
         bxnwQ/vjCjIxrgp3M7MTqD63Yw0E0c4C5qyOCJV2VOVl6Kyb0zZxEiW6I6jHTV0KoRJH
         Od93anC6stOUU78Gcpqvup0AxSFZ7V5jVaZBfOux0tG3KHTOkQTBIojmKywDAKXqrUXM
         Q0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764683953; x=1765288753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNSMC7M9xl88C1slHGyNkETiEDgHYTw4VftIhWKCaB8=;
        b=Hjs5lg3URldrnsfQglmPCbx7BrMNukOPxLUhKDpBBo4VQyi1Lmd4yy/Ju5eFfIVIss
         OG8ewKvlV/mK7MMeSDSa0JaxfVSf8I1vejX22BrJ55gQFDkXOfDbowNNARlXvCgkW6Ry
         3mYImClpmFrah8fj4mljK++BFqZfltP2+/ofo+Q6+uKXFPffrlpxFk0rUcpDDuJXRAFB
         cWPjh5V5ok+7LIMdMfJL1j4bS1PTx5rO1xXFU3y4t1Zq3P/q/4ssLxuR2M42BuvDzVVw
         fwvJrEW/rrS7SWvVoNXCeZcapaQPpD5nsyLNXKT/In9FnIhN7KIOmG3s2XTjx+5rhl/T
         3SdA==
X-Gm-Message-State: AOJu0YzgF1LrcvVrlmBJiK2vh58vMfDkj9n8GTiPBdppsU4/n6LwGaG3
	riKEhEyUfbnPJn//yDF2h6GOd3Vx9sJNDCzLSbmvlOBeZxNjytXKPHrtIB/mf1IvcPQ=
X-Gm-Gg: ASbGncsBVndiaHnYL4gnJjOMOYu3DkQX3hR6N8YZXo6bScRbqv25Jq1x4gpkmiCdJTl
	2v4u7dQN9ULD30B71KG7KAqGJu5fySdYwyuU2tvmABjWtmR4j3IdvfMXKemsKlMDv3tfUxQCMep
	c3V7DFxoX6uf/hykU9qagBb5fkUYb7Jn0iF2/sovmp+n7b68zoy+BNVPLMGq5jrazYqEev/Apnx
	OBDyTEZmFBnRI+d7Wwds3nBelMrCmsO7PgWEqsFFRUR1Il1PpQHEcUvw+Y/wW1wOX62FmhEDUG4
	0QJegoirp7/h/6iPYKbsFY+J3CtpdL1rjdVEhVQ/EKFOMYzRlMXt8k+3kp6yhD7MV/nJsVef7ML
	EIgoUItadNnkI8MIHJk88n4YTAcV50LvONCu+YoHYOe2umTKgsdMZoye1YywJfR/k/CwYkj50gT
	fS18IZBzQFXkt5cDFMbAAUVMnatRw7+WEp1+gMu8GmN+S0xI+2NqQKnOik0ieOA5tFvQ==
X-Google-Smtp-Source: AGHT+IFD4ygiTUwpVetjY+YcyYspKUcJU2+mn6x1QGz+FyWnrBex+TX+bFnUsxdCU1JKBbVgW8WtTQ==
X-Received: by 2002:a05:651c:221f:b0:378:f0d6:8fb1 with SMTP id 38308e7fff4ca-37cdc416570mr63309411fa.5.1764683953036;
        Tue, 02 Dec 2025 05:59:13 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d2412a091sm38320371fa.50.2025.12.02.05.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 05:59:12 -0800 (PST)
Message-ID: <8ff6ab79-a3d3-48e3-9340-8b91a9ce1b27@linaro.org>
Date: Tue, 2 Dec 2025 15:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, nihalkum@qti.qualcomm.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251126081057.4191122-1-quic_vikramsa@quicinc.com>
 <20251126081057.4191122-3-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251126081057.4191122-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_055915_827953_A45B3444 
X-CRM114-Status: GOOD (  15.10  )
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

On 11/26/25 10:10, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains three Camera Control Interface (CCI).
> Compared to Lemans, the key difference is in SDA/SCL GPIO assignments
> and number of CCIs.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco.dtsi | 345 +++++++++++++++++++++++++++
>   1 file changed, 345 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 774255c3f6fc..7c575e1c5e10 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -4776,6 +4776,117 @@ videocc: clock-controller@abf0000 {
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
> +			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
> +			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
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
> +			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
> +			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
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
> +			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
> +			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
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
> @@ -5071,6 +5182,240 @@ tlmm: pinctrl@f100000 {
>   			#interrupt-cells = <2>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
> +				pins = "gpio73";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam0_default: cam0-default-state {
> +				pins = "gpio67";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
> +				pins = "gpio74";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam1_default: cam1-default-state {
> +				pins = "gpio68";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

MCLK pad function declatarions has nothing in common with the CCI, thus it
should be split into a separate commit.

> +
> +			cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
> +				pins = "gpio75";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

All declarations of GPIOs to enable regulators shall be moved to a board
specific .dts file.

-- 
Best wishes,
Vladimir

