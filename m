Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4432AE94626
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 00:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLzFv/iaTtm6O5tzZ+GpAratMNjp1TNVZjLH5IvnkwY=; b=MIg8LB7ipzN0eknm3ehb+gq8s/
	SQv3pfduPxAtEkj4R/zT5q3uilBKj26HldXBTl+9pO1VU/dmHRJ4Tku+5RJXWkgYJh0pYxRFGwm3S
	NeBsOZfQ7nKsse1Usn0Iq2UQA6y070ur+b3Fc4unkjZ64sMHh72JT+aRe0fSU3eUSZPk1MvwZrrKh
	hV56mXYCcSsHl8YlMhaGXO1IPmkKXDba12e0TWssyUMlYyo2CjQxtQoLW8rectxuG6tNPZ+/GVCnc
	tne5Ix4IyWy5IIY2tbVLLG6imyOvb/oZbvlNSRNOVVi7+t0sm+/zftjYudHh9sIFkZyBaweep9aYF
	gOf6I1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpbnA-0000000GEfS-3CYg;
	Tue, 10 Feb 2026 00:39:48 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpbn5-0000000GEeQ-0g2f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 00:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770683978; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=qLzFv/iaTtm6O5tzZ+GpAratMNjp1TNVZjLH5IvnkwY=;
	b=xkkAwuUOCWb0HtaYj3FZjc+9UyDITjc7u0w4eY++55f2XfizR6Kg63lKeuRRjCRJwtCxJbQRpjceV3zuyar8WU93SrAlZqargE0Y4xmoCTpwtuIU4jHdNAK3KZbCdPbqKybWHHfVmpf2K/rk2No8nagPBTLbEBnTIaLvkFy7WJQ=
Received: from 30.74.144.109(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wyx2lhG_1770683976 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Feb 2026 08:39:36 +0800
Message-ID: <48e27f5e-d47a-4d53-bc64-6c6a22db9180@linux.alibaba.com>
Date: Tue, 10 Feb 2026 08:39:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: mm: implement the architecture-specific
 clear_flush_young_ptes()
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
 <ce749fbae3e900e733fa104a16fcb3ca9fe4f9bd.1770645603.git.baolin.wang@linux.alibaba.com>
 <10f061c9-5c9a-4e8a-8790-a2a68b38ff33@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <10f061c9-5c9a-4e8a-8790-a2a68b38ff33@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_163944_354995_DE7769D1 
X-CRM114-Status: GOOD (  12.37  )
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



On 2/9/26 11:30 PM, David Hildenbrand (Arm) wrote:
> On 2/9/26 15:07, Baolin Wang wrote:
>> Implement the Arm64 architecture-specific clear_flush_young_ptes() to 
>> enable
>> batched checking of young flags and TLB flushing, improving 
>> performance during
>> large folio reclamation.
>>
>> Performance testing:
>> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, 
>> and try to
>> reclaim 8G file-backed folios via the memory.reclaim interface. I can 
>> observe
>> 33% performance improvement on my Arm64 32-core server (and 10%+ 
>> improvement
>> on my X86 machine). Meanwhile, the hotspot folio_check_references() 
>> dropped
>> from approximately 35% to around 5%.
>>
>> W/o patchset:
>> real    0m1.518s
>> user    0m0.000s
>> sys    0m1.518s
>>
>> W/ patchset:
>> real    0m1.018s
>> user    0m0.000s
>> sys    0m1.018s
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/ 
>> asm/pgtable.h
>> index 3dabf5ea17fa..a17eb8a76788 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1838,6 +1838,17 @@ static inline int ptep_clear_flush_young(struct 
>> vm_area_struct *vma,
>>       return contpte_clear_flush_young_ptes(vma, addr, ptep, 1);
>>   }
>> +#define clear_flush_young_ptes clear_flush_young_ptes
>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>> +                     unsigned long addr, pte_t *ptep,
>> +                     unsigned int nr)
>> +{
>> +    if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))
> I guess similar cases where we should never end up with non-present ptes 
> should be updated accordingly.
> 
> ptep_test_and_clear_young(), for example, should never be called on non- 
> present ptes.

Yes. I already adrressed this in my follow-up patchset.

> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks.

