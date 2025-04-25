Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F871C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZhXAb5N82DC4xoZmaDuqgjsFIB2BulQK9Ow83G6Ys0=; b=j+cB6REuFdZCMPvD+lG/nk53t/
	QuyTFix2mipbafXrBkxVUbNllh6rfONzL+JtQfeSs5ZVS++zUVYlQkL0UceX7B2XvTdNmWsEPbj1l
	MJ/iAhcxyyL39jFaqxICYBW9mlbdUvUx07RutysolJyrZjnXhG95tl5z7v1HFGu3jMmaivVWc67BZ
	bSvvoi5jTHepaxklzsBmYW85y2GtFFGu/EYfMZm1TZ0uGMe/V+e6Su9jx6uz8dTowTQjr/n1dGg97
	gcy68QOrgASEDuc5/epQBNW1ql0ATKmi0fbIuEmmAqpkICqehS7ZKEzMaIy7HcC5EspA9pNPWXXaK
	PmNjn7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8POX-00000000liH-1uAc;
	Fri, 25 Apr 2025 20:11:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P5F-00000000ivg-0Jgs
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Apr 2025 19:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EZhXAb5N82DC4xoZmaDuqgjsFIB2BulQK9Ow83G6Ys0=; b=ainWaetMnuDqsfolqVjj5dFc1G
	NcIAJaqhh87MbMpgpSBFuhKEDWSbDhclX6QbaI3zhN2/Wx2X7uIzmGTzgvlQBPDf/9WxkkysvBltd
	wGYKM0mgel27Hvy549YzbWVY2ECict3xZICOIVNo7qaj90+95Pbfqt9gXfEMBVbGvX7h+cbcpdlpA
	psBAWu1klire8rAFk3aY8e4n+qFH1Rv+Z5DnJrKsEGbHjaLKQOkTWCoGDq/2QnZOnqsssG5YtCDKU
	xfidUOPQfjI/VMYcR3b9raz8UHV3DqJWZhbEddJYoTF1AEH2Xhd7GrUMXHb2kJWShi1ncg7nAGG6V
	JmawJKtA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8P5B-0000000C8ya-3N2D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:51:35 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJxPe032131
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 19:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZhXAb5N82DC4xoZmaDuqgjsFIB2BulQK9Ow83G6Ys0=; b=hlxq57EUtm09HRLM
	ZCYMbUC+MXBADtX5rID7Dsw2Hf/Y3TunQHry4eXA8LYdMnwJ6veIUVCa9t8M+3Wi
	O7eA/eMG7xP2ZjdudFUFAXEnG11fHdxB5DJe7oxloHTQ6LTV31PG7wlW27xS2Iq3
	epC9rjhw8DE5XYnY9Tc6rHmhRLqni0J4X9h5HWHi9owSL95fCpNQ8j7VXttv2K59
	5YQNc1XZgL1fZE2cfDEyJYrvuHh3E91L27DJPsek5OEVi51URNHimUKxqwBUOQts
	4WSm7nVLx3bu6wcypgufmnCzjmYhD+ZikbigF6CmRJuvtwjzzUYfRUdSQmzsfB3F
	HGXxZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1a110-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 19:51:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47aeab7b918so5999041cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 12:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610690; x=1746215490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZhXAb5N82DC4xoZmaDuqgjsFIB2BulQK9Ow83G6Ys0=;
        b=n01Zo/5nM+knlFMD1MzI6r8U0iAO28yDet7MHsvcswm1GZzGg2uwUQof7lw69823Xh
         iPJMo/uC97zw97v/LtFAxtDQNw8IWJXT2r2DlnNWUQ62tFP8XNyLcZv8n4o/mzdbnk88
         HPQRgo+5Zkdt8v6Pc7K7iVFAnPzFjyxKTNDXsDwUfZGZsYwHk/7DTOi2lpnT19nNpuFk
         4/5OdNiX+zN7tidfYz/xkSNlFRKIuSxkFf3mRRez3mljolDC0olYjzXS4UTziGKpWO9g
         ibw62KsEVkP67cVW/Fy9oDLu0+HisLUedj0Jgzl4dSHMJ1rxn7w7ACZNO2kROlZq4Vjs
         pGFA==
X-Forwarded-Encrypted: i=1; AJvYcCX9fyV48Ao+OksvYh2aizIrzvP5ZxwY1mxRRI58ZcJOehyZxclJuICP9qqLSHCaOwjxKkXmvcmRvB4Yir0Ue6fT@lists.infradead.org
X-Gm-Message-State: AOJu0YzClR8K+aNRTLVskS9EzaheIKbnscYdeIVr0Tr5UH4QrQpnBG6c
	yHgf8GxTa8/C7TUUqIVKNo2BhuEXi90NxOg/oVDlefB327mmyN5ZPiPxksSNh7ZEgYjj7KZIhvo
	StlGqX1ORgoqtz9UF5pQa3mINEixvGhTC8FTPl5pGqVzE/lphT6WMlrJE6mOcbY3CnktVuuGD6Q
	==
X-Gm-Gg: ASbGncue579T7EpI6WOcZrFlAisvUM78FZpg7F2br7p+DOp1RyUoiP9kYTc9UZEJl8H
	ziJjvO7FaykxkSdf0Mi1nVAnbasXCccTa2o7GtvI0CC6EB1zsBJQeNv9gB2IPvE2BUznM0xtSxF
	+U2bwnlalBs+j3tGf/33QGqgN0qc2yobu9DrDnAVxrAJggh50yufVmS6jvb+DGnD/ldd9AkUizt
	u0GE0ITtQF87T3XO/Q+j5mxrIqV9BupCyfwLUjrMNlNtAYm1KYdzkP++Q9Phal31fgpkwXSvbFD
	V7JyhjWgSG4UzlCHMx5NWmYnQ/ZhgSh89ag2pOZOGH6fgBLR+jXYDM53P+8w/bt0KME=
X-Received: by 2002:a05:622a:20f:b0:474:e213:7480 with SMTP id d75a77b69052e-4801e6f355emr20287361cf.15.1745610690533;
        Fri, 25 Apr 2025 12:51:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGixXgh/UfVDbXANnAdc5BNsWh63o++g6JqWbU8CImmPZ2H5rCWnTMEJKVAKIbuE1Syh75RhA==
X-Received: by 2002:a05:622a:20f:b0:474:e213:7480 with SMTP id d75a77b69052e-4801e6f355emr20287081cf.15.1745610690227;
        Fri, 25 Apr 2025 12:51:30 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6eda7d9asm178782266b.166.2025.04.25.12.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:51:29 -0700 (PDT)
Message-ID: <43e5ec19-4377-4890-aa6c-e0f9733d5106@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:51:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] ARM: dts: qcom: apq8064: use new compatible for
 SPS SIC device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-10-da4e39e86d41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-10-da4e39e86d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5cQsUDO5Wm6OxyLGLr0RCMQtSM50_Jky
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680be7c3 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=exUESaSVoveG68c7jMoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 5cQsUDO5Wm6OxyLGLr0RCMQtSM50_Jky
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MiBTYWx0ZWRfX+/LXdhJcnC4m kgOJXsrM9IdlGLJm6NIGPIJ6yPQ3bKaIMeRdy0qjgQvJaXqnjVzPN4JCLUsv4VNmSbBocypjH8D IFZkP+do8zjFdILNWbhc16SRaApubIlmxDHxB5ZxVFe6SSvncu/e9Bop8MR72iXg+bI3V/rhozE
 YFvrXjIBMeKLlJZ7UEL7jwjFLzFF8zQCmXmPdjplabIHOpsE0iwKJEWgBaWthBDaDS/r8iTIygx Ybe88q6kBlPGL9SSprmuujttXxxqjWV8zTzjrs/M8pXTQNhTxWjwnNHpqaFwY1iZcYFTLe/yn56 B7Ad3zVxa+wuaCNLSOFyVW+ow9BfDE06oR+6mIfXcSh3JWj1KqHuygt86LtYG3DXuIgTwnzhVnD
 XywRYWvydKtivJ1suvX3tktX2jDgPwccHNbw77OINph89R0tHbXh2qpRM/prvfpu8DSzKwyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=637 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_205134_185426_65A77180 
X-CRM114-Status: GOOD (  18.52  )
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

On 4/25/25 7:47 PM, Dmitry Baryshkov wrote:
> Use new SoC-specific compatible to the SPS SIC in addition to the
> "syscon" compatible and rename the node to follow the purpose of it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index a5aad4f145dd368aabed44cf520ffc037018b37e..b6533630e347c8fc5e3f0791778cd05760b3f3c8 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -402,8 +402,8 @@ saw3_vreg: regulator {
>  			};
>  		};
>  
> -		sps_sic_non_secure: sps-sic-non-secure@12100000 {
> -			compatible = "syscon";
> +		sps_sic_non_secure: interrupt-controller@12100000 {
> +			compatible = "qcom,apq8064-sps-sic", "syscon";
>  			reg = <0x12100000 0x10000>;

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

