Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06396E66886
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 03:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeCrpSAem0l6kJVOq1JnyUO91eCa1P1yPgmrmdkHcU0=; b=Sz/xrMB7Z4O4Qehj4Xo75n2gwq
	sUn8fw7FN0RkzuBX3wEmMeDq2yCTJu9PpSCBsqrNmez4hAIf0KsUsUH9jOBla/5XwO1TrgMi66Y9L
	b0vSPmtlnLtRaucV+9F/+NnJNJaKNQSZQZba5Pz59CO1y2JbgDTS9AWy0RXdB+xaCW5pDHph9C6zi
	whYHu58lGb4WbcI9z+vHPAfTuWbpMyo6g9Na8lSeAQ3v+cjKikg4nSKdDRoxZlqDynXoVALGmyGTj
	vTIcNi2ll+E/iPQ74twUgt8qL+MVyuS4hwd+FP+Mej9hev18gLrdGc+TcauCIytNnXyW3SAUmevs3
	jSYLNeRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWGJ-0000000D0vC-3E5I;
	Mon, 22 Dec 2025 03:07:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXWGH-0000000D0uh-2DCn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 03:07:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLNTJLf3871485
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 03:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SeCrpSAem0l6kJVOq1JnyUO91eCa1P1yPgmrmdkHcU0=; b=PgIYrdOgas+1a5GO
	YAo57qEpgOhEgA1Drloyv/WcE65w/2BVV+NMQIirQU51R/VLj08ICbfzPOxndU68
	4Nb7s0wEQs/tpriukz0hR204D+hnnWdfuJBC7pPLKOmvblpDabvoma9d0P0QxFpc
	MFB97wbjVs9jqztxddBPR0JjxKc1K3S1+f7SDtHLSbZ/QzU/DNt4vLsNc08Eex05
	pr3jc2+FTOZb9uF2emtK3bQhYeHPkOY0NBw/ubhp0vn05Z87Zh2FALMoK7H8Q7Wy
	KqEgIBES469BTVB6bT/fQis79EC5qPr8AeWxWDdJZwpTw9nX713voUjYf6C/gQSj
	fFC2NQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru3dsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 03:07:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7d5564057d0so5674049b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 19:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766372822; x=1766977622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SeCrpSAem0l6kJVOq1JnyUO91eCa1P1yPgmrmdkHcU0=;
        b=AMmXOHmcFCFlBBHeKX6mGOllbPbejYv1bM3l3uFauSb/128f2RBwwJO9HYyPLwlfVq
         Wjsid5MWJ2X863xYWR8OcYYVqwHgDDdBweaWTmHT+LjuoPZvCrHkUoSL/AkSqVsJ7og7
         4SKQ7VXDURYq/NtJsxWZvAen13UcmoLOz3wSVGeFistzaH7ui0BYSiS4rTpWXf2veUTs
         5RTqC7P8/v8wMp69ggXnBeVdqF40Go/ASouhFH8QQsLWmLbFgrYDHcVgOUPTVAOlu+0l
         sFKF5Xs7GRxw1Cvi/qSXpcr5n2/cHUHhDWuK2qeNrjrsJEHuXR3Rw+5q67cEZzj8U/np
         vFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766372822; x=1766977622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SeCrpSAem0l6kJVOq1JnyUO91eCa1P1yPgmrmdkHcU0=;
        b=IZdeynXo8/cUZChFi/Zc4Mh5RUDtkdRt7QoRVPt0ut9mnTam/gkhGCqGXuJSWL4GCs
         Pwag5xmUbIjCfGwQqOC3xZjPSJqs6ROCKRUAc1+2Eb1P/yEGgyebTequ1hvKetdPms7K
         M4DEt97QXUMC8U3pj3oYT2ZWjaihFeW410+PUeGo18sjbB2ztJMr21n82u+TqVSbMe0W
         Wh6dx5eOHwXKAIiuLN/nuMb2cCuEI5BjsjCfwz3HnYh4lbpl2XD45nVmJiglJuYd2WjG
         wqelmxPy1dEdXXM6+daIHW7TTBYSJmTp6ViV61x0F0lVDeIzN3aofzF8sza2m3fcoSCy
         xQvg==
X-Forwarded-Encrypted: i=1; AJvYcCU7OGtF87NVNTkTB8lXT1jFAmGJMEVpDMfNK/baBDESTS39oitv+hyEb+7rbN7dZ4otR8+uxZiso8HladA7jcgI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl7lWf4XAiVdMsWSUfm10jYdee5mkAY2lqCfnkSh1SIE1/qR4r
	96YykOA3fkrJ79yn2xpSDN07Hq7r7Mf8sFi8hetAowP71Cs78Bl9bm9Lq5QdSvHH3VLwJeJBCRx
	+oj/j+gWEoxmAa3AFxzoSPXiP9Pm4GpOBrsb0iToVcqTocNEcHfWsI6k5ZkPAg0XnBBN34vtIWt
	793A==
X-Gm-Gg: AY/fxX6SwQCv+9I8243kN6myxp7R3NU1xDNYNuQb8h41ZXlU+3HiEktbZKCqUzOXrWy
	MuMzkMkZfymr0X0TVi3ns646B0CqrjkovaDi0zqBIZUr/XxRwEy4t42sOxWOEYYu+m5DA2GDO1R
	2bj3Xy7pGTMrUUB0kLNjsQO71O0YwaFxyjBHhAliTuoifl4FOl60l2CGV8IpHyh7AsepqoIvtN8
	9z+pCVZe8RDDHP5ubQAh4UHA4i9TIlJSegE37675/WPwDSus1jzzmvs8NY0s8VmYybJEx3i84ij
	BHCrYABrT/0NyesOmlkn4ouobIJHj8Kv3f+CA8xeG/MVZGoGT6YjkoRMj/Kho8mmiTrWQPvxmk6
	VKVQrpTtQ3e1L8NiiqDmK8FudGKm/n4VgkBVpgsnWdH9d2ekoRJZCPAzIfGn7IBdr6CCSmFoERJ
	I=
X-Received: by 2002:aa7:9a85:0:b0:7f7:5d81:172b with SMTP id d2e1a72fcca58-7ff664807a0mr9440314b3a.42.1766372817692;
        Sun, 21 Dec 2025 19:06:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiRUjmcbd0tX2U9/3iVcDu3SiKtj8NFf3VTBuPJbtWPRdBoriq3syFrTSFOJ/S6kYkjTfv4A==
X-Received: by 2002:aa7:9a85:0:b0:7f7:5d81:172b with SMTP id d2e1a72fcca58-7ff664807a0mr9440297b3a.42.1766372817208;
        Sun, 21 Dec 2025 19:06:57 -0800 (PST)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa32916sm8651050b3a.8.2025.12.21.19.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 19:06:56 -0800 (PST)
Message-ID: <0d3064be-c333-4ec4-9607-5122baa0f256@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 11:06:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: monaco: Add CTCU and ETR nodes
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAyNiBTYWx0ZWRfX/clXWtNbd41V
 SoF6uWEMUhYwF2WcA26kPnBjFMiCHowqc1whNm1x7qIKY/+XCOQLqlBIE4nfpR71rlsZAmbsxPZ
 WrxACPWd86YVTyfwI+4Z+KeqG2RpFHG2MhKafviu8yxwO5I/RwgmMqfV6YHgZtMhE8JCc2xT1Xd
 rwUx8JN+OcaDscGVUuiKP5L99aYJpa4dJm0w+Ymxdgs6A3gl/MwiaRANK9cc91vnNEJNTXEPi/W
 OWgjovpINQI7yP9YppKaRXWTaRWOEp4P2gthAy6r67OllQXpDTQErd5EIyxIQ3a35UkiCLSyWcR
 h1QJOf/pq2VgA14J4SFyUr3q9ImBcM6MU/X+zxoF2MU3pySJu+zbl2nrT5/OfOj6fEkn++Yo8zw
 amHv6eH3wRphIZHgatRsIV11AxLTffXjcqkP9eVtp610FPhDFsgNzgRM47pCV9dTT6Wgveg2YsG
 RFvj0NFPX/jxWDesq4w==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=6948b5d7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mHaL0BgOlZfMPfi31Y0A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: -68-kz4mc39czqC1AXw7wPCeHGEuT4sp
X-Proofpoint-GUID: -68-kz4mc39czqC1AXw7wPCeHGEuT4sp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_190705_608925_179303D0 
X-CRM114-Status: GOOD (  16.02  )
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
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/monaco.dtsi | 153 +++++++++++++++++++++++++++++++++++
>   1 file changed, 153 insertions(+)
> 

Gentle reminder.

The dt-binding patch has applied to Coresight tree.

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


