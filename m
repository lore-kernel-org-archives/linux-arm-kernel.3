Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F8BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxM7khpFXIRWVrEqLH01YG/cMrQdSKce000WX+jkPIo=; b=G250TtSB6icQhvZs+H1+KgEIgQ
	7L8j4A4cZqHU72zz2AqrrE8iF1/t5ixYgP5DPZTqHSg0EKEfM8WqecYutYCDODKCqmBrQc3i5W1rm
	uaUQJn4otafpOoubKDGd/H15nivrm9zeEEQ1pw6XvfGo6ZBtvJ99cvQnPiAzYzP5T/2YGYn9ofRu5
	sW9G5yHuL0MoJz/Kf8iugM/JZZ5F+Euj8tLissSpBxMHGFzp9FHb3H1YypCCdDxDm6hN+QjS2vNQ5
	lV6h4Cv9Pga5oev1XWNbiFttZK73CM63RHvxiW/eccisflKY2a0xERUuWhGMedZGx9XXLlOPIEAWb
	W6tOTWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoo4-00000001d7i-2l01;
	Thu, 12 Dec 2024 19:25:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnzB-00000001QyY-0Y3N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:32:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGlD7d029905
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 18:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxM7khpFXIRWVrEqLH01YG/cMrQdSKce000WX+jkPIo=; b=cdSPk2IcvGz6VJ1z
	vfGVxBlmbFyVE5jx5lwWH6+MoovacNQYMfI5jBBIGMSfYmMzNOVUHls6omsHNuEf
	kQW/h6k6GXCHXdLkKaxAZrv7mbPuisNwuL8cfJdo2tORAaCVNI3ThVDfE+vP1MEh
	/s//3lpXbHwNt1o/roRKoXfxCB5QYf0AkdpCynZiF704lNMXJOvkt3tCv/Nkemg+
	//jVjk7xhUirbz1gwNKynSlTA2BVQNuV7Bi4Bl20mixCJfK6L0QPDesL6dnxI/N2
	Fg/dohulBYophg/856blMrkcTeNpl/wd4/fA9eMW2oyeKPzo4jwHOSOYYbwnDMAL
	m8TOLA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xuwh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 18:32:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d881a3e466so2220886d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028347; x=1734633147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxM7khpFXIRWVrEqLH01YG/cMrQdSKce000WX+jkPIo=;
        b=DMIrxlSAw8MbcBSuEP9B0I7rkwN7mYZ5NCOANuC6Rqp3+mB27Fw9FAZwJv6JP7mCA7
         odotWPAqiXnojAUtVI3ndt23r+41I3zgud5iDL7pH+e5E+9OoKWPAqYITZcWXA2SxTB9
         b2Z5IuzDzxmoftlfvt7E9050SGIj8mccG4oAZpgNFuvUh3l3QC7JAp5zWhUUhfYTse+A
         sBGeFURnbqMenNmVER4mAuJ2a+690l+bl3FZVBUMWLRcX3MdRGr8JYTZy20hlMOEoOs8
         xZqzRgapQCJbBXyXDWgeP/pqnchyiYV//ZVYaQAPH3FHDB0QiteDnPozk9Go2V6vlFQH
         Uabw==
X-Forwarded-Encrypted: i=1; AJvYcCU7CYOUUB6I9jvTFZ0VBfKZCBfOtTfuuPIj3YOYW+3CWUngzL9vXq40NDjmfhMXwpw8aS37saTkmAEULU9ScHZx@lists.infradead.org
X-Gm-Message-State: AOJu0YzZoocvOItFLPh7Epxq7/bYxE51VDBkPYFXOlq8t8oZn9nIMYQY
	UeCEeKbEadim4nXVipLiuSi1GdAErR0ntADao53DCIqnrCjw0L8oPxNJY8e4JJCpxoT470IUpMt
	AU9alJfBwcNtYPX7aAAamkvStR1vMqGhD7NCc2iGWLOgYzw9jEtoBB24AOJSU34XnVQlRkNBhDA
	==
X-Gm-Gg: ASbGnctL8NOo1ltUkclFXi4Qv5pB6+hlr1rw7c3ifazltE4teIzJTVSYBa2azeMjpKo
	+SzPEm7Y3fZcFYI7e0aAHCZ9RYb1ghqsldKRHc+OYgMJYrp6/jkH2b4nsWlNm6xB9xVIscfnpjR
	vl1w5b5hkk8FLu05vuh55E3k6016ZW8h0ujXQVDqgSeVotiUZgNTj/qGbtPSWSssoK47UUISaZl
	9q6k3MsmKYpSC3BI+5V2qqQ+JNU0lMAYRoo65NF862qEEqEl+BzCZ0sbSvaVAvoH2KkufdNvAmO
	/SosJ6ZozcLp7sf30TR+cs+prAZG/0sfEJGEvA==
X-Received: by 2002:a05:622a:494:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-467a1619b60mr8325531cf.10.1734028347226;
        Thu, 12 Dec 2024 10:32:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnrfljY2vkd3Lt/DfsHE9Q4yKVSefuodPmXn/tMSCjfeYw6ACCIUoa/Od1A+jurMZ4xVqPMg==
X-Received: by 2002:a05:622a:494:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-467a1619b60mr8325201cf.10.1734028346752;
        Thu, 12 Dec 2024 10:32:26 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6808c03a5sm669945466b.137.2024.12.12.10.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:32:26 -0800 (PST)
Message-ID: <22491b41-f081-45cc-8766-6b4c851516f4@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
 <20241107-qcom_ipq_cmnpll-v6-4-a5cfe09de485@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241107-qcom_ipq_cmnpll-v6-4-a5cfe09de485@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jeNg_mOOgm55NDYmyDDWZLVudbILFc5c
X-Proofpoint-GUID: jeNg_mOOgm55NDYmyDDWZLVudbILFc5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_103229_287705_11B6F76C 
X-CRM114-Status: GOOD (  25.39  )
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

On 7.11.2024 10:50 AM, Luo Jie wrote:
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
> index 91e104b0f865..78f6a2e053d5 100644
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
> + * reference clock output from WiFi is 48 MHZ.

I'm a bit puzzled by this comment. Does it mean this clock could
run at some different speeds?

[...]

>  
> +		cmn_pll: clock-controller@9b000 {
> +			compatible = "qcom,ipq9574-cmn-pll";
> +			reg = <0x0009b000 0x800>;
> +			clocks = <&ref_48mhz_clk>,
> +				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
> +				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
> +			clock-names = "ref", "ahb", "sys";
> +			#clock-cells = <1>;
> +			assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
> +			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;

Does devlink not complain about self-referencing the clock here?

Konrad

