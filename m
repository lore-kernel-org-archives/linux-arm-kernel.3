Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E8DCD042B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 01:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEML6pOrA849wZuEgdOsJGjlKLmi52IL7r85pj59rk4=; b=rrePjS9nE3bkseMyCW/T5hJ3El
	lyrIMfqdMzNXRJ/YyzwHkwdVp604rZJTqWSaSmv6u8aywNrRdPCH4jTlE8loB4XML8Jc8Bcj/2yVl
	PJzo1/zAhIzaNaeJSZL0Di+HJz2OiQyQCMbSGs5j2kzYGRURywdRFqkXcS9EFznvOBj7fm7rO5nwG
	ozI+N+OUYPG1vTab/PdgFhvYstfGRglTngULT3zE8nvD3Na9U9m1X6q5pFcgE3B14aJdPAGmPhDiI
	8AhP6KqUYTBUhdtjnJhNYVLGgmiakIsG020IWPPWSeyoV+P/OZLwTGMpRhgRX4HbYYfZr+3wal9TO
	bsG1Zucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvta-0000000CJhj-0EgP;
	Tue, 06 Jan 2026 01:30:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvtY-0000000CJh2-12gK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 01:30:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060ocWe2107394
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 01:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cEML6pOrA849wZuEgdOsJGjlKLmi52IL7r85pj59rk4=; b=LayIF0Q7t2nolf+a
	NdwcSYzm2SBMHKdiMK/cOY+kVgcsBBOpRyiA6Iz7jY9UBcAkogn32PPfm/bsKd06
	idKq5o2YYVdebufB2FQZCrBm4ZOfgw2oO+QsZ7HjCEJGbutW4XILAae5IJg4kD45
	g5ArZdHc4ZqbMf6S59PqccTrmpKzbXyfQFjcxSQkk7Hin0qGb66RyxQfZ3WAx1fQ
	xZmWqwcvVpazkZzYpeuuSoWx3CYGMKVtuoKomwU1KwGhngGBB1uVG0B9fJebAYrW
	9j6XhwIBGLHV8G+lFTOnAKnc7SfYTWGLDZM2adcK461BFzdoBsPA+grmziZDIpF/
	ffBPQA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr7382va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:29:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso14152935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 17:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767662999; x=1768267799; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cEML6pOrA849wZuEgdOsJGjlKLmi52IL7r85pj59rk4=;
        b=hkk4eosxNno/UbtrI3FY6dU7Gu/YNB0GIZKAv+SksXxkYDwBMfWTNFSKjag+49HF+7
         mznJaFIk+gcYClf70qgTqXrG8nunaaMgHsuhcqy/wHfTNx0KPvkrBFYiv3KgMYOTOQEx
         DSVQ0F9wsFj4oVFV8KfXf7JPcIjbgMQMeo/dggzd1u8dG4SVLqFDrK51+NWpn9RY0eCV
         K2PKh+DtP06btC2FrtXxvzIDHrNxb+JArRWPo5s+XPrMC5vBBchzfmXYaoUGCTaiBBZN
         Gf6w0gplwZKsiwA0CRTVFZIu9/cGmKlIT/QxPxV6j6QuDTGpwd5zFysxaenLpOUabLCC
         3fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767662999; x=1768267799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEML6pOrA849wZuEgdOsJGjlKLmi52IL7r85pj59rk4=;
        b=u/s64r19dlKspLQAUYMtUIddwDQ5+0nCWPUB9pgESqZVTYop9Z8DUVrsIQyQROe7jt
         SM8ntQlGRMVvjH7Pj0GqasopMC2QxwTj0b30rqfJeCSTipKIMlo6KeeLfkcoGQO0mkyP
         KN8rfrviyKp11chr8DwoEBoV0acHvnV0bA6uJBVzZCfOAWr/FS7r+z8uYG6idWtHH7gW
         XsZgICWosteiTFvZlVU76Wl54fDbGFc0828q5dBRUIA1rk1getzv90kWg1r5zIM1+mEC
         4YvmjbmAWfaowxucXU4wq20IzmAKPvvBLCDZpB5CWJolVJpKr1mFCERSZVHBVmuKbmjX
         fHhw==
X-Forwarded-Encrypted: i=1; AJvYcCVwJYsDWW/DNEIJKd4s18sQ6dUetOtpWLoxrX9cPuwGFi6VDcC+rgGErba0ADlJWW006GeiV4isJ+4tQmHyUmDp@lists.infradead.org
X-Gm-Message-State: AOJu0YzV3bevpg9CtqrMtAiCrMjI+7Pdxsx3xosYDlQ/8dvOU6O4lCHf
	jk/mlaiZcFBp+kFiBsjjIAuq7uFmajgHOqUfsbhTSZpPOlrtyUTK05U2memsrZCO/L4qWJIZQJW
	q9RPM604j/24kqk6OrovXazyU0RokOhI8wFUTu7iwwzF+cOELxW1SDP1gIQ8XNOQFKwXD+beWFD
	rOGA==
X-Gm-Gg: AY/fxX6t8RKhbCE/4/7PBIJYyFmCXWtILUw2/x4AMzpPmj/CVZ9PtIoHvUWObU/GX0w
	tweMFB+ECa3xZaoAJif9M2uqNWet97wXzCmxd5aVINZsKgK2FZwheMnZdxinW+wkdN6TroBg8F7
	fJvBYK96QWcWWi3ON7vjdWWyuBEWlEVUZiFAzjvn4fQ3VMOokeDqBT3lJRVFQVtRuRFuTOYJjVy
	rJ7Fs7Xxzp5Sq5yeCwrMUdj3feTg0cQXd5BOJbpM/c9X+EUxKFVTIdjKRQlSvp7xXulkzLirta2
	zpcRbCluh2iKEbznk99kR7dPApxnE7k7mxOQGv0ZP7ztaI2BuAthPHTnDcR+10Y3xxodT/fp5xW
	vQE/aRnGSTBYFMqRfYyin8Mb98emYwASqYfBxDv9+eIgig2g/fbI8Lg6ICYi5tTtnzyl1VeujAS
	4=
X-Received: by 2002:a17:903:2342:b0:298:344:1229 with SMTP id d9443c01a7336-2a3e2e1e544mr12112965ad.55.1767662998862;
        Mon, 05 Jan 2026 17:29:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5+7CG5xgC4gLsroYKzxVVsBNnVADKYWQW7AEKJd7RNZaU9tSR1esDn4MXfLTh2KoFIFE6zQ==
X-Received: by 2002:a17:903:2342:b0:298:344:1229 with SMTP id d9443c01a7336-2a3e2e1e544mr12112765ad.55.1767662998367;
        Mon, 05 Jan 2026 17:29:58 -0800 (PST)
Received: from [10.133.33.149] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd495dsm4208955ad.96.2026.01.05.17.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 17:29:57 -0800 (PST)
Message-ID: <3618ea01-1fc4-4fc8-a0d7-23336c633435@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 09:29:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: monaco: Add CTCU and ETR nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-2-92ff83201584@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-2-92ff83201584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695c6597 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=li7pXvKEtyOYx0Cqe80A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: EcHFTmxd1hzxlaBSa0XZim4NCceXQYmP
X-Proofpoint-GUID: EcHFTmxd1hzxlaBSa0XZim4NCceXQYmP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAxMCBTYWx0ZWRfX37T8U23tBkOZ
 m495qNJZCDRcmFDJ+fBuaur9F16cpGhE7HJ+VG2Iy/nc10unOI4vc2fHgDLmg+JjGDq7q8tMrot
 lov0/pTF+sYJyTQfx8UFdCdV3ouzv54l2lhO3Be4/DZ7z4PnW/ne35Sg4spwOgw9FJe14wtH2ED
 LqXk30k7YWhrcaCVDRbJpxhIbFGv26hh1co9XoImBSPkg/9/mdudw/UjzD1bBZj0aMvZdqzG6Iz
 elBZVsVzfBCFsZSO7VE8Rhe45MVOh1pg9MLG/v+8xkgEF8HkieZ569sbG86GlQIK6x8I8T42Yun
 M2B+L0se0vVRgYvt3wgBmtlMsvgTGtsq8jBE5ZWYuvdFIcdNwce19CEuNhqMUzN7Zma6OGrqrP0
 4i7wml6mtnVh9Fh75wyvvgzJy/0l+964nZgH/w0M9rGRs/UBcWTwcEm4t9+761As0LIFXPjQ45K
 eNCC+q+2bnj5OuCTRFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_173000_300134_7634E3D0 
X-CRM114-Status: GOOD (  16.08  )
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

Gentle ping, this patch should go through QCOM tree.

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


