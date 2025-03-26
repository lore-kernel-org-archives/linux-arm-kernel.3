Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83264C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAnsNYobYXGQyVT8GaIUO6lv6WY6ogscB1FdUtiA198=; b=vgvmb+3aF80FU2ME6//Oga1h9A
	giC4JFlmPovWXZLqBABeEuksPIysWe85ptyO2Lic7/IIhDS1hBMSaz/8l1t+QekYLo4tnieNC1o8L
	ouzSXYKwLOwGajlYPh8NfGoNkGJaf50s/qILdJRYfPy+4AmGYnKm7nzoW2PkxVx9Japx4C16xes+8
	ekOceDT8+XIzrGNtV3G4Tsh0pWn3THgWjerGyZurVx07xuY1W4yN/hKhmezh1FLzKRoSJL60VoLvJ
	AdnUFmhmV4Q0gCGuQmn3rb4wrQKIkDhkAsosvqlrMp2soLZVkSsmy/mFQp9iJKCzW8H4N3JRmOtP5
	Lb87vWJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRMO-00000008dYd-412P;
	Wed, 26 Mar 2025 14:04:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txR6r-00000008bIi-1rOf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:47:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QA1o4i025450
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 13:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oAnsNYobYXGQyVT8GaIUO6lv6WY6ogscB1FdUtiA198=; b=AGfyAtIdcyTF6b44
	fjEmGfNn4kKFyBMbqgA1Khyhcjr7fUj8R8/6dxgDuD+5RcZEcrHwtEJW5J61YmSE
	PaUNe4URcczVGRQAwdomQ/nXXdV1uPu+PKvTXm88dj9f6rGrZ3hUHguZqC37ThNp
	4aPim4Oq9nN3EQdlO9/Qaj4hFCE8JpEDfYpR+yLRe+Hep7772WkfeFtNc2t673+l
	02+t91hPhUWLi9I8Dne7YcpqCzjzoQCz6IIxqeakDtx/wWd15kX+NbiMyAaxpPX7
	sqplzw+F5gdIs5ywuegZUjzR++Nkv7zAlE8f6JJQ4vNHNMwwT2DUeXSfNdT8/7gT
	YjG2IA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcgkuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 13:47:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8fb83e15fso13678796d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 06:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742996875; x=1743601675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAnsNYobYXGQyVT8GaIUO6lv6WY6ogscB1FdUtiA198=;
        b=wZBGV6SwV4aK8/jDe0Vew4YLckoCdvMbw/MnJNM+QQtG/tr+079JKjzGA2SD0ypDec
         /Ueiq6n6LNvP6KJ1+NAfUw/7ARLrCOg7OPGeELd8A5nWCYmhOArsEhzgEgr8C9Jhhbo+
         oiWZtMSEx70VyNXDXcZTw0sRyAuufgnPhtEqTyYqXnKlmOG9kTXOEjklIrJZrQH4PG1W
         fFAXmPgTC///BAfDNaQYeAg8489/VZpeKkklK2BO/VGwzgP5toSMc+hezIaidQoqTkTK
         iWK/sA4zLwzHQzaFrCPBz7lhYZNgAvQbHKZra7OPjC2rbmCCnFKxQs95p2Trwdu7xj+T
         Aklg==
X-Forwarded-Encrypted: i=1; AJvYcCVqBTgoZiawy/+K+QOmR4Xy67QJbPrBvMTysRIdyf65MwUEIDTbaOl4w7gsuIiN+2cr0iFAXu5v6NE3koMmtmU0@lists.infradead.org
X-Gm-Message-State: AOJu0YxTzdY1W1EwMfAAmrpOEDxqP9OTFNK9hn/MQjVO5eVtxYJ4suCm
	c/t9dOOkXP631T6dJZGHH3WfsTphkQSwDDnqH44s6WagnA3yRqBhkVs7q6pNNBMEBfYSXC1HDBs
	5KG64xKbNROeHnXcImo9hpLZzuvVMmdiHH+YsG5tfoObRrhxS5mRQQ1UALNRgO8Xei709k0rnZw
	==
X-Gm-Gg: ASbGncsK7hp2JrzWVoXwncojx4L82WAWeMQ9x/PyTC21QJguZdNrAh97aAo8E8xjGNb
	WvIVG1i6ygN3njwYzUSmhSCZUMNlGRg5UDEhjoPwzCtvjbCkh/ttDlhAmk9Wa6VLPTdmNdtck9i
	7+3wJ8IfOzMC7byCtlzIqEZYlZc3tuzPE7PuW0qGzCEubDCGKEHQG50ji5WLBXksX77x7HeFNU/
	YEmx6f0nce2/sUqZth2JyXunVt0j20V9MFFZorulvEZ6NRumSreBLZh4oBisVNUolbw7teHRhnv
	7Gjww+/5wPZTds8c9d4RJ8sHPDSGNgqFNDNDnxJVYjs9JtyDH8A8xaHF8I7wFP3CJ/qPfQ==
X-Received: by 2002:a05:6214:e6d:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6eb3f31f775mr103660516d6.9.1742996874788;
        Wed, 26 Mar 2025 06:47:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFd5B6zyRzYrno4RuXc9G89CRxgNBc2jAwg6fxiQ+Jm/et41PRpGY6sCmOIsIZwNP0HOEUxA==
X-Received: by 2002:a05:6214:e6d:b0:6e8:98ce:dd75 with SMTP id 6a1803df08f44-6eb3f31f775mr103660306d6.9.1742996874282;
        Wed, 26 Mar 2025 06:47:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e5128sm1034146766b.59.2025.03.26.06.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 06:47:53 -0700 (PDT)
Message-ID: <8b7151d6-e2e0-4561-954d-4a74126b4265@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 14:47:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: sm8750: Add USB support to
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
References: <20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com>
 <20250324-sm8750_usb_master-v3-7-13e096dc88fd@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250324-sm8750_usb_master-v3-7-13e096dc88fd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e4058b cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=x9b32qiywL4GtknhJMwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5i8N0SvVdptiSU3mj4fffLUkGBQOBA8c
X-Proofpoint-ORIG-GUID: 5i8N0SvVdptiSU3mj4fffLUkGBQOBA8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_06,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=850 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_064757_607541_8265B4EC 
X-CRM114-Status: GOOD (  16.34  )
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

On 3/24/25 9:18 PM, Melody Olvera wrote:
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
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&tcsrcc TCSR_USB3_CLKREF_EN>;

I believe this belongs to the PHY, but the documentation doesn't make that
very clear..

With that squared out whichever way is correct:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

