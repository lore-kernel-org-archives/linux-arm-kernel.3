Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC1AC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 20:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qmPnw84nsjJYSerO2qslMAX4/52384vseCZfcQGqxQ=; b=SquzT48MKNcNfqz+n0VYf6o8SE
	8l/LK5NMvV2yz65K40Da+7y7mbIUDrrQPOFCQrP7X397D+VTSYVZ8TMFs5097VbYV2Om+r17ls6gX
	S2o+Zwheufdo+hJIQhBZlvqh1X9xfGyzuzWmbPUfQx6KTX/RN7X7UIPXc5WNJlougPZXZxqA+6x29
	t2DWpOHrMTcxabCdcRoqV/nCxNvl2UmjApjMvvBy7AJg9w6uk3lOI5HpNInxkCdiYs/fPtB3L5erL
	PDs5amOtS+W+nn1qeeQ/X1S99jMOaMA400BR97wUdw555U0dJ0dulY468xcj6HFfiaaKbnberbMlM
	mrXNg+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO0O7-000000025gN-2CIl;
	Sat, 07 Jun 2025 20:43:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzz6-000000023NZ-0vYX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 20:17:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557AtQQI023157
	for <linux-arm-kernel@lists.infradead.org>; Sat, 7 Jun 2025 20:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3qmPnw84nsjJYSerO2qslMAX
	4/52384vseCZfcQGqxQ=; b=SmqkSygFjoITTti8NDVWiGXB87TBwoXsGzz0jB29
	B1v099QQlLZbr2/Rzz3bV7j7dZXfXg+OYv0Zgv/kzBlKy2yntIpoRR+KQxSQ0Uj8
	7gREUCR+hhRytxVXgVUdYFNRAl9MgexhdE83DI6K+AKmshR59fTRrhtfNV7q/X4A
	DuJ4fPbjS9XdmMY87lBwqXupnw5fqOU0zcseQigo93IcpanRfMm5CwaRkmHgd9YM
	AZ6IP4RiSIqm0y3mBhg093q+tIJ5leZXehJq6QE3b9tn2+qEagzM3cNp4Srhj8ju
	fV7QohUY7UCUYxvGqW1xA7cMRpkXAleY6tq9IBoeZ0V3Fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6j8ygt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 20:17:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so954459685a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 13:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327462; x=1749932262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qmPnw84nsjJYSerO2qslMAX4/52384vseCZfcQGqxQ=;
        b=LdfDdW1N8jxV9lkewKaWsZchTQDjzpoMZ5vbadKAiGhvTNl87mNwUUDpF8i+YZr9Zx
         F+9B8KmzF2oBeo1h4OT4E5izwiHedVEHp1LNik2uBSKmWuMugsX+6Z3hnexheF5aYqKk
         N4712ujTaCMQUxCdK+6ix9NngtY79ye5zXKvDk2bLtbQSctDlL8iy6KkxoVaTB24LRdU
         X+0gwjxSE71Hh6QT+TCEU5zWdGu7NsWP3PX6s1QMSQiUvvwd7hQZ3ljjNWERBzCP2iv6
         ZaPbre6tdOLv4BN5kKoQg8S77fzI5qNWeQ8axtxvELZnthfpAsm8E6C8VId4hqKLYg+P
         DHnA==
X-Forwarded-Encrypted: i=1; AJvYcCWdJ5Resb0UaselbhUpeA00fJhPMh8YOB+VVG77UxjlHiorHcNOdyOnjiLD0haoBhqnTotmy8SPQodogrrUFjBH@lists.infradead.org
X-Gm-Message-State: AOJu0YzJM6ObYgWQYmMZZsE5cy7Hhn3CEgztznPvSg/Jd7yQrc7+OjDC
	gG9Zo7SmFfx63boksjdqaOk4ygDCzfpai8+Q0vtLOqoO23GrgJj0J4vfIqf8woGBbAIsPamXQy2
	dJ5czOYMBMAHDT2MTs49DpeGZwAn5yN6GAuodFNi5W4bVwOF7j24vGVjcKjhqNk0ebwHveaDqXJ
	wf8g==
X-Gm-Gg: ASbGnct0o1TmQ+CsvrP21ZC9Oq+4NgZy0EWhStnuv9wgkP4J/4HCL9y69oqJbKC5Rdo
	oHwomqBNdXI0gNQ1/XwneH0SlyZZsC7KduHKDyS0RzJKBXresV2Py8ZBUsBJFublWeImufwdWGY
	gXxpCZnkmcd4MtkE1aFJsWdvYdqstRyPQwt1iIenLG13LK6x+JagEVLzVOOsbwC9FVGuRxRSjeI
	FX2DhgMaCrHNE8hJqVRNu6SEPxFHAykP2hAPbC1rYJvfGdwqBGcbVfYkdbYnew7Y02tra0PR3xC
	O4GhOZUIqKOOR7bm11eosfZVIoF6XdLDMj0vmzl/J/fC2DguVWbaRvTmCi6cGw1CZvCQ7sWo+Y0
	=
X-Received: by 2002:a05:620a:2489:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7d229861565mr1147393785a.1.1749327462081;
        Sat, 07 Jun 2025 13:17:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMiOJSDHgZKgzl6P5JWEjv6Hum+DYD4sgyillMmaY0OHg1MeWucp1e6XYNy6taJN/WTT7xyA==
X-Received: by 2002:a05:620a:2489:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7d229861565mr1147390185a.1.1749327461662;
        Sat, 07 Jun 2025 13:17:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d00c0sm600890e87.22.2025.06.07.13.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:17:40 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:17:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
Message-ID: <wayrour74vlli27xrtxi2ff2v7q7ye2yknmk2mjpur5ry5gruv@hhh2mdb6lw2i>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68449e67 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=AdQzqMdWex-Pz1pjKtQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HCvDDktjr5g8nfB_P2zKzkHz4lmUVnbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfXwLj8gExAl6QK
 6J48cQ+50cqu+Cg33FvHhQmY5tU/ehJmKjSNwTDrayQH6Uosaxc+urhNqobhC64lICaVDocqD9a
 X+LGrqg4Z7uBkRQnnZKtn0//IQANxz1+mRlGU1Y2XkitPlXJt4qgmT6U2aZZ+jaKndfGCwxrro5
 tLKfTF6y8R7aaOjWAeVf9P4A8dJFpwEUBvV2Dy+OYE4PdLIt+BwFlyspjYyDLCR+ixthbuIjoTb
 8r0NdFsZFUzrIIlJunn2MWsgJXuVmKhHSP8Vf9pjeLMgOZePfVL1QqxzLU3oudy9JTZD0s5+8G0
 8Hz06HQVZtsquN/xeU9FBnw4PAcM/ySnN2q8hIlWa8Yna9Dh6NW9nikSoGB3YL/O9R8iuRSIFya
 ZhtrLfawZw75545HQcv6CtCOiPLQetMwdHvBxALFO082cpnJu8I/8L3tgYYWeEqo+qNOd42u
X-Proofpoint-GUID: HCvDDktjr5g8nfB_P2zKzkHz4lmUVnbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_131744_268602_0245DB4C 
X-CRM114-Status: GOOD (  23.13  )
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

On Sat, Jun 07, 2025 at 07:45:01PM +0530, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
>  3 files changed, 131 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc901f461384dd9b0d4 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
>  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		qfprom: efuse@221c8000 {
> +			compatible = "qcom,x1e80100-qfprom", "qcom,qfprom";
> +			reg = <0 0x221c8000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		pmu@24091000 {
>  			compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>  			reg = <0 0x24091000 0 0x1000>;
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253fd39ece3a0c26a49 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
> @@ -15,3 +15,7 @@ / {
>  	model = "Qualcomm Technologies, Inc. X1P42100 CRD";
>  	compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
>  };
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d43647888aa6eacac3de2ac9d 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> @@ -17,15 +17,134 @@
>  /delete-node/ &cpu_pd9;
>  /delete-node/ &cpu_pd10;
>  /delete-node/ &cpu_pd11;
> +/delete-node/ &gpu_opp_table;
>  /delete-node/ &pcie3_phy;
>  
>  &gcc {
>  	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
>  };
>  
> -/* The GPU is physically different and will be brought up later */
> +&gmu {
> +	/delete-property/ compatible;
> +	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> +};
> +
> +&qfprom {
> +	gpu_speed_bin: gpu_speed_bin@119 {
> +		reg = <0x119 0x2>;
> +		bits = <7 9>;
> +	};
> +};
> +
>  &gpu {
>  	/delete-property/ compatible;

I think, you can drop this line.

> +
> +	compatible = "qcom,adreno-43030c00", "qcom,adreno";
> +
> +	nvmem-cells = <&gpu_speed_bin>;
> +	nvmem-cell-names = "speed_bin";
> +
> +	gpu_opp_table: opp-table {
> +		compatible = "operating-points-v2-adreno", "operating-points-v2";
> +
> +		opp-1400000000 {
> +			opp-hz = /bits/ 64 <1400000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
> +			opp-peak-kBps = <16500000>;
> +			qcom,opp-acd-level = <0xa8295ffd>;
> +			opp-supported-hw = <0x3>;
> +		};
> +
> +		opp-1250000000 {
> +			opp-hz = /bits/ 64 <1250000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
> +			opp-peak-kBps = <16500000>;
> +			qcom,opp-acd-level = <0x882a5ffd>;
> +			opp-supported-hw = <0x7>;
> +		};
> +
> +		opp-1107000000 {
> +			opp-hz = /bits/ 64 <1107000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +			opp-peak-kBps = <16500000>;
> +			qcom,opp-acd-level = <0x882a5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-1014000000 {
> +			opp-hz = /bits/ 64 <1014000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +			opp-peak-kBps = <14398438>;
> +			qcom,opp-acd-level = <0xa82a5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-940000000 {
> +			opp-hz = /bits/ 64 <940000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +			opp-peak-kBps = <14398438>;
> +			qcom,opp-acd-level = <0xa82a5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-825000000 {
> +			opp-hz = /bits/ 64 <825000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +			opp-peak-kBps = <12449219>;
> +			qcom,opp-acd-level = <0x882b5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-720000000 {
> +			opp-hz = /bits/ 64 <720000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +			opp-peak-kBps = <10687500>;
> +			qcom,opp-acd-level = <0xa82c5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		opp-666000000-0 {
> +			opp-hz = /bits/ 64 <666000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +			opp-peak-kBps = <8171875>;
> +			qcom,opp-acd-level = <0xa82d5ffd>;
> +			opp-supported-hw = <0xf>;
> +		};
> +
> +		/* Only applicable for SKUs which has 666Mhz as Fmax */
> +		opp-666000000-1 {
> +			opp-hz = /bits/ 64 <666000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +			opp-peak-kBps = <16500000>;

This looks odd, why is it so high?

> +			qcom,opp-acd-level = <0xa82d5ffd>;
> +			opp-supported-hw = <0x10>;
> +		};
> +
> +		opp-550000000 {
> +			opp-hz = /bits/ 64 <550000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +			opp-peak-kBps = <6074219>;
> +			qcom,opp-acd-level = <0x882e5ffd>;
> +			opp-supported-hw = <0x1f>;
> +		};
> +
> +		opp-380000000 {
> +			opp-hz = /bits/ 64 <380000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +			opp-peak-kBps = <3000000>;
> +			qcom,opp-acd-level = <0xc82f5ffd>;
> +			opp-supported-hw = <0x1f>;
> +		};
> +
> +		opp-280000000 {
> +			opp-hz = /bits/ 64 <280000000>;
> +			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> +			opp-peak-kBps = <2136719>;
> +			qcom,opp-acd-level = <0xc82f5ffd>;
> +			opp-supported-hw = <0x1f>;
> +		};
> +	};
> +
>  };
>  
>  &gpucc {
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

