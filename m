Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF40CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 04:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYb7vYqAepxFRoH2FPAszzpLKYcZBm7rEVsl9vC3Ll0=; b=p+uvjw9H6FWfEMNbWMD7Q/qcY2
	TjpG0GZG0yM09pV0mtAaK4RQ6XgTixH31JI/QiETolQK/iQygJo/zVod4kfFNDpp+PMfpRioW/W4u
	oOL2I4swh4rS/pbHb9VonSTcEjglYYpaJb95IHjtAjNgsLCnjZaYPfdjV4IdEjoFSqjgNQ4+vwMds
	/mL9/1P0yNERwmiSd66xWkaiXMa9uYeT9Py+WrY/pKY994YlBCHajDkqa5UxTYvGkIRaHDFyp6nJJ
	RSSGhwbhNq0944k8rEfWEFnplq+6RfDtUpyBojx6P3OWWG3fyrfEAvHZXlu+NE2piaJBWQYXPTEkB
	9cRdDbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHkD-00000009mfJ-17Bf;
	Fri, 22 May 2026 04:44:21 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHkA-00000009meC-0x1r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 04:44:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gMCND6t9ZzKHLv5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 12:43:56 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 1540240573
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 12:44:03 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP4 (Coremail) with SMTP id gCh0CgBnL1sL3w9qXpfDDA--.53130S3;
	Fri, 22 May 2026 12:43:57 +0800 (CST)
Message-ID: <d78ebf12-075c-5abd-d83e-f66f0f45e92e@huaweicloud.com>
Date: Fri, 22 May 2026 12:43:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: tlb: Flush walk cache when unsharing PMD tables
Content-Language: en-US
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, akpm@linux-foundation.org, npiggin@gmail.com,
 aneesh.kumar@kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org,
 wangkefeng.wang@huawei.com, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 David Hildenbrand <david@kernel.org>
References: <20260521073011.4121277-1-zengheng@huaweicloud.com>
 <ag8fHYL-S26uO0yZ@arm.com>
From: Zeng Heng <zengheng@huaweicloud.com>
In-Reply-To: <ag8fHYL-S26uO0yZ@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: gCh0CgBnL1sL3w9qXpfDDA--.53130S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJrWkGw4UCr45Cr43Cr4Uurg_yoW5Jr4Upa
	43CF13KFZ5Wr1UtF1vqr4UXFy3Can8Jr9ruryrZasYvF12yF1vgFWvyryruFy0yFZ5tr4f
	WF1j9FnrZF4UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1F6r1fM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUF1v3UUUUU
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_214418_641689_58AB9D04 
X-CRM114-Status: GOOD (  16.46  )
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

Hi Catalin,

On 2026/5/21 23:05, Catalin Marinas wrote:
> + David H.
>
> On Thu, May 21, 2026 at 03:30:11PM +0800, Zeng Heng wrote:
>> From: Zeng Heng <zengheng4@huawei.com>
>>
>> When huge_pmd_unshare() is called to unshare a PMD table, the
>> tlb_unshare_pmd_ptdesc() function sets tlb->unshared_tables=true
>> but the aarch64 tlb_flush() only checked tlb->freed_tables to
>> determine whether to use TLBF_NONE (vae1is, invalidates walk
>> cache) or TLBF_NOWALKCACHE (vale1is, leaf-only).
>>
>> This caused the stale PMD page table entry to remain in the walk cache
>> after unshare, potentially leading to incorrect page table walks.
>>
>> Fix by including unshared_tables in the check, so that when
>> unsharing tables, TLBF_NONE is used and the walk cache is properly
>> invalidated.
>>
>> Here is the detailed distinction between vae1is and vale1is:
>>
>> | Instruction Combination  | Actual Invalidation Scope                         |
>> | ------------------------ | --------------------------------------------------|
>> | `VAE1IS`  + TTL=`0`      | All entries at all levels (full invalidation)     |
>> | `VAE1IS`  + TTL=`2` (L2) | Non-leaf at Level 0/1 + leaf at Level 2           |
>> | `VALE1IS` + TTL=`0`      | Leaf entries at all levels (non-leaf not cleared) |
>> | `VALE1IS` + TTL=`2` (L2) | Leaf entry at Level 2 only                        |
>>
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> The fix looks fine but does it need:
>
> Fixes: 8ce720d5bd91 ("mm/hugetlb: fix excessive IPI broadcasts when unsharing PMD tables using mmu_gather")
> Cc: <stable@vger.kernel.org>

It makes sense to me. Thanks a lot for that.


Best regards,
Zeng Heng

>> ---
>>   arch/arm64/include/asm/tlb.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
>> index 10869d7731b8..751bd57bc3ba 100644
>> --- a/arch/arm64/include/asm/tlb.h
>> +++ b/arch/arm64/include/asm/tlb.h
>> @@ -53,7 +53,8 @@ static inline int tlb_get_level(struct mmu_gather *tlb)
>>   static inline void tlb_flush(struct mmu_gather *tlb)
>>   {
>>   	struct vm_area_struct vma = TLB_FLUSH_VMA(tlb->mm, 0);
>> -	tlbf_t flags = tlb->freed_tables ? TLBF_NONE : TLBF_NOWALKCACHE;
>> +	tlbf_t flags = (tlb->freed_tables || tlb->unshared_tables) ?
>> +			TLBF_NONE : TLBF_NOWALKCACHE;
>>   	unsigned long stride = tlb_get_unmap_size(tlb);
>>   	int tlb_level = tlb_get_level(tlb);
>>   
>> -- 
>> 2.43.0


