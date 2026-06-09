Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88270CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZrIRgISj6MusU5WRM9oV6xNWhYPCm9zSf8D1irSjCY=; b=BkpIfjJq7qhUClPomQkkygxFb/
	uFCPaLdbtsl3a8jZVhVOW4BrRI3mUuNgw1RzuDAF/FRxVsqcwtX5uzAGT/8dPbmnSQkrQyP8YWLau
	MhJRcaGDTFETZg31srjLQXgS+pkZ0pZENISuEvKKArT2TY0MBRptMK6p5j+4Y1cDqZgw2H7dufFhl
	cUOk92wRZWC5RZDlsDNmGw1MN+BhoGCAav0Goh+gPMPuV8O4lewl92yuLU28OLRIVDt9XCnjGiypU
	t7cVE3xXdqWe9q51qJMOYrKAYrnJkrKD+rrfwlBcQX4ap4ZYYDhyH8SEVw49WXsOph7gL3KRMe6U5
	5dLK7pdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsDw-0000000575p-0i16;
	Tue, 09 Jun 2026 08:54:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsDu-0000000575R-1pFo
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 08:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hZrIRgISj6MusU5WRM9oV6xNWhYPCm9zSf8D1irSjCY=; b=lSDZ2mJaad/bF1DVgHIalSDiE/
	cEOXrkeMqM28paVQHW22dXWpu3vmj3zBq18kI1/HfZsMVvxq2ZKmqFo2oQhjmphV6knRMmYPG5LBg
	DgZcgygNYVFenNxDyUQFgmS/2EAjJ/6cx6LF97MmQdJkscllfQH9MYTVOi69I8jQj0fbr9QeCh0O4
	qSWTPu7j42TVAZcnpofB813QXIdcsjkMl9S8ZFmZjPq7XIF12P+YiJ4FsWSXS7jCi+2wB6QtOCFf8
	no1KiXLNGmutAFy72XxoVhE+abjl3iLg3wjnl+iYQlvDN14bp2sWlHNV7/tvxPZvcA4y1DIZjvNJK
	L6Pbjc6g==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWsDc-00000002CmE-2ybU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:54:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso846548466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995235; x=1781600035; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZrIRgISj6MusU5WRM9oV6xNWhYPCm9zSf8D1irSjCY=;
        b=mE+Dle1BkDXKxmnNpTg309hb2eU6Fa9wXO61tPPAzp5UYq1NcVY32Mu7l8RxDrNTxS
         8JNQ6xTxl8Le/SQ0T/WjQKbbWkuP6WkWqsBr0p75xHsjWzKmJyIlrVk7xypqo8EeL1g4
         0lOHN7EJ0aSZYXaEp5mxfMy8+kW53Y/IJZSVPHKbOHyMCVR97VN3lm9JTspSyP1VRmOo
         YSl4+WeHHQnZ/n4na22IguqbvQmxe90rKm41gR2Q8rLO7o0fhfPVXVs2UVWMSqa1ZYmS
         sBraFMLvTrSUawRvJckR9GguVNXCFg4Y2/dUOwazVu8qnaOCVnw7ckzSnL7rS/asTnvD
         SdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995235; x=1781600035;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZrIRgISj6MusU5WRM9oV6xNWhYPCm9zSf8D1irSjCY=;
        b=emTb3eqDH6G2z+hzHjsfUQkZtKdpW7Rv/Zz6CBqAvrn5gB1j+Fbi6CuOn0ozNMg35l
         TAM0ircERc8lT+27SpZJR6hFbtHU+T4O5S0Qhyxfv9QhbG6qPAxOhwQVBVtXbKR+irce
         Bri+4Xs/YY1AVCV/jSRcSJTmH8cWnwXqaONwCz7X62T27X8mEM3tYpovZ/lPTFSLR20U
         DX1Papvxn9EPh9VgJXaXU0Vfq1qWGAI+RpwKiDf0BT7++e/13lOfGTdKFnZxos2M8khI
         IxfBb8qkByfaT0Fo4fWO1rEfDgAde0dqxecYKLQfjHrAlxwVD3ZpKZuFdWfr2aAHbsFr
         L2MA==
X-Forwarded-Encrypted: i=1; AFNElJ98OoPh3Z49qdQy7rCol0zYkz2qhseiuwjLbA5nQhuON6zCiNzbpvAL4EuB/F0VsiQaudzJCjG0x/sOx4wzOn36@lists.infradead.org
X-Gm-Message-State: AOJu0Ywng6tYJH6SaLtuyHCBHYoAHHJNkZJvIOp+0ok4gFxOiwU0hv8s
	HaYkNJXyqjAJxIlGaFZjTK5T0CCkxkpjHJChFOGa/5A5zvXOdQ9p818yDIHxwZVV7UQ=
X-Gm-Gg: Acq92OGtk+X/AdUdajWBzJheuHqkzk6WjyVq4iXLTyZV0wx9z2SDKY5dahcah6oRvDu
	hQYofEsPO5RRmwSKT/bq4UjDvmhHcH12UWivNZP32OlZnEV5HCbPHOd6oygadRdfC6kZpM9aD7j
	BGEGZpYMw6PRWeTLMmk8Eef5S3WujOkUMSZvpssfIFbRffYaNb9Nd7q0dMH/JPgHpD4RY3Kmz20
	C1z9JgoDrjcu0xS8Y12KPPxzrglC9p4ww/WYIkq12FdShvZVZsOkpafGZR1tSGqdpBU3uU4rwrU
	zpTC5WPC7OhPkCjpUymZOWaN+WUiGWrhJ5hvNS9CCVPWWiQPT8IjIy4Ndcz6LwTBc76jckrHSis
	463HJysPmDikyFNwVYI8VCfA6F3cslgD7vDQpWgslx35/V4Fh1l4MMS21oMY1YKuMO4eIQjy9bo
	mowSO4m3p86DCR7SdPRR1zA3NPnJ5LPWDlQR8R0g8dW3sxGBaDOryNOgk=
X-Received: by 2002:a17:907:1dd3:b0:bf1:1df7:3e50 with SMTP id a640c23a62f3a-bf9365c6399mr65159966b.3.1780995234797;
        Tue, 09 Jun 2026 01:53:54 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm998205466b.50.2026.06.09.01.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:53:54 -0700 (PDT)
Message-ID: <d56d7468-a3e2-43dc-967f-63066bcaf1d6@linaro.org>
Date: Tue, 9 Jun 2026 09:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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
 <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_095409_477215_BB504307 
X-CRM114-Status: GOOD (  13.78  )
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

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..b93ce4a92a998ea5d9d4268d2fd46030fafc4084 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -604,6 +604,105 @@ opp-384000000 {
>   			};
>   		};
>   
> +		camss: camss@5c11000 {
> +			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
> +
> +			reg = <0x0 0x05c11000 0x0 0x1000>,
> +			      <0x0 0x05c6e000 0x0 0x1000>,
> +			      <0x0 0x05c75000 0x0 0x1000>,
> +			      <0x0 0x05c52000 0x0 0x1000>,
> +			      <0x0 0x05c53000 0x0 0x1000>,
> +			      <0x0 0x05c66000 0x0 0x400>,
> +			      <0x0 0x05c68000 0x0 0x400>,
> +			      <0x0 0x05c6f000 0x0 0x4000>,
> +			      <0x0 0x05c76000 0x0 0x4000>;
> +			reg-names = "top",
> +				    "csid0",
> +				    "csid1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "vfe0",
> +				    "vfe1";
> +
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
> +				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
> +				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
> +				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
> +			clock-names = "ahb",
> +				      "axi",
> +				      "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "csi0",
> +				      "csi1",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "top_ahb",
> +				      "vfe0",
> +				      "vfe0_cphy_rx",
> +				      "vfe1",
> +				      "vfe1_cphy_rx";
> +
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csitpg0",
> +					  "csitpg1",
> +					  "vfe0",
> +					  "vfe1";
> +
> +			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
> +					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> +					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
> +			interconnect-names = "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc";
> +
> +			iommus = <&apps_smmu 0x400 0x0>;
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
>   		qupv3_0: geniqup@4ac0000 {
>   			compatible = "qcom,geni-se-qup";
>   			reg = <0x0 0x04ac0000 0x0 0x2000>;
> 


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

