Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A839CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=984yqp6xp/UoBF7AK86FvPHitvhzVPhDbtSUmWGIqgU=; b=WU2TO8xZpnAJaOLH0MuAbZRlrT
	VjBjV+wdN9/lqmEghzfb+zSoHdOB2fULDfWC1G90f1dCcriXm49oSqqo3Ce72USnX6gIjWO9QBj+q
	xTZ/zZiB09LcJbbh4ZbvXlQ7zPhiFirADEHjo5Y9oYbcPabda7OFRwAaVGzqfRuXz7OVZMW2oww5g
	X6Ij3ep/xiyylw92huIamP416BGsRr014Pc3F4ZblSH6cmgJgEQW80xBH3KqzTomT4r4VUjCyONq7
	GCXYS4T4Rfw91RAhnlzWH/IboVnk2BunBcjFNCdln2SoSt8J48waMfI4uJnPe+MiKDhOvODwGfgf6
	Xk6Qtc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3YA-00000006ac0-3YP7;
	Tue, 23 Jun 2026 16:00:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3Y8-00000006ab0-0Mqp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:00:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZp4F4053103
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	984yqp6xp/UoBF7AK86FvPHitvhzVPhDbtSUmWGIqgU=; b=EIyIx9f0zBiXE/ft
	GvJtD5yz45oJ3KZ5VmYdMAfQqMW13fA3Pyyd1APY3fKsobzmnG7zh8k+1Nio20Hg
	IR0xNNCAvytNmFFeSqihmoPDkDPbaF/NrM0g9GbMbQtkuyiHplpyXecbo+fp/7no
	N5F1LLC20LsKLGkM/9rc1R6WGu4fZN4bcuqvL668lG9QA96cmxmi+wEMb+QGuhp8
	RtllTQ3H/N3A+G2KF7xYPnCZnVMZsxwOha3SpguietOBtTU66JxdRMti1xVQdfKf
	AHRHq6KK90t5MJUa43i0CcQi8zlgXmZBuGbxrox8ffDCE9ajtL2u+AtL+YyBd9+b
	Ru7dFA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9yscev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:00:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8df26121c8aso181886d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230430; x=1782835230; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=984yqp6xp/UoBF7AK86FvPHitvhzVPhDbtSUmWGIqgU=;
        b=PHuBaNM3WmG7PBpmoK1k9y2YB/2BHblgSRhQaNA/zAXnNqu/1109WxYCZo53z8AmKj
         j6X7LgGayLEUBH6I9+qIPfOOYaH4Irfio3D4kCKQzmoHQDMe0N1aAtbKsnbaoTPDEPy1
         Ah+5FBo3pbocvcYJHGlkdEuRyp86PI047RSB5jjIufNZkrKxkUTSnaF5XlMnw/DU3yVc
         EDlAqLu3l5Zu7xHEekZvP4PbzVkUSHAhD24ssHewKEeqsjZ4uLwSgUSVsZVZBuIzF84q
         UF8iHM48+DKac3J7u64+I0QFNH6tsIRg1IuREkjl+8Umz6mhOmkwGv+eHWP+skyzZ1++
         C+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230430; x=1782835230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=984yqp6xp/UoBF7AK86FvPHitvhzVPhDbtSUmWGIqgU=;
        b=Vpfp+A/20nmlMY/ITO6kW6gEbJeBXl1NVErcNSMnEmpP7hn248AnlM3Ty7+vzZOvBv
         r3EXq8+OPbboVqEQImkaG8H5tQC96dzsRE91UV2rcpG3tlgB5ok0T43WhQfWYtt9g85a
         sBOm2Ghp/eByl7U53gCIE2cDiqr47vOQsCc+HSBMIpk0J3yIn0cRCOGa3TvhY/jbb+bd
         i1NS4LOSQvdElPEn7Kfn4h6pNPjd2cGDmSwEbUOKt1CfdiZn57AkJ/iL7FuhiAOgZ5z8
         AUcuylC1FcSEZ4wz+WY1O7e0qK6PqyZH5nMcVN1XCJ5s1hkAD5rZrTzidNghnfP/9j1w
         dYsw==
X-Forwarded-Encrypted: i=1; AFNElJ/hTxPLSHwC03kR5mpVvVoFNbjrpmO/JbymHJO/7w+2N4MdD3+IYMIjeubo6GSU0Roz/+2oTpcnbSjLQX1/8lPc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0c98G7W0tFY5IQHr/tSAgn7hZMLl7/YKrrbFtPBYxzyG/8I6k
	sWGq8pYMpfELxAUhz6zf3MFFXODVwH9P0f2be1v24xYVUf+BnffIoxoyxppD1ybHN/dhkFarBXB
	7sOMft9l4NnNEJW9pyRMRs1m40cG9NkkJpXAgd7TclOkbfWM69BiVIqDhIEWlOjNLvZ99h7Apc0
	IAZA==
X-Gm-Gg: AfdE7cnK5KETpKmcAGj0ySjdfaLtxdbp+leBStv8ufQ74AP5/I1HZgQ9ot6tThV4JC1
	wDXhLjsC4WUUNblGsjJP9xQ83au1VsgipFi2DWnbvaJsPv6DEUlqpb+4x8eoLgOKH7B1M3B1KQz
	ICjXtw7y7nUWTCXHOVE+reNkNA5SWQi/N44Ius00ofE1vHMtLr9eK58Y95z/A7g94qGdWv//X1F
	g6ZggR+GfCUy1xHolGvcuTdvaquqiVfQkgadaMUjkFKuFSK6deiZcDyMfG+gcY7GT86ZjRHH2Xu
	TmNUK/8ZANzNnVCuAmvV5MdHIP2mnCT81hFrJ2g0LDEF4YyYACkG1Vm3Jo6JR1mbzovAATuCrzh
	5srFuJw9e0pp4YV77Qe9UnJdFfR9ygoQgnPE=
X-Received: by 2002:a05:622a:1a85:b0:517:6a56:accf with SMTP id d75a77b69052e-51a4f417e62mr59007161cf.1.1782230429965;
        Tue, 23 Jun 2026 09:00:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1a85:b0:517:6a56:accf with SMTP id d75a77b69052e-51a4f417e62mr59002911cf.1.1782230426876;
        Tue, 23 Jun 2026 09:00:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm540916766b.36.2026.06.23.09.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:00:26 -0700 (PDT)
Message-ID: <d334e36b-5857-4d2f-b493-08f48398c02c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] iommu/qcom: Fix inverted fault report check in
 qcom_iommu_fault()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3aad9e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yRyykpyyrqY15ofKUHUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: xddABw3fBsVB44APRP7pG1h-h1dtg-wK
X-Proofpoint-ORIG-GUID: xddABw3fBsVB44APRP7pG1h-h1dtg-wK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfX6N48vxhTpoJ+
 fRWeRO0Q/ladqn0fl6MDomlQngG9jyD6e1viDj0sgRuEK8uuYpcWfSPJBmOR4z1cj6o3nnfAKIl
 EMs4AbIxXbosFanoc+XgxTCHXyqHWR6ukDPv2aLmvEX+mGgVmGacrR+lnVAjj2aijeWVQBK5r2T
 V2A+LjODClq3cfa1ExRY8lA8GEkb03DLRahDElLakU1chWvmKT5G+KjWRYgzunBBIVQSf0F5ElK
 uo0DhqoemkY3PZLLqV0won1jarJHBJZJoJa78JTip0GwZMeNgxS0htzxVWIdwaOIDODBP1Y7vf2
 SBRVma4d92vpbx9GLE1/BfoV3vefQzOvAVLGmL1pQEOFYdJ5qlmg8odnBQFB6VfZDIR3/tFwuB0
 bNjyigBybsnNzeDtp3nKzcXN+zObXGWXtJMHIJkSKZjQlxDaCdU0kXsk6BsIgvAJrtC9MeMjecu
 aEyFoRmCq7K3HHviKpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfXw5duw73bNd4j
 6kFx1+laON6omiDyXNSQsO6+14QacX8zZ/zDSxsT98G7sB0AzdbOj8bmjKfXBwTvWeYxaCg+L0r
 pPwIdeEJzUxG3dWHrnXCR+3ofHT4k5k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_090032_243053_13D76940 
X-CRM114-Status: GOOD (  18.74  )
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
> report_iommu_fault() returns 0 when a fault handler successfully handles
> the fault, and -ENOSYS when no handler is installed. The condition
> '!report_iommu_fault()' evaluates to true (printing "Unhandled context
> fault") precisely when the fault *was* handled, and stays silent when no
> handler is present — the opposite of what is intended.
> 
> Remove the '!' so the driver logs unhandled faults correctly.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 32efef69e72d..09f2ee6be988 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -200,7 +200,7 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
>  	fsynr = iommu_readl(ctx, ARM_SMMU_CB_FSYNR0);
>  	iova = iommu_readq(ctx, ARM_SMMU_CB_FAR);
>  
> -	if (!report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {
> +	if (report_iommu_fault(ctx->domain, ctx->dev, iova, 0)) {

Absolutely hilarious

Fixes: 049541e178d5 ("iommu: qcom: wire up fault handler")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  		dev_err_ratelimited(ctx->dev,
>  				    "Unhandled context fault: fsr=0x%x, "
>  				    "iova=0x%016llx, fsynr=0x%x, cb=%d\n",

