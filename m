Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BEBC369B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 13:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGyhxlay54IRFzuBkra/A/yq80IVczLJEIsYnlPDjgA=; b=X3d9dSw6f2Vo2TBDjtQsC0qW4A
	hW3GBVU1qfFHCqMb+gjwJtQRvguhqj42Uq8OzZUPXKbRTM8an2a0Uv4eLviTVftnnpf44u+iV0Plo
	MBqx9oelqOI93l6kl15GWS9noRfIMjDNdlKIuVxVa4zzKWwzeuj8bVDoz9e/vsF9clK0nOnCrQC5+
	o+RAQ7FI7RRzB111m+3AgCQA9TctfTD9LVpDMYXzhWtFKAkfevQwCLEk2Kck8eJT9YUgpr7Vf2ONy
	1t5FJyEj5gFTWFXEBJkrcYBBpiytjNjKrHB/56JfrFjrinsWyFoPQXVJZjWtfy9BNnyymnH13rofC
	uwc4PjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4K9E-00000002Dnt-38qr;
	Mon, 14 Apr 2025 13:46:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4K7M-00000002DQf-1UQp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 13:44:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99r1g030666
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 13:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGyhxlay54IRFzuBkra/A/yq80IVczLJEIsYnlPDjgA=; b=GpRsMp1vvSyRCbYZ
	8AUyply8bOhmTnKkUYgtKyT2XoW9oAi0r4k8KzwbNLM76Ne2pqPvlFToQJbSK+2w
	ivukfjTndJnP7Lf/7b84SxpvudvmV1Nrj4xly1MTelzyGLynBrdJYZo1aRhBmnMy
	mxV2iefMqzk8a8pGm4ijPEAjBKyp3Er8/NgltMA9sDVx90u55iOwD1dOwnCrZxlI
	sL5ICCR0DPbyANCPn2AX9v5gzP95ytEg94UvRMhPRpTa5S1AltW5j5z1yxOJo1PZ
	CsMk3NbYbek1Mv6DzfhJEduYM3DX9HdvvRj59zgvDk/UkHxdM6iMY/2pK9qdYBwZ
	PSlhfw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj4w7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 13:44:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so13739346d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 06:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638294; x=1745243094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGyhxlay54IRFzuBkra/A/yq80IVczLJEIsYnlPDjgA=;
        b=cAU0MVbbsS+OmGTNcqWB2nKK+/7DhuMDlwom6CPQihh0cGqIXprpNJDrxSzMxAKV5Q
         WBunEb4hbgbvnouXC8JDZDcDuzYooRdxSYC/0dtclkUVBa483OQMJG9myR10K+Ji7y5U
         7rNTnB9Cg/JSQLzR95kssGOLiSioSHwvymnuPoc6qFb7eNxuH1JBmPpTIRJvX9s900D1
         vwbaBKXVu6f8AYls5by4ZuRg2c5cnwXTAOPIbuc92CqP6mzAFEySGdIYi8vNPSOapJRV
         VkgKjzRFTabrJeRr/QurbsaPn7RqN1gy/UPWIfblyncPphDU1x5pO743MoTSIKaRcn75
         Gj9g==
X-Gm-Message-State: AOJu0YwKVbGyiTWSBSEqLbP+l6oq215HGtkL0sYTuVYskFoSJsDL7z/f
	qN+qXugTxdhxODfp2Funlw77FeBMAoPlibgMbdTV4LvLAtYKvENJ30Ai0a2kpBg2LP5i29Qo5ne
	qkMrdEdHp8DUwz33qVcUhFqXY1yNGb1i/6rcKzCRWcPb6A31UwUSLh/6wjJo1FCC1u4QkWmessQ
	==
X-Gm-Gg: ASbGncuAdYTNbBeMIe1kMfm0XJMLgapaOyiqxf/aAjDDfmd4b2NCW6Svph8WKx12F8e
	CtDCwK/NKCrhi3IUzsflj9TxxNAKcJ7l3h6+Tn1J29MWnONhJ5cWqbfnol4V+6vE8DFik8LhKNA
	wHDZyZlU7gYmV9AlPTVMYptwVuziqsQi/mCK81MavtZ5bdtYmTVIEG2wiKsEzlx4GLSANxFCNK4
	LnOE0cuVzLIH+KJ8sjrVitOTJHla0sPcmRfi47fP9XqgXJHhEZnDeQczoXdCT+peTXN9wMRB2rb
	YGJ6hWawHJNlGmv1Imx7CFPRPh36cmsolhKCR19/1EIp1R6DeiIDRT/oEq6FWoE8CQ==
X-Received: by 2002:a05:6214:19e5:b0:6e8:fcd2:360e with SMTP id 6a1803df08f44-6f23f15d812mr61942686d6.8.1744638293963;
        Mon, 14 Apr 2025 06:44:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZVo5rWcpGuTu3YsE5z95sRrLd11UcEgqrLzSlXM3gKn6ONHCheTTQxg6qNFAYdN3dceNSIA==
X-Received: by 2002:a05:6214:19e5:b0:6e8:fcd2:360e with SMTP id 6a1803df08f44-6f23f15d812mr61942526d6.8.1744638293402;
        Mon, 14 Apr 2025 06:44:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd205sm928040066b.141.2025.04.14.06.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:44:52 -0700 (PDT)
Message-ID: <6e98b5ca-3ff1-44c3-928f-e993cf29215f@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fd1157 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KVm0XDNadgfEQVUGQ2gA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HYxpqUFGb8mJGPXMAooTMCJ3uMtk6fcl
X-Proofpoint-ORIG-GUID: HYxpqUFGb8mJGPXMAooTMCJ3uMtk6fcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_064456_407608_940C6589 
X-CRM114-Status: GOOD (  18.15  )
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

On 2/10/25 4:56 PM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 187 ++++++++++++++++++++++++++
>  1 file changed, 187 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 3394ae2d1300..83640fef05d2 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> @@ -3796,6 +3797,192 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		camss: isp@ac7a000 {
> +			compatible = "qcom,sa8775p-camss";
> +
> +			reg = <0x0 0xac7a000 0x0 0x0f01>,
> +			      <0x0 0xac7c000 0x0 0x0f01>,
> +			      <0x0 0xac84000 0x0 0x0f01>,
> +			      <0x0 0xac88000 0x0 0x0f01>,
> +			      <0x0 0xac8c000 0x0 0x0f01>,
> +			      <0x0 0xac90000 0x0 0x0f01>,
> +			      <0x0 0xac94000 0x0 0x0f01>,
These I think should begin 0x1000 earlier and as a result be 0x1000

longer
I also believe this is an off-by-one.. there's nothing past a certain
register in there, but 0xf00 is what I believe makes more sense here

[...]

> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&gcc   GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc   GCC_CAMERA_SF_AXI_CLK>,

Please don't forcefully align these

[...]

> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;

The last one should probably be always-on, given we're doing all
voting on the APPS RSC as of right now

otherwise looks reasonable

Konrad

