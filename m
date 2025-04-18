Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEF4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9D8vUJMZiZvxPh0ECvIefj34JxtipJ5vMqGMNe+u5M=; b=tuWDgm34uJMvqGFm0BEtSA8ZCc
	UvDYuB7VX55voZSUBUVC0xdXVISnbeLkwgAUERZwW7AaHtImu/hKwrZ4kMInugjIs5441CJoLIHjd
	DVKgkFggWu6jnePR/mUHugbApvgUO+8iAWrVT0xVmdZs+EyRX55R2KAgWzhSr6KN+x3HZFSYzK10S
	WSOMzlaotTL7nDGn8HBi2w7VC068+kXxvIuVJCJtVdZkXdiIfaWcHvN4T7vCaVM6/q9MouIb0fRRK
	kh+F7VcWF6zSYrSQzAwx0qZ+/PBeE9j+PrGr6JzOeszhKJ+AwejCfMahXIoY8gA9ynI4l+14QaR7R
	fTnJjXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lcj-0000000GC26-2k6e;
	Fri, 18 Apr 2025 13:19:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lam-0000000GBje-2svH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:17:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2PFO0008123;
	Fri, 18 Apr 2025 13:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9D8vUJMZiZvxPh0ECvIefj34JxtipJ5vMqGMNe+u5M=; b=hxGQwJ/OzAb6bLah
	B2I3KmvKr0VZJ7UgkgSUUZSUl8pZGHV3CYMSg4607KJwoPZrJJhcqrvYyQpb7yLs
	T16DbgUzpZWfhXcs04YnnqUV3dTaHE/Kkx9h8ajLQKdI8tMpjm0oQST0tU9lvPgS
	jDjE7CzAtMwTYx/hC2GU+vVxGqOxd0H36v//9I+hDvNKplgVgrMzmCRucPF3t/sQ
	UQb8/QIjC+psph5HqaPBCaRfG8LidOQMyozolw9HSJKBkmz+s3akA1HdrX6W0ERP
	dBOCmVad6kp1eX9FTuExNBtETAuXUneMML3xljJUB0ppY6gTDKV7D0c+8ECXD8eq
	OQXDAQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk9vfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 13:17:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53IDH4xO010429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 13:17:04 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 06:17:01 -0700
Message-ID: <71dd2d77-9d20-4c8f-9735-a9256635a271@quicinc.com>
Date: Fri, 18 Apr 2025 18:46:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: stm32-ospi: Fix an error handling path in
 stm32_ospi_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: <alexandre.torgue@foss.st.com>, <broonie@kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <mcoquelin.stm32@gmail.com>, <patrice.chotard@foss.st.com>
References: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
 <72f49447-5c99-4028-90cf-3f5cc11e8b53@quicinc.com>
 <e148faa8-6ee0-45bd-8cd8-37ea42a1de2a@wanadoo.fr>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <e148faa8-6ee0-45bd-8cd8-37ea42a1de2a@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=680250d1 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=8IxrUdWRUM5EU-Lu3hgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 7uc3GSTUJv9cVxAOP8QcAl1G97B--19L
X-Proofpoint-ORIG-GUID: 7uc3GSTUJv9cVxAOP8QcAl1G97B--19L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_061716_731330_A7618623 
X-CRM114-Status: GOOD (  11.32  )
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



On 4/18/2025 5:50 PM, Christophe JAILLET wrote:
> Le 18/04/2025 à 14:09, Mukesh Kumar Savaliya a écrit :
>>
>>
>> On 4/18/2025 4:57 PM, Christophe JAILLET wrote:
>> [...]
>>> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
>>> index 668022098b1e..9ec9823409cc 100644
>>> --- a/drivers/spi/spi-stm32-ospi.c
>>> +++ b/drivers/spi/spi-stm32-ospi.c
>>> @@ -960,6 +960,10 @@ static int stm32_ospi_probe(struct 
>>> platform_device *pdev)
>>>   err_pm_enable:
>>>       pm_runtime_force_suspend(ospi->dev);
>>>       mutex_destroy(&ospi->lock);
>>> +    if (ospi->dma_chtx)
>>> +        dma_release_channel(ospi->dma_chtx);
>> why can't you move to devm_dma_request_chan ? No need to cleanup.
> 
> Unless I miss something obvious, this function does not exist.
> 
> CJ
> 
Yes, You are right. Seems the patch is yet not merged.

https://lore.kernel.org/all/20250115160244.1102881-1-csokas.bence@prolan.hu/T/ 

dma: Add devm_dma_request_chan()

Can ignore it for now.
>>> +    if (ospi->dma_chrx)
>>> +        dma_release_channel(ospi->dma_chrx);
>>>       return ret;
>>>   }
>>
>>
>>
> 


