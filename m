Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2784C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/XkLposKeTlBvC3DS66mYJZW9lA+byuezVAoelL6gU=; b=4N5upNh3SgE+Y1Kyot16/lWLQS
	/L5RKpp28y7RX1oCyIB7/GsvzP71PbY4DBcs+DH4ouUVyO8MAJf9A8c0sHe56wBSQnWKr1LeumZYA
	kJQt9gBMPGme+pdtCrNOCV5ZeHhEAiRhVfKuRI/I7TH9ExyWK9UqoDqtM/bv1U9M357rW+dQcXcEi
	Dcxp7k8w38EMIaLkZK6cNLGrR+rSi5HYySjTMdvor01u9ts7NP4+EgTrnld9lQN1fazoW/k+IYiMn
	FiGKe+vOI2lg6t/vTJWm1fr/NF+znSx/yCGFZC1vkP1wpsx9pMr9rkVcpX5RtZZowo8xD/4OH62Jm
	Iw0YHDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkQY-00000003ULm-0vaY;
	Mon, 23 Jun 2025 16:53:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThCL-00000002s4H-2TSl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 13:26:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA28A113E;
	Mon, 23 Jun 2025 06:26:38 -0700 (PDT)
Received: from [10.1.29.169] (XHFQ2J9959.cambridge.arm.com [10.1.29.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B4E53F58B;
	Mon, 23 Jun 2025 06:26:55 -0700 (PDT)
Message-ID: <ed942c01-58e8-4d91-8f86-3b3645af6940@arm.com>
Date: Mon, 23 Jun 2025 14:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: mm: support large block mapping when
 rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
 <20250531024545.1101304-4-yang@os.amperecomputing.com>
 <f036acea-1bd1-48a7-8600-75ddd504b8db@arm.com>
 <50a4f767-0007-4f6a-8c62-398962d54029@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <50a4f767-0007-4f6a-8c62-398962d54029@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_062657_725709_0382FA81 
X-CRM114-Status: GOOD (  26.52  )
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

[...]

>> +
>> +int split_leaf_mapping(unsigned long addr)
> 
> Thanks for coming up with the code. It does help to understand your idea. Now I
> see why you suggested "split_mapping(start); split_mapping(end);" model. It does
> make the implementation easier because we don't need a loop anymore. But this
> may have a couple of problems:
>   1. We need walk the page table twice instead of once. It sounds expensive.

Yes we need to walk twice. That may be more expensive or less expensive,
depending on the size of the range that you are splitting. If the range is large
then your approach loops through every leaf mapping between the start and end
which will be more expensive than just doing 2 walks. If the range is small then
your approach can avoid the second walk, but at the expense of all the extra
loop overhead.

My suggestion requires 5 loads (assuming the maximum of 5 levels of lookup).
Personally I think this is probably acceptable? Perhaps we need some other
voices here.


>   2. How should we handle repainting? We need split all the page tables all the
> way down to PTE for repainting between start and end rather than keeping block
> mappings. This model doesn't work, right? For example, repaint a 2G block. The
> first 1G is mapped by a PUD, the second 1G is mapped by 511 PMD and 512 PTEs.
> split_mapping(start) will split the first 1G, but split_mapping(end) will do
> nothing, the 511 PMDs are kept intact. In addition, I think we also prefer reuse
> the split primitive for repainting instead of inventing another one.

I agree my approach doesn't work for the repainting case. But I think what I'm
trying to say is that the 2 things are different operations;
split_leaf_mapping() is just trying to ensure that the start and end of a ragion
are on leaf boundaries. Repainting is trying to ensure that all leaf mappings
within a range are PTE-size. I've implemented the former and you've implemented
that latter. Your implementation looks like meets the former's requirements
because you are only testing it for the case where the range is 1 page. But
actually it is splitting everything in the range to PTEs.

Thanks,
Ryan

> 
> Thanks,
> Yang
> 
>> +{
>> +    pgd_t *pgdp, pgd;
>> +    p4d_t *p4dp, p4d;
>> +    pud_t *pudp, pud;
>> +    pmd_t *pmdp, pmd;
>> +    pte_t *ptep, pte;
>> +    int ret = 0;
>> +
>> +    /*
>> +     * !BBML2_NOABORT systems should not be trying to change permissions on
>> +     * anything that is not pte-mapped in the first place. Just return early
>> +     * and let the permission change code raise a warning if not already
>> +     * pte-mapped.
>> +     */
>> +    if (!system_supports_bbml2_noabort())
>> +        return 0;
>> +
>> +    /*
>> +     * Ensure addr is at least page-aligned since this is the finest
>> +     * granularity we can split to.
>> +     */
>> +    if (addr != PAGE_ALIGN(addr))
>> +        return -EINVAL;
>> +
>> +    arch_enter_lazy_mmu_mode();
>> +
>> +    /*
>> +     * PGD: If addr is PGD aligned then addr already describes a leaf
>> +     * boundary. If not present then there is nothing to split.
>> +     */
>> +    if (ALIGN_DOWN(addr, PGDIR_SIZE) == addr)
>> +        goto out;
>> +    pgdp = pgd_offset_k(addr);
>> +    pgd = pgdp_get(pgdp);
>> +    if (!pgd_present(pgd))
>> +        goto out;
>> +
>> +    /*
>> +     * P4D: If addr is P4D aligned then addr already describes a leaf
>> +     * boundary. If not present then there is nothing to split.
>> +     */
>> +    if (ALIGN_DOWN(addr, P4D_SIZE) == addr)
>> +        goto out;
>> +    p4dp = p4d_offset(pgdp, addr);
>> +    p4d = p4dp_get(p4dp);
>> +    if (!p4d_present(p4d))
>> +        goto out;
>> +
>> +    /*
>> +     * PUD: If addr is PUD aligned then addr already describes a leaf
>> +     * boundary. If not present then there is nothing to split. Otherwise,
>> +     * if we have a pud leaf, split to contpmd.
>> +     */
>> +    if (ALIGN_DOWN(addr, PUD_SIZE) == addr)
>> +        goto out;
>> +    pudp = pud_offset(p4dp, addr);
>> +    pud = pudp_get(pudp);
>> +    if (!pud_present(pud))
>> +        goto out;
>> +    if (pud_leaf(pud)) {
>> +        ret = split_pud(pudp, pud);
>> +        if (ret)
>> +            goto out;
>> +    }
>> +
>> +    /*
>> +     * CONTPMD: If addr is CONTPMD aligned then addr already describes a
>> +     * leaf boundary. If not present then there is nothing to split.
>> +     * Otherwise, if we have a contpmd leaf, split to pmd.
>> +     */
>> +    if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
>> +        goto out;
>> +    pmdp = pmd_offset(pudp, addr);
>> +    pmd = pmdp_get(pmdp);
>> +    if (!pmd_present(pmd))
>> +        goto out;
>> +    if (pmd_leaf(pmd)) {
>> +        if (pmd_cont(pmd))
>> +            split_contpmd(pmdp);
>> +        /*
>> +         * PMD: If addr is PMD aligned then addr already describes a
>> +         * leaf boundary. Otherwise, split to contpte.
>> +         */
>> +        if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>> +            goto out;
>> +        ret = split_pmd(pmdp, pmd);
>> +        if (ret)
>> +            goto out;
>> +    }
>> +
>> +    /*
>> +     * CONTPTE: If addr is CONTPTE aligned then addr already describes a
>> +     * leaf boundary. If not present then there is nothing to split.
>> +     * Otherwise, if we have a contpte leaf, split to pte.
>> +     */
>> +    if (ALIGN_DOWN(addr, CONT_PMD_SIZE) == addr)
>> +        goto out;
>> +    ptep = pte_offset_kernel(pmdp, addr);
>> +    pte = __ptep_get(ptep);
>> +    if (!pte_present(pte))
>> +        goto out;
>> +    if (pte_cont(pte))
>> +        split_contpte(ptep);
>> +
>> +out:
>> +    arch_leave_lazy_mmu_mode();
>> +    return ret;
>> +}
>> ---8<---
>>
>> Thanks,
>> Ryan
>>
> 


