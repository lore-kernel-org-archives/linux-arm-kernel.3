Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB278CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BLJdOTNMnvDK0QZqlb+2VB8xllUiDV37a14B7e6vkY=; b=qKnAjRP1gkojNsIcZbveF2cHs2
	vEwy3OGiXbaBBFBo396eV0DsYQQtVd4Nun9WjfKgqOCFWXkrKS0tVL9rz1BJRwMSBMSvLRo2cvXm0
	Qn00ShsrfE6mbbX9kegv56dJM5oUCGyY9ikin1RfAavLHFwcbnRuaZK+vkj8i+wPNPteFOCpkxQPV
	XXGCTYFgA0903CpRbu4xm6n5r0ew22VmFW+DOjoQDgp8YYTouXi/u3wC6qQ9EjQdncCWiFJxRuOpo
	RYYtjC6Oztp6uDdTaQQTg/mJQQEeG4SCR476tKCPDJuJDXrVw3DNy79dUfOQBwsvG4+1czzwChfD8
	20NqknZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDQb-0000000FxPl-15eo;
	Tue, 05 May 2026 10:55:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDQY-0000000FxOj-47s1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:55:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6458jr1i3409245
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 10:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3BLJdOTNMnvDK0QZqlb+2VB8xllUiDV37a14B7e6vkY=; b=LonEUX8PdHmVy31g
	PpKbFy34z17YixmgtWmlZ6ju6GB2GIr6vH+0n1SM+kdGszFThDY3rKZ8PnXlGjjC
	0NWS9FKQiqPh8vtJ0O8LnmRATVtHaExw6f2jq5XPXZLsUzs5XUglwzA1D70cvK/T
	vpHlhtNAsSXNZ+EVK1UNbG1Ed1fpuZeTofhF6jbdUTuHIVl1AXWh4OndYezl+gq3
	5GpfAsTD2u0CsRITDdjGfy0NBFg4tElCuruagKXxtPIT8MJ2p2OJ+FZEG9Nx7gjP
	211Nh1B/gj6sgVsGi2aL7eHESx0o6gZRpKzt0KVXzyQZbHnvYy6TyVYzbVPDqL2u
	qoJLfg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00uq46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:54:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3594620fe97so12150509a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777978496; x=1778583296; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BLJdOTNMnvDK0QZqlb+2VB8xllUiDV37a14B7e6vkY=;
        b=V0WsDIxXhmZUtWTmyitb0afoUPt9TvsTH/CXJxGyLoP1rCCrddGQpoElM3Lu0RD2c2
         Ag1i+Om7uCw2tXXDYoRnaaeZSD2NBf2XmKd+hH0RUx/aUUux7c8Mv3/lyh1xHh9XSmX0
         vJFrLJDYTAJZKeABTPlwGLoD8yCryBdFve7TYPQAQKOtbvLKCRne9B1l2PdxKy3g5vPw
         vEdfjZ7lsgToYfBwgj0mEG5uGbuf6+Kjb6XvHHF6wMErzZQfNi2h9iXrU0Z5XlfFD+M9
         q6cVC0RiEdoSJM/k+dd5bd5Fjd6XSdGmoiFwajKfm/uWWCbb6oNArpt/XEKF5ajmPb+A
         ndJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777978496; x=1778583296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BLJdOTNMnvDK0QZqlb+2VB8xllUiDV37a14B7e6vkY=;
        b=f/m9bgqCq7Gk9I0NXk2iWc1fuhvLhNFmn0w98ZSRMc1G3luBFjsB+iZJKzp4/MDg8h
         w5qqmK06JzhJsDi+OAHRkegfec1oshh/hEErEeX+TSfNsKi7iqNBYzPg4uatY2Iger2p
         KgqXwyG+xAM9vNFD692LXkMixrL8vEHebqh/biPtX6gxhouaI4sG7BHOUGkLOUBfH69T
         y38MboCrV+vAlymCKQqorEYQAEYo+pE6ChgMeKSUHiJrVT/f5tlb7SE9wrsiNLHsjHbJ
         sNChDOYVVg+c6pDeQDe3+uvXj4YOQBZH+HacLUqkZIQreT/QtC329RTqAsWLG55NI+Tr
         PIxw==
X-Forwarded-Encrypted: i=1; AFNElJ8gifWOGFPB55pe0dRtAELaiVMrOe15jlih4WUYF6HROAj21bOxR8Mo2Mm2HoBIcUZ9QTYK+PeKb0ucKeRyqIFa@lists.infradead.org
X-Gm-Message-State: AOJu0YwOHmlHNFNx5Yr22PXHBVPmW+KyM2Oj+f4MSUoTXMZ5epjaZGwe
	mE5KGx8+WRYHXaxunC/4CmSH1D3dVMKP9bg374ADWXJAtNFc/eVhK3+gVesgAiS0TQ3phEiy2vY
	gCcD4rnWCOUfxQOGCpeW78sb/OYd3p04OHTswmkiOcdAycm4O+zJ5Okvh0kSS0dRE7xRAmfWqcN
	XAoWBsU7Hi6w==
X-Gm-Gg: AeBDieuPsTMihXse0LPaPYTZjCvlUphyo4bUZvYgcsw19L4PqIqsx2+LFWhuq9H5qps
	5RJ9QJetyo/beHrFw7jCH6Yqj392m0kh3HGsKtDIHaiGmCkX5COHVFmCgwjYlbF7HQjwsFohXWs
	30tTRky4g/orY9oZeZn0BVqreq6rwvVj5TI6nC6OSNACiGg/mFxjeHdz0UHTsOlz3Yuj0xbd8xs
	tnJzFRzmnFCK9TQ/ZexAoIESzuh/RsM/ix96Nq0deDehzax97GigPtXVNK5KJt23/0qHfmud91D
	32M4znYroUVzRaqurHkxiWxzhmNYvsPo1iALC7ZXiJkFdgI3kBlILesBKWxNBAqdOwsyGtVrr1R
	P5/oA8yqSHlAMoywDnNmGGCZXxmmL9X2wI4K9DrMSOdti81ndVaqklovU6R4rXAjtBvIMAwpTKE
	GsEfwPl6U4MhUGBCqufOm3HiBkJnjNNkyL8A3wL5H+sx42fbtp3LY=
X-Received: by 2002:a17:90b:2b8b:b0:364:7467:53e5 with SMTP id 98e67ed59e1d1-3650cd866dbmr13459952a91.2.1777978496229;
        Tue, 05 May 2026 03:54:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2b8b:b0:364:7467:53e5 with SMTP id 98e67ed59e1d1-3650cd866dbmr13459935a91.2.1777978495755;
        Tue, 05 May 2026 03:54:55 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae5cc52sm137977745ad.78.2026.05.05.03.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 03:54:55 -0700 (PDT)
Message-ID: <96daa0ee-4cbb-4472-ab3a-19ee32b4758f@oss.qualcomm.com>
Date: Tue, 5 May 2026 16:24:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add glymur MDSS to ACTLR client
 table
To: Lokanadha M R <lokanadha.r@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69f9cc81 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=wtB1UJvddPmpPx-NcbYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEwMiBTYWx0ZWRfX0Zy8+jLKnWsz
 SlvI651ZKXlOrpZouuzf6Am6I7sWM4RAa+fYoW2TdNrIT3qzjSf3UcEYYfhaftRDGlW+BR4doXr
 rXYiLzRuatVmvPcYPqUXdnIWsNLbImDHn3H3I9xVymFoqlh5k6+TAJ8iMQG3iBUr5UV3shzB+mR
 7SB1KXFUUwThLWu3Sz6PnPSI9SZD2DdiUn3IhYAn78mIfcF5DN2vWrRwhku0C+wFcUqU6LKoi8A
 p5vZZqAu5c6IlTqNUdGXwECeQpHI0fQh6oO6vIIvhr6S3nrcqOGxlov23AkOr6agU6+0qrr3kgT
 e1S6eWmcFXARKqGeydvZ9YvVFdqkxHWx3/LSRMq0nZC+Lqbmj0mr8/TvI4ZQ+9VraFxQNKW6or8
 l05L1KLcjW2r2SxQGSt5sBLqt9TXizCHt0s0sPqEfmKfA1ryfjiWXzglIOx3aIyhYifUCL9yk90
 JkgvRV/YReF5DWniuzw==
X-Proofpoint-GUID: hpgRs8dPTwphKPlpHX6_oqHUmVZurIOP
X-Proofpoint-ORIG-GUID: hpgRs8dPTwphKPlpHX6_oqHUmVZurIOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_035459_148108_DD17E1C8 
X-CRM114-Status: GOOD (  20.51  )
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

On 4/28/2026 3:13 PM, Lokanadha M R wrote:
> Add qcom,glymur-mdss to the qcom_smmu_actlr_client_of_match[]
> table to configure the SMMU-500 context bank for the display
> subsystem (MDSS) on the Glymur platform.
> 
> The settings disable the next-page prefetcher while keeping
> macro TLB caching enabled. Without this entry,
> qcom_smmu_set_actlr_dev() finds no match for the glymur MDSS
> device and leaves the context bank ACTLR at its reset value.
> 
> Signed-off-by: Lokanadha M R <lokanadha.r@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index edd41b5a3b6a..6df48499a4b2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>  	{ .compatible = "qcom,fastrpc",
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,glymur-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>  	{ .compatible = "qcom,qcm2290-mdss",
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sa8775p-mdss",
> 
> ---
> base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
> change-id: 20260428-add_glymur_mdss_compatible-44f5b2837498
> 
> Best regards,
> --  
> Lokanadha M R <lokanadha.r@oss.qualcomm.com>
> 
> 
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

