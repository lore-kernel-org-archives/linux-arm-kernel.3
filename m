Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDB6C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLqAjRZDHiPs2P6vow4biMhYvSqfTYsVglK1DeDbMm0=; b=qR7T4H4c6ZUpJIJc9hMNyfWbYu
	ATHte4a5Nb6e653Ln8NgfLD4tqf2SpvZk4iMUeKGTl23UrdXP7UAtpihO5gYJ2t/rEvZ26TMDng4v
	54KwTkmSMzOOE/BC+5+4QSWU7Q2QC77PoH3V+tjNpIcnIvN5YrN7AwTZ2RxvPg9HIVxICS94uLzLh
	+SUxc3P5G9aK6+U9k8tRpG+pioMzD4qZlDQJz3Rkwhu75VBKBVANT+3y1QWJ4xRf7LI8WXDhxfAl9
	6TNe8RRZLUpnT6W2UfjzoFuJj/Un/ZkrHioX7jIRaxN8sWPDQz5+AqqDKgVH4TZdR3jOr42xyq0vp
	Skz/W2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9guD-000000093kZ-2If3;
	Tue, 29 Apr 2025 09:05:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gqI-000000092zf-1UZO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 09:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lLqAjRZDHiPs2P6vow4biMhYvSqfTYsVglK1DeDbMm0=; b=DVYkunCgkrZfWlsdhjOfZ5E8jO
	IkthDJoICYoTjEv9Y/wHo3LYubzmG0DVZZsE4YeVIyVwQ7CSRTv9ABxZGYYf5BkxNS4STX/rMFLKu
	vsV5psQRuPsT4HGUndYDLDHckHQjFLzs0nYDREX4ulLV/OA3rKNUYkzp+XZvclQesdivr8s+KAzKP
	0tgGtpdS8UNxZ3CgHvuKV55d0JxC1IW8TtLvFBYb7IhK3C+AfxzsU6/giQ9T7zJ9aHZ+F2/vS27lS
	Kd8DbfXMxfkhB1wdoy6TFrpygS45iWWMUO1CgEzky902qAEIG8GskFWKgLi0B3Edofpim0vuQuHH5
	jskdmS5w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9gqE-0000000DEXu-47zI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 09:01:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E601F1516;
	Tue, 29 Apr 2025 02:01:18 -0700 (PDT)
Received: from [10.163.78.253] (unknown [10.163.78.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C0A53F673;
	Tue, 29 Apr 2025 02:01:15 -0700 (PDT)
Message-ID: <d4516c2c-2468-43c7-a270-d068392460e5@arm.com>
Date: Tue, 29 Apr 2025 14:31:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
To: Anshuman Khandual <anshuman.khandual@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
 ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
 <93411699-2e36-4a4e-bc3a-3efeb8e2260b@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <93411699-2e36-4a4e-bc3a-3efeb8e2260b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_100127_525863_788FEC81 
X-CRM114-Status: GOOD (  16.90  )
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



On 29/04/25 2:09 pm, Anshuman Khandual wrote:
> 
> 
> On 4/29/25 10:53, Dev Jain wrote:
>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>> Architecture can override these helpers.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..ed287289335f 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
>>   }
>>   #endif
>>   
>> +/* See the comment for ptep_modify_prot_start */
>> +#ifndef modify_prot_start_ptes
>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t *ptep, unsigned int nr)
>> +{
>> +	pte_t pte, tmp_pte;
>> +
>> +	pte = ptep_modify_prot_start(vma, addr, ptep);
>> +	while (--nr) {
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>> +		if (pte_dirty(tmp_pte))
>> +			pte = pte_mkdirty(pte);
>> +		if (pte_young(tmp_pte))
>> +			pte = pte_mkyoung(pte);
>> +	}
>> +	return pte;
>> +}
>> +#endif
>> +
>> +/* See the comment for ptep_modify_prot_commit */
>> +#ifndef modify_prot_commit_ptes
>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
>> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
>> +{
>> +	for (;;) {
>> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>> +		if (--nr == 0)
>> +			break;
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		old_pte = pte_next_pfn(old_pte);
>> +		pte = pte_next_pfn(pte);
>> +	}
>> +}
>> +#endif
> 
> Is there any particular reason why the first loop here is while { }
> based where as the second one is a for { } loop ?

modify_prot_start_ptes follows the pattern of get_and_clear_full_ptes. 
modify_prot_commit_ptes follows the pattern of wrprotect_ptes.

> 
>> +
>>   /*
>>    * On some architectures hardware does not set page access bit when accessing
>>    * memory page, it is responsibility of software setting this bit. It brings
> 
> These helpers should be added with at least a single caller using them.


