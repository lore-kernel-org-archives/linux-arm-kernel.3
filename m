Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10303CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 01:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iO9IyLuu+6VJGjLqKGfdYZOIt/8+8VRDHAroqFcBXb8=; b=lZy2WbdtZ0BZ3ZTvApgEsfpKCk
	dziuTrU43L+Zc6xzbyU3aepl2WKUf48+BDCi2y1qbbOA5dk+R1L9jIUtRm/GCPsiRl8UrhGyH+yIV
	yetLybu9i+bNdNV8lwcD87A6jGEq2xrMahVrlKeBwH/xviWWiXmNHj2Qqg4QEF5EDEbWp3Z6X6EEN
	6EaKakTTCOVXr173D589Fnk0lRqBCITNWWHoFOzgxiea1YlCF9y6qTSKrYt0gzEYsIqOpA2MjKctM
	d/wHndygD7uKWgQE9IIqdnM14eRPlb109vRSPTx0tTroRpy6htJcA/Gtv2VY/H3jY+iyqvbFbqw6E
	W8F/RAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKcD-00000006AY6-0Cmy;
	Tue, 16 Sep 2025 01:36:17 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKc9-00000006AWl-13Wf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 01:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757986569; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=iO9IyLuu+6VJGjLqKGfdYZOIt/8+8VRDHAroqFcBXb8=;
	b=T7JIJmEjpEH7Lm9ZSj+DsujVED+W3aNhS6guqnCtYWYGePM0tlQtLhIFqddKiP+6PJ0XRfoyBknDJvGZlldPiBhJU2reHKryHYdCuxZJ0VhD4/7/2l+ObFM2nlxYTGymTxoQk8c+UhmHAbi+QJOb6HZvtZ59Ju9lAUty6C+Hgxg=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wo6JU5v_1757986565 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 16 Sep 2025 09:36:06 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,  Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,
  Zi Yan <ziy@nvidia.com>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  Ryan Roberts <ryan.roberts@arm.com>,  Yang Shi
 <yang@os.amperecomputing.com>,  "Christoph Lameter (Ampere)"
 <cl@gentwo.org>,  Dev Jain <dev.jain@arm.com>,  Barry Song
 <baohua@kernel.org>,  Anshuman Khandual <anshuman.khandual@arm.com>,
  Yicong Yang <yangyicong@hisilicon.com>,  Kefeng Wang
 <wangkefeng.wang@huawei.com>,  Kevin Brodsky <kevin.brodsky@arm.com>,  Yin
 Fengwei <fengwei_yin@linux.alibaba.com>,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [RFC PATCH 1/2] mm: add spurious fault fixing support for huge pmd
In-Reply-To: <8c51da7a-7370-4678-96a3-7cd6eaf0db62@redhat.com> (David
	Hildenbrand's message of "Mon, 15 Sep 2025 13:08:09 +0200")
References: <20250915032946.33203-1-ying.huang@linux.alibaba.com>
	<20250915032946.33203-2-ying.huang@linux.alibaba.com>
	<8c51da7a-7370-4678-96a3-7cd6eaf0db62@redhat.com>
Date: Tue, 16 Sep 2025 09:36:03 +0800
Message-ID: <87frcn6uws.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_183613_953477_475E522B 
X-CRM114-Status: GOOD (  22.00  )
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

Hi, David,

Thanks for review!

David Hildenbrand <david@redhat.com> writes:

> On 15.09.25 05:29, Huang Ying wrote:
>> In the current kernel, there is spurious fault fixing support for pte,
>> but not for huge pmd because no architectures need it. But in the
>> next patch in the series, we will change the write protection fault
>> handling logic on arm64, so that some stale huge pmd entries may
>> remain in the TLB. These entries need to be flushed via the huge pmd
>> spurious fault fixing mechanism.
>> Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Yang Shi <yang@os.amperecomputing.com>
>> Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Cc: Yicong Yang <yangyicong@hisilicon.com>
>> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
>> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
>> Cc: Yin Fengwei <fengwei_yin@linux.alibaba.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> ---
>
> [...]
>
>>     int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct
>> *src_mm,
>> @@ -1857,7 +1861,20 @@ void huge_pmd_set_accessed(struct vm_fault *vmf)
>>   	if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd)))
>>   		goto unlock;
>>   -	touch_pmd(vmf->vma, vmf->address, vmf->pmd, write);
>> +	if (!touch_pmd(vmf->vma, vmf->address, vmf->pmd, write)) {
>> +		/* Skip spurious TLB flush for retried page fault */
>> +		if (vmf->flags & FAULT_FLAG_TRIED)
>> +			goto unlock;
>> +		/*
>> +		 * This is needed only for protection faults but the arch code
>> +		 * is not yet telling us if this is a protection fault or not.
>> +		 * This still avoids useless tlb flushes for .text page faults
>> +		 * with threads.
>> +		 */
>
> Can we instead just remove these comments and simplly say "see
> handle_pte_fault()"

Sure.

>> +		if (vmf->flags & FAULT_FLAG_WRITE)
>> +			flush_tlb_fix_spurious_fault_pmd(vmf->vma, vmf->address,
>> +							 vmf->pmd);
>> +	}
>
> Okay, In the PTE case, we call flush_tlb_fix_spurious_fault() during
> write faults if ptep_set_access_flags() returned "0".
>
> You are calling flush_tlb_fix_spurious_fault_pmd() during a write
> fault when pmdp_set_access_flags() returned "0" as well.
>
> In general, LGTM, but I would just let touch_pmd() return the value of
> pmdp_set_access_flags() instead and add a quick comment for
> touch_pmd() what the return value means.

Sure.

---
Best Regards,
Huang, Ying

