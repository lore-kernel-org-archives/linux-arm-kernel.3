Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDB1D46C16
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 01:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mooo+VFrXzT3ho52+vyVC3gkAOeJGRzvzapS1lW0iw=; b=IvjPavcZ8SoTGiEm/oZl88KhWj
	ZAWzJFMZvfJgJHqXR5DXjhDayYbadqSk3FCF7a2mq4Bc0DHG+/rh+LCdA7lFsw8GkASHbTqsG5gjF
	OkUEQjk1SoJZr+CUyCO6boFzsOAEDhHYRvYChIUsXPDuUbmhOitOnRt2T1kJVQ0zmU7MklMUovGPt
	9R+/W+RihkO7lFSC3vUzCI0IlG9jYqI//3eijxUWYoUL7J1gn09pIP59UpiMWpNoLRF8ucYpn76h2
	nfeVU7tPcrKgUXAi6oVdNlouBkwWSXQXcDwrx93bNA80dx4ROKXTAwr3NcWS7uM0T8uo9L0QCvS7H
	MjA2tqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlH3E-0000000H4QW-2nDN;
	Thu, 29 Jan 2026 01:42:28 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlH3A-0000000H4Pv-2W2s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 01:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769650938; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=1mooo+VFrXzT3ho52+vyVC3gkAOeJGRzvzapS1lW0iw=;
	b=X662M2hGt3GaP4y0zRjodhHijktk9ekaMwu0jAZF9QAIo8XQ9H0ijVK70ap8+m6GfCbreviixUgYl2+GwKUbzgLP6q95QHzn2+2Ye3RkbwW1IrHZdv1jTAS5j6BQ3V8VE4s3YO89b8/73MfvNywXnCyCNtC3chlWDwLoMAe3pTA=
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wy5TwiT_1769650933 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Jan 2026 09:42:14 +0800
Message-ID: <de141225-a0c1-41fd-b3e1-bcab09827ddd@linux.alibaba.com>
Date: Thu, 29 Jan 2026 09:42:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: mm: implement the architecture-specific
 clear_flush_young_ptes()
To: Chris Mason <clm@meta.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <9d866a2644051e13a41ef4d6ca3909c6e1f9e229.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260128114936.72280-1-clm@meta.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260128114936.72280-1-clm@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_174225_959877_C9F5C151 
X-CRM114-Status: GOOD (  15.09  )
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



On 1/28/26 7:47 PM, Chris Mason wrote:
> Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
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
> 
> Hi everyone, I ran mm-new through my AI review prompts and this one was
> flagged.  AI review below:
> 
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1838,6 +1838,17 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>>   	return contpte_clear_flush_young_ptes(vma, addr, ptep, 1);
>>   }
>>
>> +#define clear_flush_young_ptes clear_flush_young_ptes
>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>> +					 unsigned long addr, pte_t *ptep,
>> +					 unsigned int nr)
>> +{
>> +	if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))
>> +		return __ptep_clear_flush_young(vma, addr, ptep);
> 
> Should this be checking !pte_valid_cont() instead of !pte_cont()?
> 
> The existing ptep_clear_flush_young() above uses !pte_valid_cont() to
> determine when to take the fast path. The new function only checks
> !pte_cont(), which differs when handling non-present PTEs.
> 
> Non-present PTEs (device-private, device-exclusive) can reach
> clear_flush_young_ptes() through folio_referenced_one()->
> clear_flush_young_ptes_notify(). These entries may have bit 52 set as
> part of their encoding, but they aren't valid contiguous mappings.
> 
> With the current check, wouldn't such entries incorrectly trigger the
> contpte path and potentially cause contpte_clear_flush_young_ptes() to
> process additional unrelated PTEs beyond the intended single entry?

Indeed. I previously discussed with Ryan whether using pte_cont() was 
enough, and we believed that invalid PTEs wouldn’t have the PTE_CONT bit 
set. But we clearly missed the device-folio cases. Thanks for reporting.

Andrew, could you please squash the following fix into this patch? If 
you prefer a new version, please let me know. Thanks.

diff --git a/arch/arm64/include/asm/pgtable.h 
b/arch/arm64/include/asm/pgtable.h
index a17eb8a76788..dc16591c4241 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1843,7 +1843,7 @@ static inline int clear_flush_young_ptes(struct 
vm_area_struct *vma,
                                          unsigned long addr, pte_t *ptep,
                                          unsigned int nr)
  {
-       if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))
+       if (likely(nr == 1 && !pte_valid_cont(__ptep_get(ptep))))
                 return __ptep_clear_flush_young(vma, addr, ptep);

         return contpte_clear_flush_young_ptes(vma, addr, ptep, nr);

