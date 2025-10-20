Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93222CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0Rh7vr2r5CUO65seAlIgLtsprqiSEsZXpmW27HKpY8=; b=iImaQiRKcIoJddLdbeOJvp+6q7
	kv+T7jP66oQq57MUNNFL/aqX6O/bPqWJuOizT+qtsws8gtmY+UV/2n2s2aJdmb0rEMbhyNPOm3Awo
	iE4lGTYC8oQh9DWK3S2T8zSLp0TSMelq5aqAxpt+MS4xySwzGaPjSfqmfcEslPWO2vAQ5Jo5fwXYK
	VewrTMKThp4ho/Y95ZLw08p4fvb395sgHAn3sa1McvjM0xkIh7PeNEauPs2ZLNC35PEvQsNpBK0kG
	1NWdXQLh0yH7VFtg9uMILqfuI9YJ3BCO9NlIt0RTirq9Vwu6R4qc/3eOPxh25EHw78AHZixZcl81x
	yG8WImAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnd4-0000000Cygj-2zMc;
	Mon, 20 Oct 2025 11:00:42 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnd0-0000000CyeD-1C9S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760958033; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=I0Rh7vr2r5CUO65seAlIgLtsprqiSEsZXpmW27HKpY8=;
	b=cA0PCdUcbiCx+wPxE3/l3N+Sg62ETYzSN+UrM6Xv5IAV0omkyrSub7nzU7xEb3dZdNBrik6hR/+UXHWhysKg4YoFydY5XWURLgZjLPeaE5j5af0WbkDhXkmOC5m5+fZpIVeafkL6rdbGiwKKVlZvPkigZhf/4UW0mg6a7EuS/0I=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WqbBPTq_1760958022 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 20 Oct 2025 19:00:30 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>,  Anshuman Khandual
 <anshuman.khandual@arm.com>,  Ryan Roberts <ryan.roberts@arm.com>,  Gavin
 Shan <gshan@redhat.com>,  Ard Biesheuvel <ardb@kernel.org>,  "Matthew
 Wilcox (Oracle)" <willy@infradead.org>,  Yicong Yang
 <yangyicong@hisilicon.com>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH] arm64, mm: avoid always making PTE dirty in pte_mkwrite()
In-Reply-To: <aPKFmHg-FrkGJxWd@arm.com> (Catalin Marinas's message of "Fri, 17
	Oct 2025 19:06:16 +0100")
References: <20251015023712.46598-1-ying.huang@linux.alibaba.com>
	<aPKFmHg-FrkGJxWd@arm.com>
Date: Mon, 20 Oct 2025 19:00:20 +0800
Message-ID: <87bjm1g7nf.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_040039_123728_11C0978F 
X-CRM114-Status: GOOD (  25.69  )
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

Hi, Catalin,

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Wed, Oct 15, 2025 at 10:37:12AM +0800, Huang Ying wrote:
>> Current pte_mkwrite_novma() makes PTE dirty unconditionally.  This may
>> mark some pages that are never written dirty wrongly.  For example,
>> do_swap_page() may map the exclusive pages with writable and clean PTEs
>> if the VMA is writable and the page fault is for read access.
>> However, current pte_mkwrite_novma() implementation always dirties the
>> PTE.  This may cause unnecessary disk writing if the pages are
>> never written before being reclaimed.
>> 
>> So, change pte_mkwrite_novma() to clear the PTE_RDONLY bit only if the
>> PTE_DIRTY bit is set to make it possible to make the PTE writable and
>> clean.
>> 
>> The current behavior was introduced in commit 73e86cb03cf2 ("arm64:
>> Move PTE_RDONLY bit handling out of set_pte_at()").  Before that,
>> pte_mkwrite() only sets the PTE_WRITE bit, while set_pte_at() only
>> clears the PTE_RDONLY bit if both the PTE_WRITE and the PTE_DIRTY bits
>> are set.
>> 
>> To test the performance impact of the patch, on an arm64 server
>> machine, run 16 redis-server processes on socket 1 and 16
>> memtier_benchmark processes on socket 0 with mostly get
>> transactions (that is, redis-server will mostly read memory only).
>> The memory footprint of redis-server is larger than the available
>> memory, so swap out/in will be triggered.  Test results show that the
>> patch can avoid most swapping out because the pages are mostly clean.
>> And the benchmark throughput improves ~23.9% in the test.
>> 
>> Fixes: 73e86cb03cf2 ("arm64: Move PTE_RDONLY bit handling out of set_pte_at()")
>> Signed-off-by: Huang Ying <ying.huang@linux.alibaba.com>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Gavin Shan <gshan@redhat.com>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>> Cc: Yicong Yang <yangyicong@hisilicon.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>  arch/arm64/include/asm/pgtable.h | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index aa89c2e67ebc..0944e296dd4a 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -293,7 +293,8 @@ static inline pmd_t set_pmd_bit(pmd_t pmd, pgprot_t prot)
>>  static inline pte_t pte_mkwrite_novma(pte_t pte)
>>  {
>>  	pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
>> -	pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>> +	if (pte_sw_dirty(pte))
>> +		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>>  	return pte;
>>  }
>
> This seems to be the right thing. I recall years ago I grep'ed
> (obviously not hard enough) and most pte_mkwrite() places had a
> pte_mkdirty(). But I missed do_swap_page() and possibly others.

The do_swap_page() change was introduced in June 2024, quite recently.

> For this patch:
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks!

> I wonder whether we should also add (as a separate patch):
>
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 830107b6dd08..df1c552ef11c 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -101,6 +101,7 @@ static void __init pte_basic_tests(struct pgtable_debug_args *args, int idx)
>  	WARN_ON(pte_dirty(pte_mkclean(pte_mkdirty(pte))));
>  	WARN_ON(pte_write(pte_wrprotect(pte_mkwrite(pte, args->vma))));
>  	WARN_ON(pte_dirty(pte_wrprotect(pte_mkclean(pte))));
> +	WARN_ON(pte_dirty(pte_mkwrite_novma(pte_mkclean(pte))));
>  	WARN_ON(!pte_dirty(pte_wrprotect(pte_mkdirty(pte))));
>  }
>
> For completeness, also (and maybe other combinations):
>
> 	WARN_ON(!pte_write(pte_mkdirty(pte_mkwrite_novma(pte))));

Sure.  Will add another patch for this.

> I cc'ed linux-mm in case we missed anything. If nothing raised, I'll
> queue it next week.

---
Best Regards,
Huang, Ying

