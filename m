Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E5EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LK6g3SrM3wf80kTlvLYW2iCr64iThkszp8lpJMbFBWs=; b=iirzOdosaDTOYupyD27LZp8Ffr
	kuXiNUY6RGVZVYedPi4NJj0ESr1C6NZRmBHnbNRBREO6l48z/d/SA+8V36145VX8gR2vaD2syk2lT
	EWo4QRitiwwucsPH1T43gShsycBj0i0jkMDAHbVI0pn59DNUD0fl7Vhx4w2wtmbvvALBG2xsEn3XR
	LWgAbZGQXQD5gxYRqSn1OGjzhr8czvx3Z+BSkd4MhEFuxlkLQY1XYD8fwisxv2+lCKZ60OOfKxsDP
	CyxKXhtRlXm25Hwm5h1TexddOXz5+0/edFxyfxNs6FLBbOGHAk+yh/U4q5SM2D0Btay9Y74MkI+SN
	KxwX1uEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4Bo-00000003mOo-1b0o;
	Tue, 07 Jan 2025 07:39:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4AW-00000003mBX-2hhJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 07:38:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506Mv1cG022313;
	Tue, 7 Jan 2025 07:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LK6g3SrM3wf80kTlvLYW2iCr64iThkszp8lpJMbFBWs=; b=YIydElkEtQCdEOGu
	oC8MBaUMs8g4Kp1LD0uBVY6G6YyiLZsuMGA4e9JKWlaaml1gZzt52M6+NC4LrwqM
	+4H3G+GsEdWl4H3FTTZpgrSk/t5gnI34rHJIXekIXE+Iq3alZ8NWfiyMtLrLrU0F
	uwMiLgYj8wPz9bvSmeZqLp5YAUOaqesJwyDScSKFLLlrrApTQeCEMsjLRsZ4FH4F
	ejK3GWzwzzh5lGV7n0Ytky3HLuCxk1y/oNv+8gnrt/9mMLN8RisuN2ma+mkNKCQd
	NiDQXl8zUg0xMs3RI3gw3UUfboN0bI6fmE/DzsB0Eoi9P2tgEGzHXOzCl7ciQVpw
	yyVMVw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440rdq9105-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 07:38:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5077cEZ7018763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 07:38:14 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 23:38:10 -0800
Message-ID: <248221a5-5ff6-479a-ab23-96ce357d1b16@quicinc.com>
Date: Tue, 7 Jan 2025 15:38:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: mm: Populate vmemmap at the page level for
 hotplugged sections
To: Anshuman Khandual <anshuman.khandual@arm.com>, <catalin.marinas@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250103085002.27243-1-quic_zhenhuah@quicinc.com>
 <34dab81b-1b53-4ff0-89fd-2b5279a29942@arm.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <34dab81b-1b53-4ff0-89fd-2b5279a29942@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FapkS_o3CGVr_FVC8dDsOWxMP_5pT2_s
X-Proofpoint-GUID: FapkS_o3CGVr_FVC8dDsOWxMP_5pT2_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxlogscore=876 impostorscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_233828_794366_5ABD120F 
X-CRM114-Status: GOOD (  38.02  )
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

Thanks Anshuman for your detailed review!

On 2025/1/6 23:11, Anshuman Khandual wrote:
> Hello Zhenhua,
> 
> On 1/3/25 14:20, Zhenhua Huang wrote:
>> Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
>> vmemmap to populate at the PMD section level which was suitable
>> initially since hotplugging granule is always 128M. However,
> 
> A small nit s/hotplugging/hot plug/
> 
> Also please do mention that 128M is SECTION_SIZE_BITS == 27 on arm64
> platform for 4K base pages which is the page size in context here.
> 
> 
>> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>> which added 2M hotplugging granule disrupted the arm64 assumptions.
> 
> A small nit s/hotplugging/hot plug/
> 
> Also please do mention that 2M is SUB_SECTION_SIZE.
> 
>>
>> Considering the vmemmap_free -> unmap_hotplug_pmd_range path, when
>> pmd_sect() is true, the entire PMD section is cleared, even if there is
>> other effective subsection. For example pagemap1 and pagemap2 are part
>> of a single PMD entry and they are hot-added sequentially. Then pagemap1
>> is removed, vmemmap_free() will clear the entire PMD entry freeing the
>> struct page metadata for the whole section, even though pagemap2 is still
>> active.
> 
> I guess pagemap1/2 here indicates the struct pages virtual regions for two
> different vmemmap mapped sub sections covered via a single PMD entry ? But
> please do update the above paragraph appropriately because pagemap<N> might
> be confused with /proc/<pid>/pagemap mechanism.
> 
> Also please do mention that similar problems exist with linear mapping for
> 16K (PMD = 32M) and 64K (PMD = 512M) base pages as their block mappings
> exceed SUBSECTION_SIZE. Hence tearing down the entire PMD mapping too will
> leave other subsections unmapped in the linear mapping.

Make sense to me, will update comments.

> 
>>
>> To address the issue, we need to prevent PMD/PUD/CONT mappings for both
>> linear and vmemmap for non-boot sections if the size exceeds 2MB
> 
> s/if the size/if corresponding size on the given base page/
> 
>> (considering sub-section is 2MB). We only permit 2MB blocks in a 4KB page
>> configuration.
> 
> PMD block in 4K page size config as it's PMD_SIZE matches the SUBSECTION_SIZE
> but only for linear mapping.
> 
> 
>>
>> Cc: stable@vger.kernel.org # v5.4+
>> Fixes: ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
>> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
>> ---
>> Hi Catalin and Anshuman,
>> Based on your review comments, I concluded below patch and tested with my setup.
>> I have not folded patchset #2 since this patch seems to be enough for backporting..
>> Please see if you have further suggestions.
>>
>>   arch/arm64/mm/mmu.c | 33 +++++++++++++++++++++++++++++----
>>   1 file changed, 29 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index e2739b69e11b..2b4d23f01d85 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -42,9 +42,11 @@
>>   #include <asm/pgalloc.h>
>>   #include <asm/kfence.h>
>>   
>> -#define NO_BLOCK_MAPPINGS	BIT(0)
>> +#define NO_PMD_BLOCK_MAPPINGS	BIT(0)
>>   #define NO_CONT_MAPPINGS	BIT(1)
>>   #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>> +#define NO_PUD_BLOCK_MAPPINGS	BIT(3)  /* Hotplug case: do not want block mapping for PUD */
>> +#define NO_BLOCK_MAPPINGS (NO_PMD_BLOCK_MAPPINGS | NO_PUD_BLOCK_MAPPINGS)
> 
> 
> Should not NO_PMD_BLOCK_MAPPINGS and NO_PUD_BLOCK_MAPPINGS be adjacent bits
> for better readability ? But that will also cause some additional churn.

Agree, I see these macros are only used in this file, it's safe to update.

> 
>>   
>>   u64 kimage_voffset __ro_after_init;
>>   EXPORT_SYMBOL(kimage_voffset);
>> @@ -254,7 +256,7 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>   
>>   		/* try section mapping first */
>>   		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
>> -		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>> +		    (flags & NO_PMD_BLOCK_MAPPINGS) == 0) {
> 
> Behavior will remain unchanged for all existing users of NO_BLOCK_MAPPINGS
> as it will now contain NO_PMD_BLOCK_MAPPINGS.

Hmm... do you want me to include these in comments? The code appears to 
be clear as it is.

> 
>>   			pmd_set_huge(pmdp, phys, prot);
>>   
>>   			/*
>> @@ -356,10 +358,11 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>   
>>   		/*
>>   		 * For 4K granule only, attempt to put down a 1GB block
>> +		 * Hotplug case: do not attempt 1GB block
>>   		 */
>>   		if (pud_sect_supported() &&
>>   		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
>> -		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>> +		   (flags & NO_PUD_BLOCK_MAPPINGS) == 0) {
> 
> Behavior will remain unchanged for all existing users of NO_BLOCK_MAPPINGS
> as it will now contain NO_PUD_BLOCK_MAPPINGS.
> 

Ditto.

>>   			pud_set_huge(pudp, phys, prot);
>>   
>>   			/*
>> @@ -1175,9 +1178,16 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>>   int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>>   		struct vmem_altmap *altmap)
>>   {
>> +	unsigned long start_pfn;
>> +	struct mem_section *ms;
>> +
>>   	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
>>   
>> -	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>> +	start_pfn = page_to_pfn((struct page *)start);
>> +	ms = __pfn_to_section(start_pfn);
>> +
>> +	/* Hotplugged section not support hugepages */
> 
> Please update the comment as
> 
> 	/*
> 	 * Hotplugged section does not support hugepages as
> 	 * PMD_SIZE (hence PUD_SIZE) section mapping covers
> 	 * struct page range that exceeds a SUBSECTION_SIZE
> 	 * i.e 2MB - for all available base page sizes.
> 	 */
> 
>> +	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) || !early_section(ms))
>>   		return vmemmap_populate_basepages(start, end, node, altmap);
>>   	else
>>   		return vmemmap_populate_hugepages(start, end, node, altmap);
>> @@ -1339,9 +1349,24 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>   		    struct mhp_params *params)
>>   {
>>   	int ret, flags = NO_EXEC_MAPPINGS;
>> +	unsigned long start_pfn = page_to_pfn((struct page *)start);
>> +	struct mem_section *ms = __pfn_to_section(start_pfn);
>>   
>>   	VM_BUG_ON(!mhp_range_allowed(start, size, true));
>>   
>> +	/* Should not be invoked by early section */
>> +	WARN_ON(early_section(ms));
>> +
>> +	if (IS_ENABLED(CONFIG_ARM64_4K_PAGES))
>> +	/*
>> +	 * As per subsection granule is 2M, allow PMD block mapping in
>> +	 * case 4K PAGES.
>> +	 * Other cases forbid section mapping.
>> +	 */
> 
> IIUC subsection size is 2M regardless of the page size. But with 4K pages
> on arm64, PMD_SIZE happen to be 2M. Hence there is no problem in creating
> linear mappings at PMD block level, which will not be the case with other
> page sizes i.e 16K and 64K.

Yes.

> 
> include/linux/mmzone.h
> 
> #define SUBSECTION_SHIFT 21
> #define SUBSECTION_SIZE (1UL << SUBSECTION_SHIFT)
> 
> Please update the comment with following changes but above IS_ENABLED()
> statement as it talks about all page size configs.
> 
> 	/*
> 	 * 4K base page's PMD_SIZE matches SUBSECTION_SIZE i.e 2MB. Hence
> 	 * PMD section mapping can be allowed, but only for 4K base pages.
> 	 * Where as PMD_SIZE (hence PUD_SIZE) for other page sizes exceed
> 	 * SUBSECTION_SIZE.
> 	 */

Nice comments! Thanks.

>> +		flags |= NO_PUD_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>> +	else
>> +		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>> +
>>   	if (can_set_direct_map())
>>   		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>   
> 


