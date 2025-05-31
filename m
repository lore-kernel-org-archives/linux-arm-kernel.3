Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9685DC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 19:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrU6uwD3Ib8Ilhn29fx2EmcIB6JSJ2gX+zA3T2fzlk4=; b=UE0RDYVahmx1dUj28XjpkQq0NT
	FyMADB+7iqldYIvUSCAy8tiqZgDiixglYhOgCcklvBzgy9jqZuZiRNhPfk6FUjSvUMiWYyDSMSHGr
	HKzOfNTeOB8WlROeB35ozF7JA7DbR8GEJeMjJMla6gzyX45GUwSmlCbmyHU0n7c1CwQzRTBVTWoV+
	yKeAWtKCwVuKeQrBLlOWlYbLa2/9TqZkG1PdaoU4Q2hJk7T3OGpzFUX48QZM68/6c6R9r6Yu2moir
	2V+QYH7F78ar1g8eC5L9Ly/Nqx8bjjBSS4svAz/beae+LN75az6gaUgqZD1tpIVUt0fdL06NzLljO
	+Iwrz6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLRsw-00000004Alw-0XEQ;
	Sat, 31 May 2025 19:28:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLRqn-00000004Ahb-113c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 19:26:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VIeWlh013631
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 May 2025 19:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CrU6uwD3Ib8Ilhn29fx2EmcIB6JSJ2gX+zA3T2fzlk4=; b=KkEgYvgSW1tfljJG
	OgLzcdEiLuGCiMiRdn5Hy5LiNRJpBwT4QYXmH8roanWxxcWpV2k391goKEDBn5zC
	AVHl2yAWt6ka1py0J3gDwBbBu5vz3rBtnml/YCigCxpV69EObug2Xn3WY11AdgBP
	B3Vq8iNJc0v+K6id1TU8t2sk2y5iY7yB4c6FmdueNn/F9Y/APY/EI59DhC0faVvc
	GHqGkH3l2CJ8gQaMFK6vcu/0xYgp72WnLaTxbmiVSP8pQZrMpukHOIlYRcbjapF0
	2mN/yJYCSswuzuKKa5v6Uj95Wfg5aEgC0yE/5XG2YWCVnGkX5zk7vLmdzzbs36de
	grrIow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytm6989g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 May 2025 19:26:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097083cc3so68121185a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 May 2025 12:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748719594; x=1749324394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CrU6uwD3Ib8Ilhn29fx2EmcIB6JSJ2gX+zA3T2fzlk4=;
        b=XcHAdFD9LqpS/rFDLrKyy+A+5W9eqAcI0+FLrTlm3GG4AyP9Iwl8GpgCDM7xSRMaIK
         lRguhdtObILieAFTNwbr8NMApZqXeL0Ehd3U7RpTRS6TNz+x8S0wmC7VjM+HY/eDJeEL
         /MiN7SH91RF8cxXLD4IAB7JQLnf4m6BhYo9McNkm6gAxcIm+aQj8Srt3huBcyrsu/5yZ
         Axvm2c7gusLLwfCglKeSM3gUOO/56aHadb/g/YpM5IVFbiN4v4Hsci02O75JqI/qz2iH
         CT1tAxZhnJi2c2/3UZyH9rHswz/4MkVXvaVN4hUbdxhKVTKawHvHMDRmxXIR/2z8n2Ql
         ps8w==
X-Forwarded-Encrypted: i=1; AJvYcCW2XZMahKbAq42nDrUgVhJt9gs6wvk1LBRbh7/CVYL+sqnzT1dOQbrvAXt3CsGtToxubk4LeRnJGRoLV4qmcjE9@lists.infradead.org
X-Gm-Message-State: AOJu0YwxR1oyQM8Vr7pKSTi/Ad5RWxSgn0Yqy/MCC+pSJSd6rqvH2HXq
	raKI61I9N9w5VX8lmwR7NocCJxEK9+bVM/NS5qtUxx5rWWD/f39cv/Cqohj/QBk3BbsPXZCNTUL
	WlMkKipEyM3ZWRlp/SZhHno4j7qZGnS5aK1yW1ETaBGfyBGEQScMCRU+MEIWqvz5mFjScYyta/V
	INgg==
X-Gm-Gg: ASbGncs5hoCqbkdPrZ5yOgWoIIKF4EKzaptcIGHZZuOCVS9h9WsNZrvjBNNKDbJdrmT
	PvEdBT0u2sb7wWXBJx1+bHtsrquSCuwBn636cOzDN7OFS7B2gPArCCUC1NSMbJmrLtHJPlZQDLO
	cHMVdUTR3KEZm6RLJ9+wXM5f2EQaBgq7kiVBwz0UhS1vawu6K9O9oh6tgpwlTqf62YrCISGyBZV
	UYfYnb1Ti8+4jBJsjLqVxkrIwwLicU5a+hmN14jCldHgEQv4a+Kb5oXQ7GciFBaE5pHyfaZ3z8n
	G2QtnMFe0ToP/RII8qwzhQJmqx5gdNczovHdrlPbnJHUs9fCU3mZq3C7WDkmzeF6Yw==
X-Received: by 2002:a05:620a:394c:b0:7cd:14b:554b with SMTP id af79cd13be357-7d0a3df914bmr403843785a.10.1748719593885;
        Sat, 31 May 2025 12:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgWeFsZuQVBnuevfLlI3W+HHd3FvIh2wDCmEbb3BOsXmzJcbTj7lwjNVLtEsvsVJTLk0yQ6Q==
X-Received: by 2002:a05:620a:394c:b0:7cd:14b:554b with SMTP id af79cd13be357-7d0a3df914bmr403840785a.10.1748719593528;
        Sat, 31 May 2025 12:26:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6058563eebbsm2805063a12.67.2025.05.31.12.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 12:26:32 -0700 (PDT)
Message-ID: <03d76a6a-f027-4529-a917-2c5f92530de6@oss.qualcomm.com>
Date: Sat, 31 May 2025 21:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-3-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250508081514.3227956-3-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE3NyBTYWx0ZWRfX8LQ472XB7MmU
 tdK3cPL0MUl2k4G3gLI/y0bfffLkxHefHcZpNDgugZtcoiSdkLjhrBh/8oWb3flF63kHFSTzHZd
 jOiVNsly3mEH5TBmnISiItaP1gjfBXhxZ394eq/2FU9dv0VTj71uVLRN4m0F1dRj1OCuU7OhXD1
 1sLzSg7tanoIWTaGHqRaRwWn3EH91pLMesek6BiQf63iihWsK2w5OvLF9m840Za6yde8Q0Uz5bU
 25ciU0fSZQyG/lCd6zU2Co1AkUsE/hLQ7Jf/swhaV8utIEgmMh5FA9OVcaD1A2bcSAYbtMheOje
 R+QpzvhvIr9VDdtzOLAregQuwb+CYAqnsYW856S6ZRNJEtioey8VpHhMnziMRuNCYeH7C03NhAz
 R931ppPWY6DW/bXGVWF1/Wx04ABwd2FQfKKJYWFYPtSWxjqNW6KlivKsiU8ZQ7uGE8SoYgSX
X-Authority-Analysis: v=2.4 cv=EOIG00ZC c=1 sm=1 tr=0 ts=683b57ea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ICgkrN6sfqZrQ0pjF_MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Rq3bD66XHTZ_P8ZB8hSm5v4i3SaBxGy5
X-Proofpoint-ORIG-GUID: Rq3bD66XHTZ_P8ZB8hSm5v4i3SaBxGy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505310177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_122637_389988_981EDB1C 
X-CRM114-Status: GOOD (  16.77  )
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

On 5/8/25 10:15 AM, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> voltage rails can be described under this node in the board's dts.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce9..430f9d567 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3287,6 +3287,17 @@ opp-128000000 {
>  					opp-peak-kBps = <15753000 1>;
>  				};
>  			};
> +
> +			pcie3port: pcie@0 {
> +				device_type = "pci";
> +				compatible = "pciclass,0604";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;

If you end up setting a v(n+1), please rename the label to 'pcie3_port'

Konrad

