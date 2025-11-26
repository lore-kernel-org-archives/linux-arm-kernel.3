Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95946D1036F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 01:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7i31meeSU9nTcwAbcrWqzAMNAAO5fXiHJNoyvPBSbA=; b=mibPVyP0gQX5tQxabG+fTP0SnS
	3XwWBlybzRG2UUKcZNuBarOirC2ols7qjmuFSyWZWg0kxsRVW1LMDzNKGau3XGv1i/6KWRjT24YBz
	i5FK+Guixv7XINQIp0AE3Mqfr1fRLVCMNUYFVLZyMnBPW3XZ4Jb/i2p2IF15GiF7s2vuW9ClQqc2+
	pUAVS2hmXOpw6LPQ6xFCoEYoY8SNCCVJelSJdQJttBNRBnwR/1hSSVHSiKTiHu/I3r/psjxtab7jN
	8r8VqH4781lZ7f7L6ZYCpLTTdbVmHNaTUeTi4l7XwyCn0PdbmOcA+bUvk7SaYRtQxLWmMAT8x0P0A
	hNQCpZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO4h2-0000000ECFC-1O6o;
	Wed, 26 Nov 2025 01:51:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO4gz-0000000ECEp-1l7V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 01:51:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APLFE674121220
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 01:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L7i31meeSU9nTcwAbcrWqzAM
	NAAO5fXiHJNoyvPBSbA=; b=OuZvMsBaXcg8GaDj4MjoNPKg/4JJ5BnOEvHO+ufk
	iOO3zbjC2pQZv6HZYj1RCMgBWYWZM3viHu503S/M3afT+SSG3RK6U3xLXQTb8cbg
	Rq/A077E5YUZqWbg7NcLBXy3Y4pk4cmvjjlMhV66s1UdHcVvoOuJwFDdGOO/md6S
	J8GSr51/PPy/KXO3CdrRUiFheARE0cmXN3YJaWnXavc372gL3yDDwFy3QZD9d2bI
	lz7ZdWPJEALYbO5XVAmRMD+uke8T19HDaQRWBCbrWDBCndNKzKFbY3uECeENyI0g
	FaHwynFe0tFAHQ0Gtb6GmbNsFj1SLYYCFqcaJ2aBOknFsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9xad93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 01:51:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e19c8558so1407924685a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 17:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764121896; x=1764726696; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L7i31meeSU9nTcwAbcrWqzAMNAAO5fXiHJNoyvPBSbA=;
        b=U2C1qEutGXIiEsMZU2UFq8vRsw3gMfK70TTlOBCP+qf7S/4rsalUlnKTXzEPaXZ5Px
         0Rf4bfk3bcgHTS0U63aBvEdCDM29e+IlWiaIXNPNnYnDvPN/WJgPNw0sKEPfbZlkNBst
         6BR3MnNGDZN/JEs6QmihxQdE9YRuV1qw8q9gliQcl57Quc7zeVCL0uI0Ui+8ZsrnqMO7
         UPej4yzJSRQhOuZTG7N3XHgxcwl1i5XY/iHOwo4dVFcVLeXj37OGLVssb+p/KyozS0or
         xc2xo69XuHx/2j3vQcgscbDEWYmpTBozDwLliYDMOhPzqjI6bCU6reC1k5ynlAjOoS7R
         3PiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764121896; x=1764726696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7i31meeSU9nTcwAbcrWqzAMNAAO5fXiHJNoyvPBSbA=;
        b=rV2vBXxKbjguKFM9LZK8E/VN42A1vGBdp/2pBJ6NjLdd2gjC/i7RBR+omyfXswMGng
         wbh2jon4vNelfsyDNNHzAI8Dd61ilT0YUwPIxAVDKwOJMxaKCM92EgG0VGBxiq8AIxFr
         cYPs1aj6m3KD3ww54AIgHyq05QRr9mpuQ8UPCt0gZJtr3wMaZ3oSj5B9GrdGHsD1pSYM
         TyCdHC4h9s5qqyqW885mxJW51aTFD+A5uPoMTybaorptAcj5v5oJH3WXNbUTWJMIYBLF
         tKNO7Aev69839KnqAVRKu8bymuXOM/5Ut1FYg3LV8cDGfrQRdWx1w+MHwtsBAAv179Eo
         /cOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuGtNqrS4Q4njZ7yBU5E0K9vSjKcWtWsRTLLXkwa8N4kQ3vec9/1YnQbsPA1Mjid8YHApHnO9NrLgEix3aYugR@lists.infradead.org
X-Gm-Message-State: AOJu0YzXGmGS95OUB8Id7L2Ybakh0xXRi+sCzfFWArCVOgVf6XGqZ1LF
	v5/WsFOCGjwVuxb2LZMgmIEowRwSKOSWd0+c0fTut/A9jbT6PVDDL2gBMG4OHfqNi/BTThebJXh
	yJyj3oA0xqbu6Xf7nOqnvlMcqhDbMqFMHC9vXPPRj3hYYGfYreVIDHVDgjcUf0PtOQOh4FkIeBJ
	IP/A==
X-Gm-Gg: ASbGnctKnmWnidTzq5RKJ2ReCYUGm72nvHVFaEC9Wggmz1dxUqHL2Po2PxMWNJPgF9C
	/d6U/i53/dQGhUeJjA4vu+T+GCrERP/68WZ/1QkVTeky97rAOP4wFQAXTBhK1AJ/QbBmE030xsU
	8IbmCzmaD67txfPdmtJREjA3SfI9GowpIH/x7BJLxmKoGRuYQiFsE3sKArlLTW/EOG2WSp0sAjN
	aTuBzo57+wPcXUT/IWAVCh6ZDo7iZO0Lc6jH1mpcUE4ZJSI9jNsuy8z8z6nBVfUZQtqkPXd5M6R
	hQ0c9rqZrmm8dwdIWowIVTMDhd0noM+L+0d284fRlgtxI8fsrGXGNlCjLBd5GfDO3kOrofbn5vJ
	KPHzEQUjM3glwicpVvr8MiwQaBDmFvxGv8wwpsKIocVXqU9XXOyrdC0GhnSvivtgFo6k6D97GYk
	5g3xl4/wFaagvYrIUBjJIy5FQ=
X-Received: by 2002:a05:620a:4415:b0:8b2:ddeb:99c with SMTP id af79cd13be357-8b33d469d4fmr2401589085a.63.1764121895569;
        Tue, 25 Nov 2025 17:51:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBiysWZ2d8lUT2YSXb0WOudkrGcNWv5wfEnUYYkztgCXli6WXKinB964WNQbdbINNXXNoV0A==
X-Received: by 2002:a05:620a:4415:b0:8b2:ddeb:99c with SMTP id af79cd13be357-8b33d469d4fmr2401587185a.63.1764121895056;
        Tue, 25 Nov 2025 17:51:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db747bcsm5609868e87.11.2025.11.25.17.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 17:51:34 -0800 (PST)
Date: Wed, 26 Nov 2025 03:51:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
Message-ID: <6zyysrrq6mt447s6rg5sk5vy5w7ulzub4u5m24xw3xo7edguwu@73vtynhdp7nx>
References: <20251124171030.323989-1-charan.kalla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124171030.323989-1-charan.kalla@oss.qualcomm.com>
X-Proofpoint-GUID: 1zZyyYFm4AFuQtlm0bHXaZrdfx1CHUfQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAxMyBTYWx0ZWRfX1owYgqScpPKs
 HstxR838reMgyG4f3kMttunsCmHxb3kf/RAxvzT4KwTevsEj7BdF6LMscS+Q0Nr0ShofYpX55kU
 cfi/twI8JelEga9Nfs1vv+bqTNHhSXgdfSlquvT8JnsVlkjPB3/nzgQCrRHsswslTOLGuaFHAvT
 zNNaSD69Pf6l+FnYyJFPkfh2dOFVh3XRo0CmyU8U+eYQUTVSoBzZuXSKnlCnJCgMsrOZ+s1SoAR
 a8MeEYXoBsfM8KU5Kr9OlkQ90PSdg3sZiSJrQHGCZ+TBhlh497VpptRWaYKUEHMF1jCN8HXdexM
 VffSpG+OpVtsji/UQoJW/rkCG5/J2GTzIpZbIYK6FuY6AxrQxrQijo+DdFTZq/SPhc/aBNh15lC
 8bwaQmvqnOskVTBLXdh+7muVzwKgTw==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=69265d28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1k3nfMqBUa8zcchP1JgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1zZyyYFm4AFuQtlm0bHXaZrdfx1CHUfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_175137_488109_A65814BE 
X-CRM114-Status: GOOD (  22.46  )
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

On Mon, Nov 24, 2025 at 10:40:30PM +0530, Charan Teja Kalla wrote:
> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> 
> These are QoS settings and are specific to per SoC thus different
> settings, eg: some have shallow prefetch while others have no
> prefetch.
> 
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> ---
> Changes from V2:
>  1) Add actlr settings for all the mdss devices on Qualcomm platforms.
>  2) Improved the commit message that explain why different ACTLR
>     settings
> https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t
> 
> Changes from V1:
>   1) Added actlr setting only for MDSS and dropped for fastrpc. --
> konrad
>   2) ACTLR table is updated per alphanumeric order -- konrad 
>   https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/
> 
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index c21a401c71eb..ead1a59d40ae 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -41,12 +41,34 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>  	{ .compatible = "qcom,fastrpc",
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,qcm2290-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sc7280-mdss",
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sc7280-venus",
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sc8180x-mdss",
> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },

sc8280xp? sm6115?  sdm845? sdm660, msm8998?

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
>  	{ .compatible = "qcom,sm8550-mdss",
>  			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sm8650-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,sm8750-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> +	{ .compatible = "qcom,x1e80100-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>  	{ }
>  };
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

