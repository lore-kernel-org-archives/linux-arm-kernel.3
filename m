Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782A6D1680F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaJKIpZsmBkgWWZNLcb1c5XpnSAJ62BYR2TerfncxGM=; b=tXsQcAsDlF29tq1OEVAmZd1CYJ
	KvuK4FN5O/cT1tTIaQovMeSukGpm3A64PhEgnYT0tPD7vQZJGsLsFQTK7P9gXWJ+c6iQgobmUf+fR
	dSTVLb3vHpWeY+CVGCRpf1cZ+4vPsbbd8Gohkd3RIcwlS+E9gcc04Efxne8/j4U2FpVIAiFcgmjme
	T6c5mrTLgIt9MNmV5bLHhe7HExIeKOPW9HXW+APIYPuEtOqyjbtk/sYJXsKS2l55dgQAMKd3m+Nq7
	DI/3uJaOfdoFbSkvuwJBKTNzXtFJ4pwySSqZobVgSkpIzr2jg7Z5rxQI3L19TDQ8IJRDYsMZOZqW3
	iY49YrBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAGB-00000002ByV-3gNs;
	Fri, 09 Jan 2026 11:02:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAG9-00000002By9-07vg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 11:02:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098mXZn3727889
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 11:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaJKIpZsmBkgWWZNLcb1c5XpnSAJ62BYR2TerfncxGM=; b=OHD7/fCfhck/wVKX
	qXXTB8v2fewQ1KGOw4qvyFvuY+0ggJqBTL+bYqttKbz3HWMX7tM+xwT7bTHx6MeO
	uYg0/sxLuDeSxI6FtoeNubHie2OyPI0xn7aXvaXoYhs83pw+Q5WerMcsieDA+Ups
	H6SRYrWjUWDiS/gFvnpS/egCIRirUQt9Ia9g4BVbtAOabiyTU0Flpvt4F6+2M+78
	k0jmHC6W0DJUNSG0x14qpyFrnd2nKIIdi/+ooc/+liDQR+3hVFF7aoH+suCLW/tm
	XeNPFVJK5QelweMozEbUrT5/CPJApZKJLPlU6ksbmCGtfEKq+Fp+iPOA8tkapzEg
	9p+I3g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkhrwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 11:02:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81efa628efbso3164b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 03:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767956543; x=1768561343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GaJKIpZsmBkgWWZNLcb1c5XpnSAJ62BYR2TerfncxGM=;
        b=CudUWTLQNgEYpBQ8tUMD4rEX3lxRvLmA/rGtHkgmlEhTSfmBdQItVUtyn7ZZMtRR4V
         FbcBgDNAx10HgpAG6jf+xEEeXk9plRdJQXQYk/XeMl0Q6mi5Gg9zZP0I7FKAFuDHnelf
         Z3JjIB98/azdFsYFB+nI7gDdOUMRClyn3dQmHUutUk/w2wnxlbkOE3u6RK2cv3Y6ImF4
         IQIxg4FJ0dcxxRsl5tZgT5lJU7OX8ndfvwnewtvhscACevdpv0nxR4LOS/VeGri9KztE
         GLBEOfI9qiSGlpMbuXTFkIrF0gZb31q84Ifks6UddJh90vuG3Q819W9FP1ZoLSCsMiQy
         lhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956543; x=1768561343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaJKIpZsmBkgWWZNLcb1c5XpnSAJ62BYR2TerfncxGM=;
        b=mPszdgvmPs7CAxc0LGiRtvVwax4eMghgUMoNqWWoCdfu+RIXb5EDleOFPZ5VLF+iGW
         cspf6pb/JpijNt0c4RfSwSJjtMrcWNv523eyl7UQsVCCG/j4MFYyXnIYteDPzmtH6rsa
         HfBBDGDAHTYpw3St/APtwlp2mXdhNIhGde62yBg4Xl2MUCFJaJkH9UGfxl2Cbk+pZ1ot
         7LvKUyjKG7MewMzr0MTqp0pKsGcgxbzsmutTIl8+fy/8/Odn7IXa4rzMqF+3fqjDBUAy
         gI/m1JevkahrfUJJ40pMi0Ui4T+qsuppybkT/d2xjHYqNBw2ApjsiYaTVAyKKgeSU1C5
         WAVw==
X-Forwarded-Encrypted: i=1; AJvYcCWoI+cDkDadlSSX3zN1kqJ81tyGeegkPvL6OoqjzQMx/yF3EUdOb2YrEW2Ym/dSufjRbe3HWJW9+mjc1QaEUdhh@lists.infradead.org
X-Gm-Message-State: AOJu0YyXuBK2EkTsUAyO3dqFHlrqXLiZWgsgqGwDz3QHDpv/ioUK+itE
	4BYftaYt7+q52IsuDa8nhT5+Cjb5LWrH9NMtVaTQoAg0Q1u4xql5DFhApmqbEvLIYeenCi3Qscr
	PHBKfWWWZJsiT3CNiTXt+Orip5TaqnOXbErJ+iZuIaLjl+P+yS8wE0fR/v+DIPHFR0ZMhKHzAT/
	01emP6UfghUw==
X-Gm-Gg: AY/fxX7cFCb+H2QDX/VdiZUBHJ20U1ANbn5+khE2xEbxxpKoMbQ33TtfBL3NKS1x80U
	HKFZGEtNHHURltVHvyZLwewodKucMEidiOU7oOZsQ3DX1o3ftum2N905jcnGSM5/s4CB2WjVDy0
	OMNa0CUQcRh0Lvi7rBuEEIQZpXJRTU6s4vgg8LGjJ5K1oLoQMRMbgbZKdnf5OkUIBRB7AqDv4fQ
	p1bwUPNoRYHuk8f9Ei3YDPa1vpfqKIeo0zgiLKSB6+k1fc+BiiNW4Z3FvRjB4V8ZLSBgnsZJjEb
	HYss9yx4JTRfybt1SYdnASlFReoYVWc7IJa5afMrRJNJI/EaVQffzI8/hmrag5EXZnBwW7mowr2
	nZECDJPadHzrZVE8kIKDeLOunBTCfwC5QVYKNFnHWgQbH9t0CFClpa7tBJGOoUccobDk7hj8r5b
	8=
X-Received: by 2002:a05:6a00:4103:b0:7aa:d7dd:b7dc with SMTP id d2e1a72fcca58-81b7e2533b1mr8155988b3a.31.1767956543207;
        Fri, 09 Jan 2026 03:02:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvzGy2x+UxsDPmAc468Dm6CNM2dqZklwm+9aRR7rID6M+AjfaOMAx6/J2tyslW9MWyLhttkg==
X-Received: by 2002:a05:6a00:4103:b0:7aa:d7dd:b7dc with SMTP id d2e1a72fcca58-81b7e2533b1mr8155952b3a.31.1767956542566;
        Fri, 09 Jan 2026 03:02:22 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb4c8186sm10172179b3a.29.2026.01.09.03.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:02:22 -0800 (PST)
Message-ID: <a6d44ed8-828a-4fc6-bb6b-6cd7f8760f66@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 19:02:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: monaco: Add CTCU and ETR nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
        James Clark <james.clark@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-2-92ff83201584@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-2-92ff83201584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960e040 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=li7pXvKEtyOYx0Cqe80A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: w0OLzFQiVE68c55gCz_O5qRjvXHlJqJ1
X-Proofpoint-ORIG-GUID: w0OLzFQiVE68c55gCz_O5qRjvXHlJqJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4MCBTYWx0ZWRfXw+rtF7sIsItj
 SnCIEUy1ttPraUZC3xshSEo86T53JS+ltxFtEuhgkpFssDbtaZOcEbp6FXvHPtd6O57D+YUoJlI
 LNh+TpuWvFI/2pT63c1bqPLXio8M7Pw83udMtLj0C14ysz536rDqLnJCxwO/b5OJfO70P8eQpoh
 0xHlup27MpmzJw0P3OJNr/9I8od11PO/93koM+oRecY1XGlmQC1yveoqszrAngFIx/SkvLIInQm
 73pxgdoidKMd05iNfJI+Nxy4G0+S4QMi5/dvDageRAD188t8dSpKy1s62ZyWUgyctdsatJ3c9Jy
 u7luzdWEDXqOti/XDYW1tKGeNE3gIFkkVuhM5xaGFYwbjOq83IeK8sBmJkwOLBDYj2HMOm68KCg
 bneUglRlUZTI6/GbqouIxYMayeZCzC9p4nAbYXa+HgLqL/BgscYK5MvaUNY55lcNeFl/TjY4BgX
 V5MW39aHIIYsFCNd2ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_030225_104498_1406898B 
X-CRM114-Status: GOOD (  15.67  )
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



On 11/3/2025 3:06 PM, Jie Gan wrote:
> Add CTCU and ETR nodes in DT to enable expected functionalities.
> 

Gentle ping. Do we have a chance to apply this patch?

Thanks,
Jie

> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco.dtsi | 153 +++++++++++++++++++++++++++++++++++
>   1 file changed, 153 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 816fa2af8a9a..1966dfad2dcc 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2483,6 +2483,35 @@ lpass_ag_noc: interconnect@3c40000 {
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
> +		ctcu@4001000 {
> +			compatible = "qcom,qcs8300-ctcu", "qcom,sa8775p-ctcu";
> +			reg = <0x0 0x04001000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ctcu_in0: endpoint {
> +						remote-endpoint = <&etr0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ctcu_in1: endpoint {
> +						remote-endpoint = <&etr1_out>;
> +					};
> +				};
> +			};
> +		};
> +
>   		stm@4002000 {
>   			compatible = "arm,coresight-stm", "arm,primecell";
>   			reg = <0x0 0x04002000 0x0 0x1000>,
> @@ -2677,6 +2706,122 @@ qdss_funnel_out: endpoint {
>   			};
>   		};
>   
> +		replicator@4046000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x04046000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					qdss_rep_in: endpoint {
> +						remote-endpoint = <&swao_rep_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					qdss_rep_out0: endpoint {
> +						remote-endpoint = <&etr_rep_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@4048000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x04048000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			iommus = <&apps_smmu 0x04c0 0x00>;
> +
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					etr0_in: endpoint {
> +						remote-endpoint = <&etr_rep_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					etr0_out: endpoint {
> +						remote-endpoint = <&ctcu_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@404e000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x0404e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					etr_rep_in: endpoint {
> +						remote-endpoint = <&qdss_rep_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					etr_rep_out0: endpoint {
> +						remote-endpoint = <&etr0_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					etr_rep_out1: endpoint {
> +						remote-endpoint = <&etr1_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@404f000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x0404f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			iommus = <&apps_smmu 0x04a0 0x40>;
> +
> +			arm,scatter-gather;
> +			arm,buffer-size = <0x400000>;
> +
> +			in-ports {
> +				port {
> +					etr1_in: endpoint {
> +						remote-endpoint = <&etr_rep_out1>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					etr1_out: endpoint {
> +						remote-endpoint = <&ctcu_in1>;
> +					};
> +				};
> +			};
> +		};
> +
>   		tpdm@4841000 {
>   			compatible = "qcom,coresight-tpdm", "arm,primecell";
>   			reg = <0x0 0x04841000 0x0 0x1000>;
> @@ -3106,6 +3251,14 @@ out-ports {
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> +				port@0 {
> +					reg = <0>;
> +
> +					swao_rep_out0: endpoint {
> +						remote-endpoint = <&qdss_rep_in>;
> +					};
> +				};
> +
>   				port@1 {
>   					reg = <1>;
>   
> 


