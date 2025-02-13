Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3499C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nbm7pMR3sppbaW6MivVssSNUZKFF+Yg1bC2W6Ym5u8c=; b=ci7gekKdz0gJGq6wcHdSVhtYxP
	vtzv0z0f34Xnotjt8bDYTGZeJ0dS1ZlBnh3KF0QJrRw6s2m5Cz5bAtd4cJUuo7rv/dYZgeyAVxnRK
	1dS4Ak1/oDyBuAqQlxNAz2CNavEn6NXCkMNCtqQBw2PCKhbZdWp9AOmiXWGz8/+p9ZjfWIo1x75Mc
	hdupGIhzB+BLNYgjNsqRDebb1wThjYT5bAV+2F+n09vMtVjgVrIGm1h9AIguvStiq/l+Yd0sLA/oH
	vRUEsULcY5x9JsSUnC8exmhTi2/8AHJTjhhSe1qfyKs3pUhax4bY9RHMkO0ZhI9RJON9tONYhMshq
	BvvFTDQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTwp-0000000A9CW-2bus;
	Thu, 13 Feb 2025 07:47:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTvN-0000000A8tO-3JgO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:46:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CIlBdn001335;
	Thu, 13 Feb 2025 07:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nbm7pMR3sppbaW6MivVssSNUZKFF+Yg1bC2W6Ym5u8c=; b=Lw3o8WtttHYwMIEc
	eR0749HKN1mOosx+2n65ajRX7+SP0M0JS2mS/1SJwCP+new4pXVbgyw0nTJTBUYO
	84VvFZJlwnCUvLu3G5Q8WMto3pqD7i+H3d3i/Uf3uHO/rSzH2jf2DsOtx60aBD0s
	HgccnCr17KQfSNC7KhXrDYwTUgwjbcYflXram8et1Y0WQDztJMRMdejbP5yVnDMz
	OCA/AoOTJxjR03WIwARwKvZIOWJGez63NoEF9+rUrgoWRvAAoq3aLs3UpPXV4L6P
	qgXa0g8/dNE8mY/ROf8AiKMFkuGq8gW7/cww/4EL5ZXC7U9is2qFdwAYc+OR2udu
	NdbUgw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rrnfu322-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 07:46:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D7k1nO029626
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 07:46:01 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 23:45:57 -0800
Message-ID: <dc69cc0e-c3ca-4e2a-8d0e-998643f31ccf@quicinc.com>
Date: Thu, 13 Feb 2025 15:45:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <anshuman.khandual@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
        <ryan.roberts@arm.com>, <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250109093824.452925-1-quic_zhenhuah@quicinc.com>
 <Z6zoWMejCDlN2YF9@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <Z6zoWMejCDlN2YF9@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oD5n2ERUG7vEUbsd4pslOiDQ1za_FgFG
X-Proofpoint-ORIG-GUID: oD5n2ERUG7vEUbsd4pslOiDQ1za_FgFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=859 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_234617_959318_A33AC7E5 
X-CRM114-Status: GOOD (  17.48  )
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



On 2025/2/13 2:28, Catalin Marinas wrote:
>> @@ -1339,9 +1349,27 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>   		    struct mhp_params *params)
>>   {
>>   	int ret, flags = NO_EXEC_MAPPINGS;
>> +	unsigned long start_pfn = PFN_DOWN(start);
>> +	struct mem_section *ms = __pfn_to_section(start_pfn);
>>   
>>   	VM_BUG_ON(!mhp_range_allowed(start, size, true));
>>   
>> +	/* should not be invoked by early section */
>> +	WARN_ON(early_section(ms));
> I don't remember the discussion, do we still need this warning here if
> the sections are not marked as early? I guess we can keep it if one does
> an arch_add_memory() on an early section.
> 
> I think I suggested to use a WARN_ON_ONCE(!present_section()) but I
> completely forgot the memory hotplug code paths.

Dear Catalin,

The previous discussion can be found at 
https://lore.kernel.org/lkml/aedbbc4f-8f6c-46d8-a8d7-53103675a816@quicinc.com/, 
I highlighted the key points from conversation between me and Anshuman 
for your reference:
"
 >>
 >> BTW, shall we remove the check for !early_section since 
arch_add_memory is only called during hotplugging case? Correct me 
please if I'm mistaken :)
 >
 > While this is true, still might be a good idea to keep the 
early_section()
 > check in place just to be extra careful here. Otherwise an WARN_ON() 
might
 > be needed.

Make sense. I would like to add some comments and WARN_ON() if
early_section().
"
Regarding your suggestion, I believed it was intended for the 
vmemmap_populate() function ?(Discussion: 
https://lore.kernel.org/linux-mm/Z3_d59kp4CuHQp97@arm.com/), but as 
workflow below indicates:
Hot plug:
1. section_activate -> vmemmap_populate
2. mark PRESENT

In contrast, the early flow:
1. memblocks_present -> mark PRESENT
2. __populate_section_memmap -> vmemmap_populate

Could this result in a false warning during hotplugging? I replied with 
the doubt in above link before but seems you missed :) Could you please 
share your thoughts if you have a different idea ?

I will include your tags, correct capitalization nit and post one new 
version.

