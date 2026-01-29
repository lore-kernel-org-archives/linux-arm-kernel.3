Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC190D3566B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 05:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkukUrhkikTfn5enumCD8SQWrFh8BVcAlcVi1tx2nYg=; b=ePHFBYqpdM/Uw/B0b0cbwLUue+
	48d7gjSubZifn7d9/g24x8BrtlwEZH10LqvrrSitQv4RD1im8PjsQEohq63LP+cI39ph75enNdRHw
	tlPeRGEMb1q7n7Rio05i5+9sLTxNlaeq7b0Bgy7WDRVUkTXFW4vIU1VkdNj0uuMNZKKWDusfx+f7x
	tPkoe/t9xHstEW/AD3JuIBgRnxjpOPF+Lipjw6D1GXLhRQ/OGh8pkEs32neI2ru2U/VMXBWdig6nX
	b6wNLfsr4G9lHXNHyNIWE7Rqll6U1AURRD4fHL2WCaAJOI4NPPmr7VFQUGfKznex4K0jEF3P4BnP3
	4LstcL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKkH-0000000HHns-0kzx;
	Thu, 29 Jan 2026 05:39:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKkD-0000000HHnQ-429e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 05:39:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2pBrK2374935
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkukUrhkikTfn5enumCD8SQWrFh8BVcAlcVi1tx2nYg=; b=HOZGFFK8wpj0xw1g
	UE1nkYDP7qUKO0k0bGR5HP5oK7OIMpZUCsKSoc/fkrRjAdGmP7OLbjQzi+rYl8Sr
	L42BdhvPKhCre9Q+1ZBk3jCbJWOXd5rdOqtsZOs0GWJR6WLa7F1xafkUkgYZ06Wm
	Lyc6gWGDM2uwUupe+ntb6vyp5lzA/wUsgX6PMyQwYFHDVBwI0t9i1MVpaaDpalGu
	rx726EM5vIP4NUh+5TyJ4e5amm0Q0DnCjdLTm1+ulnzzQHBJumbM2upTUFyIerBl
	IXy02z8MHoY+Ujhq+GjOGswfOkovHH8/n71QHtQXT7yfnChwZUGXnTAvHhxdoqq7
	w6X+HQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypk22115-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 05:39:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81efa628efbso493816b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 21:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769665144; x=1770269944; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkukUrhkikTfn5enumCD8SQWrFh8BVcAlcVi1tx2nYg=;
        b=FTbM0KiBRqeORKM4JsFqgROr4aqTb/lwavGh3GZsWQrThS/VCJgQi4/8EXUsEk7ZHH
         44AOEt7KSBVjC8Cp2u6f0dbqatjcxyq+og9v6Rcs7nU9crLhPBIcGebWRTMOFt0mDmkc
         t7qynCqNVYAdoShMmjXmR9mXY5UtBo6MmRXSMy7dskC420wQ28J6CDmJVRzmntbln97F
         GemCfBA9GvC9kcwAUr560/Rf/qAGHQZxdDyCc4UScRLjd5G1ry5rAxrrucGjhayRJ9yV
         2FrY52vAYdwxtEl9dfdHqYHpfr37T9fCcAL7uen7+gpK0Ktwo1vY8OinHy5E4Q7n1Qxo
         t2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769665144; x=1770269944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkukUrhkikTfn5enumCD8SQWrFh8BVcAlcVi1tx2nYg=;
        b=dKYrMTzaQyIG7fkTh0ybKwXyLKK88X5QHfMazuboqjFc32qXRqxEyJR/jCUDKVr01V
         Fy1i5A/cXlQ9aytbZKlJEYVS7NZt3DerqY7isu/sfEalnKpnEiAWMV0wr+90ZCMvuAFk
         JME0qa4BwPlqh99NOBUSBdObB2T34QxP/P3eaXobZROIzBz9xk7j/vv3+ye/uawVa8Uz
         mL0EmYech6inNxgKO6Z/YCAY1HzFXrjo1dIfjBRumSdPfa7cgWHjyo7hfG4enkJBJhJ7
         klHfHdTxhYKsb+9Yv6816FxKfs69Bsiokz9na6mZxRgOXnWI+2zsegKeyqQJpeCKHto4
         eNKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBhmwTU87/1mJlLmTPRkiPI4cDTuZGkngUIPvcj2x7+FFVsLIV1ODBwAOJxDzj9+xzmvFic3In0cMqnZSaKScX@lists.infradead.org
X-Gm-Message-State: AOJu0YzPGGRO+IPa42mx1pbMjy1itpN6yZq0d6W9LybYE69gijCXmX0F
	ciEgfioRFuELMP0sK/7FCBH/qT+0ftAItaPROYq7GNXJJSS1YFvL55sQbmn24tc8Qp2m8KoknTt
	xFDalzBRc8vmN47gtBP/KeNhJV+hxdtL691dwL3NNORfQzpHo0/8/SFZ/SKetVb7HfoJv27bKUi
	XDjA==
X-Gm-Gg: AZuq6aL9yxtXNzhKmPOnF++dY+E/KRX2ZtYGjlBOcHJhTzYExU9/MeQurBVCvLH6s+z
	Jzf9iion6tnuYvcAMZ0euF4HpYyuIE4+HV9Q78jD3SHHmGL1xpxrurpXy9B4UA1UQFHmEFDtzmL
	ZUdYpHTsS17Mbw6PNolQX7/1sutTLxz9dHDVxvl03g3t9QoWWcjtYbGoJte5KQwRRrgQsBc3wIu
	c+S/tF05I3QM+4KgAzCl486LKyxoPwOlhjkx20OEXpf2V//sEz7pEu9M9/gYVBNKNnZpKBQGiMt
	XQNCRTs5YvbZtSBvJ+MHW7Aj0tanFiSSeLo39p2g1aTp2cTCsuq+PzLYkHLydK0Ksc5yOr5XnnJ
	bZgdvgK5dt5SNEsdHeG2bWGtQcmvk9y1r6yyFbmvbAQ==
X-Received: by 2002:a05:6a00:9a6:b0:81f:a85e:a627 with SMTP id d2e1a72fcca58-8236917dcd2mr7727732b3a.27.1769665144384;
        Wed, 28 Jan 2026 21:39:04 -0800 (PST)
X-Received: by 2002:a05:6a00:9a6:b0:81f:a85e:a627 with SMTP id d2e1a72fcca58-8236917dcd2mr7727702b3a.27.1769665143884;
        Wed, 28 Jan 2026 21:39:03 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c5a190sm4725770b3a.68.2026.01.28.21.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 21:39:03 -0800 (PST)
Message-ID: <832e8ea4-2b85-4513-a285-9d4ab1dd66b0@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 11:08:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] PCI: host-common: Add shared D3cold eligibility
 helper for host bridges
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
 <20260128-d3cold-v1-1-dd8f3f0ce824@oss.qualcomm.com>
 <kztudduots342zz7gnx3twtlvjm5pd7sde627zxcsbe6c2imqk@7mmp7vjght5j>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <kztudduots342zz7gnx3twtlvjm5pd7sde627zxcsbe6c2imqk@7mmp7vjght5j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PfvyRyhd c=1 sm=1 tr=0 ts=697af279 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kJBpcOZ6olZWUerAqwAA:9 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: tSjddp_Qu0PWGa8Y2sLYwKA9i6rKL5SM
X-Proofpoint-ORIG-GUID: tSjddp_Qu0PWGa8Y2sLYwKA9i6rKL5SM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzMyBTYWx0ZWRfXzxjRZEzdugri
 SZPBTpeEMOTSZ1zKvUR4UKwIg7Qq0aQ4/JnYYwEyG0swM47yUxuAd6pU3D02twC8k6bLPXDc1zv
 t1av6qsUd8mPlPvbLfN+JfgHbaetgW/sKMndSCXsZxjoGQvFN/RmHKPG7nbG1diCmFaozYLwjCX
 gWPjCfEGW3/QFMXukGBKAwB04ouYvKqURphHnL9s1YRp4+w8WYCVDM6RbohPogITOKyYXpV6wPi
 OZLi84T0fRjnnhUgQvfdm+wYCS57LDc2PJMswIcYHRCAATAGTL0SNZOf16Y4kL/jSZp/OJIGwzp
 JXvoub4gvwW53FZtqE3OLc78IaU+Mvl04OdP/UJg7/quZmGTtx+4m9abfeWxLi85gtPtFwwY/9N
 dQi0z/Tz+GgmlzffIxST0+zkKh0kdTuy/bWOuVw4ZJOFczkLEmY9Gny3MZPi9M5nFFZmFjoQn8v
 /ad7quffGfNo4MYuAeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_213906_964361_8949C9E3 
X-CRM114-Status: GOOD (  33.89  )
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



On 1/28/2026 7:56 PM, Bjorn Andersson wrote:
> On Wed, Jan 28, 2026 at 05:10:41PM +0530, Krishna Chaitanya Chundru wrote:
>> Add a common helper, pci_host_common_can_enter_d3cold(), to determine
>> whether a PCI host bridge can safely transition to D3cold.
> Please read https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
>
> It clearly says that you're supposed to start your commit message with a
> description of the problem you're solving. In fact, even after reading
> the entire commit message a few times I only know what the patch does,
> but it's not clear to me why this patch exists.
>
>> The helper walks all devices on the bridge's bus and only allows the
>> host bridge to enter D3cold if all PCIe endpoints are already in
>> PCI_D3hot.
> The code below does walk the bus, but it doesn't allow/disallow anything
> as far as I can tell, it queries their type, state, and if they are wake
> capable?
>
>> For devices that may wake the system, it additionally
>> requires that the device supports PME wakeup from D3cold(with WAKE#).
>> Devices without wakeup enabled are not restricted by this check and can
>> be allowed to keep device in D3cold.
>>
> Again, this code doesn't perform any action, it doesn't
> allow/disallow/restrict the devices from doing anything, it merely
> queries a bunch of things across all devices, and the commit message
> fails to capture why this is useful.
This is a helper function used by controller drivers, to know if the 
controller
driver can keep in D3cold state or not. we use endpoint states and their 
wakeup
capability support to determine d3cold can be supported or not. The 
return value
of this function will tell controller drivers to know if we can allow 
D3cold or not.
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/pci-host-common.c | 29 +++++++++++++++++++++++++++++
>>   drivers/pci/controller/pci-host-common.h |  2 ++
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
>> index c473e7c03bacad2de07c798768f99652443431e0..225472c5ac82c6c5b44257d68a0fc503ec046ff1 100644
>> --- a/drivers/pci/controller/pci-host-common.c
>> +++ b/drivers/pci/controller/pci-host-common.c
>> @@ -106,5 +106,34 @@ void pci_host_common_remove(struct platform_device *pdev)
>>   }
>>   EXPORT_SYMBOL_GPL(pci_host_common_remove);
>>   
>> +static int pci_host_common_check_d3cold(struct pci_dev *pdev, void *userdata)
>> +{
>> +	bool *d3cold_allow = userdata;
>> +
>> +	if (pci_pcie_type(pdev) != PCI_EXP_TYPE_ENDPOINT)
>> +		return 0;
>> +
>> +	if (pdev->current_state != PCI_D3hot)
>> +		goto exit;
>> +
>> +	if (device_may_wakeup(&pdev->dev) && !pci_pme_capable(pdev, PCI_D3cold))
>> +		goto exit;
>> +
>> +	return 0;
>> +exit:
>> +	*d3cold_allow = false;
>> +	return -EBUSY;
>> +}
>> +
>> +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)
> Please add kernel-doc for any EXPORT_SYMBOL() functions, so that it's
> clear to the next guy what the API does.
Initially, I had a change in my workspace which has kernel-doc, but 
after seeing this
file I see none of the exported API's had a kernel-doc. Following it I 
dropped the kernel
-doc at last minute. I will add this in v2.

- Krishna Chaitanya.
>
> Regards,
> Bjorn
>
>> +{
>> +	bool d3cold_allow = true;
>> +
>> +	pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_allow);
>> +
>> +	return d3cold_allow;
>> +}
>> +EXPORT_SYMBOL_GPL(pci_host_common_can_enter_d3cold);
>> +
>>   MODULE_DESCRIPTION("Common library for PCI host controller drivers");
>>   MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
>> index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..18a731bca058828340bca84776d0e91da1edbbf7 100644
>> --- a/drivers/pci/controller/pci-host-common.h
>> +++ b/drivers/pci/controller/pci-host-common.h
>> @@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
>>   
>>   struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
>>   	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
>> +
>> +bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge);
>>   #endif
>>
>> -- 
>> 2.34.1
>>
>>


