Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E74E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22DdllJUx8c525feb9BABGaXYzEDkdsU1L5H+dtpqJk=; b=SwDuTA0VdN8MRf3wtVSOFcNpuA
	w9XgfOKKp8Ivga9SNNBSFimSar3dsBKyn9ua5U5ga18wBxK3FDYB2DqFIxAkFSAD7OMKNNZUBKLbY
	TmjKCgcmpAA/zC52bi46RmerfO6XHHVyuZhDiRkMN1b9Xa4vS/6bi2gl8VyVGwVdvk2Vm6G4LLRnO
	+lrHezJ4mTPD95ao8XOSOUgzl+vJQam2KyRRMKQg0hd8fHDaqsNOXjhRulvqugqUOMmHHQRB8DnMw
	m/cn+DPSmP94/b7QIBcLb9rwm4Y7S4DU35wnDBFXVbExe8604iTMuAMJgQcdiqF+HmDcNK5uGOCYN
	jQcPzQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3gw-00000003X7g-3okk;
	Fri, 13 Dec 2024 11:18:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3fs-00000003WxY-1POj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 11:17:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA3be4012385
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 11:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	22DdllJUx8c525feb9BABGaXYzEDkdsU1L5H+dtpqJk=; b=Ty1UiBt1pMVbIqjG
	uTAczAQNfUqNz+JS0mmWcqXkmGhu8NzcOlWEurDv0ylOSLDm/UrVDeyzgmI+6Hz6
	M/sYoolyV8482tKuzx2LyVF8PQP/ENexWPdU2yy0ygdmifYOW/Lx0Qg7sfx95DwM
	tNdNwbt2CgIM4xaJcxBYyu0vNop0remU9UrazB+pFTSFSSep51GR5SD4R7EqxSE3
	t9lu62faWanIbRuZdF32t/m1q8ZwXXHPw0RCCa6g6tUgg/8y2zc6zHFpVV6krvkJ
	4g2uiP0ccT2+fpsedkZ4HdgMW/z1il9tQ+yb3xTzzM/pvZ2x+LrPLbSkIFKN73Uz
	kM6xfA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudg7mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 11:17:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d8824c96cdso4566106d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 03:17:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088654; x=1734693454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22DdllJUx8c525feb9BABGaXYzEDkdsU1L5H+dtpqJk=;
        b=Gt0pusZyRdbNkXFbhQxLXZ7V1I1ZlcBgIlCqn28XR81aoKir0/93kLvWkG1BE58oi0
         xukFC4X2eqSPHzed7TYeKKLnwR3GLYdh1IrpfpssuAXPqOp9KjwiiJ6r6zjYcVwz/DpW
         jEXxnvjlNFZ7zJRXKyLxwioBc5rYVDuY1Th9oNzj20Yy9UeLiuAe50k3iuob+mf9nMjz
         nyF3svBGu4cf30NWWvbGz4/S4aL2wCiK4Ofc9092VwlbLEdIKfpnrPQIy8XsTfs3E5ja
         fY8S05xZN4/e0XuqOWa9w7IbeLViu+8tZyqmhZwR63a8lvx+U24w5kSpBhHDuMPyfFgI
         EM9Q==
X-Gm-Message-State: AOJu0Yyx7khLmr/w34q3VHOmqEXVAVIkuRm9OPq6n+nx0qB111G5zPWZ
	hGf+l7e6l3v2ba4odjcCz4zUnU1Ps3K1bMaoneNJOowIcwNiJcn8pwsf5GWej1cE1/zPqF6D2FG
	n+g1ajMxXJ9fEPrEvY+f9fr6j2MZOCDqia/lcF8BfsrH9SbdMg2qgwTp8QJ8AsYsfi//Sti+K8g
	==
X-Gm-Gg: ASbGncumBjGADcPVN3IjhA6axcXspeY0ETbenzYhngcY9VV2F2Ofpykq5ZGVzUE1Mj4
	T1ADA+c0Aoj2XLg6TDbYGXH8Qiv4BUk3fVXaOjSet9kVotfHkPbd9JEKbLSWVXyV3dlYuNKiRp9
	/ysa0AWsbIq2CCVOoMmNft+RNbcjeEn88LSOGIor22JcBq9xKAAVMPIqjqbaMX0JdnAQzDSCV95
	/NR3AzItSTn6/lUHm1FKvtB97g2CpimaxaUr+23cZ/ZHao93VJQtWnIHsKKsyQhA/swkEsEFLrz
	SCaIMYDQ9iV52BlsHWnJNGBEpEm2q3PDjJqZ
X-Received: by 2002:a05:620a:1a95:b0:7b6:d089:2749 with SMTP id af79cd13be357-7b6fbf0713fmr117972185a.7.1734088654042;
        Fri, 13 Dec 2024 03:17:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD+GDmKeinZ6iYtcXL0S/mpK+8aIUpXK3aOY+mNBKrJvpqSkt1hyGsBzayOsJI+bMandu74A==
X-Received: by 2002:a05:620a:1a95:b0:7b6:d089:2749 with SMTP id af79cd13be357-7b6fbf0713fmr117969185a.7.1734088653665;
        Fri, 13 Dec 2024 03:17:33 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab88d930a9sm27933266b.95.2024.12.13.03.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:17:33 -0800 (PST)
Message-ID: <f38e0aa3-e10e-4e5a-923a-76686baf2482@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 12:17:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
 <20241206191900.2545069-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241206191900.2545069-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pn_clXdjN6toC_H8EP1Qf0UE4lesDCzh
X-Proofpoint-ORIG-GUID: pn_clXdjN6toC_H8EP1Qf0UE4lesDCzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_031736_500098_41284D0E 
X-CRM114-Status: GOOD (  17.25  )
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

On 6.12.2024 8:18 PM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 178 +++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 55db1c83ef55..afe7113df4af 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4426,6 +4426,184 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		camss: isp@acb3000 {
> +			compatible = "qcom,sc7280-camss";
> +
> +			reg = <0x0 0x0acb3000 0x0 0x1000>,
> +			      <0x0 0x0acba000 0x0 0x1000>,
> +			      <0x0 0x0acc1000 0x0 0x1000>,
> +			      <0x0 0x0acc8000 0x0 0x1000>,
> +			      <0x0 0x0accf000 0x0 0x1000>,
> +			      <0x0 0x0ace0000 0x0 0x2000>,
> +			      <0x0 0x0ace2000 0x0 0x2000>,
> +			      <0x0 0x0ace4000 0x0 0x2000>,
> +			      <0x0 0x0ace6000 0x0 0x2000>,
> +			      <0x0 0x0ace8000 0x0 0x2000>,
> +			      <0x0 0x0acaf000 0x0 0x4000>,
> +			      <0x0 0x0acb6000 0x0 0x4000>,
> +			      <0x0 0x0acbd000 0x0 0x4000>,
> +			      <0x0 0x0acc4000 0x0 0x4000>,
> +			      <0x0 0x0accb000 0x0 0x4000>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>,

This one's permanently enabled, you can drop it

> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,

Is GCC_CAMERA_SF_AXI_CLK required too?

> +				 <&camcc CAM_CC_ICP_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_2_CLK>,
> +				 <&camcc CAM_CC_IFE_2_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_2_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "cpas_ahb",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy3",
> +				      "csiphy3_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "gcc_camera_ahb",
> +				      "gcc_cam_hf_axi",

No other binding calls it that, please use `gcc_axi_hf` for
consistency

Other than that, looks good

Konrad

