Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AC1CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpnShpDWp6cKrywbsJbMpIC2QEMS239oypSj5Z4wF1s=; b=sM3w7uynHueTt7pOcYOM2aJtrf
	PiBACt3ACpzsgbICl8b5KMSSqoH4gHryJw+fvvyWr7DI4R/mLknpJoFwPfvQ5BE0vHdKbN4HDWEdT
	mV5rWNfo1Uoix+t2i6S34pdDr39nW62yxAk8ZBWKs83DiiMucJE43t0CpR1hW4HQsDXgGbIk+eJ3H
	INtOgBo94YN07Nb5sCCadSgZRFmvg+GmkRJTSc/SKszVTCBd9Fo1sNluUYIM7F1cOs3DnN+RX7jqd
	34doPS9MtW7Y6Ai3aGNzJesqSligRwCXm0s5c7mT84doq7QricXfD/HovHpWrhFuFuS4SKrSLSvJp
	ay4BR1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3n2-00000006c6A-0aCv;
	Tue, 23 Jun 2026 16:15:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3n0-00000006c5p-260v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:15:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZZJG134187
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JpnShpDWp6cKrywbsJbMpIC2QEMS239oypSj5Z4wF1s=; b=k9Exqu5/dgqKDN1c
	cB/qWC7gXYZY79XSWQifRRTftMGDZWWodL3n24TIuGE5VrtYC2Q7lZirZg+DbP4y
	5fzS0mRaKjCWKkOzyuTOyobPy2nn3CcFHwbqBqCiHUc+ftv1/z/3u6RXEV2J73nI
	jPpWYoo1PyYSHH1r1gSOU+DTPwD3XMDjIPchrFsEGOTw/zUH/53B3uU3NV32JfZz
	Pfc9qL6KBPz1ihpvz1ysvEKiDMrq7UY/Ku4aGnXHRzMaMt9kYEqk7lc8We/GySg3
	2eTPffuOqrJ/7vGKOiBfVcTK4gt8TY2Yz6pGxFSpb6c2sn++q3dJIuLD97Lez24S
	o8MkyQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr321gge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:15:51 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6027a5761so12740a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 09:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782231351; x=1782836151; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpnShpDWp6cKrywbsJbMpIC2QEMS239oypSj5Z4wF1s=;
        b=dgcRy1R9EAUq6Q+aDFAox2BINBhIhkbKYP1tb1UJzpH437RsZPZvdHbACyaiuuwy0z
         IHUAdHIlETBvGigPJL/ZBxikXV/4gpPHVIASRSWSMvC5NuiIHVlBSgXyROpq3es/PZdp
         QzZv1dI/KaQ/vYHGcCMfOCFFz+6Yvxg0bRPSHZeyh1gvi3UtXuFgyvGY1HIhSR5dCNfG
         4VwiATV5xeFv+NwI6rLiLFKhhJ4Zqshzl8j2NlIgUSaN85qVL9KhG7FVZveRn+cGrwf2
         KFppnguGovDpSlwsie+R22Waj6LENzWhP149cAGHZMRSDRaL/QNE64oSGBjtyNqFCYpy
         6aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231351; x=1782836151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpnShpDWp6cKrywbsJbMpIC2QEMS239oypSj5Z4wF1s=;
        b=LRI7DXXZ4gpVAaeI/rzyznLH61rwCJSFadzuwzw42M/vRJvOoB3JIqWYje2G8CDeWQ
         EydczToAT/vKVmYVFktVCIr02MjU8ifSpQXv4GMNK9vwXlAQ4gbD5pm0/uzF8JXnda5q
         lBmTlUOOkwfeDKxXDlB4yGH0k0TqB7MSebdtzA+SsM/0p4f+S4lGKUT1IZwarWMCybJz
         xucLC0XMo5NDqqrGbq4XRHcnw2IPVQUyyoxeBe7N/AtTJldTuUvpSi2V7zo4im+5YkBv
         duFHKBRGCaW08yPUBVrxL7i1cPYLBv20x9PKyZX+nJJZSVGyRG72CucfAnmyGz+8VuZ4
         21mA==
X-Forwarded-Encrypted: i=1; AFNElJ8MnztMYes3LB2jt5zAlwqvc5pjwUO3pIOYMSkniVfdLTZTw/i4N9vmevp2MTqp5sU/g70Tjwjb3Be1juCE2ert@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+IZ6uQrEdVtZH+uG+umc0kjeQ55PB1sYIKzcorEnwantU9dui
	DZcyqy4q1Tv5CNPbisg2x2V1AU4YeDtNrXbLM45zxcENregTap4PDmzHLZ7RXWgEo11wtCtVBwK
	c0za6Mh00/AqQo/xqn2dVAMeLkt/7AZlZ0tGuYpz7+N5ebegbGhEe3mwuitEmoifxpHeZ/G/zGN
	ZcFXvmTtnXog==
X-Gm-Gg: AfdE7cknF/enwnTVH6l7bFEFYqe/mPy2ayrccKDJpFZX7O9Y/dXfflGEZguLw6YZPcB
	OpnS9eZqkylFQC9mM6ApGme9OkC6zvWOLHjXlJHWP8+iEJN/V1oQntbuhQdyimTf7hmx8O6K4Uu
	3sbhjHYuKShNROrSNOPuFf3r6LtJNszB6my64WrY7dyXJeud9NPi4GoUBVTRkIsObvgXyze4h85
	Vnvs5Mua7Hmkqa59VWh/8bXCuB2W8Z2efaojqwuH+5y1O82zS+KQrUnk1u53e8n3OTDxG4Mk3rr
	/+kho/qDG161315S1tDcPieL5S5XBaGwGNLaQ0Yg9EFn59wDaPaYGY2rh5mM0YftW9LudEJHJTM
	YUIxe+zTUnfY7eE7liY9Z40UiKhMXHI/Nsb0=
X-Received: by 2002:a05:6830:6d17:b0:7e5:f49b:35b9 with SMTP id 46e09a7af769-7e97084dac5mr2813273a34.0.1782231350938;
        Tue, 23 Jun 2026 09:15:50 -0700 (PDT)
X-Received: by 2002:a05:6830:6d17:b0:7e5:f49b:35b9 with SMTP id 46e09a7af769-7e97084dac5mr2813248a34.0.1782231350491;
        Tue, 23 Jun 2026 09:15:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b856f92sm4762756a12.11.2026.06.23.09.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:15:48 -0700 (PDT)
Message-ID: <13ebe945-8e7b-490b-890c-27f775ed6f9b@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:15:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] iommu/qcom: Publish pgtbl_ops before releasing
 init_mutex
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-6-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-6-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3ab137 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gOOtitiCZwdyowkBYvIA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMyBTYWx0ZWRfX36UMLemTRmFf
 zKRwa5awnUtYIsJxPlYHz9jEclSS+OPz+iHnZJgtzJPJlaVOAdC5Vs2leqrUb8KINj+DSDYfYZ+
 PW24qaRbPRPawnDCTnSSdFp9ptZChnCcihsg0E25vGosHTBWtR5OJnNmENm3c6qT7VV6lseDbbF
 4/ryK5DXobz3MZY6mBVFw0OTFwmQD1442k3pDuVxmX/w6DnBJ2mKv9xd0RI4oUvrhJr19FaZRzT
 XwC4vdGirDCVrJmINuY/bwC3wWvfkzk9Vpd0xn6S4FnFEAaw9U2CBN5iDzyhm/xYQ2Qv3Ztf6Qp
 nWiDeY9EPyCVGQQrgTDWzuiDy1qGkWe+iWoDFgNPucwcszlsAt2qUpUIfvzYp00SpffaWA7ovwY
 ctZlA+MQaxOJVv5R6uhax84lZZg7wA==
X-Proofpoint-GUID: bnahWUGvoTs4EKZ50H0RI1QsgJu7Y37f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMyBTYWx0ZWRfX1AoqQrXF2/Va
 dkdBqSyjFYCV6ZZI5p6mvQ+V5exksIPjByX+PRCLuJnlLKvLwerOeiR7UAlCPFPj8tDfOVRKqwZ
 LwPLEATbFSo/lKQYQAleFOfcEco0amo=
X-Proofpoint-ORIG-GUID: bnahWUGvoTs4EKZ50H0RI1QsgJu7Y37f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_091554_656286_AF8095F0 
X-CRM114-Status: GOOD (  19.18  )
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
> qcom_domain->pgtbl_ops was assigned after mutex_unlock(). Another thread
> calling qcom_iommu_init_domain() would see qcom_domain->iommu already set
> (domain fully initialized) and skip re-initialization under the mutex.
> If it then called qcom_iommu_map() before the first thread set pgtbl_ops,
> it would observe a NULL ops pointer and return -ENODEV for valid mappings.
> 
> Move the assignment to before mutex_unlock() so that once the mutex is
> released the domain is fully visible to concurrent operations.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index b6ce85f7f923..40fb0408dc07 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -306,13 +306,12 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>  		ctx->domain = domain;
>  	}
>  
> -	mutex_unlock(&qcom_domain->init_mutex);
> -
>  	/* Publish page table ops for map/unmap */
>  	qcom_domain->pgtbl_ops = pgtbl_ops;
>  
> -	return 0;
> +	mutex_unlock(&qcom_domain->init_mutex);

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

even better, we could probably just wrap this in guard(mutex) now

Konrad

