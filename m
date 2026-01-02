Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD34FFA3728
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 08:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t19VCHyA+6puRXgRu5jbgBfiRPrElHIT/LgwB7H22yE=; b=nU8OaZgmCefQdEMP2BTDm5i1HK
	hhmf/VNoJ7dUsI7/CiVAkepQjZzY8fkulgkeKhZu0jQKrogQa+WXFjh4qgFLGeKr4SA6c/UdcK4iM
	J0SzYGqJ4mc3gx4zKBuzzfb6x1haqnqqyJJkzrHOvCtoFPI3cVEXUkkYGph039zoA4pznprvCLg4O
	3wLe7aKW+CKPLqPmeVlwmWhQQA8fj4T2mNDqyyOIIGdvI5m4gOxtqXK6TfBC6c1eRX6KSpt9ukfO6
	xPYlWZ0AhF4x5HnMXXb6FZeKdP5F27TVjC84Acm81wvRMYbd5CwTRZHMjDCxkflv+qCED8biKkAw+
	4BUheYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbaRo-00000007z4o-2yng;
	Fri, 02 Jan 2026 08:23:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbaRl-00000007z4N-3vH9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 08:23:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60288OoS2138872
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 08:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t19VCHyA+6puRXgRu5jbgBfiRPrElHIT/LgwB7H22yE=; b=Xn47xScOse4BaMa4
	3eH7/6BvMQ8R6J/7Gg1uBR90aEyXUq6qGDaqYfjIVj9HpVDRdA7Ga3I7anvvXfCA
	/MMXARWayfhQUimWgz0NTx0agEjX1TdJ51X1lIMVaoplDgfjS6ubXn531rp4iv5l
	tp0RegtXfAE3QDFRatuGhcWTt4EHywUPXUY8mcZbNUerY1qmjNk9IRlAEqAyXFTW
	4zqyU9aBHmg+oHs9VoT38unhWVA8mp1sk22AIy5gqUWTts/RGH+1lxmEHbaEVEcD
	TYRrAkz+IzkTuxZ2Z93+enFNXEclHjxGKZEToNH7YyogQUIoOfyL5htJDfDZ/99L
	burjCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bdsc9shbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 08:23:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0dabc192eso274816555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 00:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767342223; x=1767947023; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t19VCHyA+6puRXgRu5jbgBfiRPrElHIT/LgwB7H22yE=;
        b=ROGT8OoXdLV2i/dLh02EBPG9gVqDcMthxbQYvBAKVNNr7Tg8fPqfl+b6uhSVADdL3l
         3U7aoG7SD1+8fgeB44fkNku9P4870w18MLkJT+CvUdg5bhZEM2YtgQ1cIuUiZQLTOYWv
         8H/hOwFKXuQVSEYvu6z66PucJQXePKpa2TsHFTjY/r8RrxV7u+Y0mE3OBuvKuh9LGoro
         xZQz7icWe/d6PLHFcXKDhZbrzui+itMiQEKNq7ccq2kNtdv3FGUg8oKYrZtKNlwufHh/
         2FZvhj8PreA6KKeXRc7fpx/fz1ay8gTHcoH1gUft4F9NyBKgQwDiAh2RlaZeahUtfixW
         miww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767342223; x=1767947023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t19VCHyA+6puRXgRu5jbgBfiRPrElHIT/LgwB7H22yE=;
        b=Tgx9jTdkbMsHuYk1eHgO7k7QwUy2jooN6/FZnmq0r7jT7QIu1WucX594ZPvJqyNJG5
         g8XcjjuMZFeCgYwTBiA0d4YOpAbqM+M5WybDvJvBUl3yyeUdnXgIljL8373vFwMYjy1k
         uwfPX9HefDYxryN/Cu/uf+UiS3ScXZtTBBhnDJKoPsB2HnK6AcUcs2nUXJ3qgcDoJMd2
         bRZ2U7Rn1rzNDMnkpms3ve1NJmUd/kpePSBffg/5F0gbBdStpuU8I+yPNo7SjM5lh8Yt
         22G30WPexf7UkmVFhrid3yrYULIQ1tYJYOasNUKYzTrNB3fc0Gy915zuhnIalWp9p4Li
         LF6w==
X-Forwarded-Encrypted: i=1; AJvYcCXJt8mIh9TVYKeAlWqGr5njSwhjIqX7+2ODpbaiItTtdtNLZ67olTmYGCS9am9J3ef0z/wckNjUyvK8RyxwK7I7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+XrJnzsbnkJaDtjG+dVH28C5F5CozPhdOgAcevL1gpGxK9Kr4
	YN9QInEdqG6k3grVoIA56j9RgXg/x33OwrGyNVV9DWclbeGyVoUCjms5xIuD/7OijamvBAW0i7a
	Doy5Ca0+yxAFCrwBD2C7VMVO5UfP1KOBEIdqZb9vLlK56uZh2yIuuDlKIvX5HYKQrTq6c5J4IAV
	0R1w==
X-Gm-Gg: AY/fxX6yxxk/t5PbkZQn30LRnIqHB8695nNSGAptB5jAXhQ+g6H6FFp50ldYD94UY9/
	akEVlmb0q6bSkgjZ/AzGV6V4wRn7l1bz+lN6ln7fVLfJiI4PSPVHSoT/WMT8k74Wpkz08nxx+CW
	kZSXk9SBAIG/zC4JueTDfk7DxCzaYx7dXAhVSkggbrxMx28noYzq0g+Mrc9sWyvTxjWV8O4o7/F
	QYwV5xc2twl7YYg8ir6oXixHZsXvC1MwV/F4RLxejMhptfe3Uu9SuthSDsQGZ8HKia3Be0eqRL1
	FGx16Q2Gfl4277vHrc1Bgmkx7H4N9Cq78M4nAJcPXPAtrsYdo4B5RlGqJmO6RRtB5uIqmRtNsDF
	0xnGgfKYl6byDbf5gO4smjPUSbcdg7rESLfVB
X-Received: by 2002:a17:903:2306:b0:295:fe17:83e with SMTP id d9443c01a7336-2a2f221ed26mr358798935ad.19.1767342223293;
        Fri, 02 Jan 2026 00:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOi+SxzktmVPKzdXAl+fgvR8EFyDqnt9n30EmQADNghpbS6vilTLEme0CFoPHjOzlb7lzAjg==
X-Received: by 2002:a17:903:2306:b0:295:fe17:83e with SMTP id d9443c01a7336-2a2f221ed26mr358798825ad.19.1767342222783;
        Fri, 02 Jan 2026 00:23:42 -0800 (PST)
Received: from [10.219.57.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5ddedsm365065375ad.79.2026.01.02.00.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 00:23:42 -0800 (PST)
Message-ID: <e0ba7db5-a64f-4845-9d12-fe66d1d5d575@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 13:53:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/arm-smmu-qcom: add actlr settings for mdss on
 Qualcomm platforms
To: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org,
        Bjorn Andersson <andersson@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RHHZcyYrSTrbF-bdvoMsXxys4sMHMtaV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA3NyBTYWx0ZWRfXxnFQdzElZ4+i
 166FlYoLkjtyHkmLaRbkbqbCqRDmAuCCo5xtneon5vt+J/tHJL8bOyAIVYDprlXkOmRCRsRYj2T
 fYJeasfWHlxb1yK7Fh5td3E38/IaYek3fBcSuyXAlfG2CNzLjBajD+Zrzob7ij7737bcg6h++Nt
 /xGOTrOtHQhnCMtkeTDy+Awvzjr3/I/Qk068UPZ7R4o0nad6VkfyqxN3VikoFqK1AIdNGArbOZg
 8VJKiedk3kvhUkoDyf8AdbuBg4Cf7OAoeokLNGYPEdUB6WjKO/1ufaYQMWT7XvK0lMPf2GVqaxH
 uLgvQwk5yhjItqq/CrWdcoZHghdjyWt9DTzuwqdIcPA+XFQ7lIsjBzoqqNHLhzZIE05p9CGAKL9
 Kiyoh6Q6GpxgIXVlmbq40i+TOzM081+AUD08uSM8PK1V36NqMwrP2gBQ3hS1X9iUjtocJos+/zP
 0Z00uXcjlv75uP5SFJw==
X-Proofpoint-GUID: RHHZcyYrSTrbF-bdvoMsXxys4sMHMtaV
X-Authority-Analysis: v=2.4 cv=Hq972kTS c=1 sm=1 tr=0 ts=69578090 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=IbTvDgxCcU_WzWRXJZAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_002346_017114_3458EFC8 
X-CRM114-Status: GOOD (  24.13  )
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

Hi all,

Resurfacing this patch in case it was overlooked due to the holidays and 
Plumbers.
As per Dmitry’s suggestion [1] , I’m sharing the v5 revision, which 
incorporates Bjorn’s feedback on v4.

[1]: 
https://lore.kernel.org/all/CAO9ioeW0fafwRnxvDJ7yHGcQYbgfkfRF1BMTpXpG=8tSKRptdw@mail.gmail.com/#t

Thanks & regards,
Bibek

On 12/9/2025 10:53 AM, bibek.patro@oss.qualcomm.com wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> 
> These are QoS settings and are specific to per SoC thus different
> settings, eg: some have shallow prefetch while others have no
> prefetch.
> 
> Aswell, this prefetch feature is not implemented for all the
> platforms, capturing to those are implemented to the best of my
> knowledge.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
> Changes from V4:
>   1) Change subject prefix to "iommu/arm-smmu-qcom:"
>   based on the changes. -- Bjorn
> https://lore.kernel.org/all/20251202125447.2102658-1-charan.kalla@oss.qualcomm.com/
> 
> Changes from V3:
>   1) Add actlr setting for missing sc8180x & sm6115.
>   2) Improved commit message.
> https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/
> 
> Changes from V2:
>   1) Add actlr settings for all the mdss devices on Qualcomm platforms.
>   2) Improved the commit message that explain why different ACTLR
>      settings
> https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t
> 
> Changes from V1:
>    1) Added actlr setting only for MDSS and dropped for fastrpc. --
> konrad
>    2) ACTLR table is updated per alphanumeric order -- konrad
>    https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/
> 
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 57c097e87613..c6645df97bbc 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -41,12 +41,38 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>   			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>   	{ .compatible = "qcom,fastrpc",
>   			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,qcm2290-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>   	{ .compatible = "qcom,sc7280-mdss",
>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>   	{ .compatible = "qcom,sc7280-venus",
>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc8180x-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc8280xp-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm6115-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm6125-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm6350-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8150-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8250-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8350-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sm8450-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>   	{ .compatible = "qcom,sm8550-mdss",
>   			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sm8650-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sm8750-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,x1e80100-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>   	{ }
>   };
>   


