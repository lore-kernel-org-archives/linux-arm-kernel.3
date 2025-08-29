Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B90BCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DbPHQ90+DKqtaniej3vC5v30Nb+07RTlxdaDaJtIwg=; b=glJvim4sfexKhBIfdrTopuX7AQ
	1yFj1vrRQ78kXjzxZ5M4OUZWli+jOidJThkZKWg54JXGjuS+dK8uCJM6z30LK5nzb5jYuI7VhZ/m6
	gXK4bkinwiZbKQ1VsPX6OLrZe4+/yn5Mpcm0Rk30YD9NvusFMZa1YJ1OUUM42d7iP7GdXR2YcMXZO
	bAKpJQkLATaIBmkd45AZiwf1eW186swU5ttsxN1Aq+Pbc3dN+bfjjvl1Hjp1okOC7Ay10gt+pR/YT
	QB/zmJfpLZzGmgPT+Y+ZLvXTcmGFppT0RMOL8NTYVcTDY0+EVEZ0kiogVoGjYoRbtuYinLVxwqUvX
	E0HxEmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxjP-00000005YWV-07KM;
	Fri, 29 Aug 2025 11:57:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvL0-000000058Zh-0KtH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 09:24:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B21251756;
	Fri, 29 Aug 2025 02:23:52 -0700 (PDT)
Received: from [10.57.91.118] (unknown [10.57.91.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AE8A3F738;
	Fri, 29 Aug 2025 02:23:59 -0700 (PDT)
Message-ID: <9b7df510-b9a1-4fca-90d3-bcfb3df43bd4@arm.com>
Date: Fri, 29 Aug 2025 10:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 1/4] arm64: Enable permission change on arm64
 kernel block mappings
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 akpm@linux-foundation.org, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250805081350.3854670-1-ryan.roberts@arm.com>
 <20250805081350.3854670-2-ryan.roberts@arm.com> <aLCDGlobH1wG8iqx@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aLCDGlobH1wG8iqx@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_022402_203446_4D916759 
X-CRM114-Status: GOOD (  28.32  )
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

On 28/08/2025 17:26, Catalin Marinas wrote:
> On Tue, Aug 05, 2025 at 09:13:46AM +0100, Ryan Roberts wrote:
>> From: Dev Jain <dev.jain@arm.com>
>>
>> This patch paves the path to enable huge mappings in vmalloc space and
>> linear map space by default on arm64. For this we must ensure that we
>> can handle any permission games on the kernel (init_mm) pagetable.
>> Currently, __change_memory_common() uses apply_to_page_range() which
>> does not support changing permissions for block mappings. We attempt to
>> move away from this by using the pagewalk API, similar to what riscv
>> does right now; however, it is the responsibility of the caller to
>> ensure that we do not pass a range overlapping a partial block mapping
>> or cont mapping; in such a case, the system must be able to support
>> range splitting.
>>
>> This patch is tied with Yang Shi's attempt [1] at using huge mappings in
>> the linear mapping in case the system supports BBML2, in which case we
>> will be able to split the linear mapping if needed without
>> break-before-make. Thus, Yang's series, IIUC, will be one such user of
>> my patch; suppose we are changing permissions on a range of the linear
>> map backed by PMD-hugepages, then the sequence of operations should look
>> like the following:
>>
>> split_range(start)
>> split_range(end);
>> __change_memory_common(start, end);
>>
>> However, this patch can be used independently of Yang's; since currently
>> permission games are being played only on pte mappings (due to
>> apply_to_page_range not supporting otherwise), this patch provides the
>> mechanism for enabling huge mappings for various kernel mappings like
>> linear map and vmalloc.
> [...]
> 
> I think some of this text needs to be trimmed down, avoid references to
> other series if they are merged at the same time.
> 
>> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
>> index 682472c15495..8212e8f2d2d5 100644
>> --- a/include/linux/pagewalk.h
>> +++ b/include/linux/pagewalk.h
>> @@ -134,6 +134,9 @@ int walk_page_range(struct mm_struct *mm, unsigned long start,
>>  int walk_kernel_page_table_range(unsigned long start,
>>  		unsigned long end, const struct mm_walk_ops *ops,
>>  		pgd_t *pgd, void *private);
>> +int walk_kernel_page_table_range_lockless(unsigned long start,
>> +		unsigned long end, const struct mm_walk_ops *ops,
>> +		void *private);
>>  int walk_page_range_vma(struct vm_area_struct *vma, unsigned long start,
>>  			unsigned long end, const struct mm_walk_ops *ops,
>>  			void *private);
>> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
>> index 648038247a8d..18a675ab87cf 100644
>> --- a/mm/pagewalk.c
>> +++ b/mm/pagewalk.c
>> @@ -633,6 +633,30 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
>>  	return walk_pgd_range(start, end, &walk);
>>  }
>>  
>> +/*
>> + * Use this function to walk the kernel page tables locklessly. It should be
>> + * guaranteed that the caller has exclusive access over the range they are
>> + * operating on - that there should be no concurrent access, for example,
>> + * changing permissions for vmalloc objects.
>> + */
>> +int walk_kernel_page_table_range_lockless(unsigned long start, unsigned long end,
>> +		const struct mm_walk_ops *ops, void *private)
>> +{
>> +	struct mm_walk walk = {
>> +		.ops		= ops,
>> +		.mm		= &init_mm,
>> +		.private	= private,
>> +		.no_vma		= true
>> +	};
>> +
>> +	if (start >= end)
>> +		return -EINVAL;
>> +	if (!check_ops_valid(ops))
>> +		return -EINVAL;
>> +
>> +	return walk_pgd_range(start, end, &walk);
>> +}
> 
> More of a nit: we could change walk_kernel_page_table_range() to call
> this function after checking the mm lock as they look nearly identical.
> The existing function has a pgd argument but it doesn't seem to be used
> anywhere and could be removed (or add it here for consistency).

Good point. I've done this refactoring in my new version, adding pgd to the
_lockless() variant, since it's used by x86. Let's see what Lorenzo and co think
in the context of the next version (incomming shortly).

> 
> Either way, the patch looks fine.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>



