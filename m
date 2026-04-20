Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A3FF5581D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9DayyiGCs7J5S4uoemxf+H1vRd9DRT+SAr6sjgTgzo=; b=E6xy0fs5hKBrlRq/wQBzqt4Wev
	sEdV9e+SrXFhG25UDulRfKZx5D5gdD+zFtbq06r1RhdtttrF5awSVddGXpbTZ9wJAwqVN2sz7s3Gz
	6mAx3wTynFgUdBkosvl4tNZGXkjswBA9oMd2sq8nl0mXb6Gk+Ky5QKUUkbutVrn0sLNd9gIQIT87g
	Qby1WeKqYWXLZTviyiIC6pX+BhjXouJasYrwhqHhryNxgGr4u4gE79b3llqAPBSEUGJQAtKSfaG24
	JnTcEfIdkhZX46zD93eNXvjHVvPm8goumSazKcxBsiAg8VsmkPgtZYbLSDgUg1y1FK7bez3Kp6ZrI
	5c71pSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEn2d-00000006oId-2qDo;
	Mon, 20 Apr 2026 11:43:51 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEn2a-00000006oHC-3F9I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 11:43:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=A9DayyiGCs7J5S4uoemxf+H1vRd9DRT+SAr6sjgTgzo=;
	b=r8etD1aG+Mc7JjIr4DZoc+k7bzpFfJnAXZ85nO514eN8BXYo5noW3gM83UgYjqWHyDRfs7ebD
	0kEmWu+ahgPRPlCGy/at6tBU6Mc6RyE2mSAVExXGFPe5vWknmlZGE4h63mAgE0fR/tsMLaialxw
	6r+vbgF/46AoS+hYJ+H4nCM=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fzk3p6tkxzLlYX;
	Mon, 20 Apr 2026 19:37:10 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id A1F0D40573;
	Mon, 20 Apr 2026 19:43:31 +0800 (CST)
Received: from [10.174.179.248] (10.174.179.248) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Apr 2026 19:43:29 +0800
Message-ID: <b46b82b7-a99d-49b0-8d4d-1a3f788489ca@huawei.com>
Date: Mon, 20 Apr 2026 19:43:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/4] mm/pgtable: Make pfn_pte() filter out huge
 page attributes
To: Will Deacon <will@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <willy@infradead.org>,
	<david@kernel.org>, <catalin.marinas@arm.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <luto@kernel.org>, <peterz@infradead.org>,
	<akpm@linux-foundation.org>, <lorenzo.stoakes@oracle.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <Liam.Howlett@oracle.com>,
	<npache@redhat.com>, <ryan.roberts@arm.com>, <dev.jain@arm.com>,
	<baohua@kernel.org>, <lance.yang@linux.dev>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<anshuman.khandual@arm.com>, <rmclure@linux.ibm.com>,
	<kevin.brodsky@arm.com>, <apopple@nvidia.com>, <ajd@linux.ibm.com>,
	<pasha.tatashin@soleen.com>, <bhe@redhat.com>, <thuth@redhat.com>,
	<coxu@redhat.com>, <dan.j.williams@intel.com>, <yu-cheng.yu@intel.com>,
	<yangyicong@hisilicon.com>, <baolu.lu@linux.intel.com>, <jgross@suse.com>,
	<conor.dooley@microchip.com>, <Jonathan.Cameron@huawei.com>,
	<riel@surriel.com>, <wangkefeng.wang@huawei.com>, <chenjun102@huawei.com>
References: <20260228070906.1418911-1-yintirui@huawei.com>
 <20260228070906.1418911-3-yintirui@huawei.com>
 <aeXoY7lrRJev0P83@willie-the-truck>
From: Yin Tirui <yintirui@huawei.com>
In-Reply-To: <aeXoY7lrRJev0P83@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.248]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_044349_423426_A2CF1527 
X-CRM114-Status: GOOD (  13.58  )
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

Hi Will,

On 4/20/2026 4:48 PM, Will Deacon wrote:
> On Sat, Feb 28, 2026 at 03:09:04PM +0800, Yin Tirui wrote:
>> A fundamental principle of page table type safety is that `pte_t` represents
>> the lowest level page table entry and should never carry huge page attributes.
>>
>> Currently, passing a pgprot with huge page bits (e.g., extracted via
>> pmd_pgprot()) into pfn_pte() creates a malformed PTE that retains the huge
>> attribute, leading to the necessity of the ugly `pte_clrhuge()` anti-pattern.
>>
>> Enforce type safety by making `pfn_pte()` inherently filter out huge page
>> attributes:
>> - On x86: Strip the `_PAGE_PSE` bit.
>> - On ARM64: Mask out the block descriptor bits in `PTE_TYPE_MASK` and
>>    enforce the `PTE_TYPE_PAGE` format.
>> - On RISC-V: No changes required, as RISC-V leaf PMDs and PTEs share the
>>    exact same hardware format and do not use a distinct huge bit.
>>
>> Signed-off-by: Yin Tirui <yintirui@huawei.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h | 4 +++-
>>   arch/x86/include/asm/pgtable.h   | 4 ++++
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index b3e58735c49b..f2a7a40106d2 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -141,7 +141,9 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>>   
>>   #define pte_pfn(pte)		(__pte_to_phys(pte) >> PAGE_SHIFT)
>>   #define pfn_pte(pfn,prot)	\
>> -	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
>> +	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | \
>> +		((pgprot_val(prot) & ~(PTE_TYPE_MASK & ~PTE_VALID)) | \
>> +		(PTE_TYPE_PAGE & ~PTE_VALID)))
> Why are you touching arch/arm64? We don't implement pte_clrhuge() afaict.
> What does this actually fix?

Originally, this patch aimed to ensure that pfn_pte() always returns a 
PTE without any

huge page attributes by embedding the logic of pte_clrhuge() directly 
into pfn_pte().


However, we found this approach doesn't work well on x86, so we've 
abandoned this design.


Following Matthew Wilcox's suggestion, the current approach is instead 
to have pmd_pgprot()

return a 4K–formatted pgprot_t (i.e., without huge page attributes), and 
then explicitly add the

huge page attributes when constructing a PMD via pfn_pmd().


I've already implemented this in my recent commit:

https://github.com/torvalds/linux/commit/5b8ce6d33822dd7776432e03a08fe6d2dedac079


>
> Will

-- 
Yin Tirui


