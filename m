Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812C7C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcR4USsPcIz2SiiDINJ9gwMKUZS84QFhsK3lu2vuxlI=; b=EQFpK3QDTkGrGMCHPCLjUcgHjL
	gtaIERWdaU2RwPc2P9hZsce0Nwbqk3onjgR/xfdHXdNjsVpFNSo5O3IuUjNhT7q0P7IJqVHYLOLhy
	TG4lU5Cyq0wuXN5zNaxTJ/w8UeA1qrblszUUB6n7V+D4B7ACwnqo0X0/mcEHCi8s5vkKmBC2uzvaV
	yIRxd8uxEMgA3sFzinrDyadU/Rg2ZJVgcZeNvO82SzIxFK7SOimrgMeBqRwr7fSWKysT55y04vQYu
	aah9+omVqJEvUEkfYple6VCfx9YtJI4NVZRnHfL4S+dsZ225a5ET1/OYjtqAAar3e0vJYkh5j3itk
	WnWfcLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HKm-0000000Gz2k-0REZ;
	Fri, 25 Apr 2025 11:35:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8G0Y-0000000GffK-1tGS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Apr 2025 10:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fcR4USsPcIz2SiiDINJ9gwMKUZS84QFhsK3lu2vuxlI=; b=GgJcQQlmRqCraUCBU+w3LLmggB
	WcsXCIo0ZLBrfMaa2NgpYx/NaS2YOOaSaE0HANEWRMF9bjU3DvQ5p2T1QMMTy6aTJjmthu8jSgI2e
	u66cU7LS0s1c5JtoIKc/nQNejPxdEDcXuuc1nokwCaI4u+rgmpQwMqjI/G1rOj6h3ZTi6BLhVCcwU
	Pp6u/6aNKZ53gyiMY7SOncxrlvjKkXn1Vw32GqkFygZp4uwiRbh7QtnOCSlCTNbBSAMLoE+j0hpwc
	e79Qhx/5tCWcQM1Bo10ygyknIXQc2SK8VIqS6zUBJNFLGwJDMNUX1sKCEVdyWk5Pq+7Gzqu5XhzLl
	/Rx9c0yw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8G0U-0000000C1Hm-3mvi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 10:10:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TIio023166
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcR4USsPcIz2SiiDINJ9gwMKUZS84QFhsK3lu2vuxlI=; b=aHCveC6topOtbt/G
	YBAQf5YiMkBmQyKOPASC1HT/Av0IGvmWSGX+WtzR28AKa9JffPh2xfE2bgznn6Iy
	wx5UtTTYpEQdNIKGOgsBRazC47Ch/3Rm+xWgYxuCPF4nJqJjzVWD4eW4/eX0qjcD
	jhhPYLYCQVucAo4Qj/sC7vEfgJiRYTbybafgFDLtF9bak/qWpTMfFPN3YyU56K0N
	2rM4zqZffKm2YcQBocb9dw6Re03sxUAmERCJk+UyJOejzfUfmT38qw3UIFXZQkL7
	TLJzwhksHA1j4sECE0QZDLeyxrpAQYsDd6EC93MjQtM/bIqivQohfaO0qIs+ZoSG
	QI/2Jg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0gpux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 10:10:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476695e930bso3019611cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 03:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575799; x=1746180599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcR4USsPcIz2SiiDINJ9gwMKUZS84QFhsK3lu2vuxlI=;
        b=SZtK14+HkIsx7QRzIp+UPcur3Vga3Y/OvYfdomeVywcN6+AsTCaOLGKjAnH75mkOxz
         3WdR+cct+XjQ9ezt5Uu43jEiX+NgJtejwRlDwX52b24rOPu6Rkn4aEX1MmrGKCjsnaJh
         /xuGZrGrvgmo/muiWMnyiZawBFgopTBI1qMEp8zRL6R13ZM6tfjq+xOdUk7n9Dk7Bs4T
         NdKtA9LsOxBv/QTea1cfhUqKnqv8AxNVjN68NQf0BBqgWpsMSR+0UgbZeNzViK3RCbsY
         VlRtkfOepDJM6s97cG++mZWL6f3CoZxr9BmeV35PuKyDR4bLUCPkic/5rmCY5eKWs2WG
         BZig==
X-Forwarded-Encrypted: i=1; AJvYcCUc4zmKXozUGeWEVc7nORIGppaEGKDqZKY6g4/HVQQsUhm0rQ+2fORWjxoCJ7PlVMyxCNMRPcrWud2pALyiqwQe@lists.infradead.org
X-Gm-Message-State: AOJu0YzRkvenJ0LH1Ubb1hXO+5G+iIVhXawlmAGbtL7gBeL2Zsxlm9W0
	4ICqNMln1iG43JyJK+go/nCavWtemGOalXEkFIe5+P1L7m7n9wFbFsidd0RD7u7mxmfMDrvfYgx
	yQ0cZBjZ9+Tb3mLMkxPG3ZI4+xjaPApQS6U1BVDMBm5ukYz4t+WOv73XjfPSCdwY4J9IccLcBqA
	==
X-Gm-Gg: ASbGncvDqDTAR3GlKAc+XR8xqviwGA3SfXC/szkYjBz8Q7HVFzf/R/l/rg63R1JJ00X
	LNvSWmKsrFg/EXxSryNHV23Ymrsg/1fRz2ee6hcgAEdPZW13llpN/oTjh9FDyOyi6mLKBrM54PR
	gWk02zq2Lkqx04PJzWsGkgHXnrA4WnsIK3haazvagPlPSWsHGaHvfpv95ioXJuzsgW/res0hj8b
	ESJNNVv76ECAtuf2bUMVO17HE1mIR0nr2XprqpQvQwc6dJ1XX9QaGOF3Hez1WnwQpPE16VV50Dd
	fTLrLHxovBxlmtv8FhNodO0mU2Vs8/HCgNlIy89H6KnbhP7os311Fp9WnO1o6gac
X-Received: by 2002:a05:622a:58b:b0:474:e664:691b with SMTP id d75a77b69052e-4801cb74fdamr10232071cf.8.1745575799383;
        Fri, 25 Apr 2025 03:09:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpVqFMJCg1cVOFVOb6wfjoxuCAz/gvhlpNlvEb69gxUneWgwsWMVnTYY2fOlK2r1AjnFI+ZQ==
X-Received: by 2002:a05:622a:58b:b0:474:e664:691b with SMTP id d75a77b69052e-4801cb74fdamr10231981cf.8.1745575799070;
        Fri, 25 Apr 2025 03:09:59 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8f3dsm108180966b.110.2025.04.25.03.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:09:58 -0700 (PDT)
Message-ID: <e8db59ab-9832-4d48-af53-8586ce828c1e@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:09:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1e80100-qcp: enable pcie3 x8
 slot for X1E80100-QCP
To: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-4-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425092955.4099677-4-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: heeKhvktIx-j5Ekr-YJipdMkKRJ_QqyD
X-Proofpoint-ORIG-GUID: heeKhvktIx-j5Ekr-YJipdMkKRJ_QqyD
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680b5f78 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VUPiE-F7cVA44BgGhqEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MyBTYWx0ZWRfXxdVOhRYVnx2m p7rNTOosRJ8PdAbYpX8NPp8eYa2lHYVmi203AtAdVK7r4JXLwyojcKQxyo4MWzYvXvif4XxGbse r9XOxoq6SFhFuYSVdVxXijEEyM45fO2DnCT6c3foZUEbDBkCEpqBPTc7jLceUyKZ072+tTI+SzX
 ry1srLp68uJpJvlZ1s0jjxZM8pfw6J0n2cW1NgAQaym4nXRXuAt1PvGqOhWpFgWHuZBNbj8FUmw o6dnRjkJJlXl06gXcGpg4CJnhSRbvMMiURqIVAHHcubLxgYlY1zEkdhlDFjeZmNUeHzAutIto/a VoPMfKd7dJOXAR1CRE0c/xbyo+ZVj4uUtM8E3uaXfOcDJuvEo7WM+kA+FiCu1pjF/PuDwRXRAva
 20DWO+89nPLuTX4sPzt2KIwMnSr3j5nVKCzmR/8I7KzAHgrs9gHnWV3qcrU2Zw53qtcvP2dv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_111007_388803_CE86B067 
X-CRM114-Status: GOOD (  15.38  )
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

On 4/25/25 11:29 AM, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add perst, wake and clkreq sideband signals and required regulators in
> PCIe3 controller and PHY device tree node. Describe the voltage rails of
> the x8 PCI slots for PCIe3 port.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 118 ++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> index 470c4f826..88dfd2199 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> @@ -318,6 +318,48 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_pcie_12v: regulator-pcie-12v {
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

Please keep the 

property-n
property-names

order

throughout the patch

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

