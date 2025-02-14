Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBC0C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 13:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eeic6vXkmMzY8YnqF8B8+d/0s0ePlY9ZRC/bULfVz9M=; b=ENTYpJSuZ0hxU+sAGPIoJP2r/B
	tyt080WR3d3ZU3O5rLwFQ0/R5lmWEq4GQxsjrOQ6n5t/Tzy3d52dcwRUP8F3/iAW58eQV0JP7/pJy
	Yomth2c+JOLS7DUhKlmZro6v8QbYTJKIPdXXw23Z5r5NFTYHd47aVIYT6JTa1S0Ry0RZOnJN2kNBC
	fQD7iTp7USFGelWauatuznmfiN/ICRWFONMB8PBqveDnn5C6rv6BGKASHD+cTuP/8/0Llz9KJMd9q
	WjukkDkzvqL1m5v0+3Akkg7vuQ80Vv/LNXaiEDdYQ4uWaD8z0BLp/zLRI07TXZWxz99mYbsiWxvDt
	WOhk5B2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivcr-0000000Eytv-0HeN;
	Fri, 14 Feb 2025 13:21:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tivGS-0000000Etx8-0JRd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 12:57:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E7i2wV015968;
	Fri, 14 Feb 2025 12:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eeic6vXkmMzY8YnqF8B8+d/0s0ePlY9ZRC/bULfVz9M=; b=PVgUCeCE9F2rRhXX
	GzjSWiCH6P5O+kLbZtt+AEZ00puhiZnlYoo/pAAzuLWkhBph/rjI4DZd31iJmfi+
	w8+AAy73Zwm+JekXLLMZIvS6Ece5ErQBvOEiS3OtI8glWeY7G+9ldBueMK0Cgu8u
	TbUH8HTI5gRptoBqobtu0Tl0aCekLv5NbM6DNccHsjO2N53bm4O7uEDQYBkZj1jR
	rtsOVsh7C9fJ6ZGGqC559iqh2qMu4nciP3boqhzPVDa7Olvt5Nm6hIeQ9cN8WusZ
	uS6VK7KmdOLPDBV/uMM9CUtT6PG2PoEptRYrFYV8arfJO4DbPSyQ5594X99aCh4C
	wkBp+g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sde8btc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:57:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51ECvPfS025861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:57:25 GMT
Received: from [10.219.56.14] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 04:57:18 -0800
Message-ID: <2a090f80-e145-410d-8d02-efdaf324c8c9@quicinc.com>
Date: Fri, 14 Feb 2025 18:27:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu: Handle race with default domain setup
To: Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi
	<lpieralisi@kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla
	<sudeep.holla@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Stuart
 Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Nipun
 Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg
 Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring
	<robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        Bjorn Helgaas
	<bhelgaas@google.com>
CC: <linux-acpi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
References: <cover.1739486121.git.robin.murphy@arm.com>
 <87bd187fa98a025c9665747fbfe757a8bf249c18.1739486121.git.robin.murphy@arm.com>
Content-Language: en-US
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <87bd187fa98a025c9665747fbfe757a8bf249c18.1739486121.git.robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8MPMEM59TFtEpOVHpTq1BK9dVBJIHPE2
X-Proofpoint-ORIG-GUID: 8MPMEM59TFtEpOVHpTq1BK9dVBJIHPE2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_045752_258129_71D62EB0 
X-CRM114-Status: GOOD (  20.54  )
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

Thanks a lot for posting these patches, Robin.

On 2/14/2025 5:18 AM, Robin Murphy wrote:
>  drivers/iommu/iommu.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 870c3cdbd0f6..2486f6d6ef68 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -3097,6 +3097,11 @@ int iommu_device_use_default_domain(struct device *dev)
>  		return 0;
>  
>  	mutex_lock(&group->mutex);
> +	/* We may race against bus_iommu_probe() finalising groups here */
> +	if (!group->default_domain) {
> +		ret = -EPROBE_DEFER;
> +		goto unlock_out;
> +	}

We just hit the issue again even after picking up this patch, though
very hard to reproduce, on 6.6 LTS.

After code inspection, it seems the issue is that - default domain is
setup in the bus_iommu_probe() before hitting of this replay.

A:async client probe in platform_dma_configure(), B:bus_iommu_probe() :-

1) A: sets up iommu_fwspec under iommu_probe_device_lock.

2) B: Sets the dev->iommu_group under iommu_probe_device_lock. Domain
setup is deferred.

3) A: Returns with out allocating the default domain, as
dev->iommu_group is set, whose checks are also made under the same
'iommu_probe_device_lock'. __This miss setting of the valid dev->dma_ops__.

4) B: Sets up the group->default_domain under group->mutex.

5) A: iommu_device_use_default_domain(): Relies on this
group->default_domain, under the same mutex, to decide if need to go for
replay, which is skipped. This is skipping the setting up of valid
dma_ops and that's an issue.

But I don't think that the same issue exists on 6.13 because of your
patch, b67483b3c44e ("iommu/dma: Centralise iommu_setup_dma_ops()").
bus_iommu_probe():
     list_for_each_entry_safe(group, next, &group_list, entry) {
		mutex_lock(&group->mutex);
		for_each_group_device(group, gdev)
			iommu_setup_dma_ops(gdev->dev);
		mutex_unlock(&group->mutex);
     }

This makes the step4 above force to use the valid dma_iommu api, thus I
see no issue when there is no probe deferral.

So, I think we are good with this patch on 6.13.

Now coming back to 6.6 LTS, any ideas you have here, please?

>  	if (group->owner_cnt) {
>  		if (group->domain != group->default_domain || group->owner ||
>  		    !xa_empty(&group->pasid_array)) {


Thanks,
Charan

