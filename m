Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E15BFC9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 02:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUiYVvq51PhsvRNPGgaHEtOWm+s6zhtlXs4s+mHmblo=; b=MXLkxrXVuo604ia1uN8rqzqxbj
	DxpES06Ay5aKMj936ZBC1O+H0JBl1SKz82oEFphuNzw0TNjvBddwv+dRwgzP+j9YuWmvbYBFjQaAf
	P39STV+X1CDBn3FqxtlrHpPK/5eHLdVsAYEXPKkdmHmznUrIGWaRpchEQrYwJFij78qgpFHbVP+Ui
	wqD2WbpTyCufLvq0x4txPESUqckFy7sVr1kbpwYX1/D5bj6MKbC2vCZnBt9yN0mYDkM0gdu/4O8h4
	79pxALqLpFEsgLYi5Bpp+J8etDkyMIlDfM3v9fXZtL0Tq0/8EJvTJuW4ixp408aysMy9m2hqXgIGG
	Vo29MApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyhBn-00000004niB-12oK;
	Sat, 07 Mar 2026 02:14:47 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyhBj-00000004nhX-3nIy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 02:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772849678; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=TUiYVvq51PhsvRNPGgaHEtOWm+s6zhtlXs4s+mHmblo=;
	b=sjXrtasH3Q4uvgaPP0lHqW1MeM1ULuAG9Bi0sEqxF0TJ55Z+ui3FGmzEDjAoUuwkN8sbXrwByFd3gT6M/0+HhtCHcyKJm5y0G0HBz2/TF9ip8aB1cIuvvJU5FDnpnknXlGhGjQ4z/Y8P1esPNqoVjrlzDqE4+EHQd8KMxjM1AoU=
Received: from 30.42.98.36(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-Ob2yS_1772849674 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Mar 2026 10:14:35 +0800
Message-ID: <721abb6a-93a0-4db3-9e69-ef23b253e4f5@linux.alibaba.com>
Date: Sat, 7 Mar 2026 10:14:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: mm: implement the architecture-specific
 clear_flush_young_ptes()
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
 <ce749fbae3e900e733fa104a16fcb3ca9fe4f9bd.1770645603.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wA-bpCaY8uLnwmzDT40s4RbsOXdRutvj5bZU+Em6cFeg@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4wA-bpCaY8uLnwmzDT40s4RbsOXdRutvj5bZU+Em6cFeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_181444_656077_07AB67F5 
X-CRM114-Status: GOOD (  16.65  )
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



On 3/7/26 5:20 AM, Barry Song wrote:
> On Mon, Feb 9, 2026 at 10:07 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> Implement the Arm64 architecture-specific clear_flush_young_ptes() to enable
>> batched checking of young flags and TLB flushing, improving performance during
>> large folio reclamation.
>>
>> Performance testing:
>> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and try to
>> reclaim 8G file-backed folios via the memory.reclaim interface. I can observe
>> 33% performance improvement on my Arm64 32-core server (and 10%+ improvement
>> on my X86 machine). Meanwhile, the hotspot folio_check_references() dropped
>> from approximately 35% to around 5%.
>>
>> W/o patchset:
>> real    0m1.518s
>> user    0m0.000s
>> sys     0m1.518s
>>
>> W/ patchset:
>> real    0m1.018s
>> user    0m0.000s
>> sys     0m1.018s
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> Reviewed-by: Barry Song <baohua@kernel.org>

Thanks Barry. But this series has been upstreamed, I can not add your 
reviewed tag.

> 
>> ---
>>   arch/arm64/include/asm/pgtable.h | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 3dabf5ea17fa..a17eb8a76788 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1838,6 +1838,17 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>>          return contpte_clear_flush_young_ptes(vma, addr, ptep, 1);
>>   }
>>
>> +#define clear_flush_young_ptes clear_flush_young_ptes
>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>> +                                        unsigned long addr, pte_t *ptep,
>> +                                        unsigned int nr)
>> +{
>> +       if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))
>> +               return __ptep_clear_flush_young(vma, addr, ptep);
>> +
>> +       return contpte_clear_flush_young_ptes(vma, addr, ptep, nr);
>> +}
> 
> A similar question arises here:
> 
> If nr = 4 for 16KB large folios and one of those entries is young,
> we end up flushing the TLB for all 4 PTEs.
> 
> If all four entries are young, we win; if only one is young, it seems
> we flush 3 redundant pages. but arm64 has TLB coalescing, so
> maybe they are just one TLB?

We discussed a similar issue in the previous thread [1], and I quote 
some comments from Ryan:

"
My concern was the opportunity cost of evicting the entries for all the
non-accessed parts of the folio from the TLB. But of course, I'm talking
nonsense because the architecture does not allow caching non-accessed 
entries in the TLB.
"

[1] 
https://lore.kernel.org/all/02239ca7-9701-4bfa-af0f-dcf0d05a3e89@linux.alibaba.com/


