Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E19AC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fD7qqaRKnm3kYtFNKgvQ4Af/RMTJ9uqEnhnVg3rvJYQ=; b=ggmW40tapaQd8L4kbSHfX6AVTl
	c0MiK0gCSr2WBFwt9vfkfSGXEJapFt7ySSLoP5u65deFkWHe96fzH6dt+T/CL34vljNhEuMnFCkLP
	ebSOmv2KI+iZ1lsZVEosAptg9L91wqrHTEDVFkZGeecmGMJpwDNc7O3G4h61BPoW1+SS00RthqraC
	5QDS9xmcFL8axW7QHooFkdbB5ETDg8psfcNXSXKat4y/OWZEc63+rpna7xof6ixHqnL9HQjRmzH1x
	H/o6b8F1jx4ueEK3Oaca/h78pXwdPstKyGjKSROvvjGWeSZ1lY0AdNIzxBGE/jwzAFVTjlbyk1X/y
	WVyv/epg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUR9h-00000008ySy-3q9o;
	Wed, 25 Jun 2025 14:31:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNvL-00000008PRu-08CI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:04:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E40AB106F;
	Wed, 25 Jun 2025 04:03:55 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DED9C3F58B;
	Wed, 25 Jun 2025 04:04:10 -0700 (PDT)
Message-ID: <956f6ebe-606f-4575-a0a5-7841c95b5371@arm.com>
Date: Wed, 25 Jun 2025 12:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
Content-Language: en-GB
To: Mike Rapoport <rppt@kernel.org>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com> <aE53Jp7ZGgTxtxwG@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aE53Jp7ZGgTxtxwG@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_040415_116286_40A48824 
X-CRM114-Status: GOOD (  14.82  )
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

On 15/06/2025 08:32, Mike Rapoport wrote:
> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
>> -/*
>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>> - */
>> -static int __change_memory_common(unsigned long start, unsigned long size,
>> +static int ___change_memory_common(unsigned long start, unsigned long size,
>>  				pgprot_t set_mask, pgprot_t clear_mask)
>>  {
>>  	struct page_change_data data;
>> @@ -61,9 +140,28 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>>  	data.set_mask = set_mask;
>>  	data.clear_mask = clear_mask;
>>  
>> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
>> -					&data);
>> +	arch_enter_lazy_mmu_mode();
>> +
>> +	/*
>> +	 * The caller must ensure that the range we are operating on does not
>> +	 * partially overlap a block mapping. Any such case should either not
>> +	 * exist, or must be eliminated by splitting the mapping - which for
>> +	 * kernel mappings can be done only on BBML2 systems.
>> +	 *
>> +	 */
>> +	ret = walk_kernel_page_table_range_lockless(start, start + size,
>> +						    &pageattr_ops, NULL, &data);
> 
> x86 has a cpa_lock for set_memory/set_direct_map to ensure that there's on
> concurrency in kernel page table updates. I think arm64 has to have such
> lock as well.

We don't have a lock today, using apply_to_page_range(); we are expecting that
the caller has exclusive ownership of the portion of virtual memory - i.e. the
vmalloc region or linear map. So I don't think this patch changes that requirement?

Where it does get a bit more hairy is when we introduce the support for
splitting. In that case, 2 non-overlapping areas of virtual memory may share a
large leaf mapping that needs to be split. But I've been discussing that with
Yang Shi at [1] and I think we can handle that locklessly too.

Perhaps I'm misunderstanding something?

[1] https://lore.kernel.org/all/f036acea-1bd1-48a7-8600-75ddd504b8db@arm.com/

Thanks,
Ryan

> 
>> +	arch_leave_lazy_mmu_mode();
>> +
>> +	return ret;
>> +}
> 


