Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE56CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWA4RMuv5Jsg9tLzqnTr2CAziRMMoQJlkPXD8EK+58g=; b=pKCsRHkPcNCEFrLJWvMAy+N86K
	M7DQaFx0fgK+aolYnseJFakkjm/QiocomW5IPd3OFt41+GakUz5GG3gi49SHYigEXY5eWF+ZgYKng
	AlzuOX180Q+DUWYDaQV+J2v8VJOqPmjz+zOM2OMFTs9uvrVzlpywxOlmY1FkC2MHGXgy8+Ran04/T
	iZsAt4l8lX6J3dPy9G/1GFR7enD2jwcJfn7Vv37kmNwRsxXWDuNZtesYVix3GZ6nhcWZJKcCFaoH3
	nBi7WXQvHUJzWep7maBGwI6Pz23AcKmRTu2JnQD0hrQ3H6PoZ7x58qKWzNFgRJ8ZN//AlGGds3h//
	tZN9u1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVrz-00000005rDi-1mbP;
	Tue, 18 Mar 2025 12:16:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVp5-00000005qcp-0ljZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 12:13:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9MOfv027250
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GWA4RMuv5Jsg9tLzqnTr2CAziRMMoQJlkPXD8EK+58g=; b=NdDB8vrmmtVUVhtE
	CXCHwNTuANP3skL9wayZf6jWMFfodBw+Uhh9F+yEtiV5j08T/3uF0Hve5WQogOq6
	HFwn9wsPrCKK4Q/mI8NZEvkKepfeZLDLLV+im9dy9YotURnCZlF/v/rc/Jt7O5RK
	//EXxqPquaXuKHZJuFMPio80/f1TzGmDBCdtkeepElOoWUpwCu//mlQkYr1vNo4F
	ZPTTyqJ8gZcZaAnwRQ+yXGEKlCA48p+3q43/Yq81MtYCfFjHV6+S4rV4uhE+gSd4
	CaEgS1i+y1sMjb0thxdv4zBmnHKduBEyO7q2iDClLKXjPL7Mh3smpibQ/foTywz4
	UAtWgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy0389-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:13:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5560e0893so28350185a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 05:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300009; x=1742904809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWA4RMuv5Jsg9tLzqnTr2CAziRMMoQJlkPXD8EK+58g=;
        b=PQ+PmJGW5Wpf6ES2hB+FDK79/weFQH5/y6yaY19Z3bUG1dpDOso57t34oceoKxq4Th
         AMyHjHBNCQPZ2/QSx1ghybYZsQD7roTCeqds36wYR1jmyW+VVoUOpSAAv7B83mkV5FdG
         bbtoWv+/gXxXPIrL7J+fLURLE7ZO/XEmymLIL6b1kxa897e6RYhm0fIx/31GufcmAi/i
         9w7l+2KAO0KVTXPVSwMT+1N2ivhf1cWDzKckZABKbmA4Y2Iu6LnBV17wfV3+xRL5LfP+
         6YjkAlVkxi1jJAcXy5rjWElhmdPLKhW9wQ8zOnspe+nXuh9420OuNvJ4eRvIL+DDk4ye
         zcMA==
X-Forwarded-Encrypted: i=1; AJvYcCVliJx0oGxxtY+qwTAiBdOFBsdocR4CIQnVf1ta8nsVicGihK3RQgMawKD81Vbide6b/tj3LlOlnBJ+4Yyc3TRa@lists.infradead.org
X-Gm-Message-State: AOJu0YzQx0wX64MQynBm+43O/wTpve7fGq/od/8fRjTTITAFxx8e9wj6
	z5p/zV0/0Myw6piRtUAHN9t/w5KyX/zQJ0c+L58wHZIgopBoyxdT9B415R46AY6v/OFdze+EIqQ
	USP66PLjzNLdJ1Ps2nCLnNODBiDJr0abxDDdfG9F+s+B+UtCLxWeKaH5JwDxZHoj2/pOi1fgsxw
	==
X-Gm-Gg: ASbGncvL6l4OWtrL8bxpyJ1y4jJ944tqvOi3m2f55OaFWQUTWwqxaltmN3VQzMxkbca
	KjMGHc9dMk/CpEcdi3kieSawVCY9d4PAJBYGFqwAvN5VyPd/Dvc7bMNR+0ErHe1d+2Rl3yOlrkp
	Cow/0QDE1399fJegw/KDjZUa0CHWxZe3E2kN/P3kI1o1UHJ009jByV4ogCGjYyKkdvWr/NUiUxr
	ZJyC8EhaVVK67xUhVdfxVnJZhjHAAd9hvnl8y7K642i6h8gJSk86vKk+g+92dYY5eg/vpNiWGAH
	vkExM2EZHUmganR9dBHp+0HtG4IXn4CImD1pXD+JuLlfzQajf60WymFkfoz003hTFZYLzA==
X-Received: by 2002:ac8:7d44:0:b0:472:1812:23da with SMTP id d75a77b69052e-476c8190534mr96004961cf.11.1742300008825;
        Tue, 18 Mar 2025 05:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe06kgM8AmHXFM5Gw3aBJVby/YG/haZcqc6BvqbAFtXAm2nFUQvuHUdNVMcDGWgpVpF/fRZg==
X-Received: by 2002:ac8:7d44:0:b0:472:1812:23da with SMTP id d75a77b69052e-476c8190534mr96004821cf.11.1742300008446;
        Tue, 18 Mar 2025 05:13:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm849452066b.149.2025.03.18.05.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 05:13:27 -0700 (PDT)
Message-ID: <e26284b1-217b-4afe-af40-ae65cb7ee646@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 13:13:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] ARM: dts: qcom: apq8064: use new compatible for SPS
 SIC device
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
 <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-8-655c52e2ad97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P_KTiAutz-Jl2Ig_ZQaFKa3uogZQ7Nki
X-Proofpoint-ORIG-GUID: P_KTiAutz-Jl2Ig_ZQaFKa3uogZQ7Nki
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d96369 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=GlwZi-m6aQ2r2PzHKf4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=560 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_051331_348638_65F9E4D2 
X-CRM114-Status: GOOD (  19.49  )
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
> Use new SoC-specific compatible to the SPS SIC in addition to the
> "syscon" compatible and rename the node to follow the purpose of it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 522387700fc8ce854c0995636998d2d4237e33df..a106f9f984fcb51dea1fff1515e6f290b36ccf99 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -402,8 +402,8 @@ saw3_vreg: regulator {
>  			};
>  		};
>  
> -		sps_sic_non_secure: sps-sic-non-secure@12100000 {
> -			compatible = "syscon";
> +		sps_sic_non_secure: interrupt-controller@12100000 {

The register that the consumer of this points to doesn't seem to exist..

Konrad

