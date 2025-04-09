Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3239C36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 01:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNVwdXPj/1B40o8xTHzuDKtJ6KL1jH9nAfC27tC0/44=; b=D9H9BtJgL/4xcPH97AMg56WXAY
	zefLkPraSa8kW2LeWFRAP6ksHodLQHEUpFAjS5kiDUD97+npwWmwCznM70Wg+jsMVPclecNEEjyS/
	E8oolHjwt0MqzCJP7NMfPT+QKPt3pTjFJxMiNfNVZiL4oDxj5tv1wSFLThufhHFtq6LXMZrYZkR+n
	PsguX4GTP4XP5180OFXZ/1nMKu9QbtK34kymeIhZ7rkSF5TIeeH100youKwyL3v4ZNeR/OdXCa7i9
	mLZNr7rTszP1GFu9H7NsXwKUaEgORWCWtfc/onM7utaEgRD4/OuD6CLKvxremNs1kDMJ1opZcGGjn
	4Nx7yEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2JxT-00000005pIs-1fBx;
	Wed, 09 Apr 2025 01:10:27 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Jvf-00000005p8l-3ZjQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 01:08:38 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZXPqc1cGWz5vMX;
	Wed,  9 Apr 2025 09:04:44 +0800 (CST)
Received: from kwepemg100017.china.huawei.com (unknown [7.202.181.58])
	by mail.maildlp.com (Postfix) with ESMTPS id 2BCDE1402C4;
	Wed,  9 Apr 2025 09:08:29 +0800 (CST)
Received: from [10.174.178.114] (10.174.178.114) by
 kwepemg100017.china.huawei.com (7.202.181.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 9 Apr 2025 09:08:27 +0800
Message-ID: <be0dac24-8a04-436a-85c7-4d0780903fbf@huawei.com>
Date: Wed, 9 Apr 2025 09:08:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <mawupeng1@huawei.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<ryan.roberts@arm.com>, <anshuman.khandual@arm.com>,
	<akpm@linux-foundation.org>, <peterx@redhat.com>, <joey.gouly@arm.com>,
	<yangyicong@hisilicon.com>, <ioworker0@gmail.com>, <baohua@kernel.org>,
	<jack@suse.cz>, <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dax: add devmap check for pmd_trans_huge
To: <apopple@nvidia.com>
References: <20250408085914.1946183-1-mawupeng1@huawei.com>
 <qzqanugi6qbbucxp2fn2456t4n7q4lj2enhzf4z767jpcbgacu@37cowlipfmgo>
From: mawupeng <mawupeng1@huawei.com>
In-Reply-To: <qzqanugi6qbbucxp2fn2456t4n7q4lj2enhzf4z767jpcbgacu@37cowlipfmgo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.114]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg100017.china.huawei.com (7.202.181.58)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_180836_773161_F728BC30 
X-CRM114-Status: GOOD (  23.81  )
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



On 2025/4/9 7:05, Alistair Popple wrote:
> On Tue, Apr 08, 2025 at 04:59:14PM +0800, Wupeng Ma wrote:
>> During our test in ext4 dax linux-v5.10 on arm64. A BUG_ON is trigger in
>> follow_invalidate_pte as follow since this pmd is seem as pmd_trans_huge.
>> However this page is really a dax-pmds rather than a pmd trans huge.
>>
>> Call trace is shown as follow:
>>
>>   ------------[ cut here ]------------
>>   kernel BUG at mm/memory.c:5185!
>>   CPU: 0 PID: 150 Comm: kworker/u8:10 Not tainted 5.10.0-01678-g1e62aad66bbc-dirty #36
> 
> This is an old kernel, and I couldn't correlate the line number of the BUG_ON()
> probably because you have patches applied. But I assume this is the VM_BUG_ON()
> in follow_invalidate_pte()? Does this issue reproduce on more recent kernel

Yes.

> versions (eg. v6.13)? Or some other upstream kernel version?

Since Commit 06083a0921fd ("dax: fix missing writeprotect the pte entry"),
the same issue can not be trigger in the same call trace. However the same
issue may still exist in current kernel.

> 
>>   pc : follow_invalidate_pte+0xdc/0x5e0
>>   lr : follow_invalidate_pte+0xc4/0x5e0
>>   sp : ffffa00012997110
>>   Call trace:
>>    follow_invalidate_pte+0xdc/0x5e0
>>    dax_entry_mkclean+0x250/0x870
>>    dax_writeback_one+0xac/0x380
>>    dax_writeback_mapping_range+0x22c/0x704
>>    ext4_dax_writepages+0x234/0x6e4
>>    do_writepages+0xc8/0x1c0
>>    __writeback_single_inode+0xb8/0x560
>>    writeback_sb_inodes+0x344/0x7a0
>>    wb_writeback+0x1f8/0x6b0
>>    wb_do_writeback+0x194/0x3cc
>>    wb_workfn+0x14c/0x590
>>    process_one_work+0x470/0xa30
>>    worker_thread+0xac/0x510
>>    kthread+0x1e0/0x220
>>    ret_from_fork+0x10/0x18
>>   ---[ end trace 0f479050bd4b1818 ]---
>>   Kernel panic - not syncing: Oops - BUG: Fatal exception
>>   ---[ end Kernel panic - not syncing: Oops - BUG: Fatal exception ]---
>>
>> Commit 5c7fb56e5e3f ("mm, dax: dax-pmd vs thp-pmd vs hugetlbfs-pmd") and
>> commit 36b78402d97a ("powerpc/hash64/devmap: Use H_PAGE_THP_HUGE when
>> setting up huge devmap PTE entries") already check pmd_devmap during
>> checking pmd_trans_huge. Since pmd_devmap() is used to distinguish dax-pmds,
>> add the same check for arm64 to fix this problem.
> 
> That seems correct to me. In practice most callers of pmd_trans_huge() that can
> see a dax-pmd already check for it explicitly with vma_is_dax(), but there are a
> few cases that don't.
> 
>> Add PTE_DEVMAP in pte_modify as commit 4628a64591e6 ("mm: Preserve
>> _PAGE_DEVMAP across mprotect() calls") does to avoid the same issue in
>> mprotect.
>>
>> Fixes: 73b20c84d42d ("arm64: mm: implement pte_devmap support")
>> Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index d3b538be1500b..b9a618127c01b 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -740,7 +740,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
>>  	 * as a table, so force the valid bit for the comparison.
>>  	 */
>>  	return pmd_val(pmd) && pmd_present(pmd) &&
>> -	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
>> +	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID)) && !pmd_devmap(pmd);
>>  }
>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>  
>> @@ -1186,7 +1186,8 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>>  	 */
>>  	const pteval_t mask = PTE_USER | PTE_PXN | PTE_UXN | PTE_RDONLY |
>>  			      PTE_PRESENT_INVALID | PTE_VALID | PTE_WRITE |
>> -			      PTE_GP | PTE_ATTRINDX_MASK | PTE_PO_IDX_MASK;
>> +			      PTE_GP | PTE_ATTRINDX_MASK | PTE_PO_IDX_MASK |
>> +			      PTE_DEVMAP;
>>  
>>  	/* preserve the hardware dirty information */
>>  	if (pte_hw_dirty(pte))
>> -- 
>> 2.43.0
>>
>>


