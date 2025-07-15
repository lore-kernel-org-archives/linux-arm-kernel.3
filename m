Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC275C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 06:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wgx/x0WS4CP1bfDxxEk/7j7bUG/94pwY6x3H7YqQVk=; b=OCLoy1eRLm7OXnJCWe06H2P9ma
	Vl68n4UA/qVJocgjGArSCtR82StVaBO3aEKMk67xrcLOlGsPgJQk+0DNimbjSW0SrZYQ4oGxf6fpd
	kRFQRVaTWSUoWWnjIOF2vQ6Nh3hIOO+hk71k4JVfyonIL9F3eI65Y4gql9siF0hE5hONc5vCga1QC
	1u8k5Xh3GGXSAaqAQDNpuydzJPp5wjF4vCxTTDz1+IW7xGYDIk2GSu4I3tLSi8PqiDRDlmpmkrmNI
	Lfldyc1AeDBJcynL+wLdQR7XcQwDwXoXRUB1hPe2zi2pOlJIldaeI8+WfNGj1prAqRaoDiWqLF/kK
	XUEJavGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZLU-00000004EfX-09jD;
	Tue, 15 Jul 2025 06:40:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZHO-00000004E5p-0fEq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 06:36:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 828AC12FC;
	Mon, 14 Jul 2025 23:36:31 -0700 (PDT)
Received: from [10.163.92.132] (unknown [10.163.92.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A4FC3F6A8;
	Mon, 14 Jul 2025 23:36:37 -0700 (PDT)
Message-ID: <408a830d-11c5-4c29-95c1-21789cd07e32@arm.com>
Date: Tue, 15 Jul 2025 12:06:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Drop redundant addr increment in
 set_huge_pte_at()
To: Dev Jain <dev.jain@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
References: <20250715043922.57195-1-anshuman.khandual@arm.com>
 <e10e0fac-a81c-445e-8036-9db2b63b77f7@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <e10e0fac-a81c-445e-8036-9db2b63b77f7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_233642_239975_954630A8 
X-CRM114-Status: GOOD (  21.28  )
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



On 15/07/25 11:28 AM, Dev Jain wrote:
> 
> On 15/07/25 10:09 am, Anshuman Khandual wrote:
>> The 'addr' need not be incremented while operating on single entry basis as
>> BBM is not required for such updates.
> 
> "while operating on a single entry basis" should be replaced with
> "when transitioning from invalid to valid pte"; BBM is required
> for single entry updates when the cont bit is set, as described
> in the comment immediately below. In fact, let us not even mention
> BBM at all - the reasoning is that the code is written in a way
> that, the loop incrementing addr, immediately has a return after
> it, and it does not actually use the addr, so let's drop the
> increment. It is not immediately obvious from the commit description
> that the addr is passed ultimately to flush_tlb_range friends which
> is involved in BBM.

Agreed, the mention about BBM can be dropped as it is not really
relevant. Rather 'addr' variable being unused in the conditional
block, which exits right after is the real reason. I will update
the commit description as required.  

> 
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> 
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   arch/arm64/mm/hugetlbpage.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
>> index 0c8737f4f2ce..1d90a7e75333 100644
>> --- a/arch/arm64/mm/hugetlbpage.c
>> +++ b/arch/arm64/mm/hugetlbpage.c
>> @@ -225,7 +225,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>>       ncontig = num_contig_ptes(sz, &pgsize);
>>         if (!pte_present(pte)) {
>> -        for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
>> +        for (i = 0; i < ncontig; i++, ptep++)
>>               __set_ptes_anysz(mm, ptep, pte, 1, pgsize);
>>           return;
>>       }

