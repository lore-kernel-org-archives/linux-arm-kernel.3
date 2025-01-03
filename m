Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D61E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 02:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AP4om3HCUGPZiAgSFK/mDowrAQLBhJ1lEYaLjFS047A=; b=JrxtJmIZ7litl4wgzHJbdMPa3e
	tPK6lJeLCVWaU1IPjzBLycgWi9UnVMALOEaL82XsWmIRCzHgt9bsbEbIY2rxucfrMel7EBRtewGRO
	NS4HGczP7Cg2VocP8F3A2V5SySlcXG3DNoT+mnZy9Qu5/LLMWvIL62qUWd6bo95plaVM1v6G2HafO
	KqC0Ulw2iZTMcjQH//UbpfJSu2y1pcnIk+TozGJ8w8vDJuEOb7E+RAqoA2stZfqQgB8hGgEIAVG+u
	VTl7hFkC9Z7+XirXkCW3QiLEEFQ/tt1+b64HJjnbLddNw068gi1G+kf8wVbfES9n3xJj8RM2zBY83
	6s3I68Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTXge-0000000Bx8W-1d6O;
	Fri, 03 Jan 2025 02:45:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTXfU-0000000Bx17-2bsR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 02:44:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502G1G7g023410;
	Fri, 3 Jan 2025 02:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AP4om3HCUGPZiAgSFK/mDowrAQLBhJ1lEYaLjFS047A=; b=FjYFTgdzObI/HD/U
	DZ5eBX6ScnB0onG6AAEchyS67TpKiwtdrAsspIIbrbWMrY0lsHcBkxCGKO0eJn4e
	Fr6iz9xbvg3MWr4giz0qL6CFaWsJLnP1Y9hTku/QEDpl4nk4VOIIiURjpvTGnn6h
	o/ICd2EX0ltNqoxbAQ8enZL3mqk0v+XlHwanHrqEeMF0u8xjSiRf6+mu2/r4/JDz
	RuQ8eVpjuMvBasEdmLGZ8WVGi26zTWvUTqTqGnITtnOE6VROYQmLxK6dli+u9tXH
	TFwxSaufxuDv6qAiK1FYLQuTLVSj1WVVvBKuNnYaUDrRmxXp3xRqVPRbw2HLyxXM
	ayrwvQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wt3c9nb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 02:43:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5032hu6T026446
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 02:43:56 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 Jan 2025
 18:43:53 -0800
Message-ID: <abb6612b-8845-411b-bfc2-751538cb06b7@quicinc.com>
Date: Fri, 3 Jan 2025 10:43:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: mm: implement vmemmap_check_pmd for arm64
To: Catalin Marinas <catalin.marinas@arm.com>,
        Anshuman Khandual
	<anshuman.khandual@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-3-quic_zhenhuah@quicinc.com>
 <Z2W5Bs0bZANI6NKv@arm.com> <39a85800-47c5-4529-906d-5a40e58ce136@arm.com>
 <Z3bXIjJjEaoOaxbH@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <Z3bXIjJjEaoOaxbH@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HJ5FfEEDirT1_7c4V-vDR19wRnLVmHII
X-Proofpoint-ORIG-GUID: HJ5FfEEDirT1_7c4V-vDR19wRnLVmHII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxlogscore=710 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_184408_657795_46A059CE 
X-CRM114-Status: GOOD (  23.30  )
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



On 2025/1/3 2:12, Catalin Marinas wrote:
> On Fri, Dec 27, 2024 at 08:27:18AM +0530, Anshuman Khandual wrote:
>> On 12/21/24 00:05, Catalin Marinas wrote:
>>> On Mon, Dec 09, 2024 at 05:42:27PM +0800, Zhenhua Huang wrote:
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index fd59ee44960e..41c7978a92be 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -1169,7 +1169,8 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>>>>   				unsigned long addr, unsigned long next)
>>>>   {
>>>>   	vmemmap_verify((pte_t *)pmdp, node, addr, next);
>>>> -	return 1;
>>>> +
>>>> +	return pmd_sect(*pmdp);
>>
>> Please change this as pmd_sect(READ_ONCE(*pmdp)) instead.
>>
>>>>   }
>>>>   
>>>>   int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>>
>>> Don't we need this patch only if we implement the first one? Please fold
>>> it into the other patch.
>>
>> Seems like these patches might not be related.
>>
>> While creating huge page based vmemmap mapping during vmemmap_populate_hugepages(),
>> vmemmap_check_pmd() validates if a populated (i.e pmd_none) PMD already represents
>> a huge mapping and can be skipped there after.
>>
>> Current implementation for vmemmap_check_pmd() on arm64, unconditionally returns 1
>> thus asserting that the given populated PMD entry is a huge one indeed, which will
>> be the case unless something is wrong. vmemmap_verify() only ensures that the node
>> where the pfn is allocated from is local.
>>
>> int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>>                                  unsigned long addr, unsigned long next)
>> {
>>          vmemmap_verify((pte_t *)pmdp, node, addr, next);
>>          return 1;
>> }
>>
>> However it does not really check the entry to be a section mapping which it should.
>> Returning pmd_sect(READ_ONCE(*pmdp)) is the right thing, which should have been the
>> case from the beginning when vmemmap_check_pmd() was added. I guess because arm64's
>> original vmemmap_populate() checked only for vmemmap_verify() as well. So probably
>> this does not need a "Fixes: " tag.
> 
> I did not say the patch is wrong, only that it wouldn't be needed unless
> we have the other patch in this series. However, if we do apply the
> other patch, we definitely need this change, so keeping them together
> would make it easier to backport.

Hi Catalin,

Based on our current discussion on patchset #1, we will prohibit 
hugepages(vmemmap mapping) for all hotplugging sections...The flow:
vmemmap_populate
	vmemmap_populate_hugepages
		vmemmap_check_pmd

will *only* be called for non-early sections. Therefore, with patchset 
#1, I don't see the patch as essential.. Would it be acceptable if we do 
not backport this patch?  Anshuman's suggestion seems reasonable to me 
and I separated the patch out:
https://lore.kernel.org/lkml/20250102074047.674156-1-quic_zhenhuah@quicinc.com/

Please share your comments and correct me if I'm mistaken :)


> 


