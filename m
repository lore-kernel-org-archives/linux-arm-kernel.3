Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7DCE7718E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 02:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJmZU4+9X9Eyx6SHrXnM4pFDoTIxCya9jlk41UP2guo=; b=s4Ket7d0CeFyh9Cg94yL57CMRE
	ze6cOuxEqfv3ivOMABbJahuxmjZOi34fpDn5nS96p8J4oCnshkpywZ/xokJIHa44YwVcWXo34qf5a
	9E/Qt8PN350kB371HaWJGP6RZxIBLxrSqWrL7cxxumicg47ITo4SXVQ7yBGeNU8n0m/2Kt8Z9IqVH
	H9A6nybyi7r0/IDoqaa1Ip5GpqRQBhKnh4hoYr4jVyG256AJndOZwdBk7q8XMg/C/fHHgbUASE7hh
	nvlyr4TtxNZYlrXgVU78RXturrmRmzfesAXqOlOyH0u0nysF73IA0Klw0w+AHJcZSdqYZf3RKKg6a
	EwbVZKjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR0Yk-0000000Gulz-0jGq;
	Fri, 27 Dec 2024 02:58:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR0XY-0000000GugG-0H46
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 02:57:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB6C71480;
	Thu, 26 Dec 2024 18:57:52 -0800 (PST)
Received: from [10.162.16.95] (a077893.blr.arm.com [10.162.16.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B2BA3F59E;
	Thu, 26 Dec 2024 18:57:20 -0800 (PST)
Message-ID: <39a85800-47c5-4529-906d-5a40e58ce136@arm.com>
Date: Fri, 27 Dec 2024 08:27:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: mm: implement vmemmap_check_pmd for arm64
To: Catalin Marinas <catalin.marinas@arm.com>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, joey.gouly@arm.com, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, chenfeiyang@loongson.cn, chenhuacai@kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
 <20241209094227.1529977-3-quic_zhenhuah@quicinc.com>
 <Z2W5Bs0bZANI6NKv@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z2W5Bs0bZANI6NKv@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_185728_159996_188AB904 
X-CRM114-Status: GOOD (  16.72  )
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



On 12/21/24 00:05, Catalin Marinas wrote:
> On Mon, Dec 09, 2024 at 05:42:27PM +0800, Zhenhua Huang wrote:
>> vmemmap_check_pmd() is used to determine if needs to populate to base
>> pages. Implement it for arm64 arch.
>>
>> Fixes: 2045a3b8911b ("mm/sparse-vmemmap: generalise vmemmap_populate_hugepages()")
>> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
>> ---
>>  arch/arm64/mm/mmu.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index fd59ee44960e..41c7978a92be 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1169,7 +1169,8 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>>  				unsigned long addr, unsigned long next)
>>  {
>>  	vmemmap_verify((pte_t *)pmdp, node, addr, next);
>> -	return 1;
>> +
>> +	return pmd_sect(*pmdp);

Please change this as pmd_sect(READ_ONCE(*pmdp)) instead.

>>  }
>>  
>>  int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
> 
> Don't we need this patch only if we implement the first one? Please fold
> it into the other patch.

Seems like these patches might not be related.

While creating huge page based vmemmap mapping during vmemmap_populate_hugepages(),
vmemmap_check_pmd() validates if a populated (i.e pmd_none) PMD already represents
a huge mapping and can be skipped there after.

Current implementation for vmemmap_check_pmd() on arm64, unconditionally returns 1
thus asserting that the given populated PMD entry is a huge one indeed, which will
be the case unless something is wrong. vmemmap_verify() only ensures that the node
where the pfn is allocated from is local.

int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
                                unsigned long addr, unsigned long next)
{
        vmemmap_verify((pte_t *)pmdp, node, addr, next);
        return 1;
}

However it does not really check the entry to be a section mapping which it should.
Returning pmd_sect(READ_ONCE(*pmdp)) is the right thing, which should have been the
case from the beginning when vmemmap_check_pmd() was added. I guess because arm64's
original vmemmap_populate() checked only for vmemmap_verify() as well. So probably
this does not need a "Fixes: " tag.

