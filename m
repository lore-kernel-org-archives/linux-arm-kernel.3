Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AE5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gGa4aZilPyCyYaUtOkyKJLgEGpI8bxypefG7qwCZ+M=; b=MOvkdyNjU9aeoOVSDbToc7j4RL
	Bs7JNZMJZXvvTdwiWaxhjAAEa0aq+HZg5JmhsXV0jpHpw+L0iGMMkX+stuEu3EbWF/zSvfdRU2Y+L
	2GpSvcNUJyWbcc/5vCV4CiDtR8lCLHxC3MgNuQLmwbL7TNGQU/u9ekBfD0ZNnZjAayB64CjUNkrAo
	SLOnNp8LWuMUJIFauwyP/Z4NFYVDWvbqNolxJhRBNZbrHXeEqQIq1go6FUJ2z7MGpWuxyD6ZwnLG1
	pWE7AN2akPhaTNKAN5DzpRkAZ6sIqXg4bt8m/oh3WXKZ/0kbwvR56U5BFwSRSTO6XmoDTXSV3/Q0W
	atxM0Bsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvov-0000000Gm5S-265I;
	Sat, 08 Mar 2025 15:10:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqvm0-0000000Glmx-2220
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 15:07:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528CVgal013894
	for <linux-arm-kernel@lists.infradead.org>; Sat, 8 Mar 2025 15:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7gGa4aZilPyCyYaUtOkyKJLgEGpI8bxypefG7qwCZ+M=; b=QhGn7ZsS3LO0WODO
	oRf1M2GnRuCy1OnVi7pwmk5bkxm07W4HD+Hdgrqc6udDywKidh2GQcWbCDW1em8q
	KGdezKiyvA4+2a2xwei7sOFksWugzh3vkEA47uU46TYm4tXFP8zVbdt7vCMsDlp/
	e8QgekpnPgAOdkoF/p3WwNy3mLR3scauqyF9b8hInq5Nhcaohu60r+aveFptooVr
	kpR4VYZ1Rduvl+8sCu/1rPvUU/a2TKqOs7hOviU4WMhis/I5rQuzGeQtaOkqPEBR
	AV6vPlPprXi0O8iwn/3pqEzTptF2TaUK7jYFpCg73sAovsWAjJl4trmAaQNuJVdX
	DJTlJw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex0rrg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 15:07:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4766ce9a08cso292731cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 07:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741446450; x=1742051250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gGa4aZilPyCyYaUtOkyKJLgEGpI8bxypefG7qwCZ+M=;
        b=m3i12eYzdV1xkHw0D13vwdsaBR6Bt8M2CED2sK7fTEk0zUUjdEs9dTZ5VxK9iut3nO
         shTVsMKp9ZwF3znkER0KEOopwURqSYHQHK4Eblf/FcbMsUrD3mRug1CwlG9zhfJ8SUDe
         PDhjSmS1ox/jG5R8Zwi0nFomjFfmsNfGP2E9gDsDP9XuB8JG5rqV/7QPZWxxVVJ/b07I
         I5Apy1INwgaklC3IuJ90RSW/Wc9o2DCet2rBsTtn+kgxZn9mGUFnrk1HCqkc5JlCDfKU
         mxvgrB7nV8yVcXmzCrYGl8a6gyXAFogdSJJGgvRzapxmc30OfjbH/qqmop5DrwV2mcG3
         PF7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+PDe1a5e2yv1aNMtY/9PZT2/ryen4UDnOAXf2Vw8JMskl8jC1nSeFVhLWtNStIiW7h5OfPzPGaeOn8gELsCMW@lists.infradead.org
X-Gm-Message-State: AOJu0YztXFQUQjEEL11OhOw+72C4vXPgmXkrSCum6Dx9jA0BS6RGpJF1
	DeKwfreYn8UWASVf31eLPJp283Nkat34gJ0SPuWmUnVt9gasbies7v1055GkQtBaC0qji2IL5iX
	PoTB6uu7BDk7BOtopuIkdFgXIhFO2xKLjVg/hZ61ia90RlYFVK1yv/023O8n6sUPFi66tG5VBnQ
	==
X-Gm-Gg: ASbGncvz5N9gWhDniJBH37IWzzNjjnQ3MCt5ET1d4yFY2V1oRVFg14jkkNHPnD2JaJD
	4YF8BonPO9oZLq+cA0oBMOePg6TJXhyq+BtiqklcAMui2bVVuvsNbWn27xETPUyiC47mRaUx713
	lhB9/NALko3MxpdCXHPzVpnj6duqfLVDds0lvjP/XN7lHUuvZ9KpeiIyOysK1WcYr24PGHx83ee
	cNymrL6KXoAKtQaTMMfyGZdAF7AO8S6i/QWPkRsF3NZnnbHV8ORCy1oUw3yJnEqXGxL78q90fy8
	Bg7cjI7PHR7Iwl4rqy102q6CQzZMTpCuvVgwVE6l1TCIlvgLQd7OUe5TZ6PC7VKk+u/V5w==
X-Received: by 2002:a05:622a:1342:b0:471:ea1a:d9e with SMTP id d75a77b69052e-47666c9c2efmr15222171cf.12.1741446450575;
        Sat, 08 Mar 2025 07:07:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG16fJ1s25av/19NCMWWvw3UdbNssC4iChQRcYwnRiDIAmzLAMyr8NziGv9MuhUVNksyID2cQ==
X-Received: by 2002:a05:622a:1342:b0:471:ea1a:d9e with SMTP id d75a77b69052e-47666c9c2efmr15221891cf.12.1741446450220;
        Sat, 08 Mar 2025 07:07:30 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac284f76a22sm24449066b.149.2025.03.08.07.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 07:07:29 -0800 (PST)
Message-ID: <aca09e7c-53e2-45a3-8281-7df9951549eb@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 16:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-7-a698a2e68e06@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304-sm8750_usb_master-v2-7-a698a2e68e06@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B-6VSrL4yrpcUwEEavX6KJG_XhN1dg_Q
X-Authority-Analysis: v=2.4 cv=f/qyBPyM c=1 sm=1 tr=0 ts=67cc5d33 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=wuHw7GjLwNk9Z1BGEEEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: B-6VSrL4yrpcUwEEavX6KJG_XhN1dg_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_070732_653513_58AC0B80 
X-CRM114-Status: GOOD (  16.15  )
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

On 4.03.2025 10:56 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add the base USB devicetree definitions for SM8750 platforms.  The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
> transition to using the M31 eUSB2 PHY compared to previous SoCs.
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> +			status = "disabled";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;

Please follow property order / general style found in x1e80100.dtsi

> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&tcsrcc TCSR_USB3_CLKREF_EN>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "xo";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +						  <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event",
> +					  "hs_phy_irq",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,

QCOM_ICC_TAG_ALWAYS

> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;

QCOM_ICC_TAG_ACTIVE_ONLY

Konrad

