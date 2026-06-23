Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FEECD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNCnasIGge6iLQlgIEDujkQhHNFEgY5Q07iOwzqg3uE=; b=UxnFmYZCLwzeT2vrB9MUYMGGqC
	9c2B9/M/uPNoGTuAzCarsJbpRsH3+MUl/r+PEEj5hjz8GMYRvmlQpin7Ad5wyzZWR7MMG234iV7o5
	WhQTkbAfNmlJfKbIHdDVvRLmYdq6pKTrgkDptdw6L0c10pn54C6GSJO6KdUDIm8UZIMI5KO9HHHVB
	N1gr5L64dIYWKtefjngcccp3ke6FJflYC7OjD+zATGXrNkgwv9d+C63TN2AhGc3x0R4B8nrOjhsWK
	G5c872ZIUZ70z8xyCy3bGkq0GuCwavD8RjWJtr7o2p1TvxXGazF+HvWWFeSZXEHwCGIWKoELNbhjB
	8ptSs58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4HM-00000006enL-0wBW;
	Tue, 23 Jun 2026 16:47:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4HK-00000006emm-1p44
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:47:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NDFqvD271015
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNCnasIGge6iLQlgIEDujkQhHNFEgY5Q07iOwzqg3uE=; b=pDY3yLV8p6AaPYor
	6i1WnaLjwRgDHl+AqULKrA+SvQ7QGs7OtcgUPlg+oCSRXyETLuz1MldKJ9cw1ZUs
	Wgj18jmlMuxQ3ohXl7BfanVmjD2x2JjEVq8ZLMn/uC74mDpMeS6a2i/HzGIyhAP/
	I1WR8eE3wwTbp6aywJR0NKUdycz6bPQMrE9ds+fD7Eon3UBWOJ9bbJWOO+qZDzIb
	ymQpl9HsYzYldCHlqXXIxOnPcFqm+Oe1pMxLK1otiphDTPjVu1PBVxYSPPggBjLg
	urGCm+rqwf4hHkvxLLUq7F5PjaZpzobeneMMnyUW/8A7jA42ekDRb/ay2cdUjFI+
	vH9yQw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh0xw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:47:12 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c4271166f3so11129137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782233232; x=1782838032; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SNCnasIGge6iLQlgIEDujkQhHNFEgY5Q07iOwzqg3uE=;
        b=fbOw5mNcWtMxbordU3dx5flTFWFADdswaoKye5nA7TVdVgSr2YJEBa1V3X+GY/mYno
         ENYacSs8Fb6A95KvRk2UQopUst65Y1r4vE31+JXqRlgfrdSbsdk/7kTqvY/Gm4MQU7Wk
         zQfpOPtKJAyP9LF3GOJnWTY3AYsa38ZsQn+1EMQcSH/QI9cy1sQXr0qVDyvIW6/uoqaN
         4bGkXSFqETo3B/aKp80MaGR80+g8gwujHVYoFCXk2V00pNvjl1tKGyy3flieUOY6qpGz
         KDiBsO+bXGEtpnqMQz0KrqeIDfSXFzIzig4vjy3GmR2Y+sGMHiOXkZACii2C4v3ojFsq
         PDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782233232; x=1782838032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNCnasIGge6iLQlgIEDujkQhHNFEgY5Q07iOwzqg3uE=;
        b=SizP05DkqmR+xYI2nSJPyjDiX11MniXhnF/r/xARfhT7faHorql4/la1eyYXeHM9xD
         Kf4A/tHWOCUn5Qh3kq1ifCwbp+4oP+O3zS1buhk6qU6C53Dp+hT9jwTozu8SmjNAt4lM
         g3IEmuDY+QyVEm+v/iReIK0QjGfi3/Yv+BUexED7q2MZpd37QMXR9QTsGSkRfIr11wWz
         x5Wdc8roDeMDWEocTA1FrnABzTwxgiPf2fdwaWr09TnBJfbMPcu78l6H5yacr7PhfRLW
         wyZzS90CSanZPoj0PhgdM/7YWtU4QjxgOaty7hlM4s8bsjywd9qjC5aRRxBnU4T4R/VZ
         hVYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TOPRIQ6e42OEby10ARmA0YmSf9Z2qiLzEPe5clGh9CmMkzc2EcBd0uUClaIt21qeouG+y5HuxyrvlNu0Ly/iM@lists.infradead.org
X-Gm-Message-State: AOJu0YwAgRGTWEI6nQ/aiYNLeQRwr1KKmvF+Sf3JJRJlIjQcQzTytT9F
	PzF9qhtyBo7yq3wgIN2nPbmBtx4dpTPJd1MwncBQBfaD/gdHuZDq6RnLucbL1GwTSj5GD//FwfA
	bwRYHIEa1cyFy1wYuBn0YbpHkxA0XstyzZA/poOZqd8/NwRCTXCrPEhOR5JdFMDrF2ryc1rrJV+
	WTxA==
X-Gm-Gg: AfdE7clEuLg2mZvVWY+TBKST+PB9TlG41zzMqWNPqYXiBJ5Mt/KQaenVLDV/dxXI8ag
	hqdqHALMSSD4GqkkU888u8Hi+uZqLgSpkFtw7VYWqe2nfoOJpami8N7UQxbh/q6+Vo7EOGQ7YcP
	WRUIoLeVyuXjlUnOYP/0S0TutF5fcfThXxi8VdaWaAhs27E0h5N0HX6A4NpQovNjf4jEKW2ek+d
	m3BQByKPPMSN9IzOJ/b3V9gws0SleTI8DbTUTyhxIDBvmBLCJYRiwJeqhC/4bT1lXlGBbNvhuWK
	QOXQUXsIhDhFdoSKdWDF0kohR7SRcNzEB7I+Mre4htQ1zIR+CnS/sBZ7Eb8WkZelBSmF8eOtYUc
	nVNxHb3u9zefibYntZ1rY2itu0cvVYTkgjVY=
X-Received: by 2002:a05:6102:5715:b0:632:8717:e553 with SMTP id ada2fe7eead31-72f3b6a9e65mr1438693137.7.1782233232052;
        Tue, 23 Jun 2026 09:47:12 -0700 (PDT)
X-Received: by 2002:a05:6102:5715:b0:632:8717:e553 with SMTP id ada2fe7eead31-72f3b6a9e65mr1438685137.7.1782233231529;
        Tue, 23 Jun 2026 09:47:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1002d6c5f6sm195658166b.49.2026.06.23.09.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:47:10 -0700 (PDT)
Message-ID: <adb84189-59ba-40cc-a18f-0405ee5a7b6a@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:47:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] iommu/qcom: Add NULL ctx check in TLB invalidation
 paths
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzNyBTYWx0ZWRfX7iXVS9M5i+Ox
 axAuCn/kSAERAP3Q+JcO4eZrP6my5M1yWKu4bgs6wKba0wNpfuPhlOM2ae1DOObX3+jsp/zPa16
 1bt2j7bcvkxQQRebCMggNka8LHE2NwfLhgaNn6NuwaxC2lj1uOvvHA3E/Fcdz6/dHWri1Rs/94q
 ix6HDGzZloVaqgLsfpUMDXk+bDF0io7cIg3pYg2WPp+ijOGuqwObi47eetH5aVHJIyZk+JWNYz1
 pzMZJks9tEoloUQA0q9+djsBbvEE5InzBbYGXZCCvmOQfzz/Ifyqy5n70l0cjyiQ0yyUykwObKj
 Og47DZUc2HrNZXwiE2KeTmCYaa6lKcJfdKcOul8tqo8WV20GbD5eJysAxq2JJxP4YArbW9rOAVM
 EbZEsrt6YuyhF3jXriChzwZLDtmc5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzNyBTYWx0ZWRfX6EfRjA3IefHV
 3RnYO2y3BtBbpuzdJaIVLvGxTmVyoZDgMV2Uc/LctUEZyTILLzqfcURf3+wuXYYDlLUOOQ/6W6r
 Repiq8dPgNCD8MJ0+7vB2BR4KJsl5cQ=
X-Proofpoint-GUID: Gy4VdtaBfIc4Ms601-ObajJracU9D3Jd
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3ab890 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5zc1ivFRGWfvx6kDekkA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: Gy4VdtaBfIc4Ms601-ObajJracU9D3Jd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_094714_594519_632F1E4C 
X-CRM114-Status: GOOD (  19.07  )
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

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> to_ctx() returns qcom_iommu->ctxs[asid], which can be NULL if the
> corresponding context bank failed to probe or was already removed.
> qcom_iommu_tlb_sync(), qcom_iommu_tlb_inv_context(), and
> qcom_iommu_tlb_inv_range_nosync() all dereference the returned pointer
> directly, risking a NULL pointer dereference.
> 
> Add WARN_ON(!ctx) guards with continue so TLB operations skip
> broken context banks without crashing.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 40fb0408dc07..51b60b296bb8 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -121,6 +121,9 @@ static void qcom_iommu_tlb_sync(void *cookie)
>  		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
>  		unsigned int val, ret;
>  
> +		if (WARN_ON(!ctx))
> +			continue;

I'm rather unamused that we have to deal with this in the first
place.. I don't know if this can be easily reworked to be more
predictable, but this works in the interim

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

