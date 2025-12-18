Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0002AD68BD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FCSRAqExLBbUyjy007V8BybPribrzobS8EinUYJz70=; b=gV0DqUT+knU0O6G3f3mZbWaqHo
	svwAwy3picnBekDutWDvPRFvJlziBRV4yrT0BUWOnMOsCOXM/WU5Gb6J0rS8iNMjNPuK8moAccq8j
	QDAi32W9XUh7fT7S50f566np6zPneBvtMvdgEk4+enJjQJzUcYVsGB7aG8ajkdxFtKDPjIzlRQqD3
	2kWb7Uq2cUyCFFyw4A4wpruQpuCUoLY5mN1VLMjmEAP++0bZ9HY2+leblKl1bbGmxfH4DtQwkg5Ya
	hxvX9lNRcdGi10v1yMguvF31Vqdqogi7qrrSvxbOgyNOi4y0n4GXmaPlhMz5UTsjWMNL3a4RtfKnV
	UIfvpGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9Ql-000000083v2-46cj;
	Thu, 18 Dec 2025 08:32:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9Qj-000000083uc-0YVX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:32:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6FA3FEC;
	Thu, 18 Dec 2025 00:32:03 -0800 (PST)
Received: from [10.57.91.22] (unknown [10.57.91.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44F303F5CA;
	Thu, 18 Dec 2025 00:32:08 -0800 (PST)
Message-ID: <d4dce109-8e02-488b-8ede-ef568f7262be@arm.com>
Date: Thu, 18 Dec 2025 08:32:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: mmu: avoid allocating pages while
 installing ng-mapping for KPTI
Content-Language: en-GB
To: Vlastimil Babka <vbabka@suse.cz>, Yeoreum Yun <yeoreum.yun@arm.com>,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 david@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 dev.jain@arm.com, yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20251217182007.2345700-1-yeoreum.yun@arm.com>
 <20251217182007.2345700-3-yeoreum.yun@arm.com>
 <731e3f48-e0a3-4c89-a13a-65ef37faa443@arm.com>
 <586d24f9-a54d-4c14-bd25-fed18423d709@suse.cz>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <586d24f9-a54d-4c14-bd25-fed18423d709@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_003213_284298_54F630E4 
X-CRM114-Status: GOOD (  14.41  )
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

On 18/12/2025 07:51, Vlastimil Babka wrote:
> On 12/17/25 20:03, Ryan Roberts wrote:
>> On 17/12/2025 18:20, Yeoreum Yun wrote:
>>> The current __kpti_install_ng_mappings() allocates a temporary PGD
>>> while installing the NG mapping for KPTI under stop_machine(),
>>> using GFP_ATOMIC.
>>>
>>> This is fine in the non-PREEMPT_RT case. However, it becomes a problem
>>> under PREEMPT_RT because generic memory allocation/free APIs
>>> (e.g., pgtable_alloc(), __get_free_pages(), etc.) cannot be invoked
>>> in a non-preemptible context, except for the *_nolock() variants.
>>> These generic allocators may sleep due to their use of spin_lock().
>>>
>>> In other words, calling __get_free_pages(), even with GFP_ATOMIC,
>>> is not allowed in __kpti_install_ng_mappings(), which is executed by
>>> the stopper thread where preemption is disabled under PREEMPT_RT.
>>>
>>> To address this, preallocate the page needed for the temporary PGD
>>> before invoking __kpti_install_ng_mappings() via stop_machine().
>>>
>>> Fixes: 47546a1912fc ("arm64: mm: install KPTI nG mappings with MMU enabled")
>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> ---
>>>  arch/arm64/mm/mmu.c | 22 +++++++++++++---------
>>>  1 file changed, 13 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index e4e6c7e0a016..69d9651de0cd 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -1360,7 +1360,7 @@ static phys_addr_t __init kpti_ng_pgd_alloc(enum pgtable_type type)
>>>  	return kpti_ng_temp_alloc;
>>>  }
>>>  
>>> -static int __init __kpti_install_ng_mappings(void *__unused)
>>> +static int __init __kpti_install_ng_mappings(void *data)
>>>  {
>>>  	typedef void (kpti_remap_fn)(int, int, phys_addr_t, unsigned long);
>>>  	extern kpti_remap_fn idmap_kpti_install_ng_mappings;
>>> @@ -1368,10 +1368,9 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>>>  
>>>  	int cpu = smp_processor_id();
>>>  	int levels = CONFIG_PGTABLE_LEVELS;
>>> -	int order = order_base_2(levels);
>>>  	u64 kpti_ng_temp_pgd_pa = 0;
>>>  	pgd_t *kpti_ng_temp_pgd;
>>> -	u64 alloc = 0;
>>> +	u64 alloc = *(u64 *)data;
>>>  
>>>  	if (levels == 5 && !pgtable_l5_enabled())
>>>  		levels = 4;
>>> @@ -1382,8 +1381,6 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>>>  
>>>  	if (!cpu) {
>>>  		int ret;
>>> -
>>> -		alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
>>>  		kpti_ng_temp_pgd = (pgd_t *)(alloc + (levels - 1) * PAGE_SIZE);
>>>  		kpti_ng_temp_alloc = kpti_ng_temp_pgd_pa = __pa(kpti_ng_temp_pgd);
>>>  
>>> @@ -1414,16 +1411,17 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>>>  	remap_fn(cpu, num_online_cpus(), kpti_ng_temp_pgd_pa, KPTI_NG_TEMP_VA);
>>>  	cpu_uninstall_idmap();
>>>  
>>> -	if (!cpu) {
>>> -		free_pages(alloc, order);
>>> +	if (!cpu)
>>>  		arm64_use_ng_mappings = true;
>>> -	}
>>>  
>>>  	return 0;
>>>  }
>>>  
>>>  void __init kpti_install_ng_mappings(void)
>>>  {
>>> +	int order = order_base_2(CONFIG_PGTABLE_LEVELS);
>>> +	u64 alloc;
>>> +
>>>  	/* Check whether KPTI is going to be used */
>>>  	if (!arm64_kernel_unmapped_at_el0())
>>>  		return;
>>> @@ -1436,8 +1434,14 @@ void __init kpti_install_ng_mappings(void)
>>>  	if (arm64_use_ng_mappings)
>>>  		return;
>>>  
>>> +	alloc = __get_free_pages(GFP_ATOMIC | __GFP_ZERO, order);
>>
>> I don't think this requires GFP_ATOMIC now?
> 
> Do you mean it's fine to use GFP_KERNEL now, or still not, and you mean that
> GFP_NOWAIT is sufficient?

I mean it's fine to use "GFP_KERNEL | __GFP_ZERO"; this context can sleep so we
don't want to dip into the reserves - we can sleep and reclaim if needed.

> 
>> With that removed:
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>
>>> +	if (!alloc)
>>> +		panic("Failed to alloc page tables\n");
>>> +
>>>  	init_idmap_kpti_bbml2_flag();
>>> -	stop_machine(__kpti_install_ng_mappings, NULL, cpu_online_mask);
>>> +	stop_machine(__kpti_install_ng_mappings, &alloc, cpu_online_mask);
>>> +
>>> +	free_pages(alloc, order);
>>>  }
>>>  
>>>  static pgprot_t __init kernel_exec_prot(void)
>>
> 


