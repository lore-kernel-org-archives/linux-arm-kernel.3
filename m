Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A98CD98D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGSXIXNGhXGoEinX4j2POzhiX7uHLTUs+2fOXh7YSMY=; b=4CMGuGXx9vFDfCNYJYZpv8pEiV
	bHCGoKH7BIC2OpbUL/W8c1CL9bx9IIzRdTCkFZWsZ//8vtEP3g4B7sHtYplJEb/oBCM/n7GwBtUAO
	jPrZ+Cy6zr0KIl16SgIprrRabvnFeC0HVtWcon+9My+zOBA8UJ1nzAPFhivXjNiNZ66KbCc4w86I2
	fqap9BgNkZJJ1dRK6Dyl0GxbL9H4Z2CnR18yb07KyRqj585Qbxqc5toYB2puhZGlsSOb/bcQD1ZR8
	uzA07+uVjUHIPI+49s2XcVbP868G1AZiWGEtQ4tbEFE7jGJIQPgA1zWpL6dzfNSv+P40VaWTGCa+i
	AC2u36vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpX-0000000AX8e-3xiB;
	Fri, 12 Jun 2026 08:01:31 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwpU-0000000AX87-3QZB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:01:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5aa68daa847so44869e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 01:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251287; x=1781856087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGSXIXNGhXGoEinX4j2POzhiX7uHLTUs+2fOXh7YSMY=;
        b=Vxvc2PsJp2iVOoBdVE/MUeSM+vroBgx3O6ZNwCr8wgOeqhUBx/OZZVby9Av5nKLCFf
         tRO9CIp3wsNg0V55mu7j22tBe7l6MTnmGsaiBuBMxI6kZ0WrGJ6Mtp/KkG3hR9CsblGY
         MmSNLWtuZ9o5mI2ZJWiYsWnH1jSvtHJn0Usl3tmavJYBt5XkQuybdLGicaq16uRi8Vx9
         1waw/jFJQJvBKxqZKzKFDyELvgkdGJ3XxOe7hD7GJawR64sTXWFZKqUOwQSEs3Xiz4P2
         b+QiGDTuJ9ubsqJPCMW7jCduarSloWzWY7Zda0RDIPU9KHQyuxhoosFu6C90r6P2nEHG
         HhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251287; x=1781856087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lGSXIXNGhXGoEinX4j2POzhiX7uHLTUs+2fOXh7YSMY=;
        b=FXe5GiXciI6IHz7JYfjhhbPVcaWYbU4QSLE8abgmTPofbW4IJkbNCSLSncaWEsR4eS
         9SDeubmDTywLfnj+eofxWk/3F4jw2S4jHdaA5WCnP4/cJyIboDEyp4AF92VnIQjAMoAQ
         CodbvyR0vIojLfxLN/PA4SDHTUwzo572EvmfVxIjdjh+CEzHfh/F9Qij04YEkO79h+Y0
         Ot3oXueDjC4JMYM5nBhvI+5nt7t+qS39LMXO1fIzhEfLOV5Gftsu6EpXgooxOc45Ggxq
         IiRyR2oIBqzgLkSfPFw1eRe7T7PhSRmsYyiFH0tkK6qipEMtbdhfdTAIi5EhS6tDaeU6
         Ut5g==
X-Forwarded-Encrypted: i=1; AFNElJ/nY/B9qpP/B3b+85nqzgS9CJzJfWLkxqeu9qod4cFHeP9UCLa82MrPsQLbfE9olChp4JlmmnzkrKuhDpxfCEoN@lists.infradead.org
X-Gm-Message-State: AOJu0YyKfYmG06uPj39hRyd82RvvK1L5NRBX1+WUv60GqdsB7SuBK2C9
	hZ9cD4RDX2kVF/RmKO15aU15uPCaPEzUAqCahyrLMZ41XuRXWSMkIQ2WmluZPc3Oodc=
X-Gm-Gg: Acq92OHZrhvjlLAC5e1xrXxyGQrjrAolpg114EogN6a9Z/Xdb9uzBHF278fl8hLZ2/x
	99pxVY/FFbDkhoRbR1HZv2W3xIUpLFlet3+rQNhV3z2MkOCPVTA7fueJhCReaJvoJTXBTVheqzo
	+WzjJZRYbNu1LKdNlHe5buHf5WxjE4jO0h11Y61y5OlZsfamwAir37RAaDhlGE3da53uLzwdfwx
	wiTAWusYbv4Yg+DKxn9zg3wUzV1bJQ5f6V4pUOMOqU7/CyxM3Qe37/11HzVrkvZeZC/3aPdkZvT
	ShEk9clPLx9E1oa48ObzZTw6+/DUKY6YTJwhFlbNsu+RVa7aq1MYG56JWq0oNeclm3uUdFfmV/M
	yLpxcRyUZftjvghnL4UfipRoXtIb855ma4YkvqeMiZUk5KD9xksc5FNHfcVlA1JAc4bahwvNwM3
	1nJ6Ni7BcFxHshiKezW4ipxDT1MMYoOHsxGwcezEXZKgglXSRQ27rZvtzcfCExOW8NhyJBIuPI4
	RqZEQ==
X-Received: by 2002:ac2:4c55:0:b0:5aa:61ed:482c with SMTP id 2adb3069b0e04-5ad2db73743mr194365e87.6.1781251286462;
        Fri, 12 Jun 2026 01:01:26 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b7a3fsm319389e87.82.2026.06.12.01.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:01:25 -0700 (PDT)
Message-ID: <d4d75a39-3575-4bc7-9fa3-a6521619daca@linaro.org>
Date: Fri, 12 Jun 2026 11:01:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: shikra: Add CCI definitions
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-4-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-4-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_010128_892288_B7AA5ED4 
X-CRM114-Status: GOOD (  14.04  )
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

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index b93ce4a92a998ea5d9d4268d2fd46030fafc4084..fed71131491ebf6e261bfcd14b5d4a2624837878 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
>   			gpio-ranges = <&tlmm 0 0 165>;
>   			wakeup-parent = <&mpm>;
>   
> +			cci_i2c0_default: cci-i2c0-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c0_sleep: cci-i2c0-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci_i2c1_default: cci-i2c1-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c1_sleep: cci-i2c1-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
>   			qup_uart0_default: qup-uart0-default-state {
>   				pins = "gpio0", "gpio1";
>   				function = "qup0_se0";
> @@ -701,6 +733,44 @@ port@1 {
>   					reg = <1>;
>   				};
>   			};
> +
> +		};
> +
> +		cci: cci@5c1b000 {
> +			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x05c1b000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
> +
> +			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_0_CLK>;
> +			clock-names = "ahb",
> +				      "cci";
> +
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
> +			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
>   		};
>   
>   		qupv3_0: geniqup@4ac0000 {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

