Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF68CCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB4b3sxSbheBbYOZ0Cg6VV5suwUnxR1Yw3auDzIvZZ0=; b=y5fhaZNvM+JrLEXy55dxj/pu7L
	Esoq0qN6ERc+uFWlF8rV9jmIMsVNAMA79gKUhSRqi5XqMuDF64ozpqI/Xuhl06sVW2mv1f0EEXBzd
	WkGqkay6ttyKh+Um2czHtDdEJbWFnRiDyCyU3ESlbbPh0pakSb5oH45/sMvZ86+GPJ2XLc/seN5qz
	wKd88wehiPX+Hhj6gzDUndCg95uhWNFTziiZh05Qlgs8IvEzWVQK5nlndPx6hy1EqHix839NZN8Ox
	TDHH9YkF1px5xkBoYqTCj8kZpIUsXJXjrCpgbnuXx3Jts3Jbtr4d+7iVIG4whAPixVSdHBAZh9ldl
	VxRtqe3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZbJ-0000000DMQZ-1S1e;
	Wed, 05 Nov 2025 09:14:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZbG-0000000DMP1-1JZ1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:14:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A58HgWQ3050165
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Nov 2025 09:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zB4b3sxSbheBbYOZ0Cg6VV5suwUnxR1Yw3auDzIvZZ0=; b=IpLjVI8GlPRF17Za
	O7tBG1lFcNCsHn51PdUDeedvuu/9c2CLlvdcE/knaIfIGIXhHjrP78xQ/F8KXCOM
	NoFgnrJTXncR+jRs5DxdvY8zbm/GEnwahoOQbBQPbLGClndwEwlpp4inbAhp2uaQ
	5IYHfJkq2I5k2BiioF/A2/HnOfSYhn0G+vI6cAc5nIQF9BMGiieHiwSdiSN74yIw
	BDwY3Gc30Sr9gkQZxx0Zn6iyw82MM5BBfkbDFB31JgPRrjoThzThGvsB6VqGvi7x
	I+EprkI6CqAkyxbiJLbsmkog2BSG6FahM8N2v51IQ+JeBw7CrA3SVBU/zj/E2bMO
	vaxtrw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ex7urq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 09:14:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed5ff5e770so5309781cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762334080; x=1762938880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zB4b3sxSbheBbYOZ0Cg6VV5suwUnxR1Yw3auDzIvZZ0=;
        b=jw/8WI4xYjTE7T3AmpoS/XCF2dJrfvnG/dQzk1XOhGGtRO3Xf4/tmeifRz6+IY9Z9B
         lkq4ac1lm6ion5BmCJ3VUCF0uLW2ykxAcObyn/Ow4acyAIuQLB0nOzug2QjrVYZ+F9ue
         O6czhpNqS9SFv8ODcEjM+5xR/l4fzuEptgIb9/mtU2z21PcJOop6RzOhdg3NFPKts7vT
         GeQbFKpTjZkAZ6JAdF1K2V/QNYFyTFE03TXdC/c2yd7Ro/TvG6fuj/po2L4O94wSBnvN
         zmzcacvQu4wEiKYtAOzEqlSXmWyRT1x7sczEJf4tCDx66wgnhvE/bDy3IYf35iQZLSyx
         kn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334080; x=1762938880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zB4b3sxSbheBbYOZ0Cg6VV5suwUnxR1Yw3auDzIvZZ0=;
        b=anigmKUvDy9CBMSczViqDhoe17Xty/LLXFWvGY1XFMUuwFpEObRlioK4LtIF6TLUK1
         I5nqv43KG6d5hRLOP/ybC8CawzN3eztP8e7OqHtjUNUs5ELda/EYlFPvLGuSqnvmWYIh
         /k1wPGC1SkZyDo3HxLqinnVF2tziINuYrCbM3TCkgCV8mA/M0oHTgVkYVxhnN8VGZNe0
         i34s/hRowvK73PbD9x6NcDe/ppZWxIvAAFi4MtQEXHLfm3VjwD9FXgMeNWdBu1SL465T
         0evuRAjxqLylNNhtwxStSa7D4WyJhBXoUMzH0biwddUe9JOSHfzR90PeXlqyUYyaYiSp
         MOvg==
X-Forwarded-Encrypted: i=1; AJvYcCVoVrlWSGMbaHYsXIsfNox+Pug6Q2Gvh2lkn2vMtXG4mrpw/4UK9se8+dWM8h0/c0Nf1JRJi9DzURWjqnEFZylV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7EqAAR3G4SQZ+NR9PA1FnGe4qMCWUcNwV7IvLWLTideteWPsu
	94DlqxH/saAnmCYM1ZKept4Z3EkPD7uh+BFaVUKS7scKSehcZqqkulVQ7o7osW05vwel8XqAktn
	sIm+dn7UX19bY8QKmK1MVDTc+pAVX32QzS9WJ9hIjbDIMKXrZCRCTt6cv8nRdniDhZHUSxWTh79
	/fsg==
X-Gm-Gg: ASbGncuoonp9fkWrHBdO/w1lMjQk8rDGgvIuAS8yc5xIJINZbDZ0vpcej3RBgkcznpx
	YmdzwMTujg1NoCOCcdWuiVX7fS+neqkzO1SueMaK6xMrVIJZMlhg404ew1xLCOUNF5FB+d5384o
	TsCwDho8zhOdKkGsexFGHrqtEQPYwuVqKSnmVW3YL6TTsUPVeRF3NW2bsJn6xMtS/uyVm9tJoLP
	c6ZL/bZEWLPzQFXcwy35KbkHq/EE1LaDaGddBLX3eqA0++5SK0x3h9ei3EIdOKabQHpsLPJ/dxP
	NTt3avvLzgG+26zBYn0qkwc34kPlTIT8ezt3JYG0nE7vnpXEnzFkFIMSpzTHz9/dPmu1SnD+yS2
	dXPsUOx5Gofi6SybUgBvy8j7Wfiy80xHm8vcrsxWAS9QsSuQzS2I4D+oD
X-Received: by 2002:a05:622a:306:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ed71b0c0bemr20671691cf.0.1762334080466;
        Wed, 05 Nov 2025 01:14:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmtSI3CAHA+k1D8XrOBNP1lVPWy2EaQ/BbbivT/VBaf8u+Sr4kLRQ8RzgcFfgQj/lftw8C6Q==
X-Received: by 2002:a05:622a:306:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ed71b0c0bemr20671501cf.0.1762334079984;
        Wed, 05 Nov 2025 01:14:39 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723f6e06e2sm456019866b.40.2025.11.05.01.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 01:14:39 -0800 (PST)
Message-ID: <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:14:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2OCBTYWx0ZWRfX7KEvYa4bmMR2
 Td1sl9dzMDL9lcJhFhXuu0a6J23bwxY6vyimkBHV0REg7hOKiK8sDrZ44qkkyJjk46QPTci5fe1
 XYoF8kqQppcxOhDxE3Y/Qkr7I6fGAdz+AfFDNjMiN0qNlM9HRSS9tBQEPUZbnZ2vGX8zyuUeYVx
 uMtxKA2waNm/P3M1rACBhDOmzUARey2Ut7BeAcCq0fymcNDRV4gn+2xzToWVqIyAnqzh5Ji6SVR
 gOupk5p17c8BPjO/NCEWhda4bchr5+i4MD0zfri5VoAQaBmK8fPan6P+jJbusSBYeJNEaHndS1x
 SkcY3+R7lWer/7SIEKtMkNXEg143ocryLtPATmdHh1Sg+yEd5QWjGDoTK5+nUSuladHxIlWlMtk
 romh1krU4X2hsALUegAXuYAuV7LcRA==
X-Proofpoint-ORIG-GUID: gI49-EXWJagq8Ip-5gLbQW84SRe93yn2
X-Proofpoint-GUID: gI49-EXWJagq8Ip-5gLbQW84SRe93yn2
X-Authority-Analysis: v=2.4 cv=auy/yCZV c=1 sm=1 tr=0 ts=690b1581 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LtfW4vqWST33oogqdjEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_011442_485306_C195A86E 
X-CRM114-Status: GOOD (  20.37  )
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

On 11/5/25 8:53 AM, Charan Teja Kalla wrote:
> Add ACTLR settings for the device nodes with below compatibility
> and is mainly targeted for sa8775p:

The commit subject should mention it's the lemans MDSS specifically
> 1) sa8775p-mdss
> 2) qcom,fastrpc-compute-cb
> 
> As a side note, "qcom,fastrpc" compatibility is already defined but that
> seems inept as the devices that will be attached to the SMMU is going to
> be with "qcom,fastrpc-compute-cb" compat string.

If you say it's a NOP after all, please split the fastrpc change into
a separate commit explaining the issue and removing the wrong entry

> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index c21a401c71eb..c76f6076f487 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -47,6 +47,10 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sm8550-mdss",
>  			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sa8775p-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },

This list should be sorted alphanumerically

> +	{ .compatible = "qcom,fastrpc-compute-cb",
> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },

This will be globally applied to all smmu-v2 targets with fastrpc,
starting from MSM8996 ending at Kaanapali and everything inbetween

Are these settings always valid?

Konrad

