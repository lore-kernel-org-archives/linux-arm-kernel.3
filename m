Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E100C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNIuGRzN7oMTa5VQLxij8hespiQpfRUjmkdfhRPhLQ0=; b=iPUzG67f/83Ry9zbHguSzR6ZND
	QVvSfcFDDNZdmWsFtmAa3wqTDho7XQQxmt1woOUdYF3LXTiylTaMCRk/44rN4MbSfDUqwsdu4T1Zn
	qLVH6DXnIzsfPSDM6D3d9C0n/4d9W4XMGNUcnze+l/cQNc7ovRYr8KkJJlktJIZKU7+pDrlzAVD77
	5UyLd8PLbCGoGcD2CzAUUAz9Dp0Slbk+SrJ/IZ3Na4732TeSQJG4ipYumdGF8EeIDyVwjjyQ/0GUG
	PWDLkXusQVP26b50GDNyuh46zOscWDf/PzkbQM1SSWyHoaefUQn0V6j4DG26quqahkrDpSRmXagAM
	HW06dPhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVmd-00000005qMZ-0Puk;
	Tue, 18 Mar 2025 12:10:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVjr-00000005puD-2vcp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 12:08:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9pQsq018687
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNIuGRzN7oMTa5VQLxij8hespiQpfRUjmkdfhRPhLQ0=; b=fxSqCLRpX+E1GTEf
	niV4b1OQbrqLRqw2esrIpK/iltMMGOhRAIEMoIEYGtJFn4eO+fdZBOdSoeHmAk5H
	p9JWEOHTO34c+R1fsVlpeeHi5CHI/GeN4Dkb/iqZZHxGj9Pq9fCzYpT9WNT4rmMk
	x4YL0G3ri/p+lmfrrcCD894PXmhtZkglThpU6RY46o9LtSFcI2/v6/AMZEB3ZUW5
	gl18Gr7AZvTak/USTHeaPjYuywzvgj4qsQIRGGY5Il81rnOiBABy9dIh3ZaIL+lM
	yy5x652nENIvaiB1wUpBl0F3XFh9Ps8Xl3pTG7LuCLKdrCI5GOBn35nqyWke8Ih2
	jD2Q6w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4r5bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:08:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766654b0c3so9235821cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 05:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742299686; x=1742904486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNIuGRzN7oMTa5VQLxij8hespiQpfRUjmkdfhRPhLQ0=;
        b=e0IpF2cG/ARYJ3LVdPRFKfxH54t3Mgpg81USeWlwVhRdWjjydivmgiwQnwQnda5g1r
         Fbmmwfi6JY6B02fObzCNHRRy2DCA/Sd4NXQck4bYfulqVIX3ql1zjUlNQpWIfvlFh1wc
         Xlq+XbGkUa0ORE5bmkiDQ9hpIXpeZHssQY3hNYqkakDn+bfT/dZYsaIU/Box4SE4kn84
         KMAbwUyunCpDLezVhy/rwtg34mGmP3MYcMvKTuLvp1jCAiumU6JVmBvr5UHLa/g7LXFr
         RNUbNjPWldv+lNnOUs1YUqlZD0pUoivP/hhg+yN0JAuih/LX9QETkKy9glPyq+RIsz4f
         G9Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXPvjYcr4p66yJlGyzIQrl3az6oauRmwwx9taQW6f3YmiFAi5owmx7f+bVI1IeF2EEGtDbUUky9R1RdDM27i22s@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo4N3Xave0M+WFzpjS6HRjEGUsBMFt0Idv36Q/VpW5UoYZ5gZe
	U5uwUK6Vd56piQ4ayOMdCj/nRlqIIBOBVwFgWQRfXjE2LfRzuQKZaYwzY9EPDUwK4kz48x1XGtc
	lJpZKNSU32mjnrrSk0s9pUwm57QVs5LU4zbpTHl8caeqYBjBJ+Yob+12N/tQkJaHvhyGwzu6+gQ
	==
X-Gm-Gg: ASbGncvTlNWFmbQ3G06tEB9dvaN8LQHH9DRqczvL/RsRME739EEClcWsb4WQDO//a+y
	3gFJLObghLIEe1l+HBvBSLb4fI8hd8NzyX+pqM74X8JxDEh2YdudfQIOQj1FDZlJvPXc50PMHkx
	cvBusW8wgxojerMmkByXM7CNcuH8xIDxswGF8pQHT5HGYoQSPhCx33IoGtp5VHwdfU7UKbXWZl1
	+20WLp9VsVidLAivXdSJ5wxFEjKHwaBY3vcxkU/eA8/E/YKuXK9PBIVpV6z/df2PBuhXpsHxezV
	R0JllEiR+09F997VIwf7Ez+oH1KwbrSC+O4UcDhvUlq0JOjIfxZkOK4omPGbDx65ps7hHA==
X-Received: by 2002:a05:622a:84:b0:474:f6db:967 with SMTP id d75a77b69052e-476c8143273mr91228341cf.8.1742299685603;
        Tue, 18 Mar 2025 05:08:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsdWgRQeoFvvEZ9ml0+bILr2xQFZy9kdEiblsMarwSKcKomqtK3Q4ssrshicw1usxo192TDQ==
X-Received: by 2002:a05:622a:84:b0:474:f6db:967 with SMTP id d75a77b69052e-476c8143273mr91227901cf.8.1742299685124;
        Tue, 18 Mar 2025 05:08:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816ad27ccsm7850681a12.62.2025.03.18.05.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 05:08:04 -0700 (PDT)
Message-ID: <579cd909-8a0f-4998-88a6-47073ecc0eae@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 13:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross
 <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-6-655c52e2ad97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-6-655c52e2ad97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d96226 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=N6CB5E4InGOdx4Ah7JoA:9 a=QEXdDO2ut3YA:10
 a=IFyWz7IVXAM99tgoijJH:22 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: MpU51lF-sgUsJwJLbJDmY40o4S6psbnn
X-Proofpoint-GUID: MpU51lF-sgUsJwJLbJDmY40o4S6psbnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=738 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_050807_873990_A166AB99 
X-CRM114-Status: GOOD (  17.22  )
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

On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> Follow up the expected way of describing the SFPB hwspinlock and merge
> hwspinlock node into corresponding syscon node, fixing several dt-schema
> warnings.
> 
> Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..3728875a5506397b36a4c0d6a5ad12c067bbdd8c 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -213,12 +213,6 @@ sleep_clk: sleep_clk {
>  		};
>  	};
>  
> -	sfpb_mutex: hwmutex {
> -		compatible = "qcom,sfpb-mutex";
> -		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
> -		#hwlock-cells = <1>;
> -	};
> -
>  	smem {
>  		compatible = "qcom,smem";
>  		memory-region = <&smem_region>;
> @@ -305,9 +299,10 @@ tlmm_pinmux: pinctrl@800000 {
>  			pinctrl-0 = <&ps_hold_default_state>;
>  		};
>  
> -		sfpb_wrapper_mutex: syscon@1200000 {
> -			compatible = "syscon";
> +		sfpb_mutex: hwmutex@1200000 {
> +			compatible = "qcom,sfpb-mutex";
>  			reg = <0x01200000 0x8000>;

The mutex is at +0x600

Konrad

