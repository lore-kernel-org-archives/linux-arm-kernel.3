Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9744C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 14:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LR59wvaFC1B+jtg9kXlIKRe6vvfPELWKIv1ziuV/xg=; b=31lwKglZYA/oYLNGxTXHHmmVFB
	zPLkZ3MiStr6K1IsBGxLcaR2GAY62zDrPFQ2sOdL1V7UQTwPgLatNGzeDl4JqriZsmoQPJ1WCkU37
	TAgU16naBiQKm1hDOr3PJJRBBRIeexnbzuX9EsGsvbI20wdOjfImlVzsdMM3apZJnlJHuNR3gDEgc
	UHgROydxP0cMZpbPG9FT4+SY+TzOPEdc79GW7duq3lSBLirmje9nidnKHEvgXmg6veaRJG5vDiNM+
	2b+2DG3cF/h7flugjExzGdKnNYDIQTx2WqXoaymG6yX14CfvS9jnJFfu73Wc+j3Z+JzUOarhf/fcv
	JzoatZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYQI8-00000000Ncl-3CjH;
	Sun, 06 Jul 2025 14:24:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYQFn-00000000NSy-0LYM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 14:22:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566BK2fF006848
	for <linux-arm-kernel@lists.infradead.org>; Sun, 6 Jul 2025 14:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LR59wvaFC1B+jtg9kXlIKRe6vvfPELWKIv1ziuV/xg=; b=DZG1zwTRrWIo8NW0
	SH7dNDOOY81dG4Haah1W7G5s6GBOxUmt/s7GxQNYDfhqYyGqftftKCN5PYZVkBd5
	eW/2QXQhinMuQhSGlqvitrcR7+3/wr/H8NceFMJlQhSZsHGMs4T58P8Khl8cZ5YR
	JRRTaDYfv7Xjl9T9OUVMyHNoHS6Y38lRdZf9HatRxhAIzegnGiIbL5t/hb6IAmO+
	nt33oMNdKtP3rnCcGBG/q0YMWWlDmr01jTleGo5CDH+NkX9vdCAwiXhAg7BXJVDg
	ewsraXQEi7s6klzhN5KkVsiYrjtsvVjTAou7UNMP2VfxwHItNevWpjm/pwtIClth
	rVj0ww==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q4ebn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 14:22:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b38d8ee46a5so1677435a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 07:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751811720; x=1752416520;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LR59wvaFC1B+jtg9kXlIKRe6vvfPELWKIv1ziuV/xg=;
        b=UtQztlLbEoG7k265m8iqvM+TP8I16UGOvdR78bxTdod9fdw91KwkV2sHFjB2lc/zZD
         +f39DP2Xx14Pseask/lrANenu/lvfw7BiW8lllMDUaRhx2PNJXWbWL6gDhTOQ5FZc/bQ
         74ziNbmCzc5iwGmtmpty0kQNddoAeNtJNE41cNFoIHXMMP4TLGJ/lrvETSf+igJa3bJl
         UoPvtwxBIMsD4ax/V6gdThI+To/SCdFSn24QnIgwqbYdGcHBKwxPA72HeN4U0OeVe+wD
         Hf3BxlY03UnOrnqjjuPdNl5oxDUidXa8jxJLDR9uRZv2B0klqY2Z7P9sJPUVKOSTc3CL
         VPyA==
X-Forwarded-Encrypted: i=1; AJvYcCVhu/+SyRaxwmQL1syljntm4VmCQpeqreXwWHXKecmdp0AZPlMrp1VhS770LlDPC6muggmMXW9pu6PLX/28JiKb@lists.infradead.org
X-Gm-Message-State: AOJu0YzM3Af7LpjMsOrTCQEjSXEGCdHWgye4BCC1VbrDuouFs9JZf62e
	LcMSuf5+MmXDQ6gLSGzV+4UamVG43g4eBYN73y7aGsfyNpFc2fUIM616M43m6mDdTUFK5mYtLU0
	5sQnGq3dY5PIDfyp3aG7a48/zEZPuGYCdx4BmU9IQBzGPOOJlO1o07bbf6izXzwU885Dnr3/Nnu
	vqGQ==
X-Gm-Gg: ASbGncv+yJGHnGCvrXlVfUbZfV7ViXPpR5oJuUpON1FYUJRdlKfI6w2G0z34ZN/z+j2
	E08pucv8gNa8CgQH9rpGiq1zaOhPULeWX0TbAg4o7qdyWngTZm930lHHKDxnRQ9yYaDzzVVjQpm
	nPCNeT+ioXpXdK/RPAYLEzmpxx6Ei/f4/H3CX3WC2Uos31B265QgcRU60tFBuOHKJCUd+mkWt5y
	07DFxaqhvLLMN8drRxGcSy7EtefwYjs3SGEn9m1SHBFspWt7f4ta4tHMenbLUOLbK4qh3Jvn6/I
	oPNyu6TiJ2M6sq9VooDyoUzg5BF3HQSqjVpoJNW+hQ==
X-Received: by 2002:a17:902:c943:b0:221:751f:cfbe with SMTP id d9443c01a7336-23c8595204cmr167337125ad.19.1751811720115;
        Sun, 06 Jul 2025 07:22:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO93oCbUuKR455AbSvqBvRYCReXzTUnYblW52a/kTh3+cnV2a1b0uxIXTMZ96Ppo2+XoCvjw==
X-Received: by 2002:a17:902:c943:b0:221:751f:cfbe with SMTP id d9443c01a7336-23c8595204cmr167336735ad.19.1751811719650;
        Sun, 06 Jul 2025 07:21:59 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.234.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a4c6sm63428015ad.46.2025.07.06.07.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 07:21:59 -0700 (PDT)
Message-ID: <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 19:51:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5MSBTYWx0ZWRfXwbuKC/eO0+jJ
 VVulyTBy478sKgP2WyOFaLe5hz990P9wu0W46vkScEeg1RWsmdXda1g0S18TbvXaE2B19nkEB7S
 FfbYNKHv/bwvM7NNFEzPXJkhM9GMvXqbH+UMCgztt7Gq+X+hkm4HQxM5vFsHhE8sG2dxyDAsyT5
 Noj190rd2wkWcFzdMvVc0SyFdxMjTkckFeSdxPjtR6P2+eyfMmZEOcs2gfnPLv64zZNLyOBnwUi
 oekgJxICJan+yyixeoENPKph3ILAmawbLBntJe2G/180Y0P5juJnlpZm7ZCRuInaivbTf2r4K1N
 k8gCyD8/y5sVD2vw3aW6N2eSkDbFzOv7F+O0GelqZi15UoHIENKkkaW3QvzI499BiC78ERdasgS
 vKUBD3fT3E8I8mKgriWJ+g1L2sl8pkdK7I1O5p+v5QjfJxNEvhHI5FXw2wCu8u/wilGyoCSZ
X-Proofpoint-GUID: MpAvOYgGj7a_5hsLeusHLIg4b7OANBnC
X-Proofpoint-ORIG-GUID: MpAvOYgGj7a_5hsLeusHLIg4b7OANBnC
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686a8689 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=D9rl3thw99EfY5kE3N+1UQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=idnX5w4AHIxaUxQtNqEA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_072203_149321_FE0F99D6 
X-CRM114-Status: GOOD (  22.25  )
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

On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> because of the hyp limitations. Disable PRR support on that platform.
> 
> Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Unfortunately, there is no way to detect firmware support for PRR safely
from KMD.

-Akhil.

> ---
> I currently don't have access to other devices from these generations.
> It might be necessary to apply the same workaround to other platforms.
> ---
> Changes in v2:
> - Simplify the workaround as the issue seems to be limited to SM8250
>   only (Rob)
> - Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a6275d9c3ee3d084c215362 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  	priv->set_prr_addr = NULL;
>  
>  	if (of_device_is_compatible(np, "qcom,smmu-500") &&
> -			of_device_is_compatible(np, "qcom,adreno-smmu")) {
> +	    !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
> +	    of_device_is_compatible(np, "qcom,adreno-smmu")) {
>  		priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
>  		priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
>  	}
> 
> ---
> base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> change-id: 20250705-iommu-fix-prr-600451b1d304
> 
> Best regards,


