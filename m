Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BB4CEE348
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 18:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOgMsJh7yHgEVaismwLoID83bitySPIblPH+7pbri8A=; b=pxD1cEJBqx98yvcyNKy00H6xCU
	OLEtubzVZV1f3LaKrnZeRJzZD9kFusrNQUOoCLjBjHy+L5NEF04xf7YNo1KhZ19nxvKwzy3GTJNwx
	OBx2VrCfq7OlgX204VtShqHkGEqxCXqPs2X41o9VtqovFsgfUaTdRRjjvRBgH+FhBjCPDINirwYVL
	PhjKihSqWZS3do1pSGa+ruan/g9F6+JiDnHrdzOYChsVByjGqkyFpQiN2BG9NHryIMx0emvJN9AaL
	bKB8B+xAhbqYfJ+4E9314G0hqXZezRU3zkVgdKRH9idO3B7MZzTIbhvcaE1scrV+El3vzl02ky1qw
	UE0ogYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLQ3l-00000000uFm-2pw0;
	Tue, 18 Nov 2025 18:04:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLQ3i-00000000uFC-2tNJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 18:04:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGrPq03165002
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 18:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DOgMsJh7yHgEVaismwLoID83
	bitySPIblPH+7pbri8A=; b=PQGtY1Wb+P0FVaPxyXoIobV9WdsgAYmPyiyCL949
	wKchojF5wjuTRnUHDFYRD/X7k7nMykgF9KCpRIUHnIPuIbl3TWPnBdp1Ca3imSpE
	W5wswq7ZoppUT1xmLB2KxhnPbIMFwn0gr/9PwjEroGIll8CtZmkaVUigyYiPmVbx
	kPt5tsAUP9hoGGtu/hlpmEUTMZGHlBLpYNWEnSXpG9oFS5NAUI2mML6MjT4Obusc
	wUqEW5q+l90190OUOR88j0Yb0/3XkzbJOuW5ejwVfioyoHoRRL+ADkJhuPRLah0o
	suBK6FqErepWiKCStCi56D4iF0LnV3gRtFZM0QggLjJLPw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgr7rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 18:04:05 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-63f9c4e3701so3314718d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763489044; x=1764093844; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DOgMsJh7yHgEVaismwLoID83bitySPIblPH+7pbri8A=;
        b=CHMNJnVRA5obkYKYPz4hQSgHplgWrRXT0jIHVQIz9iCM1aJR4JwxDikCc9n82vZcxN
         tM2tG9g+/MMFScOuuJ1KKnEfzk1bCdzOxTw5KKHd0cbkSJG9VKdG9nAY31q7MDn3HrNJ
         qeD9M6ESNNobgtcNhklDgF5bqhQjnP26b7Adyy1m0kYBAtWzcSLHuZ6UkR9cpF4ZSbAf
         irOYq3GDgFyLpJP3x2RA5hc9GdtWoSAj1f9J5BAaJDcz5qzXbd4JPHQ0uVpOfUVibarS
         RXSeRuhd0ZnlHqdHb1rwOeyfnpZhRenvmMXokXzbvjzFtPBAstGKXBJCQxZtBep9jUdS
         MWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763489044; x=1764093844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOgMsJh7yHgEVaismwLoID83bitySPIblPH+7pbri8A=;
        b=dzXxC0/VJ/OkhQDDrYzRVRd+0aOm7wWiggayCaX+dWrGDo92CyVv3BB2IoB50YJPtN
         OzNtOjFDSGE1b39dx+nk+oH9vy2Ayocz58fBZEMurkL9amSEutZKT1Ese8ETnysCW3qO
         iGc/NFGfVZKKG4IkU4YfjHDQfovWS9N3YexFegujvkY8u8RQ2TyOdKwfBMg+AeSkXb6M
         x/81OEw+WU3xx/OjY9VmY1TSEw9Zxp2+uRm752iK7S3rIgmUlTi2aP1j8VSf57G1KB3a
         HDtgGQ9cDXX6MnkKsMmm11W/XWHCctQMOcRUDt8b8vcVed5v9bNUsQgkSmN/yf74953I
         UPXA==
X-Forwarded-Encrypted: i=1; AJvYcCWKQR63HzZsQmzMpeWZlr3T6+5frjq9NB0ZM9Yayj2LgW+0bkbiv6fyDjRuVFV6unRm1jEntmzWaD0dBaDQCzf1@lists.infradead.org
X-Gm-Message-State: AOJu0YwyoI6nyd9a5OeCj+e1Fz+LEMe1PpblNEhc80uJaSZJ6qfX0Eqz
	25b+QWiu/t2C9iLlKT/asK7rzNdgSN/YQfp0VaZ/+UZpKPxd5/BN/LfQWb7YHYdi4ifFCNNv+SY
	rN8yN8W6XjAmyICJp5buEjwlKpD/DPVlrIhsp0mHR5GYPaW4PJzn168U5sQMpjmXFXZm+he/vBe
	Yu8A==
X-Gm-Gg: ASbGnct1woGxyWt0cdA3t0CqNGr5dE2RawnRowUczNlBcEHiNwSgIrnp9jmwWxrjFwR
	gxQDqsWHxUX9YEqAchk1rG7PIYzaVjp5asARkeLLpnSys+58m/NjCCdTCfzGaSA/xzy4KLqOwjf
	E6+rvamG3t0qxLdecPH36HDkhVqiNQPawHkCq7ajJ9xK2HIM3/XwJV9LJHTgtA6uPwR8xOFY05I
	PiaQ+zs6kwBwk9YM23o7qPSXbYEvWV4hmXAaKs4E4pDGLi+u9DiiEmu+9nA/kuX+PvUM97pB76G
	2kTQSfcHa3MGT0Ugv6V+Ug/DmU7GFCVV3pMJNWnyw+6Gz/LIbEct/hqO2Vf9mZb2diZ2AEJbbWL
	p+0RespyuUVaYGnukXMOYFrrj9MhMs8bn7IDZ0JLOpZLhSWXTeO/9wik1TnrW6O87qz0Tl94auL
	Lk/FPe6qJS73mq
X-Received: by 2002:a05:690e:d8a:b0:629:acb6:d8a with SMTP id 956f58d0204a3-641e7562fd0mr13908338d50.26.1763489044250;
        Tue, 18 Nov 2025 10:04:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJDCFxdIFQSE4sT2yUN8Na+Q7D5n9DbKi4ZwR4v2kZ0CHmdW00x3h9MQOY0N0AD3dsBBTO5Q==
X-Received: by 2002:a05:690e:d8a:b0:629:acb6:d8a with SMTP id 956f58d0204a3-641e7562fd0mr13908289d50.26.1763489043667;
        Tue, 18 Nov 2025 10:04:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5959d9c52e0sm62169e87.11.2025.11.18.10.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 10:04:01 -0800 (PST)
Date: Tue, 18 Nov 2025 20:03:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] iommu/arm-smmu: add actlr settings for mdss on
 sa8775p platform
Message-ID: <himyof7napywkc44vre5ncqsatkkaxqnqbhjht6hjt53lakper@4wlwsvxkkamc>
References: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yp6B9iMm3SjHc02_-XGw0VUp2hBO0Tpy
X-Proofpoint-GUID: yp6B9iMm3SjHc02_-XGw0VUp2hBO0Tpy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NSBTYWx0ZWRfX6R4pkf9ZStgp
 BFamc4w32vj7STwQXveTw4n/pM5NghVwosvNact99/5E/ZJT1D/ZWfIAPhRLxk0WoOkxdY5JjUj
 jXNYxZcr7ZsVZ8YTj+gIIcyHja72XlBgjNdMOxYvxnalp8zeo0erbv17P5DlE/yAoydYEyL4zif
 lKbaKSbhqInQaxGgml9/qWRSayi8gs5ZVmCckYHUROgwl4pssGBzApAinljoGOTpTUaUJ5zkHdY
 X+Wy+LxCC0kKQu7eSbJ3aPd3L5EGxn++kG+DHalbGteey0ub0tfZtc9nIt/XmKqrmKQZKywZFlH
 XfEBbvpPAKcnGwwMs7bpb2LlaCeArmzGm8dZMqD8+PJZ0bsTiV/mMUwfw1cWt/006kTsVHzDXvs
 cQl+dYWxofKC6R16CzqsnOwJ/Z5VlA==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691cb515 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mjdW_OwqRCTym2VxSEUA:9 a=CjuIK1q_8ugA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_100406_764533_52AFD4BF 
X-CRM114-Status: GOOD (  22.29  )
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

On Tue, Nov 18, 2025 at 10:48:22PM +0530, Charan Teja Kalla wrote:
> Add ACTLR settings for the mdss device on Qualcomm SA8775P platform.
> This is achieved by adding compatibility string for mdss in the actlr
> client of match table.
> 
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> ---
> 
> Changed from V1:
>   1) Added actlr setting only for MDSS and dropped for fastrpc. -- konrad
>   2) ACTLR table is updated per alphanumeric order -- konrad 
>   https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/
> 
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 62874b18f645..0b400e22cb00 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>  	{ .compatible = "qcom,fastrpc",
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sa8775p-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },

What's the difference from SC7280? Why don't we need to set CPRE?

>  	{ .compatible = "qcom,sc7280-mdss",
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sc7280-venus",
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

