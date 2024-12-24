Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BF9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSzybrggNwrD0muhoDeAaALXRNLxAXwY1HcYgMxZpgQ=; b=qutgvSoXywQTsAtJ8/M5yN5sBt
	ig0TocHN6k5cKDkTSr1V2FHWNiodJNApEeWnuSGjwIxRKx/racV9KsbX+6xwyDLc9H2ViRV2bDyy+
	mzYn4ZNCzUUT39Lpi4eiSI22/9ix34763sndXMA51NUppUHWDyJ/tFAVsCr2eckp8HMR/RohLAu1Z
	ampWWcwIbCObmpe2i4dWuG2auA8LW7YK8Caj3oQpsc4n7dfVc0YcXcqySrpLx2leXLN5QDhQ8d2UX
	qfRn8QbaRvkQQks2aOZnQhNV4Mtv33kdrgxwGKRl+YaxpRz3EcUKf4TOJ+8odgrC2c37EUV4sKakO
	x9leBksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1IT-0000000BbLr-3de9;
	Tue, 24 Dec 2024 09:33:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1HI-0000000BbEb-0yNj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 09:32:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO4SxfN002261;
	Tue, 24 Dec 2024 09:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSzybrggNwrD0muhoDeAaALXRNLxAXwY1HcYgMxZpgQ=; b=i/LmxcBiZX9E5c4k
	31ObZMnyjggFGRIpMq2UTnmNrmjA9cx/8rS+00FrOHbtpPuSZhEo2ujkXSi6QGGs
	HOqtaR19dQO52lZiMXmJQLpVgUtos7j4t93EzYg3wTDFbQhhYm0lX5h+hSAvjZVM
	ce1xLn7LPLcx5STwY6CfQgmTnGYeLLPDbpkLhS1fONks3s4lkk90mDPRpvcelQVm
	emMPneovWhKqbdwb7SMjabeqrzuf0TCrberqjh0XLKBHUZ8Tu13SnrRDJjKW6VEZ
	qKrw2zjSL8ojtp4Nt+qEikJ5o7By2+XkA1SWfOdekFb1OsgkslS/ibB6icUS8EDY
	nnfUjw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qnxxhen2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 09:32:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO9WJdC002406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 09:32:19 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Dec
 2024 01:32:15 -0800
Message-ID: <a720aaa5-a75e-481e-b396-a5f2b50ed362@quicinc.com>
Date: Tue, 24 Dec 2024 17:32:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: mm: vmemmap populate to page level if not
 section aligned
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-2-quic_zhenhuah@quicinc.com>
 <Z2W3qA7wbBTaq6DQ@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <Z2W3qA7wbBTaq6DQ@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O7PLlt8eRTbftGhlWNaCCkecApruOGiw
X-Proofpoint-ORIG-GUID: O7PLlt8eRTbftGhlWNaCCkecApruOGiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412240080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_013236_389619_84558ED8 
X-CRM114-Status: GOOD (  30.36  )
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

Thanks Catalin for review!
Merry Christmas.

On 2024/12/21 2:30, Catalin Marinas wrote:
> On Mon, Dec 09, 2024 at 05:42:26PM +0800, Zhenhua Huang wrote:
>> Commit c1cc1552616d ("arm64: MMU initialisation")
>> optimizes the vmemmap to populate at the PMD section level. However, if
>> start or end is not aligned to a section boundary, such as when a
>> subsection is hot added, populating the entire section is wasteful. For
>> instance, if only one subsection hot-added, the entire section's struct
>> page metadata will still be populated.In such cases, it is more effective
>> to populate at page granularity.
> 
> OK, so from the vmemmap perspective, we waste up to 2MB memory that has
> been allocated even if a 2MB hot-plugged subsection required only 32KB
> of struct page. I don't mind this much really. I hope all those
> subsections are not scattered around to amplify this waste.
> 
>> This change also addresses mismatch issues during vmemmap_free(): When
>> pmd_sect() is true, the entire PMD section is cleared, even if there is
>> other effective subsection. For example, pagemap1 and pagemap2 are part
>> of a single PMD entry and they are hot-added sequentially. Then pagemap1
>> is removed, vmemmap_free() will clear the entire PMD entry, freeing the
>> struct page metadata for the whole section, even though pagemap2 is still
>> active.
> 
> I think that's the bigger issue. We can't unplug a subsection only.
> Looking at unmap_hotplug_pmd_range(), it frees a 2MB vmemmap section but
> that may hold struct page for the equivalent of 128MB of memory. So any
> struct page accesses for the other subsections will fault.

Exactly! That's what the patch aims to address.

> 
>> Fixes: c1cc1552616d ("arm64: MMU initialisation")
> 
> I wouldn't add a fix for the first commit adding arm64 support, we did
> not even have memory hotplug at the time (added later in 5.7 by commit
> bbd6ec605c0f ("arm64/mm: Enable memory hot remove")). IIUC, this hasn't
> been a problem until commit ba72b4c8cf60 ("mm/sparsemem: support
> sub-section hotplug"). That commit broke some arm64 assumptions.

Shall we add ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug") 
because it broke arm64 assumptions ?

> 
>> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
>> ---
>>   arch/arm64/mm/mmu.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index e2739b69e11b..fd59ee44960e 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1177,7 +1177,9 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>   {
>>   	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>   
>> -	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>> +	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
>> +	!IS_ALIGNED(page_to_pfn((struct page *)start), PAGES_PER_SECTION) ||
>> +	!IS_ALIGNED(page_to_pfn((struct page *)end), PAGES_PER_SECTION))
>>   		return vmemmap_populate_basepages(start, end, node, altmap);
>>   	else
>>   		return vmemmap_populate_hugepages(start, end, node, altmap);
> 
> An alternative would be to fix unmap_hotplug_pmd_range() etc. to avoid
> nuking the whole vmemmap pmd section if it's not empty. Not sure how
> easy that is, whether we have the necessary information (I haven't
> looked in detail).
> 
> A potential issue - can we hotplug 128MB of RAM and only unplug 2MB? If
> that's possible, the problem isn't solved by this patch.

Indeed, seems there is no guarantee that plug size must be equal to 
unplug size...

I have two ideas:
1. Completely disable this PMD mapping optimization since there is no 
guarantee we must align 128M memory for hotplug ..

2. If we want to take this optimization.
I propose adding one argument to vmemmap_free to indicate if the entire 
section is freed(based on subsection map). Vmemmap_free is a common 
function and might affect other architectures... The process would be:
vmemmap_free
	unmap_hotplug_range //In unmap_hotplug_pmd_range() as you mentioned：if 
whole section is freed, proceed as usual. Otherwise, *just clear out 
struct page content but do not free*.
	free_empty_tables // will be called only if entire section is freed

On the populate side,
else if (vmemmap_check_pmd(pmd, node, addr, next)) //implement this function
	continue;	//Buffer still exists, just abort..

Could you please comment further whether #2 is feasible ?

> 


