Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF56CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 13:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZXY1ifhV8YPSwfeBFCqHJXWN9yVpsAT+ynQZq3WMfE=; b=Zs1TD9djWdVGFk8qHJ4yIdrGB/
	7nKaADn05AfEJS32bnA2feCYMX2DtT3Zd8uToUNMOcjVzBLeCqJTgxbph3qGeJG035xeDOQzln2ky
	JyzWcXMR9Ut5qVwHGNlUOwfw7s9o+xQCcrMoB6Gywr+HGxxrQIbCqhQ7dYxFt2hMvqGk6SNwqzvhG
	6CqOBm4ni7u9uoE87OCKZWzMAuu1+BiTKDSgSqBBOu1CS+n5IKppx4ECUpLOm3KL4xMUQRRCttFHm
	cue80Ej0mb8IUhKdq14RGAtzUGaDDkd4nqYNjyEikIfaxitND24nlHb1YtMOIGiwB4C3PZw3aon0X
	FfUNn8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJX64-0000000AWEG-29UX;
	Thu, 13 Nov 2025 13:10:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJX62-0000000AWDp-0gg0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 13:10:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADCisTx3440692
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 13:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CZXY1ifhV8YPSwfeBFCqHJXWN9yVpsAT+ynQZq3WMfE=; b=e6t/0V3jRvOdUIEy
	YRTECo2K6P5WJYru25zm1auvl0mq3RCtZe/UIkecg0hG16qNXrdYsyIY9LZXIhhF
	vuxlvBXs0nZspcbsY/gitVt1xqTuCwzYsB7x6qdYII5p9fHL1LxRn+CSLIGfSXHr
	OOZB4RnyvDTNlxJD5zL0n1RV0NURlFwidrpfiWcPfRh0IEQOae6/u+gNFU/LzFnL
	Nng3Y5QtIikk08st4WV2moVIFE3kPUnp7SMIM73FuvwoDoVkFn1Xok6QB360OOex
	iT7gID2V3UWRd2FoEAxAbgWxHKfXaJ9vLCUs8vlNMj/Ive2zE1miA7cd9U0jnWdo
	0OPRsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9789cmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 13:10:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e890deecf6so1665901cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 05:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763039440; x=1763644240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZXY1ifhV8YPSwfeBFCqHJXWN9yVpsAT+ynQZq3WMfE=;
        b=Qk3aVi5VtXejAUdUr6PDg76/Ig/4vNSus57ltkETYBPl8tzr1gJk7Od5TtIXiYRO0q
         YWP0JeWRkOSgqkxidGMOPHRGgl2UnCNgQaTqTMvrx3X+kIs/TDvadFDA5teXak9jwR2f
         1IeqJYdOIz1OqWnOKoDWsN6ywFAC6SmWML5XICQrGb7usYAgv9h0Ejdn91E/ogTohGPh
         QWvO02Y/ffBlyBbXBIEGULnd3+qIjE6uTccwiBcJunYIFbvqnbB8csRyp3lpcq0YqhwD
         QotgXQ/FyV+brDVWna0SFn4EE0CPRHt+AHtArBftCm2eHsFqMtAr1MOcdyiMOuNoHAgE
         wLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039440; x=1763644240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZXY1ifhV8YPSwfeBFCqHJXWN9yVpsAT+ynQZq3WMfE=;
        b=txxglxDg9SKxarZ3SEDBANxRhpY+1ZjGpPp8buKg/rHuhXTbpBtj4sLBaTlXvY4df2
         /i3yurYhxgmmPmDPN+eyFu8jxn/FIxkYBvGZSDNRcwX7uNYE0AuXbe9crrdnoWftQNKw
         GzR0BMwqHuPgeY55T4+hGdeOVgukPfKXmnGiT4ZyDLQhTJ14vvcweA/2Ycdk4jLCbKZt
         16YlT7ITJn3Qi/i25wuD0k7bQ6tdQAlyA7gVTaBr1PrawyPcV+aIoBhQjAdsQ77mH2Wm
         89p511920jOjbhudepIPCrZ7mHfRyQc+WY+WfdklgkLZHvUuYm6PocQXWKYWpluqvfJY
         hfPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjZW1tiCpOiovaEnQqYZxXDDsUDLkllTpKaLGiExH0hpJxwip+OPkFMF+pQUtBcZFSvDs40RG3LK8EmH9MSFCP@lists.infradead.org
X-Gm-Message-State: AOJu0YxfkoS53acq8q6yt9qjrbkj7U/g6mIX6bKZVTNH1WfESpDG7pGo
	9Y4Eb4dzNlBTxUqjtCc55wXIAIJ4IIdUs/yRiSQKkmv6qhC8jg0hqWqwpxlAaU2cKTYsnESIwV3
	nucnex9KsCuoNNfMVNOV401JoKe+tLs4Xxbl4NWVRT9JWYJZpWsYQ+84rmvJVvzG2Xe7a3GlwRI
	dMVQ==
X-Gm-Gg: ASbGnctWhcuOTcSDPnDKdSELmjDnShSQQqosR9Vkt7fPUDiSfIVzKHY4uXNhXVe2hQu
	ZtiN2GZh1o+5qkzEYNDuJWMk4ReeMQJhI6SMKDgKRLxuNayzD+/BE5RZEByjCIMc9bhuoT3C7oy
	uNWZasA+KGHDPPA7txdg6TroSO8bAeokwSsSVaWMKO9etrHA3K6znNxuNvbRV9KGYTzF7+lZXuS
	OwphIURPoC3F56uPZUFr5lgHpffd7+1ZQpLMHjBKMUiiQUeIsXc2CT7YqGYJQyLml62R+v2Qcm1
	tmnvQRyIzVjFZ9qzf/Qc9OQFP0mbtKgxL1nzv2azuPe1qXd71UCuqGxiJF5CrBeMRwwW/tk6auf
	ZxwxUUJcvEPxOstXfucfQkbeQBBkmRyeLCIkJuyNqppbQsJz7DdONLkaB
X-Received: by 2002:a05:622a:1316:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4eddbd65605mr59626021cf.10.1763039440289;
        Thu, 13 Nov 2025 05:10:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESawNQFUeHeMbh5CviAuecEDsSSa2Db0tmz9JN9G7A61f/DAwZOVKGgRG2h1xYO5nZjtsMBA==
X-Received: by 2002:a05:622a:1316:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4eddbd65605mr59625541cf.10.1763039439747;
        Thu, 13 Nov 2025 05:10:39 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b28bbsm1396845a12.28.2025.11.13.05.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 05:10:39 -0800 (PST)
Message-ID: <f7e204ac-28b6-46a7-903d-30b7f31dff8b@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 14:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] drm/msm/a8xx: Add support for A8x GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-10-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-10-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5OSBTYWx0ZWRfX1ZvCNkWf6Ff+
 itT3Iq9T+bSvyFm6TpBvsEhVV9U8RP7itOEjQPhgpHNvuvwgnsoEBgNPWUi+gNL+OpBJaTKAQ8t
 FgiFEzeEIfeR7zaNaq+Der2rVZ+vExUZ89292iLgEewvq05J2ufpOw10Cu53JF7NWPNbbxlCrL7
 1U7qNjfgPrshrcuvcwpAtmGba+CVubhxGaN5r/sN2RyYOQwTqzR3Xd9CdrOU9F8BQsnxKyj7UXf
 z7k4a4SUMNhfUonSzpUYQKbHLSwuxY0BCL+y3eXGbxaVzZTLRLCxuEG4up2m1+OXxScDISWi6vj
 53fQMIUikXIPSY0zN/ju3YK2ZtI2IjLngbUMrqfzMAdcQE2hS8/LFFkuCoaYfkQlrmmVGB0JfTP
 jHzxuG4zZJbqpxS6fkrnHdDqENEB8w==
X-Proofpoint-ORIG-GUID: GvaosHnnyzHDTm5Ga0XUYP5GtkPpk8Yg
X-Proofpoint-GUID: GvaosHnnyzHDTm5Ga0XUYP5GtkPpk8Yg
X-Authority-Analysis: v=2.4 cv=PIYCOPqC c=1 sm=1 tr=0 ts=6915d8d0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XMd9o5LtjS6KuIBsTZQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_051042_327017_48D57E91 
X-CRM114-Status: GOOD (  20.58  )
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> A8x GMU configuration are very similar to A7x. Unfortunately, there are
> minor shuffling in the register offsets in the GMU CX register region.
> Apart from that, there is a new HFI message support to pass table like
> data. This patch adds support for  perf table using this new HFI
> message.
> 
> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
> to simplify handling of MxG to MxA fallback along with the additional
> calculations for the new dependency vote.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

>  	/* Make sure there are no outstanding RPMh votes */
> @@ -990,7 +1022,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
>  
> -	if (!adreno_is_a740_family(adreno_gpu))
> +
> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))

stray double \n above

[...]

>  	/* Check to see if we are doing a cold or warm boot */
> -	if (adreno_is_a7xx(adreno_gpu)) {
> +	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
>  		status = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) == 1 ?

You skipped writing to this register above - can we count on it
always being in the right state?

Do we need to map VRB, or is that a topic for the future?

Konrad

